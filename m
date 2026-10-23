Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=65.21.61.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792744432;
	b=Q8Dl57MBb/ZKZFBs0Dh7jnPC2jRKdMFCnP6IlNKW8TPvSU5Yxi4VdEaUMHSmmBHB0q83
	 YwK5kEOgqF0rajGATcMpLT5swzF5aDi1LSUWUWC6APvK6KJ9FNFvcmGbx4Cu0/dB2yDZb
	 kb/7vzdNu8duzcCyN3NfDha3gY5QR6igZ0Seu9syOQaNm9lDGMNLr9x7kS53RGri0kuTC
	 h1bVoZBlMEj3OdRB8nxzrLi06MOP1iQ+s62QymD7EEN5noI8pxDZr7TDvwcAG0VVoOvFE
	 CIeHIyO3Y2HDbImM83zQ0QQV8H9921s00mhQiqrCDFqKq69vY9kDzkbwYHtDc/gFB+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792744432;
	h=DMARC-Filter:Message-ID:DKIM-Signature:Date:MIME-Version:User-Agent:
	 From:Subject:To:Cc:References:Content-Language:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=w3IRUU67Xyp23cczeFIC2oMuL/aNMCp0dTeCUBbAmNc=;
	b=OYEw9jaGC09gaNGNRvjxkzrbEYsFjMLveqJ7bjHlT7MglQW7uEmIt7Gm9p15zckinOLj
	 gcu6e4+jC/SRaYByKclsvB6ewPLVv8TSJvledIabohS5Fqxk8L3QRTjJy13D1ZT6hR2xJ
	 BDywiX52YyYL4KxhUdBocKqsvMA0Vge5+ORDh5deFToCoBxx0gzHphcXmJsax/cMMAQ8s
	 H7ycf2981/d/grSzcrLflLoqGsUZwuRwRMD8uOkqAVbJYD4fK7v8L9BdwoKJB5c5H6ACa
	 UBW3nKw/GIUY64WFeG5DgRueg/wmq/LeQsz9NlBUT4BeRExCnQ5C1bEfFBggQX12zdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=aliel.fr;
	spf=pass smtp.mailfrom=aliel.fr;
	dkim=pass header.d=aliel.fr header.i=@aliel.fr header.a=rsa-sha256 header.s=courrier-s1 header.b=uaZ6IZxL;
	arc=none smtp.remote-ip=65.21.61.41
Received: from courrier.aliel.fr (courrier.aliel.fr [65.21.61.41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F1C606A321
	for <linux-clk@vger.kernel.org>; Fri, 23 Oct 2026 08:33:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48F1C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=aliel.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=aliel.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=aliel.fr header.i=@aliel.fr header.a=rsa-sha256 header.s=courrier-s1 header.b=uaZ6IZxL
Message-ID: <023fc2b8-274f-4ecf-a10f-b4948ff431a3@aliel.fr>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1792744422;
	bh=wJPa3CPJhe0TddsJiu6BCdY+b+rdCFFUmUqxMimWaOA=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=uaZ6IZxL9gE7bSep95BjOc1cp/cqmZ2TvfO8pIyR2Xt0hTTFtYx5Qav5ZCQZmraeC
	 8aFxL0IzFTfom9g9UrDvKWFxbtFkZZMtS0rZymwrfsOCETtg5Zt9RgDmF3VO7M6pZL
	 jIExsL5/BkaUL+SiHMWCzGEk7V4pCNezCsLiawhk=
Date: Fri, 23 Oct 2026 10:31:14 +0200
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird Beta
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
Subject: Re: [PATCH 1/4] clk: meson: g12a: fix fclk_div2p5 multiplier
To: sashiko-reviews@lists.linux.dev
Cc: linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 neil.armstrong@linaro.org
References: <20261022-fix-g12a-clk-v1-0-e2bd8f3f1afa@aliel.fr>
 <20261022-fix-g12a-clk-v1-1-e2bd8f3f1afa@aliel.fr>
 <sashiko-outbox-182086@kernel.org>
Content-Language: en-US
In-Reply-To: <sashiko-outbox-182086@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 10/23/26 12:00 AM, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] clk: meson: g12a: incorrect rate for g12a_fclk_div2p5_div due to 4 GHz parent
> --
> 
> commit 63eec9c39f2ccd77037a929408928c357e150075
> Author: Ronald Claveau <linux-kernel-dev@aliel.fr>
> 
> clk: meson: g12a: fix fclk_div2p5 multiplier
> 
> This commit changes the multiplier of g12a_fclk_div2p5_div in
> drivers/clk/meson/g12a.c from 1 to 2 so that its fixed factor ratio becomes
> 2/5 instead of 1/5.
> 
>> diff --git a/drivers/clk/meson/g12a.c b/drivers/clk/meson/g12a.c
>> index d0d4c7b6dc827..4ec5f15daf980 100644
>> --- a/drivers/clk/meson/g12a.c
>> +++ b/drivers/clk/meson/g12a.c
>> @@ -995,7 +995,7 @@ static struct clk_regmap g12a_fclk_div7 = {
>>  };
>>  
>>  static struct clk_fixed_factor g12a_fclk_div2p5_div = {
>> -	.mult = 1,
>> +	.mult = 2,
>>  	.div = 5,
>>  	.hw.init = &(struct clk_init_data){
>>  		.name = "fclk_div2p5_div",
> 
> [Severity: High]
> Won't setting .mult = 2 here cause g12a_fclk_div2p5_div and g12a_fclk_div2p5
> to report 1.6 GHz instead of the expected 800 MHz when clk_fixed_factor_ops
> calculates the clock rate?
> 
> Unlike the other g12a_fclk_div*_div clocks in drivers/clk/meson/g12a.c, which
> use g12a_fixed_pll (~2 GHz) as their parent:
> 
> drivers/clk/meson/g12a.c:
> static struct clk_fixed_factor g12a_fclk_div5_div = {
> 	.mult = 1,
> 	.div = 5,
> 	.hw.init = &(struct clk_init_data){
> 		.name = "fclk_div5_div",
> 		.ops = &clk_fixed_factor_ops,
> 		.parent_hws = (const struct clk_hw *[]) { &g12a_fixed_pll.hw },
> 		.num_parents = 1,
> 	},
> };
> 
> g12a_fclk_div2p5_div is parented directly to g12a_fixed_pll_dco (~4 GHz),
> before the g12a_fixed_pll post-divider divides the DCO by 2:
> 
> drivers/clk/meson/g12a.c:
> static struct clk_fixed_factor g12a_fclk_div2p5_div = {
> 	.mult = 2,
> 	.div = 5,
> 	.hw.init = &(struct clk_init_data){
> 		.name = "fclk_div2p5_div",
> 		.ops = &clk_fixed_factor_ops,
> 		.parent_hws = (const struct clk_hw *[]) {
> 			&g12a_fixed_pll_dco.hw
> 		},
> 		.num_parents = 1,
> 	},
> };
> 
> Because g12a_fixed_pll_dco runs at ~4 GHz (3,999,999,938 Hz, as also seen in
> g12a_mpll_50m_div which divides g12a_fixed_pll_dco by 80 to get 50 MHz),
> dividing g12a_fixed_pll_dco by 5 with .mult = 1 already produces the 800 MHz
> rate (799,999,987 Hz, or g12a_fixed_pll / 2.5) expected by consumers such as
> gpu_opp_table in arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:
> 
> arch/arm64/boot/dts/amlogic/meson-g12-common.dtsi:
> 		opp-799999987 {
> 			opp-hz = /bits/ 64 <799999987>;
> 			opp-microvolt = <800000>;
> 		};
> 
> With .mult = 2 and .div = 5 on g12a_fixed_pll_dco, wouldn't fclk_div2p5
> report ~1.6 GHz (1,599,999,975 Hz) and cause downstream dividers such as the
> Mali GPU, NNA, VDEC, VAPB, and MIPI ISP clocks to program a /2 divider and
> run at half their requested frequency?
> 

You right, I misread the parent and will drop this patch in v2.

-- 
Best regards,
Ronald
