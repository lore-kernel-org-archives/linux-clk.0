Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795197520;
	b=WAJlEAN8H+mtMZN1SR9aKz24bEcsw7ul9As0hpDCRea1ovEjcBAEZZQdB4GCBzaADBqi
	 Hb2OBZipTh10skL+fz3yEoRB14HE0x31FCOWeduyHDnm2mR2dfzqeRpThib2bdp6JsN2j
	 qB4n4XHYjyfCWWwidAvckB7gFyT4KDbGFd1BMB29NU5g1XOgPcUbIA7H86t09pklWwmBb
	 RtmneaQOEb33bCEF6HRrZJreYfYohcfeEGwZaeLn3menkZ8smEDAvCLXiGaOMNXNM3wTp
	 lyoG+TZDyzyPntvwOTNDq7iKJDx3QQ7Cf2SR66gwR3uWTdQZhDu0IMWQVvy9YGj+Clg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197520;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=IALgOz8DPztQLfOLhC12cMAp4KPst8GZbAHpo+vCH24=;
	b=A2pHTUV5YBGzd39SRtjOdrR0YxcroW+jnhmcpNPp6LA5w6qiLwhAbXnbHYdiy5NydY/Z
	 TzlkPUq3IofOE9sOyH0XJmIUeDFCcXMmpi1IHQUHQZeQvX6VtorJq1b61kb8ueiln9dhB
	 lYgKPJt3G3quz3YpI3WzjU5rvfIgaGkK3H+2fy/H/WWv/6VSFl2HlfnWHKXf4FU/N028X
	 63LxUGlmzzgo428lW3WY4vVNvkEXOytq6BYqFWHr5+9NBafKEcKuYxaAl18kml+UoghCl
	 4lUnPpegUMYX5eYYnixjQ6khp0aFtwlQxZPSID/FX5HJpu5Jew9yAcqKeVY+uqQnWSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B3kxMamV;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD18B606A33E;
	Fri, 20 Nov 2026 17:58:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=B3kxMamV
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B40B11F000C6;
	Fri, 20 Nov 2026 17:58:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795197520;
	bh=IALgOz8DPztQLfOLhC12cMAp4KPst8GZbAHpo+vCH24=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B3kxMamV3NU2msuT8cSkG7LzoDLgbRigoFHBAa0teMJccXuiAGzuCJZzZXw1pD1pV
	 KX3Y4iM3E3e9l+zjWFRqT4CgcHPnNMwGykfWqJPm+AFMXsBTzJzAS+e1US75QoJBu0
	 Q0EYb5LzCx686YHjJB6YPsMNR8y3iBHRBhxFnanM8/tDO2PXHinWV+PpAw1SO5rMPu
	 QDWbIib1pCmowTFb8NPoz1WBGN2Xzk25IRW5OgCS5SKyKmynSquLQX4mdMCc6mwOIO
	 rm3IzAOUugsJKdxBRJ7vzdLHtqSoz7nWztqsyzTbVsGzBBKSmigk4LOSNg6eXFZ5VT
	 Z1KEWx90fIgbA==
Message-ID: <sashiko-outbox-225762@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 5/6] net: pcs: rzn1-miic: Add resets to rzn1 info
 structure
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kyle Hendry" <khendry@reliablecontrols.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, wsa+renesas@sang-engineering.com
In-Reply-To: <20261119-rzn1-miic-resets-v1-5-feee2bb28bb4@reliablecontrols.com>
References: <20261119-rzn1-miic-resets-v1-0-feee2bb28bb4@reliablecontrols.com>
 <20261119-rzn1-miic-resets-v1-5-feee2bb28bb4@reliablecontrols.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 20 Nov 2026 17:58:39 +0000
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
- [High] net: pcs: rzn1-miic: mandatory resets in
  miic_reset_control_init() fail probe
- [High] net: pcs: rzn1-miic: 1-based reset IDs fail
  miic_reset_control_init() lookup
--

commit cf9182d3fcd65a07b7b29000ceaaa7372b1589dd
Author: Kyle Hendry <khendry@reliablecontrols.com>

net: pcs: rzn1-miic: Add resets to rzn1 info structure

This commit adds the "rst_ts" and "rst_miic" reset names and count to
rzn1_miic_of_data so that the driver requests and deasserts the RZ/N1
MII converter resets.

> diff --git a/drivers/net/pcs/pcs-rzn1-miic.c b/drivers/net/pcs/pcs-rzn1-m=
iic.c
> index f8bafce26bf13..38164502c08cf 100644
> --- a/drivers/net/pcs/pcs-rzn1-miic.c
> +++ b/drivers/net/pcs/pcs-rzn1-miic.c
> @@ -128,6 +128,11 @@ static const char * const index_to_string[] =3D {
>  	"CONV5",
>  };
> =20
> +static const char * const rzn1_reset_ids[] =3D {
> +	"rst_ts",
> +	"rst_miic",
> +};
> +
>  static struct modctrl_match rzt2h_modctrl_match_table[] =3D {
>  	{0x0, {ETHSS_GMAC0_PORT, ETHSS_ETHSW_PORT0, ETHSS_ETHSW_PORT1,
>  	       ETHSS_ETHSW_PORT2, ETHSS_GMAC1_PORT}},

[Severity: High]
Does looking up rzn1_reset_ids[] fail in fwnode_reset_simple_xlate() when
the eth_miic node uses R9A06G032_RST_TS (1) and R9A06G032_RST_MIIC (2)?

include/dt-bindings/clock/r9a06g032-sysctrl.h defines R9A06G032_RST_TS as
1 and R9A06G032_RST_MIIC as 2, while r9a06g032_clocks_probe() registers a
2-entry r9a06g032_resets[] table (indices 0 and 1) with the default
0-based fwnode_reset_simple_xlate().  As a result, "rst_ts" (ID 1) maps
to r9a06g032_resets[1] (the MIIC reset bit instead of the timestamp reset
bit at index 0), and "rst_miic" (ID 2) is rejected with -EINVAL because
2 >=3D rcdev->nr_resets, causing miic_probe() to fail.

> @@ -855,6 +860,8 @@ static struct miic_of_data rzn1_miic_of_data =3D {
>  	.miic_port_start =3D 1,
>  	.miic_port_last =3D 5,
>  	.sw_mode_mask =3D GENMASK(4, 0),
> +	.reset_ids =3D rzn1_reset_ids,
> +	.reset_count =3D ARRAY_SIZE(rzn1_reset_ids),
>  	.init_unlock_lock_regs =3D true,
>  	.miic_write =3D miic_reg_writel_unlocked,
>  	.type =3D MIIC_TYPE_RZN1,

[Severity: High]
Will setting reset_count on rzn1_miic_of_data break probe on existing
RZ/N1 device trees that do not have resets and reset-names properties?

miic_reset_control_init() requests the resets with the non-optional
devm_reset_control_bulk_get_exclusive(), which fails with -ENOENT when
resets are absent from the eth-miic node.  Prior to this series, the
renesas,rzn1-miic binding forbade resets, and in-tree r9a06g032.dtsi only
gains them in a later commit in this series ("ARM: dts: renesas:
r9a06g032: Add resets to mii converter"), so probe fails on older DTBs
and at this commit during bisection unless the resets are requested as
optional.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261119-rzn1-miic-=
resets-v1-0-feee2bb28bb4@reliablecontrols.com?part=3D5
