Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795168316;
	b=U3pvm5q+3tUnrUSHhhkUA1bpVKIowxD8U3Kl7eKj9s+JwRxCwTCVVpuwzt8wpP38cdB4
	 BHk6HsT+jHJQd8nLzSMdMoG+DoWWuwqNNp3VebuqsoPn2yGiJCzuuR3bshyNr+s6sXyhk
	 Hagk0RNJrIpfWQ94BRbdgSDj4ElPkeLSfhHj7stBwKhkIVBZEOJ3RcMY03VVyf2sSnLva
	 HOrj8k3pfknaAGG4C+BwNHOP1xg7uuC0bfXGfV8CxgTPpAlBWwEuRlgfe/WKf7f/MEquz
	 XLblzZKJpzVy2kB1I/LTy85i06KC/JJFOvFIhxz2lyEmfncTE5ug0Yu4r41OAoH2c6g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795168316;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=+RPDxUUE8ecGFLx+xwdtSIuUUrICd//yV1ThZqH/7c0=;
	b=njYl6xWkPwKZhkQ0aeR2SHvTEkQK88zDpHRiyOJCpT7qPwit/TR8OJwQE58SgUE7WAk3
	 a0VQUwy2Zf2pV362gzodjKyuqOeW67F0y1/oKd2PydhDbbQpAHuNLcnb7XYfvZY+y/ld2
	 4Png9+Gl1AuUuZHPQrUtZC0iz1Q+r1JfPllxuY5a2HCn5cTMRo5gaIBZfyZYjLjM+7sp2
	 Oalw1ZWza2S7TDW6LQ820kUFQjCmMlw3IoaZPppYJtYl537Xwkg25URZYaHm8xQvAVfJN
	 okkCVyShHNfGsNHCjh3dh6QeK9S0PaUEyTsv1HLM6oqEZuscZP2nfRPZQ0tKJ49Y/Wg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=EOf9plRh;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AD84606A330;
	Fri, 20 Nov 2026 09:51:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3AD84606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=EOf9plRh
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id EE0AC202052;
	Fri, 20 Nov 2026 10:51:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795168313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+RPDxUUE8ecGFLx+xwdtSIuUUrICd//yV1ThZqH/7c0=;
	b=EOf9plRhoaIyHuJ8i2XDVFFF6bW0crYfSbxsIDmHooUL365ZJRtqn42hXBmEhEzxE2r3b0
	Fkh0pSJsyMwevJFrDxYxvqXpEI24IlsZiDr51c7gK3LaVtA6ee5oh10FOPq97fEpk19wtc
	6nqHMsehe8maP9dO4hOZnGAE2rCcGi4j/iW+kaHdELwqr+nQhR3OU2uY9IamFfvvwvt+5p
	HS9ggPM19wCygk6z/PixyTmyx5tadOlvdtWpuVSFFQ3gIjwvBebxkdv6w+NKdJzgGbNHmX
	ruB4LBLHd/t/5LXg0G3yN5mnccyGGvNop/iz3eOk6eZk8hzvD0GF++eiKHQVZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1795168313;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+RPDxUUE8ecGFLx+xwdtSIuUUrICd//yV1ThZqH/7c0=;
	b=d0Uf/iooUfrBgLxg/abHnnQA2O9OiTsRMUpU4dN00YQMzoHwdWFVnpBFMggP1YhRshWw85
	m0h4ksM3Kb/2muiY+T1XNJQnol72VMOllgsqB08nXJkPD2Fvz6gVAKrRbcNG4EUx7cSkCU
	J4OwlN3XVAE9OYuvifgEk2DwPD6+Ya/a/nGHtZHkykQXJwkFTqKahcKdFO1tnlwF1j7lyZ
	FoPj+bOuVlwwZRS/2ORTBvHqx2ynW2ScYd9M5P1a7s/3i13KC4WjM8vzE8ne0z/VLVvhcJ
	z6eLVVUdQqi4kks1bLNaDnILbEj1MATFSSEIunuclMbVRQMxmKX1LIKWZ0uNuA==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1795168313; a=rsa-sha256;
	cv=none;
	b=bcl0fpD1WpLYMmLuo+02hRfslqOhIKM6UiHIqQWC7sQ4H9iXSUcqAlTTSNtMRTKtZaesUW
	IdhRfHVgatRPm5yBOa2BM92JqUtdQZGFm5C2A3pKCQhThGINI3Qyzykm7jIEqdp30Cqu7E
	lWpLAL+L/E4VBxcmGIyxcPF+Uyx3miiSpkJXEQYblyb6UdD/V430V0O5NjhXEn1O5ZD5id
	BRbatTNhDTeAcKcalAX9GK9Y0F08XABzqoRR+Yn/G6lz5/CRmqyWcE2N2f3O/My0LAOaeu
	fIl+Ohzg8S0gB6qclaT8M4uAwSgTcplIS9+LMVBqNPeLaWtGcUWGbAlm5WYONw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Message-ID: <5d8530485716d129be2efa0518254e3322cecdb0.camel@pengutronix.de>
Subject: Re: [PATCH 1/6] dt-bindings: clock: r9a06g032-sysctrl: Document
 reset cells
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	khendry@reliablecontrols.com
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Stephen Boyd	
 <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet	
 <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Magnus
 Damm	 <magnus.damm@gmail.com>, Fabrizio Castro
 <fabrizio.castro.jz@renesas.com>,  =?ISO-8859-1?Q?Cl=E9ment_L=E9ger?=	
 <clement.leger@bootlin.com>, Andrew Lunn <andrew+netdev@lunn.ch>, "David S.
 Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Jakub
 Kicinski <kuba@kernel.org>,  Paolo Abeni <pabeni@redhat.com>, Lad Prabhakar
 <prabhakar.mahadev-lad.rj@bp.renesas.com>, Andrew Lunn	 <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King	
 <linux@armlinux.org.uk>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Date: Fri, 20 Nov 2026 10:51:52 +0100
In-Reply-To: <awARmkCuelD_fdX6@shikoro>
References: 
	<20261119-rzn1-miic-resets-v1-0-feee2bb28bb4@reliablecontrols.com>
	 <20261119-rzn1-miic-resets-v1-1-feee2bb28bb4@reliablecontrols.com>
	 <awARmkCuelD_fdX6@shikoro>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

On Fr, 2026-11-20 at 10:23 +0100, Wolfram Sang wrote:
> Hi Kyle,
>=20
> thank you for this series!
>=20
> > =20
> > +  '#reset-cells':
> > +    const: 1
> > +
>=20
> Maybe add the new property to the example below, too?
>=20
> > diff --git a/include/dt-bindings/clock/r9a06g032-sysctrl.h b/include/dt=
-bindings/clock/r9a06g032-sysctrl.h
> > index d9d7b8b4f426..e3059c50f7c3 100644
> > --- a/include/dt-bindings/clock/r9a06g032-sysctrl.h
> > +++ b/include/dt-bindings/clock/r9a06g032-sysctrl.h
> > @@ -146,4 +146,7 @@
> >  #define R9A06G032_CLK_UART6		152
> >  #define R9A06G032_CLK_UART7		153
> > =20
> > +#define R9A06G032_RST_TS		1
> > +#define R9A06G032_RST_MIIC		2
>=20
> I didn't find any listing of the resets in the RZN1 docs, so coming up
> with arbitrary numbers as we need them seems okay to me.

Why aren't we starting at 0?

regards
Philipp
