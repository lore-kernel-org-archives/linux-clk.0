Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793966631;
	b=aGHM5sAIvXOIqoxWvwlllfHamG8wcg0DiXhg5t7pG2olAtoPMvZSRnY6zDXx4BQCXCHe
	 sO2S/+n881NBCgrYKh5YK7Jh3o/iWETxTpxJoVOJkVRrPUtvBmCKaZbC7lhjWa7Ix2ux/
	 851rjBUCtzfUp10i9A8Klr7tBEgdX4c0gFUe/fwR0geu8IrXFwdkH7jcFXMya5yVcYBI3
	 i4ueUqw6izPPL41nGPA2XgSWh/U+mLG3EwTQJX4S6iB+p1a96YkqAGPyqBKpeDK7efr4E
	 cYxKOGgKDQG6KYJNsFgqPvUeZJGIa6N9GlIM6VohCcweb/fYG5nPOSpLTk9hA1oczdg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793966631;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:
	 X-Google-Original-Message-ID:Date:From:To:Cc:Subject:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=+3ys0FdSf1xCr+CCWg4Cx51eRM3hYz8a1czENaT0wUU=;
	b=AC3YaN6VWkC2RStuf4qOZQOtHrYlPwbSIg01hTBSp+qCmsPwoQbtqggZiBqjBPn0ntz8
	 If48m6CbYZR3PwGGrkS9nmMRoixabGmrFHLV/OaRSVQ2XbJjLq66Kn3Iu979qvP/fs4hU
	 xduTfti//mWaVYDpynUtjyS/UGRK4Eyo+rUXIPK/epFqm0n/nWZpNctJCkP1J4LUWMAY3
	 kFnRua56wLasraeHJfB1QTgrFsjiPHVnYfKZGkEpXguuIxP90B6hIMuoBh4uP45Wrhito
	 k/xrgulkCU1erg+zhpkG1SEo9YV1iFLMgK1taSPamAxqPTr2k+LdKN7FzNGyXJwoA2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OQQQWkLK;
	arc=none smtp.remote-ip=209.85.221.45
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71035606D818
	for <linux-clk@vger.kernel.org>; Fri,  6 Nov 2026 12:03:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71035606D818
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=OQQQWkLK
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-48dfc0421d9so588866f8f.1
        for <linux-clk@vger.kernel.org>; Fri, 06 Nov 2026 04:03:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793966630; x=1794571430; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:subject:cc:to:from:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=+3ys0FdSf1xCr+CCWg4Cx51eRM3hYz8a1czENaT0wUU=;
        b=OQQQWkLKiAnjTvVk7oSYfd408X5BECmxfY+ho2H8VtJzvJMSXaY0hg8gnpGvj+7kdS
         Fz3gKYkf+tjQ/6vyTcx+nvpZoeHzxzkyMayIHfvCTmZbUMEv/c+Itztt3KzsrHj0pJ1x
         3Of1vrsPY5n22OWDknyimNsUNTaRsFp+C7ac4cb9NBFrWLz91VofkHotQ5vc4Tlph2lc
         YgNrlPtSyCylDqyCFlOGJJrm3LICkYYvyXFdAJ3MhPh62asnG9flrwDJSRZF0a8I2R+q
         /Yom39UWfKprSyEy1mDYJMEF1tOe48MfAfimmIy3LC786cnCtlO+gCgkKec+eMOKFhqJ
         A80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793966630; x=1794571430;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:subject:cc:to:from:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+3ys0FdSf1xCr+CCWg4Cx51eRM3hYz8a1czENaT0wUU=;
        b=gxzRK2PYXLDS1QwH8RCyHdgowGCZZEy5L27ZfY/J4jFyHro91xkkAJ+Q1FI3fJPGOP
         q2IDZ+Ww3eezmRi2B5JhsGmRlDdRAeE3Pt5tztN4yFaYyQrjep36l6vbc2ezAQyWTTUq
         sccYJkcCeMe/h78fEA6sFU+Vkf7IeQmo64V8x6lDL5r7uJHiK2RwnfZ2R/wKAaA6vVzS
         3KF13L09W7fb92eYQ4qKcNC6QVed/gN/W9I3YJxXKsk9kPr43X8B8msM3Gth2Qk8VDjU
         YWqjcLMAQ5DRK07PJTWWcr9KJugcOqXsIjypLEv32ldnCH+sFl+NzUZQC2lAl33qwmMY
         JznA==
X-Gm-Message-State: APuU4Z9N8l3Qn03Mp5Omi3n13tbPISv+XGOuwyUiAosec4CdDdDcscBP
	jhq49Bw2wnj7ByQpCuTERqKy24drWkqo6L10n1hwvI5elAocq6gZiKVIlwA/LQ==
X-Gm-Gg: AYBFou3dLdnNMbdgsIEGDwjyZ8cyh/WmdIJautUmPs1HNNRffd+pty0mJQLOCEtke0S
	oIqqCKum1hMCE+W+4YcUTJBRKuLYGH/yXr8zlDUI2b280yFlRpPokzVFvtULKM+PURWbaylCtTw
	jMIlF984gZpR9/cdRBOzM7LbiHdS0YAbaL9iRyJ9vQVEZrdzmYHfzMKj+Nnp+KJAzzlXee1AP00
	COD6V+qMkTl/fYOk6ptf1uTzZ1uRuMq7RV8Pokf+0gsfrmIwDbZ91KtSYsw0OQ1VxWef6hE5itj
	MPyjY0me8hWZIMNn/orxYrgIlIr2y8zdRZnjI49Ve40+ody5u7qR2oWbZUE30Ja83UzJSgXCGkI
	UflrwyxwL37HQZ7lTZ/JMCLRvfmDPQUbF/UABgoN2CoXoBhIZ3vgnvYaMgOGX1xy2blVOghKiWg
	uAT9vmm86/RddPE5UYnW3xbHehgcb36gC+RLHo9oi0Wri26ecaIGyMPALuI0CaTMekzhtjJc3Ux
	r9sjH4nB/p/ydBrB4xa8UkGpMVx6kGel/rIQmuAQ7hjhK2U3LtPBzMN+Hoscto/NJ++2p/gdvE2
	DjiCryI0iiZigZXT70DxuwDsafQV3AWghvtVajQ1IJWAc7L5EuldBG9nSs5cRo7p5W+2EPJ3jLk
	KGPjWK8BGLbrFI10=
X-Received: by 2002:a05:6000:26c5:b0:48b:e50:714e with SMTP id ffacd0b85a97d-4927730ed37mr4922729f8f.36.1793966629679;
        Fri, 06 Nov 2026 04:03:49 -0800 (PST)
Received: from Ansuel-XPS. (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d3d609c8sm3590824f8f.6.2026.11.06.04.03.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Nov 2026 04:03:49 -0800 (PST)
Message-ID: <6aedc225.21bfadee.6a467.f4d5@mx.google.com>
X-Google-Original-Message-ID: <au3CIhBF7z593ZpE@Ansuel-XPS.>
Date: Fri, 6 Nov 2026 13:03:46 +0100
From: Christian Marangi <ansuelsmth@gmail.com>
To: sashiko-reviews@lists.linux.dev
Cc: linux-clk@vger.kernel.org
Subject: Re: [PATCH v4 2/2] clk: en7523: add support for .set_rate for en7581
References: <20261106113227.182324-1-ansuelsmth@gmail.com>
 <20261106113227.182324-3-ansuelsmth@gmail.com>
 <sashiko-outbox-201354@kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-201354@kernel.org>

On Fri, Nov 06, 2026 at 11:45:13AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential
> issues to consider:
> - [Medium] clk: en7523: division by zero in divider_get_val() when rate
>   is 0
> - [Low] clk: en7523: misuse of dev_err_probe() in runtime
>   en7581_set_rate()
> --
> 
> commit 21c9a3ba438d14108d5599a5785e71997f1e9fbe
> Author: Christian Marangi <ansuelsmth@gmail.com>
> 
> clk: en7523: add support for .set_rate for en7581
> 
> This commit adds clock divisor tables and implements .determine_rate and
> .set_rate callbacks for the Airoha EN7581 SoC clocks.
> 
> > diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> > index 6640e814d36a4..db7447be31c33 100644
> > --- a/drivers/clk/clk-en7523.c
> > +++ b/drivers/clk/clk-en7523.c
> 
> [ ... ]
> 
> > @@ -775,11 +864,148 @@ static unsigned long en7581_recalc_rate(struct clk_hw *hw,
> >  		return 0;
> >  	}
> >  
> > -	return rate / en7523_get_div(desc, val);
> > +	if (desc->div_bits) {
> > +		val >>= desc->div_shift;
> > +		val &= (1 << desc->div_bits) - 1;
> > +
> > +		rate = divider_recalc_rate(hw, rate, val,
> > +					   desc->div_table,
> > +					   desc->div_flags,
> > +					   desc->div_bits);
> > +	}
> > +
> > +	return rate;
> > +}
> > +
> > +/*
> > + * Simulate rate with every divisor supported
> > + * 1. Search the divisor for the requested rate
> > + * 2. Simulate the final rate with the new divisor
> > + */
> > +static unsigned long en7581_get_div_for_rate(struct clk_hw *hw,
> > +					     unsigned long rate,
> > +					     unsigned long parent_rate,
> > +					     const struct en_clk_desc *desc,
> > +					     int *div_val)
> > +{
> > +	*div_val = divider_get_val(rate, parent_rate, desc->div_table,
> > +				   desc->div_bits, desc->div_flags);
> > +	if (*div_val < 0)
> > +		return 0;
> > +
> > +	return divider_recalc_rate(hw, parent_rate, *div_val,
> > +				   desc->div_table, desc->div_flags,
> > +				   desc->div_bits);
> > +}
> > +
> > +static int en7581_get_vals_for_rate(struct clk_hw *hw,
> > +				    const struct en_clk_desc *desc,
> > +				    unsigned long rate,
> > +				    u32 *base_val, u32 *div_val)
> > +{
> > +	struct device *dev = clk_hw_get_dev(hw);
> > +	unsigned long parent_rate, tmp_rate;
> > +	int tmp_base_val = 0;
> > +	int tmp_div_val = 0;
> > +
> > +	if (!desc->base_bits && !desc->div_bits)
> > +		return -EINVAL;
> 
> [Severity: Medium]
> Can en7581_get_vals_for_rate() pass rate == 0 into
> en7581_get_div_for_rate() -> divider_get_val()?
> 
> Calling clk_round_rate(clk, 0) or clk_set_rate(clk, 0) forwards
> req->rate == 0 to en7581_determine_rate(), and divider_get_val() divides
> by rate without checking for zero:
> 
> drivers/clk/clk-divider.c:divider_get_val() {
> 	unsigned int div, value;
> 
> 	div = DIV_ROUND_UP_ULL((u64)parent_rate, rate);
>     ...
> }
> 
> Rejecting !rate at the start of en7581_get_vals_for_rate() would avoid a
> division by zero.
>

Protective coding and I'm surprised divider_get_val doesn't handle such
case... Anyway I will add this extra check whatever...
 
> [ ... ]
> 
> > +static int en7581_set_rate(struct clk_hw *hw, unsigned long rate,
> > +			   unsigned long parent_rate)
> > +{
> > +	struct en_clk *en_clk = container_of(hw, struct en_clk, hw);
> > +	const struct en_clk_desc *desc = en_clk->desc;
> > +	struct device *dev = clk_hw_get_dev(hw);
> > +	struct regmap *map = en_clk->map;
> > +	u32 base_val, div_val;
> > +	u32 reg, val, mask;
> > +	int err;
> > +
> > +	err = en7581_get_vals_for_rate(hw, en_clk->desc, rate,
> > +				       &base_val, &div_val);
> > +	if (err)
> > +		return err;
> > +
> > +	if (desc->div_bits) {
> > +		reg = desc->div_reg ? desc->div_reg : desc->base_reg;
> > +
> > +		mask = (BIT(desc->div_bits) - 1) << desc->div_shift;
> > +		val = div_val << desc->div_shift;
> > +
> > +		err = regmap_update_bits(map, reg, mask, val);
> > +		if (err)
> > +			return dev_err_probe(dev, err, "Failed to update div reg for clock %s\n",
> > +					     desc->name);
> > +	}
> > +
> > +	if (desc->base_bits) {
> > +		mask = (BIT(desc->base_bits) - 1) << desc->base_shift;
> > +		val = base_val << desc->base_shift;
> > +
> > +		err = regmap_update_bits(map, desc->base_reg, mask, val);
> > +		if (err)
> > +			return dev_err_probe(dev, err, "Failed to update reg for clock %s\n",
> > +					     desc->name);
> > +	}
> 
> [Severity: Low]
> Should en7581_set_rate() use dev_err() instead of dev_err_probe() here?
> en7581_set_rate() is a runtime clk_ops callback rather than a probe
> function, and the sibling helpers en7581_recalc_rate() and
> en7581_get_vals_for_rate() already use dev_err().
> 

This is funny... dev_err_probe is not only to handle PROBE_DEFER or probe
context... it does also gives more formatted error code and convert the
error code to the plain text error giving more info. I'm keeping this.

> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261106113227.182324-1-ansuelsmth@gmail.com?part=2

-- 
	Ansuel
