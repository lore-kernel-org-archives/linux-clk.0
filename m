Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CA15261393
	for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 22:17:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771280261; cv=pass; b=JCHbkOrHJIAnkTtr/JvaK60rqmeAC3mVz4oVBFG2ZJ57e6PRvwkNjnS8cXUsFlsQYFSMN7Ibw8l8W6fef47UAWsyyCAba0rMWDS15Bf/zE6FEcPTsX6qJAqBIiaykS3n08oMTDMw0wUgiEluTxChsTdBcWWY2Ri+PAHagV2SS7E=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771280261; c=relaxed/simple;
	bh=M0tZLLCijhYp0BiqLeRqHZYee516b5yWz7OgvKuM0Xc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dXIAMmk6TwxPzGLtOzVCfDeruW8p2fh/wzT3wRdFQC9EssJ+Jq8K30fgBpy3b2iOdIMGQWYUOx5/nTGZc0OQVZmvzMIvQd12OxQL8JRThpXE1JjqzZ3Hr0eieziRg3uOkp+lVVM6wL4z5rYzllClkcJcRra7GFGHfdS82TCQ514=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=eyaXEYD2; arc=pass smtp.client-ip=209.85.128.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="eyaXEYD2"
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-797d6f934e2so8513637b3.0
        for <linux-clk@vger.kernel.org>; Mon, 16 Feb 2026 14:17:39 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771280259; cv=none;
        d=google.com; s=arc-20240605;
        b=EUUvV1rNd0UWICGRLfoIo1JSfbEV1ECPjJL9CdfUqfnGuFGfautPLzvhUh5nqz3zY4
         5JFV6EaqF2kzEUOGb8TWSyArePB2r0PWZ7eoIEyci6cUL5dFEhDBrYd+/kt7OlA37fWe
         suWESZAyCfc4Zv+Cv5c01WJ4sY7TyT98NLkqLr9VrnBXT1leCne2COchu2O9AxQRS18s
         KOPtLX7GMC+GmOiXuSzf+yet3XClkHdcTGufVi485zNQSQ3Z9ksNoWpG+aoPFM0fjMtA
         +dE26BCmvcd28U0y2KXfMwnyjRtSz8Tu1WDRnivLuqsPCvE5atgI2ezUUMX2RO0gwqrr
         keKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fbDbwMbQLt5XbpuHjhGQIUh0CrFsQYIf/s77CykekJo=;
        fh=dvm+0M7BfQAi2fKdBnuG0mUuHZHsHb4kUSs7sFCOTDI=;
        b=Bz3UmmAxYqFgeY48qPyTFAEsLVr5TsA0q269k28LnN6w2x7YS7saePDE4orywMc7Yw
         lK2BzVIysIpE1fWOnWWOmpQicfqql++CQnuI7EygZ9LBkao4fiGWtkeuY8xf0sbG5LdR
         nACtPH+YCjGXPqDqYgNzowA3/kXUWWc4zV3jS0IkyCqnVArF0iGTNP5mTxp6jz3RSmIK
         8T9h8zAYRUUT+WMnBLiWq1b78bjgsPW39+y2qlSNkRLJ8XwLyTRyaCDNw45QAuf7udtU
         mKqNkemH2tBgsE7crwaT81lOMu/piq7R5N2HlmJCifrVoFHsJo1NA/DCqNNfbaptdojs
         cD2g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1771280259; x=1771885059; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fbDbwMbQLt5XbpuHjhGQIUh0CrFsQYIf/s77CykekJo=;
        b=eyaXEYD2GkrFHRyULkcrQdp1nIxF0VbGixUnyEY85ca0lN8i9gltkZn1vwAZ6yeT83
         TcCyeGLIu+HW1/O4j9+6b6KkUdklHU9rlCiOrBss+vj0uuossTlrJ4HE28DMyVW+jwfu
         dPy95xMLup/+ml037pgO3cbQGo7J4fH1r6v4/OJibiWso/CiDsyYDLnD5EhzqNLhLwBf
         ygC7SdnhEDWt8hnHIyK9VKpkPA7MLehtutyiN9ivA2BwaEA7BfIhoxQzx+FO2Os3fE0G
         IXvpgz1Wqc893eM9V4vPCGYtUVMRBgHmuGwCSroHgKCaz4GJN4c85QgAEC+iLh0aZbzC
         3ikQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771280259; x=1771885059;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fbDbwMbQLt5XbpuHjhGQIUh0CrFsQYIf/s77CykekJo=;
        b=LtyrO5hjnJ953PBc01IN57o/bRjlO4Romh0M3CMmTLtOQAX3I0U+29RWbofR+G9uNv
         qRYLLdeJV3xjvSrHqyHR6Sm3d0lKrRd5MdmlVC97aMGkzL42sScnelOi2NbrKhjmiuxf
         c5uspz84DCiUcvqw0xICw+gulmy1ZWjlYzTSXT5bMrT7pa8cAERDjEUoOawuEZTG1ZGo
         cij9/c/Z9OU7a8OqBPZwqllt++i1f3jbSCzbDuFaFtmKclvrllFV0mEx1WMju4gZP6gA
         eW67KP3ULT1bldQgjoWHl5nqNtsLxEiV/bWmLdRWzJLh07Z7iYmq732jbFWZHfM8QWDH
         2sog==
X-Forwarded-Encrypted: i=1; AJvYcCVGMLb5vYUhgk64NjIJU/fohx0qK/1H3MAz3iQuZZ01AKNn1jgo4rfF9fmUO4IPURU2Scs9WYuz35U=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDb9gJH2HVrXab2Yj5+8CCMAXR7eyKGoazMMTh0iCpv338e43I
	4Iez7w81C90EaMSJhbpaUPyHZvjwErlJPvc0HCfKmSKTAESWRR0I2B94Sy1T/JaaOxngdwizXcw
	ZYfg71UkABaae+Vp0quxsW9N2KufL/GXgFUIJ4wa4eQ==
X-Gm-Gg: AZuq6aLLb1Dwho6PkziauaYKxprILLWQv1xT/lK4EZXwSpbipa99+yvG8jAxtm7MB67
	1sHRnib5ESJWRfYzUOJXXaRycmMIRE1XwXJIKl1MXL6NGtVu/guwan0fWs0Brb/FYD4zunhgwdQ
	mN5lmNfy2QcuceoxZD3IXCdeROI2pNfn1zWEET/SFKNpe3KN+1XvJ4j4w5qLlw32k6YXePxCCP6
	Qz6l+8nfeby4xT+HFAbhGn0v6guigU0mlWMdAplCYwVTJC2Cap2seDcmUp3am4K75gugY7sa/X9
	GLFI8AqB5AcqR7SGYfaAN+6yxGFPbXCgjsXQqxMmEAETYZU3fACc9xMiWrPfuHQAwItc7Q==
X-Received: by 2002:a05:690c:ed5:b0:796:312a:b817 with SMTP id
 00721157ae682-797a0c0a56amr85503357b3.9.1771280259025; Mon, 16 Feb 2026
 14:17:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260130-atlantis-clocks-v4-0-46de52d52924@oss.tenstorrent.com>
 <20260130-atlantis-clocks-v4-2-46de52d52924@oss.tenstorrent.com> <d17eaa6b5fcb22a4c06f7c36408fb919ec60b45e.camel@pengutronix.de>
In-Reply-To: <d17eaa6b5fcb22a4c06f7c36408fb919ec60b45e.camel@pengutronix.de>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Mon, 16 Feb 2026 16:17:27 -0600
X-Gm-Features: AaiRm50q4OGcgQ2WR3mQNWcX2yR9Qi1_VyUxZhZmCORJZkYdV6XOGqE6n6kyxlM
Message-ID: <CAEev2e_uMb+fSQymuNuMZvLDatCTKnHmUQ-d-PkautDjeBND+A@mail.gmail.com>
Subject: Re: [PATCH v4 2/3] reset: tenstorrent: Add reset controller for Atlantis
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, Joel Stanley <jms@oss.tenstorrent.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, joel@jms.id.au, 
	fustini@kernel.org, mpe@kernel.org, mpe@oss.tenstorrent.com, 
	npiggin@oss.tenstorrent.com, agross@kernel.org, agross@oss.tenstorrent.com, 
	bmasney@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Helo Philipp,

On Mon, Feb 2, 2026 at 8:05=E2=80=AFAM Philipp Zabel <p.zabel@pengutronix.d=
e> wrote:
>
> On Fr, 2026-01-30 at 11:50 -0600, Anirudh Srinivasan wrote:
> > Adds Atlantis Reset Controller and auxiliary device definitions for
> > reset to share same regmap interface as prcm (clock controller).
> >
> > This version of the reset controller driver covers resets from the RCPU
> > prcm.
> >
> > Signed-off-by: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
> > ---
> >  MAINTAINERS                                |   2 +
> >  drivers/reset/Kconfig                      |  11 ++
> >  drivers/reset/Makefile                     |   1 +
> >  drivers/reset/reset-tenstorrent-atlantis.c | 160 +++++++++++++++++++++=
++++++++
> >  include/soc/tenstorrent/atlantis-prcm.h    |  31 ++++++
> >  5 files changed, 205 insertions(+)
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index 0fc7bc6d0458..0cde1774567d 100644
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -22537,7 +22537,9 @@ T:    git https://github.com/tenstorrent/linux.=
git
> >  F:   Documentation/devicetree/bindings/clock/tenstorrent,atlantis-prcm=
.yaml
> >  F:   Documentation/devicetree/bindings/riscv/tenstorrent.yaml
> >  F:   arch/riscv/boot/dts/tenstorrent/
> > +F:   drivers/reset/reset-tenstorrent-atlantis.c
> >  F:   include/dt-bindings/clock/tenstorrent,atlantis-prcm.h
> > +F:   include/soc/tenstorrent/
> >
> >  RISC-V THEAD SoC SUPPORT
> >  M:   Drew Fustini <fustini@kernel.org>
> > diff --git a/drivers/reset/Kconfig b/drivers/reset/Kconfig
> > index 6e5d6deffa7d..cade77717492 100644
> > --- a/drivers/reset/Kconfig
> > +++ b/drivers/reset/Kconfig
> > @@ -324,6 +324,17 @@ config RESET_SUNXI
> >       help
> >         This enables the reset driver for Allwinner SoCs.
> >
> > +config RESET_TENSTORRENT_ATLANTIS
> > +     tristate "Tenstorrent atlantis reset driver"
> > +     depends on ARCH_TENSTORRENT || COMPILE_TEST
> > +     select AUXILIARY_BUS
> > +     default ARCH_TENSTORRENT
> > +     help
> > +       This enables the driver for the reset controller
> > +       present in the Tenstorrent Atlantis SoC.
> > +       Enable this option to be able to use hardware
> > +       resets on Atalantis based systems.
> > +
> >  config RESET_TH1520
> >       tristate "T-HEAD TH1520 reset controller"
> >       depends on ARCH_THEAD || COMPILE_TEST
> > diff --git a/drivers/reset/Makefile b/drivers/reset/Makefile
> > index 9c3e484dfd81..a31959da0a88 100644
> > --- a/drivers/reset/Makefile
> > +++ b/drivers/reset/Makefile
> > @@ -41,6 +41,7 @@ obj-$(CONFIG_RESET_SOCFPGA) +=3D reset-socfpga.o
> >  obj-$(CONFIG_RESET_SPACEMIT) +=3D reset-spacemit.o
> >  obj-$(CONFIG_RESET_SUNPLUS) +=3D reset-sunplus.o
> >  obj-$(CONFIG_RESET_SUNXI) +=3D reset-sunxi.o
> > +obj-$(CONFIG_RESET_TENSTORRENT_ATLANTIS) +=3D reset-tenstorrent-atlant=
is.o
> >  obj-$(CONFIG_RESET_TH1520) +=3D reset-th1520.o
> >  obj-$(CONFIG_RESET_TI_SCI) +=3D reset-ti-sci.o
> >  obj-$(CONFIG_RESET_TI_SYSCON) +=3D reset-ti-syscon.o
> > diff --git a/drivers/reset/reset-tenstorrent-atlantis.c b/drivers/reset=
/reset-tenstorrent-atlantis.c
> > new file mode 100644
> > index 000000000000..6fe9143ad76c
> > --- /dev/null
> > +++ b/drivers/reset/reset-tenstorrent-atlantis.c
> > @@ -0,0 +1,160 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Tenstorrent Atlantis PRCM Reset Driver
> > + *
> > + * Copyright (c) 2026 Tenstorrent
> > + */
> > +
> > +#include <dt-bindings/clock/tenstorrent,atlantis-prcm.h>
> > +#include <linux/auxiliary_bus.h>
> > +#include <linux/reset-controller.h>
> > +#include <linux/regmap.h>
> > +#include <soc/tenstorrent/atlantis-prcm.h>
> > +
> > +struct atlantis_reset_data {
> > +     u8 bit;
> > +     u16 reg;
> > +     bool active_low;
> > +};
> > +
> > +struct atlantis_reset_controller_data {
> > +     const struct atlantis_reset_data *reset_data;
> > +     size_t count;
> > +};
> > +
> > +struct atlantis_reset_controller {
> > +     struct reset_controller_dev rcdev;
> > +     const struct atlantis_reset_controller_data *data;
> > +     struct regmap *regmap;
> > +};
> > +
> > +#define to_atlantis_reset_controller(_rcdev) \
> > +     container_of((_rcdev), struct atlantis_reset_controller, rcdev)
>
> Please make this an inline function as well. With that,
>
> Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>

I've made some non-trivial changes to the reset driver in v6 based on
some comments I received in v5, so I have dropped your Rb tag.


>
> Since this patch both depends on patch 1 and is a dependency for patch
> 3, I suppose this should go through the clock tree.
>
> regards
> Philipp
