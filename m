Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 837E045970;
	Thu,  4 Apr 2024 07:55:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712217332; cv=none; b=vEj9wtuthEUVWW+M4t8PT4nK8s178cuwekT9QRdwydOauneYMPkRqQuPmZAMq4GxxJuykwQoS2r+I5t8QUuegf/nwfb4zDafpSPt/lYX1NVydzKk67rJrk0RLdoccGJnxRibMGUWB7tU7lXgCoYs3/w+ZLwLb6granpd6xZOxIg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712217332; c=relaxed/simple;
	bh=NkrysVRINXxNDAy8IfExdhEZeYy7tThHP05gfrWMM50=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mqzBEoSy10jmVP0aIPKRyf7LO+b8KjUwOKU0JWxwgHHkPkMyzYM8QePy6AUz7D2systS7zZzErqoJCCnlMDK9ysmiEty61li5b1aDXjGa9CaEtmLNgmyHMrk/fzSlw2eK618EZr6svQ1w+F1gYCHYLvZS77E2SGV4kDWuS8bu+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NT7yD2OU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NT7yD2OU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8440BC433C7;
	Thu,  4 Apr 2024 07:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712217332;
	bh=NkrysVRINXxNDAy8IfExdhEZeYy7tThHP05gfrWMM50=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NT7yD2OUfd0Zx1whJt4h7sW5i46qubWx6f/pyVBMCRAXziAYcs150IWGeMZ2vNvBA
	 GL2bZpV7W0ON6dcfx8UWmjs/nj8A4ChJpPPRZUf9PLymj1zK7GTiw1ZLBpyLMhFULX
	 a3icwhAi+vIEaZljtuo4iweqkad510DkfXdGbzEvJygizLblBI+32T4DNbJtUhzEo+
	 TIXO8Bhiqp1HaqOc4+Uz4KUmtKqH/jSCklzGfmpSsqjAs04Hqsn96A3jp2J1qRK+09
	 oFoh5OWJ/lTs+/KosvaT2diZ+8okVy1ZKyxHmxk69LlI8+W0tRgVCJl+UI1N1hhlno
	 1AajqlqVHf78A==
Date: Thu, 4 Apr 2024 09:55:28 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: linux-clk@vger.kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
	linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	nbd@nbd.name, john@phrozen.org, devicetree@vger.kernel.org,
	dd@embedd.com, catalin.marinas@arm.com, will@kernel.org,
	upstream@airoha.com, lorenzo.bianconi83@gmail.com,
	angelogioacchino.delregno@collabora.com
Subject: Re: [PATCH 4/4] clk: en7523: add EN7581 support
Message-ID: <Zg5c8Pg0XKJx9TP5@lore-desk>
References: <cover.1712160869.git.lorenzo@kernel.org>
 <3aaf638b846ecfdbfc1c903206b7d519d56c9130.1712160869.git.lorenzo@kernel.org>
 <95d194ed-86fe-45df-88f1-ae460eb36eaf@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eVV2+alm6WlfouHe"
Content-Disposition: inline
In-Reply-To: <95d194ed-86fe-45df-88f1-ae460eb36eaf@linaro.org>


--eVV2+alm6WlfouHe
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On 03/04/2024 18:20, Lorenzo Bianconi wrote:
> > Introduce EN7581 clock support to clk-en7523 driver.
> >=20
> > Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>=20
>=20
> > +	return 0;
> > +}
> > +
> >  static int en7523_clk_probe(struct platform_device *pdev)
> >  {
> >  	struct device_node *node =3D pdev->dev.of_node;
> > @@ -306,6 +413,12 @@ static int en7523_clk_probe(struct platform_device=
 *pdev)
> >  	if (IS_ERR(np_base))
> >  		return PTR_ERR(np_base);
> > =20
> > +	if (of_device_is_compatible(node, "airoha,en7581-scu")) {
>=20
> Having matching and compatible comparisons inside various code is
> discouraged. Does not scale. Use driver/match data to store some sort of
> flags and check for the flag or some other parameter. The best if
> compatible appears once and only once: in of_device_id.

ack, I will fix it.

Regards,
Lorenzo

>=20
> > +		r =3D en7581_clk_hw_init(pdev, base, np_base);
> > +		if (r)
> > +			return r;
> > +	}
> > +
> >  	clk_data =3D devm_kzalloc(&pdev->dev,
> >  				struct_size(clk_data, hws, EN7523_NUM_CLOCKS),
> >  				GFP_KERNEL);
> > @@ -329,8 +442,15 @@ static const struct clk_ops en7523_pcie_ops =3D {
> >  	.unprepare =3D en7523_pci_unprepare,
> >  };
> > =20
> > +static const struct clk_ops en7581_pcie_ops =3D {
> > +	.is_enabled =3D en7581_pci_is_enabled,
> > +	.prepare =3D en7581_pci_prepare,
> > +	.unprepare =3D en7581_pci_unprepare,
> > +};
> > +
> >  static const struct of_device_id of_match_clk_en7523[] =3D {
> >  	{ .compatible =3D "airoha,en7523-scu", .data =3D &en7523_pcie_ops },
> > +	{ .compatible =3D "airoha,en7581-scu", .data =3D &en7581_pcie_ops },
> >  	{ /* sentinel */ }
> >  };
> > =20
>=20
> Best regards,
> Krzysztof
>=20

--eVV2+alm6WlfouHe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZg5c8AAKCRA6cBh0uS2t
rBtrAQD0iODN7RFILBb+Bh8RsOOMOb+pGNq7xhHmco94eje0WAEArI+HEHPPkx4/
p0RtLik/EgPWLOJB8drSyuLE30H5Vg4=
=oYsi
-----END PGP SIGNATURE-----

--eVV2+alm6WlfouHe--
