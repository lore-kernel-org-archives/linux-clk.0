Received: from mail-wr2-f15.google.com (mail-wr2-f15.google.com [74.125.225.79])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBF0A25A2A2
	for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 15:19:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.79
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789744767; cv=pass; b=XdzmirJIlRUlkutdGPcpHnqhzh8Lnukd5v7cc/lUS8ZOEw4lvpMNz6eR81Ge/hAvL7CEHwmC7jX0eD0m0tIhsnfk8Tab4UI84QXvIr/uLqo91/zJ4nzVUoTW72a3GLapqV9F03zh7JuOGBvEmXe7LM3jt5jKuvA/rpmMCCN5+lc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789744767; c=relaxed/simple;
	bh=M4aq4A/LbcJULhQnFbEd+W9HD0oCATJZRy1jAmuOm6M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fsEd0NQCf4r5xy2jXrhfzQPtWeW8QyDxIiYdIkAzTI4an4YmW2OJPtN7CN8tgxd0Lm10HYlIPyzdHv1QL7JoSHY9rAlSXdcDC/7pahGYfk/MtuoHZ95Ong1irrtjvq8qKqHb6bOKzUJiA/FtaOonVekWroJJWRlCEi2Y5gBBqVs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d8/kRNOV; arc=pass smtp.client-ip=74.125.225.79
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d8/kRNOV"
Received: by mail-wr2-f15.google.com with SMTP id ffacd0b85a97d-482f633ecdeso827086f8f.2
        for <linux-clk@vger.kernel.org>; Fri, 18 Sep 2026 08:19:25 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789744764; cv=none;
        d=google.com; s=arc-20260327;
        b=eLi5R8qqbrJUETvcxNGxWs2U5fegJsVQurx+70Mr+aOK7+2N1kg12UWGIaZ+WXZQiE
         Y1CRKZ6iod016Lxvbzfy2uQI2KYpctULjb32ZQTTKTWfS08eqDOrPythRg5mhUh7lSgd
         9W6czdH4MxggLXqSXUSBH6xxO2wt3H4wIY9GJu8aObT8iuTmNf6Pdug2JRUeFwx4bwSJ
         4gK5EuPz1foikjRRgRkHttZLfsSzvCDE3iXeosCxgLnoNud2lCSvssoQ+7J67a5wUSBG
         1UIv+BrlL2lQ8zhU3v35DDaaYfDY9BB3MvrzdrMcX7TlpTz85148bntItSbRxfJ5WMJP
         m3zQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=32wpeurSi9/AJaqP3qp1V3FWvCN+eDyCm+NAKdXRSJE=;
        fh=j6Cn5fBH/6xrZlpcbyujZd8HK7x6IhcxKxTxXFXyxbw=;
        b=CWLt3E3j0v1X5OWrbEx36f6SaiM/edbLn8ilqJ1oddZgb9jVqTLJ2TzdPly/zgfpHP
         PDaODoLGS0DWEmfZWLVZ6Npcefzhpi/C2XlR73sKOYhWYllSAAgH9ExjRBtqernavG9+
         DZ9/9QXYPsTBFVHUUeFLYrOxlbcMpidKHCngs21h/GC3KV+cJhhbqZqqAsFmzqJ2QNHK
         i4zc1KBDf2lFUrsptxnhnl0GltVf/YtMiuuFLA1PauTtroy3sGpDTDxD3wlF9vkHDSmD
         IMwLKKmDu3CLyrDGseBxkuoz6CqoaC37oj1RtX6vH2bEyWvFhUmEdpHpTSRZFcsyuOPz
         y5yA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789744764; x=1790349564; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=32wpeurSi9/AJaqP3qp1V3FWvCN+eDyCm+NAKdXRSJE=;
        b=d8/kRNOVBe/EMM66/k/ErzdM21GRBW/DSIYwo9HitktKOmuBa8tQET332kM9FW4AO4
         HdZ5pgLP2oruPmiXfuD65L+HT1Kf/R5urr3VGe+AvoJeqKQczi46UzcZUnz2w4zRjldn
         9jjPdCR0LrUgbWONczHyAOfVAROjHX0xDJ+WORVMVLfJ9uv1+5FkSEEWir0kKjKkAhLG
         S0P4Ob2v5VSN9CzUBaUJce8cqonq4ESQUuALvW8s8uas/FgnDiNQP3D0RCOEjosbat9g
         SN9wtydJ5p9H3ZDufoW+jPtLVn5YrclB1PZbTEKZMWueY7fvjLvTAeBlanqIdiorHXfV
         X1ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789744764; x=1790349564;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=32wpeurSi9/AJaqP3qp1V3FWvCN+eDyCm+NAKdXRSJE=;
        b=clk25hWDfNVGt4ch51NE8G7zTb36JeHCpeolISnxyywVuZzvrKZ2NygyzVxI1E3r3b
         dhz/ZdWovAypAZ78EwrrHtR66qXmxnT96rR2gD5KgCYBfVdpgPrQhKLg3GBcllprZnLL
         8w+G8YVgTZZNthG0e/DD/qpy0uzbYW9NRXR2Uqmb2aSI9gdDN1AiGoMmCQ2/Lfh3gAJ0
         8VwanENccjxs2SOB1LBjlmmTpKI8AqUU0e2Bnuw4B4UBLGtSGcPbaAQU8jP4+xjHb/eQ
         NQN5FHWDD5HC2qLYLRdb45yaNnC1B5de7hH7WTOY4l8L5tBTwH+nXTxpGaXtPYb9WW+K
         e5aw==
X-Forwarded-Encrypted: i=1; AKwUvBzVcF7IetGYowoug11X6h/tP3HaYLIHujsYYnKXFkQ/GPMFGogS1H/cOCNbGxNVcADJUjvvTVQmT7M=@vger.kernel.org
X-Gm-Message-State: AFuF++mnztXhhx6Gg0cywVoNDgaL4/Kaerll3ZUiB/y5Hs7qxpHYMi5p
	OpzBMFoJRouP37SEwIB+E55PlL/XTwuaMAhi+QQ6NHSi9h6vCrbno5jZmqxmDHbXhdWEnVyIHXG
	FwFg8zuXxM/wfedHqDEi9xldvLJq9uHo=
X-Gm-Gg: AYBFou3v00wLON4v1Ro4eth6fYenACEBkLYBbR5tOzMZe6aHT1zvT0rZ1DQylrOTJ3i
	EgcBTVD9wW4r3vDOqbpHx730rfhGHTNIoYZmuxqYxKW9+XfM0TkDfyPw1kuF3j5O1yhn15eeits
	Ju/liSkD+Pq2hgUkrWKEfK+y6dGUZ6jccVVC7gndY7ktgU502+f5a30XW9eM+Vn28545+wLm/ny
	zYynxMpQsjibNLP2qbpOKO5uTr3HhqZ+3/OievBBc6bdVIH8NzfstvdiQnE1hOvNkldegmya1N2
	3rSxeyoyQXwnfs7JPGMRLVVwfbFcMrC/LvNObCU14XKiWX5MZFiJNmtJVrp0SI8GC5YL/fi/CPm
	OEmh/vtmedbtOStin/vx/WLXv1JEPS+CWRJW4JBo26rU=
X-Received: by 2002:a05:6000:2407:b0:487:956:7e97 with SMTP id
 ffacd0b85a97d-4871e2341f6mr4183772f8f.25.1789744763605; Fri, 18 Sep 2026
 08:19:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817192540.423994-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260817192540.423994-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <87577cdb-7f1d-4a9f-8a61-ff1f272234d9@roeck-us.net>
In-Reply-To: <87577cdb-7f1d-4a9f-8a61-ff1f272234d9@roeck-us.net>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Fri, 18 Sep 2026 16:18:56 +0100
X-Gm-Features: AcwNN1U3hCdCxEGahTYWyhMlJW9-v5H9ysCq3io2__9dNvGl-uwLBemrbsMvbK8
Message-ID: <CA+V-a8vVtjALarck6PE3it1si2hNbveZWoGjTaTUW68Q6yYjcQ@mail.gmail.com>
Subject: Re: [PATCH v4 5/7] watchdog: rzv2h: Add syscon support for WDTDCR
To: Guenter Roeck <linux@roeck-us.net>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Prabhakar <prabhakar.csengg+renesas@gmail.com>, 
	Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

On Thu, Sep 17, 2026 at 2:12=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> Hi,
>
> On Mon, Aug 17, 2026 at 08:25:38PM +0100, Prabhakar wrote:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > On RZ/T2H and RZ/N2H SoCs, the WDTDCR (WDT Debug Control Register) resi=
des
> > in the second register region of the CPG/MSSR block. Since this
> > multi-function block is shared with other peripherals, it is exposed vi=
a a
> > syscon regmap interface.
> >
> > Look up the SYSC regmap using the optional "renesas,sysc" property and
> > derive the WDTDCR offset from the watchdog instance index.
> >
> > Retain the existing MMIO-based access method when the "renesas,sysc"
> > property is absent to preserve compatibility with existing DT's.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Can I apply this patch without the other patches of the series ?
>
I posted the v5 series here addressing Sashiko's comments.

https://lore.kernel.org/all/20260911111731.3404308-1-prabhakar.mahadev-lad.=
rj@bp.renesas.com/

Cheers,
Prabhakar

> Thanks,
> Guenter
>
> > ---
> > v3->v4:
> > - No change
> >
> > v2->v3:
> > - Made use of the new "renesas,sysc" phandle-array property to access t=
he
> >   WDTDCR register via the CPG/MSSR syscon node.
> > - Updated commit message
> >
> > v1->v2:
> > - No change.
> > ---
> >  drivers/watchdog/Kconfig     |  1 +
> >  drivers/watchdog/rzv2h_wdt.c | 56 +++++++++++++++++++++++++++++-------
> >  2 files changed, 46 insertions(+), 11 deletions(-)
> >
> > diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
> > index f7d0a0c2c0ef..3c4fc9916d8c 100644
> > --- a/drivers/watchdog/Kconfig
> > +++ b/drivers/watchdog/Kconfig
> > @@ -1046,6 +1046,7 @@ config RENESAS_RZV2HWDT
> >       depends on ARCH_RENESAS || COMPILE_TEST
> >       depends on PM || COMPILE_TEST
> >       select WATCHDOG_CORE
> > +     select MFD_SYSCON
> >       help
> >         This driver adds watchdog support for the integrated watchdogs =
in the
> >         Renesas RZ/{G3E,V2H(P)} SoCs. These watchdogs can be used to re=
set a
> > diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.=
c
> > index 8af2f33b5680..04ea962da837 100644
> > --- a/drivers/watchdog/rzv2h_wdt.c
> > +++ b/drivers/watchdog/rzv2h_wdt.c
> > @@ -8,6 +8,7 @@
> >  #include <linux/delay.h>
> >  #include <linux/io.h>
> >  #include <linux/kernel.h>
> > +#include <linux/mfd/syscon.h>
> >  #include <linux/module.h>
> >  #include <linux/of.h>
> >  #include <linux/platform_device.h>
> > @@ -44,6 +45,11 @@
> >
> >  #define WDT_DEFAULT_TIMEOUT  60U
> >
> > +#define RZT2H_WDT_MAX_INSTANCES      6
> > +
> > +#define RZT2H_SYS_BLOCK1(n)  (BIT(16) | (0x5100 + (n) * 4))
> > +#define RZT2H_WDTDCR_OFFSET(n)       RZT2H_SYS_BLOCK1(n)
> > +
> >  static bool nowayout =3D WATCHDOG_NOWAYOUT;
> >  module_param(nowayout, bool, 0);
> >  MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (d=
efault=3D"
> > @@ -64,14 +70,19 @@ struct rzv2h_of_data {
> >       bool wdtdcr;
> >  };
> >
> > +struct rzv2h_sysc_wdtdcr {
> > +     struct regmap *regmap;
> > +     unsigned int offset;
> > +};
> > +
> >  struct rzv2h_wdt_priv {
> >       void __iomem *base;
> > -     struct regmap *wdtdcr_regmap;
> >       struct clk *pclk;
> >       struct clk *oscclk;
> >       struct reset_control *rstc;
> >       struct watchdog_device wdev;
> >       const struct rzv2h_of_data *of_data;
> > +     struct rzv2h_sysc_wdtdcr sysc;
> >  };
> >
> >  static int rzv2h_wdt_ping(struct watchdog_device *wdev)
> > @@ -90,12 +101,16 @@ static int rzv2h_wdt_ping(struct watchdog_device *=
wdev)
> >
> >  static int rzt2h_wdt_wdtdcr_count_stop(struct rzv2h_wdt_priv *priv)
> >  {
> > -     return regmap_set_bits(priv->wdtdcr_regmap, WDTDCR, WDTDCR_WDTSTO=
PCTRL);
> > +     struct rzv2h_sysc_wdtdcr *sysc =3D &priv->sysc;
> > +
> > +     return regmap_set_bits(sysc->regmap, sysc->offset, WDTDCR_WDTSTOP=
CTRL);
> >  }
> >
> >  static int rzt2h_wdt_wdtdcr_count_start(struct rzv2h_wdt_priv *priv)
> >  {
> > -     return regmap_clear_bits(priv->wdtdcr_regmap, WDTDCR, WDTDCR_WDTS=
TOPCTRL);
> > +     struct rzv2h_sysc_wdtdcr *sysc =3D &priv->sysc;
> > +
> > +     return regmap_clear_bits(sysc->regmap, sysc->offset, WDTDCR_WDTST=
OPCTRL);
> >  }
> >
> >  static void rzv2h_wdt_setup(struct watchdog_device *wdev, u16 wdtcr)
> > @@ -284,17 +299,36 @@ static const struct regmap_config rzv2h_wdtdcr_re=
gmap_config =3D {
> >  static int rzt2h_wdt_wdtdcr_init(struct platform_device *pdev,
> >                                struct rzv2h_wdt_priv *priv)
> >  {
> > -     void __iomem *wdtdcr;
> > +     struct device_node *np =3D pdev->dev.of_node;
> > +     bool syscon_present =3D of_property_present(np, "renesas,sysc");
> > +     struct rzv2h_sysc_wdtdcr *sysc =3D &priv->sysc;
> >       int ret;
> >
> > -     wdtdcr =3D devm_platform_ioremap_resource(pdev, 1);
> > -     if (IS_ERR(wdtdcr))
> > -             return PTR_ERR(wdtdcr);
> > +     if (syscon_present) {
> > +             unsigned int wdt_index;
> >
> > -     priv->wdtdcr_regmap =3D devm_regmap_init_mmio(&pdev->dev, wdtdcr,
> > -                                                 &rzv2h_wdtdcr_regmap_=
config);
> > -     if (IS_ERR(priv->wdtdcr_regmap))
> > -             return PTR_ERR(priv->wdtdcr_regmap);
> > +             sysc->regmap =3D syscon_regmap_lookup_by_phandle_args(np,=
 "renesas,sysc",
> > +                                                                 1, &w=
dt_index);
> > +             if (IS_ERR(sysc->regmap))
> > +                     return PTR_ERR(sysc->regmap);
> > +
> > +             if (wdt_index >=3D RZT2H_WDT_MAX_INSTANCES)
> > +                     return -EINVAL;
> > +
> > +             sysc->offset =3D RZT2H_WDTDCR_OFFSET(wdt_index);
> > +     } else {
> > +             void __iomem *wdtdcr;
> > +
> > +             wdtdcr =3D devm_platform_ioremap_resource(pdev, 1);
> > +             if (IS_ERR(wdtdcr))
> > +                     return PTR_ERR(wdtdcr);
> > +
> > +             sysc->regmap =3D devm_regmap_init_mmio(&pdev->dev, wdtdcr=
,
> > +                                                  &rzv2h_wdtdcr_regmap=
_config);
> > +             if (IS_ERR(sysc->regmap))
> > +                     return PTR_ERR(sysc->regmap);
> > +             sysc->offset =3D WDTDCR;
> > +     }
> >
> >       ret =3D pm_runtime_resume_and_get(&pdev->dev);
> >       if (ret)
