class localconfig::ordering {

    ## All these components should be installed before Grasshopper
    Class['::ghservice::apache']    -> Class['::grasshopper']
    Class['::ghservice::postgres']  -> Class['::grasshopper']
    Class['::ghservice::ui']        -> Class['::grasshopper']
}
