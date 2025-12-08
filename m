Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD6E820297E
	for <linux-clk@vger.kernel.org>; Mon,  8 Dec 2025 11:21:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765192909; cv=none; b=rCB1u/9hCuWNgIKOF7OhgoKnu4a8Pl/7SKYPhNq+SopDknBIPmlI8rwB5tUvBQRm9Ofsl76KHLDp13YOTPRo5H1m2CVIqTrcGcs7+eeeEDAifgI29uTQdVILrn0F1kCYP36FzNds4xQqmpyGrj3TxFvrqW+DMQ8AlxS6z50baTQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765192909; c=relaxed/simple;
	bh=y32lGc4teLRiGDVcMptPgTno8yby5+07IUD46OtNLA8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=SJUVjAI6CKiybfcbt4IM71FNlJS4EBX45G1Mh4lKxviGfgtD0fdowKx89dZO5njWkOPYvyVKYmJwqTTItMPIGDn+UvpR0HIF5TrH6jLSiBvARp4Nop5jPfJQx4WxftpfVzaDEYVNOot8OUKK2n5IIYaM7QZqsnAOv9Y+/LbmpuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vSZJE-0007mX-4t; Mon, 08 Dec 2025 12:21:40 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vSZJD-004bWh-1C;
	Mon, 08 Dec 2025 12:21:39 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vSZJD-000000006lA-1FY2;
	Mon, 08 Dec 2025 12:21:39 +0100
Message-ID: <88cdf9195a8bf397ff631d316d9f6560f2cbab5c.camel@pengutronix.de>
Subject: Re: [PATCH 2/2] clk: renesas: rzv2h: Deassert reset on assert
 timeout
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Biju <biju.das.au@gmail.com>, Geert Uytterhoeven
 <geert+renesas@glider.be>,  Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>,
 linux-renesas-soc@vger.kernel.org, 	linux-clk@vger.kernel.org,
 linux-kernel@vger.kernel.org, Prabhakar Mahadev Lad	
 <prabhakar.mahadev-lad.rj@bp.renesas.com>
Date: Mon, 08 Dec 2025 12:21:39 +0100
In-Reply-To: <20251208101356.101379-3-biju.das.jz@bp.renesas.com>
References: <20251208101356.101379-1-biju.das.jz@bp.renesas.com>
	 <20251208101356.101379-3-biju.das.jz@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

On Mo, 2025-12-08 at 10:13 +0000, Biju wrote:
> From: Biju Das <biju.das.jz@bp.renesas.com>
>=20
> If the assert() fails due to timeout error, set the reset register bit
> back to deasserted state. This change is needed especially for handling
> assert error in suspend() callback that expect the device to be in
> operational state in case of failure.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
>  drivers/clk/renesas/rzv2h-cpg.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/renesas/rzv2h-cpg.c b/drivers/clk/renesas/rzv2h-=
cpg.c
> index 3f6299b9fec0..c0ee2dcc858c 100644
> --- a/drivers/clk/renesas/rzv2h-cpg.c
> +++ b/drivers/clk/renesas/rzv2h-cpg.c
> @@ -1366,8 +1366,11 @@ static int __rzv2h_cpg_assert(struct reset_control=
ler_dev *rcdev,
> =20
>  	ret =3D readl_poll_timeout_atomic(priv->base + reg, value,
>  					assert =3D=3D !!(value & mask), 10, 200);
> -	if (ret && !assert) {
> +	if (ret) {
>  		value =3D mask << 16;
> +		if (assert)
> +			value |=3D mask;
> +
>  		writel(value, priv->base + GET_RST_OFFSET(priv->resets[id].reset_index=
));

This writel() could reuse

	unsigned int reg =3D GET_RST_OFFSET(priv->resets[id].reset_index);

>  	}

How does the hardware behave when __rzv2h_cpg_assert() is called on an
already asserted reset? Is it possible for the
readl_poll_timeout_atomic() timeout to trigger, or can this only ever
happen for asserted <-> deasserted transitions? Having a failed
reset_control_assert() deassert the reset if it was previously asserted
would be surprising.

regards
Philipp
