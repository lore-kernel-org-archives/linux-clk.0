Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793007359;
	b=e+k6PromMw2ySElwztaNT4qH+GgOgj3KIuepfrqtzAc48CDVLMbja5/LHtT7gYHwYP6I
	 lx7fhFzyFe5D2uTOMlJJOcNfO1ddVtKnLIx9aYiWAKHzvSji01POa8K5Ga3xtCgJQ2yE1
	 hHobSN+GZ3ONLP8ERJhA4DMCj8/EeofPLwl1eLU1mc/zOpd5J+ixmgRWC6ar1UVU+qHhp
	 JdBrbFUFVP0uzFXbGsQEwij/iRv+Gi2yOj/zCq4ifnhtLanRN6DOk4oiKKRytd/hbgyQJ
	 nTRDo8JR/l2inYS/gLf2neReWc3Sh7I20rcPeqi7e465YPgnxq48wHu53c4MqKcpm1Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793007359;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=VFODzkL0uZKqAQNJlwuJ0urPIasvytjg0AYOEPZU5zo=;
	b=hzHA0C+Hflp6nikaS7Egz9X66pHm/E6VjjELiSdM8dbH0Ov2MgIUPdZ/DRfXr8OWnhnt
	 Ui4v7Q9vHHexsfRaWKTBHuN0kMNiINIvsUGYRlbXlCKWcbz1RV5YPz9UVPkPcCvn5BSdy
	 gxiglASMksOtnz9Qp/fGzfG/ansC7tUpXkXDx6isZ6vXaSGMjwtNKje2IEnL/vEMJxaL9
	 ++/sjmqNeJmbfA71MX+fnovsC3nYGDAow10/WHIYkXRJL/efsm1inaj2giTj9FZpPz7YP
	 kKyFq0uQS13ili73VouhKAxRxcJy5bg1MYFBHuwvbTGi96Vj3Ri7bfaYkpWJtH6ZXPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=RqW5HTEa;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52955606A330;
	Mon, 26 Oct 2026 09:35:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 52955606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=RqW5HTEa
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261026093555euoutp02a4f8ef91b3aa86db8377679f1fea21f3~iCrCSbcTY2220622206euoutp02z;
	Mon, 26 Oct 2026 09:35:55 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261026093555euoutp02a4f8ef91b3aa86db8377679f1fea21f3~iCrCSbcTY2220622206euoutp02z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793007355;
	bh=VFODzkL0uZKqAQNJlwuJ0urPIasvytjg0AYOEPZU5zo=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=RqW5HTEaNhWXEMVANk/YHAMMX8/dwCZWph+Ca2yKfPmYIy8BFS4/U4C9twdIr+UeX
	 QQj7izTKUN4zPTGhk2FSTcJXvoitoLuZSmFW4i2VhBoIqOo++UzmfaAXt+zaWlDO3D
	 8dN0UXbMVG/fgniVdQCdj/JaK1o4NscJjHJA/erI=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261026093554eucas1p27ee3526a6b2fdb9f2c6c35e69ac09fe9~iCrBitmg73152231522eucas1p2n;
	Mon, 26 Oct 2026 09:35:54 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20261026093552eusmtip250daa3502a30759f756704eb1d885faf~iCq-4FCDh0127501275eusmtip2b;
	Mon, 26 Oct 2026 09:35:52 +0000 (GMT)
Message-ID: <3aee23e0-1a9e-4649-b9ac-72012f9feaa6@samsung.com>
Date: Mon, 26 Oct 2026 10:35:52 +0100
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 19/21] phy: starfive: Add jh7110-inno-hdmi-phy driver
To: Vinod Koul <vkoul@kernel.org>
Cc: Manivannan Sadhasivam <mani@kernel.org>, Neil Armstrong
	<neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Krzysztof
	Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Andrzej
	Hajda <andrzej.hajda@intel.com>, Robert Foss <rfoss@kernel.org>, Laurent
	Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Luca Ceresoli
	<luca.ceresoli@bootlin.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Andy Yan <andy.yan@rock-chips.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Emil Renner Berthing
	<kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Heiko Stuebner
	<heiko@sntech.de>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt
	<palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti
	<alex@ghiti.fr>, Dominique Belhachemi <db@domibel.de>, Brian Masney
	<bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>,
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-riscv@lists.infradead.org, Marek
	Szyprowski <m.szyprowski@samsung.com>, Maud Spierings
	<maud_spierings@murena.io>, Graham Markall <hello@big-grey.co.uk>, Icenowy
	Zheng <zhengxingda@iscas.ac.cn>, Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	Joshua Peisach <jpeisach@ubuntu.com>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
	<u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <asEQPf-oKbt_DSp3@parshuram>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20261026093554eucas1p27ee3526a6b2fdb9f2c6c35e69ac09fe9
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260929103245eucas1p1349d00810646fbf0149f1361534c23ac
X-EPHeader: CA
X-CMS-RootMailID: 20260929103245eucas1p1349d00810646fbf0149f1361534c23ac
References: <20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com>
	<CGME20260929103245eucas1p1349d00810646fbf0149f1361534c23ac@eucas1p1.samsung.com>
	<20260929-jh7110-clean-send-v5-19-82b4d8e3c6c7@samsung.com>
	<asEQPf-oKbt_DSp3@parshuram>



On 10/3/26 16:25, Vinod Koul wrote:
> On 29-09-26, 12:31, Michal Wilczynski wrote:
>> Add the HDMI PHY driver for the StarFive JH7110.
>>
>> This driver binds to the starfive,jh7110-inno-hdmi-phy node and
>> gets its regmap from the parent. It has no dependencies on voutcrg, only
>> on its reference oscillator (xin24m), which breaks the probe-time
>> circular dependency.
>>
>> This driver provides two main functions:
>>  - Clock Provider: It registers clk_ops to provide the variable pixel
>>    clock. The .set_rate operation configures the Pre-PLL registers
>>    (0x1a0+) based on the requested rate.
>>
>>  - PHY Provider: It registers phy_ops for the controller. The .power_on
>>    op configures and enables the Post-PLL and other analog blocks (BIAS,
>>    LDO, Serializer, etc.).
>>
>> The clock ops reach registers in the window shared with the HDMI
>> controller, and access to that window is gated by the controller's
>> system clock, which only the sibling controller driver holds. The clock
>> framework walks every registered clock regardless of which drivers have
>> bound, so deliberately do not implement .is_prepared, which lets the
>> framework fall back to the software prepare count, and return the cached
>> rate from .recalc_rate whenever the clock is not prepared. Without this,
>> clk_disable_unused() reads a PHY register with that clock gated and the
>> resulting stalled bus transaction wedges the CPU hard enough that it
>> stops responding to NMIs. It is reproducible by building the bridge
>> driver as a module so that the controller has not bound by then.
>>
>> The JH7110 instantiates the same Innosilicon IP as the Rockchip RK3328,
>> with the PHY register block shifted by 0x100 because it sits behind the
>> HDMI controller in the shared register space. The pre-PLL programming
>> therefore comes from the common Innosilicon helpers; this driver adds
>> the JH7110 pixel clock table, the post-PLL and the analog configuration.
>>
>> Co-developed-by: Dominique Belhachemi <db@domibel.de>
>> Signed-off-by: Dominique Belhachemi <db@domibel.de>
>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>> ---
>>  drivers/phy/starfive/Kconfig                |  20 +
>>  drivers/phy/starfive/Makefile               |   1 +
>>  drivers/phy/starfive/phy-jh7110-inno-hdmi.c | 582 ++++++++++++++++++++++++++++
>>  3 files changed, 603 insertions(+)
>>
>> +						 STF_INNO_TMDS_D1_DRIVER_EN | \
>> +						 STF_INNO_TMDS_D0_DRIVER_EN)
>> +
>> +/* REG: 0x1b4 */
>> +#define STF_INNO_LDO_CONTROL			0x1b4
>> +#define STF_INNO_LDO_ENABLE			(BIT(2) | BIT(1) | BIT(0))
>> +
>> +/* REG: 0x1be */
>> +#define STF_INNO_SERIALIER_CONTROL		0x1be
>> +#define STF_INNO_SERIALIER_ENABLE		(BIT(6) | BIT(5) | BIT(4) | BIT(0))
>> +
>> +/* REG: 0x1cc */
>> +#define STF_INNO_RX_CONTROL			0x1cc
>> +#define STF_INNO_RX_ENABLE			(BIT(3) | BIT(2) | BIT(1) | BIT(0))
>> +
>> +/*
>> + * These tables are copied from the monolithic driver.
>> + * They match the Rockchip PHY driver tables.
>> + */
>> +
>> +struct post_pll_config {
>> +	unsigned long tmdsclock;
>> +	u8 prediv;
>> +	u16 fbdiv;
>> +	u8 postdiv;
>> +	u8 post_div_en;
>> +};
>> +
>> +static const struct inno_hdmi_phy_pre_pll_config pre_pll_cfg_table[] = {
>> +	{ 25175000, 25175000, 1, 100, 2, 3, 3, 12, 3, 3, 4, 0, 0xF55555 },
> 
> lower case hex values, here and everywhere else please


Sure will fix this.

> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>
