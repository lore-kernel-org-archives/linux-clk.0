Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5AB4B8DCF
	for <linux-clk@vger.kernel.org>; Thu,  8 Jan 2026 11:07:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767870461; cv=none; b=V1zHMmJmW30sl1Sbn75x10Sk8LNCOZjnITGQGGKTi70Nw8CBYBBAq3XKRaFk7Kvrh67ckn9YPncr5D4H7EMzOtk4jyltn0CNbx9NUGAk8ZU+bgp/n+wJ/k03Bx3wVB9klggnsDV3rXX4LDCpNRDyPk5+ouedVO24HG0phsQQbrE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767870461; c=relaxed/simple;
	bh=4ARUFy/0mqoSVLaK6Rqs10QOx8KtOwrI/t5eQyddFCw=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=HMRq1Z3+fNhrGUECkt/QW64d9minIT3DWqO09YU1ZGsV++sLbcLJ4u9S33uQd7K8IPMdd9v6R4VGcIDpyRlon+uVuGUGYW7XGtGbDtAWoat5VwsqC+CfRr917wENrbVYJKjgaNwHVaI+IQdgITiWvwfeSfLCSnZrXdjKbzXVAKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vdnrR-0006Ib-0m; Thu, 08 Jan 2026 12:07:25 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vdnrQ-009fT1-25;
	Thu, 08 Jan 2026 12:07:24 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vdnrQ-000000005Vi-2KUV;
	Thu, 08 Jan 2026 12:07:24 +0100
Message-ID: <e7fa69f1febc37062a59f566be97537a3a1e6ee0.camel@pengutronix.de>
Subject: Re: [PATCH v3 4/4] reset: spacemit: fix auxiliary device id
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Alex Elder <elder@riscstar.com>, Yixun Lan <dlan@gentoo.org>, Stephen
 Boyd	 <sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>
Cc: Guodong Xu <guodong@riscstar.com>, Inochi Amaoto <inochiama@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev
Date: Thu, 08 Jan 2026 12:07:24 +0100
In-Reply-To: <058d3911-ff2d-4151-b585-5bcb8810bedf@riscstar.com>
References: <20260103-06-k1-clk-common-v3-0-6061d9f69eef@gentoo.org>
	 <20260103-06-k1-clk-common-v3-4-6061d9f69eef@gentoo.org>
	 <058d3911-ff2d-4151-b585-5bcb8810bedf@riscstar.com>
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

On Di, 2026-01-06 at 08:43 -0600, Alex Elder wrote:
> On 1/3/26 1:26 AM, Yixun Lan wrote:
> > Due to the auxiliary register procedure moved to ccu common module wher=
e
> > the module name changed to spacemit_ccu, then the reset auxiliary devic=
e
> > register id also need to be adjusted in order to prepare for adding new
> > K3 reset driver, otherwise two reset drivers will claim to support same
> > "compatible" auxiliary device.
> >=20
> > Signed-off-by: Yixun Lan <dlan@gentoo.org>
>=20
> This would ideally be merged with the previous patch.  Maybe
> Philipp can negotiate with Stephen to have that happen.
>=20
> Reviewed-by: Alex Elder <elder@riscstar.com>
>=20
> > ---
> >   drivers/reset/reset-spacemit.c | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/reset/reset-spacemit.c b/drivers/reset/reset-space=
mit.c
> > index e1272aff28f7..cc7fd1f8750d 100644
> > --- a/drivers/reset/reset-spacemit.c
> > +++ b/drivers/reset/reset-spacemit.c
> > @@ -278,7 +278,7 @@ static int spacemit_reset_probe(struct auxiliary_de=
vice *adev,
> >  =20
> >   #define K1_AUX_DEV_ID(_unit) \
> >   	{ \
> > -		.name =3D "spacemit_ccu_k1." #_unit "-reset", \
> > +		.name =3D "spacemit_ccu.k1-" #_unit "-reset", \
> >   		.driver_data =3D (kernel_ulong_t)&k1_ ## _unit ## _reset_data, \
> >   	}
> >  =20

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

to be merged via the clock tree.

Note that the commits for both patches 2 and 3 will fail to probe the
reset driver when bisecting.
If you don't want do merge the corresponding changes to K1_AUX_DEV_ID()
into those two patches, to make this series (runtime) bisectable, you
should add a warning to both their commit messages that the reset
driver will be adapted in the following patch 4.

regards
Philipp
