Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA750242D7D
	for <linux-clk@vger.kernel.org>; Thu, 31 Jul 2025 05:39:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753940396; cv=none; b=ByWUMUd3Fib+1WhCYTU6xtFRkCkrIRZsIaWPIJ85gcxPSXNbOTph9wcLyODd1e8M8WGKe3gzayE9ctPIoXZCbgwUC89eYWYKI4ibYup8NAJuM83FYqGYv7HMXiOm8HUz1kENuYAZSL+kTxT3ONt8F2Kgt6om9ICswQb7ZwW4t9Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753940396; c=relaxed/simple;
	bh=vsSfQTv1GnUrDdf1LZJoge8igmimcPg14ako4+S5MGk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=U5M189rEdKatyKi/vTDn821pFkV0YwvfOKerBBPUgwBOnbj2NNZ6SCtTHqC+TQXb4hd4KlDF5hpOQ/B1npngSAklLpmtbzhjzA80r9KrtCHIZyyqkLyXuF/tX6xFgK5jFieW/IVoV0Ej1+CKSf2mcicP0cmsYL/418/5IdMJPaE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gmx4QPPs; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gmx4QPPs"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b31d578e774so1077191a12.1
        for <linux-clk@vger.kernel.org>; Wed, 30 Jul 2025 22:39:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1753940394; x=1754545194; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HyR8ctYmx3hEaQQ7Ej343UwP10RXzS7rd++ptfwUqxQ=;
        b=gmx4QPPsmokNl39AxYWgozCwhios3tRzjjRtxZWRQ4W2vVJOEQRMqH0ga6dBOwKqUk
         2nIUWJYp9Q4OVyJ7qeIXMSni5f0TpftPDl8lSaUJaNmkIe0HKffQr2jnWlC0IYFWWgHb
         FJ6Sh9jkX0vuribIgsBW2xwDhHCo6N09RxjwJuEC1Y7ytZFRbfxecY7HlOZ5TeXq8hiw
         6QDjKCj+18ELTAQ+hSFR0qOYbkWNXHWC0u5Z7JrzP7nPZNMXX8XS7lYr+yrs0h9h0jSU
         ikGBXf8TBmZQCBKlzJcGUhpy9d0MvGzachBxOqYlg0QUuwTvTU5Wk5M5hkt7irLvt6Uj
         x9QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753940394; x=1754545194;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HyR8ctYmx3hEaQQ7Ej343UwP10RXzS7rd++ptfwUqxQ=;
        b=iHI2L/leSUvy5uLSOqX0iC/FtxbjPvFOJsqctW6OPdQzw+CU0kI9JOZtGbX7Y1zFrP
         jmdXQb4ZXYrOJUQt+o3DgR7pDpg1wj74FXXpSBJNXlZQMogFHuRjWwnHiAg+L4o+Rm2V
         jyiLmNoLHa/fotRqp98SV8w6Q+AI/1gKUSQGccJbWoOj3WpiipkIB1Qq1xYyF+3lZBOW
         kkA+is6iwP6R9GqkfOTRvMZMXOZNxa/mTDtJ+gJGU+v6jlWBZeipB8K5tG0TcYo3g4qX
         FbC8mIroPDWTNdBr9KGvaKilbiCXzk/TGvR84crL9fcVJ28m4Y4wsJLBdtspmt4KVAAn
         GOeQ==
X-Forwarded-Encrypted: i=1; AJvYcCW45Vu9IjUaeZCvS5uxXEXWfjzZWXYK2SAKx9mMhqxR5y6zv18kYaEf9rrA6H7oCsI5mOBbn9Cm8Ws=@vger.kernel.org
X-Gm-Message-State: AOJu0YxiUWpWVFXg6tYAHY+p7+IBEe4tUBxnSECBEij3qJySkihDcs6/
	JBa1OYcByHZTerc9ZB4d+6zbUF/Sa8ME+VoD5icx5YLKCpUR7U1Tm7de8Au+eqGyFX7+WZayhiU
	CwVjr3Fiw2WQQ+tQ3pXb8t+z9Z2L+KYE=
X-Gm-Gg: ASbGnctakkTPxfE70OkamECiX9NHmpFqR/+rliSxwRYNJ5z6ifhpMTZZfYw5GkXJ5QM
	Yr5gZvgdotWMsSL5yksRfEGtKmcwF6uw6zGNhVg4CuMQ4jp46VZ8msGeH/D6zHvp/4d9TFRoBzi
	A5yznJhGxNTvANrCrh9wpFuQtRm+MdBbhct1xiT5gIhKvkQjacGibbz7m6oYadQGbk9D4R78jZ2
	+TbDibcE/tSpAo=
X-Google-Smtp-Source: AGHT+IEN/5Uprcdhi7MsoFJRqmRXFZ/0UsdnfeTS9e/DUeCreLww1zDlGo75i7TCkRFGHCCKIBUwn6KQMum1mYiQZPg=
X-Received: by 2002:a17:90b:2243:b0:31e:fe21:ca43 with SMTP id
 98e67ed59e1d1-320da5a2970mr1180603a91.4.1753940394106; Wed, 30 Jul 2025
 22:39:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250729033817.1239646-1-ping.bai@nxp.com> <aIqChYG0c2d9yCEL@lizhi-Precision-Tower-5810>
 <AS8PR04MB8642778C7A89226E7CA31DBF8727A@AS8PR04MB8642.eurprd04.prod.outlook.com>
In-Reply-To: <AS8PR04MB8642778C7A89226E7CA31DBF8727A@AS8PR04MB8642.eurprd04.prod.outlook.com>
From: Daniel Baluta <daniel.baluta@gmail.com>
Date: Thu, 31 Jul 2025 08:42:02 +0300
X-Gm-Features: Ac12FXz7cKv6okxguz8Xj7yPba2RBV229ftYfVp9GxCGOkavwmf_UYtiRc0KAyg
Message-ID: <CAEnQRZCVB0+wQVqQYwcvwDW-F-_e6moH+T4pePGsDrbWyVY0yw@mail.gmail.com>
Subject: Re: [PATCH] clk: imx: Add some delay before deassert the reset
To: Jacky Bai <ping.bai@nxp.com>
Cc: Frank Li <frank.li@nxp.com>, "abelvesa@kernel.org" <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>, 
	"shawnguo@kernel.org" <shawnguo@kernel.org>, "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>, 
	"kernel@pengutronix.de" <kernel@pengutronix.de>, "festevam@gmail.com" <festevam@gmail.com>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "imx@lists.linux.dev" <imx@lists.linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 31, 2025 at 3:39=E2=80=AFAM Jacky Bai <ping.bai@nxp.com> wrote:
>
> > Subject: Re: [PATCH] clk: imx: Add some delay before deassert the reset
> >
> > On Tue, Jul 29, 2025 at 11:38:17AM +0800, Jacky Bai wrote:
> > > Some of the PCCs on i.MX8ULP have a sw_rst bit to control the
> > > peripheral reset through SW method. For peripherals like GPU that nee=
d
> > > sync reset, some delay is necessary befere & after release the reset
> > > to make sure the HW is reset into a known status. So add some delay
> > > before & after release reset.
> >
> > Nit: wrap at 75 char.
>
> Thx.
>
> >
> > >
> > > Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> > > Reviewed-by: Peng Fan <peng.fan@nxp.com>
> > > ---
> > >  drivers/clk/imx/clk-composite-7ulp.c | 7 +++++++
> > >  1 file changed, 7 insertions(+)
> > >
> > > diff --git a/drivers/clk/imx/clk-composite-7ulp.c
> > > b/drivers/clk/imx/clk-composite-7ulp.c
> > > index 8ed2e0ad2769..710fe4f84465 100644
> > > --- a/drivers/clk/imx/clk-composite-7ulp.c
> > > +++ b/drivers/clk/imx/clk-composite-7ulp.c
> > > @@ -7,6 +7,7 @@
> > >
> > >  #include <linux/bits.h>
> > >  #include <linux/clk-provider.h>
> > > +#include <linux/delay.h>
> > >  #include <linux/err.h>
> > >  #include <linux/io.h>
> > >  #include <linux/slab.h>
> > > @@ -36,6 +37,9 @@ static int pcc_gate_enable(struct clk_hw *hw)
> > >     if (ret)
> > >             return ret;
> > >
> > > +   /* wait before release reset */
> > > +   udelay(1);
> > > +
> >
> > It is quite small value. udelay()'s implement is not necessary to acces=
s MMIO
> > register space. (arm64 use cp15)
> >
>
> 1us should be enough as the GPU IP reset propagation only need 128 cycle
> of its own clock(> 200MHz). the first udelay is to add some margin to mak=
e
> sure the GPU clock is stable.
>
> > writel(val, gate->reg);
> > udelay(1); // it may less than 1us as what you expect, because previous=
 write
> > have not reach target place yet.
> >
> > It needs a readl() before udelay(1) to make sure value actually reach t=
o target
> > place.

I think we should capture this explanation in a comment above the udelay.

/* wait before release reset */ doesn't really tell much. We should
explain *why*
a code change is needed. The *what* is obvious from the code.

thanks,
Daniel.
