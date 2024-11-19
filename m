Received: from relay8-d.mail.gandi.net (relay8-d.mail.gandi.net [217.70.183.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41E791CEE8B
	for <linux-clk@vger.kernel.org>; Tue, 19 Nov 2024 15:41:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732030898; cv=none; b=Gz0AbIhNRe5lG7YeRU6H3Uf3L070eikxHf87kDE+YdqXoLgbxM6gWW11pJomdHcTFGCxoFCiMzVc6L0xLoazeZQiP9m5+J1qcpUOXbFUDG6Y+WMfqPhrSg27q3lZugxJb52+FVJABzcMkH9QvcDqmBUMOW+0NiqpuFl1FrwQBlg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732030898; c=relaxed/simple;
	bh=LMlnjlnlYyS1T8w8ya2+4ZjbQ/AtQ6bGHG760o+tXPY=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=fVDzrrH/RqIumoyk0aYEuNq5p6yVCgKrz83PZuBH3U5UDheO7veZpUUXDetwRehN2P907Dj6K29PNa9pK5TAAWxGrl/6jv+x0/cTVEUCXeyDJ/J2QO2Nf+Kcaer7RxOz8XDM+wvC2Kjq3Checfe05bD9zE8nYuU7f9mmCwJrins=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=io9RKrrl; arc=none smtp.client-ip=217.70.183.201
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="io9RKrrl"
Received: by mail.gandi.net (Postfix) with ESMTPSA id DCE0B1BF20C;
	Tue, 19 Nov 2024 15:41:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1732030889;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+KJPrpVSpjlMsljEONMGLhUb9kDFkewDTz7vO3IORSI=;
	b=io9RKrrlUJ5LfS28I+zGTgdXazwkVChYn/JjjVqtb5QYNC9yIXDAhmkzunCCdpOx3BIUOX
	0FhAT9sqGU1TAcPeslSlemLGuz4nik2+LXLN7Syk/AHbOpnn7v7qKEC5BGXk600IObMBUJ
	k5tnn3K6hWPGJO+yM8BXvIE/TDFTToxotzYUcxhavwFJs+BT9FsI3Ea8sJOhRtTpL+rsnA
	npx/M+CQj9Okjc85fwF1w20qH0V3N2uLAzbBzdL0KwjsgZzQHfpVjaMDCEo6lrUaktYqa0
	PuqjD4weYeHzqovr/76QnUG6wc4hvn1b8VxXm8nGwZFrpSm7uBxu3FmF3d2tJA==
From: Miquel Raynal <miquel.raynal@bootlin.com>
To: Marek Vasut <marex@denx.de>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,  Abel Vesa
 <abelvesa@kernel.org>,  linux-clk@vger.kernel.org,  Fabio Estevam
 <festevam@gmail.com>,  "Lukas F . Hartmann" <lukas@mntmn.com>,  Michael
 Turquette <mturquette@baylibre.com>,  Peng Fan <peng.fan@nxp.com>,
  Pengutronix Kernel Team <kernel@pengutronix.de>,  Sascha Hauer
 <s.hauer@pengutronix.de>,  Shawn Guo <shawnguo@kernel.org>,  Stephen Boyd
 <sboyd@kernel.org>,  imx@lists.linux.dev,  kernel@dh-electronics.com,
  linux-arm-kernel@lists.infradead.org,  Anson Huang <Anson.Huang@nxp.com>
Subject: Re: [PATCH] clk: imx: clk-imx8mp: Allow media_disp pixel clock
 reconfigure parent rate
In-Reply-To: <c3da6311-1eb7-4a67-977e-32c28897f0e0@denx.de> (Marek Vasut's
	message of "Mon, 18 Nov 2024 15:30:04 +0100")
References: <20240531202648.277078-1-marex@denx.de>
	<20241112234206.558d5d5e@booty>
	<79f21303-b0ba-45ed-a842-7e5364fd4efc@denx.de>
	<20241113120622.3501db73@booty>
	<130fe140-e70d-4c45-aaab-e22762c58c88@denx.de>
	<20241115180936.4ab56be3@booty>
	<6bc5b8d7-ff10-4860-ac46-1460a7d850da@denx.de>
	<871pz9c606.fsf@bootlin.com>
	<c3da6311-1eb7-4a67-977e-32c28897f0e0@denx.de>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Tue, 19 Nov 2024 16:41:28 +0100
Message-ID: <87cyirz0wn.fsf@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-GND-Sasl: miquel.raynal@bootlin.com

Hi Marek,

On 18/11/2024 at 15:30:04 +01, Marek Vasut <marex@denx.de> wrote:

> On 11/18/24 9:15 AM, Miquel Raynal wrote:
>> Hi Marek,
>
> Hello Miquel,
>
>>>>> If you really want accurate pixel clock for your panel, you need simi=
lar
>>>>> change to 4fbb73416b10 and configure the Video PLL such that the
>>>>> accurate pixel clock can be derived from it. The Video PLL cannot be =
set
>>>>> to pixel clock, because the LDB serializer clock are either 7x the pi=
xel
>>>>> clock, or 3.5x the pixel clock (for dual link LVDS), so the Video PLL
>>>>> has to be set to 7x or 3.5x pixel clock of the panel, then you should
>>>>> get accurate pixel clock and a working panel again.
>>>> I found that I'm having the same issue that has been discussed in some
>>>> related threads: the lcdif2 configures the video_pll1 to ~72 MHz, and
>>>> later LDB tries to set it to 7x that value, failing.
>>>
>>> Right, which is solved by configuring the Video PLL to the correct
>>> frequency in DT up front ... unless you have more than one output
>>> supplied by that Video PLL.
>> No, this looks like a bug in the imx8 clock driver. I would expect the
>> core to handle such case without DT hack. It is not okay to fix clock
>> frequencies in DT because drivers are failing to do it properly. I
>> understand there are advanced/dual cases with very specific frequencies
>> where you don't expect it to magically work and giving hints with DT
>> assigned-clocks* properties makes sense, but here I don't think we
>> should consider it as a proper fix.
>
> It is not a proper fix, it is the best we can do right now. I already

I am sorry I probably misunderstood your previous reply then. I am fine
with the assigned-clocks workaround.

> replied to Luca with a bunch of patches where I tried to come up with a
> way to negotiate the pixel clock in drivers ... I need to get back to
> those.

Indeed, thanks to your feedback we got it fixed locally, so short term
is okay for us (but people not reading this thread might still suffer
from the problem though).

>> If I may recap:
>> 1- a simple display pipeline works
>> 2- the pixel frequency could be more precise so the video_pll1 parent is
>>     used to dynamically compute a better frequency
>> 3- the video_pll1 parent is too low in some cases which breaks the
>>     pipeline
>> 4- we need to force video_pll1 to a value in DT
>> How possibly 4 could be a relevant answer to 2, seriously? May I
>> return
>> you the advice, if you want a better video_pll1 value in the first
>> place, why not assigning it up front in DT?
>
> Because I have DSI-to-(e)DP bridge on the DSI bus and I do not know the
> pixel clock needed by attached panel up front.
>
> I already included a link to DTO which allowed me to operate both this
> DSI-to-(e)DP bridge and LVDS panel with accurate pixel clock, I was
> hoping that would also let you solve 3 and 4. 4fbb73416b10 ("arm64: dts:
> imx8mp-phyboard-pollux: Set Video PLL1 frequency to 506.8 MHz") fixed
> 3. for Isaac at least.
>
>> I understand your goal, and I agree with it, but please acknowledge that
>> even though the current patch looks fine per-se, it is exposing a real
>> bug that is now visible. Hiding it with DT properties feels really wrong.
> I do fully agree the whole DT Video PLL1 clock frequency configuration
> is not good and it should not be in the DT at all. That is my goal in
> the very end.
>
> The drivers (in this case, LCDIF1 + LCDIF2 + LDB) should negotiate the
> Video PLL1 frequency that fits them all best and configure it
> accordingly, without any DT assign-clock* workarounds.

Ok, good to know we are aligned :-)

> I just didn't figure out a way to do that ^ yet.

Of course, getting rid of the DT workarounds is probably a long term
goal, unlike the mid-term goal which is: "fixing" today's situation for
"everyone with a simple setup". We are also looking into this and
willing to find a proper solution.

Cheers,
Miqu=C3=A8l
