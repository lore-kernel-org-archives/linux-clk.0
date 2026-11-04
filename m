Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793784350;
	b=3yf+JzPbYCBNwAoOoEZEbv0JdacF0xF+CYJrXhrL694y1UIDAIQBOX6dwAWbHriwC1Yh
	 ghv8fqhHDEF+mQMFEBv7mLn3KefDtr/Vuh8Dkh7HerDGZ3DjpW/JhjcLCT1ouWe5dtBZP
	 q/Ug9eks19sKHmt4w8zx1QZVHEwQ4RLqEhrCEaWaXBYi1N5XMw3bYzyr6wOSV2ZPU/W0g
	 jLqM/Q3S4t6X1D90s3JNZ/yRRzmkgdkKjh2ScSLBKJ8EhS304/D9k3kAgHTKScNgYrH82
	 IVvM1RI0FYGvtLkcdvMaV3NP5u5N0AOJdDVQRRWCj6Z5gkenZsZNSUwmQuCWO+xSPOA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793784350;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=w8U74U1rPUCbHA+Z6GbARhQhlRN5MR1VyTlNpkgM6Xw=;
	b=HS3IFy9MNd23JYu8NEbmGtuvmXU50L5Xw4QpZ6Hc31LHa2Lk/3J5gq+O7GeX7SxizjAJ
	 18cfIi0mXLFoW7aprnkdgiEDVKdpBWGWHG1VSWIZTaoid1LQAWZmvYKBxLpC/CRTYvlww
	 shqHt+uHXbCmgjLNm7I1VN1Wpw6GiBrMmfWzEg8f+cMXixFcnUWBrHJzChANl+SI/RSyH
	 zMzgKCh3kz12laV6ND18kNRWT9zUrC4RsQWIpjZgA2RZ2Lruo6OGyn/fV5TSj5lMFW7CE
	 CEwZBQfcPXjpCm3mszeHnHa9FsbfM2NaRnkGA3KC+G7UVWOKGXTYMaxJ/ZjfVB5r+rA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=GmL0hlzE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 743A5606A328;
	Wed,  4 Nov 2026 09:25:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 743A5606A328
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=GmL0hlzE
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 50C2220109D;
	Wed, 04 Nov 2026 10:25:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793784346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w8U74U1rPUCbHA+Z6GbARhQhlRN5MR1VyTlNpkgM6Xw=;
	b=GmL0hlzEh6/zMrc7BWma8zSUIPrk78do1Ht+dBk2BZLwTFQe23LYDRufaZSjLoY79hb2IO
	LpU0biM+xAlBhxQMKJUuoERzewEtXeVY6j2u0owQQqeKtOv2TsjZtP/LF8v4zJdBFDl+B2
	Hh3Agkd1uZXotZjFSzzotEmEQusFhYmjYOS85E+8U/vmlkHfRXCHIrHeYRWQY4HIknNhMI
	AlS0YUWqrCW9T3ZA/dd7ihmLM735iLBcJz6SjQUU4pKojZVnS2US0Io4ka0+R0Y87ea+uz
	SAfutint65rU0Yh87s0Zp8+rDeA9jjHcYdB01Wmhfjx8Wz76x4q9qO4cwRbbVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1793784346;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=w8U74U1rPUCbHA+Z6GbARhQhlRN5MR1VyTlNpkgM6Xw=;
	b=VSAc9Qd159bqut/xNHfr8zIOeQUfzaz/wFf4SzWXaDxqEB6zoJ/1msq8lqNNfDEeSnLTDq
	vvvweIeiKL+2e8BAx2P/PUZSDjIpFDKrUiA2ROhuqE19zeCrLn12CSEUNGVJdlblsdbFqR
	tass/S2FKmyOUcfDNkYplqRtj30IywEVMGBTsBl1e5t8N5qdWDsr1/F9izmz4k1rOfcgSB
	0BKw3eAJCwK0v6FS3BpdOWjbMRFpNvjKRAQgK1ekO0uQitaeDRJHdIyqLqwF8WBUXkZKBi
	9lQOD5GJP4GVBnUnVuBid8MOLz3y8qtXQzmA7yFaxHOV5WJu1SMGki6QGRu4uw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1793784346; a=rsa-sha256;
	cv=none;
	b=Cv7w//ohSIyW8cU/T0syoSW9QWkXrIxqlV0JKIwB9XO58jYOUtbKX0kbEG3dC+ug0iKw4z
	DdM+c8lsqymz8uA5welyI9jAapN7RLNLvEybCQqPlP0FKuJoq1vJf7mqAh0m2A5jDHNbx6
	AgHawSinYPc+icgh6EXbv6AfazHLu4cMiydEp6BIl5zSSeHq0VeDYAmH3ZX5YukBa+jAGh
	m1LtZcnmEbb+NBxjp0trCxfahGdNwsCvXTc6jPGKfZ/BbDyMKRo33MVDpcS4XebKLO8+3D
	aEMGh8DNMlmL39at/qEcRu9QjKAxLSttGgdhAZ7i2F8GbnDS7FJPTedpDkR61A==
Message-ID: <e4474a7501c9e2a355dcc80d632bcfa10e1959e8.camel@pengutronix.de>
Subject: Re: [PATCH 4/4] clk: siflower: Add SF19A2890 peripheral clock and
 reset manager driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: joseph@telaak.dev, Stephen Boyd <sboyd@kernel.org>, Brian Masney	
 <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, Rob
 Herring	 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>
Cc: Chuanhong Guo <gch981213@gmail.com>, Yao Zi <me@ziyao.cc>, 
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Wed, 04 Nov 2026 10:25:46 +0100
In-Reply-To: <20261104-sf19a2890-sysm-v1-4-a4fac07df823@telaak.dev>
References: <20261104-sf19a2890-sysm-v1-0-a4fac07df823@telaak.dev>
	 <20261104-sf19a2890-sysm-v1-4-a4fac07df823@telaak.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Mi, 2026-11-04 at 02:21 -0500, Joseph Telaak via B4 Relay wrote:
> From: Chuanhong Guo <gch981213@gmail.com>
>=20
> Add a platform driver for the peripheral clock and reset manager (CRM)
> block found on Siflower SF19A2890 and compatible SoCs.
>=20
> Each CRM block manages a group of APB peripherals through three registers=
:
> a reset register, a clock gate register, and a shared Bus Output Enable
> (BOE) register that must be asserted for any peripheral in the block to
> respond to bus transactions.
>=20
> The driver registers a clock gate controller and a reset controller from
> a single DT node. A shared spinlock protects all read-modify-write
> accesses across both. BOE is managed automatically: asserted when the
> first clock gate is enabled and deasserted when the last one is disabled.
>=20
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>
> [jt: from Chuanhong's siflower-7.1 branch; one compatible per block with
>  its gate bits, critical gates and reset masks in tables here instead of
>  the siflower,valid-gates, siflower,critical-gates, siflower,reset-masks
>  and siflower,num-resets properties, gate N parented to input clock N by
>  index instead of by global name, the gate updates under the spinlock too=
,
>  no separator comments, Kconfig dependencies and help, subject]
> Signed-off-by: Joseph Telaak <joseph@telaak.dev>
> ---
>  drivers/clk/siflower/Kconfig                   |  11 +
>  drivers/clk/siflower/Makefile                  |   1 +
>  drivers/clk/siflower/clk-sf19a2890-periphcrm.c | 360 +++++++++++++++++++=
++++++
>  3 files changed, 372 insertions(+)
>=20
[...]
> diff --git a/drivers/clk/siflower/clk-sf19a2890-periphcrm.c b/drivers/clk=
/siflower/clk-sf19a2890-periphcrm.c
> new file mode 100644
> index 000000000..95d4dd449
> --- /dev/null
> +++ b/drivers/clk/siflower/clk-sf19a2890-periphcrm.c
> @@ -0,0 +1,360 @@
[...]
> +#define CRM_DATA(_g, _r)						\
> +	{								\
> +		.gates =3D sf19a2890_##_g##_gates,			\
> +		.num_gates =3D ARRAY_SIZE(sf19a2890_##_g##_gates),	\
> +		.reset_masks =3D sf19a2890_##_r##_resets,			\
> +		.num_resets =3D ARRAY_SIZE(sf19a2890_##_r##_resets),	\
> +	}
> +
> +static const u32 sf19a2890_single_resets[] =3D { BIT(0) };
> +
[...]
> +
> +static const u32 sf19a2890_gmac_resets[] =3D { GENMASK(1, 0) };

Are these two bits separate resets? Are they individually controllable?
Why are they bundled into a single reset_control like this? The commit
message doesn't explain.

[...]
> +static const u32 sf19a2890_wlan_resets[] =3D { GENMASK(2, 0) };
[...]
> +static const u32 sf19a2890_usb_resets[] =3D { GENMASK(2, 0), BIT(3), BIT=
(4) };
[...]
> +static const u32 sf19a2890_spi_resets[] =3D { GENMASK(5, 4) };
[...]
> +static const u32 sf19a2890_uart_resets[] =3D {
> +	BIT(0) | BIT(4), BIT(1) | BIT(5), BIT(2) | BIT(6),
> +};

Same question for the other multi-bit masks.


regards
Philipp
