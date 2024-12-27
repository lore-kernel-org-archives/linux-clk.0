Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1783127447
	for <linux-clk@vger.kernel.org>; Fri, 27 Dec 2024 03:43:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735271013; cv=none; b=ZPJTiQAbSg49wuDAQo7n+gRMEX0eRicLmqdNkAIScuV7I8j7kICU0pitzuF5HJ8fGo+whBxHnzi3hH+ZVxtP8snI7nR0V3DSMUkp8LEwql/BD+FYU4wwahYhBqhR8ZVb2kiS/AcTiXIRodPRpepihctugZPpU0IstDlScIbUB0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735271013; c=relaxed/simple;
	bh=S9visI6bqrSMYytUPX56cwqpl2uKaSdXw2NK9vqbRnQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cFQkTo11rJBoRtR6gJkCNx+/uzCTf89R0xaBsF227eeD19/NHFBvzuCbZaUhn/QV/4OcBrk2O3D8i5GU83mE+KTJehZSzIMVCUm0BNb74Dx3nW2/ScxpqHGRNcFbYDb+zXBb/12S/XV3QMlqAfuBBMkDMymT3+eqOWxl+8erkuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=nOZTAZgx; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="nOZTAZgx"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-2f42992f608so6599248a91.0
        for <linux-clk@vger.kernel.org>; Thu, 26 Dec 2024 19:43:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1735271009; x=1735875809; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E2jZqWLTNHFNaI41cZgqbK1vC1in57m0z7/Rrqs7BNQ=;
        b=nOZTAZgxRClGDpghYPMlM0q6sx5sx+JNFFSA3YZSZA02EQLY1LcoN6vAMbEohDpBME
         eC9r8gOsUCspubqLI2uQbFN2weC5DufmUhIUZhOLPhjRAMkYi8TtSdj2LeXcJdXa49fT
         +N0+vVjysfRm5rshU/mLoO+6usg8d0jpODAQGU2RWWOQkMJCJoR3sg574bM2YvBD3ooB
         nsd4JY0+oMSCDJv2BRWKva1+Ewi+Ed3dFOi41NWXw1SOFYYpwSWzBns6n8vEPoGz/TF1
         T1uDe3RlZjQFV9415PmMW0rzrl452zUzfbhSB6Ybw2M38r2ejN7AhR6l8XwGyfDTilKo
         6SYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735271009; x=1735875809;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E2jZqWLTNHFNaI41cZgqbK1vC1in57m0z7/Rrqs7BNQ=;
        b=heS584tLJ4kvO6mIQTe1JaJtPw2Cfkm1vB9Sg7oAvb/RfvVBdsSh9R8djpi4aN7jaB
         bDcFKIAKuxkupb3CpmkaO21JmAFyjX4nYJQniT7OB96UeeaMdjtOOoGeiToRGB0DpwlN
         lxoN2lwBy3d1QaEHUNpXOfgvGZJCnPnoXMtQoQGFmmc28fOosmpjY08uLMJuS4CxkWuT
         wZcgkWB9CxW1teMeM3Fpkiv0k5ook/UyawK2DLV2iRXS3hyhB09JRH82UIYrx62GtRWL
         QY8uQlWF0KVcd80KOCLW1JLqetq3MHvMI3lsoLRYoC1XyYFj7bJbVQfYSlMnClA+p6Bc
         i/yw==
X-Forwarded-Encrypted: i=1; AJvYcCWAMsOhlZCtYeHiavo/0CkZAq2yNgAxuxVnTKIw7fko32GjUOUpw3DGxtYGJa/47my96Jg1cVgtY8k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzEMSRoso8jOMg4VvW0aA+BeqGGjqJFN4wFqBIdukJjG6z1anzf
	yr/352BcLXKGgkcK/W0A8/m6zoPwznkDGvfVjPXjM5fnAMrRiCi0lVnQWahNkXhWIe2c2DaaHmQ
	/ifNpWAHLLtimGM+SPvQrNHRbMD6n1fP+b/fSFA==
X-Gm-Gg: ASbGncuAs9iquWMWBsfQikfi+4/PsLOWgFG2paLS0eExgrJop0EVRk9egXDuUlQB6e3
	+NJF0e54gMvpinS4P8rAjbkX2cl3UaBb7WaivIJIqgvJEvBQYrJZZhMuYKOjxdU8E+jPz+g==
X-Google-Smtp-Source: AGHT+IH0YCO9g9o3jnAJ5Sp7HBIHYKUJI0Fshys8zGMaVrPHwkis+oYMBy0uSjgaDEWP712wjIJcWt94Zyk1OyW/nPo=
X-Received: by 2002:a17:90a:fc48:b0:2ee:8e75:4aeb with SMTP id
 98e67ed59e1d1-2f452e49238mr39430381a91.17.1735271009382; Thu, 26 Dec 2024
 19:43:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216084817.373131-1-apatel@ventanamicro.com>
 <20241216084817.373131-9-apatel@ventanamicro.com> <ZQZPR01MB0979D745074A662620993C668A03A@ZQZPR01MB0979.CHNPR01.prod.partner.outlook.cn>
In-Reply-To: <ZQZPR01MB0979D745074A662620993C668A03A@ZQZPR01MB0979.CHNPR01.prod.partner.outlook.cn>
From: Rahul Pathak <rpathak@ventanamicro.com>
Date: Fri, 27 Dec 2024 09:12:53 +0530
Message-ID: <CA+Oz1=Y9oyVdPaAnFP0zFVrYS-cp7WrAYerd1cDH_fSr98sfMw@mail.gmail.com>
Subject: Re: [RFC PATCH 8/8] clk: Add clock driver for the RISC-V RPMI clock
 service group
To: Leyfoon Tan <leyfoon.tan@starfivetech.com>
Cc: Anup Patel <apatel@ventanamicro.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Sunil V L <sunilvl@ventanamicro.com>, 
	Atish Patra <atishp@atishpatra.org>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Leyfoon,

On Tue, Dec 24, 2024 at 11:50=E2=80=AFAM Leyfoon Tan
<leyfoon.tan@starfivetech.com> wrote:
>
>
>
> > -----Original Message-----
> > From: Anup Patel <apatel@ventanamicro.com>
> > Sent: Monday, December 16, 2024 4:48 PM
> > To: Michael Turquette <mturquette@baylibre.com>; Stephen Boyd
> > <sboyd@kernel.org>; Rob Herring <robh@kernel.org>; Krzysztof Kozlowski
> > <krzk+dt@kernel.org>; Conor Dooley <conor+dt@kernel.org>; Jassi Brar
> > <jassisinghbrar@gmail.com>
> > Cc: Palmer Dabbelt <palmer@dabbelt.com>; Paul Walmsley
> > <paul.walmsley@sifive.com>; Sunil V L <sunilvl@ventanamicro.com>; Rahul
> > Pathak <rpathak@ventanamicro.com>; Leyfoon Tan
> > <leyfoon.tan@starfivetech.com>; Atish Patra <atishp@atishpatra.org>;
> > Andrew Jones <ajones@ventanamicro.com>; Anup Patel
> > <anup@brainfault.org>; linux-clk@vger.kernel.org;
> > devicetree@vger.kernel.org; linux-riscv@lists.infradead.org; linux-
> > kernel@vger.kernel.org; Anup Patel <apatel@ventanamicro.com>
> > Subject: [RFC PATCH 8/8] clk: Add clock driver for the RISC-V RPMI cloc=
k
> > service group
> >
> > From: Rahul Pathak <rpathak@ventanamicro.com>
> >
> > The RPMI specification defines a clock service group which can be acces=
sed via
> > SBI MPXY extension or dedicated S-mode RPMI transport.
> >
> > Add mailbox client based clock driver for the RISC-V RPMI clock service=
 group.
> >
> > Co-developed-by: Anup Patel <apatel@ventanamicro.com>
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > Signed-off-by: Rahul Pathak <rpathak@ventanamicro.com>
> > ---
>
>
> >  obj-y                                        +=3D actions/
> > diff --git a/drivers/clk/clk-rpmi.c b/drivers/clk/clk-rpmi.c new file m=
ode
> > 100644 index 000000000000..ed8e32527d3d
> > --- /dev/null
> > +++ b/drivers/clk/clk-rpmi.c
> > @@ -0,0 +1,588 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * RISC-V MPXY Based Clock Driver
> > + *
> > + * Copyright (C) 2024 Ventana Micro Systems Ltd.
> > + */
> > +
> > +#include <linux/io.h>
> > +#include <linux/mm.h>
> > +#include <linux/of.h>
> > +#include <linux/err.h>
> > +#include <linux/slab.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/mailbox/riscv-rpmi-message.h>
> > +#include <linux/mailbox_client.h>
> > +#include <linux/module.h>
> > +#include <linux/of_platform.h>
> > +#include <linux/clk-provider.h>
>
> Sorting header files in alphabetical order.

Already taken care of. also removed which are not needed.
>
> > +
> > +#define RPMI_CLK_MAX_NUM_RATES               16
> This macro only used for discrete clocks, so suggest change to RPMI_CLK_M=
AX_DISCRETE_NUM_RATES.
> Is 16 too few?

I will change the name. We can keep 16 for now and
may change later if we find this insufficient.

>
> > +#define RPMI_CLK_NAME_LEN            16
> > +
> > +#define GET_RATE_LO_U32(rate_u64)    ((u32)rate_u64)
> > +#define GET_RATE_HI_U32(rate_u64)    ((u32)((u64)(rate_u64) >> 32))
> > +#define GET_RATE_U64(hi_u32, lo_u32) ((u64)(hi_u32) << 32 |
> > (lo_u32))
> > +
> > +enum rpmi_clk_config {
> > +     RPMI_CLK_DISABLE =3D 0,
> > +     RPMI_CLK_ENABLE =3D 1,
> > +};
> > +
>
> [...]
>
> > +static int rpmi_clk_get_supported_rates(u32 clkid, struct rpmi_clk
> > +*rpmi_clk) {
> > +     struct rpmi_clk_context *context =3D rpmi_clk->context;
> > +     struct rpmi_get_supp_rates_tx tx;
> > +     struct rpmi_get_supp_rates_rx rx;
> > +     struct rpmi_mbox_message msg;
> > +     size_t clk_rate_idx =3D 0;
> > +     int ret, rateidx, j;
> > +
> > +     tx.clkid =3D cpu_to_le32(clkid);
> > +     tx.clk_rate_idx =3D 0;
> > +
> > +     rpmi_mbox_init_send_with_response(&msg,
> > RPMI_CLK_SRV_GET_SUPPORTED_RATES,
> > +                                       &tx, sizeof(tx), &rx, sizeof(rx=
));
> > +     ret =3D rpmi_mbox_send_message(context->chan, &msg);
> > +     if (ret)
> > +             return ret;
> > +     if (rx.status)
> > +             return rpmi_to_linux_error(rx.status);
> > +     if (!rx.returned)
> > +             return -EINVAL;
> > +
> > +     if (rpmi_clk->type =3D=3D RPMI_CLK_DISCRETE) {
> > +             for (rateidx =3D 0; rateidx < rx.returned; rateidx++) {
>
> Need to check RPMI_CLK_MAX_NUM_RATES limit as well.

Sure, i will update

>
> > +                     rpmi_clk->rates->discrete[rateidx] =3D
> > +
> >       GET_RATE_U64(rx.rates.discrete[rateidx].hi,
> > +
> > rx.rates.discrete[rateidx].lo);
> > +             }
> > +
> > +             while (rx.remaining) {
> > +                     clk_rate_idx +=3D rx.returned;
> > +                     tx.clk_rate_idx =3D clk_rate_idx;
> > +
> > +                     rpmi_mbox_init_send_with_response(&msg,
> > +
> > RPMI_CLK_SRV_GET_SUPPORTED_RATES,
> > +                                                       &tx, sizeof(tx)=
, &rx,
> > sizeof(rx));
> > +                     ret =3D rpmi_mbox_send_message(context->chan,
> > &msg);
> > +                     if (ret)
> > +                             return ret;
>
> Need check if (rx.status) here?

Sure, i will update

>
> > +
> > +                     for (j =3D 0; j < rx.returned; j++) {
> Same here, check RPMI_CLK_MAX_NUM_RATES.

Sure, i will update

>
> > +                             if (rateidx >=3D (clk_rate_idx + rx.retur=
ned))
> > +                                     break;
> > +                             rpmi_clk->rates->discrete[rateidx++] =3D
> > +                                     GET_RATE_U64(rx.rates.discrete[j]=
.hi,
> > +                                                  rx.rates.discrete[j]=
.lo);
> > +                     }
> > +             }
> > +     } else if (rpmi_clk->type =3D=3D RPMI_CLK_LINEAR) {
> > +             rpmi_clk->rates->linear.min =3D
> > +                             GET_RATE_U64(rx.rates.linear.min_hi,
> > +                                          rx.rates.linear.min_lo);
> > +             rpmi_clk->rates->linear.max =3D
> > +                             GET_RATE_U64(rx.rates.linear.max_hi,
> > +                                          rx.rates.linear.max_lo);
> > +             rpmi_clk->rates->linear.step =3D
> > +                             GET_RATE_U64(rx.rates.linear.step_hi,
> > +                                          rx.rates.linear.step_lo);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> > +static unsigned long rpmi_clk_recalc_rate(struct clk_hw *hw,
> > +                                       unsigned long parent_rate)
> > +{
> > +     struct rpmi_clk *rpmi_clk =3D to_rpmi_clk(hw);
> > +     struct rpmi_clk_context *context =3D rpmi_clk->context;
> > +     struct rpmi_mbox_message msg;
> > +     struct rpmi_get_rate_tx tx;
> > +     struct rpmi_get_rate_rx rx;
> > +     int ret;
> > +
> > +     tx.clkid =3D cpu_to_le32(rpmi_clk->id);
> > +
> > +     rpmi_mbox_init_send_with_response(&msg,
> > RPMI_CLK_SRV_GET_RATE,
> > +                                       &tx, sizeof(tx), &rx, sizeof(rx=
));
> > +     ret =3D rpmi_mbox_send_message(context->chan, &msg);
> > +     if (ret)
> > +             return ret;
> > +     if (rx.status)
> > +             return rx.status;
> > +
> > +     return GET_RATE_U64(rx.hi, rx.lo);
> > +}
> > +
> > +static long rpmi_clk_round_rate(struct clk_hw *hw,
> > +                             unsigned long rate,
> > +                             unsigned long *parent_rate)
> > +{
> > +     struct rpmi_clk *rpmi_clk =3D to_rpmi_clk(hw);
> > +     u64 fmin, fmax, ftmp;
> > +
> > +     if (rpmi_clk->type =3D=3D RPMI_CLK_DISCRETE)
> > +             return rate;
> > +
> > +     fmin =3D rpmi_clk->rates->linear.min;
> > +     fmax =3D rpmi_clk->rates->linear.max;
> > +
> > +     if (rate <=3D fmin)
> > +             return fmin;
> > +     else if (rate >=3D  fmax)
> > +             return fmax;
> > +
> > +     ftmp =3D rate - fmin;
> > +     ftmp +=3D rpmi_clk->rates->linear.step - 1;
> > +     do_div(ftmp, rpmi_clk->rates->linear.step);
> > +
> > +     return ftmp * rpmi_clk->rates->linear.step + fmin; }
> > +
> > +static int rpmi_clk_set_rate(struct clk_hw *hw, unsigned long rate,
> > +                          unsigned long parent_rate)
> > +{
> > +     struct rpmi_clk *rpmi_clk =3D to_rpmi_clk(hw);
> > +     struct rpmi_clk_context *context =3D rpmi_clk->context;
> > +     struct rpmi_mbox_message msg;
> > +     struct rpmi_set_rate_tx tx;
> > +     struct rpmi_set_rate_rx rx;
> > +     int ret;
> > +
> > +     tx.clkid =3D cpu_to_le32(rpmi_clk->id);
> > +     tx.lo =3D cpu_to_le32(GET_RATE_LO_U32(rate));
> > +     tx.hi =3D cpu_to_le32(GET_RATE_HI_U32(rate));
> > +
> > +     rpmi_mbox_init_send_with_response(&msg,
> > RPMI_CLK_SRV_SET_RATE,
> > +                                       &tx, sizeof(tx), &rx, sizeof(rx=
));
> > +     ret =3D rpmi_mbox_send_message(context->chan, &msg);
> > +     if (ret)
> > +             return ret;
> > +     if (rx.status)
> > +             return rpmi_to_linux_error(rx.status);
> > +
> > +     return 0;
> > +}
> > +
> > +static int rpmi_clk_enable(struct clk_hw *hw) {
> > +     struct rpmi_clk *rpmi_clk =3D to_rpmi_clk(hw);
> > +     struct rpmi_clk_context *context =3D rpmi_clk->context;
> > +     struct rpmi_mbox_message msg;
> > +     struct rpmi_set_config_tx tx;
> > +     struct rpmi_set_config_rx rx;
> > +     int ret;
> > +
> > +     tx.config =3D cpu_to_le32(RPMI_CLK_ENABLE);
> > +     tx.clkid =3D cpu_to_le32(rpmi_clk->id);
> > +
> > +     rpmi_mbox_init_send_with_response(&msg,
> > RPMI_CLK_SRV_SET_CONFIG,
> > +                                       &tx, sizeof(tx), &rx, sizeof(rx=
));
> > +     ret =3D rpmi_mbox_send_message(context->chan, &msg);
> > +     if (ret)
> > +             return ret;
> > +     if (rx.status)
> > +             return rpmi_to_linux_error(rx.status);
> > +
> > +     return 0;
> > +}
> > +
> > +static void rpmi_clk_disable(struct clk_hw *hw) {
> > +     struct rpmi_clk *rpmi_clk =3D to_rpmi_clk(hw);
> > +     struct rpmi_clk_context *context =3D rpmi_clk->context;
> > +     struct rpmi_mbox_message msg;
> > +     struct rpmi_set_config_tx tx;
> > +     struct rpmi_set_config_rx rx;
> > +     int ret;
> > +
> > +     tx.config =3D cpu_to_le32(RPMI_CLK_DISABLE);
> > +     tx.clkid =3D cpu_to_le32(rpmi_clk->id);
> > +
> > +     rpmi_mbox_init_send_with_response(&msg,
> > RPMI_CLK_SRV_SET_CONFIG,
> > +                                       &tx, sizeof(tx), &rx, sizeof(rx=
));
> > +     ret =3D rpmi_mbox_send_message(context->chan, &msg);
> > +     if (ret || rx.status)
> > +             pr_err("Failed to disable clk-%u\n", rpmi_clk->id); }
> > +
> > +static const struct clk_ops rpmi_clk_ops =3D {
> > +     .recalc_rate =3D rpmi_clk_recalc_rate,
> > +     .round_rate =3D rpmi_clk_round_rate,
> > +     .set_rate =3D rpmi_clk_set_rate,
> > +     .prepare =3D rpmi_clk_enable,
> > +     .unprepare =3D rpmi_clk_disable,
> > +};
> > +
> > +static struct clk_hw *rpmi_clk_enumerate(struct rpmi_clk_context
> > +*context, u32 clkid) {
> > +     struct device *dev =3D context->dev;
> > +     unsigned long min_rate, max_rate;
> > +     union rpmi_clk_rates *rates;
> > +     struct rpmi_clk *rpmi_clk;
> > +     struct clk_init_data init;
> > +     struct clk_hw *clk_hw;
> > +     int ret;
> > +
> > +     rates =3D devm_kzalloc(dev, sizeof(union rpmi_clk_rates), GFP_KER=
NEL);
> > +     if (!rates)
> > +             return ERR_PTR(-ENOMEM);
> > +
> > +     rpmi_clk =3D devm_kzalloc(dev, sizeof(struct rpmi_clk), GFP_KERNE=
L);
> > +     if (!rpmi_clk)
> > +             return ERR_PTR(-ENOMEM);
> > +     rpmi_clk->context =3D context;
> > +     rpmi_clk->rates =3D rates;
> > +
> > +     ret =3D rpmi_clk_get_attrs(clkid, rpmi_clk);
> > +     if (ret) {
> > +             dev_err(dev, "Failed to get clk-%u attributes\n", clkid);
> > +             return ERR_PTR(ret);
> > +     }
> > +
> > +     ret =3D rpmi_clk_get_supported_rates(clkid, rpmi_clk);
> > +     if (ret) {
> > +             dev_err(dev, "Get supported rates failed for clk-%u, %d\n=
",
> > +                     clkid, ret);
> > +             return ERR_PTR(ret);
> > +     }
> > +
> > +     init.flags =3D CLK_GET_RATE_NOCACHE;
> > +     init.num_parents =3D 0;
> > +     init.ops =3D &rpmi_clk_ops;
> > +     init.name =3D rpmi_clk->name;
> > +     clk_hw =3D &rpmi_clk->hw;
> > +     clk_hw->init =3D &init;
> > +
> > +     ret =3D devm_clk_hw_register(dev, clk_hw);
> > +     if (ret) {
> > +             dev_err(dev, "Unable to register clk-%u\n", clkid);
> > +             return ERR_PTR(ret);
> > +     }
> > +
> > +     if (rpmi_clk->type =3D=3D RPMI_CLK_DISCRETE) {
> > +             min_rate =3D rpmi_clk->rates->discrete[0];
> > +             max_rate =3D rpmi_clk->rates->discrete[rpmi_clk->num_rate=
s -
> > 1];
> > +     } else {
> > +             min_rate =3D rpmi_clk->rates->linear.min;
> > +             max_rate =3D rpmi_clk->rates->linear.max;
> > +     }
> > +
> > +     clk_hw_set_rate_range(clk_hw, min_rate, max_rate);
> > +
> > +     return NULL;
> > +}
> > +
> > +static void rpmi_clk_receive_message(struct mbox_client *cl, void *msg=
)
> > +{
> > +     /* Nothing to do here. */
> > +}
> > +
> > +static int rpmi_clk_probe(struct platform_device *pdev) {
> > +     struct device *dev =3D &pdev->dev;
> > +     struct clk_hw_onecell_data *clk_data;
> > +     struct rpmi_clk_context *context;
> > +     struct rpmi_mbox_message msg;
> > +     int ret, num_clocks, i;
> > +     struct clk_hw *hw_ptr;
> > +
> > +     /* Allocate RPMI clock context */
> > +     context =3D devm_kzalloc(dev, sizeof(*context), GFP_KERNEL);
> > +     if (!context)
> > +             return -ENOMEM;
> > +     context->dev =3D dev;
> > +     platform_set_drvdata(pdev, context);
> > +
> > +     /* Setup mailbox client */
> > +     context->client.dev             =3D context->dev;
> > +     context->client.rx_callback     =3D rpmi_clk_receive_message;
> > +     context->client.tx_block        =3D false;
> > +     context->client.knows_txdone    =3D true;
> > +     context->client.tx_tout         =3D 0;
> > +
> > +     /* Request mailbox channel */
> > +     context->chan =3D mbox_request_channel(&context->client, 0);
> > +     if (IS_ERR(context->chan))
> > +             return PTR_ERR(context->chan);
> > +
> > +     /* Validate RPMI specification version */
> > +     rpmi_mbox_init_get_attribute(&msg,
> > RPMI_MBOX_ATTR_SPEC_VERSION);
> > +     ret =3D rpmi_mbox_send_message(context->chan, &msg);
> > +     if (ret) {
> > +             dev_err(dev, "Failed to get spec version\n");
> > +             goto fail_free_channel;
> > +     }
> > +     if (msg.attr.value < RPMI_MKVER(1, 0)) {
> > +             dev_err(dev,
> > +                     "msg protocol version mismatch, expected 0x%x,
> > found 0x%x\n",
> > +                     RPMI_MKVER(1, 0), msg.attr.value);
> > +             ret =3D -EINVAL;
> > +             goto fail_free_channel;
> > +     }
> > +
> > +     /* Validate clock service group ID */
> > +     rpmi_mbox_init_get_attribute(&msg,
> > RPMI_MBOX_ATTR_SERVICEGROUP_ID);
> > +     ret =3D rpmi_mbox_send_message(context->chan, &msg);
> > +     if (ret) {
> > +             dev_err(dev, "Failed to get service group ID\n");
> > +             goto fail_free_channel;
> > +     }
> > +     if (msg.attr.value !=3D RPMI_SRVGRP_CLOCK) {
> > +             dev_err(dev,
> > +                     "service group match failed, expected 0x%x, found
> > 0x%x\n",
> > +                     RPMI_SRVGRP_CLOCK, msg.attr.value);
> > +             ret =3D -EINVAL;
> > +             goto fail_free_channel;
> > +     }
> > +
> > +     /* Validate clock service group version */
> > +     rpmi_mbox_init_get_attribute(&msg,
> > RPMI_MBOX_ATTR_SERVICEGROUP_VERSION);
> > +     ret =3D rpmi_mbox_send_message(context->chan, &msg);
> > +     if (ret) {
> > +             dev_err(dev, "Failed to get service group version\n");
> > +             goto fail_free_channel;
> > +     }
> > +     if (msg.attr.value < RPMI_MKVER(1, 0)) {
> > +             dev_err(dev,
> > +                     "service group version failed, expected 0x%x, fou=
nd
> > 0x%x\n",
> > +                     RPMI_MKVER(1, 0), msg.attr.value);
> > +             ret =3D -EINVAL;
> > +             goto fail_free_channel;
> > +     }
> > +
> > +     /* Find-out number of clocks */
> > +     num_clocks =3D rpmi_clk_get_num_clocks(context);
> > +     if (!num_clocks) {
> > +             dev_err(dev, "No clocks found\n");
> > +             ret =3D -ENODEV;
> > +             goto fail_free_channel;
> > +     }
> > +
> > +     /* Allocate clock data */
> > +     clk_data =3D devm_kzalloc(dev, struct_size(clk_data, hws, num_clo=
cks),
> > +                             GFP_KERNEL);
> > +     if (!clk_data) {
> > +             ret =3D -ENOMEM;
> > +             goto fail_free_channel;
> > +     }
> > +     clk_data->num =3D num_clocks;
> > +
> > +     /* Setup clock data */
> > +     for (i =3D 0; i < clk_data->num; i++) {
> > +             hw_ptr =3D rpmi_clk_enumerate(context, i);
> > +             if (IS_ERR(hw_ptr)) {
> > +                     dev_err(dev, "failed to register clk-%d\n", i);
> > +                     ret =3D PTR_ERR(hw_ptr);
> > +                     goto fail_free_channel;
> > +             }
> > +             clk_data->hws[i] =3D hw_ptr;
> > +     }
> > +
> > +     /* Register clock HW provider */
> > +     ret =3D devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
> > clk_data);
> > +     if (ret) {
> > +             dev_err(dev, "failed to register clock HW provider\n");
> > +             goto fail_free_channel;
> > +     }
> > +
> > +     dev_info(dev, "clk HW provider registered with %d clocks\n",
> > +              num_clocks);
> > +     return 0;
> > +
> > +fail_free_channel:
> > +     mbox_free_channel(context->chan);
> > +     return ret;
> > +}
> > +
> > +static void rpmi_clk_remove(struct platform_device *pdev) {
> > +     struct rpmi_clk_context *context =3D platform_get_drvdata(pdev);
> > +
> > +     mbox_free_channel(context->chan);
> > +}
> > +
> > +static const struct of_device_id rpmi_clk_of_match[] =3D {
> > +     { .compatible =3D "riscv,rpmi-clock" },
> > +     { },
> > +};
> > +
> > +MODULE_DEVICE_TABLE(of, rpmi_clk_of_match);
> > +
> > +static struct platform_driver rpmi_clk_driver =3D {
> > +     .driver =3D {
> > +             .name =3D "riscv-rpmi-clock",
> > +             .of_match_table =3D rpmi_clk_of_match,
> > +     },
> > +     .probe =3D rpmi_clk_probe,
> > +     .remove =3D rpmi_clk_remove,
> > +};
> > +module_platform_driver(rpmi_clk_driver);
> > +
> > +MODULE_AUTHOR("Rahul Pathak <rpathak@ventanamicro.com>");
> > +MODULE_DESCRIPTION("Clock Driver based on RPMI message protocol");
> > +MODULE_LICENSE("GPL");
> > diff --git a/include/linux/mailbox/riscv-rpmi-message.h
> > b/include/linux/mailbox/riscv-rpmi-message.h
> > index 8f4b3a0edbce..4e9478c4c0a3 100644
> > --- a/include/linux/mailbox/riscv-rpmi-message.h
> > +++ b/include/linux/mailbox/riscv-rpmi-message.h
> > @@ -89,6 +89,22 @@ static inline int rpmi_to_linux_error(int rpmi_error=
)
> >       }
> >  }
> >
> > +/** RPMI service group IDs */
> > +#define RPMI_SRVGRP_CLOCK            0x00007
> > +
> > +/** RPMI clock service IDs */
> > +enum rpmi_clock_service_id {
> > +     RPMI_CLK_SRV_ENABLE_NOTIFICATION =3D 0x01,
> > +     RPMI_CLK_SRV_GET_NUM_CLOCKS =3D 0x02,
> > +     RPMI_CLK_SRV_GET_ATTRIBUTES =3D 0x03,
> > +     RPMI_CLK_SRV_GET_SUPPORTED_RATES =3D 0x04,
> > +     RPMI_CLK_SRV_SET_CONFIG =3D 0x05,
> > +     RPMI_CLK_SRV_GET_CONFIG =3D 0x06,
> > +     RPMI_CLK_SRV_SET_RATE =3D 0x07,
> > +     RPMI_CLK_SRV_GET_RATE =3D 0x08,
> > +     RPMI_CLK_SRV_ID_MAX_COUNT,
> > +};
> > +
> >  /** RPMI linux mailbox attribute IDs */  enum rpmi_mbox_attribute_id {
> >       RPMI_MBOX_ATTR_SPEC_VERSION =3D 0,
> > --
> > 2.43.0
>
