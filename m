Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795210361;
	b=3lGiY662BAmCLzf8yNSdCUCeDeUv7hkQJwe02WOBh3j1HgHs6fDfB0efNCJ0xxIQiDsg
	 wuCX7U4fpOnjjwPpBUkVMgsPwHhcq6Sj8cc5KRJCf/LTj0fiYMYLHCiA8oIK3tlJZl+5r
	 iazbQaZQ4PgF+lkNHbueInuvvjDXjmS4p1mdGw7k7yeAYHLBNv7Uv2SCrwRL48ezK8H/a
	 FjdpUDSkFLl8tGN2MvKDjiyvqjRNmX1FQgcZJjwjVYqLumPn2u7mG2Iubc0YFIMKm+8Vh
	 KX8lm9lhL7OMNE+i0yGrSmkaAuyO05uOhB03cb+vtOJK4Sy2MCqna2gY76QjqHPqnrg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795210361;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=PuN/Gt/AJpK4AGD6j4+DL6HE9Ks6ewehwc2m7UHbDHE=;
	b=MGC07amCN16B0+bOxWFh4Z6h9LT3iSRpdoFNxyfhiQvi+480qvWtqGFmadCc6ntkyxYc
	 vAaoujFPy78GPUdeo8Z6hKn7d9Os7lnrDuRqZoH4ZNlMKOJDfthwkmn+t67mpVCyECEtk
	 UvOAggP1LQSeNswCxfl2JAxtBf66M+SxafqBzPUiQIsJzOlBRHP445RdQcmWwnJmIXv2u
	 xqTjU96dT1H7WvfFaRrtrkqUxAbajwBVZHelVLzUEBkvcPthzobXmpn+pI3ekznbJBnTX
	 qO/622kqMurfnw18wTMnp2P/L57+TV+/+Q9bg5mq7dMqbPKTqQOjCd3V7x/jg/Lnx+g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RcGku4mH;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC51606A697;
	Fri, 20 Nov 2026 21:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=RcGku4mH
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05EB21F000C0;
	Fri, 20 Nov 2026 21:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795210361;
	bh=PuN/Gt/AJpK4AGD6j4+DL6HE9Ks6ewehwc2m7UHbDHE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RcGku4mHeWg0IbsA/oKgVOLfsjl7tF6eKapsumairE2afRgMAHQw/GassTrpf291D
	 HxE+E6tfdJPy7t1b8Le/HNpDXYAT2rXkCEb8Nofd7jsQ1B3yQprqEr7QBw1S7TpnVt
	 /b9KzI1vMdVxlSKHSmIZDIPTrpsnZOc5KExSio5Y4ahKPv4ftVSOSTZKLFVe6tarrW
	 V0AP8/XsLQeFwn4H4IfZyBE/nTRw55Fr2yyGVZq6akniJCKErrfypoz9P94QXl6ULY
	 Sh7G59m/1f1ZLAXzpghFrZK3l6wCdVnW9gHvbMuKEedml6K1x9qHmV47EzItBRsw5p
	 W4aiHEZqHUk0w==
Message-ID: <sashiko-outbox-226194@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/3] clk: renesas: r9a06g032: Add reset controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyle Hendry" <khendry@reliablecontrols.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261120-rzn1-miic-resets-v2-2-f1cfa678615b@reliablecontrols.com>
References: <20261120-rzn1-miic-resets-v2-0-f1cfa678615b@reliablecontrols.com>
 <20261120-rzn1-miic-resets-v2-2-f1cfa678615b@reliablecontrols.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 21:32:40 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 2 potential
issues to consider:
- [Medium] clk: renesas: r9a06g032: unpopulated index 0 in
  r9a06g032_resets
- [Medium] clk: renesas: r9a06g032: missing RESET_CONTROLLER Kconfig
  selection
--

commit 2cc290ce9843c419fbe880756a7ccf01089df58d
Author: Kyle Hendry <khendry@reliablecontrols.com>

clk: renesas: r9a06g032: Add reset controller

This commit registers a reset controller in the R9A06G032 clock driver to
expose the timestamp and RGMII/RMII converter reset bits in the
PWRCTRL_SWITCHCTRL register.

> diff --git a/drivers/clk/renesas/r9a06g032-clocks.c b/drivers/clk/renesas=
/r9a06g032-clocks.c
> index 3df3f2b2c6de7..a474302987aa6 100644
> --- a/drivers/clk/renesas/r9a06g032-clocks.c
> +++ b/drivers/clk/renesas/r9a06g032-clocks.c
[ ... ]
> @@ -675,7 +676,13 @@ static const struct r9a06g032_clkdesc r9a06g032_cloc=
ks[] =3D {
>  		RB(0xec, 16), RB(0xec, 17), RB(0xec, 18), RB(0xec, 19)),
>  };
> =20
> +static const struct regbit r9a06g032_resets[] =3D {
> +	[R9A06G032_RST_TS]	=3D RB(0x188, 3),
> +	[R9A06G032_RST_MIIC]	=3D RB(0x188, 4),
> +};

[Severity: Medium]
Since R9A06G032_RST_TS is 1 and R9A06G032_RST_MIIC is 2, can reset ID 0 be
requested and accepted even though r9a06g032_resets[0] is unpopulated?

ARRAY_SIZE(r9a06g032_resets) is 3, and without a custom xlate callback,
fwnode_reset_simple_xlate() allows index 0.  If a consumer requests reset
0, assert and deassert silently become no-ops in clk_rdesc_set(), while
r9a06g032_reset_status() calls clk_rdesc_get() with { .bit =3D 0, .reg =3D =
0 }
and reads bit 0 of offset 0x00 (R9A06G032_SYSCTRL_USB).

Either the reset IDs should be 0-based, or the driver should provide an
xlate callback that rejects unpopulated entries where !reg && !bit.

[ ... ]

> @@ -1394,6 +1446,13 @@ static int __init r9a06g032_clocks_probe(struct pl=
atform_device *pdev)
>  	if (error)
>  		return error;
> =20
> +	clocks->rcdev.ops =3D &r9a06g032_reset_ops;
> +	clocks->rcdev.of_node =3D np;
> +	clocks->rcdev.nr_resets =3D ARRAY_SIZE(r9a06g032_resets);
> +	error =3D  devm_reset_controller_register(dev, &clocks->rcdev);
> +	if (error)
> +		return error;

[Severity: Medium]
Should CLK_R9A06G032 select RESET_CONTROLLER in
drivers/clk/renesas/Kconfig?

When CONFIG_RESET_CONTROLLER is disabled, devm_reset_controller_register()
compiles to a no-op stub returning 0, so the reset controller is never
registered and consumers such as pcs-rzn1-miic fail probe with
-EOPNOTSUPP.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261120-rzn1-miic-=
resets-v2-0-f1cfa678615b@reliablecontrols.com?part=3D2
