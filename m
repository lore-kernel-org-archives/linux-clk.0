Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795075877;
	b=fZBqfB2aWqN5ETdh/1n96pD8UhbOedpp71+Q/DsLzbm0by9Ru6bMZgVJIrODRIWq36Sk
	 xetsjdKz18orw4wi6xPi5G/RTz3bID7ZWfI8Ga7Kp+jWx28rw646Kz8OA17SKMGi+NURX
	 zvHGmI6Oqv2/TgabKIouxGIAjDQV90pbnaG065+CMQYHJu677uOCYPhd+coqeiDwdpimj
	 uwSQW8ZSVYMfWkZhcydpW4AVL+5DiVGfQfPHR778LHeG+whQnsC/YsDn8V9Rai0bsN1Gg
	 KzObFlmJjOPh6e6ZF8tRJCQybIbn2A/wj8xqCKfk2V0jexzMzD6B+11fxxwp1c9LDPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795075877;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Subject:From:To:
	 Cc:In-Reply-To:References:Date:Message-Id:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=K0w6PkVxkXL/Xi4LQWFqwmMKxwRSK2toKIJ5FNqLRfQ=;
	b=u9DwYk3hTcKz+/rdQdHDEXCaGjsqVmDfUOP810355TJ+mXfaE1RABunZVmlIH3WoyVvV
	 OYlwEuoMfTh1+jHb/nwsGyY0enodBaKS8WYt8E4hY3WcGhtAvNsbOEVObeanY8hTCRtDl
	 b0oUSmBTxn1adLrlMHCYuLyNH1F9pqLUMeQoN8d0xo6pHN82eAfxSnng09Dq687AalfVX
	 0qaeNrmo6zCa75MnAEpaQh+c2IpzyA62yX8JKxlR54JiQ66zrVNSSTuMbw074lc9PMzkF
	 BPErIOXtKv9dugpmA9/XLhWfoNuvV4HpawCeBp5uI9IWdGe7zM7MXRJPLACMgZEYnag==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=baylibre.com;
	spf=pass smtp.mailfrom=baylibre.com;
	dkim=pass header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=LcEPjWCr;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17F4606A320
	for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2026 08:11:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org E17F4606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.a=rsa-sha256 header.s=google header.b=LcEPjWCr
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so16685405e9.2
        for <linux-clk@vger.kernel.org>; Thu, 19 Nov 2026 00:11:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1795075874; x=1795680674; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=K0w6PkVxkXL/Xi4LQWFqwmMKxwRSK2toKIJ5FNqLRfQ=;
        b=LcEPjWCrO0y4SAy1MDddWs6Qw5Eq/jxNqjXdJnCuw5GugceTyPYuLmPQdYLzxMvd2O
         oakdhu48o40QMt/QKgQ72HtVKfcd46YN3YhqeAoGIgScnwq6hlP+2cK60xjbB/VB5/AD
         itqVUUJZNjminTWNE8+S02wFGQkYlvN0EAI9l+f8o58WByEVRSQRK5v+IjqDBZBbaAYK
         NrJ1/7VEZVbQCXUa2GTbeaAyAvpqrjDMj+K7Pty3Nzw2ukhNuNZU6jgy9HFfal/xTfkp
         NQ8pJ/hCRCzAJ4zJN0fz1FTIwuGweYwvvJKDQ8dTUbQSnKr5dm2PsjKaqwciIDFXbDo6
         wqjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795075874; x=1795680674;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=K0w6PkVxkXL/Xi4LQWFqwmMKxwRSK2toKIJ5FNqLRfQ=;
        b=quixGRLa6zjm6DcxBnZnIfLMuBCIDSRg3VPl1Ry3BvMavCd+934tNVzE+YvJmYiSJO
         4jVOkqKAQqP8nf33WDnc71bQoELzYpQt6OtsTyTnLlyz1SHJXsFryJHdYk0ttZeOvD+Z
         6QEFNnG+BgBqFcOBGJcTYcnAZCCBzmfS2yM2jgwoa2lm6sB5PEj4bwppz29jox8ZOhSl
         p+k2QRa8DLmvwDwjVYBnQZASXmdAf0OzJnQBUbcAESZXSNqejaHuyuELL4C0sxnaz7o6
         uuFYMuawihUA7cUv+/tVI+3xLgEh8u9cpXorlhQ4kGppZvyUy1KP4V8jinGqr6vzNWTQ
         gw5w==
X-Forwarded-Encrypted: i=1; AL+hErHKM/U1Silnqs3u0mbLShs+OlACPbh3s15BdLeedYtKobihs+yRSrOkIbuOlYkNmRQuDXfpsMHTR6Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z+2NjzVoRFhGebKNJy47H6kIzRJ4e++pRLI3OkcDr0iP3U10AOV
	N705EKI5Nr9BAckBEhwW8EwMpFChB+vjn5PJ2DRPn+WHWSfy54ffcek0jjkv1uSiEtU=
X-Gm-Gg: AYBFou3kMZvdCv89FBbtrVEp3rxZMbR9l36llWMbZQNG2abBgtL1ASZfshwpQK13a9R
	xs6bTUNWCWk2tqGYTMnmpHUht6/WRjqkhPkQf74cPAn48jgqUhFDIgapZzggszP18gW9xbXpv5T
	maOuy8yw4tmBy7XkUasSPQCcwYYo2wve47irW1XBEwg8zsK7jsYDmYzibtTPRXdOC+BxeqvBczS
	fsZcBlylKEM0oizzxRXhrojbiykBiam3o6qvwRehbBeYxJVQSOa9O8Pk+QD0OkA0y9a0j6Rx8XA
	0YBBRVcCT0Sd0c7wzLChz1WfzIDzJZ8dbVrAsMqcfy5vRTfYRbsuqoNsHTuQHPEwuiTRkeIluj5
	TYWFKky0k7vgI3WnRSAbNnssxhNUN/aYZjXnyscN5g+12XDWSp2Z38sf6aBtOOWrzYvQXhcmbV0
	hOFznwtYp6UNMZWuIX/urwsFAU9GSMDEiXP2A7SeU7VSaiwXLuHL0TyjPPxka5dlDztxtxSQ0st
	1iOezmVBofJC9kAKCiZF2N+YXgG7ZHyDGQf8L4eO/NcXBBo/xcmMxfftfVMvdk+HMnfMccDWdQT
	gCclul4QqDWK59eKXqoVZ3hv3iLqRHcz4s5K4PQrr8qkbSl9nQ9J2li5WOnnkrG6Pvi7Ww==
X-Received: by 2002:a05:600c:6095:b0:4a2:c2b:a91b with SMTP id 5b1f17b1804b1-4bb7da03b45mr88477785e9.10.1795075874056;
        Thu, 19 Nov 2026 00:11:14 -0800 (PST)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb85343607sm21511305e9.6.2026.11.19.00.11.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Nov 2026 00:11:13 -0800 (PST)
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
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 5/7] clk: amlogic: Add S7 PLL clock controller driver
From: Jerome Brunet <jbrunet@baylibre.com>
To: Carlo Caione <ccaione@baylibre.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jian Hu <jian.hu@amlogic.com>, Chuan Liu <chuan.liu@amlogic.com>, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org
In-Reply-To: <av2kitSLJNxlAKiv@macbook.homenet.telecomitalia.it>
References: <20261106-upstream-s7-clk-v1-0-7d501d62621f@baylibre.com>
 <20261106-upstream-s7-clk-v1-5-7d501d62621f@baylibre.com>
 <179499607256.413320.18141155995846183804.b4-review@b4>
 <av2kitSLJNxlAKiv@macbook.homenet.telecomitalia.it>
Date: Thu, 19 Nov 2026 09:11:12 +0100
Message-Id: <179507587229.639563.16969059581009770947.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=3952; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=S/MfAZNg1Wj0rP92aDgSVxBVGdkD8yDNkTKcT4QFMoE=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFn/1iu8i1iwfEKNoRkvi4zy/bIXjwRtU6/s8V0fuO3VT
 TWRBxHXO0pZGMS4GGTFFFlquKvF30lqfZk1Xec2zBxWJpAhDFycAjAR7z8M/2t8bt7abX4m7O3v
 3dPPaMWWVe2yjevLrM38W560U2uPUTzDP7Pci74zz3e+mZJ1qb+nmYnXff7OG779u5Xu/7N/fv3
 3eT4A
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On 2026-11-18 19:51 +0100, Carlo Caione wrote:
> On Wed, Nov 18, 2026 at 11:01:12 +0100, Jerome Brunet wrote:
> > > The S7 PLL controller provides the fixed PLL with its fclk dividers,
> > > the GP0, HIFI0 and HIFI1 PLLs, and the HDMI PLL.
> > > 
> > > Add a driver for it. The GP0 and HIFI PLLs are expected to run with
> > > their input divided by 2 (div0p5) and the HDMI PLL without it, as the
> > > firmware and the init sequences set them up.
> > > 
> > > Signed-off-by: Carlo Caione <ccaione@baylibre.com>> > +
> 
> [...]
> > > +/* The datasheet documents FIXPLL_CTRL1[30:26] as a single fclk_en field */
> > 
> > Not sure what this imply ?
> 
> It means that each of the five bits enables one divider, while the
> datasheet only documents the five bits as a single field. I'll reword
> the comment to say that.
> 
> > > +S7_FCLK(fclk_div2, 1, 2, FIXPLL_CTRL1, 30);
> > > +S7_FCLK(fclk_div3, 1, 3, FIXPLL_CTRL1, 26);
> > > +S7_FCLK(fclk_div4, 1, 4, FIXPLL_CTRL1, 27);
> > > +S7_FCLK(fclk_div5, 1, 5, FIXPLL_CTRL1, 28);
> > > +S7_FCLK(fclk_div7, 1, 7, FIXPLL_CTRL1, 29);
> > > +S7_FCLK(fclk_div2p5, 2, 5, FIXPLL_CTRL0, 25);
> > > +
> > > +static const struct pll_mult_range s7_pll_mult_range = {
> > > +	.min = 134,
> > > +	.max = 265,
> > > +};
> > > +
> > > +static const struct reg_sequence s7_gp0_pll_init_regs[] = {
> > > +	{ .reg = GP0PLL_CTRL0,	.def = 0x02520800 },
> > > +	{ .reg = GP0PLL_CTRL1,	.def = 0x09900322 },
> > > +	{ .reg = GP0PLL_CTRL2,	.def = 0x00000000 },
> > > +	{ .reg = GP0PLL_CTRL3,	.def = 0x00000006 },
> > > +};
> > > +
> > > +static struct clk_fixed_factor s7_gp0_pll_div0p5 = {
> > > +	.mult = 1,
> > > +	.div = 2,
> > > +	.hw.init = &(struct clk_init_data) {
> > > +		.name = "gp0_pll_div0p5",
> > > +		.ops = &clk_fixed_factor_ops,
> > > +		.parent_data = &(const struct clk_parent_data) {
> > > +			.fw_name = "gp0",
> > > +		},
> > > +		.num_parents = 1,
> > > +	},
> > 
> > Is it the good old predivider here ? Shouldn't it be modelled with
> > a read-only divider rather that a fixed factor ? just in case whatever
> > came before did not leave things as we first expected ?
> > 
> > Applies to the other PLL instances
> 
> Nope, not the good old provider, this is separate from N: N is in CTRL0
> and our init sequence sets it to 1. This is CTRL1[27], div0p5_en.
>

Humm, still looks very much like it ...

> Now, it was indeed a read-only divider in an earlier (messier and
> unpublished) version. The problem was that with a cold PLL it could
> cache the power-on setting (/1) at registration, then the VCO init
> sequence would enable /2 without updating that cached parent rate
> basically breaking both rate reporting and set_rate. The fixed factor
> avoids this mismatch when Linux initializes the PLL.
>

If the divider is part of the VCO init (which I'm not a fan of),
this makes sense but it needs a comment near the fixed factor to
explain how this works on the HW, that you are setting this up
with the VCO init() otherwise it looks like there is an actual fixed
divider in front of the VCO no matter what.

> After dropping NOINIT_ENABLED from the HIFI PLLs, the remaining
> assumption is that an already-running GP0 has div0p5 enabled. That
> matches the firmware I tested, but the driver does not check it.
>

If a PLL is going to use NOINIT_ENABLED, then a RO divider is the
required approach because you no longer control the init.

To get the rate right, we could play a little trick but it would need
a BIG FAT WARNING comment.

Register VCO first - basically re-order the IDs. .init() runs if the PLL is
disabled or if it does not have NOINIT_ENABLED. At this point you know the
predivider is set and the VCO orphaned. Then register the RO divider with
NOCACHE, it should pick up its correct rate.

It is a bit fragile but safer and more correct that the fixed_factor
approach IMO.

-- 
Jerome

