Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E8D2215046
	for <linux-clk@vger.kernel.org>; Thu,  6 Feb 2025 12:17:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738844270; cv=none; b=bEqh3/Y3X623LWvMlZU2w861V5aGrGy0wnaUvW7BV6cLIUi8UDLgTuRYxJQ+jCuHIu5Qy/so/LBWI7MAvG52+VvVtjckrbuX9ie/Oakdw/yUxMsyxyFL6TSd7NZbygqTlDFEEGXYo0BAf9SpRKGjgOolOJ/GnsfyssGSxN82BRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738844270; c=relaxed/simple;
	bh=4cdFR+B95oVkXNiulG1qv9Pup9VHoxewsSMqD4dgVBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=US+o3QfnG7w9mn0RgcdT6PBSwvR5vdHfUKXwyETslLUmoKsWtmnNAP6RUbt7cbtjpIulgByl2f861jMRxHOtcHWPKiIhWvJ1vrjYGwFIY2xYyEgZfaG7G9e3KtT+nCouYt2gHB49cKDtQ9T8kAFppo33PxPviyXnWQmr1OSweXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=iaJ/HPQk; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="iaJ/HPQk"
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-306007227d3so7991351fa.0
        for <linux-clk@vger.kernel.org>; Thu, 06 Feb 2025 04:17:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1738844267; x=1739449067; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kVaPm6svnrZmjjZXaQ6INFYIHurE1c31ambChU45jvE=;
        b=iaJ/HPQkyb/z3PjJ/QEpfQx0Xjpwjgah/jbqVvaqQWz0nNbb9eWZp0Y+ucFlEeziCC
         N7RpO7V0Wkkfi8Qf8vVDQSQXVXokZBrd11qieJEjO5uHuNez7Te7Kooyg67uOh2BWAnv
         l+R+IZM8Rzjw2+lVfb6F5EyGpFFZ/YKZ1tZhO1DwsF8PyTZb5Si+DKf9S4jXUdcJ2ttm
         lWcE7bKU24fSwXHgyPXBXUAM+JKnUzDHjUhMhFE85bEB3BQ9Hcwq6CCAN7MN6BFi7E40
         tzx4FVBokSZ0Ye5OrKnFmb5zlAs4BrXavuc4agTeQH7yF76OO3yeZz6u/vgh0JIIXQGU
         FIgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738844267; x=1739449067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kVaPm6svnrZmjjZXaQ6INFYIHurE1c31ambChU45jvE=;
        b=C7AlstPZcJCHSJTu6fn4YVM/WksbDRAzb2+IK9yykHTnec+PNohHDf+Et/i7JFMc3m
         PvfhXShSfMTLdbAo9V+ogsDlgoioS8XGjhzsUonztH63D/E5Zdn8ZDRkVcN5Upp4cB2z
         PL3mB0rE2NnUKypDeuSDYuuI3Dlzq+8DnjmWHW3UfxIoMubWnQw1L5fkSeqi05Eo4rpW
         yqwkDqS/H4YCz1D3K2xexrOSHp6smm4R6aFMCyxbc7SKejQOwuwD9LpxqgXzn9UyDlh+
         fluCsKyddN43lV223o4B/m13H1v1jFsAJE8kLMnLqTl5EJZ5gx0V0mF51jkD2ujH2ydG
         d7Hg==
X-Forwarded-Encrypted: i=1; AJvYcCVEdsQNMKSniImGX860U2bkYT/RfnWAALKdUKfUrkzmbboHiv5tp9D1i5FzInC9NCBUCpyzUPV3O8U=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw1Asq+b18k1/QUs0LMEZJHa8/SnxwTAlvreHxBx4zZR1HL89zK
	EhdOx205Fhw2k3DbyA7VrD7WlX/HOVPTYMwwP/l6WR6LIhEVYHnjJ3cvaYxsiF1o/fTK9oHC/MD
	vd7Al9o2r0RqRovRtz4HBy3is7h0pT3J5RrjRjQ==
X-Gm-Gg: ASbGncuGhW+bby9YZ8NmgrfEouCWQ5TQdvmiQY0GULOulOUieCetKzXVGSncnQ+oZbQ
	iAZcBLIL1S7LobR1J/1phWxsbHE+SizESNAsxL9p4d0Zye9yIIfxt3PsIG71sSIKFP7lhm9fAcA
	==
X-Google-Smtp-Source: AGHT+IEdOcygqBJ9zpwt9AnW8YGVVzGNtNdwXSyeVHKPWBPAI82GsWsII++eZWvLHpNnJrehz+aGVI+bK2PH2gmRR6A=
X-Received: by 2002:a05:651c:b08:b0:2ff:c242:29c8 with SMTP id
 38308e7fff4ca-307cf386eaamr25840471fa.35.1738844267233; Thu, 06 Feb 2025
 04:17:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203084906.681418-1-apatel@ventanamicro.com>
 <20250203084906.681418-12-apatel@ventanamicro.com> <871pwfp272.ffs@tglx>
In-Reply-To: <871pwfp272.ffs@tglx>
From: Anup Patel <apatel@ventanamicro.com>
Date: Thu, 6 Feb 2025 17:47:34 +0530
X-Gm-Features: AWEUYZnkWoBjjXJZwQi6NEV8e_1cUvMnkW_wF5FuGhI66P5vlROSq0JSDO_qX_Y
Message-ID: <CAK9=C2U537LvffPLGad=LsFsN27uW2UB2X=Oxrub9v2U5vneYQ@mail.gmail.com>
Subject: Re: [RFC PATCH v2 11/17] irqchip: Add driver for the RISC-V RPMI
 system MSI service group
To: Thomas Gleixner <tglx@linutronix.de>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Mika Westerberg <mika.westerberg@linux.intel.com>, 
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>, 
	Linus Walleij <linus.walleij@linaro.org>, Bartosz Golaszewski <brgl@bgdev.pl>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Len Brown <lenb@kernel.org>, Sunil V L <sunilvl@ventanamicro.com>, 
	Rahul Pathak <rpathak@ventanamicro.com>, Leyfoon Tan <leyfoon.tan@starfivetech.com>, 
	Atish Patra <atishp@atishpatra.org>, Andrew Jones <ajones@ventanamicro.com>, 
	Samuel Holland <samuel.holland@sifive.com>, Anup Patel <anup@brainfault.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Thomas,

On Mon, Feb 3, 2025 at 7:20=E2=80=AFPM Thomas Gleixner <tglx@linutronix.de>=
 wrote:
>
> On Mon, Feb 03 2025 at 14:19, Anup Patel wrote:
> > +
> > +struct rpmi_sysmsi_priv {
> > +     struct device *dev;
> > +     struct mbox_client client;
> > +     struct mbox_chan *chan;
> > +     u32 nr_irqs;
> > +     u32 gsi_base;
> > +};
>
> AS requested before please use tabular layout for structs:
>
> https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#struct=
-declarations-and-initializers
>
> > +static int rpmi_sysmsi_set_msi_state(struct rpmi_sysmsi_priv *priv,
> > +                                  u32 sys_msi_index, u32 sys_msi_state=
)
> > +{
> > +     struct rpmi_sysmsi_set_msi_state_tx tx;
> > +     struct rpmi_sysmsi_set_msi_state_rx rx;
> > +     struct rpmi_mbox_message msg;
> > +     int ret;
> > +
> > +     tx.sys_msi_index =3D sys_msi_index;
> > +     tx.sys_msi_state =3D sys_msi_state;
> > +     rpmi_mbox_init_send_with_response(&msg, RPMI_SYSMSI_SRV_SET_MSI_S=
TATE,
> > +                                       &tx, sizeof(tx), &rx, sizeof(rx=
));
> > +     ret =3D rpmi_mbox_send_message(priv->chan, &msg);
> > +     if (ret)
> > +             return ret;
> > +     if (rx.status)
> > +             return rpmi_to_linux_error(rx.status);
> > +
> > +     return 0;
> > +}
> > +
> > +#define rpmi_sysmsi_mask(__priv, __msi_index)                \
> > +     rpmi_sysmsi_set_msi_state(__priv, __msi_index, 0)
> > +#define rpmi_sysmsi_unmask(__priv, __msi_index)              \
> > +     rpmi_sysmsi_set_msi_state(__priv, __msi_index, RPMI_SYSMSI_MSI_ST=
ATE_ENABLE)
>
> These macros are not really providing any value.
>
> > +static void rpmi_sysmsi_irq_mask(struct irq_data *d)
> > +{
> > +     struct rpmi_sysmsi_priv *priv =3D irq_data_get_irq_chip_data(d);
> > +     int ret;
> > +
> > +     ret =3D rpmi_sysmsi_mask(priv, d->hwirq);
> > +     if (ret)
> > +             dev_warn(priv->dev, "Failed to mask hwirq %d (error %d)\n=
",
> > +                      (u32)d->hwirq, ret);
>
>         if (ret) {
>                 ....
>         }
>
> https://www.kernel.org/doc/html/latest/process/maintainer-tip.html#bracke=
t-rules
>
> > +     irq_chip_mask_parent(d);
> > +}
>
> Other than those nits, this looks reasonable.

I will address all above comments in the next revision.

Thanks,
Anup
