Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F98E67A15;
	Thu,  4 Apr 2024 08:43:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712220198; cv=none; b=g+oI1IZsgMobtw+S5pUGGrc8qoQAkJlwwODMomQQvYs35fscNyl6YeCdp1lXQcSmkvZqD6aJYRhtOxb2GhM4jJAEHlW5rV36XB2CoEfHyXn8QSs6CAMwg20/Lru9amMo67UluzgUZtCNWwEVShrkZ0L+n6dkdfCPAXWRCYvEgZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712220198; c=relaxed/simple;
	bh=K/2kqRefdjaSq6RSFSje8rLRMQvvvg2h/VDyWIAvNtM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XVh7BjPQY01ZYiD08D1V4lun966AB1lksWl9yx47yFDx4oXf2aTSTNmCPeCdj/FO7tKVslohM6l1y0evU2AcoPiNRxRQ/NZPbHr1C91M85YAP5V74BRLcwfDMspUhjArObrpqNQ3oU/vxYzp2hFnCXvSin6muDnQ/vHw3Rz2mV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rOmr+Kj/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rOmr+Kj/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CB383C433C7;
	Thu,  4 Apr 2024 08:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712220198;
	bh=K/2kqRefdjaSq6RSFSje8rLRMQvvvg2h/VDyWIAvNtM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rOmr+Kj/+Y5R96IOjw3hCuE+g6j0GF90jlc0BdbF1n7+Oc5UAcGbTjAd+g9j0HKAZ
	 6eqDz/KTWUTTXSHIOhjWqjxfQTs/unIJLfsf7wKWB4bXt9zoPoIADmnJ7mw3vKrCAt
	 aYveqtVQ6wb9WyB8XKPxlQK6zNzY0arNXNE64k36iGk4Os3ML9LSI/tea5gv9s0jNg
	 GRk+48LbFfqjfRbxrDmBap/f3dNNWi4qQdN92KmajCTG8SEZP4exj/T+hDsLbnKJZJ
	 N1FznPbTSKe/EGE0Ssy5cvP4mXNpd/alB3QIYtoxQd9TR4C0/bl+lyX8pQZUU2NucQ
	 RDECPr6NbnxVg==
Date: Thu, 4 Apr 2024 10:43:14 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-clk@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	nbd@nbd.name, john@phrozen.org, devicetree@vger.kernel.org,
	dd@embedd.com, catalin.marinas@arm.com, will@kernel.org,
	upstream@airoha.com, lorenzo.bianconi83@gmail.com,
	angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH 1/4] dt-bindings: clock: airoha: add EN7581 binding
Message-ID: <Zg5oIhcW4pFQNTwm@lore-desk>
References: <cover.1712160869.git.lorenzo@kernel.org>
 <1988a4460ed327bea7841f6a0f3a756dd7cec4bb.1712160869.git.lorenzo@kernel.org>
 <65e7617a-9e7b-4dea-a98c-31502222543a@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="2+PFIIQN5kSAMM2T"
Content-Disposition: inline
In-Reply-To: <65e7617a-9e7b-4dea-a98c-31502222543a@linaro.org>


--2+PFIIQN5kSAMM2T
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On 03/04/2024 18:20, Lorenzo Bianconi wrote:
> > Introduce Airoha EN7581 entry in Airoha EN7523 clock binding
> >=20
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> > ---
> >  .../bindings/clock/airoha,en7523-scu.yaml     | 26 +++++++++++++++++--
> >  1 file changed, 24 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.=
yaml b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> > index 79b0752faa91..cf893d4c74cd 100644
> > --- a/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> > +++ b/Documentation/devicetree/bindings/clock/airoha,en7523-scu.yaml
> > @@ -29,10 +29,13 @@ description: |
> >  properties:
> >    compatible:
> >      items:
> > -      - const: airoha,en7523-scu
> > +      - enum:
> > +          - airoha,en7523-scu
> > +          - airoha,en7581-scu
> > =20
> >    reg:
> > -    maxItems: 2
> > +    minItems: 2
> > +    maxItems: 3
> > =20
> >    "#clock-cells":
> >      description:
> > @@ -45,6 +48,25 @@ required:
> >    - reg
> >    - '#clock-cells'
> > =20
> > +allOf:
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          const: airoha,en7523-scu
> > +    then:
> > +      properties:
> > +        reg:
> > +          maxItems: 2
> > +
> > +  - if:
> > +      properties:
> > +        compatible:
> > +          const: airoha,en7581-scu
> > +    then:
> > +      properties:
> > +        reg:
> > +          maxItems: 3
>=20
> Original code had here issue - lack of description of the items. You are
> now growing it. Please instead list the items (items: - description: foo
> bar .....).

ack, I will fix it.

Regards,
Lorenzo

>=20
> Best regards,
> Krzysztof
>=20

--2+PFIIQN5kSAMM2T
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZg5oIgAKCRA6cBh0uS2t
rFCWAP0Z57M4LuN3Jsam2ES7Vvxp09GbLGM2x46HobQSrrze2gD/SHhAeW8vXIrH
YV9OrMHbfXZjgqO1d3jnTBZkUpqMBw4=
=DYYB
-----END PGP SIGNATURE-----

--2+PFIIQN5kSAMM2T--
