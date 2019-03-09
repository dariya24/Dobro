import config
import telebot
from telebot import types
from data import get_data
import datetime
from event import Event
from people import update
bot = telebot.TeleBot(config.token)

@bot.message_handler(commands=["start"])
def repeat_all_messages(message): # Название функции не играет никакой роли, в принципе

    print(type(message.chat.id))

    bot.send_message(message.chat.id, "Привіт! Давай робити добро разом. Щоб прийняти челендж напиши /take. Якщо ти вже виконав челендж напиши /end")


@bot.message_handler(commands=["take"])
def get_time(message): # Название функции не играет никакой роли, в принципе
    markup = types.ReplyKeyboardMarkup()
    markup.row('Менше пів - години', 'Годину-дві', 'Більше двох годин')
    bot.send_message(message.chat.id, "Скільки в тебе є часу?", reply_markup=markup)


@bot.message_handler(commands=["end"])
def get_time(message): # Название функции не играет никакой роли, в принципе
    bot.send_message(message.chat.id, "Вітаємо! Щоб більше людей дізналось про проект, розкажи їм про це в Фуйсбуці чи інстаграмі. Використовуй для цього хештег: . Якщо ж ти готовий прийняти ще один челендж. Напиши: /take")

@bot.message_handler(content_types=["text"])
def print_info(message):
    markup = types.ReplyKeyboardRemove()
    bot.send_message(message.chat.id, "Дай мені хвилинку, ми шукаємо щось саме для тебе....", reply_markup=markup)


    keyboard = types.InlineKeyboardMarkup()
    url_button = types.InlineKeyboardButton(text="Дізнатись більше про проект", url="https://www.facebook.com/studentsbrotherhoodUCU/")
    keyboard.add(url_button)

    message_opt = ''
    options = find_work(message)
    if not options:
        bot.send_message(message.chat.id, 'Упс, щось пішло не так... Спробуй через декілька хвилин, будь ласка!')
        bot.send_message(440533550, 'Табиця пуста...')
        return ValueError
    counter = 1

    for option in options:
        message_opt += '\n' + str(counter) + '. ' + option.toString()
        counter +=1



    bot.send_message(message.chat.id, message_opt)
    bot.send_message(message.chat.id, "Коли закінчиш челендж не забуть зробити замітку про це в соціальних мережах з хештегом. А також повідомити нам, написавши /end", reply_markup=keyboard)
    #update([message.chat.id, message.from_user.username, datetime.datetime, False])

def find_work(message):
    options = []
    #try:
    data = get_data()
    if data:
        for row in data:
            if row[0][0] == '-':
                event = Event(row)
                options.append(event)
            else:
                if row[0][0] != 'Д':
                    if message.text == 'Менше пів - години' and float(row[1].replace(',', '.')) <= 0.5:
                        print(row[1])
                        event = Event(row)
                        options.append(event)
                    elif message.text == 'Годину-дві'and float(row[1].replace(',', '.')) <= 2:
                        print(row[1])
                        event = Event(row)
                        options.append(event)
                    elif message.text == 'Більше двох годин':
                        print(row[1])
                        event = Event(row)
                        options.append(event)
    return options
    # except :
    #     print(ex)
    #     return False

if __name__ == '__main__':
    bot.polling(none_stop=True)


# time
# options
# send coord info
# save what option user had chosen