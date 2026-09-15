Received: from mail-wm2-f12.google.com (mail-wm2-f12.google.com [74.125.225.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136CC3AE1BC
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 12:54:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.225.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789476844; cv=none; b=WxBrHr81zvEfqRYTdbdIbE0E4ckfSdluz7sDvQYU6xelL8Gthj7g00cg9b5bUkCPkjnB01yvcjnjmxTnb+86duxxyA5dFT527t5vnef96GcOVtgGBAzQQXx13DIprJn5fZmadSrgbyAULPJuF/Q+Nll6shBQgL82G3d8XpzyrHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789476844; c=relaxed/simple;
	bh=M0IzIsWiPP1002jx1x32ohvsScyH0p5PmYjJWCPWxCs=;
	h=MIME-Version:Content-Type:Subject:From:To:Cc:In-Reply-To:
	 References:Date:Message-Id; b=rWuFWAm6fllqTCBWi+c9bxZZ5J6oK6C+WfgHgqWs8dOkTB6OEJnIurYKjZwlT8xyGvwSNTigjKiKXHL/GkZ0W2APK62Za+fXxtTgpxiSscopOBlQhLZD44EdUdVv0arCx8QyJSw9qaXCDOl4UcX8DjFlEkVcUAU15I/8kKpCwy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=FiVME32X; arc=none smtp.client-ip=74.125.225.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="FiVME32X"
Received: by mail-wm2-f12.google.com with SMTP id 5b1f17b1804b1-49b912df756so1653265e9.3
        for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 05:54:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1789476839; x=1790081639; darn=vger.kernel.org;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ruipU1u5W9byyxX9qPeGPH+nhoQRgzgXh/OFxRteDPg=;
        b=FiVME32XVD1iAVGitvogCHAwq/awfFUzLl+DoXa52u4fOQuVTx8ZhEGNI4Xb7ba2da
         ceMRzg8zkPzVG19uUCv7IAVzfq+2HI3gFKdCAUPLJp+wfWouKTmUNezoFuSTl+ImliKX
         Xj/00EFOcmMIpXWnJUDN00mtQANb1Q+EKbaQTlp48R2d3PyY7PQejbAwcgw7tGtalX3N
         SE8sffIsMOWoc1EREk8yQ8Ozzas3X7Mzz2Y2nMaVZuUfh+1LGvZqHMlUYClePVzx7iAz
         nzcyb0J68+LzrKA+lBqeSlP0Ao0NZVodFRdXYcGwzahnP6ydTZsy9DoY+USM7gE1wGPI
         J4JA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789476839; x=1790081639;
        h=message-id:date:references:in-reply-to:cc:to:from:subject
         :content-transfer-encoding:content-type:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ruipU1u5W9byyxX9qPeGPH+nhoQRgzgXh/OFxRteDPg=;
        b=gYVjoFSpOTm1tAMvNjyBDBvlhPOByFEOtvlxQVuKoyrvAHrOHaTXFGD8OyA2qeKykb
         BVzlXIQfMhh8JFL2EmtDLjKcDK9ebRzc59Sn0SVnJLI88li+h2s0wHoYNXtWTF2ysTki
         +UUp0bqbLylR5zW0eiGNQRxafA0FkNJxbtYBSgvtXOBXCFwBIA0T/TK9c/hu7SU6s/J7
         /zxPhWDjEup/QZPgO5FugVW9wnFjAmPI2hsBKxAdggRVVakRs2zHkxwfy5M16buG86s8
         qM/9GW0Gc2zXISR/7nmPlGBg+4ZtSnS+vzxy0Go6TQ1PaZ+NX6O60tjbOtvd1ssOtxkF
         2BCg==
X-Forwarded-Encrypted: i=1; AKwUvBw8cEbS50ev7UtnvcxVPVDBCHxvhxDBIZr81sBtNZcrg5OxXxcHxnZHNIXyXbFvjinCG/s7D24CX/4=@vger.kernel.org
X-Gm-Message-State: AFuF++kzDiQ+1EZkPwny1TLRmTZ3HZHJtNawd5qGjGhlgYeJ5bq4ZGZg
	Qe8DlDi1zlVph916e3Ml4zMXeEdQHXK8X1kPyv5ffKAE/1uGDkgi0pvl+gI1nJo/P/Q=
X-Gm-Gg: AYBFou0XNIq0NYWJfaQL6a27+d5yZyGx91+tzI7Rl1D7EGTOJBW1YOUNlJ02GWs4J6r
	v1Z7GkdQoj86B6hd+ck03UzQIqwm5Va3gMDZbf07bXxcZOw3PhIeHwS/7raDs4BR3S5tzJ5pXYH
	/QS58IB9AYz9BtmnvFQI2ML4CUHP5B6Oka/TycohpOeRYsH9duQvmif0cfS3jtlOB9GoNaThQAW
	3vs2PJ602C3kiQkSATEWPNM0RPRvcoN8fopQ6S0ZQhVtQ7XWj/hxSwtaIFCjPNtMuWl02PeuVnK
	VrDYUZyFSae6zrkijzD98cvbllxRZQQMDe6//KskDdqOr8nDuAOrU9TLw6DTcPy5ls6O5G5RHbN
	DAx2w+nq5ztkGuh3+ir8rmyhGAyqkp4xC9pI0MhGBDNijNF31WmupFdPPz5kYIJIQaihs6cMyf8
	7v+7T02JQm/r6PLaJ4uykgp+uP7xU2w54UkdCnxhD3ShanwVmFC8AaZBOxu0kwb1dU7lHSiYYZH
	lh9MkoENRgPnNVt7w==
X-Received: by 2002:a05:600c:1c26:b0:49c:f4ff:e872 with SMTP id 5b1f17b1804b1-49e82213842mr16348805e9.5.1789476839476;
        Tue, 15 Sep 2026 05:53:59 -0700 (PDT)
Received: from localhost (82-67-6-57.subs.proxad.net. [82.67.6.57])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49e7d6a9d1dsm73406825e9.10.2026.09.15.05.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 15 Sep 2026 05:53:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v14 07/11] clk: realtek: Add support for mux clock
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
In-Reply-To: <20260901072446.2563145-8-eleanor.lin@realtek.com>
References: <20260901072446.2563145-1-eleanor.lin@realtek.com>
 <20260901072446.2563145-8-eleanor.lin@realtek.com>
Date: Tue, 15 Sep 2026 14:53:56 +0200
Message-Id: <178947683646.448573.8652586338644531668.b4-reply@b4>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=4922; i=jbrunet@baylibre.com;
 h=from:subject:message-id; bh=M0IzIsWiPP1002jx1x32ohvsScyH0p5PmYjJWCPWxCs=;
 b=owEBbQKS/ZANAwAKAeb8Dxw38tqFAcsmYgBqqT/kIj2H05/TQ42wyCS3cLOfpVaD8wrOMQ3y+
 Ny8dTCQUReJAjMEAAEKAB0WIQT04VmuGPP1bV8btxvm/A8cN/LahQUCaqk/5AAKCRDm/A8cN/La
 he81D/45r9CNZwZIVBcLR0EH1/ZBwuxMLr2LG9h4TeHpWHTcEMtRCnWHjpnlVR9r/MRkZM/5dxv
 J3ITQ2RCLm0YArSa+h6lzIQPyon1HsMu4WhNvHt3IxjliQ3r9VWrn5hSP8YARJZBP7EddBboad5
 LHVi0mWjIh8j8DsGUMs8ShpLE5W8AOmaR62C9AViwhEznxzyz3w9MCDnq5hgmSzpYVHS3aDat5Q
 d5c/L+INQNYBIEY3DmSfV2CiY50Xg3NZYhEnv0ZjYtOEQ4v/A1VVR7+yZxxA0hRDhEYYLJfqpyL
 2JGmOm9ST3nEPTB2QVJHrRXFcVWJzrz1S1lkaaczkzQa7w9x/72P0AaFv2JdQ5PDnTgZBelgylG
 DzH1uZXCIkxIsvUwHJMv/iDRwA52DphXgdiXzUZzmNc0FdL0txxPPNJ0eBixDbuMn7T8VMhemIt
 OA3NDET+hDgzz+xCJ7F2sOyLhqpXVl0SB4DL4aaz/MQjDPsr0/XOh0J/9C7tJcCFzn0YmvWdEtp
 /CZi/IbgYuw04Ql+j+Izsr2UmSk005u7rzwGXa2c25RYrUD2FoedEUTwbx6aSzO81pW9e97gooZ
 EriyMjYVl2D+cYSRN1YGN77gxpz/aOvAXq0F6zBCgedZ0Tt4YLY200PqACAI4be+lZE/9S8maXx
 4xTnCvcV44d+iVA==
X-Developer-Key: i=jbrunet@baylibre.com; a=openpgp;
 fpr=F29F26CF27BAE1A9719AE6BDC3C92AAF3E60AED9

On 2026-09-01 15:24 +0800, Yu-Chun Lin wrote:
> From: Cheng-Yu Lee <cylee12@realtek.com>
> 
> Add a simple regmap-based clk_ops implementation for Realtek mux clocks.
> 
> The implementation supports parent selection and rate determination through
> regmap-backed register access.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v14:
> - Move Reviewed-by tag to the correct position.
> ---
>  drivers/clk/realtek/Makefile         |  1 +
>  drivers/clk/realtek/clk-regmap-mux.c | 41 ++++++++++++++++++++++++++
>  drivers/clk/realtek/clk-regmap-mux.h | 43 ++++++++++++++++++++++++++++
>  3 files changed, 85 insertions(+)
>  create mode 100644 drivers/clk/realtek/clk-regmap-mux.c
>  create mode 100644 drivers/clk/realtek/clk-regmap-mux.h
> 
> diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
> index 840aff067b61..217ccaf5644a 100644
> --- a/drivers/clk/realtek/Makefile
> +++ b/drivers/clk/realtek/Makefile
> @@ -4,4 +4,5 @@ obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
>  clk-rtk-y += clk-rtk-common.o
>  clk-rtk-y += clk-pll.o
>  clk-rtk-y += clk-regmap-gate.o
> +clk-rtk-y += clk-regmap-mux.o
>  clk-rtk-y += freq_table.o
> diff --git a/drivers/clk/realtek/clk-regmap-mux.c b/drivers/clk/realtek/clk-regmap-mux.c
> new file mode 100644
> index 000000000000..1069c95595aa
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-regmap-mux.c
> @@ -0,0 +1,41 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/*
> + * Copyright (C) 2017-2026 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#include <linux/clk-provider.h>
> +#include <linux/export.h>
> +#include <linux/regmap.h>
> +#include "clk-regmap-mux.h"
> +
> +static u8 rtk_clk_regmap_mux_get_parent(struct clk_hw *hw)
> +{
> +	struct rtk_clk_regmap_mux *clkm = to_rtk_clk_regmap_mux(hw);
> +	unsigned int num_parents = clk_hw_get_num_parents(hw);
> +	u32 val;
> +	int ret;
> +
> +	ret = regmap_read(clkm->clkr.regmap, clkm->mux_ofs, &val);
> +	if (ret)
> +		return 0xff;
> +
> +	val = (val >> clkm->shift) & clkm->mask;
> +
> +	return val >= num_parents ? 0xff : val;

This is not really useful, the core already rejects val >= num_parent.
So returning a higher number changes nothing as it stands

> +}
> +
> +static int rtk_clk_regmap_mux_set_parent(struct clk_hw *hw, u8 index)
> +{
> +	struct rtk_clk_regmap_mux *clkm = to_rtk_clk_regmap_mux(hw);
> +
> +	return regmap_update_bits(clkm->clkr.regmap, clkm->mux_ofs,
> +				  clkm->mask << clkm->shift, (u32)index << clkm->shift);
> +}
> +
> +const struct clk_ops rtk_clk_regmap_mux_ops = {
> +	.set_parent = rtk_clk_regmap_mux_set_parent,
> +	.get_parent = rtk_clk_regmap_mux_get_parent,
> +	.determine_rate = __clk_mux_determine_rate,
> +};
> +EXPORT_SYMBOL_NS_GPL(rtk_clk_regmap_mux_ops, "CLK_REALTEK");
> diff --git a/drivers/clk/realtek/clk-regmap-mux.h b/drivers/clk/realtek/clk-regmap-mux.h
> new file mode 100644
> index 000000000000..ad524bb86a19
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-regmap-mux.h
> @@ -0,0 +1,43 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) 2017-2026 Realtek Semiconductor Corporation
> + * Author: Cheng-Yu Lee <cylee12@realtek.com>
> + */
> +
> +#ifndef __CLK_REALTEK_CLK_REGMAP_MUX_H
> +#define __CLK_REALTEK_CLK_REGMAP_MUX_H
> +
> +#include "clk-rtk-common.h"
> +
> +struct rtk_clk_regmap_mux {
> +	struct rtk_clk_regmap clkr;
> +	unsigned int mux_ofs;
> +	unsigned int mask;
> +	unsigned int shift;
> +};
> +
> +#define __rtk_clk_regmap_mux_hw(_p) __rtk_clk_regmap_hw(&(_p)->clkr)
> +
> +#define __RTK_CLK_REGMAP_MUX(_name, _parents, _ops, _flags, _ofs, _sft, _mask) \
> +	struct rtk_clk_regmap_mux _name = {                                    \
> +		.clkr.hw.init =                                                \
> +			CLK_HW_INIT_PARENTS(#_name, _parents, _ops, _flags),   \
> +		.mux_ofs = _ofs,                                               \
> +		.shift = _sft,                                                 \
> +		.mask = _mask,                                                 \
> +	}
> +
> +#define RTK_CLK_REGMAP_MUX(_name, _parents, _flags, _ofs, _sft, _mask)               \
> +	__RTK_CLK_REGMAP_MUX(_name, _parents, &rtk_clk_regmap_mux_ops, _flags, _ofs, \
> +			     _sft, _mask)
> +
> +static inline struct rtk_clk_regmap_mux *to_rtk_clk_regmap_mux(struct clk_hw *hw)
> +{
> +	struct rtk_clk_regmap *clkr = to_rtk_clk_regmap(hw);
> +
> +	return container_of(clkr, struct rtk_clk_regmap_mux, clkr);
> +}
> +
> +extern const struct clk_ops rtk_clk_regmap_mux_ops;
> +
> +#endif /* __CLK_REALTEK_CLK_REGMAP_MUX_H */
> -- 
> 2.43.0
> 
> 


