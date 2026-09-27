Received: from mailout1.w1.samsung.com (mailout1.w1.samsung.com [210.118.77.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7C7D3B14D5;
	Sun, 27 Sep 2026 15:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=210.118.77.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790522825; cv=none; b=uknK2QYZOdAGUoAdzp1T5MW6X0z04un3+hbRRzVTgm7Zdum4xs9XUZXD/2QDDHfgx+nQkJGqOE+4pt2u+w9n4ficCzsER5hSWE1R6I2dKH952e4jDYfCd9IL0cMQMNUNAzqc1LZdBjjN5Ic4T7bu/95CI7D9UyFYzQsq6DrOhZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790522825; c=relaxed/simple;
	bh=ZJif99HrM3tONVAFov7W+Nz1FkXr7HloM1H9lUZ80zI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:From:In-Reply-To:
	 Content-Type:References; b=SOioAyxCP4tuDsirPkgQRN/3TLGFwCyZxBRnqtyKKNrgupcHxEuDB5Q96ax/IIg9bMfphn/ZoCHzchMF1x7p8aqFamQjz3oDBxFROEn5sv8kM4hkQ4T55xX1895seoH7SrDMcIR3Y4xjlJzSeEVlXYBzwX20ek2l+5OUluK0yZg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com; spf=pass smtp.mailfrom=samsung.com; dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b=gjg9eQOW; arc=none smtp.client-ip=210.118.77.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=samsung.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=samsung.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=samsung.com header.i=@samsung.com header.b="gjg9eQOW"
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20260927152657euoutp01fee60fb85c8f744f5b23de099f9efd5d~ZNwQwVanT0796507965euoutp01Z;
	Sun, 27 Sep 2026 15:26:57 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20260927152657euoutp01fee60fb85c8f744f5b23de099f9efd5d~ZNwQwVanT0796507965euoutp01Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1790522818;
	bh=552yr90urBhvBvN6cAihy9SNDNfGhvxsBdcKYn8Bqkg=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=gjg9eQOWA0CxY3ngNhBHqtz1JM3KKcYnvAXf1eQWIfGbzS+ettayDylBqirZGSDZ0
	 4/LXiCaTIPkLLVpd5a2xD3aFHM5RQsqbdNfRkqEjajd72YE31sUYSbxWhMeTWRmQ+F
	 TWdrCd/edX3NzOp1vM2aOWlWptW3UGr6cosY45Yg=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260927152656eucas1p1473e0b9575b6efc4ccc01e99783bf8aa~ZNwPrSQNF0222902229eucas1p1j;
	Sun, 27 Sep 2026 15:26:56 +0000 (GMT)
Received: from [192.168.1.44] (unknown [106.210.136.40]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260927152655eusmtip1c51d14fba318ce4acae93d017ad71be3~ZNwOCLRV_3134331343eusmtip1g;
	Sun, 27 Sep 2026 15:26:55 +0000 (GMT)
Message-ID: <a74ccc09-ed64-4915-ab85-232c6d953c3d@samsung.com>
Date: Sun, 27 Sep 2026 17:26:54 +0200
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 05/20] dt-bindings: display: verisilicon: Add
 starfive,jh7110-dc8200
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Andrzej Hajda <andrzej.hajda@intel.com>, Robert Foss
	<rfoss@kernel.org>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, Lee Jones <lee@kernel.org>, Andy
	Yan <andy.yan@rock-chips.com>, Philipp Zabel <p.zabel@pengutronix.de>, Emil
	Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>,
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Heiko Stuebner <heiko@sntech.de>, Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Dominique
	Belhachemi <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>, Jerome
	Brunet <jbrunet+clk@baylibre.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	mfd@lists.linux.dev, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
	linux-riscv@lists.infradead.org, Marek Szyprowski
	<m.szyprowski@samsung.com>, Maud Spierings <maud_spierings@murena.io>,
	Graham Markall <hello@big-grey.co.uk>, Chaoyi Chen
	<chaoyi.chen@rock-chips.com>, Joshua Peisach <jpeisach@ubuntu.com>,
	=?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Content-Language: en-US
From: Michal Wilczynski <m.wilczynski@samsung.com>
In-Reply-To: <1aa49a9bcf5c5a16ce38b57f8f508a31ca70c1ce.camel@iscas.ac.cn>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260927152656eucas1p1473e0b9575b6efc4ccc01e99783bf8aa
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260915153222eucas1p213b95b05ea7eb9a18700af8888ef5a44
X-EPHeader: CA
X-CMS-RootMailID: 20260915153222eucas1p213b95b05ea7eb9a18700af8888ef5a44
References: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
	<CGME20260915153222eucas1p213b95b05ea7eb9a18700af8888ef5a44@eucas1p2.samsung.com>
	<20260915-jh7110-clean-send-v4-5-f0e4fd6f2cc8@samsung.com>
	<1aa49a9bcf5c5a16ce38b57f8f508a31ca70c1ce.camel@iscas.ac.cn>



On 9/18/26 07:58, Icenowy Zheng wrote:
> 在 2026-09-15二的 17:32 +0200，Michal Wilczynski写道：
>> The JH7110 embeds a DC8200. The binding requires an SoC specific
>> compatible ahead of the generic one, so add the JH7110 to the enum.
>>
>> Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
>> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
>> ---
>>  Documentation/devicetree/bindings/display/verisilicon,dc.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git
>> a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> index
>> 919a9001220120054cb62d1d01b7293367266f95..05a202633cd273fec358c095c64
>> 584d959d96d90 100644
>> --- a/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> +++ b/Documentation/devicetree/bindings/display/verisilicon,dc.yaml
>> @@ -16,6 +16,7 @@ properties:
>>    compatible:
>>      items:
>>        - enum:
>> +          - starfive,jh7110-dc8200
> 
> Note: this binding is being refactored as part of MA35D1 support
> introduction (this SoC has a single-port DC like a DC8000), after the
> refactor the binding string might need to appear twice.
> 
> Thanks,
> Icenowy

Hi,
Thank you for letting me know. I've found the patchset on the mailing
list [1]. Will make sure to rebase (and fix) after it gets in
(presumably before this one although I'm not 100% sure).

[1] - https://lore.kernel.org/all/20260918030125.315978-2-a0987203069@gmail.com/


> 
>>            - thead,th1520-dc8200
>>        - const: verisilicon,dc # DC IPs have discoverable ID/revision
>> registers
>>  
> 
> 

Best regards,
-- 
Michal Wilczynski <m.wilczynski@samsung.com>
