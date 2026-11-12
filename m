Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794451046;
	b=rdJ8YJ43gbkBva1UWi6f0wf0HTGnUonz9Xlr25lh0CkcqBVVfr71KdksCvdkYJr/ASi6
	 i7fkAJLh2zjaP3bNSHiR95tJd4bapxBGQftphntbEBL+8tyVaa3S7gsCzac9P1VhQuv5r
	 Jvq5NatAri7aprvm8kOq4/qconB6Qbp/Q8FHpUWRsTiJ3/Qv4h37SRA5P+NHnCnd3YCDy
	 L2OG+M3avELS2maOtAR8b0y2Ce1bKoBjZmA8/xqySxbAD0LdtemD6sg8X52tKn0eeFJEk
	 6+nIAyr8ulvDEdn2RUWEJOSVdXkEalOkoZGa5P74r8gK7+L1Bf2BS3hOLWKzmbcaDvA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794451046;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=xCVjWYZyX6MIl7NK/C6S5kd8YAB1SgNtQl9A3ey/kVs=;
	b=GXdwwXkmYb9e5JqcMxRhfXm4khnGifZNLouCxSk1eiqBBBmARBDvu4JpR27kQJK9boAP
	 J0QG/cTo5ooSGfsAU0r+qCeUBU4YzMlf4pTQF+76cU6C5ab4Karht4oKhlkm+7XqdwV/g
	 A05SHOdHF1QS7ZSG4+rkW3O83jJ2WXhVSsbKd/t59SGsSpqsqP4yMhKdVDIwBXOeRBl59
	 wdnnxlfYtOjU0Hx2H2ucIZ5YZxIz2P00afU8JfFxub8Eu3QudLcIbWujXWdcV0lTnwf3g
	 deIaiZsKyBtpBRKy58E+EyYB6jpcwraTZxe7xz5lZeZIaAx2hDosKBG90JllCQp1xIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A4m1sYP5;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D141606A323
	for <linux-clk@vger.kernel.org>; Thu, 12 Nov 2026 02:37:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=A4m1sYP5
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 456491F00A05;
	Thu, 12 Nov 2026 02:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794451046;
	bh=xCVjWYZyX6MIl7NK/C6S5kd8YAB1SgNtQl9A3ey/kVs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=A4m1sYP5QIub9u2jHv9x4fxxJOmgUVJEwFcEzBaFtywMc89gyfUd8WwzpY9L0bcZY
	 2DpjMgWOGSVzt81PN64LHyfhW/Jk9KTRsLjWZfc2TETLiBUBVszzbcupuvfpMxyUXC
	 65afwwFC2aXR2JFJq/iFeDPel0tAGpOBesHhF3xv5vLGo5Wf1Qoh4fccUl1rKpxCC1
	 pqwaLMZcg1ZD7xMuGScJ06/k7hMJBDyYcucnyGb6dw3A+GG/9tKmFI40ie5I/ybmVQ
	 cWDkMFfaRhmgzvsN0oz5NPWPxixwTvX6f2vbXAJQW/eXVmSpsv41u1Z9yGpvUhL6hC
	 3YRnsqQO4rIGg==
Message-ID: <sashiko-outbox-210209@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] clk: keystone: sci-clk: Release nodes while scanning DT
 clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zhu Jun" <zhujun2@cmss.chinamobile.com>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20261112023137.118241-1-zhujun2@cmss.chinamobile.com>
References: <20261112023137.118241-1-zhujun2@cmss.chinamobile.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 12 Nov 2026 02:37:25 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential
issue to consider:
- [Low] clk: keystone: sci-clk: split __free() definition in
  ti_sci_scan_clocks_from_dt()
--

commit f771030e1cdc7fd996c4caa11e1e8cac88d5ff99
Author: Zhu Jun <zhujun2@cmss.chinamobile.com>

clk: keystone: sci-clk: Release nodes while scanning DT clocks

This commit adds __free(device_node) annotations in
ti_sci_scan_clocks_from_dt() to release device_node references obtained
while scanning the device tree.

> diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-cl=
k.c
> index 967f779003587..433bdca8ac836 100644
> --- a/drivers/clk/keystone/sci-clk.c
> +++ b/drivers/clk/keystone/sci-clk.c

[ ... ]

> @@ -573,13 +573,16 @@ static int ti_sci_scan_clocks_from_dt(struct sci_cl=
k_provider *provider)
>  		index =3D 0;
> =20
>  		do {
> +			struct device_node *clk_node __free(device_node) =3D NULL;
> +
>  			ret =3D of_parse_phandle_with_args(np, *clk_name,
>  							 "#clock-cells", index,
>  							 &args);
>  			if (ret)
>  				break;
> =20
> -			if (args.args_count =3D=3D 2 && args.np =3D=3D dev->of_node) {
> +			clk_node =3D args.np;
> +			if (args.args_count =3D=3D 2 && clk_node =3D=3D dev->of_node) {

[Severity: Low]
This isn't a bug, but cleanup.h recommends defining and initializing
__free() variables in a single statement rather than initializing to NULL
and assigning later when the scope allows it.  Since the error check on
ret breaks out of the loop before clk_node is used, clk_node can be
defined directly at the assignment:

	struct device_node *clk_node __free(device_node) =3D args.np;

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261112023137.1182=
41-1-zhujun2@cmss.chinamobile.com?part=3D1
