Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.117.254.33
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795731593;
	b=XDpgFc6xb4KfFYm/YzvN3G56qBrq8Dt6ZgmNY2oIoE915W/c3YGFrGUrkAsjmbOcpO17
	 1YYg/ckJWt6C0Qb9Q8fbauY4HaWappPOfA2ITYnvY/Egj3sU/51Li+ts2HXa4vJUedCzz
	 c6/k0J5ljEBU8aI2ZXluJgJaUYYRbDJmaYM2Ngp9uq+lmZ/NFHp3ou6EQo2GopMcG9oR0
	 I4qBbVgIbpR51/qHTRDqh5bFpT7AmUgEpz9Z+OP2GNteG2bJwjkB0PV8j+Fk8F1ZOSiug
	 8mdc4jx+5bvJllz5CzzoxHtebWN/6d0Dt6DFgM7PAGo6gsd/MjvJOcQ/lWIl+T+LArw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795731593;
	h=DMARC-Filter:DKIM-Signature:Received:Received:X-UD-Smtp-Session:Date:
	 From:To:Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=ACgG3qgjymthdmYN5c86mVt9T5rFAWRCAKqvpMDkHlA=;
	b=tptcIWjgYpKZ3FbSCbva1GsiiAD5hIoGgFFIZr2MAVXcY8wxDpzvVLnboRJdsjiWb9D/
	 i7V0u2KH0pT31xoknWgwuLOS1WljYY43UxyWH2FPM7ah6yk32hcUrye2PF9C8dTFfcAzN
	 YxnHN/qmzwWx2lqyllJ8QVNNa29AnZr88CcFQ635oYnqelHVypeWnUCmrjaB9/l64fiEs
	 jbC+R+rpxWBvbMC0MsKG8duG16yUvbVwtPnn/hTC/+myyBCKITGKd9RmeGQgVLEi6FUF+
	 cAyI7SZe+shh85YIwgevxq5KFOdwZ0tfsD1bMNvMBDN5mps5gbnij/iXH9swBoXiu3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=sang-engineering.com;
	spf=pass smtp.mailfrom=sang-engineering.com;
	dkim=pass header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=a7sbaiKc;
	arc=none smtp.remote-ip=194.117.254.33
Received: from mail.zeus03.de (zeus03.de [194.117.254.33])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1F66606A32C
	for <linux-clk@vger.kernel.org>; Thu, 26 Nov 2026 22:19:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C1F66606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sang-engineering.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sang-engineering.com header.i=@sang-engineering.com header.a=rsa-sha256 header.s=k1 header.b=a7sbaiKc
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=date:from:to:cc:subject:message-id
	:references:mime-version:content-type:in-reply-to; s=k1; bh=ACgG
	3qgjymthdmYN5c86mVt9T5rFAWRCAKqvpMDkHlA=; b=a7sbaiKcVNmx6i39vXkj
	DWA6PG5/m/XhShQ1dxAb/qg+EFj5sCt16VYXjoAV3Js2kp4EZwkZM9Uzs5zca3a+
	racIQNGcVBYWi1RmiDRgOe8tvPAuoAqhU9Ofco4PBcUjj44mZzRIqxFYEhIDePCM
	XCk/xyAa+UcQxhCMRC72Y4P2DAjxzUBUGHkE3EwwP/0IE/Sf0YbTnjXOtNDSEZzq
	AV3yXvF1gDhTFeOQ+ehtcKCfcXnILgZDqgGfPw00FZWxmyBdDY8Oqvg2//ez3gMr
	i5DFo4wGnqkIGoF8D4jnOsAeH57jqUnlIdmbJn0NzgS3EfAGkRXb7hu6gcAtrQ/I
	cw==
Received: (qmail 1766769 invoked from network); 26 Nov 2026 23:19:49 +0100
Received: by mail.zeus03.de with ESMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 26 Nov 2026 23:19:49 +0100
X-UD-Smtp-Session: l3s3148p1@kG6CVzVhAucujnv5
Date: Thu, 26 Nov 2026 23:19:49 +0100
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: khendry@reliablecontrols.com
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 3/3] ARM: dts: renesas: r9a06g032: Add #reset-cells to
 system controller node
Message-ID: <awiwhcOURd4L-rOC@ninjato>
References: <20261126-rzn1-miic-resets-v4-0-4f73af81d779@reliablecontrols.com>
 <20261126-rzn1-miic-resets-v4-3-4f73af81d779@reliablecontrols.com>
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
	protocol="application/pgp-signature"; boundary="KtqtMOIx4p5Ve6qE"
Content-Disposition: inline
In-Reply-To: <20261126-rzn1-miic-resets-v4-3-4f73af81d779@reliablecontrols.com>

--KtqtMOIx4p5Ve6qE
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 26, 2026 at 08:11:07AM -0800, Kyle Hendry via B4 Relay wrote:
> From: Kyle Hendry <khendry@reliablecontrols.com>
>=20
> Update the rzn1 system controller node with cells for the reset controller
>=20
> Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Signed-off-by: Kyle Hendry <khendry@reliablecontrols.com>

Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

by adding the rzn1-miic patches from the earlier series. Branch:

git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/n1d/ena=
blement


--KtqtMOIx4p5Ve6qE
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAmsIsIUACgkQFA3kzBSg
KbbbEA//cEVIpRBZv5zZZzGWV2AeEe69RIoNjmXGdUAg9fv9TpxQt/n6dypEi1Po
rUbeCczk26nz5rPP55X7YmbrtV4qsAgEZcvprnlSi28QImunkqYz3Vw4EdhjDfJh
uSuDautAbFyn/+blMjZ1EOhzZbP3qEaOlVVxauJutCBbAV7xVwOxLryJJrjEq7gw
LkNthPDuGfki3JVhmNt8g6L0sAjS1lc6kWZPeJ4t8OkDXhdkiaI2YPqrmLDlMOy2
okhqdty6ZVHQm+qKh0dmCB2K5j0Jl6zvyuwTp9vxHRuThDKwd4iWsK7SsoFt6YQM
l2ehqwUNoC7Fvu62mRbBIByFzJN8FVXlgUuZ4zZQs6lOlFBC3A9LcCLkB5PIAZcA
v6uFX9x8A/JFUdG0XfQfzqlx5zXDqE4I59Lf9Xt4nnidWY4zDCwaNcpJFogcg0Pv
NZqwW+LXhon2MLz+2ypsAgYZ85+cHl0hz3UozaOdjCO2XiEQYcMYeCZdiBHapxZw
fQ8sLMlt2R14hsUyVQAIcotzAstHiofanK86JZ0XzIWXzgqdXM566aS24R14EU5x
SYDiODHZ5e3JDALAb6CmYIDbXgdON2rOUJw9K7epOCp1ZRjKk0WNBW85EAi6ygyT
qqXBYqnV6LQKaxQzbqVyRIUn6VdBrSuDvjZy7OCwAM8LteLslso=
=k/S2
-----END PGP SIGNATURE-----

--KtqtMOIx4p5Ve6qE--
