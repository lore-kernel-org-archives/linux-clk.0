Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBB7642EEDE
	for <linux-clk@vger.kernel.org>; Fri, 15 May 2026 09:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778837082; cv=none; b=lf8tmRUlJwUafWW3qPFW7vA7iRiC8ipj1EdmlrQtsfxXhm5g8KakT+gA2eaX4tNHw29XMCaE/lt3SgU/0zpON3fbHQD9CWHjkNRowk0j8D+mGvTDrTwdyLH9rabCCZvmeq0YWRF8YktmgLo4ZXSsXfdzggUOQrnZjgCsB+F2hso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778837082; c=relaxed/simple;
	bh=VV/r0giKjRMxi+g1rXf6AuzicwYBA8TBo1gJ92BM2cU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=RAIOzI88bHwujmOzfo1EBpL5HkJEEWrr0pW8ziOBdbcN8M5bzIhQZ+yWQnpB2ZRVCqzDbZPw94nuS4LAV0PFxX2yYEUDeVv+nnPIiraTnJEcwuFtOIhXC9wRB+GrSzDsuzVu3i5tLJ+GtfwPlfyJ3WGnQhklTN9PEk6pq964/aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wNomG-00020n-GL; Fri, 15 May 2026 11:24:16 +0200
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wNomC-000u10-1s;
	Fri, 15 May 2026 11:24:12 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1wNomC-000000007wg-1zKf;
	Fri, 15 May 2026 11:24:12 +0200
Message-ID: <2fdfe98c2b99f3cb6b1e0af0f1db3df32d21288a.camel@pengutronix.de>
Subject: Re: [PATCH v2 09/12] reset: starfive: Introduce assert_polarity
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Changhuang Liang <changhuang.liang@starfivetech.com>, Michael Turquette	
 <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Stephen Boyd	 <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Paul
 Walmsley	 <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou	
 <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, Emil Renner
 Berthing	 <kernel@esmil.dk>
Cc: Chen Wang <unicorn_wang@outlook.com>, Inochi Amaoto
 <inochiama@gmail.com>,  Alexey Charkov <alchark@gmail.com>, Thomas
 Bogendoerfer <tsbogend@alpha.franken.de>, Keguang Zhang	
 <keguang.zhang@gmail.com>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org
Date: Fri, 15 May 2026 11:24:12 +0200
In-Reply-To: <20260512083521.3448-10-changhuang.liang@starfivetech.com>
References: <20260512083521.3448-1-changhuang.liang@starfivetech.com>
	 <20260512083521.3448-10-changhuang.liang@starfivetech.com>
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

On Di, 2026-05-12 at 01:35 -0700, Changhuang Liang wrote:
> The JHB100 SoC supports inverted operations for reset
> assertion/deassertion, introducing the an assert_polarity field to
> distinguish between different operation logics.
>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---
>  drivers/reset/starfive/reset-starfive-common.c | 18 +++++++++++++++---
>  drivers/reset/starfive/reset-starfive-common.h |  6 ++++++
>  2 files changed, 21 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/reset/starfive/reset-starfive-common.c b/drivers/res=
et/starfive/reset-starfive-common.c
> index 8ea142ecbd15..c7289c2b2a28 100644
> --- a/drivers/reset/starfive/reset-starfive-common.c
> +++ b/drivers/reset/starfive/reset-starfive-common.c
> @@ -68,7 +68,7 @@ static int starfive_reset_update(struct reset_controlle=
r_dev *rcdev,
>  	reg_status =3D data->status + offset * sizeof(u32);
>  	done =3D data->asserted ? data->asserted[offset] & mask : 0;
> =20
> -	if (!assert)
> +	if (data->info && data->info->assert_polarity =3D=3D assert)
>  		done ^=3D mask;
> =20
>  	spin_lock_irqsave(&data->lock, flags);
> @@ -90,13 +90,25 @@ static int starfive_reset_update(struct reset_control=
ler_dev *rcdev,
>  static int starfive_reset_assert(struct reset_controller_dev *rcdev,
>  				 unsigned long id)
>  {
> -	return starfive_reset_update(rcdev, id, true);

Please keep this.

> +	struct starfive_reset *data =3D starfive_reset_from(rcdev);
> +	bool assert =3D true;
> +
> +	if (data->info && data->info->assert_polarity)
> +		assert =3D false;

And move this into starfive_reset_update().

Consider renaming assert_polarity to active_low or similar, to align
nomenclature with other drivers.

> +
> +	return starfive_reset_update(rcdev, id, assert);
>  }
> =20
>  static int starfive_reset_deassert(struct reset_controller_dev *rcdev,
>  				   unsigned long id)
>  {
> -	return starfive_reset_update(rcdev, id, false);
> +	struct starfive_reset *data =3D starfive_reset_from(rcdev);
> +	bool deassert =3D false;
> +
> +	if (data->info && data->info->assert_polarity)
> +		deassert =3D true;

Same as for starfive_reset_assert().

regards
Philipp
