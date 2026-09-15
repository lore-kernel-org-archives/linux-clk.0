Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 676CF3D6463
	for <linux-clk@vger.kernel.org>; Tue, 15 Sep 2026 02:36:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789439782; cv=none; b=tmt93q2JJhR1heAA74zDX6hsFj0/BADaOwanK7AySMssoO7wffR3ufWRav0W9KXVnP+XPi8vL2nlYcWCnT4e+heqhICAKhIbcoHqcs9O/1RELO9r/SayKFU4QZCLfNgxxXIk00JMEwCpMVZcoV/6yHLk/bbNnMDcfzJi3RzVe8k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789439782; c=relaxed/simple;
	bh=45WQyT7nFmOhrPrcnn/GkQ8ypXxizFVNBdy5vTBs/HY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CDG0jSVBha8j5lBMQzly4xSuR1zhgN+xbMYzx77CYXNQdXiSfRA4+WweerazTO9wBL7IQTLpB17D7r/+aTzPxeMzvhk5+mAGwp3dJkNX/AlZIqWh5a12DkytuGsaMsAb73dj1dDQevlldfbnG/MBrL6RyKGWpSnBY/o/R3ceA4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=T5Ps2zVB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="T5Ps2zVB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D2421F000FF;
	Tue, 15 Sep 2026 02:36:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789439777;
	bh=JDZQz3hJpzbj51DuK4puPpOAR5fBJ/Dx6cm7wzJsJt8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=T5Ps2zVBexb0nj+4TXStGQYJQ/fc3IJtQtoJa6y8UUjn3reR2zA6mmlKbSjOQ9N4k
	 cSl6JuGOsQr0Bg/Dcyu3aLPl82ePBzod7WlapCyemOhIMOpIsV1PxeWijiIhXnSAJZ
	 eaDsrBsEExTZO0+cwQ+7skW8J/PGN3EZMCi/T4UglZ/vWQBq0vtXiE8A59uSICYqAb
	 vSOz7Tk3MUz6no5GfmhDOoO0pqS+Rnflzyx0FJcJv/EPkqQQNPyVFAcVit1EqAaZ6i
	 58malWxVpRm9x5IGSvht77Ijy4pXTvR+BJFR0CtozkuSTplx+dsY+ZQ9vHN+fcijcv
	 3DEunp0lNYJ/A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] clk: renesas: tidyup DEF_GEN4_Z()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kuninori Morimoto" <kuninori.morimoto.gx@renesas.com>
Cc: linux-clk@vger.kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <87bj9zs0xp.wl-kuninori.morimoto.gx@renesas.com>
References: <87cxufs0yi.wl-kuninori.morimoto.gx@renesas.com>
 <87bj9zs0xp.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 02:36:17 +0000
Message-Id: <20260915023617.7D2421F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] clk: renesas: DEF_GEN4_Z macro arguments lack parentheses
--

commit ad51061672812b3bccf2c0614e480e134d8fc4e5
Author: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>

clk: renesas: tidyup DEF_GEN4_Z()

This commit updates the DEF_GEN4_Z macro to take the register offset
and bit position explicitly rather than deriving them from a single
flat offset. It simplifies the offset calculation logic inside
cpg_z_clk_register().

> diff --git a/drivers/clk/renesas/rcar-gen4-cpg.h b/drivers/clk/renesas/rc=
ar-gen4-cpg.h
> index 6c8280b37c37b..cfc150750dc4d 100644
> --- a/drivers/clk/renesas/rcar-gen4-cpg.h
> +++ b/drivers/clk/renesas/rcar-gen4-cpg.h
> @@ -58,8 +58,14 @@ enum rcar_gen4_clk_types {
>  #define DEF_GEN4_PLL_V9_24(_name, _idx, _id, _parent)	\
>  	DEF_BASE(_name, _id, CLK_TYPE_GEN4_PLL_V9_24, _parent, .offset =3D _idx)
> =20
> -#define DEF_GEN4_Z(_name, _id, _type, _parent, _div, _offset)	\
> -	DEF_BASE(_name, _id, _type, _parent, .div =3D _div, .offset =3D _offset)
> +/*
> + * offset 0xAAABB
> + * AAA : reg
> + * BB  : pos
> + */
> +#define FRQCR_offset	8
> +#define DEF_GEN4_Z(_name, _id, _type, _parent, _div, reg, pos)	\
> +	DEF_BASE(_name, _id, _type, _parent, .div =3D _div, .offset =3D (reg <<=
 FRQCR_offset) + pos)

[Severity: Low]
This isn't a bug introduced by this patch since current callers pass simple
constants, but could the lack of parentheses around the reg and pos argumen=
ts
cause issues in the future?

If an expression is ever passed for these arguments, operator precedence
rules might cause the offset to be miscalculated (e.g., if reg is passed
as BASE + 4, it would expand to BASE + 4 << 8 + pos). Could parentheses
be added around (reg) and (pos) to prevent this?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/87cxufs0yi.wl-kunin=
ori.morimoto.gx@renesas.com?part=3D1
