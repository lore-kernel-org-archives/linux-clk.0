Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1E974FC8C0;
	Fri,  4 Sep 2026 16:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788539243; cv=none; b=BfAO0R7QvDY6VZiH6rnsKeU02WPyQI8JDMpYGKSyU2aXLz3RPpV2TYE7u0HnsyynxSgXV0R6b+R0htLusLo27nBs0S4JoL/vY496qg25kCAXZdB1h/M2K+FQuy5l1s1L1ez3+FND6gUrjqVkgHEZlAIfSAt8AcQ58QIcNGKXLUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788539243; c=relaxed/simple;
	bh=NaSQoLKgTRtvnDO6BbOU5EFZwg6VsLOMVXzSn4hXujk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sJJInK+lwN3m1fEflbIeHkns2cI0hJ8uPRGX8PRcY5wXvV3F5IsDPt0QLjt2ktw+SBbR0HjRinVbmckZYQDgt71veY+4LlAkcPeEvzOehjKPcopbt8y1n+PXXArQqZTVoJP5MHfctg28FJNG20TYMVkFohspIHugi9Dys61oZhY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FTT87256; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FTT87256"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 229C41F00A3D;
	Fri,  4 Sep 2026 16:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788539241;
	bh=L7jNEcaNLXnTOUXQ09V4PZjbhobVi8jgrW5FetYf4Jo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FTT87256ptHkbr1h51V6ljIhkb+mclooF2olnydV482v9b3W7xFHRa90pICF7er79
	 d5tUG1s1v3IUBhfxgf+HXiN3JGOWuY8cgA9HYpnyY3mEBnm7IMJ3DHKAdFKy8fl7QP
	 h9My7/hhQCVL5cDnEo+k0fSLBPSLtm1QJPZJB7WheO6Wk+HUAjaePNzCBRfdrBP4uS
	 1aFbn/01cBUcPyp2wLmvDOZon+MJprl+6YZqmYGUiVz3m4ZEVIXxRYCMvSDen12oim
	 UQeFOytgP97/ytiCbp9/qqn7ccPrhizTdkYRkuxHnlUDprRBEVhJDc5FBrF0sIDnPO
	 b2zGisFQj5fiw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 27/27] clk: mediatek: Add MT8189 ufs clock support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Louis-Alexis Eyraud" <louisalexis.eyraud@collabora.com>
Cc: robh@kernel.org, linux-clk@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260904-mt8189-clocks-system-base-v6-27-5df247f56938@collabora.com>
References: <20260904-mt8189-clocks-system-base-v6-0-5df247f56938@collabora.com>
 <20260904-mt8189-clocks-system-base-v6-27-5df247f56938@collabora.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 16:27:20 +0000
Message-Id: <20260904162721.229C41F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Preexisting Use-After-Free risk when reset controller registration=
 fails in `__mtk_clk_simple_probe`.
--

commit b8b3345488c1f0eb6db7c64bd2d428ce6c86087f
Author: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>

clk: mediatek: Add MT8189 ufs clock support
   =20
Add support for the MT8189 ufs clock controller, which provides clock gate=
=20
control for Universal Flash Storage.

> diff --git a/drivers/clk/mediatek/clk-mt8189-ufs.c b/drivers/clk/mediatek=
/clk-mt8189-ufs.c
> new file mode 100644
> index 0000000000000..ec98fe01a5989
> --- /dev/null
> +++ b/drivers/clk/mediatek/clk-mt8189-ufs.c

[ ... ]

> +static const struct mtk_clk_desc ufscfg_ao_reg_mcd =3D {
> +	.clks =3D ufscfg_ao_reg_clks,
> +	.num_clks =3D ARRAY_SIZE(ufscfg_ao_reg_clks),
> +	.rst_desc =3D &ufscfg_ao_rst_desc,
> +};

[ ... ]

> +static struct platform_driver clk_mt8189_ufs_drv =3D {
> +	.probe =3D mtk_clk_simple_probe,

[Severity: High]
This isn't a bug introduced by this patch, but does the inclusion of=20
rst_desc expose a use-after-free risk in the Mediatek clock framework?

Looking at __mtk_clk_simple_probe() in drivers/clk/mediatek/clk-mtk.c, the=
=20
framework registers the OF clock provider before the reset controller:

	r =3D of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
	if (r)
		goto unregister_clks;

	if (mcd->rst_desc) {
		r =3D mtk_register_reset_controller_with_dev(&pdev->dev,
							   mcd->rst_desc);
		if (r)
			goto unregister_clks;
	}

If mtk_register_reset_controller_with_dev() fails, the error path jumps to=
=20
unregister_clks and frees clk_data via mtk_free_clk_data().=20

Since it doesn't call of_clk_del_provider(node) during this teardown, does=
=20
this leave a dangling pointer in the OF clock framework? Any subsequent OF=
=20
clock lookup for this device would likely dereference the freed clk_data.

> +	.remove =3D mtk_clk_simple_remove,
> +	.driver =3D {
> +		.name =3D "clk-mt8189-ufs",
> +		.of_match_table =3D of_match_clk_mt8189_ufs,
> +	},
> +};

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-mt8189-clo=
cks-system-base-v6-0-5df247f56938@collabora.com?part=3D27
