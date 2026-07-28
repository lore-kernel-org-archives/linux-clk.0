Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 874FC390CA3
	for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 13:42:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785246136; cv=none; b=Kgndx/t0+eHLQkHIBYABhNy5trkljQh/p1LWl4x3vTykFRVPaB+Z7gAOYS5Q7eo34V6SRS2Ggp9PQeK/o8D/CJc+ihzzjEUcXOBTvBl9X8kM1JQv14oOXx3J5432nSVT5iuLBPSDhQUvHf2SaPiJZCUAbQDaX4lh3MizhWdoXfM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785246136; c=relaxed/simple;
	bh=o5hmn0o1eJi1oPcTIaRKtd4EVqB0u40I4yA2PmjGyek=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Rup4fnGr9sHTyPn0C3bwzQFsj5mT230vpBEluIo8Ce96PFrdnwAQ6DMXuROx8Ed6y7IaU+q6YVHm0QJnK9op7hh6xOgu4+qX3f1sz4tIbH/8cXtEytD3Z/zti8PHpm+PiyBSrNCgP7BmmkXLFrUYbprhPE+kwegvjPS0iSzp6EE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gzbgq9pX; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=QUwaMweH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gzbgq9pX";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="QUwaMweH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785246133;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=zkiuYMKfTZUCAQyXJDsyAYrYbc3+oqsrPiHuKHrbdH4=;
	b=Gzbgq9pXtRTUVEbubo49Fge7jRipokeMLlzRmQlS77D5l1HSMH6iut6IQe8yx5+f6nRf6S
	+7qZNOQYKEm1eD9wKQ+rxPnB43RzIX3vMcysJSE79IoCQZ3O3AHu8oVQOcODkfWDPaooRs
	YanHLswsYyapL2ZWPmbZBqa4/Gioyxw=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-265-nqq1nlHJNhaetqTZUjsrBg-1; Tue, 28 Jul 2026 09:42:11 -0400
X-MC-Unique: nqq1nlHJNhaetqTZUjsrBg-1
X-Mimecast-MFC-AGG-ID: nqq1nlHJNhaetqTZUjsrBg_1785246130
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-907e49dbae8so31620986d6.0
        for <linux-clk@vger.kernel.org>; Tue, 28 Jul 2026 06:42:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1785246130; x=1785850930; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zkiuYMKfTZUCAQyXJDsyAYrYbc3+oqsrPiHuKHrbdH4=;
        b=QUwaMweHXhS0WGZDP6K6Pms8C5E/L7tUT1xho6vWHB9jVEbn0iMcundI9sMBR6ZCVx
         7b5HXexXQHJEJ23269DwerdnbT4CFVKa8tBQ5+sYeaDWm74q/xx9jxWOejpyllslqbW0
         319f2cr+hdqMetxnDb7Fik5d0WYSg0Q+m4uSHbDkRTyZBzssejJDgPq41kZghqc6xcMy
         G6xKzlSc7CqRKTRZ/C6k/1HwcDdQ42gc11EzE0e0uyiBGXwaBAKjeBuG9yvN8oPJdp7a
         g0yxeG5fgP9E8vHBkUlN3A8pyYxyztvIFjTFsfZePzldeGlX4yjm+w8XsCDz9yxn+S7W
         WAfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785246130; x=1785850930;
        h=user-agent:in-reply-to:content-transfer-encoding
         :content-disposition:content-type:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zkiuYMKfTZUCAQyXJDsyAYrYbc3+oqsrPiHuKHrbdH4=;
        b=I4uG0YXg8MuPiR+4ByEvXy8s2cjpkHgxsjgFMjEEFLwc/AFbcOQYS0227lqteK/XtI
         8O556lP/jsRUkRwC4P5tVvX3iIy7lVhO95RSjTnIZ+g5ut/w5mY39mPohnuoLEsVCbuJ
         shKh7Okw/MtfK155UZQcc/LNYylGL91kN7j5Xvo0b5hc2HvPRKweZ80CI8dp7YdXysZn
         kAsoHUa8i5gakYzRSUUGWErPEpcu5Oq5KuNbnQqDqoF5XS71175bJgGCu1mZD6Kq0mFI
         sfDoNXn63uBd9HDT4TkfRw1faqqWh4vi83LyxtzfP7ZxJKGxSciJioTT2zLPAUuNd2Wg
         iJ9A==
X-Forwarded-Encrypted: i=1; AHgh+Ro+Tpf9uIrBuS3JcgV9jdeAhGMrYaqVWjV/2BdIHpaWttkA1+hCUMAp9uK+rJyLCPVo73L9Xe1ukz0=@vger.kernel.org
X-Gm-Message-State: AOJu0YygzRhjZozPnvjt+NQqZX2Re5xiYGLpfm2JRCMmfvFsHGgpb0DH
	FZSSxxGE50PygAvlc8E39FTZx1EPYo2qkJdrMiftK5yk+5fH+chQ/wTUAGGFVOVOuN3MSaQ0XE6
	ScC/o87KIOSXb9qX155KsPk/XNcNsiSRQ/f5fpdoNGqpHDYsNE6hj58mTnP24/A==
X-Gm-Gg: AR+sD12wBFSDE5DXPKeCnGsRVsc2LDwuyx/ycMA7afQqnISn9/HbIUCTEeYm8H8meVx
	6tCKbHkT6cPDS/7NmxzJgiWrdFs+XG8yNZE08vT/JQhBdtOhdFius8VS+oMNB3cADlF48V+Fzjg
	kY89kYs30UQ0+nF+sOlTiI4GanlvelKbFD6kl5W/dzW4KPKlHrT9UmqG2y/KduRmp0FQjHpld+r
	7puu4xloqzxlTbO1XoI0qlqeB+ceXNhoap3VjzdoB6+iI9BW3EA1TZ2GlQNUfNaGc9BRrCpVL49
	mU+ukQXsZuufgAVLi08xyxMcyG0SOlq3f/RIWBeuM6ULYKKnC4qpWJNGV6i7YicQPnBrX+a3O9Y
	A5siEVC7Kt2C0FtPI53pmqDQ75LVkywK9I8w=
X-Received: by 2002:a05:6214:5545:b0:8e8:7de7:ec20 with SMTP id 6a1803df08f44-90816f640a7mr25742536d6.4.1785246130272;
        Tue, 28 Jul 2026 06:42:10 -0700 (PDT)
X-Received: by 2002:a05:6214:5545:b0:8e8:7de7:ec20 with SMTP id 6a1803df08f44-90816f640a7mr25741856d6.4.1785246129549;
        Tue, 28 Jul 2026 06:42:09 -0700 (PDT)
Received: from redhat.com (c-73-183-53-213.hsd1.pa.comcast.net. [73.183.53.213])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907e86d499dsm87767676d6.42.2026.07.28.06.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Jul 2026 06:42:07 -0700 (PDT)
Date: Tue, 28 Jul 2026 09:42:06 -0400
From: Brian Masney <bmasney@redhat.com>
To: Stefan =?iso-8859-1?Q?D=F6singer?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>,
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-phy@lists.infradead.org, mfd@lists.linux.dev
Subject: Re: [PATCH v8 06/12] clk: zte: Add regmap-based clocks
Message-ID: <amixrkffNj_JuXtU@redhat.com>
References: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
 <20260727-zx29clk-v8-6-7a107b00f1dd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260727-zx29clk-v8-6-7a107b00f1dd@gmail.com>
User-Agent: Mutt/2.4.0 (2026-06-19)

On Mon, Jul 27, 2026 at 09:24:21PM +0300, Stefan Dösinger wrote:
> This is based on meson/clk-regmap.c, although slightly simplified. I
> have kept the copyright lines at the top of the file to indicate its
> origin.
> 
> I see that numerous clock drivers have their own incarnation of regmap-
> based mux/div/gate clocks. If there is any version of it that is likely
> to be elevated to shared code like clk-gate.c I'll copy that and try to
> use it as unmodified as possible.
> 
> Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
> 
> ---
> 
> Version 8: Use ZX297520V3_CLK_NO_EXPORT instead of 0 for unexported clocks.
> 
> Version 6: Remove stray regmap (Sashiko)
> 
> Version 5: Use regmap_test_bits in zte_clk_regmap_gate_is_enabled
> ---
>  drivers/clk/zte/clk-regmap.c | 218 ++++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 215 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/zte/clk-regmap.c b/drivers/clk/zte/clk-regmap.c
> index 984abeb45ab2..671b81bcda4d 100644
> --- a/drivers/clk/zte/clk-regmap.c
> +++ b/drivers/clk/zte/clk-regmap.c
> @@ -7,28 +7,240 @@
>   */
>  
>  #include <linux/clk-provider.h>
> +#include <linux/container_of.h>
>  #include <linux/device.h>
>  #include <linux/regmap.h>
> +#include <linux/types.h>
>  #include <linux/errno.h>
> +#include <linux/bits.h>
> +#include <linux/err.h>
>  
>  #include "clk-zx.h"
>  
> +struct zte_clk_regmap {
> +	struct clk_hw	hw;
> +	struct regmap	*map;
> +	u16		reg;
> +	u8		shift;
> +	u8		size;
> +};
> +
> +static inline struct zte_clk_regmap *to_zte_clk_regmap(struct clk_hw *hw)
> +{
> +	return container_of(hw, struct zte_clk_regmap, hw);
> +}
> +
> +static int zte_clk_regmap_gate_enable(struct clk_hw *hw)
> +{
> +	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
> +
> +	return regmap_set_bits(clk->map, clk->reg, BIT(clk->shift));
> +}
> +
> +static void zte_clk_regmap_gate_disable(struct clk_hw *hw)
> +{
> +	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
> +
> +	regmap_clear_bits(clk->map, clk->reg, BIT(clk->shift));
> +}
> +
> +static int zte_clk_regmap_gate_is_enabled(struct clk_hw *hw)
> +{
> +	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
> +
> +	return regmap_test_bits(clk->map, clk->reg, BIT(clk->shift));
> +}
> +
> +static const struct clk_ops zte_clk_regmap_gate_ops = {
> +	.enable		= zte_clk_regmap_gate_enable,
> +	.disable	= zte_clk_regmap_gate_disable,
> +	.is_enabled	= zte_clk_regmap_gate_is_enabled,
> +};
> +
>  int zx_clk_register_gates(struct device *dev, struct regmap *regmap,
>  			  const struct zx_gate_desc *desc, unsigned int num,
>  			  struct clk_hw_onecell_data *clocks)
>  {
> -	return -ENODEV;
> +	struct zte_clk_regmap *clk;
> +	unsigned int i;
> +	int res;
> +
> +	for (i = 0; i < num; ++i) {
> +		struct clk_init_data init = {};
> +
> +		clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
> +		if (!clk)
> +			return -ENOMEM;
> +
> +		init.name = desc[i].name;
> +		init.ops = &zte_clk_regmap_gate_ops;
> +		init.parent_names = &desc[i].parent;
> +		init.num_parents = 1;
> +		init.flags = CLK_SET_RATE_PARENT | desc[i].flags;
> +		clk->hw.init = &init;
> +		clk->map = regmap;
> +		clk->reg = desc[i].reg;
> +		clk->shift = desc[i].shift;
> +		clk->size = 1;
> +
> +		res = devm_clk_hw_register(dev, &clk->hw);
> +		if (res)
> +			return dev_err_probe(dev, res, "Failed to register clk %s\n", desc[i].name);
> +
> +		if (desc[i].id != ZX297520V3_CLK_NO_EXPORT)
> +			clocks->hws[desc[i].id] = &clk->hw;
> +	}
> +
> +	return 0;
> +}
> +
> +static unsigned long zte_clk_regmap_div_recalc_rate(struct clk_hw *hw,
> +						    unsigned long prate)
> +{
> +	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
> +	unsigned int val;
> +	int ret;
> +
> +	ret = regmap_read(clk->map, clk->reg, &val);
> +	if (ret)
> +		/* Gives a hint that something is wrong */
> +		return 0;
> +
> +	val >>= clk->shift;
> +	val &= clk_div_mask(clk->size);
> +	return divider_recalc_rate(hw, prate, val, NULL, 0, clk->size);

Newline before the return

> +}
> +
> +static int zte_clk_regmap_div_determine_rate(struct clk_hw *hw,
> +					     struct clk_rate_request *req)
> +{
> +	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
> +
> +	return divider_determine_rate(hw, req, NULL, clk->size, 0);
> +}
> +
> +static int zte_clk_regmap_div_set_rate(struct clk_hw *hw, unsigned long rate,
> +				       unsigned long parent_rate)
> +{
> +	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
> +	unsigned int val;
> +	int ret;
> +
> +	ret = divider_get_val(rate, parent_rate, NULL, clk->size, 0);
> +	if (ret < 0)
> +		return ret;
> +
> +	val = (unsigned int)ret << clk->shift;
> +	return regmap_update_bits(clk->map, clk->reg, clk_div_mask(clk->size) << clk->shift, val);
>  }
>  
> +static const struct clk_ops zte_clk_regmap_divider_ops = {
> +	.recalc_rate = zte_clk_regmap_div_recalc_rate,
> +	.determine_rate = zte_clk_regmap_div_determine_rate,
> +	.set_rate = zte_clk_regmap_div_set_rate,
> +};
> +
>  int zx_clk_register_dividers(struct device *dev, struct regmap *regmap,
>  			     const struct zx_div_desc *desc, unsigned int num)
>  {
> -	return -ENODEV;
> +	struct zte_clk_regmap *clk;
> +	unsigned int i;
> +	int res;
> +
> +	for (i = 0; i < num; ++i) {
> +		struct clk_init_data init = {};
> +
> +		clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
> +		if (!clk)
> +			return -ENOMEM;
> +
> +		init.name = desc[i].name;
> +		init.ops = &zte_clk_regmap_divider_ops;
> +		init.parent_names = &desc[i].parent;

Use parent_data instead of parent_names

> +		init.num_parents = 1;
> +		init.flags = CLK_SET_RATE_PARENT;
> +		clk->hw.init = &init;
> +		clk->map = regmap;
> +		clk->reg = desc[i].reg;
> +		clk->shift = desc[i].shift;
> +		clk->size = desc[i].size;
> +
> +		res = devm_clk_hw_register(dev, &clk->hw);
> +		if (res)
> +			return dev_err_probe(dev, res, "Failed to register clk %s\n", desc[i].name);
> +	}
> +
> +	return 0;
>  }
>  
> +static u8 zte_clk_regmap_mux_get_parent(struct clk_hw *hw)
> +{
> +	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
> +	unsigned int val;
> +	int ret;
> +
> +	ret = regmap_read(clk->map, clk->reg, &val);
> +	if (ret)
> +		return 0xff;
> +
> +	val >>= clk->shift;
> +	val &= GENMASK(clk->size - 1, 0);
> +	return clk_mux_val_to_index(hw, NULL, 0, val);
> +}
> +
> +static int zte_clk_regmap_mux_set_parent(struct clk_hw *hw, u8 index)
> +{
> +	struct zte_clk_regmap *clk = to_zte_clk_regmap(hw);
> +	unsigned int val = clk_mux_index_to_val(NULL, 0, index);
> +
> +	return regmap_update_bits(clk->map, clk->reg,
> +				  GENMASK(clk->size - 1, 0) << clk->shift,
> +				  val << clk->shift);
> +}
> +
> +static int zte_clk_regmap_mux_determine_rate(struct clk_hw *hw, struct clk_rate_request *req)
> +{
> +	return clk_mux_determine_rate_flags(hw, req, 0);
> +}
> +
> +static const struct clk_ops zte_clk_regmap_mux_ops = {
> +	.get_parent = zte_clk_regmap_mux_get_parent,
> +	.set_parent = zte_clk_regmap_mux_set_parent,
> +	.determine_rate = zte_clk_regmap_mux_determine_rate,
> +};
> +
>  int zx_clk_register_muxes(struct device *dev, struct regmap *regmap,
>  			  const struct zx_mux_desc *desc, unsigned int num,
>  			  struct clk_hw_onecell_data *clocks)
>  {
> -	return -ENODEV;
> +	struct zte_clk_regmap *clk;
> +	unsigned int i;
> +	int res;
> +
> +	for (i = 0; i < num; ++i) {
> +		struct clk_init_data init = {};
> +
> +		clk = devm_kzalloc(dev, sizeof(*clk), GFP_KERNEL);
> +		if (!clk)
> +			return -ENOMEM;
> +
> +		init.name = desc[i].name;
> +		init.ops = &zte_clk_regmap_mux_ops;
> +		init.parent_names = desc[i].parents;

Use parent_data instead of parent_names

Brian

