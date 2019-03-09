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
    for element in ['Менше пів - години', 'Годину-дві', 'Більше двох годин']:
        markup.row(element)
    bot.send_message(message.chat.id, "Скільки в тебе є часу?", reply_markup=markup)


@bot.message_handler(commands=["end"])
def get_time(message): # Название функции не играет никакой роли, в принципе
    bot.send_message(message.chat.id, "🎉Вітаємо🎉\n Щоб більше людей дізналось про проект, розкажи їм про це в Фуйсбуці чи інстаграмі позначаючи офіційні сторінки Братства та наш хештег #48добрихсправ. \n\nЯкщо ж ти готовий прийняти ще один челендж. Напиши: /take")

@bot.message_handler(content_types=["text"])
def print_info(message):
    if message.text == 'Менше пів - години' or message.text == 'Годину-дві' or message.text == 'Більше двох годин':
        markup = types.ReplyKeyboardRemove()
        bot.send_message(message.chat.id, "Дай мені хвилинку, ми шукаємо щось саме для тебе....", reply_markup=markup)

        options = find_work(message)
        if not options:
            bot.send_message(message.chat.id, 'Упс, щось пішло не так... Спробуй через декілька хвилин, будь ласка!')
            bot.send_message(440533550, 'Табиця пуста...')

        message_text = '';
        markup = types.ReplyKeyboardMarkup()
        c = 1
        for option in options:
            markup.row('Добра справа #' + str(c) +'\n' + option.work)
            message_text = message_text + option.toString() + '\n\n\n'

            c+=1;

        bot.send_message(message.chat.id, "Вибери щось з переліку нижче: "+'\n'+message_text, reply_markup=markup)
        markup = None

    elif message.text.startswith('Добра справа'):
        markup = types.ReplyKeyboardRemove()
        keyboard = types.InlineKeyboardMarkup()
        url_button = types.InlineKeyboardButton(text="Дізнатись більше про проект",
                                                url="https://www.facebook.com/studentsbrotherhoodUCU/")
        keyboard.add(url_button)
        bot.send_message(message.chat.id, "Коли закінчиш челендж не забуть повідомити нам, надіславши /end", reply_markup=markup)
        bot.send_message(message.chat.id,
                         "А також робити замітку про це в соціальних мережах з хештегом #48добрих справ.  😉",
                         reply_markup=keyboard)
    else:
        pass
        #чекнути чи це опція і якщо так то
        #записати в базу даних, яку опцію вибрала людина

def find_work(message):
    options = []
    #try:
    data = get_data()
    if data:
        for row in data:
            if row[0][0] != 'Д':
                if message.text == 'Менше пів - години' and float(row[1].replace(',', '.')) <= 0.5:
                    event = Event(row)
                    options.append(event)
                elif message.text == 'Годину-дві'and float(row[1].replace(',', '.')) < 2:
                    event = Event(row)
                    options.append(event)
                elif message.text == 'Більше двох годин':
                    event = Event(row)
                    options.append(event)

    for option in options:
        pass
        #якщо користувач вже є, то видалити

    print(options[:3])
    return options[:3]

if __name__ == '__main__':
    bot.polling(none_stop=True)


# time
# options
# send coord info
# save what option user had chosen