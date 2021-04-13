class PeriodicTableService
    
    Y6  = 6
    Y7  = 7
    Y9  = 9
    Y10 = 10
    X3  = 3
    COLUMNS_PER_ROW = 18

    def initialize(data)
        @elements_order = data['order']
        @elements       = data.except!('order')

        @head            = []
        @body            = {}
        @y6x3_expanded   = {}
        @y7x3_expanded   = {}
        @category_colors = {}
    end
    

    def call

        map_category_colors
        convert_list_to_matrix
        set_subgroup_labels
        fill_empty_columns_and_make_header
        sort_elements

        {
            'head'            => @head,
            'body'            => @body,
            'y6x3_expanded'   => @y6x3_expanded,
            'y7x3_expanded'   => @y7x3_expanded
        }

    end 
    
    private 

        def convert_list_to_matrix

            @elements_order.each do | el |
                element = @elements[el]
                values = { 
                    'data' => {
                        # public attributes
                        'number'      => element['number'],
                        'symbol'      => element['symbol'],
                        'name'        => element['name'],
                        'atomic_mass' => element['atomic_mass'].to_f.round(3),
                        'category'    => element['category'],
                        'color'       => @category_colors[element['category']]
                    }, 
                    'is_expanded' => false
                }
                ypos   = element['ypos']
                xpos   = element['xpos']
                if ypos == Y9
                    @y6x3_expanded[xpos] = values
                    next
                end
                if ypos == Y10
                    @y7x3_expanded[xpos] = values
                    next
                end
                @body[ypos] = {} unless @body.key? ypos
                @body[ypos][xpos] = values

            end
        end

        def set_subgroup_labels
            
            label_y6x3 = [@y6x3_expanded.first[1]['data']['number'].to_s, @y6x3_expanded.to_a.last[1]['data']['number'].to_s].join(' - ')
            label_y7x3 = [@y7x3_expanded.first[1]['data']['number'].to_s, @y7x3_expanded.to_a.last[1]['data']['number'].to_s].join(' - ')

            @body[Y6][X3] = { 'data' => nil, 'label' => label_y6x3, 'is_expanded' => true }
            @body[Y7][X3] = { 'data' => nil, 'label' => label_y7x3, 'is_expanded' => true }
        end

        def fill_empty_columns_and_make_header
            @body.each do | row, columns |
                current_column = 1
                while current_column < (COLUMNS_PER_ROW + 1)
                    # Create empty columns
                    unless @body[row].key? current_column
                        @body[row][current_column] = { 'data' => nil, 'is_expanded' => false }
                    end
                    # Create matrix header
                    @head[current_column] = current_column
                    current_column += 1
                end
            end
        end

        def sort_elements
            @body.each do |row, columns|
                @body[row] = columns.sort
            end
        end

        def map_category_colors
            categories = []
            colors     = default_colors

            @elements.each do | element, attributes |
                categories << attributes['category']
            end

            categories.uniq.each.with_index do | category, idx |
                @category_colors[category] = colors[idx]   if colors[idx].present?
                @category_colors[category] = 'transparent' if colors[idx].nil?
            end
        end

        def default_colors
            [
                '#06B6D4',
                '#10B981',
                '#5EEAD4',
                '#60A5FA',
                '#7DD3FC',
                '#86EFAC',
                '#A5B4FC',
                '#A78BFA',
                '#BEF264',
                '#CBD5E1',
                '#D8B4FE',
                '#EAB308',
                '#F472B6',
                '#FCA5A5',
                '#FCD34D',
                '#FDA4AF',
                '#FDBA74',
            ]
        end

end
