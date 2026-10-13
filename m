Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EB44B1297
	for <linux-clk@vger.kernel.org>; Tue, 13 Oct 2026 10:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791888134; cv=none; b=UpH4IEj8SIS/Hb9VhQRjcT+8QpF+F0yzBOxmycheetuF25x5BOioEtSO67qIy69jL+7zmf7cO8fGPuuSrUywdiSVM8K2hyG73EalJF/Qu4GG5OjwQBv0AUtDwsi1YEvjGScG18KpuHWlBETr6AMvOL+TSE0q9RjfxluwxyVPHAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791888134; c=relaxed/simple;
	bh=vl+uHCZbaCRilRDwjFl+bXHH937HCOP0gzmg3BnyGuI=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=kGORMpfPkxNgR6t1fzKkvNp6Qy2Xtkf8GMeG8wqp+OM8br2qkGakhpJjB0y69uZDdc2pxU5izy+/CGIeUnQBP4WkqekJWEGSzLUiXVqXSuSn20gMey3rcdf/+UUwdnuFfUx8k7Sa6mt3H/mrXCAhR9RmTyxkMZuQjEYYMekjSNw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iiuesKiD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iiuesKiD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7FDA91F000FF;
	Tue, 13 Oct 2026 10:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791888132;
	bh=x+lNzidBTtsFpOZY9pXcMpa3e4oDKYRmtlfpqS9lf20=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iiuesKiDz6LNBpDIg4j8kT0c4UAItXn7tRpD70G74Z05LjHSdA7WpWYPk/teOLKfc
	 IPWgtmACbddakucav/lFpioLwgISrOFrj2G+Nxnetu/lveJUwC+/mlhpQpKMY6wk6h
	 HAavD24lrB9GxlEScRzwu2d4vDs/94Tm76d2zW3mTqB/WoAXpyDNpT9HewHfp4C1uZ
	 Xur/duMpJpg/4RmPHqxXa/NjvdLhzQqu28Q+rI/HDdeDsSdSNJl1JvNvdfObxuvgrE
	 jl7JA6NUN0gr9OLohwBbtk2m7hMhgO6+k72wLcMCw3tTh2XsHcb7//mUEagtIAMs/g
	 zSE66iK/MINvw==
Message-ID: <sashiko-outbox-169533@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1 4/6] clk: starfive: Add JHB100 System-0 clock
 generator driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Changhuang Liang" <changhuang.liang@starfivetech.com>
Cc: linux-clk@vger.kernel.org
In-Reply-To: <20261013102707.9207-5-changhuang.liang@starfivetech.com>
References: <20261013102707.9207-1-changhuang.liang@starfivetech.com>
 <20261013102707.9207-5-changhuang.liang@starfivetech.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 10:42:12 +0000
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] clk: build failure due to missing dt-bindings header
--

commit bbdcc1dbc4e98a647c4ae9d5b0470ea19333afe4
Author: Changhuang Liang <changhuang.liang@starfivetech.com>

clk: starfive: Add JHB100 System-0 clock generator driver
   =20
Add support for JHB100 System-0 clock generator (SYS0CRG).

> diff --git a/drivers/clk/starfive/clk-starfive-jhb100-sys0.c b/drivers/cl=
k/starfive/clk-starfive-jhb100-sys0.c
> new file mode 100644
> index 0000000000000..dd4d65f4e6828
> --- /dev/null
> +++ b/drivers/clk/starfive/clk-starfive-jhb100-sys0.c
> @@ -0,0 +1,148 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * StarFive JHB100 System-0 Clock Driver
> + *
> + * Copyright (C) 2024 StarFive Technology Co., Ltd.
> + *
> + * Author: Changhuang Liang <changhuang.liang@starfivetech.com>
> + *
> + */
> +
> +#include <dt-bindings/clock/starfive,jhb100-crg.h>

[Severity: Low]
Is this header file missing from the commit? This header doesn't seem to be
included in this patch or any other patch in the series, which results in a
build failure when compiling drivers/clk/starfive/clk-starfive-jhb100-sys0.c
with CLK_STARFIVE_JHB100_SYS0 enabled.

[ ... ]

> +static const struct jh71x0_clk_data jhb100_sys0crg_clk_data[] =3D {
> +	/* bmcpcierp */
> +	JH71X0__DIV(JHB100_SYS0CLK_BMCPCIERP_NCNOC_MAIN, "bmcpcierp_ncnoc_main"=
, 6,
> +		    JHB100_SYS0CLK_PLL0),

[Severity: Low]
Will this lead to further compilation errors due to the missing header? In
jhb100_sys0crg_clk_data, array indices depend on macros like
JHB100_SYS0CLK_BMCPCIERP_NCNOC_MAIN which are expected to be provided by the
missing dt-bindings header.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013102707.9207=
-1-changhuang.liang@starfivetech.com?part=3D4
