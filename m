Received: from phobos.denx.de (phobos.denx.de [85.214.62.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6187918B48F
	for <linux-clk@vger.kernel.org>; Wed, 13 Nov 2024 21:20:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=85.214.62.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731532819; cv=none; b=JB6bzoIK7eTvmRhRjPvTF2Maiu3YmA2S68/Dh+poSmVWKMPecuMEWmyuJ/59TGpqsSi2Jry+H2R0P2m+Hcd5GEuKB8zv5cJHO1XN/Uebo06k22KCBKsGtfYiWH2TXvsK6ArN8+j59lEoXGpJdIhwi/MQyLc6cNUJg2Lcpqq3tS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731532819; c=relaxed/simple;
	bh=z9gZ5FOVT7Llbe9zuGD2h0H70fs/NNUAt3hD1LlGWqI=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=Gnvtx5U7xa10t+aYmblACtJQ2yrpt7x/JYZjo5EP/SGUJBfVDKp0OqyVqs6SAOD9TNJzzKG98xsjJL7gM3jzCfe8EzBDT1H9a6i1EPvYS+FiGykbhUGaWoi6/k/A+25EilmM6/YCCKyNnVBzph4X6ZTLpPumZZXFYavGEMtblLo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de; spf=pass smtp.mailfrom=denx.de; dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b=IzT2cXD4; arc=none smtp.client-ip=85.214.62.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=denx.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=denx.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=denx.de header.i=@denx.de header.b="IzT2cXD4"
Received: from [127.0.0.1] (p578adb1c.dip0.t-ipconnect.de [87.138.219.28])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits))
	(No client certificate requested)
	(Authenticated sender: marex@denx.de)
	by phobos.denx.de (Postfix) with ESMTPSA id A38E988216;
	Wed, 13 Nov 2024 22:20:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de;
	s=phobos-20191101; t=1731532815;
	bh=Ajav+1EuVkjPtUm5mWq06rl6efZ4DZEYCnB6FwrLFg8=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=IzT2cXD4RKZnNNvsHVyqNA9vDnAMAALSoSfZsIltB4ojQqGc9ngSTwdrWyuplVhfi
	 1MeP0fnLk9czI3pD+3lXrit9xBfF/+Kz8rVZz4IyYsn4LU/UbIYA1AcNLmoBdQgKRx
	 b4mPymNdzeyPmiBMdpOH2aPMLy+7eKy/2WLU1LyTqD+8BzGrEMyhgbtWALbgGifip5
	 5BBjcbfoHASI+cnor2XPD6+Od87+BjNK3UjHzCQzXdZyAa2APTjIR7RclgFfkM2Mk6
	 CfXL+uEIvdAiZHuAizmEIEVgnXqtMKSfghfjolmtYdsyokJ8zUVamDxvQsm5gM/M1z
	 tqrf/pSjgIZkw==
Message-ID: <130fe140-e70d-4c45-aaab-e22762c58c88@denx.de>
Date: Wed, 13 Nov 2024 22:19:02 +0100
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Marek Vasut <marex@denx.de>
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
Content-Language: en-US
In-Reply-To: <20241113120622.3501db73@booty>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Virus-Scanned: clamav-milter 0.103.8 at phobos.denx.de
X-Virus-Status: Clean

On 11/13/24 12:06 PM, Luca Ceresoli wrote:
> Hi Marek,

Hi,

>>>> The media_disp[12]_pix clock supply LCDIFv3 pixel clock output. These
>>>> clocks are usually the only downstream clock from Video PLL on i.MX8MP.
>>>> Allow these clocks to reconfigure the Video PLL, as that results in
>>>> accurate pixel clock. If the Video PLL is not reconfigured, the pixel
>>>> clock accuracy is low.
>>>>
>>>> Signed-off-by: Marek Vasut <marex@denx.de>
>>>
>>> I'm afraid I just found this patch broke my previously working setup
>>> with a panel connected on the LDB.
>> Do you need a fix similar to this one?
>>
>> 4fbb73416b10 ("arm64: dts: imx8mp-phyboard-pollux: Set Video PLL1
>> frequency to 506.8 MHz")
> 
> So, 4fbb73416b10 is adding an assigned-clock-rates to hardcode rates,
> especially the video_pll1 rate.

Nope.

See arch/arm64/boot/dts/freescale/imx8mp.dtsi

1891                         media_blk_ctrl: blk-ctrl@32ec0000 {
...
1951                                 assigned-clock-rates = <500000000>, 
<200000000>,
1952                                                        <0>, <0>, 
<500000000>,
1953                                                        <1039500000>;

That imx8mp.dtsi preconfigures the Video PLL1 to some random clock 
frequency.

Commit 4fbb73416b10 ("arm64: dts: imx8mp-phyboard-pollux: Set Video PLL1 
frequency to 506.8 MHz") configures the Video PLL1 to a frequency from 
which both your panel pixel clock and LDB serializer clock can be 
successfully divided down.

Which panel do you use ?

Try this -- Revert this patch, check /sys/kernel/debug/clk/clk_summary 
and compare it with (I assume) panel-simple.c entry for the panel you 
use, and notice the disp_pix clock are likely a bit off. That's because 
the lcdif driver did its best to divide those pixel clock down from 
1039500000 set in imx8mp.dtsi .

If you really want accurate pixel clock for your panel, you need similar 
change to 4fbb73416b10 and configure the Video PLL such that the 
accurate pixel clock can be derived from it. The Video PLL cannot be set 
to pixel clock, because the LDB serializer clock are either 7x the pixel 
clock, or 3.5x the pixel clock (for dual link LVDS), so the Video PLL 
has to be set to 7x or 3.5x pixel clock of the panel, then you should 
get accurate pixel clock and a working panel again.

> However this is not fixing the problem I'm seeing. The existing
> assigned-clock-rates value for video_pll1 used to work because it is
> the media_ldb parent, and the parent wasn't recalculated. After this
> patch got applied the video_pll1 rate is computed at runtime and so the
> hardcoded value in assigned-clock-rates does not matter in the end.
> 
> I also tried a configuration that appears to me as the most optimal for
> managing both an LVDS panel on LDB and a DSI panel (which is also
> present in the more complete design I'm working on):
> 
>   * media_ldb and media_disp2 (the two clocks involved in LDB/LVDS
>     output) left as children of video_pll1 as per imx8mp.dtsi
>   * media_disp1 (used for DSI output) reparented to sys_pll3

I noticed that the PLL3 PLL1416x does not support dynamic rate 
configuration, I sent a patch for that a few days ago, but in the end I 
also found out that the PLL1416x is less accurate and cannot supply the 
LVDS side, so I gave up on that one.

I ended up using Audio PLL for one of the displays in similar setup 
(LVDS panel + DP monitor via DSI-to-DP bridge) , see this:

https://github.com/dh-electronics/meta-dhsom-imx-bsp/commit/fb3b1521bbe71b7ff91fe92be2e64a75104eb7d5

That way, I do get accurate pixel clock on both outputs, but I do have 
to sacrifice one of the Audio PLLs. On the other hand, if all you have 
is one audio output, the Audio PLL is PLL1443x and does support dynamic 
rate configuration, so one Audio PLL should be enough for such a use 
case. Also, upside is, PLL3 can supply the Audio DSP if needed.

> The above config assigns to each output (LVDS and DSI) an ad-hoc PLL.
> However the problem does not disappear, simply because the problem is
> that requesting a ~500 MHz rate to video_pll1 results in it to be
> configured at ~72 MHz.
>    
> This confirms the problem I reported appears to be an incorrect
> computation of the video_pll1 rate, which in turn looks like a bug
> (which as I said is exposed, not introduced, by this patch). If
> setting a hardcoded value could make it work, that would look like
> hiding a bug, wouldn't it?

I missed the part where you use both LVDS and DSI outputs , which both 
hang from the Video PLL1. I think that is what triggers the problem, and 
I think the link above might actually help with that.

> And at least with a single-panel setup the runtime computation should
> work just fine.
> 
> More generally speaking, I don't follow your approach: your patch
> enables runtime computation of the video_pll1 rate, but you now suggest
> to hardcode it. Am I missing something?
The patch I linked sets up the Video PLL1 frequency. When either LDB or 
LCDIF attempts to divide down the serializer or pixel clock from that 
Video PLL1, they can do so by setting a divider, without changing the 
Video PLL1 frequency. That's the crutch here.

I am looking for some better way to deal with it, see
[PATCH 1/2] clk: imx: clk-imx8mp: Allow LDB serializer clock reconfigure 
parent rate
[PATCH 2/2] drm: bridge: ldb: Configure LDB clock in .mode_set
and discussion with Isaac around
Re: [PATCH] drm: lcdif: Use adjusted_mode .clock instead of .crtc_clock
