Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB53B257851
	for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 16:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764087800; cv=none; b=HPmrN4pc6q3RIdyc+oaq74nK0+eu3AxLooe+/2Kndd+8WdTu9f+IXROgGnaIG8fXTDLV7okMzuKwiuV5HfFdEAvNb5jdZLfa3pycAapCI3o9/QrAXCXokr6RbQ3bgoVi38pmDS+B7GMg9owD7WtfMqWoSUUIWeUk702XKqH1FFU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764087800; c=relaxed/simple;
	bh=bQA8qzF5biNR1Lj0F5JHFJgsWm3/jsJC+AwZE5JEy2g=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y+LN/4aIvwUXjYbQyVasezCmAufyZ+nNO9ybdZ6ciLGRTBmOQQyDbwpb89ZNmu+lPAe9r9ub69Y8HwAqZEmG4oPTqFwys/uuB0Xh9D8wlmSDteFYs7UDV5fTkTbnUdbq64jf5adoFml+JraFE74JwwYDAteYsyKQUvFIIzyuB1A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lzJgep7B; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lzJgep7B"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-b7380f66a8bso859080966b.2
        for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 08:23:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764087797; x=1764692597; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FaOOOYND+uk2vAQQfKG3pmDKR8hPRe2Be1ORt0a/EOQ=;
        b=lzJgep7BR20nSJcFhpl01VSsT+nhuUqbfhEdxCAjDrCeM8nVoSbLEIx7HSsj0txnP2
         hKG9V6wtdToqfAs0Zgke2bGGIoi5y25mQvFyeNaVrj8trgdSvq5xu8+Q7NXpIHCpppN+
         IALff7ng/4+F9sW5zSTz4TfghNMiSQXlBBQjcjLeGFYoliY2r5bPV0J7Y5Q9tXBmLJlV
         4NXbdlb63OckjnT7ieR5hUGNJL1bAr4bULllZ4cvH6XqQLJgI9zYjATecnV4qJc6ZQd0
         FyT638mhp28n/CUILZ+bxbWDdy+l9TDvd6i0ZNY9xT7U3B0xONzjpp8YEjPV+Vog0giM
         Smwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764087797; x=1764692597;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FaOOOYND+uk2vAQQfKG3pmDKR8hPRe2Be1ORt0a/EOQ=;
        b=v+NwdCM4aZxmAD6Gy6gv2r536XKIaXRfga4P5hFgCQ3g916F9wJwXA5/yvZKvGWA2l
         49easzSnHUdRVNbhg77ZAVP79vBzCWE4S/LNJJLMaFrmB4SVZxyS44/Z8UlfslQ7D5je
         Zik7KlDSwyoPvbmaBIJ4A4jNUwSKqslGrwxqbcqE+41Y1Z9WRQ5h3zJrGxFItAJ2eNfu
         /IeysHppoTq3p975tXOZAWDgwkWXdtqamaW8IiSWajYgDE9YvgEv4NzrY8aD6+Ri5wu9
         bxtmEkWhPDvShG0khQj9d7Rr1VYrY1lA6dO6dxdCB608nmzg0NOiiTm0wZT1O30JvXH4
         IU/w==
X-Forwarded-Encrypted: i=1; AJvYcCWDtOhHxtRd9zX+G95gZRrt11J+nvBDvw1yrxip6kN+6Y9hNqfQEkQKgGERm/8p+SA+MHbXd83QVHg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwcujKG1gK3nDvAzprjkFVeq8ICjTdMtFAFf4rDLiXoQCbi+x4n
	Z1VIHvQlc+4MO0Gs4OItDDDU+KUFyGyijMlKktIvwvA3HSIsxU6uQbns/RmH+nDOxHbD87F8iSj
	zDxDOx78rhrOkOe+oJuR9/1qIMKorPyk=
X-Gm-Gg: ASbGnctYJSKY1dJi4Q0hcQK6UvC9BD7dPmw1o28PcYgEl1U9Iz1aVCqL7VnrZECZhDP
	/CTt7w3F395y58DNi2UDuxBxxDH7SCGEwBHCVl2x2eqN4our5jtA5pxh3QWeWZk4AoWb+Sq9kgQ
	O+DEDwyL5exf9qmFDKwBegLns2JjpAkZPZAtA5DP0coQoF690pj6Z6Th8bbUUQ4eO/IqChBbfAV
	0Hl0hwlXln+Hur6rQzjTtcXZrCLBbMoIR+6HbpBpJiNc1Dg+UrKorRS60f/yPUg3yM85qcbuVmt
	dHTI9FudShiIO9NyV3zz0LwcDEGmxvpCRDIliOH0xBxkEIJkAeuyF69mKwvuzliucNrmUh8=
X-Google-Smtp-Source: AGHT+IF0FKupXJlv7l8ccQdHK6aSH/RponWlYMEUY+TnPnUy69C2ZJa5Zw67Xl2MrlGaFTJ/eeqF7Z1D6FTomlK/Puo=
X-Received: by 2002:a17:907:6095:b0:b6d:6c1a:319b with SMTP id
 a640c23a62f3a-b7671549cd3mr1757056666b.5.1764087796893; Tue, 25 Nov 2025
 08:23:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125154738.55869-1-antoniu.miclaus@analog.com>
 <20251125154738.55869-3-antoniu.miclaus@analog.com> <CAHp75VdGfrbFdqgaSE1dVR-h6p3Ju6EuvsX-cAh_JVJiTmknRQ@mail.gmail.com>
In-Reply-To: <CAHp75VdGfrbFdqgaSE1dVR-h6p3Ju6EuvsX-cAh_JVJiTmknRQ@mail.gmail.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 25 Nov 2025 18:22:40 +0200
X-Gm-Features: AWmQ_bnv2d-STJF-tWM4vILvV8qR1HwQKXIdZCevYxlUYtiIcG_Dv9Oj-UCIieA
Message-ID: <CAHp75Vc7bmScSdR2R4US-1h9MwE+2tx_Rh+UosdWNk5J70xQpA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] iio: frequency: adf4377: add clk provider support
To: Antoniu Miclaus <antoniu.miclaus@analog.com>
Cc: Lars-Peter Clausen <lars@metafoo.de>, Michael Hennerich <Michael.Hennerich@analog.com>, 
	Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Dragos Bogdan <dragos.bogdan@analog.com>, linux-iio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 25, 2025 at 6:21=E2=80=AFPM Andy Shevchenko
<andy.shevchenko@gmail.com> wrote:
> On Tue, Nov 25, 2025 at 5:48=E2=80=AFPM Antoniu Miclaus
> <antoniu.miclaus@analog.com> wrote:

...

> > +static int adf4377_clk_register(struct adf4377_state *st)
> > +{
> > +       struct spi_device *spi =3D st->spi;

Also consider to have

  struct device *dev =3D &spi->dev;

here, and use it below to make less LoCs and better to read code.

> > +       struct clk_init_data init;
> > +       struct clk_parent_data parent_data;
> > +       int ret;
> > +
> > +       if (!device_property_present(&spi->dev, "#clock-cells"))
> > +               return 0;
> > +
> > +       if (device_property_read_string(&spi->dev, "clock-output-names"=
, &init.name)) {
>
> I would rather split this to two
>
>   ret =3D device_property_read_string(...);
>   if (ret) {
>     ...
>   }
>
> which makes the intention more explicit, otherwise it's not clear what
> the return values are and what you do with them (since I know it's
> int, the rule of thumb to assign to int variable and check it, for
> boolean it's fine to do if (boolean_fn(...)) in the code).
>
> > +               init.name =3D devm_kasprintf(&spi->dev, GFP_KERNEL, "%s=
-clk",
> > +                                          fwnode_get_name(dev_fwnode(&=
spi->dev)));
>
> %pfw / %pfwP
>
> > +               if (!init.name)
> > +                       return -ENOMEM;
> > +       }
> > +
> > +       parent_data.fw_name =3D "ref_in";
> > +
> > +       init.ops =3D &adf4377_clk_ops;
> > +       init.parent_data =3D &parent_data;
> > +       init.num_parents =3D 1;
> > +       init.flags =3D CLK_SET_RATE_PARENT;
> > +
> > +       st->hw.init =3D &init;
> > +       ret =3D devm_clk_hw_register(&spi->dev, &st->hw);
> > +       if (ret)
> > +               return ret;
> > +
> > +       ret =3D devm_of_clk_add_hw_provider(&spi->dev, of_clk_hw_simple=
_get, &st->hw);
> > +       if (ret)
> > +               return ret;
> > +
> > +       st->clkout =3D st->hw.clk;
> > +
> > +       return 0;
> > +}
>
> Otherwise LGTM.
>
> --
> With Best Regards,
> Andy Shevchenko



--=20
With Best Regards,
Andy Shevchenko
