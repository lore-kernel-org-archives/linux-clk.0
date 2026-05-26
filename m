Received: from smtp.forwardemail.net (smtp.forwardemail.net [149.28.215.223])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80FA23C1F5E
	for <linux-clk@vger.kernel.org>; Tue, 26 May 2026 21:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=149.28.215.223
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779830642; cv=none; b=YwHDA2PTR3VNM6xfciBGqYr+HE7qYvI1KbTk48WgWHq9b9Bkdg3pA2nFRulg0S9QJjiDgm5yT9tJVe2BY41ucZxZWJA1VsTc7opCdVTWUjFcdkVblBwUarCVmZrGIqfSC8dgk0jGlwpMl+325kRzIj4Gp1X6wHKYJ92v/grBsL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779830642; c=relaxed/simple;
	bh=5XCm0mxhUO1U1pNKN+c43ad7JSKnMj/75FUb3dLm4OI=;
	h=Mime-Version:Content-Type:Date:Message-Id:From:To:Cc:Subject:
	 References:In-Reply-To; b=BHsjFZFpcJZSmhWIMWGiXJ2ORb/mA5q8YFgSsxZFxjbQdlNR1r4upTjGZlItkqg6ghjLQ2jF3dHpIX75BsaAUeSEPk1p8nkN+LZaSkgR1T1bznd64Dbvc7AlYJf6F1aeqlxPfj3CfCtzyhZlg1R4ddaFzonDwkQrEhYwDrVYJHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com; dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b=TaG+Azgd; arc=none smtp.client-ip=149.28.215.223
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ubuntu.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=fe-bounces.ubuntu.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ubuntu.com header.i=@ubuntu.com header.b="TaG+Azgd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ubuntu.com;
 h=In-Reply-To: References: Subject: Cc: To: From: Message-Id: Date:
 Content-Type: Content-Transfer-Encoding: Mime-Version; q=dns/txt;
 s=fe-953a8a3ca9; t=1779830639;
 bh=TLiaAaePJ0nS2kNrU35GiokBmFClWrieiPd16SmJ37s=;
 b=TaG+Azgd/rNjntfmKLGf/ltywOvCHq22V84x6ouAtvOOy6iis7NKx2JO6TuBpHf1QGlh21pEm
 FBACGK/T6Q5wDLzmdLDxGTm0A0+1wfg/Ypt4RrITaq5cY9p9IoPHuimY6MY1vLzbLolS9+KX/e6
 vO573FpXf7bEcZ/cqoF+SkGnZ9DMSqLCv9Yh6yn4Bhv+O41Imz1fK37lkPkOoyY7i0YtYSh8UHt
 +b6WbciIvUUbGrOKvivj5ZyhuLlvuSup+1azoBajdM6tblj2fQxjYx22suRBibizMkGjFdAibky
 xZFDM1jBp5KseUGtqQa8dxIRleXQyOQI06eirQOYriwg==
X-Forward-Email-ID: 6a160cf098bf2b93c43882df
X-Forward-Email-Sender: rfc822; jpeisach@ubuntu.com, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.8.15
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8; format=Flowed
Date: Tue, 26 May 2026 17:13:19 -0400
Message-Id: <DISX2U1QNLUH.31OXTXE7F1C6X@ubuntu.com>
From: "Joshua Peisach" <jpeisach@ubuntu.com>
To: "John Stultz" <jstultz@google.com>, "Joshua Peisach"
 <jpeisach@ubuntu.com>
Cc: <linux-kernel@vger.kernel.org>, "Thomas Gleixner" <tglx@kernel.org>,
 "Stephen Boyd" <sboyd@kernel.org>, <linux-clk@vger.kernel.org>
Subject: Re: [RFC] Timekeeping for other planets
X-Mailer: aerc 0.21.0
References: <DISNUOIOA8JK.2K904WSZH2X9T@ubuntu.com>
 <CANDhNCq8W0tY4EMWo5987+CP_LJJ8f1FQrn8zGQvmLc0hTFCiA@mail.gmail.com>
In-Reply-To: <CANDhNCq8W0tY4EMWo5987+CP_LJJ8f1FQrn8zGQvmLc0hTFCiA@mail.gmail.com>

On Tue May 26, 2026 at 4:14 PM EDT, John Stultz wrote:
> On Tue, May 26, 2026 at 6:59=E2=80=AFAM Joshua Peisach <jpeisach@ubuntu.c=
om> wrote:
>>
>> For a while I've thought about timekeeping on other planets. If humans
>> ever make it to other planets, there will likely be other systems for
>> keeping track of time, because the length of a day is not the same
>> across all planets. Mars, for example, has a longer day than Earth.
>> There are some proposed systems for timekeeping on Mars, the most
>> interesting one being the Darian calendar system[1], but there are
>> things like "Mars Sol Date" and Coordinated Mars Time (MTC).
>>
>> So my internal, curious and enthusiastic personality lead me to try
>> making a C library that would try to handle time and date conversions
>> for other planets. But it actually gets quite difficult and confusing,
>> because (to save you the time and story) there ends up being "so what is
>> an Earth second and what is a Mars second"?
>>
>> Now that I've made some kernel contributions (I still consider myself a
>> newbie), I think about how there may actually be good reasons for trying
>> to handle non-Earth times in the kernel, compared to the silly people
>> like me having their timekeeping systems in userspace. For example,
>> things like log timestamps. A machine that is running Linux on another
>> planet (I know, it's ambitious, but humor me), will report events in
>> terms of seconds. But, that's in terms of Earth seconds. For humans, it
>> would make sense to use a time system that applies to Mars for its own
>> calendars. So if someone is reading the logs and they see "one million
>> seconds", how would they know exactly when the message occurred? One
>> million Earth seconds does not equate to one million Mars seconds.
>>
>> (I try not to think about the "how long is a second" thing..)
>>
>> My point is, if humans adopt timekeeping systems for other planets,
>> there may (or may not?) be a good reason for the kernel to keep track
>> of time outside of Earth.
>>
>> Now, I am being ambitious, very optimistic, and potentially delusional
>> for thinking that people would want to use other timekeeping systems in
>> other planets, and still have Linux be around in the far future, and
>> choose to have timekeeping in the kernel instead of in userspace. But,
>> I know I'm not the only person interested in this topic. There is NASA's
>> Mars24 Sunclock[2] which does track time in terms of hours, minutes and
>> seconds, but at the rate that it does on Mars.
>>
>> So, the problem: There is currently no way to handle or provide
>> timekeeping on other planets, aside from conversions. But maybe that
>> should only stay in userspace. The users affected: well, as of writing,
>> astronomers and space enthusiasts, looking to track events and time
>> using other planetary timekeeping systems and calendars.
>>
>> I admittedly don't know much about timekeeping in the kernel, but there
>> are functions for atomic time, which could actually get some use!
>
> Appreciate your interest!  When adding functionality to the kernel, we
> do have to ask what is the benefit gained from moving logic into the
> kernel if it could otherwise be done from userland.  Logic we add to
> the kernel that has uABI visibility requires indefinite maintenance,
> potentially introduces bugs, etc. So there has to be a clear benefit
> to do so.
>

I understand. Maybe I could try to do some benchmarking to determine if
the time it takes to query the time is sufficient.

> For the most part, timezone handling is already dealt with in
> userland, so it seems like using CLOCK_TAI + similar userland handling
> would be the a reasonable approach to what you want without having to
> add more complexity to the kernel.
>
> thanks
> -john

This isn't just timezones (though there are timezones on Mars), the
entire calendar system would have changed, and hence things like the
length of a second would as well.

I actually watched Stephen's presentation earlier today about
timekeeping in the kernel. If there was to be some "implementation",
maybe it would have to be with changing that multiplier in the mult
then shift function - but as you said, without a "clear benefit", no
use at the moment.

-Josh
