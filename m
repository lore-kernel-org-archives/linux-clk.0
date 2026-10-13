Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 419993C4B60;
	Tue, 13 Oct 2026 16:53:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791910411; cv=none; b=AsxiR//+1izOLxD6os3Gyq8/UoSGso7b9MolR7F9/8p/i5JylBugW5AaQH1auRuV29Ygkhkcmt9gfbluuoTpcXhVtegmlUkO1WgV2sD4+FTzxMOeKckoOcCEtOtQ5cyFKmVKrALOPUKmeZq+qIB6E4RgmgjtC413nC0koYbVlCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791910411; c=relaxed/simple;
	bh=Bf1+cUNbE5qkVcTONyft5tgSlgcrjgq5df40Ua6ahf0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=sbVu8HMFI11XKzF+CvMW4tJk+J24veOiDMtHfSXM7X2sk8xB0rF52P1jCuogyfvD4Na8Vl+csEzPHIPQYJ+4aT5E9sQ7QR/qVzs7uU2yelLaNSFzfo8vbiMqsUKwpULSrnVekNMc1Vt/AUgCSz17tK0+ZiURB7CoDiM+6Mccyl4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=GWxRcSJq; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="GWxRcSJq"
Received: from smtpout-01.galae.net (unknown [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 83A62C653F4;
	Tue, 13 Oct 2026 16:54:19 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C8E0C60362;
	Tue, 13 Oct 2026 16:53:13 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2DEFC11D714FD;
	Tue, 13 Oct 2026 18:53:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791910393; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=iHPYa0/Oq6Fpvpu0NFhqnH64bHq9AyO4cfaAIVmzVx8=;
	b=GWxRcSJqpJ5YCykL6qTYMGDEn0XCoERbh0ikqwcc6yyyRszBgdjVQGKdChUUcGFShmyabe
	DSqTyY0aYRmeU1Zpk4lft2mzq1TuNaQ8rsthI1FjPFy1zDjmtcIz/iPUEwdpumRh9mrUO4
	GDNdgoEA2snHF6tq5huO0590iJ5XfWhPHl8MNNomdBUqRM/W6MbqjQJystixnI2CI1J+Qi
	m2A1LAVky0xJF7LSAwFqMAtlKjZrkGvR8sqFTiFevttr/weqyI22xM9cQRDTSPmThlXuTv
	SoDuur1irMzuW5DAghll4CuZBFc1HJoFscp9xmOcbNZzyyS1sMQGBlyC+1xpvw==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: sashiko-bot@kernel.org,  sashiko-reviews@lists.linux.dev,
  conor+dt@kernel.org,  linux-clk@vger.kernel.org,  robh@kernel.org,
  devicetree@vger.kernel.org
Subject: Re: [PATCH v8 5/7] clk: nuvoton: ma35d1: Reparent SYSPLL correctly
In-Reply-To: <179181904945.33566.17882786294681341398.b4-reply@b4> (Jerome
	Brunet's message of "Mon, 12 Oct 2026 17:30:49 +0200")
References: <20261004-perso-ma35d1-upstream-clk-v8-0-e1a106a128c0@bootlin.com>
	<20261004-perso-ma35d1-upstream-clk-v8-5-e1a106a128c0@bootlin.com>
	<20261004205551.6279C1F000FF@smtp.kernel.org>
	<87zewti2pf.fsf@bootlin.com>
	<1jjynw7bp8.fsf@starbuckisacylon.baylibre.com>
	<87cxtni7m6.fsf@bootlin.com>
	<179181904945.33566.17882786294681341398.b4-reply@b4>
User-Agent: mu4e 1.12.12; emacs 30.2
Date: Tue, 13 Oct 2026 18:53:10 +0200
Message-ID: <87ld81v8y1.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3

On 12/10/2026 at 17:30:49 +02, Jerome Brunet <jbrunet@baylibre.com> wrote:

> On 2026-10-06 09:57 +0200, Miquel Raynal wrote:
>> On 05/10/2026 at 11:12:35 +02, Jerome Brunet <jbrunet@baylibre.com> wrot=
e:
>>=20
>> > On Sun 04 Oct 2026 at 23:19, Miquel Raynal <miquel.raynal@bootlin.com>=
 wrote:
>> >
>> >> On 04/10/2026 at 20:55:50 GMT, sashiko-bot@kernel.org wrote:
>> >>
>> >>> Thank you for your contribution! Sashiko AI review found 1 potential=
 issue(s) to consider:
>> >>> - [Low] clk: nuvoton: ma35d1: Modification of global static state
>> >>> during probe
>> >>
>> >> There is a single clock controller. Should never be a problem. I can
>> >> certainly move it in to more local scope if someone asks, but it's not
>> >> practically needed.
>> >
>> > I may be missing something key here but why is not in your defined
>> > indexes like the rest of the clocks ?
>>=20
>> SYSPLL and its parent (HXT_GATE) are in the hws[] array. Are you
>> suggesting to use the hw_clk pointer directly there instead of using the
>> parent data structure as an envelope? Because the issue raised is the
>> global definition of the struct clk_parent_data and then its
>> modification (since I need to reference the hws[SYSPLL] pointer inside).
>
> The problem sashiko is pointing at is that you are creating a global and =
then use
> it as a local variable, just assigning the the .hw
>
> So 2 possibilities:
> * You just need the .hw then I don't really get why you are doing it diff=
erently
>   for this clock ?

True.

> * OR, this is one of the those clock where you want to check DT first then

It is not.

>   fallback to a fixed clock, then yes you need parent_data. don't forget
>   the fw_name (which I did not see here) and use a local variable for tha=
t,
>   not a global
>
> Did I miss something ?

You got it absolutely right, and while implementing the change I
remember why I used the name instead of the hw pointer:

     clk_hw_register_fixed_rate_parent_hw() exists, but
devm_clk_hw_register_fixed_rate_parent_hw() did not.

So since it looks like most of these helpers have their devm_
counterpart, I will add this new helper in clk-provider.h. I plan on
doing that addition in this commit because I think that is what Boyd
used to prefer, but I can add it in a preparation patch that is your own
preference, I don't mind.

Thanks for all the guidance!
Miqu=C3=A8l
