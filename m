Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7B83477298;
	Mon, 14 Sep 2026 15:50:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789401009; cv=none; b=lanGvPy9P0fdQtrBfaRYNs/+3T4WoA/vO+n3H59vba/L/5oBKj42HuJyosSJyusaD2agx7ApPRYIPy77XCGhUZ8xhbuTIh2nMgb96ii1Z6A0I6QnN4cLfVEOPxAnqxPMMwQMP8TJCVH49LkTJrORkihxwvxRP3k/9lSE+UWCDQQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789401009; c=relaxed/simple;
	bh=SdaWG6OzI3umLas1wsEUFHL4V3TyZ9z5PPs2HbT/OBk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=ZqBC0Ag0uBlTh93P36EI6+FMtu8tQC5OhHWb1ObqA2IlakZBRzbPJKB2o0raVEDCYvasSn5koVzYVovYFwNqz7s+dEVP5R7mnJzwdf+6Sc336fKEAzsqM/hLiZXxllbdbmJ7UYVtL4ZxR7zyD9Y2Jw9ISpfnZJWlgr9SqlrDC8A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=B0aPZ9sm; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="B0aPZ9sm"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260914155005euoutp024857e7c81b11d5fa43dd19719ba10c24~VOrvnkiwZ2332323323euoutp02q;
	Mon, 14 Sep 2026 15:50:05 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260914155005euoutp024857e7c81b11d5fa43dd19719ba10c24~VOrvnkiwZ2332323323euoutp02q
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789401005;
	bh=PG34NheEGUUklmbyGFWYH3mof2VB5KJYIWGOux9Ay9A=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=B0aPZ9smvU/W3vvxmV5yAM2Ch3FcHIHY/3mfNFpS9oQ99QhxWXbYADiggA+iaBKMX
	 fwhPEzKL7GeEg9ncES+hJrw4lapRIImw5Q7M1TBAKBr+qQfLiMhaaBMFYW5Q3887Ok
	 Gu6F9PZ9ipRUXQfKhJM8CbHNPb8Wb0Ut3yRW0p/A=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260914155004eucas1p298df2ff60a38fa5dc11e23802962b7f3~VOru0bBrZ2376623766eucas1p29;
	Mon, 14 Sep 2026 15:50:04 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260914155002eusmtip115f5f2e6e07eb44713898bdf244ca8e7~VOrsrfT6w0990109901eusmtip1F;
	Mon, 14 Sep 2026 15:50:02 +0000 (GMT)
Message-ID: <4ba79aa9-6a21-41f6-a088-98207d32a098@samsung.com>
Date: Mon, 14 Sep 2026 17:50:02 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 00/19] drm: starfive: jh7110: Enable display
 subsystem
To: Dominique Belhachemi <domibel@debian.org>, Maud Spierings
	<maud_spierings@murena.io>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
	Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrzej
	Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, Laurent
	Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli
	<luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>, Simona Vetter
	<simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
	Lee Jones <lee@kernel.org>, Andy Yan <andy.yan@rock-chips.com>, Philipp
	Zabel <p.zabel@pengutronix.de>, Emil Renner Berthing <kernel@esmil.dk>, Hal
	Feng <hal.feng@starfivetech.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Brian Masney
	<bmasney@redhat.com>, Heiko Stuebner <heiko@sntech.de>, Conor Dooley
	<conor@kernel.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>, Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
	<jbrunet+clk@baylibre.com>, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org, mfd@lists.linux.dev,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, Andy
	Yan <andyshrk@163.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Graham
	Markall <hello@big-grey.co.uk>, Icenowy Zheng <zhengxingda@iscas.ac.cn>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <CAAvaLCzU_-JdPHSSQS2HxGnrkRk+u_QOZ91SmxcC+nouubCtXA@mail.gmail.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260914155004eucas1p298df2ff60a38fa5dc11e23802962b7f3
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260904132708eucas1p1adfa26ef0fe5109eca63a3aeadf74915
X-EPHeader: CA
X-CMS-RootMailID: 20260904132708eucas1p1adfa26ef0fe5109eca63a3aeadf74915
References: <CGME20260904132708eucas1p1adfa26ef0fe5109eca63a3aeadf74915@eucas1p1.samsung.com>
	<20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
	<ea529e06-2eab-4e3b-92af-ba17de44091c@murena.io>
	<CAAvaLCzU_-JdPHSSQS2HxGnrkRk+u_QOZ91SmxcC+nouubCtXA@mail.gmail.com>



On 9/6/26 05:55, Dominique Belhachemi wrote:
> On Sat, Sep 5, 2026 at 1:21 AM Maud Spierings <maud_spierings@murena.io>
> wrote:
> 
>> Hello Michal,
>>
>> This new version added some more issues on my fml13v01 board, this time
>> 2 registers in the VOUT_CRG are misconfigured that were correct in v2,
>> namely:
>>
>> 0x295c0004 was 0x00000004 on the previous version but is now 0x00000006
>> 0x295c001c was 0x81000000 on the previous version but is now 0x80000000
>>
>> xx04 sets a slightly different clock divider, but it doesn't seem to
>> matter, display also works with this changed value.
>>
>> xx1c seems to select the wrong clock mux?
>>
>> After correcting 0x295c001c (and the ones that I mentioned before in the
>> hdmitx block), the display comes to life again.
>>
>> Not sure why these are changed.
>>
>> Same here on a VisionFive 2. The dc8200_pix0 mux register (0x295c001c)
> comes up 0x80000000 instead of 0x81000000 (which selects hdmitx0_pixelclk
> from the PHY).
> 
> v3 added CLK_SET_RATE_NO_REPARENT to stop clk_set_rate() from silently
> switching which clock feeds the display, but nothing then assigns the
> parent,
> so it is left on whatever the bootloader selected.
> 
> You could pin the two pixel-clock muxes to the HDMI PHY, is that acceptable?
> 
> dc8200: display@29400000 {
>   +                             assigned-clocks = <&voutcrg
> JH7110_VOUTCLK_DC8200_PIX0>,
>   +                                               <&voutcrg
> JH7110_VOUTCLK_DC8200_PIX1>;
>   +                             assigned-clock-parents = <&hdmi_phy>,
> <&hdmi_phy>;
> };
> 
> I tested this on the vf2.

Thank you Maud and Dominique,


I've tested this as well and it does seem like a good fix, will include
this in a v4.

> 
> Best
> -Dominique
> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>
