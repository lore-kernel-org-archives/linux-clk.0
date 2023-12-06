Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [IPv6:2a0a:edc0:2:b01:1d::104])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3775D49
	for <linux-clk@vger.kernel.org>; Wed,  6 Dec 2023 06:20:31 -0800 (PST)
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rAslC-0004bH-8A; Wed, 06 Dec 2023 15:20:22 +0100
Received: from [2a0a:edc0:0:900:1d::4e] (helo=lupine)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rAslA-00Dyy8-Sk; Wed, 06 Dec 2023 15:20:20 +0100
Received: from pza by lupine with local (Exim 4.96)
	(envelope-from <p.zabel@pengutronix.de>)
	id 1rAslA-000E1j-2e;
	Wed, 06 Dec 2023 15:20:20 +0100
Message-ID: <ec1912eab8bead59f520c48b6d73a084fd07732d.camel@pengutronix.de>
Subject: Re: [PATCH v5 4/5] clk: stm32: introduce clocks for STM32MP257
 platform
From: Philipp Zabel <p.zabel@pengutronix.de>
To: gabriel.fernandez@foss.st.com, Michael Turquette
 <mturquette@baylibre.com>,  Stephen Boyd <sboyd@kernel.org>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue
 <alexandre.torgue@foss.st.com>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org,  linux-kernel@vger.kernel.org
Date: Wed, 06 Dec 2023 15:20:20 +0100
In-Reply-To: <20231206140029.492906-5-gabriel.fernandez@foss.st.com>
References: <20231206140029.492906-1-gabriel.fernandez@foss.st.com>
	 <20231206140029.492906-5-gabriel.fernandez@foss.st.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
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

Hi Gabriel,

On Mi, 2023-12-06 at 15:00 +0100, gabriel.fernandez@foss.st.com wrote:
> From: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
>=20
> This driver is intended for the STM32MP25 clock family and utilizes
> the stm32-core API, similar to the stm32mp13 clock driver.
>=20
> Signed-off-by: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> ---
[...]
> diff --git a/drivers/clk/stm32/stm32mp25_rcc.h b/drivers/clk/stm32/stm32m=
p25_rcc.h
> new file mode 100644
> index 000000000000..b1aca78a0b22
> --- /dev/null
> +++ b/drivers/clk/stm32/stm32mp25_rcc.h
> @@ -0,0 +1,4977 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */
> +/*
> + * Copyright (C) STMicroelectronics 2023 - All Rights Reserved
> + * Author: Gabriel Fernandez <gabriel.fernandez@foss.st.com> for STMicro=
electronics.
> + */
> +
> +#ifndef STM32MP25_RCC_H
> +#define STM32MP25_RCC_H
> +
> +#define RCC_SECCFGR0				0x0
[...]

What is the purpose of all the unused #defines?

I initially wanted to point out that the _SHIFT #defines are redundant
because the same information is already contained in the corresponding
_MASK #defines, but it seems like neither of the register field
definitions are used anywhere. It appears only some of the *CFGR
register offset #defines are actually used.

regards
Philipp
