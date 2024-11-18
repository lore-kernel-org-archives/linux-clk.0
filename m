Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FA2D22F19
	for <linux-clk@vger.kernel.org>; Mon, 18 Nov 2024 16:21:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731946912; cv=none; b=sl2PlnafsyOBT193v3BxrldhCTnQkzaJHRCO0X2HcoiHbb/HjfTjyxSmzq3WE4BvDIFVQLVubZi1WnbTdOG4y8fee2B1H5lO7HQG2SCDFyUJ88VRw70Oy9Dvaxpnb5o6BWKM25XYCjP8tvuXnt7XHDoCJo/wJltvxBYPDwcnQz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731946912; c=relaxed/simple;
	bh=He+mQ8eW35c5+G4P9wMPnK/+8V8kYaEsgbGObiOi4Gk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=I1OsIc5e22phBR9ckhO9x+yQasdd3P1NiOtvotDpjDV5Yn8qKHYPI8QR7kPlVreN5ra5ghWgaWNgHKP9+U0gi1h1qD3Pci+/knua4qGYmcxpgVooZD5zKG8xBizo6Hmy23NZGSQSBgXSIld0imXntnjOpvFMP5+071XMrfUg3x4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=Shse1mWp; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="Shse1mWp"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id 2246588E3F;
	Mon, 18 Nov 2024 17:21:47 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1731946908;
	bh=xyym+ryXhChzZmaxhP0FnMGUW77JqbNhfaaIa/i3t60=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Shse1mWpREOoMD+v4bSs1N08OXmE3Y+sFfm7ZkIdxf2ysFe6LN6AL573tvrlHs0iD
	 k2JSU66EA8EwGdjsJk7DWAuWW8sLfFfIJ4EPihmA8+0fzrZGHpex2qTNtHSO/rU26U
	 9nt6iZ8/ZSoTBMJernHRY8+JYOzAFFWagO6RD1vlYFN/mqCWzvP36SsYjj8uYrTtu5
	 u+/IaQ8H1WQZ5SHxrhxLIyb6bzcLgvJbZgJMap3GdZe+rG/VqNHfxcpTRE5AuZWeHH
	 E0Pg5P/LIQGpPAEjxpHfhdyshMkDd8KVJ0rrG7cl7ioNB1meyi95EGqmE6dvkzBchE
	 wT+u/5boo6Wiw==
Message-ID: <c3da6311-1eb7-4a67-977e-32c28897f0e0@denx.de>
Date: Mon, 18 Nov 2024 15:30:04 +0100
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
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <871pz9c606.fsf@bootlin.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 11/18/24 9:15 AM, Miquel Raynal wrote:
> Hi Marek,

Hello Miquel,

>>>> If you really want accurate pixel clock for your panel, you need similar
>>>> change to 4fbb73416b10 and configure the Video PLL such that the
>>>> accurate pixel clock can be derived from it. The Video PLL cannot be set
>>>> to pixel clock, because the LDB serializer clock are either 7x the pixel
>>>> clock, or 3.5x the pixel clock (for dual link LVDS), so the Video PLL
>>>> has to be set to 7x or 3.5x pixel clock of the panel, then you should
>>>> get accurate pixel clock and a working panel again.
>>> I found that I'm having the same issue that has been discussed in some
>>> related threads: the lcdif2 configures the video_pll1 to ~72 MHz, and
>>> later LDB tries to set it to 7x that value, failing.
>>
>> Right, which is solved by configuring the Video PLL to the correct
>> frequency in DT up front ... unless you have more than one output
>> supplied by that Video PLL.
> 
> No, this looks like a bug in the imx8 clock driver. I would expect the
> core to handle such case without DT hack. It is not okay to fix clock
> frequencies in DT because drivers are failing to do it properly. I
> understand there are advanced/dual cases with very specific frequencies
> where you don't expect it to magically work and giving hints with DT
> assigned-clocks* properties makes sense, but here I don't think we
> should consider it as a proper fix.

It is not a proper fix, it is the best we can do right now. I already 
replied to Luca with a bunch of patches where I tried to come up with a 
way to negotiate the pixel clock in drivers ... I need to get back to those.

> If I may recap:
> 1- a simple display pipeline works
> 2- the pixel frequency could be more precise so the video_pll1 parent is
>     used to dynamically compute a better frequency
> 3- the video_pll1 parent is too low in some cases which breaks the
>     pipeline
> 4- we need to force video_pll1 to a value in DT
> 
> How possibly 4 could be a relevant answer to 2, seriously? May I return
> you the advice, if you want a better video_pll1 value in the first
> place, why not assigning it up front in DT?

Because I have DSI-to-(e)DP bridge on the DSI bus and I do not know the 
pixel clock needed by attached panel up front.

I already included a link to DTO which allowed me to operate both this 
DSI-to-(e)DP bridge and LVDS panel with accurate pixel clock, I was 
hoping that would also let you solve 3 and 4. 4fbb73416b10 ("arm64: dts: 
imx8mp-phyboard-pollux: Set Video PLL1 frequency to 506.8 MHz") fixed 3. 
for Isaac at least.

> I understand your goal, and I agree with it, but please acknowledge that
> even though the current patch looks fine per-se, it is exposing a real
> bug that is now visible. Hiding it with DT properties feels really wrong.
I do fully agree the whole DT Video PLL1 clock frequency configuration 
is not good and it should not be in the DT at all. That is my goal in 
the very end.

The drivers (in this case, LCDIF1 + LCDIF2 + LDB) should negotiate the 
Video PLL1 frequency that fits them all best and configure it 
accordingly, without any DT assign-clock* workarounds.

I just didn't figure out a way to do that ^ yet.
