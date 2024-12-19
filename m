Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E739578F24
	for <linux-clk@vger.kernel.org>; Thu, 19 Dec 2024 04:43:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734583387; cv=none; b=MkBDG+bdQiVrxN19BSZw/K9RI4l3rH1IMh1Z7Kv/JbMY4Z0ftcA+A8ZMZBJXmNEnBjcEp4dJEH4Kf/IanmwYo43IQwvLh5h1ozBml+18IhSt8kVKkUl+KLzhLp8QIQqbHxYjJ4oaBoRTf92deg3a9WarR0jqVnhZ73Sro6n6IcU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734583387; c=relaxed/simple;
	bh=s2UkWega3MdYoAb4pSM3982W3G7eJzNwF6LtnjPMCyw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YkEQ3rSLFZBVMsXUzAb4RIUoDGGERmi6H/oaTSwCBvcUZodpnthtjwNvXrUlXNcGA6uJ9V8ZS8mdhKl8IEEHz3TBydgwE3cbYZLH87xCQ1+qbwKzkMuVCldr4fTdNUFFUkb+HG2mMWInuoksOoDc6NfhgWwAoesC3wdhSV3AHKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=MrTKDTPx; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="MrTKDTPx"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-7fd5248d663so204241a12.0
        for <linux-clk@vger.kernel.org>; Wed, 18 Dec 2024 20:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1734583384; x=1735188184; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=25RA0Et++brrXAhbRpu+RxlLEbftDu9CpZlwhi4kQvw=;
        b=MrTKDTPxHja6i1cnRE/DX/APLi1ALaEkaA6ioxU6kWaHcXomQov+PjRTyPPnRsM6KA
         GBh9wjZDtv2JPbymeceqZgbRDchGVKJFbQTWcik8yJVnEQDRepbPynzfQHgjB2VXq2l3
         /MtK0kGZFoPfWohg2rTHkBH86NPC/nkW6vZIHCAcWH5vQyAEOYTiBoK30xjeMNBWiaJr
         qvNRMu5uFOE7WSKPbx+Dqi5aHuAtcZBkFSiWLEhA8KvT9w6eJPkC4yX+EPerJ9dF8Fnq
         Xdf+GdgWOGC8+NnfUoUXTSBaWyaYfFZv7yFofm3zklO9GHuy/+3hjc3A5VDWFr7RwxmF
         zcLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734583384; x=1735188184;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=25RA0Et++brrXAhbRpu+RxlLEbftDu9CpZlwhi4kQvw=;
        b=XxMz4Fg/2MJQVaFlR3Tia9ZRcDR1+QJ0HDlDQkWiaM6g5DwC/RayQOsn1aRg0cW5r5
         XNd80zl+4TlBcmrIPSSfjYOoFPVyTWaUHZv3BVsLisRzmNGqLAk4JdLnM1Ph9YRXT3hr
         UnPiHcbXcoaTMKC2b96gTsquwM0nYl7qes/wD00fZg3GdIMPdOqOcBKeq31BhuKuZ0q9
         Owi4wLVwwI26D482/4ku25q6lQMufQDv0+I1lCXu1AzRzSR7DDjYxUaZai2HaG2YvT0r
         jvXhCEVcFrhFwBB+q3b8JBaOZ2BIYfUOkroji/IaRaJ5nUBn8ABDJOJXfcwUe+MPV9Rz
         c3Yw==
X-Forwarded-Encrypted: i=1; AJvYcCWx5IcXerHzs2bnbRtuC8mGAoGwbDL+7z6tkQXjOdfK36uq7n3/dXnIbjf3+bTxXFsgjV/qnQ6my2w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx46Ag/D4Awh/t6yPvh+XphY+5RzNv7SWsNWAAwYmOZM+2+booz
	12pWhX7tJRIQ7GTq3PHB2hBYHYSnNdS7ifvtr66UK7vCCrzugx7LXaAuMS9+bDtF4+df0cPfADp
	8gWlQMmquh4xs716LgQsVy3+FuEWuser3WD888g==
X-Gm-Gg: ASbGnctRo/fwuC6dYCPI+Zzafs1wjMm0JWGbh2iFqFhhYVlpuQg5kLlu4UPVb63Xqxj
	CjxO8ZCuUI15Y4VYqr2HenFOf7nAapDsWywJPXU49R0Bzb/nfYlvmtcM9jDCZYKxva1vla2M=
X-Google-Smtp-Source: AGHT+IG3jXiPHiR372CERb9vEJo38jWMDfelEKyfoF4GCaNwA278pWt7lvXkvMfMq5NV7dXsXBWiHxI7urnAmLz5VlA=
X-Received: by 2002:a17:90b:6c6:b0:2ee:5691:774e with SMTP id
 98e67ed59e1d1-2f2e91c13d3mr7477060a91.2.1734583383995; Wed, 18 Dec 2024
 20:43:03 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241216084817.373131-1-apatel@ventanamicro.com>
 <20241216084817.373131-9-apatel@ventanamicro.com> <37d32701e01df3ee457627cf971566dd.sboyd@kernel.org>
In-Reply-To: <37d32701e01df3ee457627cf971566dd.sboyd@kernel.org>
From: Rahul Pathak <rpathak@ventanamicro.com>
Date: Thu, 19 Dec 2024 10:12:27 +0530
Message-ID: <CA+Oz1=abKok-xOWeZj-5xuSZ4m14cjvRQVsxAxO6yOiOVDxPAA@mail.gmail.com>
Subject: Re: [RFC PATCH 8/8] clk: Add clock driver for the RISC-V RPMI clock
 service group
To: Stephen Boyd <sboyd@kernel.org>
Cc: Anup Patel <apatel@ventanamicro.com>, Conor Dooley <conor+dt@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Sunil V L <sunilvl@ventanamicro.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, 
	Atish Patra <atishp@atishpatra.org>, Andrew Jones <ajones@ventanamicro.com>, 
	Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Wed, Dec 18, 2024 at 1:44=E2=80=AFAM Stephen Boyd <sboyd@kernel.org> wro=
te:
>
> Quoting Anup Patel (2024-12-16 00:48:17)
> > diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
> > index bf4bd45adc3a..95ef59e439bf 100644
> > --- a/drivers/clk/Makefile
> > +++ b/drivers/clk/Makefile
> > @@ -107,6 +107,7 @@ obj-$(CONFIG_COMMON_CLK_VC5)                +=3D cl=
k-versaclock5.o
> >  obj-$(CONFIG_COMMON_CLK_VC7)           +=3D clk-versaclock7.o
> >  obj-$(CONFIG_COMMON_CLK_WM831X)                +=3D clk-wm831x.o
> >  obj-$(CONFIG_COMMON_CLK_XGENE)         +=3D clk-xgene.o
> > +obj-$(CONFIG_COMMON_CLK_RPMI)          +=3D clk-rpmi.o
>
> Keep this sorted by filename.

Sure, I will update.

>
> >
> >  # please keep this section sorted lexicographically by directory path =
name
> >  obj-y                                  +=3D actions/
> > diff --git a/drivers/clk/clk-rpmi.c b/drivers/clk/clk-rpmi.c
> > new file mode 100644
> > index 000000000000..ed8e32527d3d
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
>
> Is this include used?
>
> > +#include <linux/mm.h>
>
> Is this include used?
>
> > +#include <linux/of.h>
>
> Is this include used?
>
> > +#include <linux/err.h>
> > +#include <linux/slab.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/mailbox/riscv-rpmi-message.h>
> > +#include <linux/mailbox_client.h>
> > +#include <linux/module.h>
> > +#include <linux/of_platform.h>
>
> Did you mean mod_devicetable.h?
>
> > +#include <linux/clk-provider.h>
>
> Please sort includes alphabetically.

I will correct all the headers and sort them.

>
> > +
> > +#define RPMI_CLK_MAX_NUM_RATES         16
> > +#define RPMI_CLK_NAME_LEN              16
> > +
> > +#define GET_RATE_LO_U32(rate_u64)      ((u32)rate_u64)
> > +#define GET_RATE_HI_U32(rate_u64)      ((u32)((u64)(rate_u64) >> 32))
>
> Use upper_32_bits() and lower_32_bits() instead.

Sure, I will update.

>
> > +#define GET_RATE_U64(hi_u32, lo_u32)   ((u64)(hi_u32) << 32 | (lo_u32)=
)
>
> I couldn't find a macro for this one which is kinda surprising.
>
> > +
> > +enum rpmi_clk_config {
> > +       RPMI_CLK_DISABLE =3D 0,
> > +       RPMI_CLK_ENABLE =3D 1,
> > +};
> > +
> > +enum rpmi_clk_type {
> > +       RPMI_CLK_DISCRETE =3D 0,
> > +       RPMI_CLK_LINEAR =3D 1,
> > +       RPMI_CLK_TYPE_MAX_IDX,
> > +};
> > +
> > +struct rpmi_clk_context {
> > +       struct device *dev;
> > +       struct mbox_chan *chan;
> > +       struct mbox_client client;
> > +};
> > +
> > +union rpmi_clk_rate {
> > +       struct {
> > +               u32 lo;
> > +               u32 hi;
> > +       } discrete[RPMI_CLK_MAX_NUM_RATES];
> > +       struct {
> > +               u32 min_lo;
> > +               u32 min_hi;
> > +               u32 max_lo;
> > +               u32 max_hi;
> > +               u32 step_lo;
> > +               u32 step_hi;
> > +       } linear;
> > +};
> > +
> > +union rpmi_clk_rates {
> > +       u64 discrete[RPMI_CLK_MAX_NUM_RATES];
> > +       struct {
> > +               u64 min;
> > +               u64 max;
> > +               u64 step;
> > +       } linear;
> > +};
> > +
> > +struct rpmi_clk {
> > +       struct rpmi_clk_context *context;
> > +       u32 id;
> > +       u32 num_rates;
> > +       u32 transition_latency;
> > +       enum rpmi_clk_type type;
> > +       union rpmi_clk_rates *rates;
> > +       char name[RPMI_CLK_NAME_LEN];
> > +       struct clk_hw hw;
> > +};
> > +
> > +#define to_rpmi_clk(clk)       container_of(clk, struct rpmi_clk, hw)
> > +
> > +struct rpmi_get_num_clocks_rx {
> > +       s32 status;
> > +       u32 num_clocks;
> > +};
> > +
> > +struct rpmi_get_attrs_tx {
> > +       u32 clkid;
>
> Maybe just 'id', unless the spec calls this 'clkid'?

Spec calls it Clock ID, and in short used as clkid.
The word ID is used for other things as well so I think using clkid
here is better.

>
> > +};
> > +
> > +struct rpmi_get_attrs_rx {
> > +       s32 status;
> > +       u32 flags;
> > +       u32 num_rates;
> > +       u32 transition_latency;
> > +       char name[RPMI_CLK_NAME_LEN];
> > +};
> > +
> > +struct rpmi_get_supp_rates_tx {
> > +       u32 clkid;
> > +       u32 clk_rate_idx;
> > +};
> > +
> > +struct rpmi_get_supp_rates_rx {
> > +       u32 status;
> > +       u32 flags;
> > +       u32 remaining;
> > +       u32 returned;
> > +       union rpmi_clk_rate rates;
> > +};
> > +
> > +struct rpmi_get_rate_tx {
> > +       u32 clkid;
> > +};
> > +
> > +struct rpmi_get_rate_rx {
> > +       u32 status;
> > +       u32 lo;
> > +       u32 hi;
> > +};
> > +
> > +struct rpmi_set_rate_tx {
> > +       u32 clkid;
> > +       u32 flags;
> > +       u32 lo;
> > +       u32 hi;
> > +};
> > +
> > +struct rpmi_set_rate_rx {
> > +       u32 status;
> > +};
> > +
> > +struct rpmi_set_config_tx {
> > +       u32 clkid;
> > +       u32 config;
> > +};
> > +
> > +struct rpmi_set_config_rx {
> > +       u32 status;
> > +};
> > +
> > +static int rpmi_clk_get_num_clocks(struct rpmi_clk_context *context)
> > +{
> > +       struct rpmi_get_num_clocks_rx rx;
> > +       struct rpmi_mbox_message msg;
> > +       int ret;
> > +
> > +       rpmi_mbox_init_send_with_response(&msg, RPMI_CLK_SRV_GET_NUM_CL=
OCKS,
> > +                                         NULL, 0, &rx, sizeof(rx));
> > +       ret =3D rpmi_mbox_send_message(context->chan, &msg);
> > +       if (ret)
> > +               return ret;
> > +       if (rx.status)
> > +               return rpmi_to_linux_error(rx.status);
> > +
> > +       return rx.num_clocks;
> > +}
> > +
> > +/**
>
> This isn't kernel-doc so either remove the extra '*' or write
> kernel-doc.

Sure, I will remove that wherever necessary.

>
> > + * Get the RPMI Clock Attributes.
> > + * These attributes belong to a particular clock(clkid)
> > + * which are different from the MPXY channel attributes.
> > + */
> > +static int rpmi_clk_get_attrs(u32 clkid, struct rpmi_clk *rpmi_clk)
> > +{
> > +       struct rpmi_clk_context *context =3D rpmi_clk->context;
> > +       struct rpmi_mbox_message msg;
> > +       struct rpmi_get_attrs_tx tx;
> > +       struct rpmi_get_attrs_rx rx;
> > +       u8 format;
> > +       int ret;
> > +
> > +       tx.clkid =3D cpu_to_le32(clkid);
>
> Run sparse and fix errors please. I assume that the mailbox interactions
> need to have __le32 marked structs.

Sure.

>
> > +       rpmi_mbox_init_send_with_response(&msg, RPMI_CLK_SRV_GET_ATTRIB=
UTES,
> > +                                         &tx, sizeof(tx), &rx, sizeof(=
rx));
> > +       ret =3D rpmi_mbox_send_message(context->chan, &msg);
> > +       if (ret)
> > +               return ret;
> > +       if (rx.status)
> > +               return rpmi_to_linux_error(rx.status);
> > +
> > +       rpmi_clk->id =3D clkid;
> > +       rpmi_clk->num_rates =3D rx.num_rates;
> > +       rpmi_clk->transition_latency =3D rx.transition_latency;
> > +       strscpy(rpmi_clk->name, rx.name, RPMI_CLK_NAME_LEN);
> > +
> > +       format =3D rx.flags & 1U;
> > +       if (format >=3D RPMI_CLK_TYPE_MAX_IDX)
>
> How is this possible?

There is a mistake in getting the format from flags which makes the
"if" condition useless.
The format is supposed to be 2 bit wide in the flags.
The spec currently only defines 0b00 and 0b01, rest are
reserved and if condition will be necessary. i will correct this


>
> > +               return -EINVAL;
> > +
> > +       rpmi_clk->type =3D format;
> > +
> > +       return 0;
> > +}
> > +
> > +static int rpmi_clk_get_supported_rates(u32 clkid, struct rpmi_clk *rp=
mi_clk)
> > +{
> > +       struct rpmi_clk_context *context =3D rpmi_clk->context;
> > +       struct rpmi_get_supp_rates_tx tx;
> > +       struct rpmi_get_supp_rates_rx rx;
> > +       struct rpmi_mbox_message msg;
> > +       size_t clk_rate_idx =3D 0;
> > +       int ret, rateidx, j;
> > +
> > +       tx.clkid =3D cpu_to_le32(clkid);
> > +       tx.clk_rate_idx =3D 0;
> > +
> > +       rpmi_mbox_init_send_with_response(&msg, RPMI_CLK_SRV_GET_SUPPOR=
TED_RATES,
> > +                                         &tx, sizeof(tx), &rx, sizeof(=
rx));
> > +       ret =3D rpmi_mbox_send_message(context->chan, &msg);
> > +       if (ret)
> > +               return ret;
> > +       if (rx.status)
> > +               return rpmi_to_linux_error(rx.status);
> > +       if (!rx.returned)
> > +               return -EINVAL;
> > +
> > +       if (rpmi_clk->type =3D=3D RPMI_CLK_DISCRETE) {
> > +               for (rateidx =3D 0; rateidx < rx.returned; rateidx++) {
> > +                       rpmi_clk->rates->discrete[rateidx] =3D
> > +                                       GET_RATE_U64(rx.rates.discrete[=
rateidx].hi,
> > +                                                    rx.rates.discrete[=
rateidx].lo);
> > +               }
> > +
> > +               while (rx.remaining) {
> > +                       clk_rate_idx +=3D rx.returned;
> > +                       tx.clk_rate_idx =3D clk_rate_idx;
> > +
> > +                       rpmi_mbox_init_send_with_response(&msg,
> > +                                                         RPMI_CLK_SRV_=
GET_SUPPORTED_RATES,
> > +                                                         &tx, sizeof(t=
x), &rx, sizeof(rx));
> > +                       ret =3D rpmi_mbox_send_message(context->chan, &=
msg);
> > +                       if (ret)
> > +                               return ret;
> > +
> > +                       for (j =3D 0; j < rx.returned; j++) {
> > +                               if (rateidx >=3D (clk_rate_idx + rx.ret=
urned))
> > +                                       break;
> > +                               rpmi_clk->rates->discrete[rateidx++] =
=3D
> > +                                       GET_RATE_U64(rx.rates.discrete[=
j].hi,
> > +                                                    rx.rates.discrete[=
j].lo);
> > +                       }
> > +               }
> > +       } else if (rpmi_clk->type =3D=3D RPMI_CLK_LINEAR) {
> > +               rpmi_clk->rates->linear.min =3D
> > +                               GET_RATE_U64(rx.rates.linear.min_hi,
> > +                                            rx.rates.linear.min_lo);
> > +               rpmi_clk->rates->linear.max =3D
> > +                               GET_RATE_U64(rx.rates.linear.max_hi,
> > +                                            rx.rates.linear.max_lo);
> > +               rpmi_clk->rates->linear.step =3D
> > +                               GET_RATE_U64(rx.rates.linear.step_hi,
> > +                                            rx.rates.linear.step_lo);
> > +       }
> > +
> > +       return 0;
> > +}
> > +
> > +static unsigned long rpmi_clk_recalc_rate(struct clk_hw *hw,
> > +                                         unsigned long parent_rate)
> > +{
> > +       struct rpmi_clk *rpmi_clk =3D to_rpmi_clk(hw);
> > +       struct rpmi_clk_context *context =3D rpmi_clk->context;
> > +       struct rpmi_mbox_message msg;
> > +       struct rpmi_get_rate_tx tx;
> > +       struct rpmi_get_rate_rx rx;
> > +       int ret;
> > +
> > +       tx.clkid =3D cpu_to_le32(rpmi_clk->id);
> > +
> > +       rpmi_mbox_init_send_with_response(&msg, RPMI_CLK_SRV_GET_RATE,
> > +                                         &tx, sizeof(tx), &rx, sizeof(=
rx));
> > +       ret =3D rpmi_mbox_send_message(context->chan, &msg);
> > +       if (ret)
> > +               return ret;
> > +       if (rx.status)
> > +               return rx.status;
> > +
> > +       return GET_RATE_U64(rx.hi, rx.lo);
> > +}
> > +
> > +static long rpmi_clk_round_rate(struct clk_hw *hw,
> > +                               unsigned long rate,
> > +                               unsigned long *parent_rate)
> > +{
> > +       struct rpmi_clk *rpmi_clk =3D to_rpmi_clk(hw);
> > +       u64 fmin, fmax, ftmp;
> > +
> > +       if (rpmi_clk->type =3D=3D RPMI_CLK_DISCRETE)
> > +               return rate;
> > +
> > +       fmin =3D rpmi_clk->rates->linear.min;
> > +       fmax =3D rpmi_clk->rates->linear.max;
> > +
> > +       if (rate <=3D fmin)
> > +               return fmin;
> > +       else if (rate >=3D  fmax)
> > +               return fmax;
> > +
> > +       ftmp =3D rate - fmin;
> > +       ftmp +=3D rpmi_clk->rates->linear.step - 1;
> > +       do_div(ftmp, rpmi_clk->rates->linear.step);
> > +
> > +       return ftmp * rpmi_clk->rates->linear.step + fmin;
> > +}
> > +
> > +static int rpmi_clk_set_rate(struct clk_hw *hw, unsigned long rate,
> > +                            unsigned long parent_rate)
> > +{
> > +       struct rpmi_clk *rpmi_clk =3D to_rpmi_clk(hw);
> > +       struct rpmi_clk_context *context =3D rpmi_clk->context;
> > +       struct rpmi_mbox_message msg;
> > +       struct rpmi_set_rate_tx tx;
> > +       struct rpmi_set_rate_rx rx;
> > +       int ret;
> > +
> > +       tx.clkid =3D cpu_to_le32(rpmi_clk->id);
> > +       tx.lo =3D cpu_to_le32(GET_RATE_LO_U32(rate));
> > +       tx.hi =3D cpu_to_le32(GET_RATE_HI_U32(rate));
> > +
> > +       rpmi_mbox_init_send_with_response(&msg, RPMI_CLK_SRV_SET_RATE,
> > +                                         &tx, sizeof(tx), &rx, sizeof(=
rx));
> > +       ret =3D rpmi_mbox_send_message(context->chan, &msg);
> > +       if (ret)
> > +               return ret;
> > +       if (rx.status)
> > +               return rpmi_to_linux_error(rx.status);
> > +
> > +       return 0;
> > +}
> > +
> > +static int rpmi_clk_enable(struct clk_hw *hw)
> > +{
> > +       struct rpmi_clk *rpmi_clk =3D to_rpmi_clk(hw);
> > +       struct rpmi_clk_context *context =3D rpmi_clk->context;
> > +       struct rpmi_mbox_message msg;
> > +       struct rpmi_set_config_tx tx;
> > +       struct rpmi_set_config_rx rx;
> > +       int ret;
> > +
> > +       tx.config =3D cpu_to_le32(RPMI_CLK_ENABLE);
> > +       tx.clkid =3D cpu_to_le32(rpmi_clk->id);
> > +
> > +       rpmi_mbox_init_send_with_response(&msg, RPMI_CLK_SRV_SET_CONFIG=
,
> > +                                         &tx, sizeof(tx), &rx, sizeof(=
rx));
> > +       ret =3D rpmi_mbox_send_message(context->chan, &msg);
> > +       if (ret)
> > +               return ret;
> > +       if (rx.status)
> > +               return rpmi_to_linux_error(rx.status);
> > +
> > +       return 0;
> > +}
> > +
> > +static void rpmi_clk_disable(struct clk_hw *hw)
> > +{
> > +       struct rpmi_clk *rpmi_clk =3D to_rpmi_clk(hw);
> > +       struct rpmi_clk_context *context =3D rpmi_clk->context;
> > +       struct rpmi_mbox_message msg;
> > +       struct rpmi_set_config_tx tx;
> > +       struct rpmi_set_config_rx rx;
> > +       int ret;
> > +
> > +       tx.config =3D cpu_to_le32(RPMI_CLK_DISABLE);
> > +       tx.clkid =3D cpu_to_le32(rpmi_clk->id);
> > +
> > +       rpmi_mbox_init_send_with_response(&msg, RPMI_CLK_SRV_SET_CONFIG=
,
> > +                                         &tx, sizeof(tx), &rx, sizeof(=
rx));
> > +       ret =3D rpmi_mbox_send_message(context->chan, &msg);
> > +       if (ret || rx.status)
> > +               pr_err("Failed to disable clk-%u\n", rpmi_clk->id);
> > +}
> > +
> > +static const struct clk_ops rpmi_clk_ops =3D {
> > +       .recalc_rate =3D rpmi_clk_recalc_rate,
> > +       .round_rate =3D rpmi_clk_round_rate,
>
> Please implement determine_rate instead.

Sure. I will update

>
> > +       .set_rate =3D rpmi_clk_set_rate,
> > +       .prepare =3D rpmi_clk_enable,
> > +       .unprepare =3D rpmi_clk_disable,
> > +};
> > +
> > +static struct clk_hw *rpmi_clk_enumerate(struct rpmi_clk_context *cont=
ext, u32 clkid)
> > +{
> > +       struct device *dev =3D context->dev;
> > +       unsigned long min_rate, max_rate;
> > +       union rpmi_clk_rates *rates;
> > +       struct rpmi_clk *rpmi_clk;
> > +       struct clk_init_data init;
>
> Use init =3D { } to initialize everything to zero.

Sure, I will update

>
> > +       struct clk_hw *clk_hw;
> > +       int ret;
> > +
> > +       rates =3D devm_kzalloc(dev, sizeof(union rpmi_clk_rates), GFP_K=
ERNEL);
> > +       if (!rates)
> > +               return ERR_PTR(-ENOMEM);
> > +
> > +       rpmi_clk =3D devm_kzalloc(dev, sizeof(struct rpmi_clk), GFP_KER=
NEL);
> > +       if (!rpmi_clk)
> > +               return ERR_PTR(-ENOMEM);
> > +       rpmi_clk->context =3D context;
> > +       rpmi_clk->rates =3D rates;
> > +
> > +       ret =3D rpmi_clk_get_attrs(clkid, rpmi_clk);
> > +       if (ret) {
> > +               dev_err(dev, "Failed to get clk-%u attributes\n", clkid=
);
>
> Please use dev_err_probe() and helpers.

Sure, I will update

>
> > +               return ERR_PTR(ret);
> > +       }
> > +
> > +       ret =3D rpmi_clk_get_supported_rates(clkid, rpmi_clk);
> > +       if (ret) {
> > +               dev_err(dev, "Get supported rates failed for clk-%u, %d=
\n",
> > +                       clkid, ret);
> > +               return ERR_PTR(ret);
> > +       }
> > +
> > +       init.flags =3D CLK_GET_RATE_NOCACHE;
> > +       init.num_parents =3D 0;
> > +       init.ops =3D &rpmi_clk_ops;
> > +       init.name =3D rpmi_clk->name;
> > +       clk_hw =3D &rpmi_clk->hw;
> > +       clk_hw->init =3D &init;
> > +
> > +       ret =3D devm_clk_hw_register(dev, clk_hw);
> > +       if (ret) {
> > +               dev_err(dev, "Unable to register clk-%u\n", clkid);
> > +               return ERR_PTR(ret);
> > +       }
> > +
> > +       if (rpmi_clk->type =3D=3D RPMI_CLK_DISCRETE) {
> > +               min_rate =3D rpmi_clk->rates->discrete[0];
> > +               max_rate =3D rpmi_clk->rates->discrete[rpmi_clk->num_ra=
tes -  1];
> > +       } else {
> > +               min_rate =3D rpmi_clk->rates->linear.min;
> > +               max_rate =3D rpmi_clk->rates->linear.max;
> > +       }
> > +
> > +       clk_hw_set_rate_range(clk_hw, min_rate, max_rate);
> > +
> > +       return NULL;
>
> Why does it return NULL?

Yes, it's a typo. I will correct this.

>
> > +}
> > +
> > +static void rpmi_clk_receive_message(struct mbox_client *cl, void *msg=
)
> > +{
> > +       /* Nothing to do here. */
> > +}
> > +
> > +static int rpmi_clk_probe(struct platform_device *pdev)
> > +{
> > +       struct device *dev =3D &pdev->dev;
> > +       struct clk_hw_onecell_data *clk_data;
> > +       struct rpmi_clk_context *context;
> > +       struct rpmi_mbox_message msg;
> > +       int ret, num_clocks, i;
> > +       struct clk_hw *hw_ptr;
> > +
> > +       /* Allocate RPMI clock context */
> > +       context =3D devm_kzalloc(dev, sizeof(*context), GFP_KERNEL);
> > +       if (!context)
> > +               return -ENOMEM;
> > +       context->dev =3D dev;
> > +       platform_set_drvdata(pdev, context);
> > +
> > +       /* Setup mailbox client */
> > +       context->client.dev             =3D context->dev;
> > +       context->client.rx_callback     =3D rpmi_clk_receive_message;
> > +       context->client.tx_block        =3D false;
> > +       context->client.knows_txdone    =3D true;
> > +       context->client.tx_tout         =3D 0;
> > +
> > +       /* Request mailbox channel */
> > +       context->chan =3D mbox_request_channel(&context->client, 0);
> > +       if (IS_ERR(context->chan))
> > +               return PTR_ERR(context->chan);
> > +
> > +       /* Validate RPMI specification version */
> > +       rpmi_mbox_init_get_attribute(&msg, RPMI_MBOX_ATTR_SPEC_VERSION)=
;
> > +       ret =3D rpmi_mbox_send_message(context->chan, &msg);
> > +       if (ret) {
> > +               dev_err(dev, "Failed to get spec version\n");
>
> Use dev_err_probe()

Sure, I will update

>
> > +               goto fail_free_channel;
> > +       }
> > +       if (msg.attr.value < RPMI_MKVER(1, 0)) {
> > +               dev_err(dev,
> > +                       "msg protocol version mismatch, expected 0x%x, =
found 0x%x\n",
> > +                       RPMI_MKVER(1, 0), msg.attr.value);
> > +               ret =3D -EINVAL;
> > +               goto fail_free_channel;
> > +       }
> > +
> > +       /* Validate clock service group ID */
> > +       rpmi_mbox_init_get_attribute(&msg, RPMI_MBOX_ATTR_SERVICEGROUP_=
ID);
> > +       ret =3D rpmi_mbox_send_message(context->chan, &msg);
> > +       if (ret) {
> > +               dev_err(dev, "Failed to get service group ID\n");
> > +               goto fail_free_channel;
> > +       }
> > +       if (msg.attr.value !=3D RPMI_SRVGRP_CLOCK) {
> > +               dev_err(dev,
> > +                       "service group match failed, expected 0x%x, fou=
nd 0x%x\n",
> > +                       RPMI_SRVGRP_CLOCK, msg.attr.value);
> > +               ret =3D -EINVAL;
> > +               goto fail_free_channel;
> > +       }
> > +
> > +       /* Validate clock service group version */
> > +       rpmi_mbox_init_get_attribute(&msg, RPMI_MBOX_ATTR_SERVICEGROUP_=
VERSION);
> > +       ret =3D rpmi_mbox_send_message(context->chan, &msg);
> > +       if (ret) {
> > +               dev_err(dev, "Failed to get service group version\n");
> > +               goto fail_free_channel;
> > +       }
> > +       if (msg.attr.value < RPMI_MKVER(1, 0)) {
> > +               dev_err(dev,
> > +                       "service group version failed, expected 0x%x, f=
ound 0x%x\n",
> > +                       RPMI_MKVER(1, 0), msg.attr.value);
> > +               ret =3D -EINVAL;
> > +               goto fail_free_channel;
> > +       }
> > +
> > +       /* Find-out number of clocks */
> > +       num_clocks =3D rpmi_clk_get_num_clocks(context);
> > +       if (!num_clocks) {
> > +               dev_err(dev, "No clocks found\n");
> > +               ret =3D -ENODEV;
> > +               goto fail_free_channel;
> > +       }
> > +
> > +       /* Allocate clock data */
> > +       clk_data =3D devm_kzalloc(dev, struct_size(clk_data, hws, num_c=
locks),
> > +                               GFP_KERNEL);
> > +       if (!clk_data) {
> > +               ret =3D -ENOMEM;
> > +               goto fail_free_channel;
> > +       }
> > +       clk_data->num =3D num_clocks;
> > +
> > +       /* Setup clock data */
> > +       for (i =3D 0; i < clk_data->num; i++) {
> > +               hw_ptr =3D rpmi_clk_enumerate(context, i);
> > +               if (IS_ERR(hw_ptr)) {
> > +                       dev_err(dev, "failed to register clk-%d\n", i);
> > +                       ret =3D PTR_ERR(hw_ptr);
> > +                       goto fail_free_channel;
> > +               }
> > +               clk_data->hws[i] =3D hw_ptr;
> > +       }
> > +
> > +       /* Register clock HW provider */
> > +       ret =3D devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,=
 clk_data);
> > +       if (ret) {
> > +               dev_err(dev, "failed to register clock HW provider\n");
> > +               goto fail_free_channel;
> > +       }
> > +
> > +       dev_info(dev, "clk HW provider registered with %d clocks\n",
> > +                num_clocks);
>
> Remove this info print please.

Sure, I will update.

>
> > +       return 0;
> > +
> > +fail_free_channel:
> > +       mbox_free_channel(context->chan);
> > +       return ret;
> > +}
> > +
> > +static void rpmi_clk_remove(struct platform_device *pdev)
> > +{
> > +       struct rpmi_clk_context *context =3D platform_get_drvdata(pdev)=
;
> > +
> > +       mbox_free_channel(context->chan);
> > +}
> > +
> > +static const struct of_device_id rpmi_clk_of_match[] =3D {
> > +       { .compatible =3D "riscv,rpmi-clock" },
> > +       { },
>
> Nitpick: Drop comma so nothing can come after.

Sure, I will update.

>
> > +};
> > +
>
> Nitpick: Drop extra newline.

Sure, I will update.

>
> > +MODULE_DEVICE_TABLE(of, rpmi_clk_of_match);
> > +
> > +static struct platform_driver rpmi_clk_driver =3D {
> > +       .driver =3D {
> > +               .name =3D "riscv-rpmi-clock",
> > +               .of_match_table =3D rpmi_clk_of_match,
> > +       },
> > +       .probe =3D rpmi_clk_probe,
> > +       .remove =3D rpmi_clk_remove,
> > +};
> > +module_platform_driver(rpmi_clk_driver);
> > +
> > +MODULE_AUTHOR("Rahul Pathak <rpathak@ventanamicro.com>");
> > +MODULE_DESCRIPTION("Clock Driver based on RPMI message protocol");
> > +MODULE_LICENSE("GPL");
> > diff --git a/include/linux/mailbox/riscv-rpmi-message.h b/include/linux=
/mailbox/riscv-rpmi-message.h
> > index 8f4b3a0edbce..4e9478c4c0a3 100644
> > --- a/include/linux/mailbox/riscv-rpmi-message.h
> > +++ b/include/linux/mailbox/riscv-rpmi-message.h
> > @@ -89,6 +89,22 @@ static inline int rpmi_to_linux_error(int rpmi_error=
)
> >         }
> >  }
> >
> > +/** RPMI service group IDs */
> > +#define RPMI_SRVGRP_CLOCK              0x00007
> > +
> > +/** RPMI clock service IDs */
> > +enum rpmi_clock_service_id {
> > +       RPMI_CLK_SRV_ENABLE_NOTIFICATION =3D 0x01,
> > +       RPMI_CLK_SRV_GET_NUM_CLOCKS =3D 0x02,
> > +       RPMI_CLK_SRV_GET_ATTRIBUTES =3D 0x03,
> > +       RPMI_CLK_SRV_GET_SUPPORTED_RATES =3D 0x04,
> > +       RPMI_CLK_SRV_SET_CONFIG =3D 0x05,
> > +       RPMI_CLK_SRV_GET_CONFIG =3D 0x06,
> > +       RPMI_CLK_SRV_SET_RATE =3D 0x07,
> > +       RPMI_CLK_SRV_GET_RATE =3D 0x08,
> > +       RPMI_CLK_SRV_ID_MAX_COUNT,
> > +};
> > +
>
> What is the benefit of the enum vs. just having a #define?

#define can achieve the same thing as enum does.
We have kept the same format for such defines everywhere.
For example a counterpart implementation of RPMI clock will
be in Platform microcontroller firmware and also in Qemu for
emulation which came first that's why I used the same.

I will prefer to use the common format everywhere unless
the driver requires use of #define instead of enum.
