public class Calculator {
    public String performAddition(double a, double b) {
        double answer = a + b;
        return String.valueOf(answer);
    }

    public String performSubtraction(double a, double b) {
        double answer = a - b;
        return String.valueOf(answer);
    }

    public String performMultiplication(double a, double b) {
        double answer = a * b;
        return String.valueOf(answer);
    }

    public String performDivision(double a, double b) {
        try {
            if (b == 0) {
                throw new DivisionCannotBePerformedException("Không thực hiện phép chia cho 0");
            }
            double answer = a / b;
            return String.valueOf(answer);
        } catch (DivisionCannotBePerformedException e) {
            return e.getMessage();
        } catch (Exception e) {
            return "Lỗi nhập dữ liệu";
        }
    }

    public String calculator(double a, double b, String operator) {
        String answer = null;
        switch (operator) {
            case "+":
                answer = performAddition(a, b);
                break;
            case "-":
                answer = performSubtraction(a, b);
                break;
            case "*":
                answer = performMultiplication(a, b);
                break;
            case "/":
                answer = performDivision(a, b);
                break;
        }
        return answer;
    }
}