Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949C23043DE;
	Tue,  1 Sep 2026 14:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788272116; cv=none; b=kHJxV6L6VpzPhLpmz23mfTPyjFBMHAcnCtT4oTXhoIO1vt/slkfdET61D1uHkJLYkpPakwe2A57F78dtqnvAcCk7q6omZd/BmJSYgvyuR15m9zXlJion6Yh+uD0pLM/ZzUVn674gtBQs4YGH7ueNxJ2yhvV/U46wh6h9u5OgWIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788272116; c=relaxed/simple;
	bh=PJDVS0bJN0XEfpHEOX7TFqDVTTUAwV93MzlnKQXI65I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=srdhM7JvTDGM3SUPnXGZBNS6syyH20H0sDaXgm03oYUpsVAVbcLMhsi7gH3lPFIFsxTMoP1+eB8qTTkcG7t6YwZt+w2AGbWvCusvsYQHf1riduZjsTXzqHLKqdxplZw+kKgJvHGPHyoOvDgA72QeDF5Q8joDx77e52GA1Mfz4FQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=FI9HGXNV; arc=none smtp.client-ip=210.118.77.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="FI9HGXNV"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260901141504euoutp02f8cf59604fcc0bb3e97ba307ffda0a3a~ROAEy4Y3I1223512235euoutp02b;
	Tue,  1 Sep 2026 14:15:04 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260901141504euoutp02f8cf59604fcc0bb3e97ba307ffda0a3a~ROAEy4Y3I1223512235euoutp02b
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1788272104;
	bh=2nW3DmaEwtQqmdcgqJ0ClmdaBE1cGoZ7pcvRuf3Yst4=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=FI9HGXNVyamhN2zlQXR4CDPmMvub+hQK2T7ZBv5DkCgQPnby1w+gTVZUh41hlg+KR
	 5ny8AyyOmQlmxO76627Rk1f6+fa9NHdeszWgDcCUqsh3yBThzUR5IsBAQipbYRojBC
	 INCm0GUIqJFBdpcJ/FMR+S//fjPKiXb3VraxvlOY=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260901141504eucas1p156346e8510ccf68f19fc29333c31cfe7~ROAEgxzXG3199331993eucas1p12;
	Tue,  1 Sep 2026 14:15:04 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260901141502eusmtip277e141767fe1c923ccc834fdf6eb451f~ROACyv4-D1277812778eusmtip20;
	Tue,  1 Sep 2026 14:15:02 +0000 (GMT)
Message-ID: <b41f260d-2308-4853-8d3b-22cba534e4e2@samsung.com>
Date: Tue, 1 Sep 2026 16:15:02 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 14/15] riscv: dts: starfive: jh7110: Update DT for
 display subsystem
To: Icenowy Zheng <uwu@icenowy.me>, Vinod Koul <vkoul@kernel.org>, Neil
	Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss
	<rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>, Andy
	Yan <andy.yan@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>, Emil
	Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Heiko Stuebner
	<heiko@sntech.de>, Conor Dooley <conor@kernel.org>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Dominique
	Belhachemi <db@domibel.de>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	mfd@lists.linux.dev, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org, Andy Yan <andyshrk@163.com>, Marek
	Szyprowski <m.szyprowski@samsung.com>, Maud Spierings
	<maudspierings@gocontroll.com>, Graham Markall <hello@big-grey.co.uk>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <e0e0c41c4c6b0b674c4cfc3b6927d60c40fbf733.camel@icenowy.me>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260901141504eucas1p156346e8510ccf68f19fc29333c31cfe7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260828134839eucas1p2d19363d17d4dbf5a7ae5228444af16fa
X-EPHeader: CA
X-CMS-RootMailID: 20260828134839eucas1p2d19363d17d4dbf5a7ae5228444af16fa
References: <20260828-jh7110-clean-send-v2-0-331680c8b9d1@samsung.com>
	<CGME20260828134839eucas1p2d19363d17d4dbf5a7ae5228444af16fa@eucas1p2.samsung.com>
	<20260828-jh7110-clean-send-v2-14-331680c8b9d1@samsung.com>
	<e0e0c41c4c6b0b674c4cfc3b6927d60c40fbf733.camel@icenowy.me>



On 8/28/26 16:06, Icenowy Zheng wrote:
> 在 2026-08-28五的 15:47 +0200，Michal Wilczynski写道：
>> Activate the display subsystem by adding the dc8200, hdmi and voutcrg
>> nodes as direct soc children. Each references the PD_VOUT power
>> domain
>> through power-domains, so genpd powers the domain on demand, and the
>> HDMI-PHY -> voutcrg -> HDMI-controller probe order is resolved by
>> deferred probe.
>>
>> The monolithic hdmi node is modelled as a container with hdmi_phy
>> and hdmi_controller children. This lets the PHY (clock provider,
>> depending only on xin24m) and the controller (clock consumer) probe
>> independently, breaking the circular clock dependency with voutcrg.
>>
>> voutcrg consumes the pixel clock from the &hdmi_phy node instead of
>> the
>> old fixed-clock, and dc8200 gets its pixel clocks from voutcrg's
>> MUXes
>> and is marked dma-noncoherent for framebuffer DMA. The old, incorrect
>> hdmitx0-pixel-clock fixed-clock node is removed.
>>
>> Co-developed-by: Dominique Belhachemi <db@domibel.de>
>> Signed-off-by: Dominique Belhachemi <db@domibel.de>
>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>> +		compatible = "fixed-clock";
>> +		#clock-cells = <0>;
>> +		clock-frequency = <24000000>;
>> +		clock-output-names = "xin24m";
>> +	};
>> +
>>  	soc {
>>  		compatible = "simple-bus";
>>  		interrupt-parent = <&plic>;
>> @@ -1199,22 +1200,92 @@ csi_phy: phy@19820000 {
>>  			#phy-cells = <0>;
>>  		};
>>  
>> +		dc8200: display@29400000 {
>> +			compatible = "verisilicon,dc";
>> +			reg = <0x0 0x29400000 0x0 0x2800>;
>> +			interrupts = <95>;
>> +			dma-noncoherent;
>> +
>> +			power-domains = <&pwrc JH7110_PD_VOUT>;
>> +
>> +			clocks = <&voutcrg
>> JH7110_VOUTCLK_DC8200_CORE>,
>> +				<&voutcrg
>> JH7110_VOUTCLK_DC8200_AXI>,
>> +				<&voutcrg
>> JH7110_VOUTCLK_DC8200_AHB>,
>> +				<&voutcrg
>> JH7110_VOUTCLK_DC8200_PIX0>,
>> +				<&voutcrg
>> JH7110_VOUTCLK_DC8200_PIX1>;
>> +			clock-names = "core", "axi", "ahb", "pix0",
>> "pix1";
>> +
>> +			resets = <&voutcrg
>> JH7110_VOUTRST_DC8200_CORE>,
>> +				 <&voutcrg
>> JH7110_VOUTRST_DC8200_AXI>,
>> +				 <&voutcrg
>> JH7110_VOUTRST_DC8200_AHB>;
>> +			reset-names = "core", "axi", "ahb";
>> +		};
>> +
>> +		hdmi_subsystem: hdmi@29590000 {
>> +			compatible = "starfive,jh7110-hdmi-
>> subsystem";
>> +			reg = <0x0 0x29590000 0x0 0x4000>;
>> +
>> +			/*
>> +			 * This MFD's PHY child is the first device
>> in the vout
>> +			 * region to touch registers, so it owns the
>> NoC display
>> +			 * bus clock + reset that gate access to the
>> region.
>> +			 * PD_VOUT is powered on by genpd via power-
>> domains.
>> +			 */
>> +			power-domains = <&pwrc JH7110_PD_VOUT>;
>> +			clocks = <&syscrg
>> JH7110_SYSCLK_NOC_BUS_DISP_AXI>;
>> +			resets = <&syscrg
>> JH7110_SYSRST_NOC_BUS_DISP_AXI>;
> 
> I think the NOC clocks/resets should be also needed by the DC8200
> either?
> 
> Although patching the DC8200 driver to add support for these
> clocks/resets looks a little dirty...
> 
> Maybe it's still good to have a vout subsys instead of a hdmi subsys...

Yeah that was the idea as it was modeling hardware correctly, however
indirectly it works thanks to the probing order. The problem with the
extra vout subsys as shown in the RFC was that an extra driver and extra
dt-binding were needed which seemed to complicate things a bit. But it
does seem more correct in a sense that it's modeling the relationship
correctly so I'll bring it back for v3.


Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

> 
> Thanks,
> Icenowy
> 


