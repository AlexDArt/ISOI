module SideBarHelper
  def side_bar_items(ru)
    result = []
    result << {
      :name => 'Начальная страница',
      :icon => 'home',
      :controller => :welcome, 
      :action => :index
    }
    if is_admin?
      result << {
        :name => 'Управление пользователями',
        :icon => 'pencil',
        :children => [
        {:name => 'Пользователи',
         :controller => :users, :action => :index,
         :icon => 'arrow-right',
         :class => 'long'},
        {:name => 'Добавление',
         :controller => :users, :action => :new,
         :icon => 'arrow-right'},
        {:name => 'Роли',
         :controller => :roles, :action => :index,
         :icon => 'arrow-right',
         :class => 'long'},
      ]}
      result
    end
    result << {
      :name => 'Объекты',
      :icon => 'list',
      :children => [
      {:name => 'Дома',
       :icon => 'arrow-right',
       :controller => :houses, :action => :index,
       :class => 'long'},
      {:name => 'Социальные объекты',
       :icon => 'arrow-right',
       :controller => :social_objects, :action => :index,
       :class => 'long'},
      {:name => 'Управляющие компании',
       :icon => 'arrow-right',
       :controller => :managment_companies, :action => :index,
       :class => 'long'},
      {:name => 'Водозаборы',
       :icon => 'arrow-right',
       :controller => :water_intake_units, :action => :index,
       :class => 'long'},
      {:name => 'Котельные',
       :icon => 'arrow-right',
       :controller => :boiler_houses, :action => :index,
       :class => 'long'},
      {:name => 'Электрические подстанции',
       :icon => 'arrow-right',
       :controller => :transformer_substations, :action => :index,
       :class => 'long'},
      {:name => 'Торговые центры',
       :icon => 'arrow-right',
       :controller => :shopping_centers, :action => :index,
       :class => 'long'},
    ]}
    result
    result << {
      :name => 'Поиск',
      :icon => 'search',
      :children => [
      {:name => 'Дома',
       :icon => 'arrow-right',
       :controller => :houses, :action => :search,
       :class => 'long'},
      {:name => 'Социальные объекты',
       :icon => 'arrow-right',
       :controller => :social_objects, :action => :search,
       :class => 'long'},
      {:name => 'Управляющие компании',
       :icon => 'arrow-right',
       :controller => :managment_companies, :action => :search,
       :class => 'long'},
      {:name => 'Водозаборы',
       :icon => 'arrow-right',
       :controller => :water_intake_units, :action => :search,
       :class => 'long'},
      {:name => 'Котельные',
       :icon => 'arrow-right',
       :controller => :boiler_houses, :action => :search,
       :class => 'long'},
      {:name => 'Электрические подстанции',
       :icon => 'arrow-right',
       :controller => :transformer_substations, :action => :search,
       :class => 'long'},
      {:name => 'Торговые центры',
       :icon => 'arrow-right',
       :controller => :shopping_centers, :action => :search,
       :class => 'long'},
    ]}
    result
  end
  
  def is_open?(ctr, act)
    case ctr.to_s
    when 'users', 'roles', 'houses', 'managment_companies', 'social_objects', 'water_intake_units', 'boiler_houses', 'transformer_substations', 'shopping_centers'
      ctr.to_s == controller_name.to_s  
    else
      false
    end
  end
end
