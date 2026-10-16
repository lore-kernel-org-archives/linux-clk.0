Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979844E1C97;
	Fri, 16 Oct 2026 16:13:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792167226; cv=none; b=rWTvjAJB9LK0wOpkTHuoGmv1rnpwTV1KHsVBzIIhZCt3UyiY3oY49qLglyM1ORChUEC+oFG3GvpHHGrANGyQnNJwIiONSOuIdBrFaW/GP/WwPbd6zrFzEEsnxhGzbE8iMYLL/VQ1qu2Z+OdO9LVARNDYJ/l96Auma2a/1DXcUUY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792167226; c=relaxed/simple;
	bh=4R6jkjmzZjwquaVB/3N2Juaxep7fobE07x3R/ahMz+M=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=SGl8W9IzzLGpUifth/j3ZhnFvPVLwi2CVA7QuSsuTWHezGspX5H1YoVxcFBRpUcHUn23I1Zc7+fncUSlACiVikHk3GQxkostBby3nm1kucTV2zM4zAC2L7X49dnwsCda0rlKeAEPiWwdvbtdI0wKKgMt+XpbeFVkzEaQAomAj7k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cl38E2Ox; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cl38E2Ox"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5F331F000C4;
	Fri, 16 Oct 2026 16:13:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792167224;
	bh=f9mcCYWbQKrxvLP/cZNNAYe8uscc7wYon8t46vjI+38=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=cl38E2OxPeGtrPqQKX48ELPD3XDDInFD4WOkv2HbLLPcGXhUWW4xHzZYCshDboRBg
	 Pe+AIa7aqPLL4ue0OWAa8p/idiyVMRu2LuAZRkFZEZyoerGDE/Ed0lDLKu1q2e52Q7
	 f5Q4TsUg4ciscdH5UlYhWb+pkshrXKDHZn9jmCVy4nVPSd8hzKkyiWImgj4ILKb/nn
	 2ZyZ+E0F10mFI51k6irv+28Wuhr09AkxiGW+EDjz+YKU/ITru7vhQTzyRF8ADTWXYK
	 So8D4rYBi6Lp8V6SU1I9adWEGOPR5JDkPyVX6blwiaeLH88+BlaE53uodEVnozgZk4
	 4VrTQQ1+qucQw==
Message-ID: <sashiko-outbox-174611@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/8] clk: renesas: r8a78000: Add SCMI remapping
 support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Geert Uytterhoeven" <geert+renesas@glider.be>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <c38d744c09dffff550a9b882051c211b572b8daf.1792163045.git.geert+renesas@glider.be>
References: <cover.1792163045.git.geert+renesas@glider.be>
 <c38d744c09dffff550a9b882051c211b572b8daf.1792163045.git.geert+renesas@glider.be>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 16 Oct 2026 16:13:43 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 3 potential issue(=
s) to consider:
- [High] clk: memory leak of struct clk and module refcount on success and =
probe deferral
- [High] clk: renesas: UAF on provider unbind and struct clk memory leak
- [Medium] clk: memory and module refcount leak in fill_clk_map()
--

commit a959fac1d9976d318a861219d6e13c9fef99da15
Author: Geert Uytterhoeven <geert+renesas@glider.be>

clk: renesas: r8a78000: Add SCMI remapping support

This commit extends the Clock Pulse Generator driver for R-Car X5H with SCMI
support. It maps DT clock IDs to abstractions offered by the SCMI firmware,
falling back to fixed-rate clocks if unavailable.

> diff --git a/drivers/clk/renesas/r8a78000-cpg.c b/drivers/clk/renesas/r8a=
78000-cpg.c
> index 5ffd7b89cb48e..758cfe78ae58e 100644
> --- a/drivers/clk/renesas/r8a78000-cpg.c
> +++ b/drivers/clk/renesas/r8a78000-cpg.c
[ ... ]
> @@ -145,7 +184,46 @@ static const struct clk_map *fill_clk_map(struct r8a=
78000_cpg_priv *priv,
>  			break;
> =20
>  		map[i].fw_id =3D map_in[i].fw_id;
> -		map[i].hw =3D fixed_hws[map[i].fw_id];
> +		if (map[i].fw_id >=3D FIXED_CLK_OFFSET) {
> +			enum fixed_clk idx =3D map[i].fw_id - FIXED_CLK_OFFSET;
> +
> +			map[i].hw =3D fixed_hws[idx];
> +			continue;
> +		}
> +
> +		scmi_spec.np =3D scmi_clk_np;
> +		scmi_spec.args_count =3D 1;
> +		scmi_spec.args[0] =3D map[i].fw_id;
> +
> +		clk =3D of_clk_get_from_provider(&scmi_spec);
> +		if (IS_ERR(clk))
> +			return dev_err_cast_probe(dev, clk,
> +				"Failed to get SCMI clock %u\n", map[i].fw_id);
> +
> +		hw =3D __clk_get_hw(clk);

[Severity: High]
Does this code leak the dynamically allocated struct clk and its module
reference?

of_clk_get_from_provider() returns a new struct clk and increments the
provider's module refcount. The clk pointer is discarded after extracting
the raw clk_hw pointer, so it is never passed to clk_put(). This causes a
memory leak of struct clk objects and a module refcount leak for the SCMI
provider.

If a subsequent clock lookup in the loop fails and returns -EPROBE_DEFER,
the function immediately aborts, and the previously allocated clk handles
from earlier loop iterations are not cleaned up.

Additionally, caching the dangling clk_hw pointer in map[i].hw without hold=
ing
a device link or proper reference can lead to a use-after-free. If the SCMI
provider is unbound via sysfs, devres will free the clk_hw structures, but =
the
CPG driver will still hold and use the stale pointers.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/cover.1792163045.gi=
t.geert+renesas@glider.be?part=3D2
