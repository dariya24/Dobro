class Event:
    def __init__(self, row):
        self.date = row[0]
        self.dur = row[1]
        self.name = row[2]
        self.work = row[3]
        self.place = row[4]
        self.time = row[5]



    def toString(self):
        message = ''
        if self.name != '-':
            message += '✅ Разом із ' + self.name
        message += '\n✅ Що? ' + self.work.capitalize()
        if self.date != '-':
            message += '.\n✅ Коли? \n '  + self.date + ' '
        if self.time != '-':
            message += self.time
        if self.place != '-':
            message += '\n✅ Де? \n' + self.place
        return  message