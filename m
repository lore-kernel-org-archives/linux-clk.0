Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46E723DB332;
	Mon, 14 Sep 2026 19:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789414737; cv=none; b=EsJiy5ywc3Gz4hjDQ78BBzx98lM7DdbAQoHLQpHhBwdUpmBRkilKF9JOSV6O4JzMDuWtspfFCpdWmaHBzArQjRizSEohyQ7DgVwp69QnUMtb1DqGYXkePot6+e1pfBNxkO731+RX/dEFAMUhjXqcF0lSf4fKfbGgYhlBw19q2lo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789414737; c=relaxed/simple;
	bh=slQN8zGDUmYs9br0zIMXRpsNo5O7uLthjpuA9U0b8rM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=Vp/e1PJvm2SfLmALqW0ClQANvlbUudx6mC/lLXcn0NHMGMR+13oVGmqy54RINJt+FilvjEG04lzMSnNkQ863xmDHvM3BTRQ6nB68CWM7RGRb/IjZlcbaUtoVGHowD+IBmaLpDvUSSbqyIY5rpdTFXv/PEES+yi86UTwOF0jeYac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=WTY8xEi6; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="WTY8xEi6"
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260914193842euoutp01953e61d38ec40643bc4d7157964f6df4~VRzWra7uK0314903149euoutp01E;
	Mon, 14 Sep 2026 19:38:42 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260914193842euoutp01953e61d38ec40643bc4d7157964f6df4~VRzWra7uK0314903149euoutp01E
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1789414722;
	bh=l4wDoWVeNywfcIR5L4rg3J/vDfSoW2zWF07vjDkO78A=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=WTY8xEi6jJOa1gLnOSUBPvlQpMk4v2dS5Nlb2zkZtStSIF1Pr3VZihsDFbmaj+Y4h
	 48ffokqJfJoWOeBrkZRq1liliRT+IYnxf1/b09yAMsjlsgBoE69rhThGKgRG7auZzS
	 XuVmAtFsH2iSO/zueW7kE3R3lnmCSs0qp5222L1M=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260914193842eucas1p27f2871f925584e946f2bb24c04b38b90~VRzWUs-Iu3205232052eucas1p2N;
	Mon, 14 Sep 2026 19:38:42 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260914193840eusmtip1c6e3388713b55ee3f14ee6a855ba8b6e~VRzUiiOIx1812818128eusmtip1N;
	Mon, 14 Sep 2026 19:38:40 +0000 (GMT)
Message-ID: <fcfdd9da-8425-4cf9-94ba-23b06cd06185@samsung.com>
Date: Mon, 14 Sep 2026 21:38:40 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 18/19] riscv: dts: starfive: jh7110: Update DT for
 display subsystem
To: Krzysztof Kozlowski <krzk@kernel.org>
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
	<alex@ghiti.fr>, Dominique Belhachemi <db@domibel.de>, Brian Masney
	<bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	mfd@lists.linux.dev, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org, Andy Yan <andyshrk@163.com>, Marek
	Szyprowski <m.szyprowski@samsung.com>, Maud Spierings
	<maud_spierings@murena.io>, Graham Markall <hello@big-grey.co.uk>, Icenowy
	Zheng <zhengxingda@iscas.ac.cn>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <20260910-determined-fantastic-seriema-3ff701@quoll>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260914193842eucas1p27f2871f925584e946f2bb24c04b38b90
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260904132743eucas1p1e02218d3fb38af95c3dd4bfa24904cab
X-EPHeader: CA
X-CMS-RootMailID: 20260904132743eucas1p1e02218d3fb38af95c3dd4bfa24904cab
References: <20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
	<CGME20260904132743eucas1p1e02218d3fb38af95c3dd4bfa24904cab@eucas1p1.samsung.com>
	<20260904-jh7110-clean-send-v3-18-484f9ae72715@samsung.com>
	<20260910-determined-fantastic-seriema-3ff701@quoll>



On 9/10/26 10:37, Krzysztof Kozlowski wrote:
> On Fri, Sep 04, 2026 at 03:27:19PM +0200, Michal Wilczynski wrote:
>> diff --git a/arch/riscv/boot/dts/starfive/jh7110.dtsi b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> index 9c3e4598747eb5541effe697044484715569a285..0f981f4c89586269b987be8591037c9461e04703 100644
>> --- a/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> +++ b/arch/riscv/boot/dts/starfive/jh7110.dtsi
>> @@ -290,12 +290,6 @@ gmac1_rmii_refin: gmac1-rmii-refin-clock {
>>  		#clock-cells = <0>;
>>  	};
>>  
>> -	hdmitx0_pixelclk: hdmitx0-pixel-clock {
>> -		compatible = "fixed-clock";
>> -		clock-output-names = "hdmitx0_pixelclk";
>> -		#clock-cells = <0>;
>> -	};
>> -
>>  	i2srx_bclk_ext: i2srx-bclk-ext-clock {
>>  		compatible = "fixed-clock";
>>  		clock-output-names = "i2srx_bclk_ext";
>> @@ -352,6 +346,13 @@ tdm_ext: tdm-ext-clock {
>>  		#clock-cells = <0>;
>>  	};
>>  
>> +	xin24m: xin24m {
> 
> Other clocks are called foo-clock, so follow this as well (even though
> it does not follow recommended practice of clock-foo, but at least some
> consistency).

will rename to to xin24m-clock

> 
> Best regards,
> Krzysztof
> 
> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>

