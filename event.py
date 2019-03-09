class Event:
    def __init__(self, row):
        self.date = row[0]
        self.dur = row[1]
        self.name = row[2]
        self.work = row[3]
        self.place = row[4]
        self.time = row[5]



    def toString(self):
        return 'Разом із ' + self.name + ' зроби добру справу ' + self.work + \
               '.\n Коли? \n '  + self.date + ' ' + self.time + '\n Де? \n' + self.place