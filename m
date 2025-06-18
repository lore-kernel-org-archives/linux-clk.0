Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B2C91B425C
	for <linux-clk@vger.kernel.org>; Wed, 18 Jun 2025 04:08:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750219742; cv=none; b=m9OjK8BpZ4+ZZGw27EJ2w1EnksgCfLR8B22Y46JfFpUIzOpU2k3FyXbDG+PXjg+SP9e/HqPtbtTz+R+dvmpRIQdnSexeWEFO/ta3vbfkECytr6FvxG+QWx4AaAz9y0kElTfwMIMX0O76K3w6XrWlyWcB/zkkUa4p56yvNIiocpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750219742; c=relaxed/simple;
	bh=Rc7QRQavRmVFyB9IhxdzFHRfSkThkI3xPrEYilcz6ao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RLR+0U60UOz2q+BNQWyholD7nTTejr8Ppkd9IvEO7RFCeePfyKFxw8uwLHVW0KF6fkRhqrJEL0uZH1KpSatZ1E5ZLptsX8d3H8+gMMTyLEZ+Xo72GOcWGFww6S2RAzaQKoBTVkDRs6TVy2jK1WRxnKcSRdEjoXdq3raCr37/lHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=A+RsD6GW; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="A+RsD6GW"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-553cf020383so1279715e87.2
        for <linux-clk@vger.kernel.org>; Tue, 17 Jun 2025 21:08:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1750219738; x=1750824538; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hV+4GdLIPduWvDvm4cyTBr7zE4Nr+cAmACWAXvYhmEQ=;
        b=A+RsD6GWOfrrfvbu/18Nxgkut5GandJnIFIRJLjfLD43GYf4I1L539jn+Y8ouXwBKH
         6Sfj39qmJxEIHSbqaryuvh8a8Tmm1cZkGy7WFV/lqOP17/K68i420x77fUskDXzQcWbT
         F/JvBAbeItsVkpyv/A46m9OXuluPHYZ2cXuy+ZbDnG7sEaNMSZJbUnTijrfEjVa+Ph+L
         fBcuMRLUYjP2YHjm/D4OfTkNBSwJ03BBOawOfDEeobrx/TH3RP1EXicMuYRY4yuqXmp5
         zkRTDCLiMRV1HCAG7IO4FOv16t++bmaR0Hkfx0lEssIwsyAQyuoQpZVNMLAkn2IgSatz
         d71w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750219738; x=1750824538;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hV+4GdLIPduWvDvm4cyTBr7zE4Nr+cAmACWAXvYhmEQ=;
        b=RVGgyR/xF/QppOGkJcg/FvR75ykHsLNxDsjvSxO3vxy8PWOxW9kcIX+IpoAE5pLlkx
         SQcU03ADDV9xa365CXOEYhIU4/BmZYRbkW03bn5AuDZ2JnZCcCOdWOEi7dsYW37KdP1k
         JlfWtCTo6CzAejNJjN+r/NS7QMye20L3k2U/QUOdlcmLpo2SRtbPcTgXL3DQ1w5YXt7+
         WqRqTynr3LLhubWV148eH0/J7CymQHHQTTKhsrqZYEEI9QV6AHZtAHjJTYftkfQn3isA
         Uxq4mF7OVvMptwv+GEUZxKND913Jf2aJSCGo7I0GqglqtgljaxfL1PTwWyOoTZep6XwW
         /y5w==
X-Forwarded-Encrypted: i=1; AJvYcCVjqQEqda5SEQVFKCt+huUM/UOYgJKAA/5jzEiR1f3sLoq7i4BbRjxqAp74Egb18OWepESbeRfrzjM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2BqXa5cYm9cTFi9jsMdYNyH6q06fi3AgaU5URVhpuz38dvSGB
	9T3OrQqjpZ9ooxuvjCukTN8RYJ8Xdct1Z3bossWKt/faGGmht2RoHtvOOgAx0aI7WsRn6bVdSxb
	xxac3TMGCQeVg6WrtZIF+CnbFcmyBkspCTut2T0zizQ==
X-Gm-Gg: ASbGncv3u7Q4ccTbm61ISHFuXzAahw/irPSnK1NsdG1ZMXA+/mriOTgQmn9Kh4E8xHi
	+C3NlDfS9eT/wMSK9tPqJAcfZK63Gnnwsg6HaP4w9EelPvG0v+6aqgyKDgrr9eCMenSeld/fHak
	EMFZyGQD8VeGBot38UZOweb0XZvsieckGqlVoL2E6XsQ==
X-Google-Smtp-Source: AGHT+IFnL3eHkaa0AaGa2260XzL4VnwU/UtF89FsaS0XOFT0LH12cqs0j3TtvsOBW7k3zdEpBSYUjjpFngr0GSrWEx8=
X-Received: by 2002:a05:6512:1192:b0:553:addb:ef51 with SMTP id
 2adb3069b0e04-553b6e8c2f5mr3946779e87.18.1750219738106; Tue, 17 Jun 2025
 21:08:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250611062238.636753-1-apatel@ventanamicro.com>
 <20250611062238.636753-6-apatel@ventanamicro.com> <aEmiOFwofEJyXm4R@smile.fi.intel.com>
In-Reply-To: <aEmiOFwofEJyXm4R@smile.fi.intel.com>
From: Anup Patel <apatel@ventanamicro.com>
Date: Wed, 18 Jun 2025 09:38:46 +0530
X-Gm-Features: AX0GCFuSAGiDE5-KiEpx1v8HnSXue_LepxDvBagpnGvUmEgx8W2v2dqjbNj1zB0
Message-ID: <CAK9=C2Xhkfk4WZeD2gVCoJxeRHAuYjSfwx_zUHvVBqOQPLV7Lg@mail.gmail.com>
Subject: Re: [PATCH v5 05/23] mailbox: Allow controller specific mapping using fwnode
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

On Wed, Jun 11, 2025 at 9:05=E2=80=AFPM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Jun 11, 2025 at 11:52:20AM +0530, Anup Patel wrote:
> > Introduce optional fw_node() callback which allows a mailbox controller
> > driver to provide controller specific mapping using fwnode.
> >
> > The Linux OF framework already implements fwnode operations for the
> > Linux DD framework so the fw_xlate() callback works fine with device
> > tree as well.
>
> ...
>
> >  struct mbox_chan *mbox_request_channel(struct mbox_client *cl, int ind=
ex)
> >  {
> > +     struct fwnode_reference_args fwspec;
>
> Define
>
>         struct fwnode_handle *fwnode;
>
>
> >       struct device *dev =3D cl->dev;
>
> This better to be just a declaration.
>
> >       struct mbox_controller *mbox;
> >       struct of_phandle_args spec;
> >       struct mbox_chan *chan;
> > +     unsigned int i;
> >       int ret;
>
> With the above the below will look like...
>
> > -     if (!dev || !dev->of_node) {
> > -             pr_debug("%s: No owner device node\n", __func__);
> > +     if (!dev || !dev_fwnode(dev)) {
> > +             pr_debug("No owner %s\n", dev ? "fwnode" : "device");
> >               return ERR_PTR(-ENODEV);
> >       }
> >
> > -     ret =3D of_parse_phandle_with_args(dev->of_node, "mboxes", "#mbox=
-cells",
> > -                                      index, &spec);
> > +     ret =3D fwnode_property_get_reference_args(dev_fwnode(dev), "mbox=
es",
> > +                                              "#mbox-cells", 0, index,=
 &fwspec);
> >       if (ret) {
> >               dev_err(dev, "%s: can't parse \"mboxes\" property\n", __f=
unc__);
> >               return ERR_PTR(ret);
> >       }
>
> ...this
>
>         dev =3D cl->dev;
>         if (!dev) {
>                 pr_debug("No owner device\n");
>                 return ERR_PTR(-ENODEV);
>         }
>
>         fwnode =3D dev_fwnode(dev);
>         if (!fwnode) {
>                 dev_dbg(dev, "No owner fwnode\n");
>                 return ERR_PTR(-ENODEV);
>         }
>
>         ret =3D fwnode_property_get_reference_args(fwnode, "mboxes",
>                                                  "#mbox-cells", 0, index,=
 &fwspec);
>         if (ret) {
>                 dev_err(dev, "%s: can't parse \"mboxes\" property\n", __f=
unc__);
>
> You may save a few bytes by doing it as
>
>                 dev_err(dev, "%s: can't parse \"%s\" property\n", __func_=
_, "mboxes");
>
>                 return ERR_PTR(ret);
>         }
>
> > +     spec.np =3D to_of_node(fwspec.fwnode);
> > +     spec.args_count =3D fwspec.nargs;
> > +     for (i =3D 0; i < spec.args_count; i++)
> > +             spec.args[i] =3D fwspec.args[i];
> > +
> >       scoped_guard(mutex, &con_mutex) {
> >               chan =3D ERR_PTR(-EPROBE_DEFER);
> > -             list_for_each_entry(mbox, &mbox_cons, node)
> > -                     if (mbox->dev->of_node =3D=3D spec.np) {
> > +             list_for_each_entry(mbox, &mbox_cons, node) {
>
> > +                     if (mbox->fw_xlate && dev_fwnode(mbox->dev) =3D=
=3D fwspec.fwnode) {
>
> We have a helper device_match_fwnode()
>
> > +                             chan =3D mbox->fw_xlate(mbox, &fwspec);
> > +                             if (!IS_ERR(chan))
> > +                                     break;
> > +                     } else if (mbox->of_xlate && mbox->dev->of_node =
=3D=3D spec.np) {
>
> No need to check OF node (again). Instead refactor as
>
>                         if (device_match_fwnode(...)) {
>                                 if (fw_xlate) {
>                                         ...
>                                 } else if (of_xlate) {
>                                         ...
>                                 }
>                         }
>

Okay, I will update like you suggested.

Regards,
Anup
