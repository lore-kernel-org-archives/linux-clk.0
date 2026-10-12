Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4675F27FD74
	for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 08:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791793033; cv=none; b=SMsKIgXH4MkrIO5TCpcSB2IlX1CL1FkM7uYdMm3fK/++L01blfHTwKbkuzijVhGl1s1/9Lmh1xdNZm2Qw6D2My5NEv+LufrXkYMirawG/75txANZqI256PKVyG/vS6EAZIpoLSl5UJh7ImmwLp1ZDCGWcqvRVwCDSt+COT2MWOQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791793033; c=relaxed/simple;
	bh=LBNk5mSEvmb/JFtueibojf+Rw2v4KwD8FDbTwjMrtbo=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=Xago3+HRrIRMkoUjSJkEqLIzt+0Z3b5EFNBHarE65ql57MJ+O5M1FSRpfZXYItmDWqleUuJnCzLUIjx44jo4bVfkP0/ohLi87j+rgCpTXdaFZLtNVAH8XatypUOF5TytUWv9GgGGYZlLOBkIXck4BUGLR4Ylv/RZdfU1K0OANGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=QUDMJsal; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="QUDMJsal"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a021c809e3so15693415e9.0
        for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 01:17:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791793028; x=1792397828; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/zLuY+/+ESi4JJhmc3hnMkOLSBz9DtESmIsl3yGIgb8=;
        b=QUDMJsalbLn5h/UGekHNOBO2FtxMhVZej31S+ZUEetQij9oAMZojo/1P/a0F6As6Hy
         5J6iUsuGbHoxhmOmiuj7lQLdfTBk1LoHmJYXrggOoa/kfWRoD6WFu+RcH0cH8/QKV8p2
         pti5oIJSm9RNO/UV8JkTtq8xZ96B5cee0KxsYGb1i0AHWfXpSpvm/cQsZ1iFy/CFbprr
         3b10E2hz6cOwSB1VzlDhJNl6zvdWBGhajnWlNg9mUWjmQLNx//+Kg5XHLFhd3p2x97ua
         lsML7iNUiZJ84FfaEyEgnTR8aZCkRCd+Zl80uaEkGq2gV5OHxThY1yT2S7PLhlEZxIqK
         16jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791793028; x=1792397828;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/zLuY+/+ESi4JJhmc3hnMkOLSBz9DtESmIsl3yGIgb8=;
        b=vlQ61rsXBwMvaI1d2843FGdyFvZzUTyOSWkq4wdXWuAe4nCj5DHXIfDtaIaMGMeCTl
         AN64sxlmoAYUuXfdKd9V8YapHbjIP+UgmMqgCfEXqYDRjBtwugUOqpgjjfdH92duRmRG
         N2SitPXXY1UQNMw5E1IkzI+Y18O5PLnqZBTdqjFvDfgUxE563fmDx7shRkLmbu3sKS33
         EGgwKVv99BzSaFQxEOS5BgdXkwXRnVuTC51z8x8I9xuxLDyX7oCXHcJWAaBti9ltrRKN
         wvHd8mgSGceoOE6qERRyf74Pbkkb1XR9K1sGNmWE15sAw7Sw2DBvLv78u+kG8CT9H7pG
         9wnA==
X-Forwarded-Encrypted: i=1; AKwUvBxxtB2ZSHyg0EVLiWMYSmsfi+T8eQhwsNtyREPGN4irYTMh60CIrkyZRZz92enUjmdiFOcLt2q1Ohw=@vger.kernel.org
X-Gm-Message-State: AFq9FYLsIoC4vZtGss7Qc6hnOpVQiD5oy0cYBSPHV1vWoN/PNENnPFSE
	t8OWazIAMps+feFvcxLqZMy6srIsWsg3DswkeWGMViLbdiM+Q1hoAtPKtICiuzYdNJ0=
X-Gm-Gg: AYBFou2reZdpjsKxBdUxaeU0TyEwmrlKuRwqvPBNTv6CqFMZ7AxoCAc1yRII7CqgIqI
	AFBvQNJwQfpEo5aLoqlXVPy/Lloqd7bauQIhL66BVVPxvJj3l91VU396nc+XpVZCPFDQ3XgNLJh
	m8tchM3SMOn3k7YKS4duCv1D9oE4HwmPNb49nCWsQ0nSWa/TNFeHmUltW4eLYPxPbUmH1oxcYy4
	ncrNSCKMVXHsSjWXXn4/pdX4Z+X2w/SOH4xiZn4RH3eMoFYAnvnU55K/u+3yAfH3m4ywqMj0iRm
	cDng4iPfRi34SzZ8hYjIxJ/D/PD69UtxvEoWN9JxU8fAtl/f7+F3S5d5V0YQX34k42PKREBQFhL
	1u+LhSX82LF1q1+a82CrZJKJ+QLSHmlsbx4tcldxc4Ctg35931v+AF70R3F33UIhdFukz3gbhzb
	lV518izt19fCJ3BzjjwpfeRWODpgki8PJrGmVWlnqMqlJdjylVklKmJGMAkZAjtPdOvHOmUWkLe
	hXUhLRxDPmiwTaYIQ==
X-Received: by 2002:a05:600c:4fcb:b0:4a1:811c:8083 with SMTP id 5b1f17b1804b1-4a18e4c3600mr160793515e9.33.1791793028350;
        Mon, 12 Oct 2026 01:17:08 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a19f318c31sm57721225e9.3.2026.10.12.01.17.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Oct 2026 01:17:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 1/1] clk: nuvoton: ma35d1-divider: use direct
 formula instead of divider table
From: Jerome Brunet <jbrunet@baylibre.com>
To: Joey Lu <a0987203069@gmail.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, sboyd@kernel.org, 
 ychuang3@nuvoton.com, schung@nuvoton.com, yclu4@nuvoton.com, 
 bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org
In-Reply-To: <2e5f4ca4-ccb7-4328-9bcb-32a2c4f73694@gmail.com>
References: <20261008064307.2757324-1-a0987203069@gmail.com>
 <20261008064307.2757324-2-a0987203069@gmail.com>
 <179156372588.266328.3848259565001346041.b4-review@b4>
 <2e5f4ca4-ccb7-4328-9bcb-32a2c4f73694@gmail.com>
Date: Mon, 12 Oct 2026 10:16:56 +0200
Message-Id: <179179301672.27179.2823663473263190790.b4-reply@b4>
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=5683; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=LBNk5mSEvmb/JFtueibojf+Rw2v4KwD8FDbTwjMrtbo=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFlnplc8itQ6ebFhz7PLFXFem37ylAreXbdi7sTPN7eYM
 Jc09kbO7yhlYRDjYpAVU2Sp4a4Wfyep9WXWdJ3bMHNYmUCGMHBxCsBEZjcyMhzdfDuAOaxMoPl6
 sk+FDJemiyVzs2R57KKZV43+qbAHTGBkuFg9wfvj6y83hK/fqfx/7/r8KtuUbjnGT74nysN7uKU
 vsQMA
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On 2026-10-12 13:36 +0800, Joey Lu wrote:
> 
> On 10/10/2026 12:35 AM, Jerome Brunet wrote:
> >> The ADC clock divider register implements rate = parent_rate / (2 * (N + 1)),
> > Are you open-coding CLK_DIVIDER_EVEN_INTEGERS ?
> >
> >   * CLK_DIVIDER_EVEN_INTEGERS - clock divisor is 2, 4, 6, 8, 10, etc.
> >   *	Formula is 2 * (value read from hardware + 1)
> >
> > Am wondering if this driver is necessary at all ? Can you just use the
> > regular divider here ?
> >
> >> which was previously modeled by building a clk_div_table with one entry per
> >> possible divider value (up to 2^width entries) and feeding it through the
> >> generic divider_recalc_rate()/divider_determine_rate()/divider_get_val()
> >> helpers. That is unnecessary overhead (a large table allocation and a
> >> linear scan on every rate lookup) for a relationship with a simple
> >> closed-form expression, so compute the rate directly instead.
> >>
> >> Drop the mask_bit/mask mechanism as well. The previous code unconditionally
> >> OR'd an arbitrary bit into the divider register on every set_rate() call,
> >> and the one existing caller passed mask_bit as a bitmask value (0x1ffff)
> >> rather than a bit index, so BIT() shifted by an out-of-range amount, which
> >> is undefined behavior. The divider field write already clears and rewrites
> >> only its own bits, so no extra forced bit is needed.
> >>
> >> Select the divider with a single helper shared by determine_rate() and
> >> set_rate(), using closest rounding as before, so the rate promised by
> >> determine_rate() is the rate that set_rate() programs. The helper clamps
> >> the divider to the valid range and avoids overflowing 2 * rate for very
> >> large requested rates, which would otherwise lead to a division by zero.
> >> Reject a rate of 0 with -EINVAL.
> >>
> >> Fixes: 691521a367cf ("clk: nuvoton: Add clock driver for ma35d1 clock controller")
> >> Signed-off-by: Joey Lu <a0987203069@gmail.com>
> >>
> >> diff --git a/drivers/clk/nuvoton/clk-ma35d1-divider.c b/drivers/clk/nuvoton/clk-ma35d1-divider.c
> >> index e992e7c30341..12a946c989e9 100644
> >> --- a/drivers/clk/nuvoton/clk-ma35d1-divider.c
> >> +++ b/drivers/clk/nuvoton/clk-ma35d1-divider.c
> >> @@ -16,8 +16,6 @@ struct ma35d1_adc_clk_div {
> >>   	void __iomem *reg;
> >>   	u8 shift;
> >>   	u8 width;
> >> -	u32 mask;
> >> -	const struct clk_div_table *table;
> >>   	/* protects concurrent access to clock divider registers */
> >>   	spinlock_t *lock;
> >>   };
> >> @@ -29,44 +27,66 @@ static inline struct ma35d1_adc_clk_div *to_ma35d1_adc_clk_div(struct clk_hw *_h
> >>   
> >>   static unsigned long ma35d1_clkdiv_recalc_rate(struct clk_hw *hw, unsigned long parent_rate)
> >>   {
> >> -	unsigned int val;
> >>   	struct ma35d1_adc_clk_div *dclk = to_ma35d1_adc_clk_div(hw);
> >> +	unsigned int val;
> >>   
> >>   	val = readl_relaxed(dclk->reg) >> dclk->shift;
> >>   	val &= clk_div_mask(dclk->width);
> >> -	val += 1;
> >> -	return divider_recalc_rate(hw, parent_rate, val, dclk->table,
> >> -				   CLK_DIVIDER_ROUND_CLOSEST, dclk->width);
> >> +
> >> +	return DIV_ROUND_CLOSEST_ULL((u64)parent_rate, 2 * (val + 1));
> >> +}
> >> +
> >> +static unsigned int ma35d1_clkdiv_get_val(struct ma35d1_adc_clk_div *dclk,
> >> +					  unsigned long parent_rate,
> >> +					  unsigned long rate)
> >> +{
> >> +	unsigned long max = clk_div_mask(dclk->width) + 1;
> >> +	unsigned long val;
> >> +
> >> +	if (rate > parent_rate / 2)
> >> +		return 1;
> >> +
> >> +	val = DIV_ROUND_CLOSEST_ULL((u64)parent_rate, 2 * rate);
> >> +
> >> +	return clamp(val, 1UL, max);
> >>   }
> >>   
> >>   static int ma35d1_clkdiv_determine_rate(struct clk_hw *hw,
> >>   					struct clk_rate_request *req)
> >>   {
> >>   	struct ma35d1_adc_clk_div *dclk = to_ma35d1_adc_clk_div(hw);
> >> +	unsigned int val;
> >>   
> >> -	return divider_determine_rate(hw, req, dclk->table, dclk->width,
> >> -				      CLK_DIVIDER_ROUND_CLOSEST);
> >> +	if (!req->rate)
> >> +		return -EINVAL;
> >> +
> >> +	val = ma35d1_clkdiv_get_val(dclk, req->best_parent_rate, req->rate);
> >> +	req->rate = DIV_ROUND_CLOSEST_ULL((u64)req->best_parent_rate, 2 * val);
> > Rate propagation support is lost with this.
> Thanks for the review.
> On open-coding CLK_DIVIDER_EVEN_INTEGERS: you're right. The ADC divider 
> is exactly 2 * (val + 1), so the regular divider covers it. The 
> dedicated driver is not needed. You're also right that my 
> determine_rate() lost rate propagation, because it never forwarded the 
> request to the parent the way divider_determine_rate() does.
> I tested the regular divider on hardware. That showed a separate problem 
> in the existing clock tree. The mux parents are declared with .fw_name 
> only, but the controller node has no clock-names, so the lookup fails. 
> sysclk1_mux and everything below it (pclk0, adc_div, and so on) end up 
> as orphans at 0 Hz. As a result clk_set_rate() on the ADC clock returns 
> early without writing the divider register. That hid the real behaviour 
> of the divider.
> So I will drop this series and send a new series that:
> 1. fixes the parent lookup in the clock tree, and
> 2. switches the ADC divider to the regular divider and removes the 
> dedicated driver together with the unused mask_bit parameter.

Have you looked at this series ?

https://lore.kernel.org/all/20261004-perso-ma35d1-upstream-clk-v8-0-e1a106a128c0@bootlin.com/

It does address several problems the existing driver has when it comes to
parents and incorrect usage of .fw.name

Please sync with Miquel on this.

-- 
Jerome

