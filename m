Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6160335E1D5
	for <linux-clk@vger.kernel.org>; Sun, 13 Sep 2026 13:05:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789304710; cv=none; b=bRLMCCpUTzCLTnxRlj/USSYEu1cDJkdlT4Oolas3C+CqPzG7gTqUARoa0wnEls4C43vZDKBnVAj21jdR9Q4M2J87+ZhtrV1B+tY1TqFuAXhHNBZXaGDa4gYka/tOaWdmxp4htsFFJN/eO22OuthN8JUVFCmwfNPJ+vImsSBTFPM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789304710; c=relaxed/simple;
	bh=D1Rt51EH//PvlTYC1bDz0IcfOp1LaKpZBHo7XTslpYI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=faPxeqBOvbNyGjxL4pfrcTYoeF+wwXZyicwvRp+d8Gt2j2Z8i0E+mP4drfZ41mhZfzR61vR2/ED3beZDccSVIQ3f8zcjdE/ZQT9m/hnzBe27KWXGh/gMf08vpfI+9oPoR4rg+6OWHbb/ZGk4kqYy6WImZ2tCpnrSsZx7z3GMJvE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=f1OiNekm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="f1OiNekm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8B9B1F000FF;
	Sun, 13 Sep 2026 13:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789304709;
	bh=Qn7SwRkHISWPgA6fVB8jk19/tXXOAFbi+cFLvvs1YKI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=f1OiNekmDF83n62CcniouONJsmpiapREg9n9/BgTq/SBkzMAFDAOqg8qK1ZoRsYZO
	 540G/lQriwSBu4gCAgdQhCNFG4v4opNnSy1MVF6Vmv5VVXPVN9deexoZRhWGnoOfgd
	 wLOCnJS0CiqzMKXVOnqw4EW7P4jz4I/H0nX1BIV5Uf8i6VvAAkoG9oJCMVorAVFpHK
	 Uj17ES+0iCqZcvG7mQ0uMNd1UBLh9DpxR076AUJTkn0itJK1ZPNF4/8vvraD7JUdYG
	 DiQuBt0GH5PP5Mz2TZySkgPCn0CFJwR1k5LJVWivoT4EIfPuI1demHxPqSyGtnLO7y
	 yixDSM+FyaW7w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] clk: starfive: jh7110: reject oscillator lookup errors
Reply-To: sashiko-reviews@lists.linux.dev
To: "Slavin Liu" <bolin.liu@seu.edu.cn>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20260913125112.109755-1-bolin.liu@seu.edu.cn>
References: <20260913125112.109755-1-bolin.liu@seu.edu.cn>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 13 Sep 2026 13:05:08 +0000
Message-Id: <20260913130508.D8B9B1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 2 potential issue(=
s) to consider:

Pre-existing issues:
- [High] The clock notifier `jh7110_pll0_clk_notifier_cb` completely ignore=
s the `ABORT_RATE_CHANGE` event, permanently leaving the CPU reparented to =
the slow oscillator if a clock rate change fails.
- [High] Missing cleanup in probe error paths causes a clock reference leak=
 and a Use-After-Free (UAF) vulnerability in the notifier.
--

commit ebd9f7e3f2dc35439009c9df2e84ee190db37687
Author: Slavin Liu <bolin.liu@seu.edu.cn>

clk: starfive: jh7110: reject oscillator lookup errors

Clock lookup may fail while allocating a consumer reference. Return
a notifier error rather than passing ERR_PTR as the new clock parent.

> diff --git a/drivers/clk/starfive/clk-starfive-jh7110-sys.c b/drivers/clk=
/starfive/clk-starfive-jh7110-sys.c
> index 03c17cd2032f5..847c0a39e5ab5 100644
> --- a/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> +++ b/drivers/clk/starfive/clk-starfive-jh7110-sys.c
> @@ -390,6 +390,9 @@ static int jh7110_pll0_clk_notifier_cb(struct notifie=
r_block *nb,
>  	if (action =3D=3D PRE_RATE_CHANGE) {
>  		struct clk *osc =3D clk_get(priv->dev, "osc");
> =20
> +		if (IS_ERR(osc))
> +			return notifier_from_errno(PTR_ERR(osc));
> +
>  		priv->original_clk =3D clk_get_parent(cpu_root);
>  		ret =3D clk_set_parent(cpu_root, osc);
>  		clk_put(osc);

[Severity: High]
This isn't a bug introduced by this patch, but does the notifier ignore the
ABORT_RATE_CHANGE event?

If a PLL rate change is aborted (e.g., rejected by a downstream clock
notifier returning NOTIFY_BAD, or failing at the hardware level), the
core clock framework emits an ABORT_RATE_CHANGE notification.

Because this event is ignored, the reparenting is never undone:

	} else if (action =3D=3D POST_RATE_CHANGE) {
		ret =3D clk_set_parent(cpu_root, priv->original_clk);
	}

Could the CPU clock remain permanently parented to the 24MHz slow oscillator
instead of being restored, severely degrading system performance?


[Severity: High]
This is a pre-existing issue, but does jh7110_syscrg_probe() leave a dangli=
ng
notifier if a later registration fails?

If probe fails after successfully registering the clock notifier
(e.g., devm_clk_hw_register fails), the devres frees the priv structure.
However, the notifier is never unregistered:

drivers/clk/starfive/clk-starfive-jh7110-sys.c:jh7110_syscrg_probe() {
	...
	pllclk =3D clk_get(priv->dev, "pll0_out");
	if (IS_ERR(pllclk)) {
	...
	} else {
		priv->pll_clk_nb.notifier_call =3D jh7110_pll0_clk_notifier_cb;
		ret =3D clk_notifier_register(pllclk, &priv->pll_clk_nb);
		if (ret)
			return ret;
		priv->pll[0] =3D NULL;
	}
	...
		ret =3D devm_clk_hw_register(&pdev->dev, &clk->hw);
		if (ret)
			return ret; /* priv freed, but notifier still active */
	...
}

Could a subsequent rate change on pll0_out dereference the freed memory?
Also, does the pllclk reference obtained via clk_get() leak since it is
never freed with clk_put()?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260913125112.1097=
55-1-bolin.liu@seu.edu.cn?part=3D1
