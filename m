Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34AE523315A
	for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 16:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764087718; cv=none; b=LEsoos9TeeJ7r7WRz0PsczDEsUJU+c354uKik3MEF+jWeBH0EsjvjbIfuvsO/bafWDyo1T+1f6N64srkoM+BWwAnBmbLXReOVLxo0uMR+PH78dlrzNztUFm7ZGd3UbfPjM7DomjL5zEbuZasZzByn7RspBSW3k+XnbU3ergKiEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764087718; c=relaxed/simple;
	bh=gsqoBe/P+gDXSg+Co7lmatw2lDoEMGYKSHIr2hmgxPk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HDd7/9x7bM/0ezLngm/p+AD18Q2v63EAdldaYh1xth6AkMg09jfVUB4lQGeTFlpGfDHplHB429WoBYarevDk+fQW8jHOnTxUhAlb9TPfLTUdaKwKGF5W69W8BzH0Odf3asQ8iObOJOfV+s2TqY0wSgzCBm5Dpqz5/KM6JUJ910A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=d0QkPZLY; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="d0QkPZLY"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b73b24f1784so100719566b.0
        for <linux-clk@vger.kernel.org>; Tue, 25 Nov 2025 08:21:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764087715; x=1764692515; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eJkq02ikHZSwRsClVSJ/tPC8U25hKZKbxH46PlYpMBA=;
        b=d0QkPZLYaJsJ87+/2GO4+X2kiuBsO9o9WOxXHmlML8zuMabRzTFHckZU991VXIS9B/
         AEkm9AwM8748Idl6rj1n9WuX+fhUkb+mEXyPwvXjDwXmF+axyC1t51a3q+fLuGHyQTvM
         2Qe9npu7vqDsOSEOiZeBBaC9XRSRWsxayfiPeU5fQTWZbUB/XzE0OQA5fO8HQU1QEkaf
         1Mytp5Sfo14janC7gI1Zw1roefFLDexQ/Ds+X/tdlUMtjfmQxjfHi+jmS6FJu1etX3uN
         s7J4Z329ta8feuzPEHUsbo1llMgV4DHlGCZgd8QW9zSKhTsmYQYnx7YVeD+CddqLd6J/
         WFEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764087715; x=1764692515;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eJkq02ikHZSwRsClVSJ/tPC8U25hKZKbxH46PlYpMBA=;
        b=tPKOuIcMUMiw3F2CrF+PGkuZk9WZLISsCGYNKqeSrzyFbOENWTWS5LxEYvYQZAkX9A
         uNLGFahHdJSyQATOadtottYFCW9zUgegnraq7vkEYPiiQ4ShSLPPyNfh/gTQzpEohow3
         FATuXllEh5KKwZ0ga9yF122pgT6xZvd+1eylZNzCjXnFoRUybpyN7Zns7CY8lOk4P5Gk
         z/i2+OSaGYiBa5sI7S62IGFrOphvGNA0Rjgh5HTAUhIkk//H2pIPkUXHqa4tWtrH5xDg
         eFkrTogH7P862LnB2BBSjY6yJZdVbrtjHA44ZIJfNHeSKx7Rcu5fJT77end8Duur907o
         4qPw==
X-Forwarded-Encrypted: i=1; AJvYcCXNTqHsC4YMwZYl3Phgmsj6d/YV07hDU5uBeXN70EvSl0AVpcD4AltEjV8lCxjMiUO0iAPUlrAFGXY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxvF/p4UXiv0vY7E/r5AW4feP84uSzrk1+pjHes4DekrCg4uaAE
	S3hNmB0codq6TyA3kUPQX8qW3pVOm0m3rF3j+rcLJwmsQ0iGcCMV2XQeXXmyphtZRwM1YZC0QYS
	Vnhz75fwCkBlJrpEyCZos5mOncI2Bip0=
X-Gm-Gg: ASbGnctKHVZCnNAXH4xmitPbsvGt3co7UORJeWnseCDkHS3E2r4g7x3jH3jP5zC6E0E
	m+NxuQOf0RbB2di8xv0u8n/vHFUo9n5S6Ni9Gu745RKrlQsb57mXeEIiMWEhHe3yrs1JB7ysm47
	Xh+6T16PUbYJ+yIWhSDzYa/S8iIYyc8Bo4+NStzEe5Xyni/GaZfVOUHUAzWxY3Ba4iVhhYEzycn
	CHX4ubyvNY/y+vn9YS1dpFD9xz6jn2cO9r4BQ78JrQogvisujHgiZCl0Rrrinfag0xEzAMjSRQ/
	shGAQoK/0Utfe3V0Tyfgq7SeTeKerbusa06jPewio3DDyFtc7BucCNYRyoyEcxNw+9GZ1V4=
X-Google-Smtp-Source: AGHT+IFaTuSNKW949J7wt7ryuKboB6N1PqIuF4iN44UphE8qw1LNveP1OKQkxeS5iDn3VJkMetN5CqPzDk1CBYMFVQY=
X-Received: by 2002:a17:907:3da4:b0:b70:b9fe:aa56 with SMTP id
 a640c23a62f3a-b766ef467f7mr1852708166b.20.1764087715095; Tue, 25 Nov 2025
 08:21:55 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251125154738.55869-1-antoniu.miclaus@analog.com> <20251125154738.55869-3-antoniu.miclaus@analog.com>
In-Reply-To: <20251125154738.55869-3-antoniu.miclaus@analog.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 25 Nov 2025 18:21:18 +0200
X-Gm-Features: AWmQ_bmmTaf3QFSVuCUpoe3z9y2Yzukb3QzUTHbBjNW8T7W_p12_sn3XyqS2VAw
Message-ID: <CAHp75VdGfrbFdqgaSE1dVR-h6p3Ju6EuvsX-cAh_JVJiTmknRQ@mail.gmail.com>
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

On Tue, Nov 25, 2025 at 5:48=E2=80=AFPM Antoniu Miclaus
<antoniu.miclaus@analog.com> wrote:
>
> Add clk provider feature for the adf4377.
>
> Even though the driver was sent as an IIO driver in most cases the
> device is actually seen as a clock provider.
>
> This patch aims to cover actual usecases requested by users in order to
> completely control the output frequencies from userspace.

...

> +static int adf4377_clk_register(struct adf4377_state *st)
> +{
> +       struct spi_device *spi =3D st->spi;
> +       struct clk_init_data init;
> +       struct clk_parent_data parent_data;
> +       int ret;
> +
> +       if (!device_property_present(&spi->dev, "#clock-cells"))
> +               return 0;
> +
> +       if (device_property_read_string(&spi->dev, "clock-output-names", =
&init.name)) {

I would rather split this to two

  ret =3D device_property_read_string(...);
  if (ret) {
    ...
  }

which makes the intention more explicit, otherwise it's not clear what
the return values are and what you do with them (since I know it's
int, the rule of thumb to assign to int variable and check it, for
boolean it's fine to do if (boolean_fn(...)) in the code).

> +               init.name =3D devm_kasprintf(&spi->dev, GFP_KERNEL, "%s-c=
lk",
> +                                          fwnode_get_name(dev_fwnode(&sp=
i->dev)));

%pfw / %pfwP

> +               if (!init.name)
> +                       return -ENOMEM;
> +       }
> +
> +       parent_data.fw_name =3D "ref_in";
> +
> +       init.ops =3D &adf4377_clk_ops;
> +       init.parent_data =3D &parent_data;
> +       init.num_parents =3D 1;
> +       init.flags =3D CLK_SET_RATE_PARENT;
> +
> +       st->hw.init =3D &init;
> +       ret =3D devm_clk_hw_register(&spi->dev, &st->hw);
> +       if (ret)
> +               return ret;
> +
> +       ret =3D devm_of_clk_add_hw_provider(&spi->dev, of_clk_hw_simple_g=
et, &st->hw);
> +       if (ret)
> +               return ret;
> +
> +       st->clkout =3D st->hw.clk;
> +
> +       return 0;
> +}

Otherwise LGTM.

--=20
With Best Regards,
Andy Shevchenko
