Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC2ED3B27CF
	for <linux-clk@vger.kernel.org>; Fri, 21 Aug 2026 10:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787307338; cv=none; b=f5tmTwknPD+M/UVdf+mXcfLnqZkZue3Ftp6b+iPkvSbIT6flXuAeRLAyumc+dqqApkL5AJwbvIGKwrpfFIp9A8KawyCoeLIY5EZUtqxJxR5dJTG1rGyFniH7XFnb9XxeBUdGF/aNtMN3y1YnlL0FTZ7KCB+hGJQjj/VU9a52s5c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787307338; c=relaxed/simple;
	bh=0/FgIDgcy/xmMQuyW4fs4iM4Mci3MBSDhxcs3Zlaqhs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=DmVhCryMsmtbBCRpaZMqfspnFfaO0YFW7CE0V959m4LvnWQWandNS874fa0/6Mo/TuoGjb6AOccX1oXsK+VJrjSHGKAVCuNALXtCsBRPggJXV58ELqGDoH6whvDYm5+arBNhYSLkdqnH88Ptkd9L9dh552VOYoiyJhMJA4n5JZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JZcgXIAI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JZcgXIAI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D01291F000E9;
	Fri, 21 Aug 2026 10:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787307324;
	bh=1782I0SVlKTMUnzkgO7tYHy1NNV0f8J3mXNegURaqj4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=JZcgXIAInZ7sB2W1n2pC4rTkaKpn0WAPCuujF09nICG1Xt/uEXH1PpnxvRssLq/3I
	 jABxepZfBuYcjHdaWYMxxJkSJlXMV8O6teGF9dusxwIG12KVs5cgiiQyuf/224p8kk
	 WYb3NodbH+QXpvphKw62kUzT7pTpCiD9NJ3SsT3wl4GZPxPXiCPk8iqmvjWdBc6pxS
	 zpgBBP+2cPx/3AWOFRXp8fTO7wRQY9QT2XPM7niWtK9B6+vDxelDPxlEo+F6JIGiNp
	 XdjJS0cWQamwCcqrfRRm1qa0otyP0zxqrgpMKcve17MNL4HHJ6fBVIw4Ncp4KTOc6k
	 vE7f41Y8yrc+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] mmc: sdhci-of-arasan: Make sure clk_init_data is
 fully initialized
Reply-To: sashiko-reviews@lists.linux.dev
To: "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: linux-clk@vger.kernel.org, linux-amlogic@lists.infradead.org, neil.armstrong@linaro.org
In-Reply-To: <0235d3a3d5b71a125eeff6d7be25ddaec80ce539.1787240090.git.geert+renesas@glider.be>
References: <cover.1787240090.git.geert+renesas@glider.be>
 <0235d3a3d5b71a125eeff6d7be25ddaec80ce539.1787240090.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 10:15:23 +0000
Message-Id: <20260821101523.D01291F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Another driver in the same subsystem (meson-mx-sdio.c) suffers fro=
m the exact same uninitialized struct clk_init_data issue that this patch f=
ixes.
- [High] The driver registers multiple clock providers for the same device =
node but only deletes one on teardown, leading to a leaked provider struct,=
 a leaked device node reference, and a dangling UAF pointer in the global c=
lock providers list.
--

--- Patch [2]: [PATCH 2/2] mmc: sdhci-of-arasan: Make sure clk_init_data is=
 fully initialized ---
commit 34a49f083df630f25a24052b358249a2c48b6055
Author: Geert Uytterhoeven <geert+renesas@glider.be>

mmc: sdhci-of-arasan: Make sure clk_init_data is fully initialized

The clk_init_data structure contains mutually-exclusive members for
specifying clock parents. Uninitialized members can cause issues exposed by
certain stack initialization configs. This commit zeroes the struct to prev=
ent
bugs and future breakage.

[Severity: High]
This isn't a bug introduced by this patch, but I noticed another driver in
the same subsystem suffers from the exact same uninitialized struct
clk_init_data issue that this patch fixes.

In drivers/mmc/host/meson-mx-sdio.c:meson_mx_mmc_register_clks():

	struct clk_init_data init;
	...
	init.name =3D devm_kasprintf(host->controller->parent, ...);
	init.ops =3D &meson_mx_mmc_cfg_div_ops;
	init.flags =3D 0;
	...

Does this also need zero-initialization to avoid leaving fields like
parent_data and parent_hws as stack garbage, which could lead to memory
corruption during device probe?

> diff --git a/drivers/mmc/host/sdhci-of-arasan.c b/drivers/mmc/host/sdhci-=
of-arasan.c
> index 0a4b4696bc01c..aec617aa8e0ca 100644
> --- a/drivers/mmc/host/sdhci-of-arasan.c
> +++ b/drivers/mmc/host/sdhci-of-arasan.c
[ ... ]
> @@ -1638,8 +1638,8 @@ sdhci_arasan_register_sampleclk(struct sdhci_arasan=
_data *sdhci_arasan,
>  				struct device *dev)
>  {
>  	struct sdhci_arasan_clk_data *clk_data =3D &sdhci_arasan->clk_data;
> +	struct clk_init_data sampleclk_init =3D {};
>  	struct device_node *np =3D dev->of_node;

[Severity: High]
This is a pre-existing issue, but I noticed a potential leak and dangling
pointer hazard when tearing down these clock providers.

If #clock-cells > 0, this driver registers both the sdcardclk and sampleclk
providers for the same dev->of_node via of_clk_add_provider().

During unbind, sdhci_arasan_unregister_sdclk() calls:

	of_clk_del_provider(dev->of_node);

Since of_clk_del_provider() stops after deleting the first matching provider
it finds (which would be sampleclk), does this leave the sdcardclk provider
on the global list?=20

When the underlying clock is freed by devm, any subsequent DT lookup on this
node might fetch the dangling provider and return a freed struct clk pointe=
r.
Could we be leaking a provider and device node reference here?

> -	struct clk_init_data sampleclk_init;
>  	const char *parent_clk_name;
>  	int ret;
>

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1787240090.gi=
t.geert+renesas@glider.be?part=3D2
