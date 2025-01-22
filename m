Received: from mx1.sberdevices.ru (mx1.sberdevices.ru [37.18.73.165])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9BF20FA9A;
	Wed, 22 Jan 2025 11:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.18.73.165
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737545644; cv=none; b=cR76OB+72GDlu+kkbpFMJNPHv7Kzc7AJuj34kpKGf3XRYaGBLj0CYFHKBXRnXJg7fCyyqUf8Z+l+i067n9sKxjHnpGZFMQ7mds4b4rsCxTiAQRnSyAcvWIE2F2qxI/34pGUQiccnwbcFpPaJLwQOb/umWdbKixLr55SgknoouyE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737545644; c=relaxed/simple;
	bh=GGymrcqnFrCRkXEp3OykXBFsKq6WjSl6i6o7iLT2pgE=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WBUFRDEsVdz1XTFsxareXDYsWzFPNakD2i/frVgqo+11+wrYF3a3OzJRQ9b2JcYbJLY+8dC/QHs7TMkPdsWNOn40xnDlg3lKxrAlq0J5FXEWMAvWz4W7bWOrO1R/HyC75slde9gZyfsA7V88wS5qW9wNcdLHY4v4TziwrDorLNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com; spf=pass smtp.mailfrom=salutedevices.com; dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b=n/sT6PTK; arc=none smtp.client-ip=37.18.73.165
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=salutedevices.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=salutedevices.com header.i=@salutedevices.com header.b="n/sT6PTK"
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id 8058310000C;
	Wed, 22 Jan 2025 14:28:28 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru 8058310000C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1737545308;
	bh=rwiKHRaRLKtuS94NYzmvLWBIH10HsT8O660uKYJNyKI=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:From;
	b=n/sT6PTKSOSAD9xeZYa2Arox0wmbOteJgyMZ4ivETfj0AIFtAtAB0+eBV56zfW5r3
	 tC7mINShlPBtjwl1QU+U3S9e4gzho+ZrldKabAb+nuHQ909FXczB6g1geCiBAJqE7D
	 wrDz92aQ68tgXerqL6zZC7vd4lu9avypNTE9btCzhHHpE6JnRa5CC9/TtUSIju1d5O
	 pLvlAQzGj10ZW0l49cVnsJbqQUSE/OBmu3riUQbW31w1/gAQfRiATPZsU6mMiWeixw
	 zfh06dO+oHNXFAPyidlnmIDHsN5OEX6ZjEfZDNPzenpwtLsmggNUrFXla0cJXFkaAi
	 oRDfPaV8ro1fA==
Received: from smtp.sberdevices.ru (p-exch-cas-a-m1.sberdevices.ru [172.24.201.216])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed, 22 Jan 2025 14:28:28 +0300 (MSK)
Date: Wed, 22 Jan 2025 14:28:27 +0300
From: Dmitry Rokosov <ddrokosov@salutedevices.com>
To: Jerome Brunet <jbrunet@baylibre.com>
CC: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
	<sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman
	<khilman@baylibre.com>, Martin Blumenstingl
	<martin.blumenstingl@googlemail.com>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 2/4] clk: amlogic: get regmap with clk_regmap_init
Message-ID: <fwor4n7m2ghviupileec663hf4tbzytjxkfuccorfcqyq3726p@awh3tnugxxpg>
References: <20250120-amlogic-clk-drop-clk-regmap-tables-v3-0-126244146947@baylibre.com>
 <20250120-amlogic-clk-drop-clk-regmap-tables-v3-2-126244146947@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20250120-amlogic-clk-drop-clk-regmap-tables-v3-2-126244146947@baylibre.com>
User-Agent: NeoMutt/20241212
X-ClientProxiedBy: p-i-exch-a-m2.sberdevices.ru (172.24.196.120) To
 p-exch-cas-a-m1.sberdevices.ru (172.24.201.216)
X-KSMG-Rule-ID: 1
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 190498 [Jan 22 2025]
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiSpam-Envelope-From: ddrokosov@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 50 0.3.50 df4aeb250ed63fd3baa80a493fa6caee5dd9e10f, {Tracking_uf_ne_domains}, {Track_E25351}, {Tracking_from_domain_doesnt_match_to}, 127.0.0.199:7.1.2;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;smtp.sberdevices.ru:5.0.1,7.1.1;salutedevices.com:7.1.1;lists.infradead.org:7.1.1, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean, bases: 2025/01/22 09:28:00
X-KSMG-LinksScanning: Clean, bases: 2025/01/22 10:19:00
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2025/01/22 03:21:00 #27098639
X-KSMG-AntiVirus-Status: Clean, skipped

On Mon, Jan 20, 2025 at 06:15:31PM +0100, Jerome Brunet wrote:
> Add clk_regmap_init() and use it with all clock types which derive from
> clk_regmap. This helps initialise clk_regmap clocks without requiring
> tables to keep track of the clock using this type.
> 
> The way it is done couples clk_regmap with the controllers, which is not
> ideal. This is a temporary solution to get rid of the tables. The situation
> will eventually be improved.
> 
> Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>

Reviewed-by: Dmitry Rokosov <ddrokosov@salutedevices.com>

> ---
>  drivers/clk/meson/Kconfig          |  1 +
>  drivers/clk/meson/clk-cpu-dyndiv.c |  1 +
>  drivers/clk/meson/clk-dualdiv.c    |  2 ++
>  drivers/clk/meson/clk-mpll.c       |  6 +++++
>  drivers/clk/meson/clk-phase.c      | 11 +++++++++
>  drivers/clk/meson/clk-pll.c        |  7 ++++++
>  drivers/clk/meson/clk-regmap.c     | 49 ++++++++++++++++++++++++++++++++++++++
>  drivers/clk/meson/clk-regmap.h     |  4 ++++
>  drivers/clk/meson/sclk-div.c       |  5 ++++
>  drivers/clk/meson/vclk.c           |  2 ++
>  drivers/clk/meson/vid-pll-div.c    |  1 +
>  11 files changed, 89 insertions(+)
> 
> diff --git a/drivers/clk/meson/Kconfig b/drivers/clk/meson/Kconfig
> index be2e3a5f83363b07cdcec2601acf15780ff24892..d6e2ddb4eac85ddad44b99a8efa9d33426edbab3 100644
> --- a/drivers/clk/meson/Kconfig
> +++ b/drivers/clk/meson/Kconfig
> @@ -5,6 +5,7 @@ menu "Clock support for Amlogic platforms"
>  config COMMON_CLK_MESON_REGMAP
>  	tristate
>  	select REGMAP
> +	select MFD_SYSCON
>  
>  config COMMON_CLK_MESON_DUALDIV
>  	tristate
> diff --git a/drivers/clk/meson/clk-cpu-dyndiv.c b/drivers/clk/meson/clk-cpu-dyndiv.c
> index 6c1f58826e24a2bf7706f0fc98cdcdb44fd60b64..0498fd3af7de7b9a4e72930ac4de11368d686393 100644
> --- a/drivers/clk/meson/clk-cpu-dyndiv.c
> +++ b/drivers/clk/meson/clk-cpu-dyndiv.c
> @@ -61,6 +61,7 @@ static int meson_clk_cpu_dyndiv_set_rate(struct clk_hw *hw, unsigned long rate,
>  };
>  
>  const struct clk_ops meson_clk_cpu_dyndiv_ops = {
> +	.init = clk_regmap_init,
>  	.recalc_rate = meson_clk_cpu_dyndiv_recalc_rate,
>  	.determine_rate = meson_clk_cpu_dyndiv_determine_rate,
>  	.set_rate = meson_clk_cpu_dyndiv_set_rate,
> diff --git a/drivers/clk/meson/clk-dualdiv.c b/drivers/clk/meson/clk-dualdiv.c
> index 913bf25d3771bdffa8db28e9b08dc566d1aac1ff..7c668df1a29f6eb20bde3f23d8701443602d774c 100644
> --- a/drivers/clk/meson/clk-dualdiv.c
> +++ b/drivers/clk/meson/clk-dualdiv.c
> @@ -126,6 +126,7 @@ static int meson_clk_dualdiv_set_rate(struct clk_hw *hw, unsigned long rate,
>  }
>  
>  const struct clk_ops meson_clk_dualdiv_ops = {
> +	.init		= clk_regmap_init,
>  	.recalc_rate	= meson_clk_dualdiv_recalc_rate,
>  	.determine_rate	= meson_clk_dualdiv_determine_rate,
>  	.set_rate	= meson_clk_dualdiv_set_rate,
> @@ -133,6 +134,7 @@ const struct clk_ops meson_clk_dualdiv_ops = {
>  EXPORT_SYMBOL_NS_GPL(meson_clk_dualdiv_ops, CLK_MESON);
>  
>  const struct clk_ops meson_clk_dualdiv_ro_ops = {
> +	.init		= clk_regmap_init,
>  	.recalc_rate	= meson_clk_dualdiv_recalc_rate,
>  };
>  EXPORT_SYMBOL_NS_GPL(meson_clk_dualdiv_ro_ops, CLK_MESON);
> diff --git a/drivers/clk/meson/clk-mpll.c b/drivers/clk/meson/clk-mpll.c
> index aa9abd06ae653585f68043bb1ddc2b0b96feeb6d..166fbcb053cc573ec92489c2bb03f81caffdf64b 100644
> --- a/drivers/clk/meson/clk-mpll.c
> +++ b/drivers/clk/meson/clk-mpll.c
> @@ -128,6 +128,11 @@ static int mpll_init(struct clk_hw *hw)
>  {
>  	struct clk_regmap *clk = to_clk_regmap(hw);
>  	struct meson_clk_mpll_data *mpll = meson_clk_mpll_data(clk);
> +	int ret;
> +
> +	ret = clk_regmap_init(hw);
> +	if (ret)
> +		return ret;
>  
>  	if (mpll->init_count)
>  		regmap_multi_reg_write(clk->map, mpll->init_regs,
> @@ -151,6 +156,7 @@ static int mpll_init(struct clk_hw *hw)
>  }
>  
>  const struct clk_ops meson_clk_mpll_ro_ops = {
> +	.init		= clk_regmap_init,
>  	.recalc_rate	= mpll_recalc_rate,
>  	.determine_rate	= mpll_determine_rate,
>  };
> diff --git a/drivers/clk/meson/clk-phase.c b/drivers/clk/meson/clk-phase.c
> index c1526fbfb6c4ccdd4034df465f70a56e0f9214ac..d05065e56483a218e0eaf402807c8734271d0cf5 100644
> --- a/drivers/clk/meson/clk-phase.c
> +++ b/drivers/clk/meson/clk-phase.c
> @@ -58,6 +58,7 @@ static int meson_clk_phase_set_phase(struct clk_hw *hw, int degrees)
>  }
>  
>  const struct clk_ops meson_clk_phase_ops = {
> +	.init		= clk_regmap_init,
>  	.get_phase	= meson_clk_phase_get_phase,
>  	.set_phase	= meson_clk_phase_set_phase,
>  };
> @@ -83,6 +84,11 @@ static int meson_clk_triphase_sync(struct clk_hw *hw)
>  	struct clk_regmap *clk = to_clk_regmap(hw);
>  	struct meson_clk_triphase_data *tph = meson_clk_triphase_data(clk);
>  	unsigned int val;
> +	int ret;
> +
> +	ret = clk_regmap_init(hw);
> +	if (ret)
> +		return ret;
>  
>  	/* Get phase 0 and sync it to phase 1 and 2 */
>  	val = meson_parm_read(clk->map, &tph->ph0);
> @@ -142,6 +148,11 @@ static int meson_sclk_ws_inv_sync(struct clk_hw *hw)
>  	struct clk_regmap *clk = to_clk_regmap(hw);
>  	struct meson_sclk_ws_inv_data *tph = meson_sclk_ws_inv_data(clk);
>  	unsigned int val;
> +	int ret;
> +
> +	ret = clk_regmap_init(hw);
> +	if (ret)
> +		return ret;
>  
>  	/* Get phase and sync the inverted value to ws */
>  	val = meson_parm_read(clk->map, &tph->ph);
> diff --git a/drivers/clk/meson/clk-pll.c b/drivers/clk/meson/clk-pll.c
> index 89f0f04a16abad99748e1ff3784e7ed91abd0f88..eaaf021d2f6911a99a722c8b9d8b4e1f1f77d0e6 100644
> --- a/drivers/clk/meson/clk-pll.c
> +++ b/drivers/clk/meson/clk-pll.c
> @@ -311,6 +311,11 @@ static int meson_clk_pll_init(struct clk_hw *hw)
>  {
>  	struct clk_regmap *clk = to_clk_regmap(hw);
>  	struct meson_clk_pll_data *pll = meson_clk_pll_data(clk);
> +	int ret;
> +
> +	ret = clk_regmap_init(hw);
> +	if (ret)
> +		return ret;
>  
>  	/*
>  	 * Keep the clock running, which was already initialized and enabled
> @@ -468,6 +473,7 @@ static int meson_clk_pll_set_rate(struct clk_hw *hw, unsigned long rate,
>   * the other ops except set_rate since the rate is fixed.
>   */
>  const struct clk_ops meson_clk_pcie_pll_ops = {
> +	.init		= clk_regmap_init,
>  	.recalc_rate	= meson_clk_pll_recalc_rate,
>  	.determine_rate	= meson_clk_pll_determine_rate,
>  	.is_enabled	= meson_clk_pll_is_enabled,
> @@ -488,6 +494,7 @@ const struct clk_ops meson_clk_pll_ops = {
>  EXPORT_SYMBOL_NS_GPL(meson_clk_pll_ops, CLK_MESON);
>  
>  const struct clk_ops meson_clk_pll_ro_ops = {
> +	.init		= clk_regmap_init,
>  	.recalc_rate	= meson_clk_pll_recalc_rate,
>  	.is_enabled	= meson_clk_pll_is_enabled,
>  };
> diff --git a/drivers/clk/meson/clk-regmap.c b/drivers/clk/meson/clk-regmap.c
> index 07f7e441b9161c47fdb38ec61ed162a2f9d4fe41..d6bce32b087b174482ca896e4a0f3c57b58f155c 100644
> --- a/drivers/clk/meson/clk-regmap.c
> +++ b/drivers/clk/meson/clk-regmap.c
> @@ -4,9 +4,52 @@
>   * Author: Jerome Brunet <jbrunet@baylibre.com>
>   */
>  
> +#include <linux/device.h>
>  #include <linux/module.h>
> +#include <linux/mfd/syscon.h>
>  #include "clk-regmap.h"
>  
> +int clk_regmap_init(struct clk_hw *hw)
> +{
> +	struct clk_regmap *clk = to_clk_regmap(hw);
> +	struct device_node *np, *parent_np;
> +	struct device *dev;
> +
> +	/* Allow regmap to be preset as it was historically done */
> +	if (clk->map)
> +		return 0;
> +
> +	/*
> +	 * FIXME: what follows couples the controller implementation
> +	 * and clk_regmap clock type. This situation is not desirable
> +	 * but temporary, until the controller is able to register
> +	 * a hook to initialize a clock type
> +	 */
> +
> +	/* Check the usual dev enabled controller with an basic IO regmap */
> +	dev = clk_hw_get_dev(hw);
> +	if (dev) {
> +		clk->map = dev_get_regmap(dev, NULL);
> +		if (clk->map)
> +			return 0;
> +	}
> +
> +	/* Move on to early and syscon based controllers */
> +	np = clk_hw_get_of_node(hw);
> +	if (np) {
> +		parent_np = of_get_parent(np);
> +		clk->map = syscon_node_to_regmap(parent_np);
> +		of_node_put(parent_np);
> +
> +		if (!IS_ERR_OR_NULL(clk->map))
> +			return 0;
> +	}
> +
> +	/* Bail out if regmap can't be found */
> +	return -EINVAL;
> +}
> +EXPORT_SYMBOL_NS_GPL(clk_regmap_init, CLK_MESON);
> +
>  static int clk_regmap_gate_endisable(struct clk_hw *hw, int enable)
>  {
>  	struct clk_regmap *clk = to_clk_regmap(hw);
> @@ -45,6 +88,7 @@ static int clk_regmap_gate_is_enabled(struct clk_hw *hw)
>  }
>  
>  const struct clk_ops clk_regmap_gate_ops = {
> +	.init		= clk_regmap_init,
>  	.enable = clk_regmap_gate_enable,
>  	.disable = clk_regmap_gate_disable,
>  	.is_enabled = clk_regmap_gate_is_enabled,
> @@ -52,6 +96,7 @@ const struct clk_ops clk_regmap_gate_ops = {
>  EXPORT_SYMBOL_NS_GPL(clk_regmap_gate_ops, CLK_MESON);
>  
>  const struct clk_ops clk_regmap_gate_ro_ops = {
> +	.init		= clk_regmap_init,
>  	.is_enabled = clk_regmap_gate_is_enabled,
>  };
>  EXPORT_SYMBOL_NS_GPL(clk_regmap_gate_ro_ops, CLK_MESON);
> @@ -121,6 +166,7 @@ static int clk_regmap_div_set_rate(struct clk_hw *hw, unsigned long rate,
>  /* Would prefer clk_regmap_div_ro_ops but clashes with qcom */
>  
>  const struct clk_ops clk_regmap_divider_ops = {
> +	.init = clk_regmap_init,
>  	.recalc_rate = clk_regmap_div_recalc_rate,
>  	.determine_rate = clk_regmap_div_determine_rate,
>  	.set_rate = clk_regmap_div_set_rate,
> @@ -128,6 +174,7 @@ const struct clk_ops clk_regmap_divider_ops = {
>  EXPORT_SYMBOL_NS_GPL(clk_regmap_divider_ops, CLK_MESON);
>  
>  const struct clk_ops clk_regmap_divider_ro_ops = {
> +	.init = clk_regmap_init,
>  	.recalc_rate = clk_regmap_div_recalc_rate,
>  	.determine_rate = clk_regmap_div_determine_rate,
>  };
> @@ -170,6 +217,7 @@ static int clk_regmap_mux_determine_rate(struct clk_hw *hw,
>  }
>  
>  const struct clk_ops clk_regmap_mux_ops = {
> +	.init		= clk_regmap_init,
>  	.get_parent = clk_regmap_mux_get_parent,
>  	.set_parent = clk_regmap_mux_set_parent,
>  	.determine_rate = clk_regmap_mux_determine_rate,
> @@ -177,6 +225,7 @@ const struct clk_ops clk_regmap_mux_ops = {
>  EXPORT_SYMBOL_NS_GPL(clk_regmap_mux_ops, CLK_MESON);
>  
>  const struct clk_ops clk_regmap_mux_ro_ops = {
> +	.init		= clk_regmap_init,
>  	.get_parent = clk_regmap_mux_get_parent,
>  };
>  EXPORT_SYMBOL_NS_GPL(clk_regmap_mux_ro_ops, CLK_MESON);
> diff --git a/drivers/clk/meson/clk-regmap.h b/drivers/clk/meson/clk-regmap.h
> index e365312da54ece08098293b1a831c803415db814..f8cac2df5755b0f894570305604485f54c17ea49 100644
> --- a/drivers/clk/meson/clk-regmap.h
> +++ b/drivers/clk/meson/clk-regmap.h
> @@ -7,6 +7,7 @@
>  #ifndef __CLK_REGMAP_H
>  #define __CLK_REGMAP_H
>  
> +#include <linux/device.h>
>  #include <linux/clk-provider.h>
>  #include <linux/regmap.h>
>  
> @@ -31,6 +32,9 @@ static inline struct clk_regmap *to_clk_regmap(struct clk_hw *hw)
>  	return container_of(hw, struct clk_regmap, hw);
>  }
>  
> +/* clk_regmap init op to get and cache regmap from the controllers */
> +int clk_regmap_init(struct clk_hw *hw);
> +
>  /**
>   * struct clk_regmap_gate_data - regmap backed gate specific data
>   *
> diff --git a/drivers/clk/meson/sclk-div.c b/drivers/clk/meson/sclk-div.c
> index ae03b048182f3bbaf4a7e86b605fb4fb37b9cfd5..13536df1760d135cc2d62062e2699ed6842e1e5f 100644
> --- a/drivers/clk/meson/sclk-div.c
> +++ b/drivers/clk/meson/sclk-div.c
> @@ -222,6 +222,11 @@ static int sclk_div_init(struct clk_hw *hw)
>  	struct clk_regmap *clk = to_clk_regmap(hw);
>  	struct meson_sclk_div_data *sclk = meson_sclk_div_data(clk);
>  	unsigned int val;
> +	int ret;
> +
> +	ret = clk_regmap_init(hw);
> +	if (ret)
> +		return ret;
>  
>  	val = meson_parm_read(clk->map, &sclk->div);
>  
> diff --git a/drivers/clk/meson/vclk.c b/drivers/clk/meson/vclk.c
> index 36f637d2d01b5d86bf5d85196643ad9d66c6f19b..bcdec8a444f60838c84eb27c4cdf2b8f8574ce71 100644
> --- a/drivers/clk/meson/vclk.c
> +++ b/drivers/clk/meson/vclk.c
> @@ -45,6 +45,7 @@ static int meson_vclk_gate_is_enabled(struct clk_hw *hw)
>  }
>  
>  const struct clk_ops meson_vclk_gate_ops = {
> +	.init = clk_regmap_init,
>  	.enable = meson_vclk_gate_enable,
>  	.disable = meson_vclk_gate_disable,
>  	.is_enabled = meson_vclk_gate_is_enabled,
> @@ -127,6 +128,7 @@ static int meson_vclk_div_is_enabled(struct clk_hw *hw)
>  }
>  
>  const struct clk_ops meson_vclk_div_ops = {
> +	.init = clk_regmap_init,
>  	.recalc_rate = meson_vclk_div_recalc_rate,
>  	.determine_rate = meson_vclk_div_determine_rate,
>  	.set_rate = meson_vclk_div_set_rate,
> diff --git a/drivers/clk/meson/vid-pll-div.c b/drivers/clk/meson/vid-pll-div.c
> index 486cf68fc97a0205ee5139056b1eabc6e743ff35..c28d8b150400308df050e500c2aedc14157c1bcf 100644
> --- a/drivers/clk/meson/vid-pll-div.c
> +++ b/drivers/clk/meson/vid-pll-div.c
> @@ -90,6 +90,7 @@ static unsigned long meson_vid_pll_div_recalc_rate(struct clk_hw *hw,
>  }
>  
>  const struct clk_ops meson_vid_pll_div_ro_ops = {
> +	.init		= clk_regmap_init,
>  	.recalc_rate	= meson_vid_pll_div_recalc_rate,
>  };
>  EXPORT_SYMBOL_NS_GPL(meson_vid_pll_div_ro_ops, CLK_MESON);
> 
> -- 
> 2.45.2
> 
> 
> _______________________________________________
> linux-amlogic mailing list
> linux-amlogic@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-amlogic

-- 
Thank you,
Dmitry
