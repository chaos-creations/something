/datum/fluff_email/rover

/datum/fluff_email/rover/uppmission
	title = "Operation Red Dawn"
	entry_text = {"<html>
					Well, surprisingly, our operation to find the lost Red Dawn ship was surprisingly successful.
					According to intelligence, we were able to find out that their ship was lost in an unknown sector of ########.
					We were tasked with finding this ship and finding out how it ended up here in strict secrecy.
					<br>
					<br>
					When we found it, we were a little shocked by the fact that it was mostly undamaged and had not yet drifted into any of the nearby planets.
					With the help of spacesuits, we were able to get inside, and to be honest, it was the strangest thing in my entire life.
					<br>
					<br>
					Everyone on the ship was dead, not a single living soul.
					The corridors were littered with just corpses or what was left of them, it was just a real bloodbath.
					We couldn't even really find out what happened to them,
					because there was absolutely nothing in the system logs or personal journals, ABSOLUTELY NOTHING.
					We think that this is possibly some kind of space disease?
					I don't know, I want to think it was an illness, because no normal person would do something like that to their fellow soldiers.
				</html>
				"}

/datum/fluff_email/rover/komana
	title = "Operation Red Dawn"
	entry_text = {"<html>
					DATA IS CORRUPTED.
					PLEASE CONTACT YOUR SYSTEM ADMINISTRATOR.
				</html>
				"}

/datum/fluff_email/nomad/mission1
    title = "Contract: 40"
    entry_text = {"<html>
    <head>
    <style>
        body { font-family:'Courier New', monospace; background:#000; color:#00ff99; font-size:12px; padding:10px; }
        .card { background:#010d09; border:1px solid #033; border-radius:4px; padding:10px; box-shadow:0 0 8px #033 inset; }
        h1 { color:#00ffaa; font-size:14px; text-shadow:0 0 5px #0f8; margin:0 0 6px 0; }
        .meta { font-size:10px; color:#0f6; margin-bottom:6px; }
        .section { margin-top:6px; border-top:1px dashed #066; padding-top:6px; }
        .code { color:#fff; background:#022; padding:4px; border-radius:3px; display:inline-block; }
        .warning { color:#ff6666; font-weight:600; margin-top:8px; }
        .footer { font-size:10px; color:#0f6; margin-top:10px; text-align:center; opacity:0.9; }
    </style>
    </head>
    <body>
    <div class='card'>
        <h1>CONTRACT #40</h1>
        <div class='meta'>ROUTE: ENCRYPTED 44.9.2 · NODE: 9X·HOLLOW</div>

        <div class='section'>
            <b>OBJECTIVE:</b><br>
            Необходимо размести маяки в определённых местах колонии, всего доступно локаций для размещений - 3 <br>
            Выплаты: за каждый активированный маяк в правильном месте - 1LC(QM). Вы можете покинуть зону операции в любой момент, но оплата будет только за размещённые маяки.
        </div>

        <div class='section'>
            <b>NOTES:</b><br>
            <i>Замечена активность в местном военном аванпосте, возможное сильное сопротивление при попытке проникновения<br>
            В ближайших гражданских зонах замечена активность Диких.</i>
        </div>

        <div class='section warning'>
            ⚠ Если маяк не соответствует своей зоне, то вы не получаете за него награду.
        </div>

        <div class='footer'>TRANSMISSION ENDS · SIGNAL LOST...</div>
    </div>
    </body>
    </html>
    "}

/datum/fluff_email/nomad/mission2
	title = "Contract: ???"
	entry_text = {"<html>
					DATA IS CORRUPTED.
					PLEASE CONTACT YOUR SYSTEM ADMINISTRATOR.
				</html>
				"}

/datum/fluff_email/nomad/mission3
	title = "Contract: ???"
	entry_text = {"<html>
					DATA IS CORRUPTED.
					PLEASE CONTACT YOUR SYSTEM ADMINISTRATOR.
				</html>
				"}

/datum/fluff_email/nomad/freelancers
	title = "Freelancer Manifest"
	entry_text = {"
	<html>
		<head>
			<style>
				.mailbox {
					max-height: 350px;
					overflow-y: auto;
					word-wrap: break-word;
					overflow-wrap: break-word;
					font-family: Verdana, sans-serif;
					font-size: 11px;
				}
				table {
					width: 100%;
					border-collapse: collapse;
					table-layout: fixed;
				}
				th, td {
					border: 1px solid #444;
					padding: 3px;
					text-align: left;
					font-size: 11px;
				}
				.active { color: green; font-weight: bold; }
				.inactive { color: red; font-weight: bold; }
			</style>
		</head>
		<body>
			<center><b>✦ FREELANCER MANIFEST ✦</b></center>
			<p><small>ENCRYPTED PAYLOAD — DECRYPTION LEVEL: PARTIAL</small></p>
			<p><em>Integrity Hash: SHA1 · 3f:ab:9c:... (truncated)</em></p>
			<div class='mailbox'>
				<table>
					<tr><th>Name</th><th>Role</th><th>Status</th></tr>
					<tr><td>Jebediah 'MAD' Logstreet</td><td>Warlord</td><td class='active'>ACTIVE</td></tr>
					<tr><td>Klein 'Rat' Moretti</td><td>Enforcer</td><td class='active'>ACTIVE</td></tr>
				</table>
			</div>
			<hr>
			<i><small>// Note: Some entries may be corrupted or redacted.</small></i>
		</body>
	</html>
	"}

/obj/item/paper/nomad/dnevnik
	name = "Day Report N104"
	info = {"
<center>

<large><b>День сто чётвёртый, личная запись#104
</b></large></center>
<hr>
Сегодня мы с отрядом смогли добраться до одного из складов с продовольствием, который ещё не успели разграбить <u>Дикие</u>, это хороший знак, ибо в последнии дни нам совсем не везло с провизией и большая часть людей голодала.
<br>
Майор даже поделился с нами своим секретным запасом алкоголя, который он прятал на хороший случай, и я должен признать, что это был хороший ход с его стороны, ибо мораль у людей сразу же поднялась.
<br>
Но не всё так радужно, некоторые все ещё не могут оправиться от смертей своих товарщей из-за голодания и стресса, и я боюсь, что если мы не найдём способ выбраться отсюда в ближайшее время, то у нас будут большие проблемы.
<br>
Надеюсь, бог нас услышит и пошёл нам спасение.
<hr>
<center><i><small>Если со мной что-то случится, то завещаю своего Commando Huggs'а нашему майору, может это поможет ему.</small></i></center>
	"}

/obj/item/tape/nomad/one
	name = "Dusty Tape"
	desc = "Some old recordings"
	flipped_name = "Dusty Tape"
	storedinfo = list("Unknown Voice says - \"Когда-то мы были морпехами, служили на US-crrrt Su-tzz-z\" ",
		"Unknown Voice  says - \"--zz-err и потом они просто закрыли эту программу, якобы не оправдывает их ожидания.\" ",
		"Unknown Voice says - \"А людей они просто оставили тут вариться, просто потому что не хотят придать огласке всё это.\" ",
		"Unknown Voice says - \"...--tzz-ee они поплатятся все если я смогу вынести документацию обо всём за границу, но...\" ",
		"Unknown Voice says - \"...Не знаю, не думаю что это когда-либо случится, слишком уж они --errr\" ",
		"Unknown Voice says - \"А ты что думаешь, Морроу?\" ",
		"Unknown Voice says - \"...как и всегда...\" ")
	timestamp = list(30, 80, 170, 220, 300, 370, 450)
	unflipped_name = "Dusty Tape"
	storedinfo_otherside = list("Unknown Voice says - \"Когда-то мы были морпехами, служили на US-crrrt Su-tzz-z\" ",
		"Unknown Voice  says - \"--zz-err и потом они просто закрыли эту программу, якобы не оправдывает их ожидания.\" ",
		"Unknown Voice says - \"А людей они просто оставили тут вариться, просто потому что не хотят придать огласке всё это.\" ",
		"Unknown Voice says - \"...--tzz-ee они поплатятся все если я смогу вынести документацию обо всём за границу, но...\" ",
		"Unknown Voice says - \"...Не знаю, не думаю что это когда-либо случится, слишком уж они --errr\" ",
		"Unknown Voice says - \"А ты что думаешь, Морроу?\" ",
		"Unknown Voice says - \"...как и всегда...\" ")
	timestamp_otherside = list(30, 80, 170, 220, 300, 370, 450)

/obj/item/tape/nomad/two
	name = "Dusty Tape #2"
	desc = "Some old recordings"
	flipped_name = "Dusty Tape #2"
	storedinfo = list(
		"Unknown Voice says - \"Сего--zz-ня мы должны отпра--zzz--ться на одну из забр--крр--шенных колоний, кот--тzz--рая когд--zz--та была на хорошем счё--чч--ту у Вейланд-Ютани.\" ",
		"Unknown Voice says - \"Бра--ррр--ун говорит, что там до--zzz--вольно хорошая наж--ж--ива, хоть и оп--шш--ная.\" ",
		"Other Unknown Voice says - \"Да тут всё опа--крр--сное!\" ",
		"Unknown Voice says - \"Да зат--zzz--кнись ты, это мой аудио-д--жж--вник. Собс--шш--твен--zzz--но...\" ",
		"Unknown Voice says - \"...Бо--крр--юсь я немного, хоть и хо--zzz--тся добы--шш--ть это бо--крр--гатство.\" ",
		"Unknown Voice says - \"Бла--жж--го, нас повед--zzz--т Морроу, я ем--м--у дове--крр--ряю, с ним у нас всё до--zzz--вольно хоро--шш--о вы--zzz--ходит.\" ",
		"Unknown Voice says - \"На--крр--деюсь у--zzz--дача нам и с--шш--годня у--zzz--лыбнётся...\" "
	)
	timestamp = list(30, 80, 170, 220, 300, 370, 450)
	unflipped_name = "Dusty Tape #2"
	storedinfo_otherside = list(
		"Unknown Voice says - \"Сего--zz-ня мы должны отпра--zzz--ться на одну из забр--крр--шенных колоний, кот--тzz--рая когд--zz--та была на хорошем счё--чч--ту у Вейланд-Ютани.\" ",
		"Unknown Voice says - \"Бра--ррр--ун говорит, что там до--zzz--вольно хорошая наж--ж--ива, хоть и оп--шш--ная.\" ",
		"Other Unknown Voice says - \"Да тут всё опа--крр--сное!\" ",
		"Unknown Voice says - \"Да зат--zzz--кнись ты, это мой аудио-д--жж--вник. Собс--шш--твен--zzz--но...\" ",
		"Unknown Voice says - \"...Бо--крр--юсь я немного, хоть и хо--zzz--тся добы--шш--ть это бо--крр--гатство.\" ",
		"Unknown Voice says - \"Бла--жж--го, нас повед--zzz--т Морроу, я ем--м--у дове--крр--ряю, с ним у нас всё до--zzz--вольно хоро--шш--о вы--zzz--ходит.\" ",
		"Unknown Voice says - \"На--крр--деюсь у--zzz--дача нам и с--шш--годня у--zzz--лыбнётся...\" "
	)
	timestamp_otherside = list(30, 80, 170, 220, 300, 370, 450)
