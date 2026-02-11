Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA8433859A
	for <linux-clk@vger.kernel.org>; Wed, 11 Feb 2026 12:44:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770813842; cv=none; b=GnNqycwEH3JW/EMv7MmnT0VlNiX24OH4dMhFhytpUMBZPbxsrgMz8gGHEhHt85a9F2YIy740nql4trWQUZCeKhc7auz05xZnU6PQZ9wr3UAXfWtwtZILvI/s5YU43AiWoKwScEShmZS9cLM1NYevP4MwH+Joj1DaGSjKuh/GwL4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770813842; c=relaxed/simple;
	bh=Yrh/t/cTEKmV/IDOiH9nMLMPHm8bXxTrNsV5Qyd+Piw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=egmFyb5wQiZooA3AzTrwfIdO76xZ0Lug85bbA4U3syg/WF0QEc9dXcqLRWB+E85KwnX6oNNtSWHwNgzXVlqPH8oUa0m+9XRH0f5KLD8KCyffpp0mBDnrnclN48og5vW32G3hdMwiItjYImyVDXSdimOP9EyDqt8+ue7RoM4JciQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1vq9Yu-0001Lh-0u; Wed, 11 Feb 2026 13:43:20 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1vq9Yr-000FHh-06;
	Wed, 11 Feb 2026 13:43:18 +0100
Received: from pengutronix.de (p54b15bf8.dip0.t-ipconnect.de [84.177.91.248])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id E5CB54E67D3;
	Wed, 11 Feb 2026 12:43:17 +0000 (UTC)
Date: Wed, 11 Feb 2026 13:43:17 +0100
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Peter Chen <peter.chen@kernel.org>, 
	Pawel Laszczak <pawell@cadence.com>, Roger Quadros <rogerq@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>, Marek Vasut <marex@denx.de>, 
	Frank Li <Frank.Li@nxp.com>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
	linux-usb@vger.kernel.org, linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux@ew.tq-group.com
Subject: Re: [PATCH v2 4/5] arm64: dts: freescale: add initial device tree
 for TQMa8x
Message-ID: <20260211-futuristic-venomous-poodle-3b2708-mkl@pengutronix.de>
X-AI: stop_reason: "refusal"
References: <20260211123436.1077513-1-alexander.stein@ew.tq-group.com>
 <20260211123436.1077513-5-alexander.stein@ew.tq-group.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7t2tirsdzj62jtz2"
Content-Disposition: inline
In-Reply-To: <20260211123436.1077513-5-alexander.stein@ew.tq-group.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org


--7t2tirsdzj62jtz2
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2 4/5] arm64: dts: freescale: add initial device tree
 for TQMa8x
MIME-Version: 1.0

On 11.02.2026 13:34:31, Alexander Stein wrote:
> +&flexcan1 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_flexcan1>;
> +	xceiver-supply =3D <&reg_mba8x_v3v3>;
        ^^^^^^^^^^^^^^
> +	status =3D "okay";
> +};
> +
> +&flexcan2 {
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_flexcan2>;
> +	xceiver-supply =3D <&reg_mba8x_v3v3>;
        ^^^^^^^^^^^^^^
> +	status =3D "okay";
> +};

Can you use the PHY binding instead, see:

| https://elixir.bootlin.com/linux/v6.18.6/source/arch/arm64/boot/dts/frees=
cale/imx8mp-tx8p-ml81-moduline-display-106.dts#L180

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--7t2tirsdzj62jtz2
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSl+MghEFFAdY3pYJLMOmT6rpmt0gUCaYx5YwAKCRDMOmT6rpmt
0uZYAP9Mh/MD1BAbuW2LulGwhNS/BuC/0SSTPHlADyPndPoH1QEA7NcziSmdiwYc
clEEmCglt6MpfnzULfQqm+Pydj7PGAM=
=amdT
-----END PGP SIGNATURE-----

--7t2tirsdzj62jtz2--
