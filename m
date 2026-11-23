Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795452667;
	b=bZMfDW4HCQnK0sDOwihpf8hwhndKr3binqzmgJowGM2dgqscUcz/KzkAI0OVUPQj6m2d
	 9wokchqIDQzC1Zu9lINBSgzbLFmbROUCEhfJCtHvuQ5sRm68xsECCmKS7vP8iC9pG+4Dm
	 H1JbT6Luec8Ca/zw4ISosN2mRGwx1RwMEp3N73CPoYnIYuRzA6RUwbOmXDjJ4uX++4BzM
	 mL0wp1uv0FXptHEwGDN2f4dEKuq4k3c/TGAzDNTAdrEnPa5Al3yRixUP+j3RZESM2Njzh
	 QKn4fx2AaXQR4OichDowb3zxFd4myUi7eY2wLXPJOxJnqIvaGCxwzwR8gdNgFJwmbpw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795452667;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=oDDXBnRuSFWwir+Qc8FIH/dhSu2JKoewicfxlAouLOQ=;
	b=P99fep+/u8N/nKahR1TnKD6bymxDETzJVQAQvV4LXlsrNFXG/gW4KxZKFycJnF9Q1Wux
	 zAnLr1d4rUwc5I8jPw8apnKjCwrwN4apFK6ZJFBB3N4Unz87WnbOUPkjA+PCifYSqvDwH
	 0uQbuirJbaocJQCTp7vYWk8azBAKvdQutwf2sWcM1AWXXHNYvu8vufFJc7fkhY3knGK8S
	 yJCL88twVgBAJs29U9p0wuomCT/SjeaOo3joBJQKHUfb2Sq/1JsgFaPIm9qDUHg3WbLI5
	 +GW+oIn9lOICe9sbGrFjZPyZJNsSPoPPZgwlWnT9j5qJw7MBLElXTZ0u8tew57s3pMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=Qw7beBot;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09940606A693
	for <linux-clk@vger.kernel.org>; Mon, 23 Nov 2026 16:50:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 09940606A693
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=Qw7beBot
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=oDDX
	BnRuSFWwir+Qc8FIH/dhSu2JKoewicfxlAouLOQ=; b=Qw7beBot+GEfrz2B7nN6
	L91TgwiyyshqWEIlVxVwK+kbARCBrRi6xpjS9Fs0aqTv82dY6SF3rTegjqVEdYak
	06XG8jvk4zsw/SOjvy19BxtfawiXuNLUVtw4nhignsmehIxWOLZkTQ3D3bD2Uo4i
	xQHm7K4nP2xn1zsGRbNKoONoqJKi4q8wcV8jzMC24bruB0522uj7iK/e3r8w3oar
	F1T+homIsQFmqZ+e6iHrwX/WYOLJMKeF+AKO+jgD3wfX32JjFtZ3YhbyNdVIAj08
	kKLYKz9/KJWRmmS78KqnWsFdTSY3YBaPUCl0GPYGFMvPBYKc0knyFj6QdvnSrQGW
	Aw==
Received: (qmail 2835965 invoked from network); 23 Nov 2026 17:50:55 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 23 Nov 2026 17:50:55 +0100
X-UD-Smtp-Session: l3s3148p1@zwO+ZfRgEuIgAQnoAEqRAK1B9h1530u9
Date: Mon, 23 Nov 2026 17:50:55 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: Ralph Siemsen <ralph.siemsen@linaro.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, khendry@reliablecontrols.com,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	=?utf-8?B?Q2zDqW1lbnQgTMOpZ2Vy?= <clement.leger@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: clock: r9a06g032-sysctrl: Document
 reset cells
Message-ID: <awRu6SH8GvRir-eP@shikoro>
References: <20261119-rzn1-miic-resets-v1-0-feee2bb28bb4@reliablecontrols.com>
 <20261119-rzn1-miic-resets-v1-1-feee2bb28bb4@reliablecontrols.com>
 <awARmkCuelD_fdX6@shikoro>
 <5d8530485716d129be2efa0518254e3322cecdb0.camel@pengutronix.de>
 <awAq7vxcY8CGjhNl@ninjato>
 <awGV8BU_AfaXQyBv@maple.netwinder.org>
 <awIMBj_7OLrlM5G-@shikoro>
 <CANp-EDbNxWnpjXDshVhPEwppGu1cf2V2UBO+hk2NtFDFeqCAdg@mail.gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/micjW0Pmzh8X1xY"
Content-Disposition: inline
In-Reply-To: <CANp-EDbNxWnpjXDshVhPEwppGu1cf2V2UBO+hk2NtFDFeqCAdg@mail.gmail.com>

--/micjW0Pmzh8X1xY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline


> And perhaps more importantly, it would make consistent the .index and
> .source fields. Having one of them shifted by 1 can be confusing, and
> could lead to bugs.

I do buy that. If you have time and interest, I will review it.


--/micjW0Pmzh8X1xY
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmsEbukACgkQFA3kzBSg
KbZygQ/9G2yCc2P4OLa0WArZ/M4a7tsNbdcqactU++gO9citbwVdE8tbKOjFg3gM
C3cnNOz58R1ubgUwSsRzkp7ey+UwISzT3JsP1xrXWrSQjoZM87H6S5K8CZOdb1qQ
ftUOMVVPSPZdA6d5n/cLDE4p2rHQNMLxhr4BS95yHB5HjrApA/4CMnbpR1IkZE87
i9Yj415eL6OpaZwo6gm/YgYuW9z0dd7rvJe9gYoqvCyLCsRhTMp46LJ23uSxy5oT
Mjt5J2pINGrRh0aaAEwRXvoP5xBzORYvlbzdwwVvUKwWBV8ddR5IunRY+M4EpwJp
ZZpC9bqg73DmsM9+T9v7/+Kb/3eDhNUjPxm/a3LcWMVQCDNFI57PRoLOZ6e8tE90
pZCW6utLA03Sy5jMX+O/Y2+eC/HtOF+plz16UA/PqWHltgH8Bp+2ck4nV7TYyViJ
+Zawlq7FTNsVDL5pX8tqiOLkyRZAvJ8P1mySrqg84t0p9npXvAnRE2LOeVvBGmM8
DkTR1HAHa77DMaVt6uLM8o9KTpU+xPI9jefiqbTbXb8Q/LyQHQ/q14hD86a7/4I8
p3KOrX3dFYmbXk2LJT0DYwSnIvxQcMX1hLYQLeBEmjQPov0fvDfDVNQ3R49f2P0n
hZhltREBYFLuU4p9/onFUGU24M55UlAusAJTlMOu863GxzxxjEo=
=8jOZ
-----END PGP SIGNATURE-----

--/micjW0Pmzh8X1xY--
