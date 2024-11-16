Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EC765227
	for <linux-clk@vger.kernel.org>; Sat, 16 Nov 2024 20:07:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731787663; cv=none; b=uH/5DwIHA3SJx3hZZGwoyN5TNbbqiZtxSMqI3ccfbyXCWawlkqOnxfRfFLy6y+JaXiJRIX2HZjariUDjd23eV10hvKo8OquLQLByYOny30NLgzcFFfqsbTtqAlLBhzbil6hGPe5vmZkjfZV8i8liYPiVyDr7fvi5YHxWV/GMatY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731787663; c=relaxed/simple;
	bh=Eb7bakNuDMt536McYSWp7VRPHActWbHVTmLakZn4EVo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OFITRgrEySuNbYJCjBShqaimYDdYSPxP6dI2KbOhixIDeNjJuVK+RhecIudHsoje/3Kqh7cbl8rMdz7upkq1qX/iI1Be/atFGCLm5eVSSd9116B5lASuUNotFiOESpirEHEM+c3kXjJLeTlcn4oKhsXfkknkekNhfEHj9O7Wmp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=ejCltd7G; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="ejCltd7G"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id C2DC389378;
	Sat, 16 Nov 2024 21:07:32 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1731787653;
	bh=xPbam/hqk2QR/wXTH/4/tBGNCnFHw4Qhbd8fGZD6CC4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ejCltd7GiaHHmcgRz64KB54p0NIqVHI/bz37T1H8yzSbZgpBOkY8pUdUXVQvZdpVV
	 Z/3Mhsy+Q17DgxsZC3+gJY9OAyxSH/ETaQn1DpN/ZlY0UEu+FLk+qNBiGoxL8S8r3n
	 cVFjpNYUJuHLMvVo3BK2M/C7Tu9SSPtKWP5WczyXnlsH54w4BXpBoj8dX7LhnbvUvX
	 LRMv6xPTiZFzQEIQi9iyGwvQm1z1cecDVz2iKYE9bnFAkhBEp+IVB/8OyWT4hreqEy
	 eeLPz/TfBIg6qkpEqAm9Ynj9iiYUEqFQEK1k84oT8gU7a814JVdH9+TfkBaE3tuuYm
	 o2ayNt6C6pPkw==
Message-ID: <6bc5b8d7-ff10-4860-ac46-1460a7d850da@denx.de>
Date: Sat, 16 Nov 2024 20:47:07 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: imx: clk-imx8mp: Allow media_disp pixel clock
 reconfigure parent rate
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Abel Vesa <abelvesa@kernel.org>, linux-clk@vger.kernel.org,
 Fabio Estevam <festevam@gmail.com>, "Lukas F . Hartmann" <lukas@mntmn.com>,
 Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Stephen Boyd <sboyd@kernel.org>, imx@lists.linux.dev,
 kernel@dh-electronics.com, linux-arm-kernel@lists.infradead.org,
 Miquel Raynal <miquel.raynal@bootlin.com>, Anson Huang <Anson.Huang@nxp.com>
References: <20240531202648.277078-1-marex@denx.de>
 <20241112234206.558d5d5e@booty>
 <79f21303-b0ba-45ed-a842-7e5364fd4efc@denx.de>
 <20241113120622.3501db73@booty>
 <130fe140-e70d-4c45-aaab-e22762c58c88@denx.de>
 <20241115180936.4ab56be3@booty>
Content-Language: en-US
From: Marek Vasut <marex@denx.de>
In-Reply-To: <20241115180936.4ab56be3@booty>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 11/15/24 6:09 PM, Luca Ceresoli wrote:
> Hi Marek,

Hi,

>> Commit 4fbb73416b10 ("arm64: dts: imx8mp-phyboard-pollux: Set Video PLL1
>> frequency to 506.8 MHz") configures the Video PLL1 to a frequency from
>> which both your panel pixel clock and LDB serializer clock can be
>> successfully divided down.
>>
>> Which panel do you use ?
>>
>> Try this -- Revert this patch, check /sys/kernel/debug/clk/clk_summary
>> and compare it with (I assume) panel-simple.c entry for the panel you
>> use, and notice the disp_pix clock are likely a bit off. That's because
>> the lcdif driver did its best to divide those pixel clock down from
>> 1039500000 set in imx8mp.dtsi .
>>
>> If you really want accurate pixel clock for your panel, you need similar
>> change to 4fbb73416b10 and configure the Video PLL such that the
>> accurate pixel clock can be derived from it. The Video PLL cannot be set
>> to pixel clock, because the LDB serializer clock are either 7x the pixel
>> clock, or 3.5x the pixel clock (for dual link LVDS), so the Video PLL
>> has to be set to 7x or 3.5x pixel clock of the panel, then you should
>> get accurate pixel clock and a working panel again.
> 
> I found that I'm having the same issue that has been discussed in some
> related threads: the lcdif2 configures the video_pll1 to ~72 MHz, and
> later LDB tries to set it to 7x that value, failing.

Right, which is solved by configuring the Video PLL to the correct 
frequency in DT up front ... unless you have more than one output 
supplied by that Video PLL.

> I would have guessed your "[PATCH 1/2] clk: imx: clk-imx8mp: Allow LDB
> serializer clock reconfigure parent rate" would have fixed it, and it
> actually allwos the LDB to set a proper (7x) rate for video_pll1, but
> then also the media_disp2 goes to the same rate. Apparently the
> video_pll1 is not propagated to media_disp2. I haven't dug into this.
> 
> So this is not the bug I had suspected about video_pll1 rate
> computation.
> 
> For now my workaround is to set the exact rate to video_pll1 via
> assigned-clock-rates.
> 
> However this breaks the case of using both lcdif1 and lcdif2. For that
> I have added a reparenting of media_disp1 to sys_pll3 and it looks like
> working.

See the patch link in the previous email, if you can use one Audio PLL 
as PLL for the other DISP PIX, then you will be able to achieve accurate 
pixel clock on both outputs. Can you do that ?

> Would you mind keeping Miquèl and me in Cc in following discussions
> about the imx8mp video clocks? We are also facing this topic and we are
> happy to contribute.
Sure
