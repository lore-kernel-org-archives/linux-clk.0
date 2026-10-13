Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35EEA42CAE7
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 10:46:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791888390; cv=none; b=AHxhGqGW4o98AAglGGu0TjeUKllHr3rHIXNKL6NmAJwxWBTBJYyNralCMNBI7uKEqRyo9dxqbViC2eqClSn9n7aBoUJ0j1k2WpQaYoTai68gRFKVTnUvWTLYPTjsbO8ZowOaQkr6N7umXjA4Qpa+EqLP4/ybTpiQt6bjxR1c2ys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791888390; c=relaxed/simple;
	bh=sv6JreF9/zm/W9qszkVGZD4UUKoNRNPwacd+Or7tRUA=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=e0XKTeg1Ytm0fVXvB5mK1m8BWi0LHWCOsQI1UHloj5beJaLSWx7TE2X/R4gKzLi8eCz1UzwlghjIJUNi1JrxK3x3iAO6mjNSw8wyI3gBbaws9QFOZO8ZIMMAT7snGyRwiklPzwutCvHoSrOHMUTGe3gWa/iYENxAXz0ZBKCkaJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W5nn9jtO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W5nn9jtO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3C821F000FF;
	Tue, 13 Oct 2026 10:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791888388;
	bh=6Xfo/FqkyH0QkhVE7ooVXc+uz0o6KMyM+i/8ZVa6Swo=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=W5nn9jtOn11DSJij1QaPfQvNCZVXGf52JMM8lAchw1tOpx+PJMb9jVcPrkmjpDpOF
	 PBAHDxWZ8RylYgCXFYXruxTqLpCtfVuoOIpBHn7+lBjmOoS2QetzI6ixGWU0F9NAeZ
	 seLdOI7h7/TvQDYyH0ucbPVLNm9m7UIWhDdQjzdmBZjOiqSaMJreqkblyYQu/qo/Hs
	 nXNxJmJigCkIWRnelq8T0ka1PGkERYHSMiv5vJn6EBIjEETWEMPhxbkgZjNTUF+qZp
	 DBaIxtjhj4Gd28lf9q6ZVHE3M1U7JjeXM0Au41KGHJcR+BjcI5ARVEcieaXEqoTy4p
	 9UNpSf9n5o7xw==
Message-ID: <sashiko-outbox-169543@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 6/6] reset: starfive: Add StarFive JHB100 System-0
 reset driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Changhuang Liang" <changhuang.liang@starfivetech.com>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20261013102707.9207-7-changhuang.liang@starfivetech.com>
References: <20261013102707.9207-1-changhuang.liang@starfivetech.com>
 <20261013102707.9207-7-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 10:46:27 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] build: missing dt-bindings header starfive,jhb100-crg.h
--

commit b52257e208a93d7e9c3c20b66b5cf444b957168b
Author: Changhuang Liang <changhuang.liang@starfivetech.com>

reset: starfive: Add StarFive JHB100 System-0 reset driver

Add the auxiliary reset driver for the StarFive JHB100 SoC. It binds to
the auxiliary devices registered by the JHB100 clock generator drivers
and uses the register base handed over as platform data.

> diff --git a/drivers/reset/starfive/reset-starfive-jhb100.c b/drivers/res=
et/starfive/reset-starfive-jhb100.c
> new file mode 100644
> index 0000000000000..129e5e8af251c
> --- /dev/null
> +++ b/drivers/reset/starfive/reset-starfive-jhb100.c
> @@ -0,0 +1,75 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * Reset driver for the StarFive JHB100 SoC
> + *
> + * Copyright (C) 2024 StarFive Technology Co., Ltd.
> + *
> + * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
> + */
> +
> +#include <dt-bindings/reset/starfive,jhb100-crg.h>

[Severity: Low]
Is this include missing from the current tree? Building the reset driver
with CONFIG_RESET_STARFIVE_JHB100 enabled fails because the dt-bindings
header starfive,jhb100-crg.h does not exist in this revision.

> +#include <linux/auxiliary_bus.h>
> +#include <soc/starfive/reset-starfive-jh71x0.h>
> +
> +#include "reset-starfive-jh71x0.h"
> +
> +static const struct jh71x0_reset_map jhb100_sys0_map[] =3D {
> +	{ JHB100_SYS0RST_RESOURCE_ARB,					0 },

This array relies on the missing header for macros like
JHB100_SYS0RST_RESOURCE_ARB, which results in undefined identifier errors
during compilation.

Do the device tree bindings need to be introduced in an earlier patch or
combined with this one to ensure git bisect does not break due to the build
failure?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013102707.9207=
-1-changhuang.liang@starfivetech.com?part=3D6
