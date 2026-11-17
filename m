Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794907036;
	b=AMNFgdKquQjyDs+tXxiJ6a1zePYgJNRAdTCfZBx+cbFxl8LFB0QuFHKfiAGtlOMvvUQ+
	 WDtKTt9oX1w5MccbKfG9SSiOjWq3S6IuUE+75K5TAiyWNvKtx0iw3txGeXQLaetcDLOSr
	 zyT5O1elhIvyp+i2Zf6gZqjVw8I90Fp714FCGtPAfHian1vAsSuWRQ4UDEsu7Vv9YFuJ5
	 8oWx/WOqrRNPJ34NlA3tfMmlDq/EdBAwnxdkTxQKZlSBdm6DjX/xzGKjkdkTsCRWI6k60
	 BkX01XYgIsId+Mr2bK7DxQK2ueXp57SIakRgFDJwEgA8VVpohcPh5lgh17e2nIGwIxQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794907036;
	h=DMARC-Filter:Received:DKIM-Signature:Message-ID:Subject:From:To:Cc:
	 Date:In-Reply-To:References:Content-Type:Content-Transfer-Encoding:
	 User-Agent:MIME-Version;
	bh=k9mD4d+6c6e9/oQ4Pzb2k3qI5yqg28FGpyq/0WXhWNs=;
	b=GRq5Xfams32G4EbLUbGwPq5Af1Wmiaa0JV3mAARY39bjLVkmKCJEhXcaytOCPHWsd7OL
	 Z2sLlG2jDKDQYQw7bZzSN9LQ940UiCrjdYtLBiMOiXIBBXM2dI65sxpXRVw1tISX6uz7x
	 Kx1fBLCalGSa/B/6sv8O/7XHHWHPU7sdPLPzFZvU8EDVRnRfQgc8Yf9D0R/gBlvOrYdRj
	 V0Uo5Hx//52JZ7iZhplG2DGu744660qONXBneWwH4ruANceBy5rmFneAm8X1Z7CkGeAJN
	 U0gzZ8vU+o9Jl8bhXm8fsCbPeF9T9gt13Aps+QI0ZHaXgq9y6ib/l+zmXfpjD6+FTVg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=none header.from=pengutronix.de;
	spf=pass smtp.mailfrom=pengutronix.de;
	dkim=pass header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=chWayecA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=185.203.200.13
Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F37F6606A334;
	Tue, 17 Nov 2026 09:17:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F37F6606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=pengutronix.de header.i=@pengutronix.de header.a=rsa-sha256 header.s=20260414 header.b=chWayecA
Received: from [IPv6:2a0a:edc0:0:900:1d::4e] (lupine.office.stw.pengutronix.de [IPv6:2a0a:edc0:0:900:1d::4e])
	(Authenticated sender: pza@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id D9B082010F9;
	Tue, 17 Nov 2026 10:17:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794907032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k9mD4d+6c6e9/oQ4Pzb2k3qI5yqg28FGpyq/0WXhWNs=;
	b=chWayecAi761d/qTajeLnDr8F4kqev3ZHMeFzu8gqUI/mklE4f4fBFC2YZ1QrKsJYW7NRO
	l/Qu+E3MbNjUFZr6T+exMUJBRwoLcCaXj/aPbr+Drk+LKCKlQe9DJHUzqakiHj+J5+SLwX
	iK669IpRLB0qevJQ22Wk5E9TTArf6nDNqTCOglwuzLaYq4gRB3sp3ZtyCCCj9zkhbri0k6
	P69Kg/IMsNChB1MhIBAjnrftXEo8PIfj3gT02gaoOCCUqFd9NS2rmYduGdivTGlOJRKLOB
	LydMaVl5pVrt9iHrKxFViPN+KMzOXnqdMhlkQTeVf2Bqp88/RG+rM8Z3yIBdYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=pengutronix.de;
	s=20260414; t=1794907032;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=k9mD4d+6c6e9/oQ4Pzb2k3qI5yqg28FGpyq/0WXhWNs=;
	b=cfu4B6QbQ8M/XuEjrajuGubsHXfuJKjqNkbmH53hsr5AgWu/CqfzM227YpnJvC7XNZsw4I
	mNWsvYhcQnnfi2BEjOypMdG2J+7MclgrVLn0nixcbx8ZjQOpNvYMIq8fbuXPo4sAzgWZR/
	qgjCz2JxVB/oeBxcZzg699rqeEd/tZ1FXgGTIsbt3Ft4nmRMQFtHWqTES/nj3t3iZo9v8u
	t20nDUw09UnkoPJVf84jLESWCcIP0r1bnWUXeuOt6RO/OTLMY0e96uLWNYka2HhLqqga58
	liA1T6U734kx/xfl6eE6vyVKVJ0LyMrL4Bdjbh90T0wc2BRrDYkXB9xPZGFH+Q==
ARC-Seal: i=1; s=20260414; d=pengutronix.de; t=1794907032; a=rsa-sha256;
	cv=none;
	b=PSzNgg8HJ/BDAI/32V8IDWV82XEzb1aT4jFAzF/UuvBrLVjekLFUz9h4nPSR3wWPG9Gn8l
	3O0aSA9W6IHOPXqjYRxKctiSS00phHkmGf088elT1+Wpb3nwDWBv+shRpd89RNBrLVHgAb
	ed/jun/qQC1X44lu2bOgTpBWuKjEDzSrsmxTnnCgCkXeTv01W23V0N+QSbCCa0vKwdP52d
	mFI5SttflO34wR8RuGWTptEI+dWrx9miesaqVoNxeDmVr896hHjy//SlQILAEZ4++a9S+U
	+qRCMh+40/8jphc9vJ91iyWzaKPVOHQB9m7cTXbzGGMxc5FGzpcUbrizTWQz4A==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=pza@pengutronix.de smtp.mailfrom=p.zabel@pengutronix.de
Message-ID: <f1b6889a4200720b91296168815533876c907674.camel@pengutronix.de>
Subject: Re: [PATCH v1 2/6] clk: starfive: jh71x0: Move reset controller
 registration to jh71x0 common code
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Changhuang Liang <changhuang.liang@starfivetech.com>
Cc: Brian Masney <bmasney@redhat.com>, Jerome Brunet
 <jbrunet+clk@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>, Emil Renner
 Berthing <kernel@esmil.dk>, Rob Herring <robh@kernel.org>,  Krzysztof
 Kozlowski	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 "linux-clk@vger.kernel.org"	 <linux-clk@vger.kernel.org>,
 "linux-kernel@vger.kernel.org"	 <linux-kernel@vger.kernel.org>,
 "linux-riscv@lists.infradead.org"	 <linux-riscv@lists.infradead.org>, Hal
 Feng <hal.feng@starfivetech.com>,  Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 17 Nov 2026 10:17:12 +0100
In-Reply-To: <ZQ4PR01MB12027C86A7EC92969661032CF27B2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
References: <20261013102707.9207-1-changhuang.liang@starfivetech.com>
	 <20261013102707.9207-3-changhuang.liang@starfivetech.com>
	 <179475230833.3873592.13070196353304136001.b4-review@b4>
	 <ZQ4PR01MB12027C86A7EC92969661032CF27B2@ZQ4PR01MB1202.CHNPR01.prod.partner.outlook.cn>
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

Hi Changhuang,

On Di, 2026-11-17 at 01:23 +0000, Changhuang Liang wrote:
> Hi, Philipp
>=20
> > > jh7110_reset_controller_register() is only tied to the JH7110 system
> > > clock driver by its location. Its logic is generic: hand the CRG
> > > register base to the reset driver through an auxiliary device.
> > >=20
> > > Move it to clk-starfive-jh71x0.c as jh71x0_reset_controller_register(=
)
> > > so that the clock drivers of other StarFive SoCs can reuse it, and
> > > make
> > > CLK_STARFIVE_JH71X0 select AUXILIARY_BUS accordingly.
> > >=20
> > > While at it, replace the open-coded auxiliary device allocation, init=
,
> > > add and release handling with devm_auxiliary_device_create(), which
> > > already implements all of it. The register base is now passed to the
> > > reset driver as platform data of the auxiliary device, so struct
> > > jh71x0_reset_adev and the embedded auxiliary device go away.
> > >=20
> > > The auxiliary device ID is dropped: every CRG already uses a distinct
> > > auxiliary device name, so the ID is not needed to keep the device
> > > names unique, and it is always 0 now.
> > >=20
> > > Since the helper now lives in clk-starfive-jh71x0.c, the auxiliary
> > > device names are prefixed with "clk_starfive_jh71x0" instead of
> > > "clk_starfive_jh7110_sys". Update the auxiliary_device_id table of th=
e
> > > JH7110 reset driver in the same patch to keep the tree bisectable.
> > >=20
> > > Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> > > ---
> > >  drivers/clk/starfive/Kconfig                  |  2 +-
> > >  .../clk/starfive/clk-starfive-jh7110-aon.c    |  2 +-
> > >  .../clk/starfive/clk-starfive-jh7110-isp.c    |  2 +-
> > >  .../clk/starfive/clk-starfive-jh7110-stg.c    |  2 +-
> > >  .../clk/starfive/clk-starfive-jh7110-sys.c    | 59 +----------------=
--
> > >  .../clk/starfive/clk-starfive-jh7110-vout.c   |  2 +-
> > >  drivers/clk/starfive/clk-starfive-jh7110.h    |  4 --
> > >  drivers/clk/starfive/clk-starfive-jh71x0.c    | 24 ++++++++
> > >  drivers/clk/starfive/clk-starfive-jh71x0.h    |  2 +
> > >  .../reset/starfive/reset-starfive-jh7110.c    | 19 +++---
> > >  include/soc/starfive/reset-starfive-jh71x0.h  | 10 ++--
> > >  11 files changed, 45 insertions(+), 83 deletions(-)
> > >=20
> > > diff --git a/drivers/clk/starfive/Kconfig
> > > b/drivers/clk/starfive/Kconfig index bd29358ffeec..51716655554f 10064=
4
> > > --- a/drivers/clk/starfive/Kconfig
> > > +++ b/drivers/clk/starfive/Kconfig
> > > @@ -2,6 +2,7 @@
> > >=20
> > >  config CLK_STARFIVE_JH71X0
> > >  	bool
> > > +	select AUXILIARY_BUS
> > >=20
> > >  config CLK_STARFIVE_JH7100
> > >  	bool "StarFive JH7100 clock support"
> > > @@ -32,7 +33,6 @@ config CLK_STARFIVE_JH7110_PLL  config
> > > CLK_STARFIVE_JH7110_SYS
> > >  	bool "StarFive JH7110 system clock support"
> > >  	depends on ARCH_STARFIVE || COMPILE_TEST
> > > -	select AUXILIARY_BUS
> > >  	select CLK_STARFIVE_JH71X0
> > >  	select RESET_STARFIVE_JH7110 if RESET_CONTROLLER
> >=20
> > You've switched to imply for the new controller you are introducing lat=
er in
> > this series.
> > You should probably be consistent and align this one too. Not in this c=
hange
> > though, it would be unrelated.
> >=20
> > This change otherwise looks good to me. It requires Philipp's opinion a=
s it is
> > touching reset too.
>=20
> This patch touches the reset subsystem. Could you please take a look
> and give your opinion?

struct jh71x0_reset_adev is misnamed now that it doesn't contain an
auxiliary_device anymore. I'd call it jh71x0_reset_platform_data or
similar. Otherwise,

Acked-by: Philipp Zabel <p.zabel@pengutronix.de>

regards
Philipp
