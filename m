Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C798334B1A6
	for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2026 22:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784672033; cv=none; b=Bx9HCiM8bnRVP7Tun0fRLMSlAeRTb1atTDenTk379WLi65RI9WRV2P8VphrjE5s0/iw2SQm7vJdNbI8pcHgWD9Dd11BHgxVs3Gz8Skjo8eudmTvAgiuYVkJFBUO/Pu0k/Bfz9hYlG+6K/D/Pa6VBPCaC4gDjphMbbsuBC75JDI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784672033; c=relaxed/simple;
	bh=3mYy78aFqYnVGOnrAFUjEZJmy+FfUQ28lFcJZggiUtc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ebcFNf5Fhi2HtkAEZGf6pXvLi5RLckeNfRoY9lYqTeGdgwNUQo75CERL7+21fdEsHmUFR58nFvcbYO328NhFN1Ksu1/M4deaP2mZBGbWA3ELGmTK9SAfhoM0VWUtdznzNYxDkjrEsNW/7DGqXLnZ+YvYxeIUl2cUtM5/6h/NKdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=R8n2bHJj; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=HSnIMKy4; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="R8n2bHJj";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="HSnIMKy4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784672031;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=c477dkDn60xr5/vpHCybjFahEYi4w5V0EVtZg0tIWZ8=;
	b=R8n2bHJjxYdunXyEp04TdHyO7LRwaM+DLMghE4fowW3W96VPvUqCrIHBQyPx8+k5xMw9E6
	fdpDqEZOCvA06V3wcLAFyxTS1QKlR5WvdiPY05iiX0vy8TIxN5Td/mCATu/GVNpXuMQlEj
	Z+CpINvIyKiVtsQLNbl9qTS9eNKEqmQ=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-68-7xHWsGB7PpevoFCT2a5J7Q-1; Tue, 21 Jul 2026 18:13:49 -0400
X-MC-Unique: 7xHWsGB7PpevoFCT2a5J7Q-1
X-Mimecast-MFC-AGG-ID: 7xHWsGB7PpevoFCT2a5J7Q_1784672029
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-930dda91cbdso593065985a.3
        for <linux-clk@vger.kernel.org>; Tue, 21 Jul 2026 15:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1784672029; x=1785276829; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=c477dkDn60xr5/vpHCybjFahEYi4w5V0EVtZg0tIWZ8=;
        b=HSnIMKy4tYeinVstojVkSMrg7sGh/hC1yxScVBc3OD1zG5htofX00BbU4LkpzEnLiw
         0fewtBXWk7/icyaZgRKD38gcLbKuWENp5evzFTxcqBT5qeBpRCDhM1TpggH/LnTtr7jS
         Iow94MpLSCn048p+AXh35jEVyCeYW/zpRHL47h+GjocteZIleuIypybrYrozWVHP03Xl
         OTXyfk1ud7FjbCAPw5Y/w/TR5p6pdvdfnjcpLwQDKj4jU7SllzMfTYJCl3csEp8/aFvD
         nDHxC0aYQsF9jfPIUvarHRNz4QR5JNVAQW5nNBuHwt75qAE4ub08H8p7JwiaNILOCcyl
         0GqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784672029; x=1785276829;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c477dkDn60xr5/vpHCybjFahEYi4w5V0EVtZg0tIWZ8=;
        b=iT+FL0Epuf7VodrTcS6ofWczRHcpmTyi+KPvr6dPRQQHR+8oCjh6zC3K2pzzCLU/im
         p61QmVjWlOA0DOGjsptOEreEcDHDCjxaptektJv8xbZvogoW0OPV818MEI4FaXQOr7jd
         hdVr8KIHQCAsfqahO0QoJWo+TWW6PHVormf1Hbm8WSmxQXdpSPxH2mEVegzFrBp655+P
         NuSpFy+nTbgoCqgKFwjeeOdh0I7JJbVQsHUzBP7SOLOu4WBWdZHFaK7CbK5pK5XOAgEs
         i2M8zczdleHi9L5o6LlfQhl/mCLY2wHOa1yNDvsnqKB7VtS4vCDczkjR27TjRG3ENOtS
         x76Q==
X-Forwarded-Encrypted: i=1; AHgh+RonhytoYVo4uWZjvH2jKgVHF+QpKqd4bU3r3rLQ8H+kCky+tIo4JRAGXwAXxhFobEWbD5ppwziSp+s=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy3ivAfSEO/3woNrlrg6q7fX5xZOaato92BfVMsBwcOcqPhE64G
	/3l8n1Hr3k4f4zS3Ie+i8s2Jb03x00Jh+jLDn146A1bRb+SXWJjMwXpt3Vi/nF+b40jTsf1t8cA
	g2hpZxODW9jMXGKLKGB+fHmx+bqHy8As+uLIu2d7G3fFm9yuKp1qMSSP5FvhUtg==
X-Gm-Gg: AR+sD13ZGlehJ9SCmsQYCsXJpg59uCEA7PHwbemIDwYGpEXnZ1IZnh4C5X/ijF/Kfyl
	Zm+4UcF4F8mMxsxdeJ7/8HOzCth8ZTdSbgaeqY6O6mi7eI7PDvKPKY2CmRLbmYSdrlYTz4+v9Ul
	xDtqQuwoNsF8iS1HNuXyF9DJUKgaujlg2AF+vC+lAAvlbqrO2oWRtfSzKr1Q6oZ9h6AaDNFfBxf
	CSY4vTOvA71P3x25TnZriF+oZT5LhxGAGkjGZs8c5McxAQQlaIuXx1fxORzbD3vKer0FHO/DLYM
	Hf8C2JY1jZunjGWyCUNbk1Jqf9Mq+7zPKEdknaWJtMzY8Msu03HXarHCv1cEBL+DEUcqIgYBs+B
	aAwZaxF4G6Dqrh6ELHvHLGpn+R1hr71Ux6Tg=
X-Received: by 2002:a05:620a:29c6:b0:92e:c117:9ead with SMTP id af79cd13be357-930b4396822mr2022259985a.91.1784672028316;
        Tue, 21 Jul 2026 15:13:48 -0700 (PDT)
X-Received: by 2002:a05:620a:29c6:b0:92e:c117:9ead with SMTP id af79cd13be357-930b4396822mr2022256385a.91.1784672027775;
        Tue, 21 Jul 2026 15:13:47 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930f68d323asm3643085a.19.2026.07.21.15.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 15:13:47 -0700 (PDT)
Date: Tue, 21 Jul 2026 18:13:45 -0400
From: Brian Masney <bmasney@redhat.com>
To: joakim.zhang@cixtech.com
Cc: mturquette@baylibre.com, sboyd@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de,
	cix-kernel-upstream@cixtech.com, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v10 2/4] clk: cix: add sky1 audss clock controller
Message-ID: <al_vGXIW2bP8uGJ5@redhat.com>
References: <20260720051505.1252774-1-joakim.zhang@cixtech.com>
 <20260720051505.1252774-3-joakim.zhang@cixtech.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720051505.1252774-3-joakim.zhang@cixtech.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

Hi Joakim,

A few questions / issues mostly related to pm runtime usage.

On Mon, Jul 20, 2026 at 01:15:03PM +0800, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> Add a platform driver for the Cix Sky1 AUDSS CRU. The driver maps
> the CRU registers and registers mux, divider and gate clocks for
> DSP, SRAM, HDA, DMAC, I2S, mailbox, watchdog and timer blocks.
> 
> Four SoC-level audio reference clocks are enabled as inputs to the
> internal clock tree. The driver releases the AUDSS NOC reset, enables
> runtime PM and instantiates the auxiliary reset device.
> 
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> ---
>  drivers/clk/Kconfig              |    1 +
>  drivers/clk/Makefile             |    1 +
>  drivers/clk/cix/Kconfig          |   16 +
>  drivers/clk/cix/Makefile         |    3 +
>  drivers/clk/cix/clk-sky1-audss.c | 1211 ++++++++++++++++++++++++++++++
>  5 files changed, 1232 insertions(+)
>  create mode 100644 drivers/clk/cix/Kconfig
>  create mode 100644 drivers/clk/cix/Makefile
>  create mode 100644 drivers/clk/cix/clk-sky1-audss.c
> 
> diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> index 1717ce75a907..cfcaab39068a 100644
> --- a/drivers/clk/Kconfig
> +++ b/drivers/clk/Kconfig
> @@ -509,6 +509,7 @@ source "drivers/clk/actions/Kconfig"
>  source "drivers/clk/analogbits/Kconfig"
>  source "drivers/clk/aspeed/Kconfig"
>  source "drivers/clk/bcm/Kconfig"
> +source "drivers/clk/cix/Kconfig"
>  source "drivers/clk/eswin/Kconfig"
>  source "drivers/clk/hisilicon/Kconfig"
>  source "drivers/clk/imgtec/Kconfig"
> diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> index cc108a75a900..87c992f0df54 100644
> --- a/drivers/clk/Makefile
> +++ b/drivers/clk/Makefile
> @@ -119,6 +119,7 @@ obj-$(CONFIG_ARCH_ARTPEC)		+= axis/
>  obj-$(CONFIG_ARC_PLAT_AXS10X)		+= axs10x/
>  obj-y					+= bcm/
>  obj-$(CONFIG_ARCH_BERLIN)		+= berlin/
> +obj-y					+= cix/
>  obj-$(CONFIG_ARCH_DAVINCI)		+= davinci/
>  obj-$(CONFIG_COMMON_CLK_ESWIN)		+= eswin/
>  obj-$(CONFIG_ARCH_HISI)			+= hisilicon/
> diff --git a/drivers/clk/cix/Kconfig b/drivers/clk/cix/Kconfig
> new file mode 100644
> index 000000000000..c92a9a873893
> --- /dev/null
> +++ b/drivers/clk/cix/Kconfig
> @@ -0,0 +1,16 @@
> +# SPDX-License-Identifier: GPL-2.0
> +# Audio subsystem clock support for Cixtech SoC family
> +menu "Clock support for Cixtech audss"

s/audss/AUDSS/

Or how about spelling out Audio Subsystem Clock Driver

[snip]

> +static const struct clk_ops sky1_audss_clk_mux_ops = {
> +	.get_parent = sky1_audss_clk_mux_get_parent,
> +	.set_parent = sky1_audss_clk_mux_set_parent,
> +	.determine_rate = sky1_audss_clk_mux_determine_rate,

Does this need an enable/disable for the pm_runtime get/put?

> +};
> +
> +static inline struct sky1_clk_divider *to_sky1_clk_divider(struct clk_divider *div)
> +{
> +	return container_of(div, struct sky1_clk_divider, div);
> +}
> +
> +static unsigned long sky1_audss_clk_divider_recalc_rate(struct clk_hw *hw,
> +							unsigned long parent_rate)
> +{
> +	struct clk_divider *divider = to_clk_divider(hw);
> +	struct sky1_clk_divider *sky1_div = to_sky1_clk_divider(divider);
> +	unsigned int val;
> +
> +	regmap_read(sky1_div->regmap, sky1_div->offset, &val);
> +	val = val >> divider->shift;
> +	val &= clk_div_mask(divider->width);
> +
> +	return divider_recalc_rate(hw, parent_rate, val, divider->table,
> +				   divider->flags, divider->width);
> +}
> +
> +static int sky1_audss_clk_divider_determine_rate(struct clk_hw *hw,
> +						 struct clk_rate_request *req)
> +{
> +	struct clk_divider *divider = to_clk_divider(hw);
> +	struct sky1_clk_divider *sky1_div = to_sky1_clk_divider(divider);
> +
> +	/* if read only, just return current value */
> +	if (divider->flags & CLK_DIVIDER_READ_ONLY) {
> +		u32 val;
> +
> +		regmap_read(sky1_div->regmap, sky1_div->offset, &val);
> +		val = val >> divider->shift;
> +		val &= clk_div_mask(divider->width);
> +
> +		return divider_ro_determine_rate(hw, req, divider->table,
> +						 divider->width,
> +						 divider->flags, val);
> +	}
> +
> +	return divider_determine_rate(hw, req, divider->table, divider->width,
> +				      divider->flags);
> +}
> +
> +static int sky1_audss_clk_divider_set_rate(struct clk_hw *hw,
> +					   unsigned long rate,
> +					   unsigned long parent_rate)
> +{
> +	struct clk_divider *divider = to_clk_divider(hw);
> +	struct sky1_clk_divider *sky1_div = to_sky1_clk_divider(divider);
> +	int value;
> +	unsigned long flags = 0;
> +	u32 val;
> +
> +	value = divider_get_val(rate, parent_rate, divider->table,
> +				divider->width, divider->flags);
> +	if (value < 0)
> +		return value;
> +
> +	if (divider->lock)
> +		spin_lock_irqsave(divider->lock, flags);
> +	else
> +		__acquire(divider->lock);
> +
> +	if (divider->flags & CLK_DIVIDER_HIWORD_MASK) {
> +		val = clk_div_mask(divider->width) << (divider->shift + 16);
> +	} else {
> +		regmap_read(sky1_div->regmap, sky1_div->offset, &val);
> +		val &= ~(clk_div_mask(divider->width) << divider->shift);
> +	}
> +	val |= (u32)value << divider->shift;
> +	regmap_write(sky1_div->regmap, sky1_div->offset, val);
> +
> +	if (divider->lock)
> +		spin_unlock_irqrestore(divider->lock, flags);
> +	else
> +		__release(divider->lock);
> +
> +	return 0;
> +}
> +
> +static const struct clk_ops sky1_audss_clk_divider_ops = {
> +	.recalc_rate = sky1_audss_clk_divider_recalc_rate,
> +	.determine_rate = sky1_audss_clk_divider_determine_rate,
> +	.set_rate = sky1_audss_clk_divider_set_rate,

Does this need an enable/disable for the pm_runtime get/put?

> +};
> +
> +static inline struct sky1_clk_gate *to_sky1_clk_gate(struct clk_gate *gate)
> +{
> +	return container_of(gate, struct sky1_clk_gate, gate);
> +}
> +
> +static void sky1_audss_clk_gate_endisable(struct clk_hw *hw, int enable)
> +{
> +	struct clk_gate *gate = to_clk_gate(hw);
> +	struct sky1_clk_gate *sky1_gate = to_sky1_clk_gate(gate);
> +	int set = gate->flags & CLK_GATE_SET_TO_DISABLE ? 1 : 0;
> +	unsigned long flags = 0;
> +	u32 reg;
> +
> +	set ^= enable;
> +
> +	if (gate->lock)
> +		spin_lock_irqsave(gate->lock, flags);
> +	else
> +		__acquire(gate->lock);
> +
> +	if (gate->flags & CLK_GATE_HIWORD_MASK) {
> +		reg = BIT(gate->bit_idx + 16);
> +		if (set)
> +			reg |= BIT(gate->bit_idx);
> +	} else {
> +		regmap_read(sky1_gate->regmap, sky1_gate->offset, &reg);
> +
> +		if (set)
> +			reg |= BIT(gate->bit_idx);
> +		else
> +			reg &= ~BIT(gate->bit_idx);
> +	}
> +
> +	regmap_write(sky1_gate->regmap, sky1_gate->offset, reg);
> +
> +	if (gate->lock)
> +		spin_unlock_irqrestore(gate->lock, flags);
> +	else
> +		__release(gate->lock);
> +}
> +
> +static int sky1_audss_clk_gate_enable(struct clk_hw *hw)
> +{
> +	sky1_audss_clk_gate_endisable(hw, 1);

pm_runtime_get ?

> +
> +	return 0;
> +}
> +
> +static void sky1_audss_clk_gate_disable(struct clk_hw *hw)
> +{
> +	sky1_audss_clk_gate_endisable(hw, 0);

pm_runtime_put ?

> +}
> +
> +static int sky1_audss_clk_gate_is_enabled(struct clk_hw *hw)
> +{
> +	struct clk_gate *gate = to_clk_gate(hw);
> +	struct sky1_clk_gate *sky1_gate = to_sky1_clk_gate(gate);
> +	u32 reg;
> +
> +	regmap_read(sky1_gate->regmap, sky1_gate->offset, &reg);
> +
> +	/* if a set bit disables this clk, flip it before masking */
> +	if (gate->flags & CLK_GATE_SET_TO_DISABLE)
> +		reg ^= BIT(gate->bit_idx);
> +
> +	reg &= BIT(gate->bit_idx);
> +
> +	return !!reg;
> +}
> +
> +static const struct clk_ops sky1_audss_clk_gate_ops = {
> +	.enable = sky1_audss_clk_gate_enable,
> +	.disable = sky1_audss_clk_gate_disable,
> +	.is_enabled = sky1_audss_clk_gate_is_enabled,
> +};
> +
> +static struct clk_hw *sky1_audss_clk_register(struct device *dev,
> +					      const char *name,
> +					      const char * const *parent_names,
> +					      int num_parents,
> +					      struct regmap *regmap,
> +					      const u32 *mux_table,
> +					      struct muxdiv_cfg *mux_cfg,
> +					      struct muxdiv_cfg *div_cfg,
> +					      struct gate_cfg *gate_cfg,
> +					      unsigned long flags,
> +					      spinlock_t *lock)
> +{
> +	const struct clk_ops *sky1_gate_ops = NULL;
> +	const struct clk_ops *sky1_mux_ops = NULL;
> +	const struct clk_ops *sky1_div_ops = NULL;
> +	struct sky1_clk_divider *sky1_div = NULL;
> +	struct sky1_clk_gate *sky1_gate = NULL;
> +	struct sky1_clk_mux *sky1_mux = NULL;
> +	struct clk_hw *hw = ERR_PTR(-ENOMEM);
> +	struct clk_parent_data *parent_data;
> +	int i;
> +
> +	parent_data = devm_kcalloc(dev, num_parents, sizeof(*parent_data), GFP_KERNEL);
> +	if (!parent_data)
> +		return ERR_PTR(-ENOMEM);
> +
> +	for (i = 0; i < num_parents; i++)
> +		parent_data[i].name = parent_names[i];
> +
> +	if (mux_cfg->offset >= 0) {
> +		sky1_mux = devm_kzalloc(dev, sizeof(*sky1_mux), GFP_KERNEL);
> +		if (!sky1_mux)
> +			return ERR_PTR(-ENOMEM);
> +
> +		sky1_mux->mux.reg = NULL;
> +		sky1_mux->mux.shift = mux_cfg->shift;
> +		sky1_mux->mux.mask = BIT(mux_cfg->width) - 1;
> +		sky1_mux->mux.flags = mux_cfg->flags;
> +		sky1_mux->mux.table = mux_table;
> +		sky1_mux->mux.lock = lock;
> +		sky1_mux_ops = &sky1_audss_clk_mux_ops;
> +		sky1_mux->regmap = regmap;
> +		sky1_mux->offset = mux_cfg->offset;
> +	}
> +
> +	if (div_cfg->offset >= 0) {
> +		sky1_div = devm_kzalloc(dev, sizeof(*sky1_div), GFP_KERNEL);
> +		if (!sky1_div)
> +			return ERR_PTR(-ENOMEM);
> +
> +		sky1_div->div.reg = NULL;
> +		sky1_div->div.shift = div_cfg->shift;
> +		sky1_div->div.width = div_cfg->width;
> +		sky1_div->div.flags = div_cfg->flags | CLK_DIVIDER_POWER_OF_TWO;
> +		sky1_div->div.lock = lock;
> +		sky1_div_ops = &sky1_audss_clk_divider_ops;
> +		sky1_div->regmap = regmap;
> +		sky1_div->offset = div_cfg->offset;
> +	}
> +
> +	if (gate_cfg->offset >= 0) {
> +		sky1_gate = devm_kzalloc(dev, sizeof(*sky1_gate), GFP_KERNEL);
> +		if (!sky1_gate)
> +			return ERR_PTR(-ENOMEM);
> +
> +		sky1_gate->gate.reg = NULL;
> +		sky1_gate->gate.bit_idx = gate_cfg->shift;
> +		sky1_gate->gate.flags = gate_cfg->flags;
> +		sky1_gate->gate.lock = lock;
> +		sky1_gate_ops = &sky1_audss_clk_gate_ops;
> +		sky1_gate->regmap = regmap;
> +		sky1_gate->offset = gate_cfg->offset;
> +	}
> +
> +	hw = devm_clk_hw_register_composite_pdata(dev, name, parent_data, num_parents,
> +						sky1_mux ? &sky1_mux->mux.hw : NULL, sky1_mux_ops,
> +						sky1_div ? &sky1_div->div.hw : NULL, sky1_div_ops,
> +						sky1_gate ? &sky1_gate->gate.hw : NULL, sky1_gate_ops,
> +						flags);
> +	if (IS_ERR(hw)) {
> +		dev_err(dev, "register %s clock failed with err = %ld\n",
> +			name, PTR_ERR(hw));
> +		return hw;
> +	}
> +
> +	return hw;
> +}
> +
> +static int sky1_audss_clks_get(struct sky1_audss_clks_priv *priv)
> +{
> +	const struct sky1_audss_clks_devtype_data *devtype_data = priv->devtype_data;
> +	int i;
> +
> +	for (i = 0; i < devtype_data->clk_num; i++) {
> +		priv->clks[i] = devm_clk_get(priv->dev, devtype_data->clk_names[i]);
> +		if (IS_ERR(priv->clks[i]))
> +			return dev_err_probe(priv->dev, PTR_ERR(priv->clks[i]),
> +					     "failed to get clock %s", devtype_data->clk_names[i]);
> +	}
> +
> +	return 0;
> +}
> +
> +static int sky1_audss_clks_enable(struct sky1_audss_clks_priv *priv)
> +{
> +	const struct sky1_audss_clks_devtype_data *devtype_data = priv->devtype_data;
> +	int i, err;
> +
> +	for (i = 0; i < devtype_data->clk_num; i++) {
> +		err = clk_prepare_enable(priv->clks[i]);
> +		if (err) {
> +			dev_err(priv->dev, "failed to enable clock %s\n",
> +				devtype_data->clk_names[i]);
> +			goto err_clks;
> +		}
> +	}
> +
> +	return 0;
> +
> +err_clks:
> +	while (--i >= 0)
> +		clk_disable_unprepare(priv->clks[i]);
> +
> +	return err;
> +}
> +
> +static void sky1_audss_clks_disable(struct sky1_audss_clks_priv *priv)
> +{
> +	const struct sky1_audss_clks_devtype_data *devtype_data = priv->devtype_data;
> +	int i;
> +
> +	for (i = 0; i < devtype_data->clk_num; i++)
> +		clk_disable_unprepare(priv->clks[i]);
> +}
> +
> +static int sky1_audss_clks_set_rate(struct sky1_audss_clks_priv *priv)
> +{
> +	const struct sky1_audss_clks_devtype_data *devtype_data = priv->devtype_data;
> +	int i, err;
> +
> +	for (i = 0; i < devtype_data->clk_num; i++) {
> +		err = clk_set_rate(priv->clks[i], devtype_data->clk_rate_default[i]);
> +		if (err) {
> +			dev_err(priv->dev, "failed to set clock rate %s\n",
> +				devtype_data->clk_names[i]);
> +			return err;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
> +static void sky1_audss_clk_rpm_cleanup(void *data)
> +{
> +	struct device *dev = data;
> +
> +	if (!pm_runtime_status_suspended(dev))
> +		pm_runtime_force_suspend(dev);
> +
> +	pm_runtime_disable(dev);

Take a look at pm_runtime_force_suspend() in
drivers/base/power/runtime.c. It already calls pm_runtime_disable(), so
if it's not suspended then there is a double disable here.

Brian

