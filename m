Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14DDD471D1F;
	Fri, 21 Aug 2026 10:13:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787307237; cv=none; b=Dino3wa3Q4Zm9hLytfUHReIkXmZrMN/FrGY8xCfUbg5PP0uPuSmqs2mcIOuOyqCroXu8K50aVQbOkVSKEHqJxYRlxD2fjOaUOp1iWXcBEkdwVUXmrE6Lms2GuHlk/qniseEzGGqLVV6RZEIh7agg4TsAroydbFughNhWDLbIThg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787307237; c=relaxed/simple;
	bh=W+PFBVMEdJKaJp9SnIWR4g8CktcIACGbhsr0j/XR0Pc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BvHxMGPqtqsTnGJqQPOJh64tyiGhCU+tukFUlFfNat1mJCDHt7U9kAnMXzfm/mzA/axx1ZycQOnk6vR1MDInj9xOkzOz/rTTIujnEi3CbAOSmshfGgr3GB9utnD7Jaj96P9WG7tdGS132VFrLaF0r43uBmv01AXFsQX48QEnLEA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Z5i5MvRF; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Z5i5MvRF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D3C11F000E9;
	Fri, 21 Aug 2026 10:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787307227;
	bh=ogetkg0Uuo6RHrWZmvNz4/ua4kBg7pP+uQeMUOIcWBM=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Z5i5MvRFtgRlxMrMTzO/HxWLZgaSBkrTy2uIjTBmb8BJ91SfxlFU/TjABdejbOusQ
	 m0Yk+Q/TU8UjcdbtTsOb0G/sfKuHc9Hu49rCmRYWxEz6P28HNfvBac+ORaCj6Ehy6o
	 5bTW01s7JGPTD1igVzZmcEgQ/PC+m+XSoZrLfTu7ODYWUCWHwUWi6z4W43tah/XD1N
	 vKKkt7viXZuUL0n3jM53hl+DD3UDFnmoNAjifyHYUkccq3moFai1WO6/MMzcoQdyX9
	 Urr0fVOwO5eP1n8PxOmZm8sVA4TX1NndHJVG1VXuzjdW8zNXKHsI6+NUQbm+DrlnVq
	 uj8jJjj9BvotQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/2] drm/tegra: Make sure clk_init_data is fully
 initialized
Reply-To: sashiko-reviews@lists.linux.dev
To: "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-sunxi@lists.linux.dev
In-Reply-To: <9bc5029f7ad84b0b1e02be231a5abd7e5fa03946.1787239944.git.geert+renesas@glider.be>
References: <cover.1787239944.git.geert+renesas@glider.be>
 <9bc5029f7ad84b0b1e02be231a5abd7e5fa03946.1787239944.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 21 Aug 2026 10:13:46 +0000
Message-Id: <20260821101347.1D3C11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:

Pre-existing issues:
- [High] Missing bounds check on the `nvidia,interface` device tree propert=
y causes out-of-bounds array indexing and arbitrary MMIO access.
--

--- Patch [2]: [PATCH 2/2] drm/tegra: Make sure clk_init_data is fully init=
ialized ---
commit d6e18a3c09cc145658765914a32b191ad5da6aa8
Author: Geert Uytterhoeven <geert+renesas@glider.be>

drm/tegra: Make sure clk_init_data is fully initialized

The clk_init_data structure contains several mutually-exclusive members
for different methods to specify the possible parents of a clock,
prompting drivers to initialize only the members they need.  However,
not initializing all members may cause subtle issues, which are only
exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
enabled. Make sure all members are fully initialized, to avoid such bugs,
and to prevent future breakage when converting drivers to a different
method for specifying the parents.

> diff --git a/drivers/gpu/drm/tegra/sor.c b/drivers/gpu/drm/tegra/sor.c
> index 802d2db7007af..c28557d0c96e5 100644
> --- a/drivers/gpu/drm/tegra/sor.c
> +++ b/drivers/gpu/drm/tegra/sor.c
> @@ -596,8 +596,8 @@ static const struct clk_ops tegra_clk_sor_pad_ops =3D=
 {
>  static struct clk *tegra_clk_sor_pad_register(struct tegra_sor *sor,
>  					      const char *name)
>  {
> +	struct clk_init_data init =3D {};
>  	struct tegra_clk_sor_pad *pad;
> -	struct clk_init_data init;
>  	struct clk *clk;
> =20
>  	pad =3D devm_kzalloc(sor->dev, sizeof(*pad), GFP_KERNEL);

[ ... ]

>  	pad->sor =3D sor;
> =20
>  	init.name =3D name;
>  	init.flags =3D 0;
>  	init.parent_names =3D tegra_clk_sor_pad_parents[sor->index];

[Severity: High]
This is a pre-existing issue, but can this out-of-bounds array indexing
occur if the Device Tree provides an invalid "nvidia,interface" value?

In tegra_sor_parse_dt(), the "nvidia,interface" property is read and
assigned directly to sor->index without any bounds checking:

drivers/gpu/drm/tegra/sor.c:tegra_sor_parse_dt() {
	...
	err =3D of_property_read_u32(np, "nvidia,interface", &value);
	if (err < 0)
		return err;

	sor->index =3D value;
	...
}

If a malformed Device Tree is provided, does using this unbounded sor->inde=
x to
access the tegra_clk_sor_pad_parents array lead to an out-of-bounds memory =
read?

It appears it could also cause arbitrary MMIO reads and writes when computi=
ng
register offsets using DC_DISP_CORE_SOR_SET_CONTROL(sor->index).

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1787239944.gi=
t.geert+renesas@glider.be?part=3D2
