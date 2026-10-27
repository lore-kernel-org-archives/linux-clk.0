Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=210.118.77.12
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793098944;
	b=XHrZeCFVab/ye4xmnQh3stBF7qa4KX6Pdo8DEoR8LoTI5vCto1g8WcaeV+estKNBlKY7
	 hYu3kwF04aoBHDgIy2DHvUJMBfH26+LFayxl+rgGQQqvpraN7X2BWSdrEgq13h5H+zCi4
	 oXQw5mYskTYADHT+KX5NHndgBc8NsAiMPtWI3U4w9GitC2/dehfVgNcP9L2ivSzlz3eDM
	 /CGLbrDBskKaYKafNRankFSD57hRhm2qq7t9H3GE0Ja6sIOjECHpXgVk3Km7y32xG5om1
	 R5g8//Ug4WMqEfg8dVLO313f57d8cfD0hRUNgAUDaLpx0HX+wtZ84l/uMH8tPXG4fVQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793098944;
	h=DMARC-Filter:Received:DKIM-Filter:DKIM-Signature:Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 Content-Language:From:In-Reply-To:Content-Transfer-Encoding:
	 X-CMS-MailID:X-Msg-Generator:Content-Type:X-RootMTR:X-EPHeader:
	 X-CMS-RootMailID:References;
	bh=jgpI6S0BaFwhfvc2kywHp6Ib11nXJqnK3KboerxnZkI=;
	b=vzfF1Br58md89zK3NyF+w+4xFBJ2jdLsXysBUYjHHZRCMcmOAAYrx3nCqOX7yT5f5Cva
	 SmfMATSsRdZ4hrrcQbc28tDwh1Up0tnySAHAzKRwNYrMI0kn3uwmQA11g6sqRjcwaFyHt
	 zWfOZqPMfuxRI2+8FSO8rOGXnFB5eYFiR5Un9gSsJ7YJxDxQjX3ac1kmcARFbvGMKLx3U
	 G4wyNxPvaQAHCLzdm74ibCNgkqzeJDhg4BFIjIdcuhg/uNoaN36PcRjnC+f4XtMMYwGez
	 Xd8LLOotfAe4pCINFLTX2r3ZTwxFFG01/AxPCMUZ5Zl0GijH/Qd94QwoJlGg3xNMVzA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=samsung.com;
	spf=pass smtp.mailfrom=samsung.com;
	dkim=pass header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=nWQGHyd3;
	arc=none smtp.remote-ip=210.118.77.12
Received: from mailout2.w1.samsung.com (mailout2.w1.samsung.com [210.118.77.12])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9DDB3606A331;
	Tue, 27 Oct 2026 11:02:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 9DDB3606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=samsung.com header.i=@samsung.com header.a=rsa-sha256 header.s=mail20170921 header.b=nWQGHyd3
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20261027110211euoutp02cbe365840510890b9fa3fbb50e26a3cf~iXfpITuJq1916619166euoutp02O;
	Tue, 27 Oct 2026 11:02:11 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20261027110211euoutp02cbe365840510890b9fa3fbb50e26a3cf~iXfpITuJq1916619166euoutp02O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1793098931;
	bh=jgpI6S0BaFwhfvc2kywHp6Ib11nXJqnK3KboerxnZkI=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=nWQGHyd3uZO8npHAsI3x3z0bNTOciXEMk5qhW0TGGp6BSguiBE0ZHfqmHLqbvDF0H
	 jAsgFMaUbTRuJ/IN+QVwxm1C8lUaP1wIQPSboyhdv4t1SqODkP1rSY8nYzjAcyepN4
	 5vIolx8QDptEdhqq8Oq8lgHHH5v1igum0Z1fTOLc=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20261027110210eucas1p200692a459e47eae4b88f5f8620738cfd~iXfokDezE2283022830eucas1p2N;
	Tue, 27 Oct 2026 11:02:10 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20261027110208eusmtip1bba8e474a6d53be6ac9f0bd553f1da2d~iXfm8DZVs2613526135eusmtip1G;
	Tue, 27 Oct 2026 11:02:08 +0000 (GMT)
Message-ID: <b9380a0a-49f1-4bb9-a6b7-ca233319b8ad@samsung.com>
Date: Tue, 27 Oct 2026 12:02:08 +0100
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
Subject: Re: [PATCH v5 18/21] phy: rockchip: inno-hdmi: Use the common
 Innosilicon PHY helpers
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, Vinod Koul
	<vkoul@kernel.org>, Manivannan Sadhasivam <mani@kernel.org>, Neil Armstrong
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
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Dominique
	Belhachemi <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>, Jerome
	Brunet <jbrunet+clk@baylibre.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
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
In-Reply-To: <7069377.kQq0lBPeGt@diego>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20261027110210eucas1p200692a459e47eae4b88f5f8620738cfd
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260929103243eucas1p25abf97a357cfae14640092e35fe479fc
X-EPHeader: CA
X-CMS-RootMailID: 20260929103243eucas1p25abf97a357cfae14640092e35fe479fc
References: <20260929-jh7110-clean-send-v5-0-82b4d8e3c6c7@samsung.com>
	<CGME20260929103243eucas1p25abf97a357cfae14640092e35fe479fc@eucas1p2.samsung.com>
	<20260929-jh7110-clean-send-v5-18-82b4d8e3c6c7@samsung.com>
	<7069377.kQq0lBPeGt@diego>



On 9/30/26 12:14, Heiko Stübner wrote:
> Am Dienstag, 29. September 2026, 12:31:15 Mitteleuropäische Sommerzeit schrieb Michal Wilczynski:
>> The RK3328 pre-PLL programming, its table lookup and its recalc_rate and
>> determine_rate implementations are the generic Innosilicon ones, so drop
>> the local copies and use the shared helpers instead.
>>
>> The RK3228 pre-PLL sits at different register addresses, so it keeps its
>> own register level code and only shares the table lookup.
>>
>> The now unused RK3328 pre-PLL register macros go with it, as does the
>> local pre-PLL config lookup wrapper; both call sites already have the
>> TMDS clock to hand and call inno_hdmi_phy_pre_pll_lookup() directly.
>>
>> The RK3328 recalc_rate used to log the pre-PLL output as "vco". The
>> shared helper logs it too, and reports the actual VCO frequency
>> alongside the rate, which is the value with the 1.4-3.2 GHz constraint.
>>
>> The register writes, their order and the values written are unchanged.
>> No functional change intended.
>>
>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>> Reviewed-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
> 
> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
> 
> Only thing I cannot really make up my mind about, is if this and the
> previous patch should be merged ("move common code from rockchip
> variant to shared helper").
> 
> As I said, can't really decide what would be the better solution ;-) .

I split them deliberately as I don't have Rockchip hardware. It's easier
to verify this commit's correctness and the claims 'no functional change
intended' and 'the register writes, their order and the values written
are unchanged' when split, as the previous commit only adds the library
and this one only deletes the RK3328 copy and calls into it.

> 
> 
> Heiko
> 
> 
> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>
