Received: from mail-yb1-f177.google.com (mail-yb1-f177.google.com [209.85.219.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B15EE18785B
	for <linux-clk@vger.kernel.org>; Thu,  9 Jan 2025 21:18:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736457498; cv=none; b=ncTcqEuCMO/zAgY6CIWO6ObMsYrR3TWtrUdo6zHdLXGInZqBH9UXEbWrvF8ubztSr5B8EbXppwsjfQKq8HL6WNRsIk6zAVqPVjPrwVK47Pr37gV0po8kZzTfl22GZm9W6KLCFb4UVXAb5yLMWKLL7FIgdIS1otZAGbjOadfBW3Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736457498; c=relaxed/simple;
	bh=s32GlVgBBdY+VzkOiKMWTVWQS+O27/8Vp6BLAnA/bdQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R3iQqVe+TBZq4NmIHBs/oBF1vbICNfFfd7sZeobmg33ViGHyLdM822HaptcSZiHNb9j3QQCUDQ3q/ZgwYOsxxLbTqe/D8TZb6ej41TShSRYXwPmzVJFOo1gNWLTIaIbMXibS38eLv+PRt49JrnIvSKW4L+leFrubbsuuVDJBclE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com; spf=pass smtp.mailfrom=amarulasolutions.com; dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b=UwOQj2mX; arc=none smtp.client-ip=209.85.219.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amarulasolutions.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amarulasolutions.com header.i=@amarulasolutions.com header.b="UwOQj2mX"
Received: by mail-yb1-f177.google.com with SMTP id 3f1490d57ef6-e3983f8ff40so2063119276.1
        for <linux-clk@vger.kernel.org>; Thu, 09 Jan 2025 13:18:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1736457496; x=1737062296; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=id1sh3FCg/7RMCobM0hb+35jgQaJrBVPFNS3Z4VpXrU=;
        b=UwOQj2mXV/I9arM6rXgRM0AucxHWw5TD0fpL30Mj8bNETCRP23E3DauS7llse+WRGe
         L0PVCxvl+cyOMp8P69F75GXzwm14moYdjF2NBqX3qKTWiReVa0A2Dqd9P3bdzWO+AFuj
         yEkRTcJWWF1t0aimT9jH1qxD4zbCD7euxbMUY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736457496; x=1737062296;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=id1sh3FCg/7RMCobM0hb+35jgQaJrBVPFNS3Z4VpXrU=;
        b=ZHdnr6y2a9MErX8ej8Z7zbbVvBx1vpj2YXUqgZ+19YWAW0t+W0IjuL0qwOVk6GnBz6
         L2pWatEZbeAdq/YhkILqfof2O1lH6Fk6gHRrKpInbw6LnYwTVdtwdIjWQj1KygCeIToo
         HjZWl96YmD4N/3aWhBBbhRqQIWQ3mApSC4vh/w42gsV9oowpHrASyvkLUq6sXl+9yrAF
         q8eweeUIe0pfgwj01gqv6j+Pa4XLd6QcRPLZ6ieGgy9NjvyOMtU7nRjd2RdfFU65sENw
         uJSeq+N1lFBUiRwozSCXnLmTRRE/UjW7LN4s0XsSpfx7JfbWXi2Y27uOkUJa4pXot0cZ
         HuoQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+RUluDrHb5Lc+1f+8ndjNtP5wd5UK8mmuXou5+IPffPtjDOEXQ0NTi7VfYHkCYp2293PpWx9vrok=@vger.kernel.org
X-Gm-Message-State: AOJu0YwDVg/+fGgbhe5nzM1josId2p/JzPaxWQjIEtXPR4sgHz5g8Q81
	eWND9Trw8hNvZjZsPy/vbQGkf7nmoGTzK5V2U8AjiL/DOs9VvGQ4OLqnRP9n0ynkordfwuKMcy/
	I2A25L1TiCzL0J5mrGWIFYXkt3iWQ6PP4qdDxoQ==
X-Gm-Gg: ASbGncslaEqQrd8Ix0CO4RH4GWt+74CQXstDPrvioujM8rXewgu6sXETmcAbmn9nHj9
	3iSdRCd8utNyaIb/BJg11/1CyZF+CkwdnUg==
X-Google-Smtp-Source: AGHT+IEitao6xkL4KuruOiZLl8pzkE0Tr8U9XGdZMOjjPpiCZSWKdvOna0N9OTnQBhhi7O+5g4P8CEDUT7rp7zQGK3E=
X-Received: by 2002:a05:6902:10ce:b0:e4a:9ef8:804b with SMTP id
 3f1490d57ef6-e54ee138dfcmr7114871276.19.1736457495749; Thu, 09 Jan 2025
 13:18:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250105181525.1370822-1-dario.binacchi@amarulasolutions.com>
 <20250105181525.1370822-5-dario.binacchi@amarulasolutions.com> <20250108234807.GA1247672-robh@kernel.org>
In-Reply-To: <20250108234807.GA1247672-robh@kernel.org>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Thu, 9 Jan 2025 22:18:05 +0100
X-Gm-Features: AbW1kvaz0srWd9-CXkLWbJC4L5aCPg18CSB1xlYjDSOC4DOcE56GKg2Kqa2-Of4
Message-ID: <CABGWkvpgGNitRfe+qxT9faZ=Oa5+OzbE06dr-0O+w31JOmOQfw@mail.gmail.com>
Subject: Re: [PATCH 4/6] dt-bindings: clock: st,stm32-rcc: support spread
 spectrum clocking
To: Rob Herring <robh@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hello Rob,

On Thu, Jan 9, 2025 at 12:48=E2=80=AFAM Rob Herring <robh@kernel.org> wrote=
:
>
> On Sun, Jan 05, 2025 at 07:14:16PM +0100, Dario Binacchi wrote:
> > The addition of DT bindings for enabling and tuning spread spectrum
> > clocking generation is available only for the main PLL.
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> > ---
> >
> >  .../bindings/clock/st,stm32-rcc.yaml          | 27 +++++++++++++++++++
> >  1 file changed, 27 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml =
b/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
> > index ae9e5b26d876..c345d3ff3fc4 100644
> > --- a/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
> > +++ b/Documentation/devicetree/bindings/clock/st,stm32-rcc.yaml
> > @@ -77,6 +77,26 @@ properties:
> >        Phandle to system configuration controller. It can be used to co=
ntrol the
> >        power domain circuitry.
> >
> > +  st,ssc-modfreq-hz:
> > +    description:
> > +      The modulation frequency for main PLL (in Hz)
>
> No constraints?

They vary depending on the HSE clock frequency used.

>
> > +
> > +  st,ssc-moddepth-permyriad:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      The modulation rate for main PLL (in permyriad, i.e. 0.01%)
> > +    minimum: 25
> > +    maximum: 200
> > +
> > +  st,ssc-modmethod:
> > +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> > +    description:
> > +      The modulation techniques for main PLL.
> > +    items:
> > +      enum:
> > +        - center-spread
> > +        - down-spread
>
> What's the default? If there's only 2 possibilities, then you can use a
> boolean instead. Though I assume you want to support spread-spectrum
> disabled.

Generally, there can also be more than two options. For example, in
the case of the imx8m platform, there are three possibilities:
- down-spread
- center-spread
- up-spread
In our case, using a boolean would hide one of the two pieces of informatio=
n,
meaning that if I'm not using center-spread, what am I using?

IMHO, I would keep the string type, changing it from
on-unique-string-array to string.

>
> Are there dependencies between these properties?

The values moddepth and modfreq are used to calculate, according to specifi=
c
relationships, two values MODPER and INCSTEP, which are bit fields of
a suitable
register for managing the SSCG. There is a constraint between these two val=
ues,
namely that MODPER * INCSTEP < 32768. This constraint will be managed
at the driver level.

Thanks and regards,
Dario
>
> > +
> >  required:
> >    - compatible
> >    - reg
> > @@ -97,6 +117,10 @@ allOf:
> >            const: 1
> >            description: |
> >              The clock index for the specified type.
> > +        st,ssc-modfreq-hz: false
> > +        st,ssc-moddepth-permyriad: false
> > +        st,ssc-modmethod: false
> > +
> >      else:
> >        properties:
> >          '#clock-cells':
> > @@ -118,6 +142,9 @@ examples:
> >          reg =3D <0x40023800 0x400>;
> >          clocks =3D <&clk_hse>, <&clk_i2s_ckin>;
> >          st,syscfg =3D <&pwrcfg>;
> > +        st,ssc-modfreq-hz =3D <10000>;
> > +        st,ssc-moddepth-permyriad =3D <200>;
> > +        st,ssc-modmethod =3D "center-spread";
> >      };
> >
> >    - |
> > --
> > 2.43.0
> >



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
