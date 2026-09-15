Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C4053C9EF8
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 12:42:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.76
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476133; cv=none; b=ZBe3bKZYm0vxlokBXMhl/9GFZBi8Cqn/cC69oPdDROx2icK4INMndAjn5OKoK8jg7jLXtTpE7zZM998KHdZAfAa0yHIqChYcOOI5kDwYVW6tKVw7kkNaTDGkBhxQJJl0TC0SKiFMdWI1afH62F6Xnx4v+mPPITZo7gT1ceZUXYU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476133; c=relaxed/simple;
	bh=582/7s3JxsfQWjUN6EMHISrALdyatqiIyfqpimTuSgs=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=BcdFliqYeuwyYxWU74uBuYkTZaJk73zCpuwKqIb4mlTPdPxPB9KIJ6mbrxEzw4WfPTlMbU0Xva7kzYsgJDiEN9stpJK5TLytaq6dWHRVVluqKQtaGCy6rQ61b+FRQaZhusOZD9QW2rTw620kDpU972+OW2GkRT6tEqWm/dltiQQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=KOxcEmYl; arc=none smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="KOxcEmYl"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-482f6351831so1720913f8f.1
        for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 05:42:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789476127; x=1790080927; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Ve43d7pTFVOMTSVWgJo3u0Un/jBoaP9onTkW8Y5KW4w=;
        b=KOxcEmYl7cDxmte4t7uZs4KgK2Sm/eVru02cSfwCebv/+0xhVtXw67vA1D9vbkeX7F
         AMmx1PHi5M6wLUfqiXuYOyJVReld8t9o5TShYux31cdCJ7V+2E8S1YdQyFOceNuNF3hD
         lttnnDONdXwDPmyG+9ApNKLxkVdmrwZpdQfLqW/4U1nZQ8l9/+JsFiot03noixIioxw8
         jiZRxnRzRoJSUe0IKFeYodSNwjIsqZSl1LjJrTJ/EnUObJnZIkZC9Lgz9sJ/3WHQUE58
         J2tf8oFf994U6iH68JYrWcydHv3M/Cz1fn+YjbXPWtx18t8MF1/3LSmJx6UyRnNd0uXE
         xxfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476127; x=1790080927;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ve43d7pTFVOMTSVWgJo3u0Un/jBoaP9onTkW8Y5KW4w=;
        b=jTPiUF2JTgbbg7O9TRAvGQxYgDLNn4sF37ipVZcNvmgKITnbhpibXud4UbT+SdqpIV
         UErHIAhGFB7wlygzE5eJLFpe+Tr8xvRxUc0Gxt2RcvLxJ3PB0bsJUSVGVxrNuXeoi+X3
         zNMmlsg1f91eu+0ynP7xGdOWlOQEiBzjG+Jr+0lBl3fz13BjSod6u0G1JXNLVs/1x7Ju
         MA6zUUcx8TEHpDrnAWIF00UQ9/4SXANqF7n2nFIdPq1r/66gow34BOimvG3veI+D7+4f
         z3Akn3yEsJiENffYiGPHd9ATRL+hgo42/SivRCqYS/fU5IeybBGaeLxKW3tP+Xk5JVpA
         UuDA==
X-Forwarded-Encrypted: i=1; AKwUvBzEqTnadCf9C248R0K57p6yb1sM7VTcri9eAAhxctEAvzDvCz+EqKqQ29p7UJM3G0cp3vqyV2IMF8w=@vger.kernel.org
X-Gm-Message-State: AFuF++m2HC+X2UsxhGO3WwdHXBEEIHuUzFrl9TJ/lR38q08+6V7mjV5M
	UKGZ7yFQ/uc6TajF28pMpa2H1L2d4Wb1TMcSCbnn0Q2GV7QqykH4MkCDm+NywC/JpFg=
X-Gm-Gg: AYBFou2lQU0whY5lzmnM0lUrMmFEmyWPxbjp2mb2LR5fEzqI6lelCVvmajszcEHKs75
	hOUELKmlQJSka4GmmVNTCoVXtZIZxH4t8BX2un7sPMPIrMh0wBNGljY7jcIPudESCHN7vrWB4N/
	E9sl0e1DRmTX59Iotq28/Cob9wLga3D9RysaEAyVjuRa09HKYuxYkJfQ6rr2VeZeG3Uh5NJiVLY
	KxqnlVeV83S9W+uU6SQiNFY+nawMSbO9Evt177ToCF3SBDJP9opGKTdocu2JdNrByuiE9Pbk5MH
	g9iRvRazja3aEVqAqnQebONyueq5p8efxIJDKPtMC+ArnbwO4DQv//ZCAwgpgGsIZoKYtLEnOBc
	Okirc/7lFhctO07+iDIXvQB4hQ7S/M+AkYDhm6iPcl8K5EGPcXi2q9p3qXbv9hyHQInu90IKjos
	1caPpX/d/N7pMICmb8caB+SSn8b5q8X2lk5XiALmU5AxmMS6yBG79y2rf9DgJf0NLIihTl3oZU2
	55O6YGedapotwLiNtY=
X-Received: by 2002:a05:6000:470c:b0:486:f4cf:59b2 with SMTP id ffacd0b85a97d-48702aae4e6mr8151011f8f.4.1789476127347;
        Tue, 15 Sep 2026 05:42:07 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-486eb35f3d9sm33532218f8f.35.2026.09.15.05.42.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:42:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v14 06/11] clk: realtek: Add support for gate clock
From: Jerome Brunet <jbrunet@baylibre.com>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 p.zabel@pengutronix.de, cylee12@realtek.com, afaerber@suse.com, 
 jyanchou@realtek.com, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-realtek-soc@lists.infradead.org, james.tai@realtek.com, 
 cy.huang@realtek.com, stanley_chang@realtek.com, 
 Brian Masney <bmasney@redhat.com>
In-Reply-To: <20260901072446.2563145-7-eleanor.lin@realtek.com>
References: <20260901072446.2563145-1-eleanor.lin@realtek.com>
 <20260901072446.2563145-7-eleanor.lin@realtek.com>
Date: Tue, 15 Sep 2026 14:42:04 +0200
Message-Id: <178947612411.448573.8319851834736456413.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=6855; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=582/7s3JxsfQWjUN6EMHISrALdyatqiIyfqpimTuSgs=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqqT0c9mkExB03yY3YHr0fhg3XGhRRzOgE7qYbx
 W7L0HKibU6JAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaqk9HAAKCRDm/A8cN/La
 hUCHD/wLct30ewH+5Y3QuClGJamgZYobFou8PoCe8ZNwegUjci+LL8dHd3LcPTENTfOHXYFlgkQ
 PVDdSqnMGkiIKdJ+TaI92nbPkyt10u920xrR5yGCGE+qZ/wPHxlqjBu6zRUo47KLDJUEGbL7D48
 +anKtOEZ3A08V2uIO6RiH/2UsE8JJvAZHVeY0u2K84trqjeBp1DiQe/JSTEAGiSHTjA8ZttkIe3
 25FEOUjZ+pbm8G4MeN7gvS2VjLogBvQtHlc90hdCcViOgPqP5SrOcodAOFVeaFuZKTLjbOH6aXO
 QhBHsQqscoL9OJiDBDe+l22fRIMiCPvDS0pwoeZC48RrFRuGikqcqk4GWCRqHEltrxgh/d31Gly
 g7BVtv5s+ZSnyHL4p95rVQUNzzc3uAiQ8Llp3hOVayemE/TWZP4BRMLdrSPVgYAvs/yuJyFTK3l
 FBAYULGRs2mxJmlEhjcOtyjTJDBw+6qsx8YOpgJIeawB3NBo3sM/Pw9/1D4LIfm2e69modjwPRb
 l7WAxge1vw+kHz8c/yeIII68hVKqg0fBgEKVxUi8oIysPoL8BVtFt+NefV0TSDcNnt/CEMy3BtM
 Ykad0qE9ldVDgxCCcebuqZMX1e/zfwRqnnJWIciP7QPGLBsUl+CVPgyvX8Aam+s6F5neGVnQO/r
 SjATklyYSJCn07g==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On 2026-09-01 15:24 +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Introduce clk_regmap_gate_ops supporting enable, disable, is_enabled, and
> for standard regmap gate clocks.
> 
> Add clk_regmap_gate_ro_ops as a read-only variant exposing only is_enabled.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v14:
> - Move Reviewed-by tag to the correct position.
> ---
>  drivers/clk/realtek/Makefile          |  1 +
>  drivers/clk/realtek/clk-regmap-gate.c | 70 +++++++++++++++++++++++++++
>  drivers/clk/realtek/clk-regmap-gate.h | 65 +++++++++++++++++++++++++
>  3 files changed, 136 insertions(+)
>  create mode 100644 drivers/clk/realtek/clk-regmap-gate.c
>  create mode 100644 drivers/clk/realtek/clk-regmap-gate.h
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
> index 000000000000..1c32a87d97df
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-regmap-gate.c
> @@ -0,0 +1,70 @@
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
> +static int rtk_clk_regmap_gate_enable(struct clk_hw *hw)
> +{
> +	struct rtk_clk_regmap_gate *clkg = to_rtk_clk_regmap_gate(hw);
> +	unsigned int mask;
> +	unsigned int val;
> +
> +	mask = BIT(clkg->bit_idx);
> +	val = BIT(clkg->bit_idx);
> +
> +	if (clkg->write_en) {
> +		mask |= BIT(clkg->bit_idx + 1);
> +		val |= BIT(clkg->bit_idx + 1);
> +	}
> +
> +	return regmap_update_bits(clkg->clkr.regmap, clkg->gate_ofs, mask, val);
> +}
> +
> +static void rtk_clk_regmap_gate_disable(struct clk_hw *hw)
> +{
> +	struct rtk_clk_regmap_gate *clkg = to_rtk_clk_regmap_gate(hw);
> +	unsigned int mask;
> +	unsigned int val;
> +
> +	mask = BIT(clkg->bit_idx);
> +	val = 0;
> +
> +	if (clkg->write_en) {
> +		mask |= BIT(clkg->bit_idx + 1);
> +		val |= BIT(clkg->bit_idx + 1);
> +	}

Could add a comment explaining this write_en thing ? Some kind of volatile bit to commit the change ?

> +
> +	regmap_update_bits(clkg->clkr.regmap, clkg->gate_ofs, mask, val);

Nitpick: the 2 functions above more less copy/paste. 

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
> +
> +static inline struct rtk_clk_regmap_gate *to_rtk_clk_regmap_gate(struct clk_hw *hw)
> +{
> +	struct rtk_clk_regmap *clkr = to_rtk_clk_regmap(hw);
> +
> +	return container_of(clkr, struct rtk_clk_regmap_gate, clkr);
> +}
> +
> +extern const struct clk_ops rtk_clk_regmap_gate_ops;
> +extern const struct clk_ops rtk_clk_regmap_gate_ro_ops;
> +
> +#endif /* __CLK_REALTEK_CLK_REGMAP_GATE_H */
> -- 
> 2.43.0
> 
> 


