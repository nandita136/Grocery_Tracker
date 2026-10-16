const DEFAULT_MEALS=[
{name:'Paneer Butter Masala',type:'Dinner',category:'Vegetarian',baseServings:2,cookingTime:'30 min',ingredients:[['Paneer',200,'g','Dairy'],['Tomato',150,'g','Vegetables'],['Butter',20,'g','Dairy'],['Onion',100,'g','Vegetables']]},
{name:'Masala Dosa',type:'Breakfast',category:'Vegetarian',baseServings:2,cookingTime:'25 min',ingredients:[['Rice',200,'g','Grains'],['Potato',250,'g','Vegetables'],['Onion',80,'g','Vegetables'],['Oil',20,'ml','Other']]},
{name:'Vegetable Pulao',type:'Lunch',category:'Vegetarian',baseServings:2,cookingTime:'35 min',ingredients:[['Basmati Rice',250,'g','Grains'],['Carrot',100,'g','Vegetables'],['Peas',80,'g','Vegetables'],['Onion',80,'g','Vegetables']]},
{name:'Dal Tadka',type:'Lunch',category:'Vegetarian',baseServings:2,cookingTime:'30 min',ingredients:[['Lentils',200,'g','Protein'],['Tomato',100,'g','Vegetables'],['Onion',80,'g','Vegetables'],['Butter',15,'g','Dairy']]},
{name:'Palak Paneer',type:'Dinner',category:'Vegetarian',baseServings:2,cookingTime:'35 min',ingredients:[['Paneer',200,'g','Dairy'],['Spinach',300,'g','Vegetables'],['Cream',40,'ml','Dairy'],['Onion',80,'g','Vegetables']]},
{name:'Aloo Paratha',type:'Breakfast',category:'Vegetarian',baseServings:2,cookingTime:'30 min',ingredients:[['Wheat Flour',250,'g','Grains'],['Potato',300,'g','Vegetables'],['Yogurt',100,'g','Dairy'],['Oil',25,'ml','Other']]},
{name:'Vegetable Sandwich',type:'Breakfast',category:'Vegetarian',baseServings:2,cookingTime:'15 min',ingredients:[['Bread',4,'slices','Grains'],['Tomato',80,'g','Vegetables'],['Cucumber',80,'g','Vegetables'],['Cheese',60,'g','Dairy']]},
{name:'Poha',type:'Breakfast',category:'Vegetarian',baseServings:2,cookingTime:'20 min',ingredients:[['Poha',200,'g','Grains'],['Onion',80,'g','Vegetables'],['Peanuts',40,'g','Protein'],['Lemon',1,'piece','Fruits']]},
{name:'Idli Sambar',type:'Breakfast',category:'Vegetarian',baseServings:2,cookingTime:'40 min',ingredients:[['Idli Rice',200,'g','Grains'],['Lentils',100,'g','Protein'],['Carrot',80,'g','Vegetables'],['Tomato',80,'g','Vegetables']]},
{name:'Chole',type:'Dinner',category:'Vegetarian',baseServings:2,cookingTime:'40 min',ingredients:[['Chickpeas',250,'g','Protein'],['Tomato',150,'g','Vegetables'],['Onion',100,'g','Vegetables'],['Spices',10,'g','Spices']]},
{name:'Rajma Rice',type:'Lunch',category:'Vegetarian',baseServings:2,cookingTime:'45 min',ingredients:[['Kidney Beans',220,'g','Protein'],['Basmati Rice',220,'g','Grains'],['Tomato',150,'g','Vegetables'],['Onion',100,'g','Vegetables']]},
{name:'Veg Biryani',type:'Dinner',category:'Vegetarian',baseServings:2,cookingTime:'50 min',ingredients:[['Basmati Rice',250,'g','Grains'],['Mixed Vegetables',200,'g','Vegetables'],['Yogurt',100,'g','Dairy'],['Spices',12,'g','Spices']]},
{name:'Fruit Salad',type:'Dessert',category:'Healthy',baseServings:2,cookingTime:'10 min',ingredients:[['Apple',1,'piece','Fruits'],['Banana',2,'piece','Fruits'],['Orange',1,'piece','Fruits']]},
{name:'Vegetable Soup',type:'Dinner',category:'Healthy',baseServings:2,cookingTime:'25 min',ingredients:[['Carrot',100,'g','Vegetables'],['Cabbage',100,'g','Vegetables'],['Tomato',100,'g','Vegetables'],['Stock',500,'ml','Other']]}
];
function getData(key){try{return JSON.parse((key==='groceryItems'?sessionStorage:localStorage).getItem(key))}catch{return null}}
function saveData(key,data){(key==='groceryItems'?sessionStorage:localStorage).setItem(key,JSON.stringify(data));return data}
function updateData(key,data){return saveData(key,data)}
function deleteData(key,id){const items=getData(key)||[];const filtered=items.filter(item=>item.id!==id);saveData(key,filtered);return filtered}
function generateId(items=[]){return items.reduce((max,item)=>Math.max(max,Number(item.id)||0),0)+1}
function calculateScaledQuantity(baseQty,baseServings,selectedPeople){return Math.round(Number(baseQty)*Number(selectedPeople)/Number(baseServings)*100)/100}
function initStorage(){
 if(!localStorage.getItem('users'))saveData('users',[{id:1,name:'Priyesha Chauhan',email:'priyesha@example.com',password:'123456',role:'user'},{id:2,name:'Aarav Mehta',email:'aarav@example.com',password:'123456',role:'user'},{id:3,name:'Meera Shah',email:'meera@example.com',password:'123456',role:'user'}]);
 if(!localStorage.getItem('meals'))saveData('meals',DEFAULT_MEALS.map((meal,index)=>({...meal,id:index+1,ingredients:meal.ingredients.map(([name,baseQty,unit,category])=>({name,baseQty,unit,category}))})));
 if(!localStorage.getItem('mealPlans'))saveData('mealPlans',[]);
 if(!sessionStorage.getItem('groceryItems')){
  const legacyItems=localStorage.getItem('groceryItems');
  const savedLists=getData('savedGroceryLists')||[];
  const restoredItems=savedLists.flatMap(list=>(list.items||[]).map(item=>({...item,ownerKey:list.ownerKey})));
  let temporaryItems=[];
  try{temporaryItems=JSON.parse(legacyItems)||[]}catch{}
  const savedOwners=new Set(savedLists.map(list=>list.ownerKey));
  sessionStorage.setItem('groceryItems',JSON.stringify([...restoredItems,...temporaryItems.filter(item=>!savedOwners.has(item.ownerKey||String(item.userId)))]));
  if(legacyItems)localStorage.removeItem('groceryItems');
 }
 const demoRequests=[
  {id:1,userId:1,userName:'Priyesha Chauhan',occasion:'Birthday Party',people:10,meals:['Paneer Butter Masala','Veg Biryani'],status:'Pending',rejectionReason:''},
  {id:2,userId:2,userName:'Aarav Mehta',occasion:'Family Gathering',people:6,meals:['Dal Tadka','Fruit Salad'],status:'Accepted',rejectionReason:''},
  {id:3,userId:3,userName:'Meera Shah',occasion:'Festival Celebration',people:8,meals:['Chole','Palak Paneer'],status:'Pending',rejectionReason:''},
  {id:4,userId:2,userName:'Aarav Mehta',occasion:'Office Lunch',people:15,meals:['Vegetable Pulao','Rajma Rice'],status:'Accepted',rejectionReason:''},
  {id:5,userId:1,userName:'Priyesha Chauhan',occasion:'Wedding Function',people:20,meals:['Veg Biryani','Paneer Butter Masala'],status:'Accepted',rejectionReason:''},
  {id:6,userId:3,userName:'Meera Shah',occasion:'Birthday Party',people:4,meals:['Masala Dosa','Fruit Salad'],status:'Rejected',rejectionReason:'The requested menu is unavailable for this date.'},
  {id:7,userId:2,userName:'Aarav Mehta',occasion:'Family Gathering',people:10,meals:['Vegetable Soup','Aloo Paratha'],status:'Rejected',rejectionReason:'Please choose from the currently available meal options.'}
 ];
 if(!localStorage.getItem('specialMealRequests'))saveData('specialMealRequests',demoRequests);
 else{
  const existingRequests=getData('specialMealRequests')||[];
  if(existingRequests.length===2&&existingRequests[0].userName==='Priyesha Chauhan'&&existingRequests[1].userName==='Aarav Mehta')saveData('specialMealRequests',demoRequests);
 }
 if(!localStorage.getItem('contactMessages'))saveData('contactMessages',[]);
}
initStorage();
