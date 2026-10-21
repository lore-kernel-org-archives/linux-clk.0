Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792594710;
	b=bS1Kp9Csxy5tBTk8KqFhHGgMN5GoOi4NkecdQolURMH96WATTgB0O2NrOvse5ewbUGjx
	 CcWImSbsIFVeWvh0brNOXH+Bz3Fsezz+GkxMJeAp6CazpInfQ4DEnJeABCpIa+0jGbo2s
	 5hXkH3qaM816MBihFaeHZ2nsziFVYOK+Ge6ujwZTXXlXVjCvFZ6UgODfrgrnfBfRE9rfn
	 ERJ4Ra2nNMjMRTDV3gj81/xQTlFe4hioJom8FcCe/nqPcp3KpbacHV59V5GerapYwa/MF
	 VfyLZ+NlmUeFeeMle/56uAQDz3zGCoU/FP7t+VowFMqGpONSCQGElwQ1XZI53rUlEPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792594710;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=bPwFPmDv6+H0dJ0zxvyUSWS02FggSDh5d0vS5g3VO7c=;
	b=RgDBG+c3lcEKmsJoVPDQGb4VRm6oJMueUcZfcyqkmK1SAQFmeMmBwbqBhKQODb1F+/UI
	 U5YLqFVilKUfCeM+K5DDBNO2j4NR+PYY5SLf5YVbtV92B7tjvlmm7jm6eOGj9JUYUlK4L
	 ECjZyYsSjBx8LcmDCWp9ZuEwJY22NToKakFaZORNuJH1ePK73Ego9oQp8t5EpIwFBAXld
	 VGPsxbfdCe8Uh/aIRZ1/fa6H5zemereojJu/S2XcjAB95NplqXHvmkHR+6CqXjoopPIId
	 H2RbZhIqCeB7viZldFHrJFRcBol0kpP2jsqWTB25S5wv3eUfa+kdOp6tPARdRW1hYqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AE9vx6++;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61C87606A31A;
	Wed, 21 Oct 2026 14:58:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AE9vx6++
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C70871F000C6;
	Wed, 21 Oct 2026 14:58:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792594710;
	bh=bPwFPmDv6+H0dJ0zxvyUSWS02FggSDh5d0vS5g3VO7c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=AE9vx6++YLnAScM9+eWIVuBl9L8nhnLmLs3wThUAOd8nznUSjW7I1I3/hVOpiRGKW
	 eshoJ9iEfdpFyDuNBsxm58ZD2En/s+PysdQ67+R5vgcvlyhGMGt5IXnSoXLE1IvSjP
	 BJNl7TiWcBryV0BAtu/235Qk7Sg55Bwueb2bh3x0Ecbn9bdirF2/tuG5bkcTAvmVgn
	 tHBchvVmoMj1mun27L5Ojf2f3QZJYullHNtcLmPrcSsYbAIb0+c7IH/mW9bM9JOltf
	 MrX6/EbyrDKMoGDlIkowoSM3e0Y4rc0j4aszKdAqvlte5qPufhAhT6OezQ0eWg0FrC
	 qwIzSr53AUU0Q==
Message-ID: <sashiko-outbox-180405@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] ARM: dts: bcm2711: give the GENET MDIO controller
 its clock
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nicolai Buchwitz" <nb@tipi-net.de>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20261020-devel-bcm2711-gisb-clk-v1-3-a1728724d0f8@tipi-net.de>
References: <20261020-devel-bcm2711-gisb-clk-v1-0-a1728724d0f8@tipi-net.de>
 <20261020-devel-bcm2711-gisb-clk-v1-3-a1728724d0f8@tipi-net.de>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 21 Oct 2026 14:58:29 +0000
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] ARM: dts: bcm2711: genet_mdio clocks property ignored in unimac_=
mdio_probe()
--

commit abe7b1908b1ca3d642c93b8cea72ce17c73c4c14
Author: Nicolai Buchwitz <nb@tipi-net.de>

ARM: dts: bcm2711: give the GENET MDIO controller its clock

This commit adds the BCM2711_CLOCK_GISB clock phandle to the genet_mdio
device tree node in bcm2711.dtsi so the mdio-bcm-unimac driver can query
the 200 MHz clock rate.

> diff --git a/arch/arm/boot/dts/broadcom/bcm2711.dtsi b/arch/arm/boot/dts/=
broadcom/bcm2711.dtsi
> index 5e3b4bb393967..82b38551d55cf 100644
> --- a/arch/arm/boot/dts/broadcom/bcm2711.dtsi
> +++ b/arch/arm/boot/dts/broadcom/bcm2711.dtsi
> @@ -597,6 +597,7 @@ genet_mdio: mdio@e14 {
>  				compatible =3D "brcm,genet-mdio-v5";
>  				reg =3D <0xe14 0x8>;
>  				reg-names =3D "mdio";
> +				clocks =3D <&clocks BCM2711_CLOCK_GISB>;
>  				#address-cells =3D <0x1>;
>  				#size-cells =3D <0x0>;
>  			};

[Severity: Medium]
Will mdio-bcm-unimac actually read the clocks property added to the
genet_mdio child node here?

When bcmgenet_probe() initializes the controller, it requests the parent
genet node's "enet" clock via devm_clk_get_optional(&priv->pdev->dev,
"enet"), which evaluates to NULL on BCM2711 because the parent
ethernet@7d580000 node has no clocks property.

Then bcmgenet_probe() -> bcmgenet_mii_init() -> bcmgenet_mii_register()
registers the unimac-mdio platform device with platform_data attached:

drivers/net/ethernet/broadcom/genet/bcmmii.c:bcmgenet_mii_register() {
	...
	ppd.clk =3D priv->clk;
	...
	if (dn)
		platform_device_set_of_node(ppdev, bcmgenet_mii_of_find_mdio(priv));
	else
		ppd.phy_mask =3D ~0;

	ret =3D platform_device_add_resources(ppdev, &res, 1);
	if (ret)
		goto out;

	ret =3D platform_device_add_data(ppdev, &ppd, sizeof(ppd));
	...
}

When unimac_mdio_probe() runs for that device, pdata is non-NULL, so it
takes the if (pdata) branch and never calls devm_clk_get_optional() on the
genet_mdio OF node:

drivers/net/mdio/mdio-bcm-unimac.c:unimac_mdio_probe() {
	...
	if (pdata) {
		bus->name =3D pdata->bus_name;
		priv->wait_func =3D pdata->wait_func;
		priv->wait_func_data =3D pdata->wait_func_data;
		bus->phy_mask =3D ~pdata->phy_mask;
		priv->clk =3D pdata->clk;
	} else {
		bus->name =3D "unimac MII bus";
		priv->wait_func_data =3D priv;
		priv->wait_func =3D unimac_mdio_poll;
		priv->clk =3D devm_clk_get_optional(&pdev->dev, NULL);
	}
	...
}

As a result, priv->clk remains NULL and clk_get_rate(priv->clk) in
unimac_mdio_clk_set() still returns 0 (and unimac_mdio_clk_set() also
returns early unless clock-frequency is set).

Should unimac_mdio_probe() fall back to devm_clk_get_optional() when
pdata->clk is NULL, or should the clock be wired up through the parent
genet node?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261020-devel-bcm2=
711-gisb-clk-v1-0-a1728724d0f8@tipi-net.de?part=3D3
