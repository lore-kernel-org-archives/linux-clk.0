Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795785696;
	b=ya80k0JIWDL/qo91g2JHRElE75kf5GGhN5IUcHqwy5FW1iOW6XQ3RnczKkfX/en/4pHX
	 Zjjj5b37obNqNHWmCxS110S33aRKb0kN50kj28GwYOi7htE62IYB2rDO2z0xa+eCk40U5
	 Oq8G3byX1Ii4QQuQPRQzXCoCcWLGNfEUBlqh3CGbPYxswrRA7s7rKcwrzAT/GrNWMNSeo
	 Gp8B5tru46Psax2Fc14ZPBukncULtYHnzOCWX1vcOOki05XalnqQt8a/bHgPyzOL4ZXLU
	 T39Bl7P5sdqzCYGpSbmnMYmKmnM+jiCF00dlGlrq6cdEKZbHNzN9oKB+XD7crL7QsPg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795785696;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=RDUoKetlpdAW6F7tqFiNvozrVLWT1jW3suYfmlHrOCM=;
	b=j903QYmmsFcuofQu/iPWsCec9HRLEeU2mKukE3mAV4kMN+Upi0LpzHXhzLZhKLpJrUco
	 31HrFC3SRGThx/59zw3PiFdM9jwXSJYhUEKeM8uFDWc8aiZPVaxV6lkWhBu17Kk10psrY
	 oiX7KPZaU9dB7XLom0EDikJhYK+0a7jUVWL12Y9siuVZGy+FPxGaMFSssJpBsYsMcxAXY
	 QxmTO9hQkfmYYV70S62TmLT9aUncciINmmfxn45DzIsmu5tGHJg1b2lJuf6EBewLN+Fo1
	 uMRr3eZ/0NT+7qFFKyCkqw7KqkNW+w0Gu8yyGjx8PoSgFuVc4HSghHa/Q3N/vrXdo8Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Pbb7m09g;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E4C7606A31F
	for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 13:21:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5E4C7606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=Pbb7m09g
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4b79502c27aso81892055e9.1
        for <linux-clk@vger.kernel.org>; Fri, 27 Nov 2026 05:21:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795785695; x=1796390495; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=RDUoKetlpdAW6F7tqFiNvozrVLWT1jW3suYfmlHrOCM=;
        b=Pbb7m09gBe6kP6kILHdvs0AlMAV1ogSIxa0U7v5OcRc6H08gRCIAf5oA0PUjFb7r5X
         yYK5Woq6XNmqp1MqdWBffmyeZNZQd3o7cA6+7+kAuqpRhoqRlBuVTb2D3pIaJTHGwKTl
         W66PkXIMgXal5xKa+SHzd0rK2EadfPmKQUntN63lHu0hFbVWyL1Xe/n9xEUidXS4kO2/
         NCmBkzTrsL5FJt8mafg1U4TMUDZL79zvSJ5fp/o6NtnY0lBjhH0i1y3dbEKT7JMt6che
         lm7UI+4cjoMJE7GW+BO++/llW2KokVHBU4Ircyy4H6TsYDIc8V1o/pA+1nfKIhA3XzzK
         kzyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795785695; x=1796390495;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RDUoKetlpdAW6F7tqFiNvozrVLWT1jW3suYfmlHrOCM=;
        b=po6OFKkmUrekVz0DLMbDvZgNBZ+oNJEjFpuiK0JKzSZrr3jX3hDV5S58RFiTnpV7wT
         ELy7PdB3GYFxcBGszgNYlVt4mbO1GTybyRyevq4ERwIUMf4EIVcuLagEgZGJil0IU9Dl
         Y0TEnlcZ+bOnBzbQ/yrNi/VNv4RRR+txRu2UYV5M43xT6PoE3MrqK9e54/9khqdHF5HW
         L50KqKcRRn9LrZbtBGHw8s3CYLuEI9UPOFhUBR18PB/s+IpZiqnIU7VqCdprudg5l432
         npMIJstj9RtjxGXXHOFeIMW1TNSGCEUe/srU3SEqZguFIOGdjltls45Ln0bjEJTR/mjA
         PnZw==
X-Forwarded-Encrypted: i=1; AL+hErFeqdrN6zN3ms9ETid6ZY6T3c6Rn++XoJtWIRgo1gsSkniPQ1+IPF8+wkXDsE0uaCVTje4wvqpeZNI=@vger.kernel.org
X-Gm-Message-State: APuU4Z8EnD4xfx95605L5+U3CvKennM+v/JpxPV3gSic4cbzO0Q2ENfO
	n0juMrukqc8BCHx953XQHXKr+Sgc+LtPq4YiW6kup0MnLt+TI3WEYPlu7DaoZGRlXgc=
X-Gm-Gg: AZFdTZenCWOer1VsRpGxn7ohAqNv46TGeTmE9j4egYuXGZnQwjsCU/eWlYWbz6QsoJ4
	ZfbSTpRgdZfKjSB2DKn+PQQfR7YcCmKL2gXQ1YLgd08J0AfHMdTbb2ah+upWyrMtnfozyckhjkx
	UZEc1jHuC00Ulv4P6WGlUejScEDc/zi67kwGURxJIxeEHAhh5WLPc+aMyUPqIXmX0VHZWL5TVUt
	mPc+JVVE9FCeu1phvJV65BXi4I/xuCQb6UWKw6oCAoT9ltSrPZwCJoPPp9Hxh14yJMLQN6Thz/T
	56On3pY3Ob41WPxYClQMdic2HlrCxwzYb8N3Eja6azNOZ62Kva6vjnhfgya4IG1548Cuf4Lkcsq
	jI/kelaJ9V7kv6zIBRFcuPj+U0cWv/boZDmaqrBB7Qp+C0WvaAd8UfzfY6d9uQ07mC17KjLp1bU
	JuM2RMXEL+lmAjrYjlY/+P2Us87o6P5p2p4HywY0f0O/6nnvpIYBkXlG7kWahhvzIFiqKap2u5E
	2IiT+9BI5HEYSFIMSM09ko/vEn3tw06hh2JVix21sdnzrBTCQQbReQ3+mCjFZ13Jny6bzGyFDkr
	RjpXzRJfpRybNolHL9dwz7rI2IZNtr5sGq7VmTCOZpLOKTw6
X-Received: by 2002:a05:600c:1389:b0:4af:83ad:8f70 with SMTP id 5b1f17b1804b1-4bb88924f66mr492570985e9.35.1795785693896;
        Fri, 27 Nov 2026 05:21:33 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9687sm772362675e9.10.2026.11.27.05.21.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Nov 2026 05:21:33 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH RFC RFT v2 3/3] clk: meson: pll: Remove the dedicated n
 parameter
From: Jerome Brunet <jbrunet@baylibre.com>
To: Jian Hu <jian.hu@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, linux-amlogic@lists.infradead.org, 
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <98fc8cb8-186b-493e-b74c-d8625d11dab1@amlogic.com>
References: <20261029-meson_refactor_n-v2-0-ff4ac74e527b@amlogic.com>
 <20261029-meson_refactor_n-v2-3-ff4ac74e527b@amlogic.com>
 <179390104085.2573818.48733523079260500.b4-review@b4>
 <98fc8cb8-186b-493e-b74c-d8625d11dab1@amlogic.com>
Date: Fri, 27 Nov 2026 14:21:32 +0100
Message-Id: <179578569228.3130490.14256403264790878680.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=4243; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=E4dLgfAPlyGRAwDDbFxbbsD6Cc9CC30EoXytcCxZdeQ=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDNmczXf6cy9W/3oi+bV7cZXnU8vLz/4zK0vWJ22ebHPE8
 1Rj933DjlIWBjEuBlkxRZYa7mrxd5JaX2ZN17kNM4eVCWQIAxenAEykdjrDX9la7iuLNjZrtM37
 zPl+mruZ18OzH1TXHuZwtM4/pKVmeoLhf2VL+Znd7z8cP9NrZe//sNuyqU+n/2fIGoVzx+ZwPDh
 Txg8A
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9


> >> -static const struct pll_params_table axg_pcie_pll_params_table[] = {
> >> -     {
> >> -             .m = 200,
> >> -             .n = 3,
> >> +/*
> >> + * A pre-divider value of 3 provides the best performance for
> >> + * the AXG PCIe PLL.
> >> + */
> > Again, define performance here. what does it mean ?
> 
> 
> To clarify what "performance" means in that comment:
> 
> Some target frequencies cannot be achieved with N=1, requiring a non 1 
> pre-divider.
> 
> N may not be 1 for Amlogic fixed PLLs and PCIe PLLs.
> 
> This AXG PCIe PLL is designed based on N=3 for optimal bandwidth.
> 
> 
> The AXG PCIe PLL rate is:
> 
> 24Mhz/3 * 200 /2/8 =100Mhz.
> 
> 
> I will update the comment:
> 
> /*
> 
>   * This AXG PCIe PLL needs pre-divider 3 to hit the target frequency 
> 100Mhz,
> 
>   * which also yields optimal bandwidth.
> 
>   */

All I'm seeing in your explanation is "ability" to reach a rate, nothing remotly
"performance" related. Either drop the word or explain what mean better.

> 
> >> +static const struct clk_div_table axg_pcie_prediv_div_table[] = {
> >> +     { .val = 3, .div = 3 },
> >> +     { /* sentinel */ }
> >> +};
> >> +
> >> +static struct clk_regmap axg_pcie_prediv = {
> >> +     .data = &(struct clk_regmap_div_data){
> >> +             .offset = HHI_PCIE_PLL_CNTL,
> >> +             .shift   = 9,
> >> +             .width   = 5,
> >> +             .table = axg_pcie_prediv_div_table,
> >> +             .flags = CLK_DIVIDER_INVALID_ZERO,
> >> +     },
> >> +     .hw.init = &(struct clk_init_data){
> >> +             .name = "pcie_prediv",
> >> +             .ops = &clk_regmap_divider_ops,
> >> +             .parent_data = &(const struct clk_parent_data) {
> >> +                     .fw_name = "xtal",
> >> +             },
> >> +             .num_parents = 1,
> >>        },
> >> +};
> >> +
> >> +static const struct pll_mult_table axg_pcie_pll_params_table[] = {
> >> +     PLL_MULT(200),
> >>        { /* sentinel */ },
> >>   };
> >>

[...]

> >>
> >> -static const struct pll_params_table sys_pll_params_table[] = {
> >> -     PLL_PARAMS(50, 1),
> >> -     PLL_PARAMS(51, 1),
> >> -     PLL_PARAMS(52, 1),
> >> -     PLL_PARAMS(53, 1),
> >> -     PLL_PARAMS(54, 1),
> >> -     PLL_PARAMS(55, 1),
> >> -     PLL_PARAMS(56, 1),
> >> -     PLL_PARAMS(57, 1),
> >> -     PLL_PARAMS(58, 1),
> >> -     PLL_PARAMS(59, 1),
> >> -     PLL_PARAMS(60, 1),
> >> -     PLL_PARAMS(61, 1),
> >> -     PLL_PARAMS(62, 1),
> >> -     PLL_PARAMS(63, 1),
> >> -     PLL_PARAMS(64, 1),
> >> -     PLL_PARAMS(65, 1),
> >> -     PLL_PARAMS(66, 1),
> >> -     PLL_PARAMS(67, 1),
> >> -     PLL_PARAMS(68, 1),
> >> -     PLL_PARAMS(84, 1),
> >> +static const struct pll_mult_table sys_pll_params_table[] = {
> >> +     PLL_MULT(50),
> >> +     PLL_MULT(51),
> >> +     PLL_MULT(52),
> >> +     PLL_MULT(53),
> >> +     PLL_MULT(54),
> >> +     PLL_MULT(55),
> >> +     PLL_MULT(56),
> >> +     PLL_MULT(57),
> >> +     PLL_MULT(58),
> >> +     PLL_MULT(59),
> >> +     PLL_MULT(60),
> >> +     PLL_MULT(61),
> >> +     PLL_MULT(62),
> >> +     PLL_MULT(63),
> >> +     PLL_MULT(64),
> >> +     PLL_MULT(65),
> >> +     PLL_MULT(66),
> >> +     PLL_MULT(67),
> >> +     PLL_MULT(68),
> >> +     PLL_MULT(84),
> >>        { /* sentinel */ },
> >>   };
> >>
> >> +static const struct clk_div_table meson8b_fixed_prediv_div_table[] = {
> >> +     { .val = 4, .div = 4 },
> > Previous table was showing a prediv of 1 ... here it jumps to 4 without
> > an explanation !
> >
> > Also, it is a RO clock, so what is the point ?
> 
> 
> This is similar to the AXG PCIe PLL case. The pre-divider is fixed at 4,
> which lets this fixed PLL output 2550MHz and gives optimal bandwidth.
> The table was used so the fixed PLL DCO rate can be calculated correctly.
> Without the table or `CLK_DIVIDER_ONE_BASED`, the divider would be 
> interpreted as 5,
> leading to wrong DCO rate calculation.

But you are hidding a fix in a rework then.

Your rework should keep the prediv as it was.
Then you can change explaining clearly why you are doing it, with a proper fixes tag.

-- 
Jerome

