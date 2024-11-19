Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F14C1482F3
	for <linux-clk@vger.kernel.org>; Tue, 19 Nov 2024 21:56:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732053398; cv=none; b=CSBOYzKGsg/6o5Vcybz6QT30w4YSYq4vIRt17sgp80GfkVRr+Lop4iB/3umqVAcHACG9FlMS1z17Uosu6itpKpy5UKvG/VJDEFAmIEWqn3qXus4KkKndi8yKu0WFA4hx7HvuT/RbT4SeOYzh7JFcvvD+H9fHZ27MjYI1z2RNTOs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732053398; c=relaxed/simple;
	bh=tC6s4eJ8MHgT3MgaHpZtX7H8aFxCPsZin3YLASBEBOE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=n/F7oAQ5Qd+RHYb4IogxxXgFxUYrkyu2rbGiesXZDk6o9l4YMAElrEit6VfN5v57WcBdyQXb1YWLw5ihTmJzRpFbxds5VMhWyb3vLpF6/8a6PT5QIQLqzGgMK6MGc+x7QHcfQKjbahRGwPgi4amwBxWT5DTG/frjtuF0q6p5xqc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=dEXYC14Z; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="dEXYC14Z"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 663F3895AC;
	Tue, 19 Nov 2024 22:56:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1732053394;
	bh=+4y4N7QmC13lmdI6fCeaPDH+iubEf0wDTQdETtEJhHc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=dEXYC14ZVktPT42B1s9p4rc0kuqeZRUzf0Q9UVC6VQfCj9a3Y4nk2OPIGPr02bKv/
	 WQV2JO0y7HH/D2Rf+cpolJhpaDKDBSwdaQWxduYPgfoOvVsasbME59j1+kshXzvixl
	 1d1Q9bKvF8ojl9GwBo2+sFX3EV5Z2d8GBvddGZIjIBhuDxN1v2Y2Y/54tn2R965Vbp
	 kNV7sqMGkryvtTvuIzWi8WIpsjZ63Vpdy70zpylzFPNZmdgVAMwxJyn8wX2ketasv4
	 R59rMe3Od+CFtTa22sjMtjWP3I2k8ZsEX3QDO7PmFvLIZnhnfCRRr0C1vQe52PENE1
	 +jxKaxdy6Jy4w==
Message-ID: <ca293110-e231-49a6-99bb-89cf67cf477e@denx.de>
Date: Tue, 19 Nov 2024 22:21:34 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: imx: clk-imx8mp: Allow media_disp pixel clock
 reconfigure parent rate
To: Miquel Raynal <miquel.raynal@bootlin.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, Abel Vesa
 <abelvesa@kernel.org>, linux-clk@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, "Lukas F . Hartmann" <lukas@mntmn.com>,
 Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
 Anson Huang <Anson.Huang@nxp.com>
References: <20240531202648.277078-1-marex@denx.de>
 <20241112234206.558d5d5e@booty>
 <79f21303-b0ba-45ed-a842-7e5364fd4efc@denx.de>
 <20241113120622.3501db73@booty>
 <130fe140-e70d-4c45-aaab-e22762c58c88@denx.de>
 <20241115180936.4ab56be3@booty>
 <6bc5b8d7-ff10-4860-ac46-1460a7d850da@denx.de> <871pz9c606.fsf@bootlin.com>
 <c3da6311-1eb7-4a67-977e-32c28897f0e0@denx.de> <87cyirz0wn.fsf@bootlin.com>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <87cyirz0wn.fsf@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 11/19/24 4:41 PM, Miquel Raynal wrote:

Hello Miquel,

>>>> Right, which is solved by configuring the Video PLL to the correct
>>>> frequency in DT up front ... unless you have more than one output
>>>> supplied by that Video PLL.
>>> No, this looks like a bug in the imx8 clock driver. I would expect the
>>> core to handle such case without DT hack. It is not okay to fix clock
>>> frequencies in DT because drivers are failing to do it properly. I
>>> understand there are advanced/dual cases with very specific frequencies
>>> where you don't expect it to magically work and giving hints with DT
>>> assigned-clocks* properties makes sense, but here I don't think we
>>> should consider it as a proper fix.
>>
>> It is not a proper fix, it is the best we can do right now. I already
> 
> I am sorry I probably misunderstood your previous reply then. I am fine
> with the assigned-clocks workaround.
> 
>> replied to Luca with a bunch of patches where I tried to come up with a
>> way to negotiate the pixel clock in drivers ... I need to get back to
>> those.
> 
> Indeed, thanks to your feedback we got it fixed locally, so short term
> is okay for us (but people not reading this thread might still suffer
> from the problem though).

Whew, glad I could help.

>>> If I may recap:
>>> 1- a simple display pipeline works
>>> 2- the pixel frequency could be more precise so the video_pll1 parent is
>>>      used to dynamically compute a better frequency
>>> 3- the video_pll1 parent is too low in some cases which breaks the
>>>      pipeline
>>> 4- we need to force video_pll1 to a value in DT
>>> How possibly 4 could be a relevant answer to 2, seriously? May I
>>> return
>>> you the advice, if you want a better video_pll1 value in the first
>>> place, why not assigning it up front in DT?
>>
>> Because I have DSI-to-(e)DP bridge on the DSI bus and I do not know the
>> pixel clock needed by attached panel up front.
>>
>> I already included a link to DTO which allowed me to operate both this
>> DSI-to-(e)DP bridge and LVDS panel with accurate pixel clock, I was
>> hoping that would also let you solve 3 and 4. 4fbb73416b10 ("arm64: dts:
>> imx8mp-phyboard-pollux: Set Video PLL1 frequency to 506.8 MHz") fixed
>> 3. for Isaac at least.
>>
>>> I understand your goal, and I agree with it, but please acknowledge that
>>> even though the current patch looks fine per-se, it is exposing a real
>>> bug that is now visible. Hiding it with DT properties feels really wrong.
>> I do fully agree the whole DT Video PLL1 clock frequency configuration
>> is not good and it should not be in the DT at all. That is my goal in
>> the very end.
>>
>> The drivers (in this case, LCDIF1 + LCDIF2 + LDB) should negotiate the
>> Video PLL1 frequency that fits them all best and configure it
>> accordingly, without any DT assign-clock* workarounds.
> 
> Ok, good to know we are aligned :-)

Good indeed :)

>> I just didn't figure out a way to do that ^ yet.
> 
> Of course, getting rid of the DT workarounds is probably a long term
> goal, unlike the mid-term goal which is: "fixing" today's situation for
> "everyone with a simple setup". We are also looking into this and
> willing to find a proper solution.
I CCed you on an ongoing conversation with Victor in

Re: [PATCH v7 2/7] Revert "clk: imx: clk-imx8mp: Allow media_disp pixel 
clock reconfigure parent rate"

let's continue the discussion there. I hope we can reach some sort of a 
way forward there, that works for everyone.
