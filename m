Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CE593375DC
	for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 02:05:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768529146; cv=none; b=Lkt/3yEX6kS4dLLd8xCi2Z2baJCAA2XkTfj3cLSgTnFvI/89rBuj134f7nFGT/LiUStm1PvH8gvYO8IXPdquzvyK2j0k4r7lmn+E3OgTFa2e8csvdNbfWJ/3VlbGScUHhIixoI4fV+heBSVYvp98TUCy68SaJczzqQhKy1iHs6o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768529146; c=relaxed/simple;
	bh=j3DZ3MLheBzPZCcXceHMdl1oFCSl1YqhTX1+xmDy62c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ksW7S04VLbJ++nCF5t88WRvIqSaZnCLw2HoPMbuVYxF8HvzdstRmiBh6jvCkz+lAtiRDChxNdzFgaYrSXKO+DYu1mbW0CimGvlJMSRL19LMlwc3Miu4M2NKSTTM5aDxV9B5Iemswxs9gGEXmIQj5iIpiWHcDNHfmHWi/32StAgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=g/Plv7a7; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZeUzeTfJ; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="g/Plv7a7";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZeUzeTfJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1768529142;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gG1D0fzVJ1vGqbm/rZq2UIHNeWOawXntGG6W46KCvjs=;
	b=g/Plv7a7Js2SDQ4nhkM/TFiYoqvA6zAzJxguBC3bpwGqx0lcULT9sHQb3PyrGWa90sB09L
	u/ks0+GqE8NVrTx5vMpPnF9ZYPMzWq/B8cn2TlDm5S4PJl1XA7MrJ3ek1pLG+NOeibQxjp
	cfOPeZJUM5O1tT66q4Ws5OiftcQM+SA=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-7-ffvKi2fYMUKPfxkUKtNAXw-1; Thu, 15 Jan 2026 21:05:41 -0500
X-MC-Unique: ffvKi2fYMUKPfxkUKtNAXw-1
X-Mimecast-MFC-AGG-ID: ffvKi2fYMUKPfxkUKtNAXw_1768529140
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8c538971a16so374837185a.1
        for <linux-clk@vger.kernel.org>; Thu, 15 Jan 2026 18:05:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1768529140; x=1769133940; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gG1D0fzVJ1vGqbm/rZq2UIHNeWOawXntGG6W46KCvjs=;
        b=ZeUzeTfJnduLKXZ+66a/Umpgo/pX+qVr7uRlx8+Pg3oGU8uzLFiuTRPuIEQRoIZznt
         MZmSbBNCgjeiwI8qne+x7N9XyFOSA08zgrSIKgbC7EfqNIIA1mHbBGKxXmwUysTuJ0KF
         2L045HnE7+ibdFN8gYyVZGCAtSPvTdnaGyUmwhV+MjlyZVYcOOLL3JrjsMc0d+yWJtQq
         3LZu/qrjesbBD7dirsOjnlwbaf8FDnTOGQmlD/6RMRysT8WN6uiW2ONKT2vi0RNkJjAG
         txXGQZW6KaycSlPAad779zaWxBL1+MnwnURHXJN6eKQe46pODKS5DYcM1KeOZLgtmk+M
         bDhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768529140; x=1769133940;
        h=user-agent:in-reply-to:content-disposition:mime-version:references
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gG1D0fzVJ1vGqbm/rZq2UIHNeWOawXntGG6W46KCvjs=;
        b=BE2YWr4iM1BLZhlZoK/H9Q0uBk04EsmE66hmXePTWWt7+HE707kL4JWmZlyG5VE28y
         qTHHISI1z4FSw0IxiNcUTgsIfL+wm1C4jTFlDBzou56az0wVgGCXQ25SnFyTLojvKjyb
         aalTKbm+fyAbAuHz9IT90W9ppzDfpNvioG/35VUmrm+w3YUpjZdHwp8ro73GUdFgA0Mz
         0frpjZeJIJxcff9w9AOSLzOtf4zDYmBda/8HPJ8cYLI7s2kOUdL3pm9rDjalaU3odt04
         kJpoeEL92Hu+80D0qlCcUzSr/tBUINh66zvC307LxshA/kMkNGo3d6d/0dEWy05Y+I9r
         rd9w==
X-Forwarded-Encrypted: i=1; AJvYcCXtE5OFQrVXjLx+hjKQc+C+nQln8D+1UVVae1gOiSwWriKhtUSp3gEcFRsTUaS8+XH0upbSTLCPwLI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxIlIcMIMxksMsHYiPSfLDISVFr+NV5T9VsPJl9Htktrf9y3hT
	ufzDoLnuoq+4HAo+oKL1AXILboTStCdh2IK2H4gC8ooT29/2jDNQNcNO3+XTq5/oiMZct3zF0CD
	FJKBFVDO2chJPPGDAoZZWwsO5Y/PmguB5MAg+AiJlk60j6CnzGvsZp54XbG+C77nqOEkFZQ==
X-Gm-Gg: AY/fxX5zqsnunAvR7N5JPPWXoHQdsD9NuO3yJpETTJzq3A1gJQKRSN6ZTcDqERg8iYG
	9SmO3CgUhJNkVfvdcgzb0Tr2EGj1d4vpTffELvFSyLeZP2CKUNaP4k786yjdrfbwHkXBJZ5Vjj1
	glSRICJ2Erl1GhGF1aIKkVNcawLa1IpvRqjesDHVKz8MsKsybCVin30tLR1v1hhng9I0Fy9kvVm
	Dqq4jnG8GANx4oGX7bFdEGV1tyDLn4SYqYloQRDXL+WD5YFcjLsm80ssAkTyJaY26K7KhIRzX3Z
	uZ2yL1ZrMwMe9LxxRboyPglzKP44oot3anAX4SHjhG9xcs/r/IWIizKTuyQGGumRQDposjcIQdA
	ozzLrHLa+w7JNLq5nWMjfQREXacAsODQwpiTWLDGJTJHo
X-Received: by 2002:a05:620a:710c:b0:89e:b0bd:ced9 with SMTP id af79cd13be357-8c6a6770539mr238136985a.43.1768529140429;
        Thu, 15 Jan 2026 18:05:40 -0800 (PST)
X-Received: by 2002:a05:620a:710c:b0:89e:b0bd:ced9 with SMTP id af79cd13be357-8c6a6770539mr238134985a.43.1768529139939;
        Thu, 15 Jan 2026 18:05:39 -0800 (PST)
Received: from redhat.com (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c6a71c06e5sm106501685a.16.2026.01.15.18.05.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Jan 2026 18:05:39 -0800 (PST)
Date: Thu, 15 Jan 2026 21:05:35 -0500
From: Brian Masney <bmasney@redhat.com>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>,
	Joel Stanley <jms@oss.tenstorrent.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	joel@jms.id.au, fustini@kernel.org, mpe@kernel.org,
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com,
	agross@kernel.org, agross@oss.tenstorrent.com
Subject: Re: [PATCH 3/8] clk: tenstorrent: Add Atlantis clock controller
 driver
Message-ID: <aWmc73irBAM8DZwF@redhat.com>
References: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
 <20260115-atlantis-clocks-v1-3-7356e671f28b@oss.tenstorrent.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115-atlantis-clocks-v1-3-7356e671f28b@oss.tenstorrent.com>
User-Agent: Mutt/2.2.14 (2025-02-20)

Hi Anirudh,

Thanks for the patch!

On Thu, Jan 15, 2026 at 05:42:02PM -0600, Anirudh Srinivasan wrote:
> Add driver for syscon block in Tenstorrent Atlantis SoC. This version of
> the driver coves clocks from RCPU syscon.
> 
> 5 types of clocks generated by this controller: PLLs (PLLs
> with bypass functionality and an additional Gate clk at output), Shared
> Gates (Multiple Gate clks that share an enable bit), standard Muxes,
> Dividers and Gates. All clocks are derived from a 24 Mhz oscillator.
> 
> Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> ---
> diff --git a/drivers/clk/tenstorrent/atlantis-ccu.c b/drivers/clk/tenstorrent/atlantis-ccu.c
> new file mode 100644
> index 000000000000..f3a2ea49a82e
> --- /dev/null
> +++ b/drivers/clk/tenstorrent/atlantis-ccu.c
> @@ -0,0 +1,932 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (c) 2026 Tenstorrent
> + */
> +
> +#include <linux/array_size.h>
> +#include <linux/auxiliary_bus.h>
> +#include <linux/clk-provider.h>
> +#include <linux/delay.h>
> +#include <linux/idr.h>
> +#include <linux/mfd/syscon.h>
> +#include <linux/minmax.h>
> +#include <linux/module.h>
> +#include <linux/platform_device.h>
> +#include <linux/slab.h>
> +
> +#include <soc/tenstorrent/atlantis-syscon.h>
> +
> +#include <dt-bindings/clock/tenstorrent,atlantis-syscon.h>
> +#include <linux/regmap.h>
> +#include <linux/clk-provider.h>
> +#include <linux/math.h>
> +#include <linux/bitfield.h>

Please sort the headers. clk-provider.h is listed twice. Remove the
unnecessary newlines.

> +static void atlantis_ccu_lock(void *_lock)
> +{
> +	spinlock_t *lock = _lock;
> +
> +	spin_lock(lock);
> +}
> +
> +static void atlantis_ccu_unlock(void *_lock)
> +{
> +	spinlock_t *lock = _lock;
> +
> +	spin_unlock(lock);
> +}

Are these abstractions really needed? Why not just call spin_lock/unlock
directly?

> +static int atlantis_ccu_clocks_register(struct device *dev,
> +					struct atlantis_ccu *ccu,
> +					const struct atlantis_ccu_data *data)
> +{
> +	struct regmap *regmap = ccu->regmap;
> +	struct clk_hw_onecell_data *clk_data;
> +	int i, ret;
> +	size_t num_clks = data->num;
> +
> +	clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, data->num),
> +				GFP_KERNEL);
> +	if (!clk_data)
> +		return -ENOMEM;
> +
> +	ccu->clk_data = clk_data;
> +
> +	for (i = 0; i < data->num; i++) {
> +		struct clk_hw *hw = data->hws[i];
> +		const char *name = hw->init->name;
> +		struct atlantis_clk_common *common =
> +			hw_to_atlantis_clk_common(hw);
> +		common->regmap = regmap;
> +
> +		/* Fixup missing handle to parent for gates/muxes/dividers */
> +		if (hw->init->parent_hws && hw->init->num_parents == 1) {
> +			const struct atlantis_clk_common *parent =
> +				hw_to_atlantis_clk_common(
> +					hw->init->parent_hws[0]);
> +			hw->init->parent_hws[0] = clk_data->hws[parent->clkid];
> +		}
> +
> +		switch (common->clk_type) {
> +		case ATLANTIS_CLK_MUX:
> +			struct atlantis_clk_mux *mux =
> +				hw_to_atlantis_clk_mux(hw);
> +
> +			hw = devm_clk_hw_register_mux_parent_data_table(
> +				ccu->dev, name, hw->init->parent_data,
> +				hw->init->num_parents, hw->init->flags,
> +				ccu->base + mux->config.reg_offset,
> +				mux->config.shift, mux->config.width, 0, NULL,
> +				&lock);
> +
> +			if (IS_ERR(hw)) {
> +				dev_err(dev, "Cannot register clock %d - %s\n",
> +					i, name);
> +				return ret;

return PTR_ERR(hw);

> +			}
> +
> +			if (data == &atlantis_ccu_rcpu_data) {
> +				switch (common->clkid) {
> +				case CLK_RCPU_ROOT:
> +					ret = clk_hw_set_parent(
> +						hw,
> +						clk_data->hws[CLK_RCPU_PLL]);

Should the parent be defined in device tree instead of statically in the
driver? devm_of_clk_add_hw_provider() is called below, and it calls
of_clk_set_defaults(), which will allow the use of the
assigned-clock-parents and assigned-clocks properties.

> +					if (ret)
> +						dev_err(ccu->dev,
> +							"Failed to set RCPU ROOT MUX parent: %d\n",
> +							ret);
> +					break;
> +				case CLK_NOCC_CLK:
> +					ret = clk_hw_set_parent(
> +						hw, clk_data->hws[CLK_NOC_PLL]);
> +					if (ret)
> +						dev_err(ccu->dev,
> +							"Failed to set NOCC Mux parent: %d\n",
> +							ret);
> +					break;
> +				}
> +			}
> +			break;
> +		case ATLANTIS_CLK_DIVIDER:
> +			struct atlantis_clk_divider *div =
> +				hw_to_atlantis_clk_divider(hw);
> +
> +			hw = devm_clk_hw_register_divider_parent_hw(
> +				ccu->dev, name, common->hw.init->parent_hws[0],
> +				div->common.hw.init->flags,
> +				ccu->base + div->config.reg_offset,
> +				div->config.shift, div->config.width,
> +				div->config.flags, &lock);
> +
> +			if (IS_ERR(hw)) {
> +				dev_err(dev, "Cannot register clock %d - %s\n",
> +					i, name);
> +				return ret;
> +			}
> +
> +			break;
> +		case ATLANTIS_CLK_GATE:
> +			struct atlantis_clk_gate *gate =
> +				hw_to_atlantis_clk_gate(hw);
> +
> +			hw = devm_clk_hw_register_gate_parent_hw(
> +				ccu->dev, name, common->hw.init->parent_hws[0],
> +				hw->init->flags,
> +				ccu->base + gate->config.reg_offset,
> +				ffs(gate->config.enable) - 1, 0, &lock);
> +
> +			if (IS_ERR(hw)) {
> +				dev_err(dev, "Cannot register clock %d - %s\n",
> +					i, name);
> +				return ret;

return PTR_ERR(hw);

> +			}
> +
> +			break;
> +		case ATLANTIS_CLK_FIXED_FACTOR:
> +			struct atlantis_clk_fixed_factor *factor =
> +				hw_to_atlantis_clk_fixed_factor(hw);
> +
> +			if (hw->init->parent_data) {
> +				hw = devm_clk_hw_register_fixed_factor_index(
> +					dev, name,
> +					hw->init->parent_data[0].index,
> +					hw->init->flags, factor->config.mult,
> +					factor->config.div);
> +			} else {
> +				hw = devm_clk_hw_register_fixed_factor_parent_hw(
> +					dev, name, hw->init->parent_hws[0],
> +					hw->init->flags, factor->config.mult,
> +					factor->config.div);
> +			}
> +			if (IS_ERR(hw)) {
> +				dev_err(dev, "Cannot register clock %d - %s\n",
> +					i, name);
> +				return ret;

return PTR_ERR(hw);

> +			}
> +			break;
> +		case ATLANTIS_CLK_GATE_SHARED:
> +			struct atlantis_clk_gate_shared *gate_shared =
> +				hw_to_atlantis_clk_gate_shared(hw);
> +			gate_shared->config.refcount_lock = &refcount_lock;
> +
> +			ret = devm_clk_hw_register(dev, hw);
> +

Unnecessary newline

> +			if (ret) {
> +				dev_err(dev, "Cannot register clock %d - %s\n",
> +					i, name);
> +				return ret;
> +			}
> +
> +			break;
> +		default:
> +
> +			ret = devm_clk_hw_register(dev, hw);
> +

Unnecessary newline

Brian

