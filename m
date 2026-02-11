Received: from mx-relay49-hz3.antispameurope.com (mx-relay49-hz3.antispameurope.com [94.100.134.238])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79A3C31619D
	for <linux-clk@vger.kernel.org>; Wed, 11 Feb 2026 13:07:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=94.100.134.238
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770815259; cv=pass; b=qNpeHn7jI2LzYLlPTFHwo6R6Ed6jSHkcWRCfn3Xa21q4G44oOY7fLzzK5Ke41rxZScvv7YYY1+h49JKjiq2LMWcNvRWvn89RHFbqWs748+vm55/8irGkbKZTHhEOZaMCFqdUsLwuZ4RSR0MYOe15Oq1OX1r04nbMXebhw6ZSgjA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770815259; c=relaxed/simple;
	bh=3u7qEwIxFefCD9RIT8ZzGZntXAn+E3x5kO1a/WDdBuk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l7tbuRLNBEv2VNIGHQXr9Ir47/RqmWGRg0ccNaxrCFkZLWbCYiNtAZN5j+kSYoXsXz9soCz/QYm3JrXDsN0JU9/EHnlP9EQzRBIGmBZKIux3D4Bw4PqttO8WCE+rkVo4UIH7qKGl1kjhBIf2S/s1AWeF3yBqHFENFUa0j6t7c1k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com; spf=pass smtp.mailfrom=ew.tq-group.com; dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b=jiGhxzU2; arc=pass smtp.client-ip=94.100.134.238
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ew.tq-group.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ew.tq-group.com header.i=@ew.tq-group.com header.b="jiGhxzU2"
ARC-Authentication-Results: i=1; mx-gate49-hz3.hornetsecurity.com 1; spf=pass
 reason=mailfrom (ip=94.100.132.6, headerfrom=ew.tq-group.com)
 smtp.mailfrom=ew.tq-group.com
 smtp.helo=hmail-p-smtp01-out03-hz1.hornetsecurity.com; dmarc=pass
 header.from=ew.tq-group.com orig.disposition=pass
ARC-Message-Signature: a=rsa-sha256;
 bh=e3x2+YwwuhZsQSW5fmO01fXaVVeUQQTpRkaPQngxDXs=; c=relaxed/relaxed;
 d=hornetsecurity.com; h=from:to:date:subject:mime-version:; i=1; s=hse1;
 t=1770815225;
 b=oaxRj9C5ggw5kHtx4S1L7oeR62TLtR/JTgQS2eG6UPX9mC50DXHFqQUVqJrE2ZQ9oIEYbmzW
 HhA/jeWie3CSRozcfySY9oJUfyEHiS2ESkp6514wunh1nH8iCEGAtjB5XjmjZXD5QdUpkj52z3K
 AnhRTqQlBYLyFVotth1/VhZG5vQc6M4jIt9QTNWUknFDbB8ZI+P2ZrZPFRQ/01LDUVc9UYQXjgX
 +a1BkY9G6IUH5zFEMlzmSUcAUMm/SB6epTazmzPlfdh5TPhD9yn+pOA9LM4miNTlXRKzCCio2tn
 iywSetEQebsFN7UNVb85GB8SqyZeD5mZOJZrm633Gw2Nw==
ARC-Seal: a=rsa-sha256; cv=none; d=hornetsecurity.com; i=1; s=hse1;
 t=1770815225;
 b=FPdsPNpxvHGk60+wE33z7Wg5QOBQHUnaKNTjUSvexzxp8d4YT0pVRdeDkBiMgTn1Op+biFZI
 U1Kjl/otJF/Y6egdsUkUFnQzQqxjZ0P+gtLFdmwaNl9TRLcEYgOP9K1awpE9mEaOITXnnLDUMyr
 lREV84QElgTdmKSx+1lFW2bD1orBeQjPGQHox83NdLgiBh+y8+EJfMx++vRMWmwXtoFJ4n2X2RL
 FvWA0A+iqI6wp8oq4GLqL5wFifV4IW4bctHekLG9IIXlgtOKJa76jEDvOaXclWojfP9CzdD8g+/
 zK2CdwJEJWzv/C/DhBPwWmekJKjyA5FXX2sn06hpC4fvw==
Received: from he-nlb01-hz1.hornetsecurity.com ([94.100.132.6]) by mx-relay49-hz3.antispameurope.com;
 Wed, 11 Feb 2026 14:07:04 +0100
Received: from steina-w.localnet (host-82-135-125-110.customer.m-online.net [82.135.125.110])
	(Authenticated sender: alexander.stein@ew.tq-group.com)
	by hmail-p-smtp01-out03-hz1.hornetsecurity.com (Postfix) with ESMTPSA id 6C818CC0D37;
	Wed, 11 Feb 2026 14:06:42 +0100 (CET)
From: Alexander Stein <alexander.stein@ew.tq-group.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>,
 Peter Chen <peter.chen@kernel.org>, Pawel Laszczak <pawell@cadence.com>,
 Roger Quadros <rogerq@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Magnus Damm <magnus.damm@gmail.com>,
 Marek Vasut <marex@denx.de>, Frank Li <Frank.Li@nxp.com>,
 devicetree@vger.kernel.org, imx@lists.linux.dev, linux-usb@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
 linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux@ew.tq-group.com
Subject:
 Re: [PATCH v2 4/5] arm64: dts: freescale: add initial device tree for TQMa8x
Date: Wed, 11 Feb 2026 14:06:42 +0100
Message-ID: <3404121.aeNJFYEL58@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <20260211-futuristic-venomous-poodle-3b2708-mkl@pengutronix.de>
References:
 <20260211123436.1077513-1-alexander.stein@ew.tq-group.com>
 <20260211123436.1077513-5-alexander.stein@ew.tq-group.com>
 <20260211-futuristic-venomous-poodle-3b2708-mkl@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="iso-8859-1"
X-cloud-security-sender:alexander.stein@ew.tq-group.com
X-cloud-security-recipient:linux-clk@vger.kernel.org
X-cloud-security-crypt: load encryption module
X-cloud-security-Mailarchiv: E-Mail archived for: alexander.stein@ew.tq-group.com
X-cloud-security-Mailarchivtype:outbound
X-cloud-security-Virusscan:CLEAN
X-cloud-security-disclaimer: This E-Mail was scanned by E-Mailservice on mx-relay49-hz3.antispameurope.com with 4f9zGW4Rtgz3ycCd
X-cloud-security-connect: he-nlb01-hz1.hornetsecurity.com[94.100.132.6], TLS=1, IP=94.100.132.6
X-cloud-security-Digest:6e6ea929ed061832352f734018e4b891
X-cloud-security:scantime:1.997
DKIM-Signature: a=rsa-sha256;
 bh=e3x2+YwwuhZsQSW5fmO01fXaVVeUQQTpRkaPQngxDXs=; c=relaxed/relaxed;
 d=ew.tq-group.com;
 h=content-type:mime-version:subject:from:to:message-id:date; s=hse1;
 t=1770815224; v=1;
 b=jiGhxzU2mNOYxt/qsFg5MwuokKB5UrRGIr3EU8UQYWGngcfUcw/TTGqlCxV4RY7O9gxDeO6H
 7xeRe/JPm/FMRvOJCR1rlhV92XCmqr81wV0yXWzoY3YFq14lpEJdZzt09LvBFVY2+ZCH7kMBKi1
 2lz/94XW/ek9gh6dBYzhUZ2FwWTUsJG/1+igy1paFhoiAyBcTExrLsQuuzVRAHXShpc/oPDJOdM
 CQCR9hIPWJLAeG5hz2UsSsvRS7YzIxbWhl3RfqVMMDSmVZNtft4xfwP3I66u7+db7q6vNncSBzx
 8sQ5M67I5+ituVcmXbJ5ZqIWHgw9IGg0u0UPUj9WlEr7w==

Am Mittwoch, 11. Februar 2026, 13:43:17 CET schrieb Marc Kleine-Budde:
> On 11.02.2026 13:34:31, Alexander Stein wrote:
> > +&flexcan1 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_flexcan1>;
> > +	xceiver-supply =3D <&reg_mba8x_v3v3>;
>         ^^^^^^^^^^^^^^
> > +	status =3D "okay";
> > +};
> > +
> > +&flexcan2 {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_flexcan2>;
> > +	xceiver-supply =3D <&reg_mba8x_v3v3>;
>         ^^^^^^^^^^^^^^
> > +	status =3D "okay";
> > +};
>=20
> Can you use the PHY binding instead, see:
>=20
> | https://elixir.bootlin.com/linux/v6.18.6/source/arch/arm64/boot/dts/fre=
escale/imx8mp-tx8p-ml81-moduline-display-106.dts#L180

Mh, this doesn't seem to be necessary at all. It's an allways-on fixed
regulator anyway. I guess this is carried over all the time to silence
a warning regarding dummy regulator.

Will drop in v3.

Thanks and best regards,
Alexander
=2D-=20
TQ-Systems GmbH | M=FChlstra=DFe 2, Gut Delling | 82229 Seefeld, Germany
Amtsgericht M=FCnchen, HRB 105018
Gesch=E4ftsf=FChrer: Detlef Schneider, R=FCdiger Stahl, Stefan Schneider
http://www.tq-group.com/


