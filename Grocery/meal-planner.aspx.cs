using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Grocery
{
    public partial class meal_planner : System.Web.UI.Page
    {
        public class Ingredient
        {
            public string Name { get; set; }
            public double Quantity { get; set; }
            public string Unit { get; set; }
        }

        List<Ingredient> ingredients = new List<Ingredient>();

        private List<Ingredient> GetIngredients(string mealName)
        {
            List<Ingredient> mealIngredients = new List<Ingredient>();

            switch (mealName)
            {
                case "Paneer Butter Masala":
                    mealIngredients.Add(new Ingredient { Name = "Paneer", Quantity = 200, Unit = "g" });
                    mealIngredients.Add(new Ingredient { Name = "Tomato", Quantity = 150, Unit = "g" });
                    mealIngredients.Add(new Ingredient { Name = "Butter", Quantity = 20, Unit = "g" });
                    mealIngredients.Add(new Ingredient { Name = "Onion", Quantity = 100, Unit = "g" });
                    break;
                case "Masala Dosa":
                    mealIngredients.Add(new Ingredient { Name = "Rice", Quantity = 200, Unit = "g" });
                    mealIngredients.Add(new Ingredient { Name = "Potato", Quantity = 250, Unit = "g" });
                    mealIngredients.Add(new Ingredient { Name = "Onion", Quantity = 80, Unit = "g" });
                    mealIngredients.Add(new Ingredient { Name = "Oil", Quantity = 20, Unit = "ml" });
                    break;
                case "Vegetable Pulao":
                    mealIngredients.Add(new Ingredient { Name = "Basmati Rice", Quantity = 250, Unit = "g" });
                    mealIngredients.Add(new Ingredient { Name = "Carrot", Quantity = 100, Unit = "g" });
                    mealIngredients.Add(new Ingredient { Name = "Peas", Quantity = 80, Unit = "g" });
                    mealIngredients.Add(new Ingredient { Name = "Onion", Quantity = 80, Unit = "g" });
                    break;
                case "Dal Tadka":
                    mealIngredients.Add(new Ingredient { Name = "Lentils", Quantity = 200, Unit = "g" });
                    mealIngredients.Add(new Ingredient { Name = "Tomato", Quantity = 100, Unit = "g" });
                    mealIngredients.Add(new Ingredient { Name = "Onion", Quantity = 80, Unit = "g" });
                    mealIngredients.Add(new Ingredient { Name = "Butter", Quantity = 15, Unit = "g" });
                    break;
                case "Palak Paneer":
                    mealIngredients.Add(new Ingredient { Name = "Paneer", Quantity = 200, Unit = "g" });
                    mealIngredients.Add(new Ingredient { Name = "Spinach", Quantity = 300, Unit = "g" });
                    mealIngredients.Add(new Ingredient { Name = "Cream", Quantity = 40, Unit = "ml" });
                    mealIngredients.Add(new Ingredient { Name = "Onion", Quantity = 80, Unit = "g" });
                    break;
                case "Aloo Paratha":
                    mealIngredients.Add(new Ingredient { Name = "Wheat Flour", Quantity = 250, Unit = "g" });
                    mealIngredients.Add(new Ingredient { Name = "Potato", Quantity = 300, Unit = "g" });
                    mealIngredients.Add(new Ingredient { Name = "Yogurt", Quantity = 100, Unit = "g" });
                    mealIngredients.Add(new Ingredient { Name = "Oil", Quantity = 25, Unit = "ml" });
                    break;
                case "Vegetable Sandwich":
                    mealIngredients.Add(new Ingredient { Name = "Bread", Quantity = 4, Unit = "slices" });
                    mealIngredients.Add(new Ingredient { Name = "Tomato", Quantity = 80, Unit = "g" });
                    mealIngredients.Add(new Ingredient { Name = "Cucumber", Quantity = 80, Unit = "g" });
                    mealIngredients.Add(new Ingredient { Name = "Cheese", Quantity = 60, Unit = "g" });
                    break;
                case "Poha":
                    mealIngredients.Add(new Ingredient { Name = "Poha", Quantity = 200, Unit = "g" });
                    mealIngredients.Add(new Ingredient { Name = "Onion", Quantity = 80, Unit = "g" });
                    mealIngredients.Add(new Ingredient { Name = "Peanuts", Quantity = 40, Unit = "g" });
                    mealIngredients.Add(new Ingredient { Name = "Lemon", Quantity = 1, Unit = "piece" });
                    break;
                case "Idli Sambar":
                    mealIngredients.Add(new Ingredient { Name = "Idli Rice", Quantity = 200, Unit = "g" });
                    mealIngredients.Add(new Ingredient { Name = "Lentils", Quantity = 100, Unit = "g" });
                    mealIngredients.Add(new Ingredient { Name = "Carrot", Quantity = 80, Unit = "g" });
                    mealIngredients.Add(new Ingredient { Name = "Tomato", Quantity = 80, Unit = "g" });
                    break;
                case "Chole":
                    mealIngredients.Add(new Ingredient { Name = "Chickpeas", Quantity = 250, Unit = "g" });
                    mealIngredients.Add(new Ingredient { Name = "Tomato", Quantity = 150, Unit = "g" });
                    mealIngredients.Add(new Ingredient { Name = "Onion", Quantity = 100, Unit = "g" });
                    mealIngredients.Add(new Ingredient { Name = "Spices", Quantity = 10, Unit = "g" });
                    break;
                case "Rajma Rice":
                    mealIngredients.Add(new Ingredient { Name = "Kidney Beans", Quantity = 220, Unit = "g" });
                    mealIngredients.Add(new Ingredient { Name = "Basmati Rice", Quantity = 220, Unit = "g" });
                    mealIngredients.Add(new Ingredient { Name = "Tomato", Quantity = 150, Unit = "g" });
                    mealIngredients.Add(new Ingredient { Name = "Onion", Quantity = 100, Unit = "g" });
                    break;
                case "Veg Biryani":
                    mealIngredients.Add(new Ingredient { Name = "Basmati Rice", Quantity = 250, Unit = "g" });
                    mealIngredients.Add(new Ingredient { Name = "Mixed Vegetables", Quantity = 200, Unit = "g" });
                    mealIngredients.Add(new Ingredient { Name = "Yogurt", Quantity = 100, Unit = "g" });
                    mealIngredients.Add(new Ingredient { Name = "Spices", Quantity = 12, Unit = "g" });
                    break;
                case "Fruit Salad":
                    mealIngredients.Add(new Ingredient { Name = "Apple", Quantity = 1, Unit = "piece" });
                    mealIngredients.Add(new Ingredient { Name = "Banana", Quantity = 2, Unit = "piece" });
                    mealIngredients.Add(new Ingredient { Name = "Orange", Quantity = 1, Unit = "piece" });
                    break;
                case "Vegetable Soup":
                    mealIngredients.Add(new Ingredient { Name = "Carrot", Quantity = 100, Unit = "g" });
                    mealIngredients.Add(new Ingredient { Name = "Cabbage", Quantity = 100, Unit = "g" });
                    mealIngredients.Add(new Ingredient { Name = "Tomato", Quantity = 100, Unit = "g" });
                    mealIngredients.Add(new Ingredient { Name = "Stock", Quantity = 500, Unit = "ml" });
                    break;
            }

            return mealIngredients;
        }

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (!string.IsNullOrEmpty(DropDownList1.SelectedValue))
            {
                TextBox1.Text = DropDownList1.SelectedValue;
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            int people = 2;

            if (!string.IsNullOrEmpty(TextBox1.Text) && int.TryParse(TextBox1.Text, out int customPeople) && customPeople > 0)
            {
                people = customPeople;
            }
            else if (!string.IsNullOrEmpty(DropDownList1.SelectedValue) && int.TryParse(DropDownList1.SelectedValue, out int selectedPeople) && selectedPeople > 0)
            {
                people = selectedPeople;
            }

            var dayMealMap = new Dictionary<string, Dictionary<string, string>>
            {
                { "Monday", new Dictionary<string, string> { { "breakfast", ddlMondayBreakfast.SelectedValue }, { "lunch", ddlMondayLunch.SelectedValue }, { "dinner", ddlMondayDinner.SelectedValue } } },
                { "Tuesday", new Dictionary<string, string> { { "breakfast", ddlTuesdayBreakfast.SelectedValue }, { "lunch", ddlTuesdayLunch.SelectedValue }, { "dinner", ddlTuesdayDinner.SelectedValue } } },
                { "Wednesday", new Dictionary<string, string> { { "breakfast", ddlWednesdayBreakfast.SelectedValue }, { "lunch", ddlWednesdayLunch.SelectedValue }, { "dinner", ddlWednesdayDinner.SelectedValue } } },
                { "Thursday", new Dictionary<string, string> { { "breakfast", ddlThursdayBreakfast.SelectedValue }, { "lunch", ddlThursdayLunch.SelectedValue }, { "dinner", ddlThursdayDinner.SelectedValue } } },
                { "Friday", new Dictionary<string, string> { { "breakfast", ddlFridayBreakfast.SelectedValue }, { "lunch", ddlFridayLunch.SelectedValue }, { "dinner", ddlFridayDinner.SelectedValue } } },
                { "Saturday", new Dictionary<string, string> { { "breakfast", ddlSaturdayBreakfast.SelectedValue }, { "lunch", ddlSaturdayLunch.SelectedValue }, { "dinner", ddlSaturdayDinner.SelectedValue } } },
                { "Sunday", new Dictionary<string, string> { { "breakfast", ddlSundayBreakfast.SelectedValue }, { "lunch", ddlSundayLunch.SelectedValue }, { "dinner", ddlSundayDinner.SelectedValue } } }
            };

            var aggregatedIngredients = new Dictionary<string, Ingredient>();

            foreach (var dayPair in dayMealMap)
            {
                foreach (var mealTypePair in dayPair.Value)
                {
                    string mealName = mealTypePair.Value;
                    if (!string.IsNullOrEmpty(mealName))
                    {
                        List<Ingredient> raw = GetIngredients(mealName);
                        foreach (var ing in raw)
                        {
                            string key = ing.Name.ToLower();
                            double scaled = CalculateQuantity(ing.Quantity, 2, people);
                            if (aggregatedIngredients.ContainsKey(key))
                            {
                                aggregatedIngredients[key].Quantity += scaled;
                            }
                            else
                            {
                                aggregatedIngredients[key] = new Ingredient
                                {
                                    Name = ing.Name,
                                    Quantity = scaled,
                                    Unit = ing.Unit
                                };
                            }
                        }
                    }
                }
            }

            // Fallback to default if no meals selected
            if (aggregatedIngredients.Count == 0)
            {
                List<Ingredient> defaultIngredients = GetIngredients("Paneer Butter Masala");
                foreach (var ing in defaultIngredients)
                {
                    ing.Quantity = CalculateQuantity(ing.Quantity, 2, people);
                    aggregatedIngredients[ing.Name.ToLower()] = ing;
                }
            }

            Session["MealIngredients"] = aggregatedIngredients.Values.ToList();

            // Also synchronize with client-side localStorage mealPlans so dashboard and suggestions render full plan
            string daysJson = "{";
            bool firstDay = true;
            foreach (var day in dayMealMap)
            {
                if (!firstDay) daysJson += ",";
                firstDay = false;
                daysJson += string.Format("'{0}':{{'breakfast':'{1}','lunch':'{2}','dinner':'{3}'}}",
                    day.Key,
                    day.Value["breakfast"].Replace("'", "\\'"),
                    day.Value["lunch"].Replace("'", "\\'"),
                    day.Value["dinner"].Replace("'", "\\'"));
            }
            daysJson += "}";

            string syncScript = string.Format(@"
                var user = getCurrentUser();
                if (user) {{
                    var plans = getData('mealPlans') || [];
                    var existing = plans.find(function(p) {{ return p.userId === user.id; }});
                    var newPlan = {{
                        id: existing ? existing.id : generateId(plans),
                        userId: user.id,
                        week: new Date().toISOString().slice(0, 10),
                        servings: {0},
                        days: {1}
                    }};
                    if (existing) {{
                        Object.assign(existing, newPlan);
                    }} else {{
                        plans.push(newPlan);
                    }}
                    saveData('mealPlans', plans);
                }}
                window.location.href = 'grocery-suggestions.aspx';
            ", people, daysJson);

            ClientScript.RegisterStartupScript(this.GetType(), "saveMealPlanAndRedirect", syncScript, true);
        }

        private double CalculateQuantity(double baseQuantity, int basePeople, int selectedPeople)
        {
            return (baseQuantity * selectedPeople) / basePeople;
        }
    }
}