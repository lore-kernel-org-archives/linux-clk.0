Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D5E8143747;
	Thu, 16 May 2024 11:22:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1715858541; cv=none; b=dSCGsGp2hc6oaBYPXAgsZVwx707bE+IWVcXvGCJJhufiYwnkrdAJrm39LddLS9uwIWsf+mIJcfW1cy8Iek080+gRSiORSEAKU8ivF5O8t10geA6QCwcOlyKF3nuMdqKpZtVlVR5OLqO3/JB/8TGEJAnWzFpzfgTYP6DuLv5Djtc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1715858541; c=relaxed/simple;
	bh=gkue31XZB7soLiC173LtvdoK5m2Qi3X/p+NB90MIVPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Jmz1HHKlSC1ofHnsIUy3EWxEIx1MnoV8dOKTJ8Dd3h5fmhTnEPrINRj6GrZFwm5cO4ak7VUnhHSgEpXWGBTFVhrpPT1Xfq7oFZ9ZaOUQdKGtB1veKS0erAGQWXqNuyLqrWI05F1JUw6/CNtLRzQfaulRqqI51/9wnuQRgtSj4oU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HCtlEfTl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HCtlEfTl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5DA6DC113CC;
	Thu, 16 May 2024 11:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715858540;
	bh=gkue31XZB7soLiC173LtvdoK5m2Qi3X/p+NB90MIVPI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HCtlEfTl6j2d0A1k5vyrf0BKB+9HE+wrFN9Z0GmCGQiafs9bFV4ireltLBVZravjY
	 6/GB+oQKmcLf+N8PoNtWKhxqWOPUku3cJtnPbb7y0WCng+zg4yMo4AogjdvOk7S/RD
	 Mb56XiuLcOQrCpeB/4L9VM0efH7u+0o8f816ojKEZLrqvCWdYPTJhfyS5QgPRQSHwp
	 ONnH8Tnk+4gn1nvVMTT85cZ/O0bOpatWYAm2Tsw3nvD+LTLdbNHTFJOys/f633dyE9
	 z+R5j0F9uVNs6zeuxieWK5KupYQHS8kRv1nc1hNjPJpVhQW2ds3EfnLVr9gERF0Rnc
	 EhhPAxfCe260w==
Date: Thu, 16 May 2024 13:22:16 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-clk@vger.kernel.org, p.zabel@pengutronix.de,
	mturquette@baylibre.com, sboyd@kernel.org,
	lorenzo.bianconi83@gmail.com, conor@kernel.org,
	linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	devicetree@vger.kernel.org, nbd@nbd.name, john@phrozen.org,
	dd@embedd.com, catalin.marinas@arm.com, will@kernel.org,
	upstream@airoha.com
Subject: Re: [PATCH 4/5] clk: en7523: Add reset-controller support for EN7581
 SoC
Message-ID: <ZkXsaLylQOTis_wF@lore-desk>
References: <cover.1715777643.git.lorenzo@kernel.org>
 <0f7b04c2101db1a974dc45017bee285ffb25d80f.1715777643.git.lorenzo@kernel.org>
 <97b1fbfc-e059-46c7-9bb1-75cdaa2d2159@collabora.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1IzpTw6hbx1Q6+He"
Content-Disposition: inline
In-Reply-To: <97b1fbfc-e059-46c7-9bb1-75cdaa2d2159@collabora.com>


--1IzpTw6hbx1Q6+He
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> Il 15/05/24 14:58, Lorenzo Bianconi ha scritto:
> > Introduce reset API support to EN7581 clock driver.
> >=20
> > Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>=20
> Heh, that's exactly the usual MediaTek reset controller :-D
>=20
> > ---
> >   drivers/clk/clk-en7523.c | 96 +++++++++++++++++++++++++++++++++++++++-
> >   1 file changed, 94 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/clk/clk-en7523.c b/drivers/clk/clk-en7523.c
> > index 381605be333f..18798b692b68 100644
> > --- a/drivers/clk/clk-en7523.c
> > +++ b/drivers/clk/clk-en7523.c
> > @@ -6,6 +6,7 @@
> >   #include <linux/of.h>
> >   #include <linux/of_device.h>
> >   #include <linux/platform_device.h>
> > +#include <linux/reset-controller.h>
> >   #include <dt-bindings/clock/en7523-clk.h>
> >   #define REG_PCI_CONTROL			0x88
> > @@ -65,8 +66,18 @@ struct en_clk_gate {
> >   	struct clk_hw hw;
> >   };
> > +#define RST_NR_PER_BANK		32
>=20
> Please move this definition at the beginning of this file, grouping that =
with
> the others.

ack, I will fix it.

>=20
> ..snip...
>=20
> > @@ -456,12 +542,14 @@ static int en7523_clk_probe(struct platform_devic=
e *pdev)
> >   	en7523_register_clocks(&pdev->dev, clk_data, base, np_base);
> >   	r =3D of_clk_add_hw_provider(node, of_clk_hw_onecell_get, clk_data);
> > -	if (r)
> > +	if (r) {
> >   		dev_err(&pdev->dev,
> >   			"could not register clock provider: %s: %d\n",
> >   			pdev->name, r);
> > +		return r;
> > +	}
> > -	return r;
> > +	return en7523_reset_register(&pdev->dev, np_base, soc_data);
>=20
> If en7523_reset_register fails, you want to call of_clk_del_provider(), so
> you can't just return like this...

ack, I will fix it.

Regards,
Lorenzo

>=20
> Cheers,
> Angelo
>=20
> >   }
> >   static const struct en_clk_soc_data en7523_data =3D {
> > @@ -480,6 +568,10 @@ static const struct en_clk_soc_data en7581_data =
=3D {
> >   		.unprepare =3D en7581_pci_unprepare,
> >   		.disable =3D en7581_pci_disable,
> >   	},
> > +	.reset_data =3D {
> > +		.base_addr =3D REG_RESET_CONTROL2,
> > +		.n_banks =3D 2,
> > +	},
> >   	.hw_init =3D en7581_clk_hw_init,
> >   };
>=20
>=20
>=20

--1IzpTw6hbx1Q6+He
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZkXsaAAKCRA6cBh0uS2t
rGMtAP42ShUJqdRmjCR450t85MAH7GQu7725+THcJN3P1i9EYQD+MV2tuolsxmA3
QmzsQdg94EMSnDH6veNPqwaLnoUdGwE=
=eOOs
-----END PGP SIGNATURE-----

--1IzpTw6hbx1Q6+He--
