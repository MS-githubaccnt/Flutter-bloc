abstract class ConversionEvent{}
class changeInText extends ConversionEvent{
  String newText;
 changeInText(this.newText);
}