Received: from mail-oa1-f45.google.com (mail-oa1-f45.google.com [209.85.160.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E01E3FDBE0
	for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 12:12:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.160.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779106349; cv=pass; b=eC04ZG+V2jOpzLjqExVYcL/OT4cpbHghF4t64j2ABSJTvCcobimM/2lx7+htyeeP/l9xLPat32vwNi0w+MgDA9fbJFR0Y3PVriayIlTVKl9u4RlX5kyUhpGwQhxayCYGixVhus9cEIAs5Q2F7dXxyxRsg8IVWUz1/KpuBWDsJUM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779106349; c=relaxed/simple;
	bh=+pjglSoNCdgBptdVhyy8LktTr3U1L09HEcs0xxWA71s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PrP0t2bgFtRgWGymqA66515xrBxslUAHQqJwNi/Azqpf5p9G5DygDA6PsmpOCVPl/CkPSkVZSGsl9ypfeo8UJmAIXCGEuotzA4wmAzLy9C2xRGmyTHgODuYZkc0Hk+bpB7Q/490GGXA3nJ8D+m9GRPNVnp0H4qQxpC2Hm/HuQNQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SwXs6OQ5; arc=pass smtp.client-ip=209.85.160.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SwXs6OQ5"
Received: by mail-oa1-f45.google.com with SMTP id 586e51a60fabf-40427db1300so1977213fac.0
        for <linux-clk@vger.kernel.org>; Mon, 18 May 2026 05:12:27 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779106346; cv=none;
        d=google.com; s=arc-20240605;
        b=S5k509tqs9dbeJSTzhLJBqGkaaXbBO05UyyH1Wj+xOdr0DHSBrOf/c7E+D5wLMLKAI
         nA/xKyh8BuPrgX8T8PJtK8LqGPP3N2xyfNEoikRH/Ft+EeNWJ7JYbeUcOb5SwsQj0RVB
         GTaVOkJ/+Fcu4PcKcu3CZhR/pJHxB3N4Yibe8kn2+r0QbnCcer1e/sx8DJqHy6MKSU/k
         bs1pHDNXjxVdmMCuiYcBJ0Vs3NXczFcXaG7Mz6n1XilWytfxHji22ecUoagSprVCpx6z
         QGGM8mr1nf8YkdfEAlRq5DsgWuh94JKa6LHZ9dm2UzQimjSHbCXwJZUW/4JiVZ9i5GU6
         i+5w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gR/JMgwHIGnov4jJORAsohc2/OHhVqo+T5J3Eipy6jk=;
        fh=k5dHJ/t9xv+8C1B/DlSa79XE1gQIUyXSobX9zbBxvW4=;
        b=ZG6nVeDV83vW5HQ+qGUGJPNsnQ3cODsD122pF/O29bPgTDRCYF2/CrothPSMM+dN09
         wMpA/V5x8K7rf69azNEdwadOnVV6OQA+T10IuSoJLGvqWrLbH/BvcCxqJYtO7kVxoqJa
         40mU7D3TYkbHVmqBfZsYJYCvZM1gkz12Qy8iprCaEcsZ8I5wkbzdRAz2ihPuG//N9VSz
         uzZC6XoRMhJFwY0WCqsDY2gi1d5T/XDGqfqbElZ6BiSRZqEKQVYpYGi31joz0dkMEGzS
         QZFoZWGiC3bL/lbcpi/1N7y9MZXqJ51Xq0FDzpj6N7V4/O4r2ei6popp/dUJy9honkYF
         jtYg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779106346; x=1779711146; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gR/JMgwHIGnov4jJORAsohc2/OHhVqo+T5J3Eipy6jk=;
        b=SwXs6OQ5z69J5tgJO1t2U5PncFxTxSL5u0eJE+wURW3jAebIi6YSPXxM4w4ibBxaDo
         Lv/yzPBPwvRZEq8TpuQDIvj4vvSJOXC+foRYmdpTy/I8YIGu4f8PEe3FKwWnGJEa1qVZ
         E47thJNv7LrP5SQagSmPZyLMerksScEN/ILDxpRsYvt3uwwOtwkOQ92HKGI9QQZEUjCF
         I0IRZmR76BndRqcKmoMcEbIT4fxbjXzkiPbtwob3r+BNUPJJmZOvbs/b+Ch196+6fP4K
         XMl1gYP5dQrIpgAlkhraRCTNxg3GHlPuwt8+fbLI2dvI0o9HwcVJFbMx8LTLHQdLZljx
         uoQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779106346; x=1779711146;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gR/JMgwHIGnov4jJORAsohc2/OHhVqo+T5J3Eipy6jk=;
        b=rGfCQcmJG4MD8HKMAeytrNlj4pS3zNfYgBaiKmW5BExGbyoCB6ojIl4QnYMGhA09RR
         gQeR2ZFmxhp4I+pDPDFP2BHFfvssHLJc0GgzdXsbeWFjBZ/YF0wp+8icyib7ldh/AwV2
         sPTj2GfpiuDDV2d2x/STxepy+UvLihT/2imM46i3Z+R5iWWpeeDV8txiP9RPubNtRjSe
         BDEH2FDONEmL7iTRu4o3Cjw8AQ0PgzSYipzbWShZ9O7vLNqyMlNYyzxHe8E05VN1vlra
         ggPmPt8I/8pwmLF8Ff5b2j34P4qzg/FvasO2ryDWb9MVBIARjANuw2cSOHbXQ7RQhLY+
         MHiw==
X-Forwarded-Encrypted: i=1; AFNElJ+euw0JXM55TUanecc3AUF1k0VZL4nw2Gp2ZC7UF0xtJ6kntT9P3GnZf+9TK/2YQs19YxC8S28vYzU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3G/V/Usqpggy5VPrU5dhZ+19qorXbqWRPPS6gGLl6jKU/oj5k
	xw9IM1vshvH9AyUMDbK3ISEGWOS/j5K+it5XY7WqBzHs8AEjV5T0VKsNutOTZ+4k48ozI46PG0t
	dvv3HN4294fi/6P/nyztFTe2h9N9KGjA=
X-Gm-Gg: Acq92OGrhD2qK6ESkhegAnF05Uhm5J8/19GO70sVjW+0abKEJFh1jscEKwKB3E6k8b1
	4MkT8z+4vszHRP/Bu2Fjs3pDKXWy+7BE8HZcWEaebVMALsmEV7YAxHYAwrCred5odWcPKCbq5aQ
	ev3f7ZfTpkt2oEcp67vxT7+KANQjV15gyxGtaC96ibnLNeez5oCb7QexUNzKmL3Q6g9ogkmCEsR
	/DvkJZYFLh0g3q5I/hi68mncw1nHXY3hL5zSinaKz4cho0PWcOsNKlQ2ZmgsGjVDP1k1Lc2rTxc
	jsuZrQHlgrdsSyPOaos=
X-Received: by 2002:a05:6870:f614:b0:435:25e8:35c6 with SMTP id
 586e51a60fabf-43a2dd80027mr9688351fac.23.1779106346181; Mon, 18 May 2026
 05:12:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260517-sf21-topcrm-v1-0-438f2e0513ff@gmail.com>
 <20260517-sf21-topcrm-v1-3-438f2e0513ff@gmail.com> <20260517-popper-rage-b675785e4d28@spud>
In-Reply-To: <20260517-popper-rage-b675785e4d28@spud>
From: Chuanhong Guo <gch981213@gmail.com>
Date: Mon, 18 May 2026 20:12:14 +0800
X-Gm-Features: AVHnY4LDWingZwX-Nz3-YuHewnevoFTSPFgHGYd3CYxO_sW22m2PP6ryO25_4Js
Message-ID: <CAJsYDVK+tOUZcF7rzP+og5JV2gkNS4WfGhq_hJVNvfUvQLZZrg@mail.gmail.com>
Subject: Re: [PATCH 3/4] dt-bindings: clock: add doc for Siflower sf21-topcrm
To: Conor Dooley <conor@kernel.org>
Cc: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi!

On Mon, May 18, 2026 at 4:50=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> [...]
> > +
> > +  clock-names:
> > +    const: xin25m
>
> Is a 25 MHz reference required on this SoC? If not, name here is
> obviously problematic if it can be something else.
> Not much value in clock-names anyway when you only have 1.

You are right. I'll drop clock-names and use index to grab the
parent I needed in the driver in v2.

>
> > +
> > +  "#clock-cells":
> > +    const: 1
> > +
> > +  "#reset-cells":
> > +    const: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - "#clock-cells"
> > +  - "#reset-cells"
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/siflower,sf21-topcrm.h>
> > +    / {
>
> Replace this / with "soc".

Will do so in v2.

>
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <1>;
> > +
> > +        xin25m: clock-25000000 {
> > +            compatible =3D "fixed-clock";
> > +            #clock-cells =3D <0>;
> > +            clock-frequency =3D <25000000>;
> > +        };
>
> Delete this node, it's not needed in the example. The tooling will fill
> it in.

Oh, I didn't know that. I'll drop it in v2.

>
> Also, please test your bindings since this doesn't pass.
>
> pw-bot: changes-requested

It's failing on the example as root node missing "model" and "compatible".
and it will be fixed after changing "/" to "soc".
I'll remember to run the full dt check instead of using DT_SCHEMA_FILES
for my single file next time.

--=20
Regards,
Chuanhong Guo
