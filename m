Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E54BB2EFDA1
	for <linux-clk@vger.kernel.org>; Thu, 26 Feb 2026 08:33:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772094807; cv=none; b=O8UL1VNQHxeXnj3fSkDxn5pE940JWzQFWPWd8BaRFS2TXtT2vlt4+qatj52ATa/KLaymrhPg8hcNpHTi9wkjHhBkWa9cve80OEYt9PqWJXtw9fYKpNu6fpw+CYNmrFaayHKP6pDyjxAx+Se9O49Mt3qy3yh5/b1UBXDI6Kf0QHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772094807; c=relaxed/simple;
	bh=NCfkh6gdWbJtEMd7KGfrEDdfw5CS+TEnhpp4ob9cNkQ=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=mpFbf7Nw5U+l5zfbnAWOXRIW1WfCdNcuXnI10rgXQD7Zf2vj088O/TnjxqKv8WxtVZcrkqKXDhPsKq12Cfp7qoNKW+FvyUIP8HrgqGpyVlnrIwCuDpp6FA4YzNqJamWaNhvjJizKUOwJr1fzQ1gCTTcoQj6kMKQJ4E/fRw0hYMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vvWo9-0000Cp-SX; Thu, 26 Feb 2026 09:33:17 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vvWo8-002hNN-0j;
	Thu, 26 Feb 2026 09:33:17 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vvWo9-00000000388-299V;
	Thu, 26 Feb 2026 09:33:17 +0100
Message-ID: <094876e8ba8b862998c46923fb633c6bb474d349.camel@pengutronix.de>
Subject: Re: [PATCH] clk: hisilicon: reset: Use kzalloc instead of kmalloc
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Date: Thu, 26 Feb 2026 09:33:17 +0100
In-Reply-To: <20260224021912.54365-1-shawnguo@kernel.org>
References: <20260224021912.54365-1-shawnguo@kernel.org>
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

On Di, 2026-02-24 at 10:19 +0800, Shawn Guo wrote:
> With commit c721f189e89c ("reset: Instantiate reset GPIO controller for
> shared reset-gpios") in place, the call sequence hisi_reset_init() ->
> reset_controller_register() starts failing on Hi3798CV200 Poplar platform=
,
> due to the new check added by the commit above.
>=20
> 	if (rcdev->of_node && rcdev->of_args)
> 		return -EINVAL;
>=20
> The failure is caused by that hisi_reset_init() allocates memory for rcde=
v
> without zeroing it out.  Fix the issue by using kzalloc instead of
> kmalloc for memory allocation.

Fixes: 97b7129cd2af ("reset: hisilicon: change the definition of hisi_reset=
_init")

> Signed-off-by: Shawn Guo <shawnguo@kernel.org>
> ---
>  drivers/clk/hisilicon/reset.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/clk/hisilicon/reset.c b/drivers/clk/hisilicon/reset.=
c
> index 93cee17db8b1..c3b7daac9313 100644
> --- a/drivers/clk/hisilicon/reset.c
> +++ b/drivers/clk/hisilicon/reset.c
> @@ -91,7 +91,7 @@ struct hisi_reset_controller *hisi_reset_init(struct pl=
atform_device *pdev)
>  {
>  	struct hisi_reset_controller *rstc;
> =20
> -	rstc =3D devm_kmalloc(&pdev->dev, sizeof(*rstc), GFP_KERNEL);
> +	rstc =3D devm_kzalloc(&pdev->dev, sizeof(*rstc), GFP_KERNEL);
>  	if (!rstc)
>  		return NULL;
> =20

Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
