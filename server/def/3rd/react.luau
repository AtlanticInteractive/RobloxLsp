export type React.Binding = {
    getValue: (self: React.Binding) -> any,
    map: (self: React.Binding, mappingFunction: (value: any) -> any) -> React.Binding
}

export type React.Element = {
    component:
        string
        | React.Component
        | (props: table) -> React.Element,
    props: table,
    source: string?
}

export type React.Fragment = React.Element

export type React.Symbol = symbol

export type React.Ref = {
    [any]: any,
	current: any,
    getValue: (self: React.Ref) -> any
}

export type React.Children = {
	forEach: (children: {React.Element}?, forEachFunc: (child: React.Element?, index: number) -> (), forEachContext: any) -> (),
	map: (children: {React.Element}?, func: (child: React.Element?, index: number) -> {React.Element}?) -> {React.Element}?,
	count: (children: {React.Element}) -> number,
	only: (children: React.Element) -> React.Element,
	toArray: (children: {React.Element}) -> {React.Element},
}

export type React.Component = {
    [any]: any,
    extend: (self: React.Component, name: string) -> React.Component,
    defaultProps: table,
    props: table,
    state: table,
    init: (self: React.Component, initialProps: table) -> (),
    render: (self: React.Component) -> React.Element?,
    setState:
        ((self: React.Component, stateChange: table, callback: (() -> ())?) -> ())
        & ((self: React.Component, stateUpdater: (
                prevState: table,
                props: table
            ) -> table, callback: (() -> ())?) -> ()),
    -- shouldComponentUpdate: (self: React.Component, nextProps: table, nextState: table, nextContext: any) -> boolean,
    -- validateProps: (props: table) -> (boolean, string?),
    -- getElementTraceback: (self: React.Component) -> string?,
    -- didMount: (self: React.Component) -> (),
    -- willUnmount: (self: React.Component) -> (),
    -- willUpdate: (self: React.Component, nextProps: table, nextState: table) -> (),
    -- componentDidUpdate: (self: React.Component, previousProps: table, previousState: table, previousContext: any) -> (),
    -- getDerivedStateFromProps: (nextProps: table, lastState: table) -> table,

	forceUpdate: (self: React.Component, callback: (() -> ())?) -> (),
	componentWillMount: (self: React.Component) -> (),
	UNSAFE_componentWillMount: (self: React.Component) -> (),
	componentDidMount: (self: React.Component) -> (),
	componentWillReceiveProps: (self: React.Component, nextProps: table, nextContext: any) -> (),
	UNSAFE_componentWillReceiveProps: (
		self: React.Component,
		nextProps: table,
		nextContext: any
	) -> (),
	shouldComponentUpdate: (
		self: React.Component,
		nextProps: table,
		nextState: table,
		nextContext: any
	) -> boolean,
	componentWillUpdate: (
		self: React.Component,
		nextProps: table,
		nextState: table,
		nextContext: any
	) -> (),
	UNSAFE_componentWillUpdate: (
		self: React.Component,
		nextProps: table,
		nextState: table,
		nextContext: any
	) -> (),
	componentDidUpdate: (
		self: React.Component,
		prevProps: table,
		prevState: table,
		prevContext: any
	) -> (),
	componentWillUnmount: (self: React.Component) -> (),
	componentDidCatch: (
		self: React.Component,
		error: table,
		info: {
			componentStack: string,
		}
	) -> (),
	getDerivedStateFromProps: (props: table, state: table) -> table?,
	getDerivedStateFromError: (error: table) -> table?,
	getSnapshotBeforeUpdate: (props: table, state: table) -> any,
}

export type React.Context = {
	Provider: React.Component,
	Consumer: React.Component
}

export type React = {
    ---@special React.createElement
    createElement: (
        component:
            string
            | React.Component
            | (props: table) -> React.Element,
        props: table?,
        children: { [string | number]: React.Element }?
    ) -> React.Element,
    mount: (element: React.Element, parent: Instance?, key: string?) -> React.Tree,
    update: (tree: React.Tree, element: React.Element) -> React.Tree,
    unmount: (tree: React.Tree) -> (),
    oneChild: (children: { [string | number]: React.Element }?) -> React.Element?,
    createBinding: (initialValue: any) -> (React.Binding, (newValue: any) -> ()),
    joinBindings: (bindings: { [string | number]: React.Binding }) -> React.Binding,
    createRef: () -> React.Ref,
    forwardRef: (render: (props: table, ref: React.Ref) -> React.Element) -> React.Component,
    memo: (render: (props: table) -> React.Element, compare: ((oldProps: table, newProps: table) -> boolean)?) -> React.Component,
    lazy: (constructor: () -> table) -> React.Component,
    createContext: (defaultValue: any) -> React.Context,

	useCallback: (callback: (any) -> any, dependencies: {any}) -> (any) -> (any),
	useContext: (context: React.Context) -> any,
	useEffect: ((callback: () -> (), dependencies: {any}?) -> ()) & ((callback: () -> () -> (), dependencies: {any}?) -> ()),
	useImperativeHandle: (ref: React.Ref, createHandle: () -> any, dependencies: {any}?) -> (),
	useDebugValue: (value: any, formatter: ((value: any) -> string)?) -> (),
	useLayoutEffect: ((callback: () -> (), dependencies: {any}?) -> ()) & ((callback: () -> () -> (), dependencies: {any}?) -> ()),
	useMemo: (callback: () -> any, dependencies: {any}) -> any,
	useMutableSource: (source: any, getSnapshot: (source: any) -> any, subscribe: (source: any, callback: () -> ()) -> () -> (), dependencies: {any}) -> any,
	useReducer: (reducer: (state: any, action: any) -> any, initialState: any, initializer: ((initialState: any) -> any)?) -> (any, (action: any) -> ()),
	useRef: (initialValue: any) -> {current: any?},
	useState: (initialState: any) -> (any, (state: any) -> ()),
	useBinding: (initialValue: any) -> (React.Binding, (newValue: any) -> ()),

	Children: React.Children,

    ---@special React.Event
    Event: { [string]: React.Symbol },
    ---@special React.Change
    Change: { [string]: React.Symbol },

	Fragment: React.Symbol,
    Tag: React.Symbol,
    Profiler: React.Symbol,
    Suspense: React.Symbol,
    None: React.Symbol,

    Component: React.Component,
    PureComponent: React.Component,
    Portal: React.Component
}