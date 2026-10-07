Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CC736F90C;
	Wed,  7 Oct 2026 14:02:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791381744; cv=none; b=aMqROrHqRIDiyFyul3pB8FztjD8evZqx/R8jCyL6fUDgjOIqUJBWm5uRqeb2RFyClxZ8NrFc/QjRPpcFbtDsKCJ3o6yl0F8T3DOpCv3bUlk4up4Fm5akoD5HyHbIZRqiFNn39k4U+dHa2FBqv/0ykXVelGFjSemSmy8/0sRhWhU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791381744; c=relaxed/simple;
	bh=olSRUiCBtWt4Fm6jAGRods0yqX5aB1afznh1v6MYuAI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DOJSzaoE9JRxlxMfJoOOznGvA1LmFLaY4XvaAfpXp0rAgAe7mfAWT/gpno2PAcCpkl5KCc6nwS4BuRkwBi3c+tk6CcPs4erYX6XfOIrMM2ZdYXGMqMTvlHY+N1FeLfzL6Umxj9RtfSNyr6ClQXBl+rkXKSOCDV4CfQNKESc7tK0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dh+P1RXb; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dh+P1RXb"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FF1D1F0089B;
	Wed,  7 Oct 2026 14:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791381735;
	bh=Q11AWL/EPY/BIfVce6hC9e0RarRTo3nH7wZFJBgkAFk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dh+P1RXbYlDFbGN3suBP/RDNbylH2oJ6Gms2EMXYldoKY8E2nHzwHiFnEwdYs6W3l
	 rzCIRKZL/2iqcKybG7RD0BwtEi/bq4DmkfqpcAlZLB4mbuYfEh1ZsU4gy05P5HOT2n
	 NEY87qUfazr66eAYIt7kTX9znV4y6r4PtvY4BI1JE89teABSvP1yUye/8tBRlOKBS4
	 zZ6QUo1bMqC7W/yvoZBKYDESwwmOVG8MQ6pnl/OjjxSxUYzvDH1LE7XN8/GU2GPNeS
	 UcWsvKy6I+qmBNhd7oOvK5R+fgRjy1CWFelgmxhdKOuPc2onZzPCJxW8jy4vQhJ50K
	 TiZM7D5W804PA==
Date: Wed, 7 Oct 2026 15:02:08 +0100
From: Conor Dooley <conor@kernel.org>
To: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
Cc: Ying Liu <victor.liu@nxp.com>, Frank Li <frank.li@oss.nxp.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org,
	imx@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: Re: [PATCH v10 6/9] dt-bindings: clock: nxp,imx95-blk-ctl: Add ldb
 child node
Message-ID: <20261007-ebaeee3a3bbd50ebbdedcf72@squawk>
References: <20261006-dcif-upstreaming-v10-0-bcfb28de0aae@oss.nxp.com>
 <20261006-dcif-upstreaming-v10-6-bcfb28de0aae@oss.nxp.com>
 <20261007-cb2d638508f306f3385c3799@squawk>
 <jr7zy2oxsuzfjrp4d74tl6gxiz5kg3pxl4qgigbbmtzyvjliwp@xaidoy4qvrdh>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qfYFC1F6QFYmGCHK"
Content-Disposition: inline
In-Reply-To: <jr7zy2oxsuzfjrp4d74tl6gxiz5kg3pxl4qgigbbmtzyvjliwp@xaidoy4qvrdh>

--qfYFC1F6QFYmGCHK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 07, 2026 at 04:57:45PM +0300, Laurentiu Palcu wrote:
> Hi Conor,
>=20
> On Wed, Oct 07, 2026 at 02:12:52PM +0100, Conor Dooley wrote:
> > On Tue, Oct 06, 2026 at 12:22:01PM +0000, Laurentiu Palcu wrote:
> > > Since the BLK CTL registers, like the LVDS CSR, can be used to contro=
l the
> > > LVDS Display Bridge controllers, add 'ldb' child node to handle
> > > these use cases.
> > >=20
> > > Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
> > > ---
> > >  .../bindings/clock/nxp,imx95-blk-ctl.yaml          | 24 ++++++++++++=
+++++++++-
> > >  1 file changed, 23 insertions(+), 1 deletion(-)
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ct=
l.yaml b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> > > index fbbf1b3f17904..97fe816a38f94 100644
> > > --- a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> > > +++ b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
> > > @@ -51,6 +51,10 @@ patternProperties:
> > >      $ref: /schemas/media/fsl,imx95-csi-formatter.yaml#
> > >      unevaluatedProperties: false
> > > =20
> > > +  '^ldb@[0-9a-f]+$':
> > > +    type: object
> > > +    $ref: /schemas/display/bridge/fsl,ldb.yaml#
> >=20
> > The class of device is bridge, why not use that here?
>=20
> I'm sorry, your question is a bit vague... Are you referring to renaming
> the pattern to '^bridge@[0-9a-f]+$'? If yes, I don't have strong
> opinions against it. I can do it in the next iteration.

Yes, sorry.
That'd be great.

Thanks,
Conor.

pw-bot: changes-requested


--qfYFC1F6QFYmGCHK
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCasZQ4AAKCRB4tDGHoIJi
0vtMAP9BAzbT8CNXcasaaU+K6qO6MCMdqQyLCatmAZpSK81yRwEAudTtBZWLd7cb
w3GYYsCuwheg3bZe3nqy+OpPtql79AY=
=kp1o
-----END PGP SIGNATURE-----

--qfYFC1F6QFYmGCHK--
