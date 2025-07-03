Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19A7F2EA73B
	for <linux-clk@vger.kernel.org>; Thu,  3 Jul 2025 14:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751552829; cv=none; b=gfbk+8cEyZT1yEAAO/qC1aGe6tyttd7fJ73VVXiKI09nz8Lb0tTO5KhUtXnZ1RtqqN51lL+6ODqz+b7HGmt6Mt2QaTDqHnU1hMdTe8eHjGEzQ3b825d0ljQjSpbFa1chsGNDY18XKJsqhkDi1VLf0iTt0Gp8gEP3rPWGg4ZaS6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751552829; c=relaxed/simple;
	bh=abpKxZoDNTtQQe8S2lYs3kQVPNl05CRO44pSFLuAWPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=OrcU1z7uhjdyt5bxZONkqbLNnIC48K3Js//UiMcSD37VWHGO8Y+ejFoQ2f27ENB5a0yoahds+5D85/6LYoGvABJC9mjKaTn9huBRNKLCkOaRRbcDwQCuPeKjiShQUYVZM90FzHPjX3fBVQHP5ey/ds+GpX3YTUrXwfexLpuJ5OE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=oLymzpNN; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="oLymzpNN"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-553dceb342fso7510302e87.0
        for <linux-clk@vger.kernel.org>; Thu, 03 Jul 2025 07:27:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1751552825; x=1752157625; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uf8vdHeGId+ZnF/9F3GWDgFkWjF4VDV823qH2TyLfGg=;
        b=oLymzpNNcYiprpmMJMmujJJgGto79bCBkOSRzwclE4h1TozvFz8kyqj2QKfnBZZls0
         7C3UBgcKU4nOwTLIPihjsjqFXSwUC/Lnm+uLS6XE5QR6NfbOTDev6DzAVqa7ccpw/ZH4
         pncYEOG+gaE0FnSImLHTnDpwgrXZie1kN4aiw/+UDOAN5NvZPRiaHHSpBSXAUP3OFls3
         szfsArs5gh0VIYDZr+L9iWEGuEUqQcJNV+vFIBBHwkvStlYfvxGXiKGKcook3XzPc4vW
         ozKjazg1HusSNyw6gLsxGm+WbZYXU4/S9genoKVSg6pC50/xKl55G0KtlY1zyUtuSJy2
         3Geg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751552825; x=1752157625;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Uf8vdHeGId+ZnF/9F3GWDgFkWjF4VDV823qH2TyLfGg=;
        b=hXDAh4NNkhu96RTbasYvgLJjGqtlrrQ+Ged1DY8fHU5RLk4NHxolF298nxXUl3sw2G
         RDZvoCFUnmI+DPVAoMrqJw2Dp9lPCkrYYChzODfEsReRzLuw8FZ9x6AITHw128i1j5TC
         0QyGH5ZrjAtkyMsW9Y3uaeSs9qFnyovTL9E96xSDNi4xmM1FiFyCRgvMUFf1/Ir60UgL
         CYTSSqtCMN1b25aN5X+9Ilx53uJWpRA8NqWOEWVpkbN5VmdkmFfcWk1zUepWT2BPEYPO
         EvmqyqQuL0xVFImzk6ypjZeMv2vhNegPVW113lDfKbTzq2cyZim37xI42gt1sqQLLre3
         GbfQ==
X-Forwarded-Encrypted: i=1; AJvYcCVsiKF/OpVL6HoNDUcgXAje88SSOIBW0BpqfpeV2puXHE4TAHY1D+BGsL40auUU7kIHK9g9ySM416U=@vger.kernel.org
X-Gm-Message-State: AOJu0YxA6/f4+96+C1adrPB3wEjlGSTfPvnHMjMCH3M44S3JVUZPY5ld
	p5dGg0dM9di0jFpCHHhH06Pj8C0cI06wmosSz2Ipev3aJhoRq6mH4KI4rvwb7cTCra/hY5fu25w
	5zuJYVZgVZp+QasSK44I+f/Yn/h+4nx2jY6xkBxQnDA==
X-Gm-Gg: ASbGncsj9W3FkGe5a1rxPgZWFiIHIhzvA0V7CTa55FE67wiq3U/KGP6bhtdPmN/ZJzc
	Wx3IvegESdFF1ZMr4fPVF+R6ASEsbRNZJkyCzkZ7GVYrkzrfbXuq6p1+Uwuh2CwMTWGU0y3ItU8
	PhP1wOO49FrbXhhR7bVa3aFJ9L0zwdw+0P5Rp4ojAuXZwK
X-Google-Smtp-Source: AGHT+IERNnk/2/Xto87XCFkohZ55sqVf4D9r7VKfYTzDKK+EnAO7K8P2L0DHhu9Is2cxcFQo4XLBsT3o8hs5IshBmu4=
X-Received: by 2002:a05:6512:3b06:b0:554:f7ec:3b23 with SMTP id
 2adb3069b0e04-556282d4f26mr2545624e87.15.1751552825118; Thu, 03 Jul 2025
 07:27:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250702051345.1460497-1-apatel@ventanamicro.com>
 <20250702051345.1460497-22-apatel@ventanamicro.com> <aGUl_S9irfhlHmy2@smile.fi.intel.com>
 <aGZhWlxxQG0Z8awP@sunil-laptop> <aGaLiK0eW8Mc1YC3@smile.fi.intel.com>
In-Reply-To: <aGaLiK0eW8Mc1YC3@smile.fi.intel.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 3 Jul 2025 19:56:52 +0530
X-Gm-Features: Ac12FXxVxoArxYNQOBIoss4C9gX0gtiDewbDa5jJ0LeiFJ8s2mrh5jukau-DksA
Message-ID: <CAK9=C2VjrOvcu=hEfxqw8R6Bwc1W5n9m_ksQ8vx02Lo8232wqQ@mail.gmail.com>
Subject: Re: [PATCH v7 21/24] mailbox/riscv-sbi-mpxy: Add ACPI support
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Sunil V L <sunilvl@ventanamicro.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Alexandre Ghiti <alex@ghiti.fr>, Len Brown <lenb@kernel.org>, Rahul Pathak <rpathak@ventanamicro.com>, 
	Leyfoon Tan <leyfoon.tan@starfivetech.com>, Atish Patra <atish.patra@linux.dev>, 
	Andrew Jones <ajones@ventanamicro.com>, Samuel Holland <samuel.holland@sifive.com>, 
	Anup Patel <anup@brainfault.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 3, 2025 at 7:24=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Thu, Jul 03, 2025 at 04:24:18PM +0530, Sunil V L wrote:
> > On Wed, Jul 02, 2025 at 03:28:45PM +0300, Andy Shevchenko wrote:
> > > On Wed, Jul 02, 2025 at 10:43:42AM +0530, Anup Patel wrote:
>
> ...
>
> > > > -         if (dev_of_node(dev))
> > > > +         if (is_of_node(fwnode)) {
> > > >                   of_msi_configure(dev, dev_of_node(dev));
> > > > +         } else if (is_acpi_device_node(fwnode)) {
> > > > +                 msi_domain =3D irq_find_matching_fwnode(imsic_acp=
i_get_fwnode(dev),
> > > > +                                                       DOMAIN_BUS_=
PLATFORM_MSI);
> > > > +                 dev_set_msi_domain(dev, msi_domain);
> > > > +         }
> > >
> > > Actually you don't need to have the if-else-if if I am not mistaken.
> > > The OF does almost the same as it's done in the second branch for ACP=
I case.
> > > How many MSI parents this may have?
> > >
> > OF already has a well defined interface to configure the MSI domain. Th=
e
> > mechanisms existing today are different for DT vs ACPI to find out the
> > fwnode of the MSI controller. So, it is done differently.
>
> I don't see how. The only difference I see is that OF iterates over all l=
isted
> parents, if any, ACPI tries only one.
>
> So, perhaps it's a time to have a common API somewhere for this to be agn=
ostic?
> Something like fwnode_msi_configure() in somewhere of IRQ MSI core?
>

There is an issue/gap in the DD framework which is being work-around
here. This issue manifest mostly in RISC-V land because in RISC-V both
MSI controller driver and drivers using MSI are regular platform drivers
while the probe ordering is ensured by dev_link support of DD framework
or the frameworks (like ACPI) creating the device.

As-per this issue, when platform devices (DT or ACPI) are created the
MSI domain instance is not available and hence set to NULL. The MSI
domain instance is only available after MSI controller driver is probed
so currently we explicitly do of_msi_configure() or dev_set_msi_domain()
in the driver using MSI as a work-around. Adding a common
fwnode_msi_configure() is only going to be an improvement to the
existing work-around which we should not have in the first place
hence not the right approach IMO.

In the long run, we need a clean fix for the above issue in the DD
framework such that platform drivers using MSI don't have to explicitly
do of_msi_configure() or dev_set_msi_domain().

Regards,
Anup
