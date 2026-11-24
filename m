Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795539928;
	b=BLzG3Oehnadwemzv8iJEZcW+Tq8W/jWGe2v+6COC20J4MEM3P+tqf4zjV3IQ8EacwqW3
	 K8/s40X3i/NQt532gJkgsLZFbgCAt7xowY4ykWM3WYMyvLtQ2EtcAf5AJIlUdWsL2F2f8
	 w6Pb9VJzNiJld/4fKAMa+zWBi1W//COXm/3FI85Rdo6zOxHqcdDkRXYGRPxeUNMV7Yozj
	 uxAIFDhVc01spQplQN5RX5qlTthpAP24tciWk90AuIblK9YbGX0XtOy7H4f1dHtOtq/pQ
	 Jius+jmoKpH8AilnTeGaMvmtgtD0cea/bKbJzNamZzbVkcrdlClhs1SOKrW2qYc6Thg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795539928;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=5YXINzAIgoH3lok9RVMBss6u9Tr706x9HN937IH4IVA=;
	b=ip1hbhKZah5cPQlOmJBavmcmGySx09ou6q3gW3Mkftb7/oobT9LqDSGL2fYe0u2a1XGJ
	 9oMJ8+9GTsnqdewjQNM6fA2kTDFpM3tME5itY2BpbZeI+D+wShGk/seLIdoyFHbknsUfM
	 HNkKXIig1bD6qbJjTQx4SSsMItAkLtUTcOa6lBELiDygzWdWyse3G4VuPaqHc/d5R6PgW
	 sYgHM34gwBinPbBsgxVJ2O2XP/8dKFkvxjj2WutNU2bICHslew2yGmbN5f5IjMIiChA0p
	 y++weSCH7wjTtyVlQI8w2E2HpNQEH5aZjhGqXhEm+Lc5GnG7hOI424kdrkQKPnVUDIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c5jJCwZS;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96005606A321;
	Tue, 24 Nov 2026 17:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=c5jJCwZS
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E9711F000EB;
	Tue, 24 Nov 2026 17:05:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795539927;
	bh=5YXINzAIgoH3lok9RVMBss6u9Tr706x9HN937IH4IVA=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=c5jJCwZSVtQlNFniz4pYhnQxWIR9tXhrk4rS6UQn8Wegl6BwsxlTRydxYE1NdJA8A
	 PY77Gy+s6jwDjn7QDzuPaf41t4HnUWwTvPZCKoGqmnlJ/6DaoUyGnK8xUvG8De6DLH
	 u/27maVsLxpY+aCioxkd5VjPs61ppjkjisfybrtu5G32mdtvyTAgqPufsMPWQtIYzS
	 eJTuxYGEdxy15loW7+7IBJAFvLLv8QutdwUdtAGqsDy/ebLX/LynJPCXf/gFutMwfE
	 uA5H2rbIvfZM2DdkVXYPtzvddhY0UFXFQX4M5lxtgs+ZLrRmWEV8GPPY3CnXfhc0cg
	 j6G+GIFqOEEEw==
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
Subject: Re: [PATCH v5 3/6] clk: siflower: Add SF19A2890 clock manager
 driver
From: Brian Masney <masneyb@kernel.org>
To: Joseph Telaak <joseph@telaak.dev>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
 Paul Burton <paulburton@kernel.org>, Jiaxun Yang <jiaxun.yang@flygoat.com>, 
 Chuanhong Guo <gch981213@gmail.com>, Yao Zi <me@ziyao.cc>, 
 =?utf-8?q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>, 
 linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261123-sf19a2890-sysm-v5-3-4ba44a0db17d@telaak.dev>
References: <20261123-sf19a2890-sysm-v5-0-4ba44a0db17d@telaak.dev>
 <20261123-sf19a2890-sysm-v5-3-4ba44a0db17d@telaak.dev>
Date: Tue, 24 Nov 2026 12:05:08 -0500
Message-Id: <179553990883.338124.17209990225292890457.b4-review@b4>
X-Mailer: b4 0.17-dev-8145e
X-Developer-Signature: v=1; a=openpgp-sha256; l=2342; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=uUMody63Siy6rWiJavlvtygHAqJl5E2A5Jith/K0ARs=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLJZD59QPfdtee6e/lrfepvgidXaay0m3XL5cLD41GvBQ
 yIt1n8KOkpZGMS4GGTFFFmW5BoVRKSusr13R5MFZg4rE8gQBi5OAZhI1kpGhqbH/19dmtj4vmVC
 7B7Z313Czrs+mB9inGVw/q8NkwOXATsjw68Vf9cfXPO7wjtvcdaCy6ah3jPufj6n3K8n0nvK8pX
 RCXYA
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

Hi Joseph,

> Add a driver for the clock manager of the Siflower SF19A2890: the CPU,
> DDR and common PLLs, and the muxes with dividers that derive the bus,
> CPU and peripheral clocks from them. The GIC timer probes before the
> platform bus and needs the CPU clock, so the driver registers that clock
> and its PLLs early, from CLK_OF_DECLARE_DRIVER, and the other clocks from
> a platform driver.
> 
> Based on the driver in Chuanhong Guo's SF19A2890 branch.
> 
> Link: https://github.com/981213/linux/commit/0466d6303c25
> Co-developed-by: Chuanhong Guo <gch981213@gmail.com>
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>
> ---
>  MAINTAINERS                          |   1 +
>  drivers/clk/Kconfig                  |   1 +
>  drivers/clk/Makefile                 |   1 +
>  drivers/clk/siflower/Kconfig         |  11 +
>  drivers/clk/siflower/Makefile        |   2 +
>  drivers/clk/siflower/clk-sf19a2890.c | 494 +++++++++++++++++++++++++++++++++++
>  6 files changed, 510 insertions(+)

[snip]

> static unsigned long sf19a28_muxdiv_recalc_rate(struct clk_hw *hw,
>                                                 unsigned long parent_rate)
> {
>         struct sf_clk_common *cmn_priv = hw_to_sf_clk_common(hw);
>         struct sf19a2890_clk *priv = cmn_to_clk(cmn_priv);
>         u32 div;
> 
>         div = sf_readl(cmn_priv, priv->offset + REG_MUXDIV_RATIO) + 1;
>         return parent_rate / div;

Newline before the return. There's other places where this is needed as
well.

> +static int sf19a2890_clk_probe(struct platform_device *pdev)
> +{
> +	struct clk_hw_onecell_data *data = sf19a2890_clk_data;
> +	struct device *dev = &pdev->dev;
> +	unsigned int i;
> +	int ret;
> +
> +	if (!data)
> +		return -ENODEV;
> +
> +	for (i = 0; i < data->num; i++) {
> +		struct clk_hw *hw = sf19a2890_hws[i];
> +
> +		/* Registered early */
> +		if (!IS_ERR(data->hws[i]))
> +			continue;
> +
> +		hw_to_sf_clk_common(hw)->base = sf19a2890_clk_base;
> +		ret = devm_clk_hw_register(dev, hw);
> +		if (ret)
> +			return dev_err_probe(dev, ret, "failed to register clock %u\n", i);
> +
> +		data->hws[i] = hw;

You can assign this before the devm_clk_hw_register().

Brian

-- 
Brian Masney <masneyb@kernel.org>
