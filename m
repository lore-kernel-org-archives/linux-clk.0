Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794503711;
	b=INBxY7cGn9KOhXe3WfvjoCKfomywzAl3G4AGwLYQR01+NPDU9ckXc5BTvxUIuGf+G7/a
	 jLrueKnUM0mRrxR3DKGwwEaAO2wPXd+Pv8n+z3XAnnP/S5t9EFYNM2CgNuL6REc8HXJZT
	 gN9xyz/vMPKvuc67QkY3hruoiai4+kwLY/zBlwz8PjTxJCLPjQFM9nFH6OeJ5pVJI9OyH
	 olov+jlrO/gXw6ses8pcopeCspOGRXb7Iu8Kb0uygS8c+Up1knlC5fi3nvqnklNdmcTaA
	 uwKlm2jYUOdEFLnqWjlB/C2bHMVVKZlOuGU4poLgkxCyLHyvpzbJbfyAnXKGDWYdG5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794503711;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Bod2fYjJCJ/zNm0nl1K1p9Czrsk1VBanjiZ5HhgkltQ=;
	b=Wdw8aSGvKf5Ji1rH99f978onciA6qpvluqZhgq5/dkGgQzfrPAD0TjUcwtM7PLZMHpdF
	 z9thPE76WkMarbBlrASw/qJl/F39dGtZq3itpzL1dxLJQpucV5CuWNr4bWLTB7ZyZw0JZ
	 jcNmpkLZk1ZPUlyXDmWHxSnWSGje7u9HFo/we3IuVqtzTY/Zy3v9tzrLPw5dyQnCBKBI0
	 C0g5UXR6naPe+df8rtcbkNrm1c/zLxBEv4n/i0nAykgHLPa17R3B4eGouBeAVO7vCkHaq
	 XLVZ0udGTur0AwnkVXjfxc4ecwM3ldbkzzsNQDyZCrDZ/mNkKFzqh8ordUBrX3hzS0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B5ky110j;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 150FA606A8BA;
	Thu, 12 Nov 2026 17:15:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B5ky110j
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2594C1F000CD;
	Thu, 12 Nov 2026 17:15:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794503711;
	bh=Bod2fYjJCJ/zNm0nl1K1p9Czrsk1VBanjiZ5HhgkltQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=B5ky110jdpYs5SfFrTKrIaca4oew0zLhaFuQFEJirqxd+arCWMO5jkvo/cDWuYbtz
	 A7JQ0lIgp2VnxfTeK9b7fyWz86kRI3yoUA4XOptVxcMVfeoRst9cc2SXx0z6I05622
	 /MMOoCXtdmbXTmaixwTLEuD2anHjSfq8dywr00wGn9QYtuhQn+Gqgo5LO3F+XdircR
	 PZexJrIo8nx9zmmIrN8dJT/y6qQmf8aWCE0sK/BQrBhlnBIg+grBH9XtJAI4QGWOPp
	 8hNYN/cvF2KnXxEk4iF9PeMTjy0FOckIjw2oe+hLFiourwVXwzU4yjjhEtHEBMZZqs
	 vnwYSrWMve1jQ==
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
Subject: Re: [PATCH v16 4/9] clk: realtek: Add support for gate clock
From: Brian Masney <masneyb@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-realtek-soc@lists.infradead.org, james.tai@realtek.com, 
 cy.huang@realtek.com, stanley_chang@realtek.com, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261112052544.555563-5-eleanor.lin@realtek.com>
References: <20261112052544.555563-1-eleanor.lin@realtek.com>
 <20261112052544.555563-5-eleanor.lin@realtek.com>
Date: Thu, 12 Nov 2026 12:14:56 -0500
Message-Id: <179450369605.1227210.5445208801694313971.b4-review@b4>
X-Mailer: b4 0.17-dev-7ca47
X-Developer-Signature: v=1; a=openpgp-sha256; l=3357; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=e49TvxolP6L1T5LscrA2AM2/vKJFH1vxN6KTH7igYO0=;
 b=kA0DAAoWt9LdJ11+wIcByyZiAGr19BTI+AOXz+uiRxsvfH0H0q8czbJh2FmwRneJqVqUXzTAQ
 Yh1BAAWCgAdFiEEpG0ycFhlqj3e3CkEt9LdJ11+wIcFAmr19BQACgkQt9LdJ11+wIdOSgEAmUUh
 W4xuOZQlI0JNCq7x1llMInQFCi+rckL0i26m8woA/3CfME6/3cmli54H/Eg/UfAYIml3NLBbMom
 toJ7+l5YC
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

> Introduce clk_regmap_gate_ops supporting enable, disable, and is_enabled
> for standard regmap gate clocks. To accommodate hardware designs, the
> enable and disable operations handle a 'write_en' flag, which asserts an
> adjacent write-enable bit (bit_idx + 1) simultaneously when modifying the
> gate bit.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v16:
> - Remove Brian's reviewed-by tag.
> - Replace 'CLK_HW_INIT' with 'CLK_HW_INIT_HW' and 'CLK_HW_INIT_FW_NAME' macros
> to avoid relying on unstable internal CCF global names.
> - Drop all unused NO_PARENT macro and 'rtk_clk_regmap_gate_ro_ops'.
> ---
>  drivers/clk/realtek/Makefile          |  1 +
>  drivers/clk/realtek/clk-regmap-gate.c | 59 +++++++++++++++++++++++++++
>  drivers/clk/realtek/clk-regmap-gate.h | 54 ++++++++++++++++++++++++
>  3 files changed, 114 insertions(+)
>  create mode 100644 drivers/clk/realtek/clk-regmap-gate.c
>  create mode 100644 drivers/clk/realtek/clk-regmap-gate.h
>
> diff --git a/drivers/clk/realtek/Makefile b/drivers/clk/realtek/Makefile
> index 6fbe6e07b760..9397d677f52d 100644
> --- a/drivers/clk/realtek/Makefile
> +++ b/drivers/clk/realtek/Makefile
> @@ -2,5 +2,6 @@
>  obj-$(CONFIG_RTK_CLK_COMMON) += clk-rtk.o
>  
>  clk-rtk-y += clk-rtk-common.o
> +clk-rtk-y += clk-regmap-gate.o
>  clk-rtk-y += clk-regmap-pll.o
>  clk-rtk-y += freq_table.o
> diff --git a/drivers/clk/realtek/clk-regmap-gate.c b/drivers/clk/realtek/clk-regmap-gate.c
> new file mode 100644
> index 000000000000..12539e11647c
> --- /dev/null
> +++ b/drivers/clk/realtek/clk-regmap-gate.c
> @@ -0,0 +1,59 @@
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

This becomes a bool in clk_core_is_enabled(). Either return 0 or 1.

Brian

-- 
Brian Masney <masneyb@kernel.org>
