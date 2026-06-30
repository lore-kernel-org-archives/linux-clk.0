Received: from mx1.white.stw.pengutronix.de (mx1.white.stw.pengutronix.de [185.203.200.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E1A23CEBA7;
	Tue, 30 Jun 2026 09:37:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.200.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782812282; cv=none; b=NlEyl7r4utWRYFjCh3g6OKOM35q3Z45co0abc5XE21ayFu4YEUJAm7rj9ujGORkpv2oaur2+m33jR/gv5nkFkMzBwpIt2zG4ewwRmURJoQNdkrj6FntFuUJLGqL29dJRDrL38kqobecivOFdnvUnsZeNHLy5xXbZuA0zzGgdw+8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782812282; c=relaxed/simple;
	bh=Dx6r6KRQw/Y8Q9QV4XTwcNAgMQsPIjTj5hYAVq5+yTc=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=oZtDcbhtlf6Qwyv9RhDvf1UvZ3g5SKKEzwi9Ukpp2iyXWX9Q2MUEayWeH+4AyzFNR36dNWkKWXSNEVZGfscWx7Xh7l2SeAyOHdYK9/3twarXP54WcKPNqGLbM0O9QYwaaPZrovonkCE2x4dfKcdVVt8rv9opMtfPkIhY7BLTq1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=fail smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.200.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de (drehscheibe.grey.stw.pengutronix.de [IPv6:2a0a:edc0:0:c01:1d::a2])
	(Authenticated sender: relay-from-drehscheibe.grey.stw.pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id DA89D2006B4;
	Tue, 30 Jun 2026 11:37:57 +0200 (CEST)
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1weUuj-005OHq-2d;
	Tue, 30 Jun 2026 11:37:57 +0200
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1weUuj-000000006lu-33Ue;
	Tue, 30 Jun 2026 11:37:57 +0200
Message-ID: <90ecf77e16c17f0ac46b2996be58110fc01c2e08.camel@pengutronix.de>
Subject: Re: [PATCH v7 3/4] reset: cix: add sky1 audss auxiliary reset driver
From: Philipp Zabel <p.zabel@pengutronix.de>
To: joakim.zhang@cixtech.com, mturquette@baylibre.com, sboyd@kernel.org, 
	bmasney@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: cix-kernel-upstream@cixtech.com, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Date: Tue, 30 Jun 2026 11:37:57 +0200
In-Reply-To: <20260629091500.52540-4-joakim.zhang@cixtech.com>
References: <20260629091500.52540-1-joakim.zhang@cixtech.com>
	 <20260629091500.52540-4-joakim.zhang@cixtech.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mo, 2026-06-29 at 17:14 +0800, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
>=20
> Add an auxiliary reset controller driver for the AUDSS CRU. Sixteen
> software reset lines for audio subsystem peripherals are controlled
> through one register in the CRU register map.
>=20
> The driver is created by the AUDSS clock platform driver and registers
> the reset controller on the CRU device node.
>=20
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> ---
>  drivers/reset/Kconfig            |  14 ++++
>  drivers/reset/Makefile           |   1 +
>  drivers/reset/reset-sky1-audss.c | 137 +++++++++++++++++++++++++++++++
>  3 files changed, 152 insertions(+)
>  create mode 100644 drivers/reset/reset-sky1-audss.c
>=20
> diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> index d009eb0849a3..f74859b292ae 100644
> --- a/drivers/reset/Kconfig
> +++ b/drivers/reset/Kconfig
> @@ -300,6 +300,20 @@ config RESET_SKY1
>  	help
>  	  This enables the reset controller for Cix Sky1.
> =20
> +config RESET_SKY1_AUDSS
> +	tristate "Cix Sky1 Audio Subsystem reset controller"
> +	depends on ARCH_CIX || COMPILE_TEST
> +	select AUXILIARY_BUS
> +	select REGMAP_MMIO

This driver doesn't need REGMAP_MMIO itself, it just inherits its
parent's regmap.=20

regards
Philipp
