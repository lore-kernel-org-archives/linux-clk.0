Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B013C39479F;
	Thu, 15 Oct 2026 16:16:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792080977; cv=none; b=bXGSFezthMvqrjIuWADHredAyI9+5YJLZDUY2IVeGhHyckhevO7U3ZgvQ3cYqU0kUBNQi91/1jk/vtujM6FHiwPXSFZn/+jtEwSvyOEzt9ppUic3824IdiXiqpnMHCnMcC8JYEjcsNe3Gaq/1PRXdtKqwdfNo+9EfbqdQJkw6ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792080977; c=relaxed/simple;
	bh=pV6Xn7MVqlRKP7Lc05vcFUNKU2U+QNevFDpepLb/C6A=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=LY+hEiEdsK0jiE69gp5zbkVAilrt5CwQXiUIU+BvMhZehN3sdZSrNSNCNB6nMQRz7fS/VomKEXux/wLeIW47qRispw7ER+kN4gDNNs1b5UBrlfY9JPd9XnKQHG5WPcnLQZYcylRDJBlFRS5XobwS35bSO6fkQEH2eGjlKGAjE4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KO/vVbP4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KO/vVbP4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AAA31F000C4;
	Thu, 15 Oct 2026 16:16:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792080966;
	bh=psWLH+JhfLT73MQq5QUq3jITkhYrKx4ZQAFg11ZHijQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KO/vVbP4fKN5ljLt5JHQX0B41tvRN74bfDPyeFXO1ElYlytX6zifa/DrtvEPQr5SW
	 BDHVCQh+U0QGQckZofuKFvYuzQFOGiZmKspsRbamFYUtOHMxlW5zoOb0UH9tpWS6HL
	 dYr3FkOSNiEWNydGYBS6cfcBO3OWZdu/0PVgdZp/+iZg1Li5NcHLDQKdA5qHKN1z53
	 n2BMa2ENy30nRVyENqhxM+6WG8Sa4GWtugx6Cf+yVNIC2C2QhMiuQDetdfS/mVd89j
	 Ggv+1i0F+ESo0yInlunNQ7m0y5DTYgivpuYNNaVagAPB+3ABN/EH0YguGUt4zRMycQ
	 m1woSFRheu5zw==
Message-ID: <sashiko-outbox-173157@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v10 04/10] clk: nuvoton: ma35d1: Reparent the gates
 correctly
Reply-To: sashiko-reviews@lists.linux.dev
To: "Miquel Raynal" <miquel.raynal@bootlin.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261015-perso-ma35d1-upstream-clk-v10-4-47c97b54a809@bootlin.com>
References: <20261015-perso-ma35d1-upstream-clk-v10-0-47c97b54a809@bootlin.com>
 <20261015-perso-ma35d1-upstream-clk-v10-4-47c97b54a809@bootlin.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 15 Oct 2026 16:16:05 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] clk: nuvoton: CCAP muxes registered with 1-bit width but 4 paren=
ts
--

commit eafc7cdaf7d2454016081e967de0730635be9342
Author: Miquel Raynal <miquel.raynal@bootlin.com>

clk: nuvoton: ma35d1: Reparent the gates correctly

The clock tree is still incorrect. There are four main clocks in this
system: HXT, LXT, HIRC, LIRC. Each clock has a gate control to disable
it, and in the CCF topology, the gates should be below the clocks so
children stop ticking when gated. This commit reparents the gates under
their respective sources and all children under the gates.

> diff --git a/drivers/clk/nuvoton/clk-ma35d1.c b/drivers/clk/nuvoton/clk-m=
a35d1.c
> index 33b397d7b7c52..65a2691002a73 100644
> --- a/drivers/clk/nuvoton/clk-ma35d1.c
> +++ b/drivers/clk/nuvoton/clk-ma35d1.c
> @@ -74,34 +74,46 @@ static const struct clk_parent_data lxtg_parent_data[=
] =3D {
[ ... ]
>  static const int axiclk_parent_idx[] =3D { AXICLK_DIV2, AXICLK_DIV4 };
> -static const int ccap_parent_idx[] =3D { HXT, VPLL, APLL, SYSPLL };
> +static const int ccap_parent_idx[] =3D { HXT_GATE, VPLL, APLL, SYSPLL };

[Severity: Medium]
The ccap_parent_idx array defines 4 parent clocks (HXT_GATE, VPLL, APLL, SY=
SPLL).
However, CCAP0_MUX and CCAP1_MUX are registered with ma35d1_clk_mux()
using a 1-bit width:

drivers/clk/nuvoton/clk-ma35d1.c:ma35d1_clocks_probe() {
    ...
    hws[CCAP0_MUX] =3D ma35d1_clk_mux(dev, "ccap0_mux", clk_base + REG_CLK_=
CLKSEL0, 12, 1, hws,
                                    ccap_parent_idx, ARRAY_SIZE(ccap_parent=
_idx));
    ...
}

Since a 1-bit hardware mux field can only address 2 parents (indices 0 and =
1),
will attempting to select APLL or SYSPLL result in truncation of the parent
index or a framework error, rendering those parents unusable?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261015-perso-ma35=
d1-upstream-clk-v10-0-47c97b54a809@bootlin.com?part=3D4
