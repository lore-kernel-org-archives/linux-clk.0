Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1285F1BD9C9
	for <linux-clk@vger.kernel.org>; Fri, 23 Jan 2026 13:00:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.203.201.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769173242; cv=none; b=lTrh5B7lNJwRgitK2OYpK1ek5amom0ls0hzCbqGMNV0dDkRPgra4I71B7IA6wBQNzbjSmVqyX1H3Gj3R2XC16LLfioWyCB8+PM2XqAuTgTMEIfVq/4g4fPxP5h+EhKf9zQpAOqiJPvDGNm3k5q7RmY/EVC8GyXjlNCy0Kst/5JA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769173242; c=relaxed/simple;
	bh=qnQwqbTUxVnMDQDZEIWRUxRmayLu0yin8Pp+G+H9hqM=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=KUJrIh8YMaZF8aZFb6x1VoqZLGynYlpf0UJ/WnJ5qCy0+Fk6fMqIugqwQin/sSxfmqFggr7yJTOX2uyo5H7f/8VE1mI9HWKKT/OQqfUcW9uiqzn5iAB3iG6hfcBNXj1OZxKB5DfQZ6hyjMKCCAUvLqH893hMQvEujKHEINUIfXg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de; spf=pass smtp.mailfrom=pengutronix.de; arc=none smtp.client-ip=185.203.201.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vjGmA-0001AG-1F; Fri, 23 Jan 2026 14:00:34 +0100
Received: from lupine.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::4e] helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vjGm8-0025tQ-1d;
	Fri, 23 Jan 2026 14:00:31 +0100
Received: from pza by lupine with local (Exim 4.98.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1vjGm7-000000006dr-38JD;
	Fri, 23 Jan 2026 14:00:31 +0100
Message-ID: <1adc068bbf1a15b1b10651f6ad9385415f6d4227.camel@pengutronix.de>
Subject: Re: [PATCH v2 2/3] reset: tenstorrent: Add reset controller for
 Atlantis
From: Philipp Zabel <p.zabel@pengutronix.de>
To: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>, Drew Fustini	
 <dfustini@oss.tenstorrent.com>, Joel Stanley <jms@oss.tenstorrent.com>, Rob
 Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor
 Dooley	 <conor+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, 
	fustini@kernel.org, mpe@kernel.org, mpe@oss.tenstorrent.com, 
	npiggin@oss.tenstorrent.com, agross@kernel.org, agross@oss.tenstorrent.com,
 	bmasney@redhat.com
Date: Fri, 23 Jan 2026 14:00:31 +0100
In-Reply-To: <20260122-atlantis-clocks-v2-2-c66371639e66@oss.tenstorrent.com>
References: <20260122-atlantis-clocks-v2-0-c66371639e66@oss.tenstorrent.com>
	 <20260122-atlantis-clocks-v2-2-c66371639e66@oss.tenstorrent.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: p.zabel@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-clk@vger.kernel.org

On Do, 2026-01-22 at 16:36 -0600, Anirudh Srinivasan wrote:
> Adds Atlantis Reset Controller and auxiliary device definitions for
> reset to share same regmap interface as clock controller.
>=20
> This version of the reset controller driver covers resets from the RCPU
> syscon.
>=20
> Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> ---
>  MAINTAINERS                                |   2 +
>  drivers/reset/Kconfig                      |  11 ++
>  drivers/reset/Makefile                     |   1 +
>  drivers/reset/reset-tenstorrent-atlantis.c | 158 +++++++++++++++++++++++=
++++++
>  include/soc/tenstorrent/atlantis-syscon.h  |  26 +++++
>  5 files changed, 198 insertions(+)
>=20
[...]
> diff --git a/drivers/reset/reset-tenstorrent-atlantis.c b/drivers/reset/r=
eset-tenstorrent-atlantis.c
> new file mode 100644
> index 000000000000..2e7f09409f79
> --- /dev/null
> +++ b/drivers/reset/reset-tenstorrent-atlantis.c
> @@ -0,0 +1,158 @@
[...]
> +static int atlantis_reset_update(struct reset_controller_dev *rcdev,
> +				 unsigned long id, bool assert)
> +{
> +	unsigned int val;
> +	struct atlantis_reset_controller *rst =3D
> +		to_atlantis_reset_controller(rcdev);
> +	const struct atlantis_reset_data *data =3D &rst->data->reset_data[id];
> +	unsigned int mask =3D BIT(data->bit);
> +	struct regmap *regmap =3D rst->regmap;
> +
> +	if (data->active_low ^ assert)
> +		val =3D mask;
> +	else
> +		val =3D ~mask;

		val =3D 0;

The ~mask bits will be ignored anyway.

[...]
> diff --git a/include/soc/tenstorrent/atlantis-syscon.h b/include/soc/tens=
torrent/atlantis-syscon.h
> new file mode 100644
> index 000000000000..2c6387e5c21a
> --- /dev/null
> +++ b/include/soc/tenstorrent/atlantis-syscon.h
> @@ -0,0 +1,26 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (c) 2026 Tenstorrent
> + */
> +#ifndef __SOC_ATLANTIS_SYSCON_H__
> +#define __SOC_ATLANTIS_SYSCON_H__
> +
> +#include <linux/bits.h>
> +#include <linux/types.h>

#include <linux/auxiliary_bus.h>

struct regmap;

> +
> +struct atlantis_ccu_adev {
> +	struct auxiliary_device adev;
> +	struct regmap *regmap;
> +};
> +
> +#define to_atlantis_ccu_adev(_adev) \
> +	container_of((_adev), struct atlantis_ccu_adev, adev)

Please use an inline function instead of a macro.

> +
> +/* RCPU Reset Register Offsets */
> +#define RCPU_BLK_RST_REG	0x001c
> +#define LSIO_BLK_RST_REG	0x0020
> +#define HSIO_BLK_RST_REG	0x000c
> +#define PCIE_SUBS_RST_REG	0x0000
> +#define MM_RSTN_REG		0x0014

Why not move these into reset-tenstorrent-atlantis.c, they are not part
of the interface between clock and reset drivers.

regards
Philipp
