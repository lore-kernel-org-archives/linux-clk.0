Received: from mail-lf1-f50.google.com (mail-lf1-f50.google.com [209.85.167.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C123238140
	for <linux-clk@vger.kernel.org>; Wed, 21 May 2025 11:37:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747827443; cv=none; b=rwmdk7kmWbmPM3NNGGc1uEaf4Iu1Cs0RoJlbY/7wAB82a0xPlkrO4ZNbMKa07ow3/8pisrjxkgFjMETzL3dyIHYaltsDMIhbBWYCL2kISGd/3DkBzZU2tsw1xrQnnwlEMPS3tur6neRJNrRDNS0GcE6ngRCICphvf7RGoiGHo6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747827443; c=relaxed/simple;
	bh=aUwu7ynv58jsNshaez4JIBjecCiqdiO1cl4puDm3Iac=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KKkkLXMbvY9CviEkmzzjh5lq7kGdJ88rJKI//0Wt/efYA9FcNCjlr2qj+fM3Od3KRh/Qh6KII0EAw/9EbWCF2k3yGfYJxzrcEzXsDPzcbh/B6GMCtV8F1OrLJ4r1w/bm7Nbvzqe7AJAWQZRpzGXNeNbPXXJepcL5UXfhjIujcqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=IOVFI/f9; arc=none smtp.client-ip=209.85.167.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="IOVFI/f9"
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-54298ec925bso10400250e87.3
        for <linux-clk@vger.kernel.org>; Wed, 21 May 2025 04:37:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1747827438; x=1748432238; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bq2unRbgv/HFo6D86aX5CmiwTp0UijkhqdpWvEJewKM=;
        b=IOVFI/f9EZHjLaBXQ0rzZ3jCUAuHfmyOQegFv45I1TdIeKHGa9Yt+yucH/32yskZ1f
         smItKMoZbPRYow0QlD+GZ8ETeuUflINGPA3G7oEyKh4iMka3dEv0YUXblj6ie+iWiAJS
         7MPxjKzyLfwwEnM0eyTgBEIRxWi5NCFWzFj400iiSZN4FRwVISMP7rJKNJuEkBD8zFjC
         AfRXPTrLbTniFvMu1htF376WKsgJ5WVFW3L3w3yX6+8j+7fz/Vgr51lwAujpqnxhh1Vt
         q1nP/AaG0LhhbGcxegGq9/VXtmeGsVREwNrD0xPAfIPWaRzJcGoheKvk1MGg3tCoIXHd
         ULHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747827438; x=1748432238;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bq2unRbgv/HFo6D86aX5CmiwTp0UijkhqdpWvEJewKM=;
        b=LoHnnieGndZ1BdgnI0icQ3zGj/TS94gaeRzljcGMqG2iMeibdkHgbE5xXlcoZ7wQxZ
         oUX35IQnezkSfTY9UiUw7dsnkiB9XXpcveIzNa+8p5wlv+xNpxTgRR+IXl3gkLxhqrR7
         QwchEh7XY8F4Xhfdvt1IEBiIHXRasZZ8cwNSczTMLJcpS8ESmW6VLgVfiM4zhD1NjPWf
         Zsp1GLZsxeXV0UDcRaeahb59wxIhIs5F9PGYdFUAPduqfHrhEZLc0E67PmAqapNPKQFg
         HyqPp5brBbvFi9QqXVu6un6aKCC+mLaal9VAlIGL3jMCgmiDenlzYWQM6VHlFnrM8iPW
         6Mew==
X-Forwarded-Encrypted: i=1; AJvYcCX5QUtQgFvsglLQT1XIgxWouB1cGoVpVYSshO6c5+teuW1xXj+lANOhDNeqa4Qk2RsI3j8EY1yIVug=@vger.kernel.org
X-Gm-Message-State: AOJu0YxEgCZodaD9XhOtSbKY/X5yrTa3LpSj67ZbSp/ARA9lRAgiS+YO
	bmLK4K29sa72TWDifqNyTRLzwKQY2pcHCiHbewwEEKCJ8UqPNeXNmIybfJHc1iErGgPUk8NmLLw
	T0pP5fuGON5IWvKC0cPXGa6aA3Q0AFdln9TcebJVTBg==
X-Gm-Gg: ASbGncvPOdUdTqEYjEsd5ncIfh/iA5lzgljVNUMxviyIJVxUqUZYkTT21ez19hpbzFw
	w2zFJ4UzHb6zksZfIg40jKix/QeSProDqMgBVbbhc9Fe4GHDgt1wSWH3rJZMhR2JQknFuosZZPO
	5Ou8Li7a0MUnttowV3W+YhkNXXfhVSiS5eY3XaLVItmyyt
X-Google-Smtp-Source: AGHT+IEfFRJ1uCRuqmP4owkMAUn9fjXR/6fk30LYXalgtbRk3jIERMhcf1RDrfIEzlwpn6xl8q47m+FQo99BZm7P7qM=
X-Received: by 2002:a05:6512:22d1:b0:550:f012:96a with SMTP id
 2adb3069b0e04-550f0120cdbmr4068337e87.20.1747827438295; Wed, 21 May 2025
 04:37:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250511133939.801777-1-apatel@ventanamicro.com>
 <20250511133939.801777-14-apatel@ventanamicro.com> <aCGaKXOOWyM4JQMg@smile.fi.intel.com>
In-Reply-To: <aCGaKXOOWyM4JQMg@smile.fi.intel.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 21 May 2025 17:07:05 +0530
X-Gm-Features: AX0GCFvNwxTxwAgZLci2dmWWitFjI2kQU-baZRFrggBnWcQZjGdOl85COFKoeDQ
Message-ID: <CAK9=C2U1rzSa42qMNqxfTtjAC5RiJrhwg_32_B86nT2+xJ4Qow@mail.gmail.com>
Subject: Re: [PATCH v3 13/23] irqchip: Add driver for the RPMI system MSI
 service group
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Len Brown <lenb@kernel.org>, Sunil V L <sunilvl@ventanamicro.com>, 
	Rahul Pathak <rpathak@ventanamicro.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, 
	Atish Patra <atish.patra@linux.dev>, Andrew Jones <ajones@ventanamicro.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, May 12, 2025 at 12:20=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Sun, May 11, 2025 at 07:09:29PM +0530, Anup Patel wrote:
> > The RPMI specification defines a system MSI service group which
> > allows application processors to receive MSIs upon system events
> > such as graceful shutdown/reboot request, CPU hotplug event, memory
> > hotplug event, etc.
> >
> > Add an irqchip driver for the RISC-V RPMI system MSI service group
> > to directly receive system MSIs in Linux kernel.
>
> ...
>
> > +/*
> > + * Copyright (C) 2025 Ventana Micro Systems Inc.
> > + */
>
> It can occupy a single line instead of 3 LoCs.

Okay, I will update.

>
> ...
>
> > +#include <linux/bitfield.h>
> > +#include <linux/bitops.h>
> > +#include <linux/cpu.h>
> > +#include <linux/interrupt.h>
> > +#include <linux/irqchip.h>
> > +#include <linux/mailbox_client.h>
> > +#include <linux/mailbox/riscv-rpmi-message.h>
> > +#include <linux/module.h>
> > +#include <linux/msi.h>
> > +#include <linux/of_irq.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/printk.h>
> > +#include <linux/smp.h>
>
> + types.h
>
> Actually this one is most clean, the rest of the patches where the new co=
de
> is introduced has semi-random list of the inclusions, please, follow the =
IWYU
> principle.

Sure, I will simplify the #includes

>
> ...
>
> > +static void rpmi_sysmsi_irq_mask(struct irq_data *d)
> > +{
> > +     struct rpmi_sysmsi_priv *priv =3D irq_data_get_irq_chip_data(d);
> > +     int ret;
> > +
> > +     ret =3D rpmi_sysmsi_set_msi_state(priv, d->hwirq, 0);
>
> Please, use the respective getter and the type:

Okay

>
>         irq_hw_number_t hwirq =3D irqd_to_hwirq(d);
>
> Ditto for all other similar cases.
>
> > +     if (ret) {
> > +             dev_warn(priv->dev, "Failed to mask hwirq %d (error %d)\n=
",
> > +                      (u32)d->hwirq, ret);
>
> No, this is wrong in two ways: usage of specified for signed value and
> passing the unsigned; using explicit casting to something unsigned.
> Instead ofa the explicit casting, find the best formatting specifier
> and use it.
>
> Ditto for  all your code.

Okay, I will update.

>
> > +     }
> > +     irq_chip_mask_parent(d);
> > +}
>
> ...
>
> > +static int rpmi_sysmsi_probe(struct platform_device *pdev)
> > +{
> > +     struct device *dev =3D &pdev->dev;
> > +     struct rpmi_sysmsi_priv *priv;
> > +     int rc;
> > +
> > +     priv =3D devm_kzalloc(dev, sizeof(*priv), GFP_KERNEL);
> > +     if (!priv)
> > +             return -ENOMEM;
> > +     priv->dev =3D dev;
> > +     platform_set_drvdata(pdev, priv);
> > +
> > +     /* Setup mailbox client */
> > +     priv->client.dev                =3D priv->dev;
> > +     priv->client.rx_callback        =3D NULL;
> > +     priv->client.tx_block           =3D false;
> > +     priv->client.knows_txdone       =3D true;
> > +     priv->client.tx_tout            =3D 0;
> > +
> > +     /* Request mailbox channel */
> > +     priv->chan =3D mbox_request_channel(&priv->client, 0);
> > +     if (IS_ERR(priv->chan))
> > +             return PTR_ERR(priv->chan);
> > +
> > +     /* Get number of system MSIs */
> > +     rc =3D rpmi_sysmsi_get_num_msi(priv);
> > +     if (rc < 1) {
> > +             mbox_free_channel(priv->chan);
> > +             return dev_err_probe(dev, -ENODEV, "No system MSIs found\=
n");
>
> Can rc be negative holding an error code? If so, why does the code shadow=
 that?

Ahh yes, we should print a different error message when rc < 0. I will upda=
te.

>
> > +     }
> > +     priv->nr_irqs =3D rc;
> > +
> > +     /* Set the device MSI domain if not available */
> > +     if (!dev_get_msi_domain(dev)) {
> > +             /*
> > +              * The device MSI domain for OF devices is only set at th=
e
> > +              * time of populating/creating OF device. If the device M=
SI
> > +              * domain is discovered later after the OF device is crea=
ted
> > +              * then we need to set it explicitly before using any pla=
tform
> > +              * MSI functions.
> > +              */
> > +             if (is_of_node(dev_fwnode(dev)))
> > +                     of_msi_configure(dev, to_of_node(dev_fwnode(dev))=
);
> > +
> > +             if (!dev_get_msi_domain(dev))
> > +                     return -EPROBE_DEFER;
> > +     }
> > +
> > +     if (!msi_create_device_irq_domain(dev, MSI_DEFAULT_DOMAIN,
> > +                                       &rpmi_sysmsi_template,
> > +                                       priv->nr_irqs, priv, priv))
> > +             return dev_err_probe(dev, -ENOMEM, "failed to create MSI =
irq domain\n");
> > +
> > +     dev_info(dev, "%d system MSIs registered\n", priv->nr_irqs);
> > +     return 0;
> > +}
>
> ...
>
> > +/** RPMI system MSI service IDs */
>
> Why does this have a kernel-doc marker?

Okay, I will use "/* */".

>
> > +enum rpmi_sysmsi_service_id {
> > +     RPMI_SYSMSI_SRV_ENABLE_NOTIFICATION =3D 0x01,
> > +     RPMI_SYSMSI_SRV_GET_ATTRIBUTES =3D 0x2,
> > +     RPMI_SYSMSI_SRV_GET_MSI_ATTRIBUTES =3D 0x3,
> > +     RPMI_SYSMSI_SRV_SET_MSI_STATE =3D 0x4,
> > +     RPMI_SYSMSI_SRV_GET_MSI_STATE =3D 0x5,
> > +     RPMI_SYSMSI_SRV_SET_MSI_TARGET =3D 0x6,
> > +     RPMI_SYSMSI_SRV_GET_MSI_TARGET =3D 0x7,
>
> Please, be consistent in the style of values.

Okay, I will update.

>
> > +     RPMI_SYSMSI_SRV_ID_MAX_COUNT,
>
> No comma in the terminator entry.

Okay.

>
> > +};
>
> --
> With Best Regards,
> Andy Shevchenko
>
>

Regards,
Anup
