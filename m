Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A987A4F30F0
	for <linux-clk@vger.kernel.org>; Fri,  9 Oct 2026 18:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791570599; cv=none; b=nmLxqPdPI9V5ooku74BzZR3goj2hWZrrI+DJjeZY4raDhXAA+4yh3lvzu6Ve2fP9FzjnHz5G4I/WXJgfgt7IyBP1j7v3PVdEekUHnyBGnO79WDnaZ7yX3PcH229yhffv6Tfeiq0GHmgI7mXwIUti4gV2zmlDB0R3yIxuXU0LAYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791570599; c=relaxed/simple;
	bh=XNzr2wNUNghrBBxT8exO2uqCTKmR32NqYT7zK1+uz7E=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=Rhf6WUMmtcQWIQNWzgnLULQgDhCmt7yu/T3YPzUtvOSh0BiJD3NXDPaHuXK0i8faHcb7yRLEbxugMvHH5DldVjQlo4tZZSDIDPh1LoF9oLt4Hp2fqjlFeKXrLwgRCExS+Rrg9mMQ91tk7cvvwLCEoYn4fVCJeCCQTvkK25J63L0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=JMH5HjF0; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="JMH5HjF0"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso1491475e9.3
        for <linux-clk@vger.kernel.org>; Fri, 09 Oct 2026 11:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1791570586; x=1792175386; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=BpjtofrkUDRqvSiMqlyAYlghXPAPat+XcdincmK9q5k=;
        b=JMH5HjF0gTC8LSamwc1Fsq1sEnBsFhtr8+l6Hb7vRyeuJBHbLEDCbxloyP2cxplCRH
         JuPVdAwbo6l+Qy7gZ8JDaX+mfzJX9j8RmVwejUmZtnAVouiXzFDr8/R1OlbsfrYwqafu
         QaYoaQGuAlBtOH28+nXV9hiMr87SNwl/keS+gDL+lS88OpjnrJ704zmd2vcgiQNEIXQw
         UeS/NiYig/eAHJOYT/VtbnKlo7C2X7qsAxnGmW/Vq9ArXjrIB0cTLSU+Acv1x/PTl98l
         XrIG6KIc3EExX5keO5zuiDv46ojHhpzbeMkfOet4ENE0E7sN2vUmdtlue+hBfHZZ0HF9
         PMNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791570586; x=1792175386;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BpjtofrkUDRqvSiMqlyAYlghXPAPat+XcdincmK9q5k=;
        b=AEEsV8PvI5Y5aoA8qOOXufGVzGvYfj0GjcSKzJEqy6pmLE2LHAcyyxIA1YyCl3EqiW
         V3aNsJnHJ3uFEA/riukatu890BjBYYHYzSdzkR5PAwbm3ys6HDBp+UVDjY4L7BsQuIwC
         XAIqh+cNU5KsS/i4XI4okKR9pX/+Y+hvE+0QlXpBGvuGBlnbarlNVKi+Y8kiIqcMyl+u
         cLdzoELKxSFaYFaYsGx+T1uIA9tFGDOpVNnCwsFvMXEx3fOnnvotpVAmgiSkDtAPnzr3
         KZWVzXornRuVbtBnbR+Qzvy2yX57KTO7vVyB4pt2QNUMMfQzW8engmbERLQPwQGk8DLD
         29Tw==
X-Forwarded-Encrypted: i=1; AKwUvBzsqp/t2W9tkLeD0rcBpcbm3S+1AMhN2VHu6+peSjB/IS3lh/HkLgSqixX6fOE3Y6GYSXcLxhaaoTc=@vger.kernel.org
X-Gm-Message-State: AFuF++l+RYMpzrdkSC3/wFpwOciw7u0B9ET9LUoMtX/2c4moSWGj4KC7
	bBn6zr8MEmXFtBguoLn7j5zVYUsB49SQA+fhEGTyOVTheDU5rjajZz+0mWG1KD75vAI=
X-Gm-Gg: AYBFou00tyM9hLLtDneCNzembd/WOkAb6s4+suaslc1z0Q37o6eiFuf5cLBHxC5+sMB
	ssLzJ7FS+d+BN9CVOzp2HZgMG2wG4cM/jGYW5GT/dhVb4fxulFFGZkF1k63qIxjrGharP/g80bV
	j4gKmMy6TIflt+N4hJHBomZ5GfJBIhmO8DmMUWMfjgHbDPBS3B6PAhhduyAZ58wZ9V1GK0KX9gG
	QbDo8Ow3wjRZ8IvJVYKZA7dJbFmUfAWxQmrFk5+OF/WmtC9ZgA8HYfUJY2XvieuujNpmWePDSIs
	aMN5icF50p5a22u4q4jBxDjNQvVpUMEKItx+6TkznP5q44CV5mXdXYV4ku7tSmvNe7RIGL65uzr
	28OnPJuV9qmM+qCTFR9+Zc9pNEywed2+F4PegIJu7W9nlP5QIqGowtq6H0anmuls9Ea4Z80jK6K
	D0ukw4k/vrmlykiretr4XCa5SAjuO41qv47YwZQhTidshqS2qZibhBAyCqttxUCH3uB5jmvb5Hr
	cQ8t+dk8evOlvAwAw==
X-Received: by 2002:a05:600c:c165:b0:4a1:706f:b40d with SMTP id 5b1f17b1804b1-4a18e4988ecmr56332465e9.7.1791570585690;
        Fri, 09 Oct 2026 11:29:45 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18e48db03sm95749805e9.3.2026.10.09.11.29.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 11:29:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v15 06/11] clk: realtek: Add support for gate clock
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: jbrunet+clk@baylibre.com, sboyd@kernel.org, robh@kernel.org, 
 krzk+dt@kernel.org, conor+dt@kernel.org, p.zabel@pengutronix.de, 
 cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com, 
 bmasney+clk@redhat.com, devicetree@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-realtek-soc@lists.infradead.org, 
 james.tai@realtek.com, cy.huang@realtek.com, stanley_chang@realtek.com, 
 Brian Masney <bmasney@redhat.com>
In-Reply-To: <20261002074331.3066919-7-eleanor.lin@realtek.com>
References: <20261002074331.3066919-1-eleanor.lin@realtek.com>
 <20261002074331.3066919-7-eleanor.lin@realtek.com>
Date: Fri, 09 Oct 2026 20:29:35 +0200
Message-Id: <179157057524.266328.4248123787670079601.b4-review@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=5945; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=XNzr2wNUNghrBBxT8exO2uqCTKmR32NqYT7zK1+uz7E=;
 b=owGbwMvMwCW2VtK+WnvWU3HG02pJDFknjaae9uxc/m6+QK2RgueRBvebz8Lz10RPbDsVbijMb
 bFoSRBrRykLgxgXg6yYIksNd7X4O0mtL7Om69yGmcPKBDKEgYtTACYSksHwhzvIVES3Pend/cIn
 NZOPsmdNNlKbJujvIiDq0L1+IldIOMP/hGq/KXtqPh1ezP+T2/2CvdnnaxvU/RcwxFx6o1Tb7Gf
 IAgA=
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

> Introduce clk_regmap_gate_ops supporting enable, disable, and is_enabled
> for standard regmap gate clocks. To accommodate hardware designs, the
> enable and disable operations handle a 'write_en' flag, which asserts an
> adjacent write-enable bit (bit_idx + 1) simultaneously when modifying the
> gate bit.
> 
> Add clk_regmap_gate_ro_ops as a read-only variant exposing only is_enabled.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Reviewed-by: Brian Masney <bmasney@redhat.com>
>
> diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
> index 71edc18121c6..840aff067b61 100644
> --- a/drivers/clk/realtek/Makefile
> +++ b/drivers/clk/realtek/Makefile
> @@ -3,4 +3,5 @@ obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
>  
>  clk-rtk-y += clk-rtk-common.o
>  clk-rtk-y += clk-pll.o
> +clk-rtk-y += clk-regmap-gate.o
>  clk-rtk-y += freq_table.o
> diff --git a/drivers/clk/realtek/clk-regmap-gate.c b/drivers/clk/realtek/clk-regmap-gate.c
> new file mode 100644
> index 000000000000..7033aeb1cd82
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-regmap-gate.c
> @@ -0,0 +1,64 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2017-2026 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#include <linux/bits.h>
> +#include <linux/clk-provider.h>
> +#include <linux/export.h>
> +#include <linux/regmap.h>
> +#include "clk-regmap-gate.h"
> +
> +static int rtk_clk_regmap_gate_update(struct clk_hw *hw, bool enable)
> +{
> +	struct rtk_clk_regmap_gate *clkg = to_rtk_clk_regmap_gate(hw);
> +	unsigned int mask = BIT(clkg->bit_idx);
> +	unsigned int val = enable ? mask : 0;
> +
> +	/*
> +	 * Hardware specific design: to modify the gate bit, the adjacent
> +	 * write-enable bit (bit_idx + 1) must be asserted simultaneously.
> +	 */
> +	if (clkg->write_en) {
> +		mask |= BIT(clkg->bit_idx + 1);
> +		val |= BIT(clkg->bit_idx + 1);
> +	}
> +
> +	return regmap_update_bits(clkg->clkr.regmap, clkg->gate_ofs, mask, val);
> +}
> +
> +static int rtk_clk_regmap_gate_enable(struct clk_hw *hw)
> +{
> +	return rtk_clk_regmap_gate_update(hw, true);
> +}
> +
> +static void rtk_clk_regmap_gate_disable(struct clk_hw *hw)
> +{
> +	rtk_clk_regmap_gate_update(hw, false);
> +}
> +
> +static int rtk_clk_regmap_gate_is_enabled(struct clk_hw *hw)
> +{
> +	struct rtk_clk_regmap_gate *clkg = to_rtk_clk_regmap_gate(hw);
> +	int ret;
> +	u32 val;
> +
> +	ret = regmap_read(clkg->clkr.regmap, clkg->gate_ofs, &val);
> +	if (ret < 0)
> +		return ret;
> +
> +	return !!(val & BIT(clkg->bit_idx));
> +}
> +
> +const struct clk_ops rtk_clk_regmap_gate_ops = {
> +	.enable     = rtk_clk_regmap_gate_enable,
> +	.disable    = rtk_clk_regmap_gate_disable,
> +	.is_enabled = rtk_clk_regmap_gate_is_enabled,
> +};
> +EXPORT_SYMBOL_NS_GPL(rtk_clk_regmap_gate_ops, "CLK_REALTEK");
> +
> +const struct clk_ops rtk_clk_regmap_gate_ro_ops = {
> +	.is_enabled = rtk_clk_regmap_gate_is_enabled,
> +};
> +EXPORT_SYMBOL_NS_GPL(rtk_clk_regmap_gate_ro_ops, "CLK_REALTEK");
> diff --git a/drivers/clk/realtek/clk-regmap-gate.h b/drivers/clk/realtek/clk-regmap-gate.h
> new file mode 100644
> index 000000000000..9303adda3166
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-regmap-gate.h
> @@ -0,0 +1,65 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2017-2026 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#ifndef __CLK_REALTEK_CLK_REGMAP_GATE_H
> +#define __CLK_REALTEK_CLK_REGMAP_GATE_H
> +
> +#include "clk-rtk-common.h"
> +
> +struct rtk_clk_regmap_gate {
> +	struct rtk_clk_regmap clkr;
> +	unsigned int gate_ofs;
> +	u8 bit_idx;
> +	u32 write_en : 1;
> +};
> +
> +#define __rtk_clk_regmap_gate_hw(_p) __rtk_clk_regmap_hw(&(_p)->clkr)
> +
> +#define __RTK_CLK_REGMAP_GATE(_name, _parent, _ops, _flags, _ofs, _bit_idx, \
> +			      _write_en)                                    \
> +	struct rtk_clk_regmap_gate _name = {                                \
> +		.clkr.hw.init = CLK_HW_INIT(#_name, _parent, _ops, _flags), \
> +		.gate_ofs = _ofs,                                           \
> +		.bit_idx = _bit_idx,                                        \
> +		.write_en = _write_en,                                      \
> +	}
> +
> +#define RTK_CLK_REGMAP_GATE(_name, _parent, _flags, _ofs, _bit_idx, _write_en)        \
> +	__RTK_CLK_REGMAP_GATE(_name, _parent, &rtk_clk_regmap_gate_ops, _flags, _ofs, \
> +			      _bit_idx, _write_en)
> +
> +#define RTK_CLK_REGMAP_GATE_RO(_name, _parent, _flags, _ofs, _bit_idx, _write_en)  \
> +	__RTK_CLK_REGMAP_GATE(_name, _parent, &rtk_clk_regmap_gate_ro_ops, _flags, \
> +			  _ofs, _bit_idx, _write_en)
> +
> +#define __RTK_CLK_REGMAP_GATE_NO_PARENT(_name, _ops, _flags, _ofs, _bit_idx,  \
> +				    _write_en)                                \
> +	struct rtk_clk_regmap_gate _name = {                                  \
> +		.clkr.hw.init = CLK_HW_INIT_NO_PARENT(#_name, _ops, _flags),  \
> +		.gate_ofs = _ofs,                                             \
> +		.bit_idx = _bit_idx,                                          \
> +		.write_en = _write_en,                                        \
> +	}
> +
> +#define RTK_CLK_REGMAP_GATE_NO_PARENT(_name, _flags, _ofs, _bit_idx, _write_en)        \
> +	__RTK_CLK_REGMAP_GATE_NO_PARENT(_name, &rtk_clk_regmap_gate_ops, _flags, _ofs, \
> +				    _bit_idx, _write_en)
> +
> +#define RTK_CLK_REGMAP_GATE_NO_PARENT_RO(_name, _flags, _ofs, _bit_idx, _write_en)  \
> +	__RTK_CLK_REGMAP_GATE_NO_PARENT(_name, &rtk_clk_regmap_gate_ro_ops, _flags, \
> +				    _ofs, _bit_idx, _write_en)

Is this _NO_PARENT still used ? if not drop it

-- 
Jerome

