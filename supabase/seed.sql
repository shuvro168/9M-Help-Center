begin;

insert into public.categories(slug,icon,name_en,name_bn,sort_order,is_active)
values('popular','🔥','Popular Questions','জনপ্রিয় প্রশ্ন',0,true)
on conflict(slug) do update set icon=excluded.icon,name_en=excluded.name_en,name_bn=excluded.name_bn,sort_order=excluded.sort_order,is_active=true;

insert into public.categories(slug,icon,name_en,name_bn,sort_order,is_active)
values('deposit','💳','Deposit','ডিপোজিট',10,true)
on conflict(slug) do update set icon=excluded.icon,name_en=excluded.name_en,name_bn=excluded.name_bn,sort_order=excluded.sort_order,is_active=true;

insert into public.categories(slug,icon,name_en,name_bn,sort_order,is_active)
values('withdrawal','💰','Withdrawal','উইথড্র',20,true)
on conflict(slug) do update set icon=excluded.icon,name_en=excluded.name_en,name_bn=excluded.name_bn,sort_order=excluded.sort_order,is_active=true;

insert into public.categories(slug,icon,name_en,name_bn,sort_order,is_active)
values('bonus','🎁','Bonus & Turnover','বোনাস ও টার্নওভার',30,true)
on conflict(slug) do update set icon=excluded.icon,name_en=excluded.name_en,name_bn=excluded.name_bn,sort_order=excluded.sort_order,is_active=true;

insert into public.categories(slug,icon,name_en,name_bn,sort_order,is_active)
values('vip','👑','Account & VIP','অ্যাকাউন্ট ও VIP',40,true)
on conflict(slug) do update set icon=excluded.icon,name_en=excluded.name_en,name_bn=excluded.name_bn,sort_order=excluded.sort_order,is_active=true;

insert into public.categories(slug,icon,name_en,name_bn,sort_order,is_active)
values('agent','👥','Agent','এজেন্ট',50,true)
on conflict(slug) do update set icon=excluded.icon,name_en=excluded.name_en,name_bn=excluded.name_bn,sort_order=excluded.sort_order,is_active=true;

insert into public.categories(slug,icon,name_en,name_bn,sort_order,is_active)
values('activity','🎯','Activity Center','অ্যাক্টিভিটি সেন্টার',60,true)
on conflict(slug) do update set icon=excluded.icon,name_en=excluded.name_en,name_bn=excluded.name_bn,sort_order=excluded.sort_order,is_active=true;

insert into public.categories(slug,icon,name_en,name_bn,sort_order,is_active)
values('support','☎️','Support','সাপোর্ট',70,true)
on conflict(slug) do update set icon=excluded.icon,name_en=excluded.name_en,name_bn=excluded.name_bn,sort_order=excluded.sort_order,is_active=true;

insert into public.articles(category_id,title_en,title_bn,content_en,content_bn,keywords_en,keywords_bn,is_popular,status,sort_order)
select id,'How can I contact online support?','আমি কীভাবে অনলাইন সাপোর্টের সাথে যোগাযোগ করব?','Tap the Contact Support button. For faster assistance, prepare your registered phone number, game ID and a clear screenshot of the issue.','Contact Support বাটনে চাপ দিন। দ্রুত সহায়তার জন্য নিবন্ধিত ফোন নম্বর, গেম আইডি এবং সমস্যার পরিষ্কার স্ক্রিনশট প্রস্তুত রাখুন।','support,telegram,contact','সাপোর্ট,টেলিগ্রাম,যোগাযোগ',true,'published',1
from public.categories where slug='popular'
and not exists (select 1 from public.articles where title_en='How can I contact online support?');

insert into public.articles(category_id,title_en,title_bn,content_en,content_bn,keywords_en,keywords_bn,is_popular,status,sort_order)
select id,'Why has my deposit not arrived?','আমার ডিপোজিট কেন পৌঁছায়নি?','Check whether the payment was successful and whether the transaction number is correct. If it is still missing, contact support with the amount, payment time and screenshot.','পেমেন্ট সফল হয়েছে কি না এবং ট্রানজেকশন নম্বর সঠিক কি না দেখুন। না এলে পরিমাণ, সময় ও স্ক্রিনশটসহ সাপোর্টে যোগাযোগ করুন।','deposit missing,payment pending','ডিপোজিট আসেনি,পেমেন্ট পেন্ডিং',true,'published',2
from public.categories where slug='popular'
and not exists (select 1 from public.articles where title_en='Why has my deposit not arrived?');

insert into public.articles(category_id,title_en,title_bn,content_en,content_bn,keywords_en,keywords_bn,is_popular,status,sort_order)
select id,'Why is my withdrawal pending?','আমার উইথড্র কেন পেন্ডিং?','A withdrawal can remain pending while the account, turnover or payment information is under review. Avoid submitting repeated requests.','অ্যাকাউন্ট, টার্নওভার বা পেমেন্ট তথ্য যাচাই চললে উইথড্র পেন্ডিং থাকতে পারে। বারবার আবেদন করবেন না।','withdrawal pending,cashout','উইথড্র পেন্ডিং,টাকা তোলা',true,'published',3
from public.categories where slug='popular'
and not exists (select 1 from public.articles where title_en='Why is my withdrawal pending?');

insert into public.articles(category_id,title_en,title_bn,content_en,content_bn,keywords_en,keywords_bn,is_popular,status,sort_order)
select id,'What does 7x turnover mean?','7x টার্নওভার বলতে কী বোঝায়?','The valid betting amount must reach seven times the relevant reward amount before that reward can be withdrawn. Only valid bets defined by the platform count.','রিওয়ার্ড উত্তোলনের আগে বৈধ বেটিং পরিমাণ সংশ্লিষ্ট রিওয়ার্ডের ৭ গুণ হতে হবে। শুধুমাত্র বৈধ বেট গণনা হবে।','7x turnover,wagering','7x টার্নওভার,বেটিং',true,'published',4
from public.categories where slug='popular'
and not exists (select 1 from public.articles where title_en='What does 7x turnover mean?');

insert into public.articles(category_id,title_en,title_bn,content_en,content_bn,keywords_en,keywords_bn,is_popular,status,sort_order)
select id,'How do I make a deposit?','আমি কীভাবে ডিপোজিট করব?','Open Deposit, select a payment channel, enter the amount and follow the on-screen instructions. Confirm the receiver information before sending payment.','Deposit খুলুন, পেমেন্ট চ্যানেল নির্বাচন করুন, পরিমাণ লিখুন এবং নির্দেশনা অনুসরণ করুন। টাকা পাঠানোর আগে রিসিভার তথ্য নিশ্চিত করুন।','deposit,top up,bkash,nagad','ডিপোজিট,বিকাশ,নগদ',false,'published',10
from public.categories where slug='deposit'
and not exists (select 1 from public.articles where title_en='How do I make a deposit?');

insert into public.articles(category_id,title_en,title_bn,content_en,content_bn,keywords_en,keywords_bn,is_popular,status,sort_order)
select id,'Which payment methods are supported?','কোন পেমেন্ট পদ্ধতি সমর্থিত?','Available payment methods are shown on the Deposit page and may change with channel availability. Always use a currently displayed channel.','উপলব্ধ পেমেন্ট পদ্ধতি Deposit পেজে দেখানো হয় এবং চ্যানেল অনুযায়ী পরিবর্তিত হতে পারে। বর্তমানে প্রদর্শিত চ্যানেল ব্যবহার করুন।','payment methods,bkash,nagad','পেমেন্ট পদ্ধতি,বিকাশ,নগদ',false,'published',11
from public.categories where slug='deposit'
and not exists (select 1 from public.articles where title_en='Which payment methods are supported?');

insert into public.articles(category_id,title_en,title_bn,content_en,content_bn,keywords_en,keywords_bn,is_popular,status,sort_order)
select id,'What should I do if a deposit fails?','ডিপোজিট ব্যর্থ হলে কী করব?','Do not pay again using the same expired order. Return to the Deposit page, create a new order and use the latest receiver details.','একই মেয়াদোত্তীর্ণ অর্ডারে আবার টাকা পাঠাবেন না। Deposit পেজে ফিরে নতুন অর্ডার তৈরি করুন।','deposit failed,expired order','ডিপোজিট ব্যর্থ,অর্ডার মেয়াদ',false,'published',12
from public.categories where slug='deposit'
and not exists (select 1 from public.articles where title_en='What should I do if a deposit fails?');

insert into public.articles(category_id,title_en,title_bn,content_en,content_bn,keywords_en,keywords_bn,is_popular,status,sort_order)
select id,'What is the minimum deposit?','সর্বনিম্ন ডিপোজিট কত?','The minimum amount is displayed beside each payment channel. Enter an amount within the shown limits.','প্রতিটি পেমেন্ট চ্যানেলের পাশে সর্বনিম্ন পরিমাণ দেখানো থাকে। প্রদর্শিত সীমার মধ্যে পরিমাণ লিখুন।','minimum deposit,limit','সর্বনিম্ন ডিপোজিট,সীমা',false,'published',13
from public.categories where slug='deposit'
and not exists (select 1 from public.articles where title_en='What is the minimum deposit?');

insert into public.articles(category_id,title_en,title_bn,content_en,content_bn,keywords_en,keywords_bn,is_popular,status,sort_order)
select id,'How do I withdraw funds?','আমি কীভাবে টাকা উইথড্র করব?','Open Withdrawal, choose or add your payment account, enter the amount and confirm. Make sure the account name and number are accurate.','Withdrawal খুলুন, পেমেন্ট অ্যাকাউন্ট নির্বাচন বা যোগ করুন, পরিমাণ লিখে নিশ্চিত করুন। নাম ও নম্বর সঠিক রাখুন।','withdraw,cashout','উইথড্র,টাকা তোলা',false,'published',20
from public.categories where slug='withdrawal'
and not exists (select 1 from public.articles where title_en='How do I withdraw funds?');

insert into public.articles(category_id,title_en,title_bn,content_en,content_bn,keywords_en,keywords_bn,is_popular,status,sort_order)
select id,'Why was my withdrawal rejected?','আমার উইথড্র কেন বাতিল হয়েছে?','Common reasons include incorrect payment information, incomplete turnover, risk review or exceeding the current withdrawal limit.','ভুল পেমেন্ট তথ্য, অসম্পূর্ণ টার্নওভার, রিস্ক রিভিউ বা সীমা অতিক্রমের কারণে উইথড্র বাতিল হতে পারে।','withdrawal rejected,failed','উইথড্র বাতিল,ব্যর্থ',false,'published',21
from public.categories where slug='withdrawal'
and not exists (select 1 from public.articles where title_en='Why was my withdrawal rejected?');

insert into public.articles(category_id,title_en,title_bn,content_en,content_bn,keywords_en,keywords_bn,is_popular,status,sort_order)
select id,'How long does a withdrawal take?','উইথড্র হতে কত সময় লাগে?','Processing time depends on payment-channel traffic, account review and network conditions. Check the latest status in your withdrawal history.','পেমেন্ট চ্যানেলের চাপ, অ্যাকাউন্ট যাচাই ও নেটওয়ার্কের ওপর সময় নির্ভর করে। Withdrawal History-তে স্ট্যাটাস দেখুন।','withdrawal time,processing','উইথড্র সময়,প্রসেসিং',false,'published',22
from public.categories where slug='withdrawal'
and not exists (select 1 from public.articles where title_en='How long does a withdrawal take?');

insert into public.articles(category_id,title_en,title_bn,content_en,content_bn,keywords_en,keywords_bn,is_popular,status,sort_order)
select id,'Can I cancel a withdrawal?','আমি কি উইথড্র বাতিল করতে পারি?','A pending request may not always be cancellable. Check the withdrawal record for a cancellation option. Completed requests cannot be reversed.','পেন্ডিং আবেদন সবসময় বাতিল করা যায় না। রেকর্ডে Cancel অপশন আছে কি না দেখুন।','cancel withdrawal','উইথড্র বাতিল',false,'published',23
from public.categories where slug='withdrawal'
and not exists (select 1 from public.articles where title_en='Can I cancel a withdrawal?');

insert into public.articles(category_id,title_en,title_bn,content_en,content_bn,keywords_en,keywords_bn,is_popular,status,sort_order)
select id,'How is turnover calculated?','টার্নওভার কীভাবে হিসাব করা হয়?','Turnover is based on valid bets. Cancelled, refunded, abnormal or excluded bets may not count.','টার্নওভার বৈধ বেটের ওপর হিসাব হয়। বাতিল, রিফান্ড বা অস্বাভাবিক বেট গণনা নাও হতে পারে।','turnover,valid bets','টার্নওভার,বৈধ বেট',true,'published',30
from public.categories where slug='bonus'
and not exists (select 1 from public.articles where title_en='How is turnover calculated?');

insert into public.articles(category_id,title_en,title_bn,content_en,content_bn,keywords_en,keywords_bn,is_popular,status,sort_order)
select id,'Where are task rewards credited?','টাস্ক রিওয়ার্ড কোথায় যোগ হয়?','After the task is completed and verified, the reward is credited to the Cash Wallet or the wallet specified on the activity page.','টাস্ক সম্পন্ন ও যাচাই হওয়ার পর রিওয়ার্ড Cash Wallet অথবা নির্ধারিত ওয়ালেটে যোগ হয়।','task reward,cash wallet','টাস্ক রিওয়ার্ড,ক্যাশ ওয়ালেট',false,'published',31
from public.categories where slug='bonus'
and not exists (select 1 from public.articles where title_en='Where are task rewards credited?');

insert into public.articles(category_id,title_en,title_bn,content_en,content_bn,keywords_en,keywords_bn,is_popular,status,sort_order)
select id,'How does the Rescue Bonus work?','Rescue Bonus কীভাবে কাজ করে?','Eligible members may receive a limited-time rescue reward under the current promotion rules. Eligibility and claim time are shown on the event page.','যোগ্য সদস্যরা বর্তমান নিয়ম অনুযায়ী সীমিত সময়ের Rescue Bonus পেতে পারেন। যোগ্যতা ও দাবি সময় ইভেন্ট পেজে দেখানো হয়।','rescue bonus,cashback','রেসকিউ বোনাস,ক্যাশব্যাক',true,'published',32
from public.categories where slug='bonus'
and not exists (select 1 from public.articles where title_en='How does the Rescue Bonus work?');

insert into public.articles(category_id,title_en,title_bn,content_en,content_bn,keywords_en,keywords_bn,is_popular,status,sort_order)
select id,'Can bonus points be exchanged for cash?','Bonus Points কি ক্যাশে বদলানো যায়?','Where supported, bonus points can be exchanged according to the conversion and turnover rules displayed in the Bonus Points section.','যেখানে সমর্থিত, Bonus Points সেকশনে প্রদর্শিত রূপান্তর ও টার্নওভার নিয়ম অনুযায়ী ক্যাশে বদলানো যায়।','bonus points,cash exchange','বোনাস পয়েন্ট,ক্যাশ',false,'published',33
from public.categories where slug='bonus'
and not exists (select 1 from public.articles where title_en='Can bonus points be exchanged for cash?');

insert into public.articles(category_id,title_en,title_bn,content_en,content_bn,keywords_en,keywords_bn,is_popular,status,sort_order)
select id,'How do I upgrade my VIP level?','আমি কীভাবে VIP লেভেল আপগ্রেড করব?','VIP upgrades are usually based on required deposit and valid turnover progress. Open the VIP page to see your current level and remaining requirements.','VIP আপগ্রেড সাধারণত ডিপোজিট ও বৈধ টার্নওভার প্রগ্রেসের ওপর নির্ভর করে। VIP পেজে বর্তমান লেভেল ও বাকি শর্ত দেখুন।','vip upgrade,level','VIP আপগ্রেড,লেভেল',true,'published',40
from public.categories where slug='vip'
and not exists (select 1 from public.articles where title_en='How do I upgrade my VIP level?');

insert into public.articles(category_id,title_en,title_bn,content_en,content_bn,keywords_en,keywords_bn,is_popular,status,sort_order)
select id,'What benefits do VIP members receive?','VIP সদস্যরা কী সুবিধা পান?','Benefits may include level rewards, higher limits, exclusive promotions and priority support. Available benefits are listed under each VIP level.','লেভেল রিওয়ার্ড, উচ্চ সীমা, বিশেষ প্রমোশন ও অগ্রাধিকার সাপোর্ট থাকতে পারে।','vip benefits,rewards','VIP সুবিধা,রিওয়ার্ড',false,'published',41
from public.categories where slug='vip'
and not exists (select 1 from public.articles where title_en='What benefits do VIP members receive?');

insert into public.articles(category_id,title_en,title_bn,content_en,content_bn,keywords_en,keywords_bn,is_popular,status,sort_order)
select id,'I forgot my password. What should I do?','আমি পাসওয়ার্ড ভুলে গেছি। কী করব?','Use Forgot Password on the login page and complete verification with your registered phone or available security method.','Login পেজে Forgot Password ব্যবহার করুন এবং নিবন্ধিত ফোন বা উপলব্ধ নিরাপত্তা পদ্ধতিতে যাচাই করুন।','forgot password,account','পাসওয়ার্ড ভুলে গেছি,অ্যাকাউন্ট',false,'published',42
from public.categories where slug='vip'
and not exists (select 1 from public.articles where title_en='I forgot my password. What should I do?');

insert into public.articles(category_id,title_en,title_bn,content_en,content_bn,keywords_en,keywords_bn,is_popular,status,sort_order)
select id,'How can I become an agent?','আমি কীভাবে এজেন্ট হতে পারি?','Open the Agent section or contact the Agent Manager. You may need to register, obtain an invitation link and meet the platform requirements.','Agent সেকশন খুলুন অথবা Agent Manager-এর সাথে যোগাযোগ করুন। রেজিস্ট্রেশন ও প্ল্যাটফর্মের শর্ত পূরণ করতে হতে পারে।','agent,commission','এজেন্ট,কমিশন',false,'published',50
from public.categories where slug='agent'
and not exists (select 1 from public.articles where title_en='How can I become an agent?');

insert into public.articles(category_id,title_en,title_bn,content_en,content_bn,keywords_en,keywords_bn,is_popular,status,sort_order)
select id,'Where can I find my invitation link?','আমার ইনভাইটেশন লিংক কোথায় পাব?','Your personal invitation link is normally available on the Agent or Invite Friends page.','আপনার ব্যক্তিগত ইনভাইটেশন লিংক সাধারণত Agent বা Invite Friends পেজে থাকে।','invite link,referral','ইনভাইট লিংক,রেফারেল',false,'published',51
from public.categories where slug='agent'
and not exists (select 1 from public.articles where title_en='Where can I find my invitation link?');

insert into public.articles(category_id,title_en,title_bn,content_en,content_bn,keywords_en,keywords_bn,is_popular,status,sort_order)
select id,'How is agent commission calculated?','এজেন্ট কমিশন কীভাবে হিসাব হয়?','Commission is calculated under the current agent plan using valid team activity and eligible turnover.','বর্তমান এজেন্ট প্ল্যান অনুযায়ী বৈধ টিম অ্যাক্টিভিটি ও যোগ্য টার্নওভারের ভিত্তিতে কমিশন হিসাব হয়।','agent commission,team','এজেন্ট কমিশন,টিম',false,'published',52
from public.categories where slug='agent'
and not exists (select 1 from public.articles where title_en='How is agent commission calculated?');

insert into public.articles(category_id,title_en,title_bn,content_en,content_bn,keywords_en,keywords_bn,is_popular,status,sort_order)
select id,'How do daily tasks work?','Daily Tasks কীভাবে কাজ করে?','Complete each task according to the displayed conditions. Progress is recorded automatically and eligible rewards are credited under the activity rules.','প্রদর্শিত শর্ত অনুযায়ী টাস্ক সম্পন্ন করুন। প্রগ্রেস স্বয়ংক্রিয়ভাবে রেকর্ড হয় এবং রিওয়ার্ড নিয়ম অনুযায়ী যোগ হয়।','daily tasks,reward','ডেইলি টাস্ক,রিওয়ার্ড',false,'published',60
from public.categories where slug='activity'
and not exists (select 1 from public.articles where title_en='How do daily tasks work?');

insert into public.articles(category_id,title_en,title_bn,content_en,content_bn,keywords_en,keywords_bn,is_popular,status,sort_order)
select id,'How does the 7-day check-in work?','7 দিনের Check-in কীভাবে কাজ করে?','Log in and check in each day during the cycle. Complete all seven days to receive the full round of rewards, subject to event rules.','সাইকেল চলাকালে প্রতিদিন লগইন করে Check-in করুন। সাত দিন সম্পন্ন করলে পুরো রাউন্ডের রিওয়ার্ড পাবেন।','7 day check in,sign in','৭ দিনের চেক ইন,সাইন ইন',false,'published',61
from public.categories where slug='activity'
and not exists (select 1 from public.articles where title_en='How does the 7-day check-in work?');

insert into public.articles(category_id,title_en,title_bn,content_en,content_bn,keywords_en,keywords_bn,is_popular,status,sort_order)
select id,'Why is my task progress not updating?','আমার টাস্ক প্রগ্রেস আপডেট হচ্ছে না কেন?','Progress may update after settlement or system synchronization. Confirm that the task was completed within the valid time and under the correct account.','Settlement বা synchronization-এর পর প্রগ্রেস আপডেট হতে পারে। সঠিক সময় ও অ্যাকাউন্টে টাস্ক সম্পন্ন হয়েছে কি না দেখুন।','task progress,not updating','টাস্ক প্রগ্রেস,আপডেট',false,'published',62
from public.categories where slug='activity'
and not exists (select 1 from public.articles where title_en='Why is my task progress not updating?');

insert into public.articles(category_id,title_en,title_bn,content_en,content_bn,keywords_en,keywords_bn,is_popular,status,sort_order)
select id,'What information should I provide to support?','সাপোর্টকে কী তথ্য দিতে হবে?','Provide your game ID, registered phone number, issue description, time, amount and clear screenshots. Never send your password or verification code.','গেম আইডি, নিবন্ধিত ফোন নম্বর, সমস্যার বিবরণ, সময়, পরিমাণ ও স্ক্রিনশট দিন। পাসওয়ার্ড বা ভেরিফিকেশন কোড দেবেন না।','support information,game id','সাপোর্ট তথ্য,গেম আইডি',false,'published',70
from public.categories where slug='support'
and not exists (select 1 from public.articles where title_en='What information should I provide to support?');

insert into public.articles(category_id,title_en,title_bn,content_en,content_bn,keywords_en,keywords_bn,is_popular,status,sort_order)
select id,'What are support working hours?','সাপোর্টের কাজের সময় কী?','Use the Contact Support button to view current availability. Response times may be longer during payment peaks or major events.','বর্তমান সাপোর্ট উপলব্ধতা দেখতে Contact Support ব্যবহার করুন। ব্যস্ত সময়ে উত্তর পেতে বেশি সময় লাগতে পারে।','support hours','সাপোর্ট সময়',false,'published',71
from public.categories where slug='support'
and not exists (select 1 from public.articles where title_en='What are support working hours?');

insert into public.articles(category_id,title_en,title_bn,content_en,content_bn,keywords_en,keywords_bn,is_popular,status,sort_order)
select id,'How can I report a security issue?','নিরাপত্তা সমস্যা কীভাবে রিপোর্ট করব?','Contact support immediately, change your password and stop sharing account information. Include login time, device details and screenshots if available.','তাৎক্ষণিক সাপোর্টে যোগাযোগ করুন, পাসওয়ার্ড পরিবর্তন করুন এবং অ্যাকাউন্ট তথ্য শেয়ার বন্ধ করুন।','security issue,account safety','নিরাপত্তা সমস্যা,অ্যাকাউন্ট সুরক্ষা',false,'published',72
from public.categories where slug='support'
and not exists (select 1 from public.articles where title_en='How can I report a security issue?');

insert into public.announcements(title_en,title_bn,body_en,body_bn,level,is_active,sort_order)
select 'Welcome to 9M Help Center','9M Help Center-এ স্বাগতম','Find answers quickly or contact support when needed.','দ্রুত উত্তর খুঁজুন অথবা প্রয়োজনে সাপোর্টে যোগাযোগ করুন।','info',true,1
where not exists(select 1 from public.announcements);

insert into public.service_status(service_key,label_en,label_bn,state,note_en,note_bn,sort_order) values
('deposit','Deposit','ডিপোজিট','normal','','',10),
('withdrawal','Withdrawal','উইথড্র','normal','','',20),
('game','Game Service','গেম সার্ভিস','normal','','',30),
('login','Login','লগইন','normal','','',40)
on conflict(service_key) do nothing;

insert into public.support_channels(channel_key,label_en,label_bn,url,icon,is_active,sort_order) values
('telegram','Telegram Support','টেলিগ্রাম সাপোর্ট','https://t.me/VIP_9m068','✈️',true,10)
on conflict(channel_key) do update set url=excluded.url,label_en=excluded.label_en,label_bn=excluded.label_bn,is_active=true;

insert into public.site_settings(key,value) values
('general','{"default_language":"bn","site_name":"9M Help Center"}'::jsonb)
on conflict(key) do nothing;

commit;
