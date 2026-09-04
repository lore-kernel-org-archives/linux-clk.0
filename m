Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06E133BB69B;
	Fri,  4 Sep 2026 16:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788538839; cv=none; b=mq0yvdHwnhoYhJVX7pzJ/szwDcHQ2jt08oNTd+XI7/JdVynltXr6HfbxlLFuPDyTflmkQQqtKaRkqS015Q5duzfu1b7akNaDtVejc70iLrEvEtfWmHzc1k7wtsdEqCiI9+9Wwaow5wfFU//4hqjdpxO8aQd7xP3eULl0iJWpZpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788538839; c=relaxed/simple;
	bh=lcdWG8bWHRxVbaHEIsT7H9HjnvDMnhj/o+yqbZQX3W8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GyuTbd7Nz3JfjhZmDc9KKjIhtH/UB1R62zPyg6y4nxt6wiHbZaw+Zgd2p3rdgoTmjTYMk16atWNjqCaCgTT7780Ax1rFch7/y+mvoBCJ8WVWN0T9cN48hTEfg4FTuDJ8nhWblT9I4JXtdQBlbEQbiCKBntFsuKFFd0H6laU6xjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W6ZmBPDt; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W6ZmBPDt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 599B51F00A3D;
	Fri,  4 Sep 2026 16:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788538837;
	bh=ML3+zmo2+jFgiyN/6mo5MSwvPOBP7XJnKB4ZZU48AV8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W6ZmBPDtC9LctOPf7rrl8QthBRUS3HcQk2I1EaUksUYQbeeCONWR9wk887eCAKUu+
	 HmaqWzcw2XXYDBdBuCOWXFOubvkWBfH6SObb58AH09ZNuIyq+dZ+uY1Auq34POKH6+
	 +o4jXdbFe3zM+tpZxbl6gzbIasxdEcdjeiviJoMyUFOLRDVgv0QObMea1/HMX5SXO+
	 j4bpWg2B+MxPLNZkk6V+Dfh3aF7P86FE9QGCcHrOieMKsSp59/cEAkr6ZaO0RXu+rx
	 A9qcHZZw4kp1wrN1b8ejqlFMKbyxlTOcAlixUQM/QA8IoFfRiMJYmw0l5rMvX31f9n
	 iy9kb0EM5LE+Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 19/27] clk: mediatek: Add MT8189 topckgen clock
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: linux-clk@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260904-mt8189-clocks-system-base-v6-19-5df247f56938@collabora.com>
References: <20260904-mt8189-clocks-system-base-v6-0-5df247f56938@collabora.com>
 <20260904-mt8189-clocks-system-base-v6-19-5df247f56938@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 16:20:36 +0000
Message-Id: <20260904162037.599B51F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Use-after-free of `struct clk` and `struct clk_core` due to mismat=
ched devres unregistration order during device remove or probe error.
--

commit c9fccf00f7b65c99304902dc0b7804332954da0c
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

clk: mediatek: Add MT8189 topckgen clock support

Add support for the MT8189 topckgen clock controller, which provides
muxes and dividers for clock selection in other IP blocks.

> diff --git a/drivers/clk/mediatek/clk-mt8189-topckgen.c b/drivers/clk/med=
iatek/clk-mt8189-topckgen.c
> new file mode 100644
> index 0000000000000..6ed7661119b82
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8189-topckgen.c
[ ... ]
> +/* Register mux notifier for MFG mux */
> +static int clk_mt8189_reg_mfg_mux_notifier(struct device *dev,
> +					   struct clk *clk)
> +{
> +	struct mtk_mux_nb *mfg_mux_nb;
> +
> +	mfg_mux_nb =3D devm_kzalloc(dev, sizeof(*mfg_mux_nb), GFP_KERNEL);
> +	if (!mfg_mux_nb)
> +		return -ENOMEM;
> +
> +	mfg_mux_nb->ops =3D &mtk_mux_clr_set_upd_ops;
> +	mfg_mux_nb->bypass_index =3D 0; /* Bypass to CLK_TOP_MFG_REF_SEL */
> +
> +	return devm_mtk_clk_mux_notifier_register(dev, clk, mfg_mux_nb);

[Severity: High]
This isn't a bug introduced by this patch, but does this devres registration
cause a use-after-free during device removal?

The clock notifier is registered using devres via
devm_mtk_clk_mux_notifier_register(). During device unbind (e.g., via sysfs=
 or
rmmod) or when probe fails after the notifier is registered, the driver
manually unregisters the clock via mtk_clk_unregister_muxes(), which
internally calls clk_hw_unregister(). This unconditionally frees the struct
clk instance.

Afterward, the devres framework automatically runs cleanup callbacks and
invokes devm_clk_notifier_release(). This devres callback passes the
already-freed clk pointer to clk_notifier_unregister(), which dereferences
the freed memory to access clk->core->notifier_count.

> +}

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-mt8189-clo=
cks-system-base-v6-0-5df247f56938@collabora.com?part=3D19
