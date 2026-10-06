Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 769C5270545;
	Tue,  6 Oct 2026 12:30:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791289845; cv=none; b=KE5QAGyJ48CPR3qVMWdRKvN4RrUGGcYqfO7w9ROYPXcmNoM5B5DeRinVjClKdK7uTEMkAqNZz98IsmnECYzmyPt1IU8T+ry8YIMHondVYOFtHajbC6laEL0aj/AfUEcv51Y8lV2PfgDwRVkH1/rBvmSRx5/k3g01nzdTbtlOOyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791289845; c=relaxed/simple;
	bh=h5bQM1rR4u33RntUHnl2CZVJKBdA+1TE+lSGtks9VQc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GaCMXwNtCIj3EfIlujtHe4TkPIfic+3at9KFSE44y3alu3XV1iQ3WXVrig7g/3AMUD4Hq0LY8faj/tmtbDPdcOqEJiVqCd854FHOOYM/05DCAQGmKkfrZx92Sc6Ha5aaHYYuevoao6fD5sFWdSbhJGXpxNah70jhZvN59uWJYYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CgC9OJf5; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CgC9OJf5"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84A911F000FF;
	Tue,  6 Oct 2026 12:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791289844;
	bh=eYZ887+bbPIkK+uFPLZZOwWmb9webKDFve3kxvppxFI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=CgC9OJf5jOC5cppcglD4lRmQyTlm44UpWhyEB65r9Co5KYw6D9Mn2wCBRLtPuUBqj
	 SdFZs+1D8yq55jXYB6fnEzWNT+0NJ5YoeoBcmvLSA1eEstGHQdTUA7mRUPkUOlFsQE
	 b/I5enG0//iiSGG2dA3/XOxsWr1jsoR0KYyq/B2vUhFPH1Hkiad6EppUukP2RwSIT0
	 z0M4aLnq0+Wp5GUu85ny/H3XNph6l3+BOezuQgljZnC4MMQbyTyqeuKDbF7FAKZT4P
	 RGDOskhaR7KkKgVmvYvqOd8JRgqk8Dsy8A3g3QgHQzauez8jj9Cti/KRa2h0a+v+Pz
	 DKdUSyflPo1+g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 2/9] drm/bridge: fsl-ldb: Get the next non-panel
 bridge
Reply-To: sashiko-reviews@lists.linux.dev
To: "Laurentiu Palcu" <laurentiu.palcu@oss.nxp.com>
Cc: conor+dt@kernel.org, linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, Frank.Li@kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, robh@kernel.org
In-Reply-To: <20261006-dcif-upstreaming-v10-2-bcfb28de0aae@oss.nxp.com>
References: <20261006-dcif-upstreaming-v10-0-bcfb28de0aae@oss.nxp.com>
 <20261006-dcif-upstreaming-v10-2-bcfb28de0aae@oss.nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 06 Oct 2026 12:30:43 +0000
Message-Id: <20261006123043.84A911F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] commit message: code and commit message mismatch
--

commit e12c6082d93fb0f1838677a94386e1a971817862
Author: Liu Ying <victor.liu@nxp.com>

drm/bridge: fsl-ldb: Get the next non-panel bridge

This commit refactors the fsl-ldb driver to support getting either a panel
bridge or a non-panel bridge as the next bridge in the chain.

> The next bridge in bridge chain could be a panel bridge or a non-panel
> bridge.  Use devm_drm_of_get_bridge() to replace the combination
> function calls of of_drm_find_panel() and devm_drm_panel_bridge_add()
> to get either a panel bridge or a non-panel bridge, instead of getting
> a panel bridge only.

[Severity: Medium]
Is this description accurate for the changes implemented in this patch?

The commit message explicitly claims that devm_drm_of_get_bridge() was used
to replace of_drm_find_panel() and devm_drm_panel_bridge_add(). However,
looking at the diff below, the actual code replaces
of_drm_find_and_get_bridge() with of_drm_get_bridge_by_endpoint() in
fsl_ldb_probe().

Neither devm_drm_of_get_bridge() nor the combination of of_drm_find_panel()
and devm_drm_panel_bridge_add() are present in the previous code or the new
diff.

Could the commit message be updated to accurately reflect the actual API
changes being made?

> diff --git a/drivers/gpu/drm/bridge/fsl-ldb.c b/drivers/gpu/drm/bridge/fs=
l-ldb.c
> index 7ec84c81cd786..52ae7f5b63c7c 100644
> --- a/drivers/gpu/drm/bridge/fsl-ldb.c
> +++ b/drivers/gpu/drm/bridge/fsl-ldb.c

[ ... ]

> @@ -339,10 +336,14 @@ static int fsl_ldb_probe(struct platform_device *pd=
ev)
>  	if (of_property_present(dev->of_node, "nxp,enable-termination-resistor"=
))
>  		fsl_ldb->use_termination_resistor =3D true;
> =20
> -	fsl_ldb->bridge.next_bridge =3D of_drm_find_and_get_bridge(panel_node);
> -	of_node_put(panel_node);
> -	if (!fsl_ldb->bridge.next_bridge)
> -		return -ENODEV;
> +	next_bridge =3D of_drm_get_bridge_by_endpoint(dev->of_node,
> +						    fsl_ldb->ch0_enabled ? 1 : 2,
> +						    0);
> +	if (IS_ERR(next_bridge))
> +		return dev_err_probe(dev, PTR_ERR(next_bridge),
> +				     "failed to get next bridge\n");
> +
> +	fsl_ldb->bridge.next_bridge =3D next_bridge;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261006-dcif-upstr=
eaming-v10-0-bcfb28de0aae@oss.nxp.com?part=3D2
