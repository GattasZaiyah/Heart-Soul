% Create workspace for wellness program
program.name = 'Mind-Body-Spirit Wellness Program';
program.category = 'Health and Wellness';
program.timeframe = 30;
program.instructors = {};
program.participants = {};

% Define course schedule
program.classes = {'Yoga','Pilates','Meditation','Tai-Chi','Qigong'};
program.duration = [60,45,45,60,60];
program.time = {'Monday 8am','Monday 7:30pm','Tuesday 7pm','Thursday 9am','Friday 6pm'};

% Create array to store course information
program.courses = cell(1,length(program.classes));
for i = 1:length(program.classes)
    program.courses{i} = struct('name',program.classes{i},...
        'duration',program.duration(i),'time',program.time{i});
end

% Define workshop schedule
program.workshops = {'Nutrition for Health','Stress Reduction'};
program.wduration = [90, 120];
program.wtime = {'Saturday 10am','Saturday 1pm'};

% Create array to store workshop information
program.wcourses = cell(1,length(program.workshops));
for i = 1:length(program.workshops)
    program.wcourses{i} = struct('name',program.workshops{i},...
        'duration',program.wduration(i),'time',program.wtime{i});
end

% Define program costs
program.ccost = 25;
program.wcost = 50;

%% Create registration form
fprintf('Welcome to the %s!\n',program.name);
name = input('Please enter your name: ','s');
phone = input('Please enter your phone number: ');
email = input('Please enter your email address: ','s');
classes = input('What classes are you interested in? ');
for i = 1:length(classes)
    for j = 1:length(program.classes)
        if strcmp(classes{i},program.classes{j})
            fprintf('You have chosen %s. It is a %d minute class offered on %s.\n',...
                program.classes{j},program.duration(j),program.time{j});
        end
    end
end
workshops = input('What workshops are you interested in? ');
for i = 1:length(workshops)
    for j = 1:length(program.workshops)
        if strcmp(workshops{i},program.workshops{j})
            fprintf('You have chosen %s. It is a %d minute workshop offered on %s.\n',...
                program.workshops{j},program.wduration(j),program.wtime{j});
        end
    end
end

fprintf('The cost of the classes is %d and the cost of the workshops is %d.\n',...
    program.ccost,program.wcost);
payment = input('Do you wish to pay now? ','s');
if strcmp(payment,'yes')
    fprintf('Thank you for your payment.\n');
else
    fprintf('You can pay at the door.\n');
end

%% Add participant to participant list
fprintf('You are now registered for the %s!\n',program.name);
program.participants{end+1} = struct('name',name,'phone',phone,'email',email,...
    'classes',classes,'workshops',workshops);

%% Contact instructors
for i = 1:length(program.instructors)
    instructor = program.instructors{i};
    message = sprintf('Hello %s! We have a new participant in the %s. Their name is %s and their phone number is %d.',...
        instructor.name,program.name,name,phone);
    sendmail(instructor.email,message);
end