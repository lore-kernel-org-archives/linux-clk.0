Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2A539A7F2;
	Sun, 27 Sep 2026 12:05:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790510742; cv=none; b=QxNdoBWPzb+WvQ2plwjinC6DrAk4lFUo+xfnfjeMYQLkEXY6KpgeipzSbCYpSofmL/QmlKfL2x2/gGEUa0jG4kdauwysr4BCcyA+LOAoXr7y9aJr9okhtWhby+s1Zj3Um+K2V62XHy7zdUYVHUpEBNB76rtP2jhGqwyJIoATEQs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790510742; c=relaxed/simple;
	bh=AHoenpyp6OwVJ8IheVHLHeaV0N4IaRBKsv41zFzi8iY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=HJW9axixqxCtWqi4ut9p3xoUO9n0ZAGSiG0E4RIB16XAz13fzTWqnSDlGmXYyQ8mVpF/ve2grvclWsJeiAo99J5dnVtR3Slc38xCW0sHObzkugZUMscdYscFbzON2ffq8OzeCBqlTkZpYnyet9bCr1C4tNF3l8rkrbKOPxhPx9o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=GfNjHoD7; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="GfNjHoD7"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260927120537euoutp019c6217f2f172d5798b71ccad819cde66~ZLAeRpbfb0961109611euoutp01G;
	Sun, 27 Sep 2026 12:05:37 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260927120537euoutp019c6217f2f172d5798b71ccad819cde66~ZLAeRpbfb0961109611euoutp01G
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1790510737;
	bh=XG8+gWff0Kb6xp+rIzHqMb+FVejaqE783kZJda9sveQ=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=GfNjHoD7g834Dcl8ZapG6XaA2n8JLOknTzlw7hqfOTAo9LAYC2MsOnIIDyjT8ZLP2
	 l5hKnOlzHW9ec1yco0+wCoH4olnd4//rBjjAIeXDtkaOcBZYd7z4B8k29ZiShT270L
	 oFgdZaGafVbmpg9ZujF/q9SlESV9rt/e7uROppyI=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260927120537eucas1p2940a6c268f23ab72fb7eb581fe0bfee8~ZLAd4yZaM2953129531eucas1p2J;
	Sun, 27 Sep 2026 12:05:37 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260927120535eusmtip28a1a6cb637e2a20e2b9abd75be01ad38~ZLAbod2Iw3245532455eusmtip2F;
	Sun, 27 Sep 2026 12:05:34 +0000 (GMT)
Message-ID: <4b1d51e9-1d83-4ad7-ac60-36de54e57bc2@samsung.com>
Date: Sun, 27 Sep 2026 14:05:34 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 18/20] phy: starfive: Add jh7110-inno-hdmi-phy driver
To: Dominique Belhachemi <domibel@debian.org>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
	Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrzej
	Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, Laurent
	Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli
	<luca.ceresoli@bootlin.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>, Andy
	Yan <andy.yan@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>, Emil
	Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Dominique
	Belhachemi <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>, Jerome
	Brunet <jbrunet+clk@baylibre.com>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, mfd@lists.linux.dev,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, Marek
	Szyprowski <m.szyprowski@samsung.com>, Maud Spierings
	<maud_spierings@murena.io>, Graham Markall <hello@big-grey.co.uk>, Icenowy
	Zheng <zhengxingda@iscas.ac.cn>, Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Joshua Peisach <jpeisach@ubuntu.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <CAAvaLCzm1o=m6P88KNeHCG9BuTBu4AQmAec90kN3MMC6ZpALaQ@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260927120537eucas1p2940a6c268f23ab72fb7eb581fe0bfee8
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260915153246eucas1p289987fd8757c89ff865c99b6465708a8
X-EPHeader: CA
X-CMS-RootMailID: 20260915153246eucas1p289987fd8757c89ff865c99b6465708a8
References: <CGME20260915153246eucas1p289987fd8757c89ff865c99b6465708a8@eucas1p2.samsung.com>
	<20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
	<20260915-jh7110-clean-send-v4-18-f0e4fd6f2cc8@samsung.com>
	<CAAvaLCzm1o=m6P88KNeHCG9BuTBu4AQmAec90kN3MMC6ZpALaQ@mail.gmail.com>

Hi Dominique,

On 9/26/26 05:31, Dominique Belhachemi wrote:
> On Tue, Sep 15, 2026 at 11:32 AM Michal Wilczynski
> <m.wilczynski@samsung.com> wrote:
>>
>> +static int starfive_hdmi_phy_probe(struct platform_device *pdev)
>> +{
>> +       ret = clk_set_rate(inno->phyclk, 297000000);
>> +       if (ret) {
>> +               dev_err(dev, "Failed to set default rate: %d\n", ret);
>> +               goto err_del_clk_provider;
>> +       }
> 
> Hi Michal,
> 
> Can we drop these 5 lines?
> When my 4K monitor comes up in mode (3840x2160@30, 297 MHz) the screen
> stays blank.
> 
> When the first real modeset requests a mode whose pixel clock is also 297 MHz,
> clk_set_rate(hdmi_pclk, 297000000) then sees cur == want and does nothing.
> So the pre-PLL is never actually programmed.
> 
> Without these 5 lines inno->pixclock stays 0,
> so the first modeset's clk_set_rate() always runs .set_rate() for real.
> 
> Together with my forgotten fix from May we can have working 4K@30 on the VF2.
> https://lore.kernel.org/all/20260528184145.384114-1-domibel@debian.org/

Yeah, these lines are a problem in another way too. Marek Szyprowski
reported that v4 hangs when everything is built as modules, which
is what made me look at them.

The write lands in registers gated by the controller's system clock,
inside PD_VOUT and the PHY holds neither - it cannot hold that clock
without creating a probe cycle with voutcrg. His config is as follows:
CONFIG_CLK_STARFIVE_JH7110_VOUT=y with the vout subsystem, hdmi
subsystem, controller and phy all as modules so voutcrg is up long
before the PHY arrives from userspace. If nothing is holding hdmi_tx_sys
by then - clk_disable_unused() gates it at late_initcall_sync  and the
write wedges the bus. I could not reproduce his exact failure, but could
reproduce this with fw_devlink=off hopefully this is fixing his issue as
well.

Anyway this code will be removed in v5.

> 
> Best
> -Dominique
> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>
