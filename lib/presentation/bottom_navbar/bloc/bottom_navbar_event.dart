abstract class navbarEvent{}
class screenChange extends navbarEvent{
  int index;
  screenChange(this.index);
}