/// The mode the applicaton is run in. 
/// Some widgets like network image need to responsed differently when we are testing.
/// Defaults to running, overridden in other scenarios like testing.
enum ApplicationMode {
  running,
  testing,
}