Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 082D9BE46
	for <linux-clk@vger.kernel.org>; Sun,  4 May 2025 10:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746354659; cv=none; b=CkF6feCjkWSzvHr2lhwqdL6Hnj+BHMwIjTpmKybDBuoab/tEs6aRGWrn/sdexFJMelhN4lchLxdRveGEaCefeK72gi3kSchT0WClk9qXi4O9EtmcLcJN62TYLOq7PQQFaI/5GfZVL/FrsxQdB8eSZaHrbv/q17Fwsb7ZBKeczu0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746354659; c=relaxed/simple;
	bh=5Vt32/mzW7To5gxktaMPYCwNX8VfOskPjy+4EUsg/NE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gpAwS/wsVpKF7P+WjkDwC3aIttUKM2XczJAa2tCRLimjfyFjqfPoWVZKVUD+3Uy/qLxzgeE7aMtpQ0O2MGiHSbaN6F4WvRaLkcKubd3Z+1KvB/UxmL4/sG6Nh8AutvxkPIrgIVECYc8cfY2Jnhz9AvwHb3WTGTUOGDm+kjqESU4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com; spf=pass smtp.mailfrom=ventanamicro.com; dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b=AnZslsJ5; arc=none smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ventanamicro.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ventanamicro.com header.i=@ventanamicro.com header.b="AnZslsJ5"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-3106217268dso33260861fa.1
        for <linux-clk@vger.kernel.org>; Sun, 04 May 2025 03:30:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ventanamicro.com; s=google; t=1746354654; x=1746959454; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ctjHK3tz3fFaUotDjbzNh8QkxmVX8TEvt8HdzjtOs8M=;
        b=AnZslsJ5YPYZ3/fdOgSYi8SQ3uzfs9GiFMUeA8U2lSpTBsg50afeBlSDUbwhEzbLrq
         FYbTX80WvJg7TChPJS517n67kL0wsJG3XIhBDhrfmpp13b8Erd8bNrYD/qyCpsltBBk7
         R13umQR8wOspkUKF0CJDFAAi/qhJI6rO4uvSkUKWij8wS1p23wMTo/H2RyREGGByghl6
         /GgweOSG/hpfnuRXh4ZYJINocBWhC4u4tzMk/ACTSNbS16S3NCpSG7DJwznyI2hTypJ8
         1gsQSSKCWkmny+hGLex4MEQpJGtZ31k4VL8GOBr+Ffu9S7YUnsjfyr6B3szvGATUPwyx
         PHpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746354654; x=1746959454;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ctjHK3tz3fFaUotDjbzNh8QkxmVX8TEvt8HdzjtOs8M=;
        b=mtYYzzJzTLPzL5Z1IBagXxzqrnfgDSE8d18rBT49mWIaGMoPvSjbfBpszrOGhPDFvK
         uNSZdypTL86WgkHgJi0yz9xG88a6q+DLnBEZl3mHPVA6SFxrDSsWou88rqg0Mi1mA4Hx
         syWNXC2t9DtHoL+xHp8jl/F8p7ouZ7JNLYSwF3SknAWeCCjego66ifqbmigUS4rVTNS8
         VVDdnPbQIoDo3uvDMX0A4h/k3391NaXVoEON1PlvedIG8KFtCBRg8fcE593qdIB+YvlY
         8LseA71R7temXUC8GdBznbY9N+UGef5kdDuismyf2LPDpGDJDEt6gW5TOTsKPG3CPZ6z
         p6OA==
X-Forwarded-Encrypted: i=1; AJvYcCXrqvW1w9aEzDZdWJyEHLmMfu+rgrLfIN54YGIXbgpPR6ku3eEagS3M47Emd092x1bcy5ZNTKkRZ+w=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3CHbc5WYUJSq7rSMgbg37VCLe8oJAV1473lQib/jmUPER1mRY
	3NeA0NhJ8xg+epdezDvBXkN0CWllcHfzW7W70eIPkoSUDM61YBchRxnEFwdd3lJxPYaWU7jroMq
	DKsEWbg8zzqaNcT1W2lG4TJmsy+mGTf2UvqTPfg==
X-Gm-Gg: ASbGnctaMnGXmnqUE5Bqz9wYY3H3lV4+F3wADmLPmvUFqul4Pps95T0OB4RFoHve03G
	ZdjCKL/PJh1m2tvd2xkKzv970u0py9PNXsfn9KL2HtI7XCbE6z28V3usgzOZCQYh0ZMgRnFyF96
	/lLn9Ae/CIqgQUE1FBeZtoIFyXlpFUk4g7
X-Google-Smtp-Source: AGHT+IHNddMh1MAEdaXyMhFUP3hPex+9ap5FzT1qAWDbC5vR9D0r3RQgxeM0Z7vpOyFKStYTnjvZBtG4mnuesFckMjo=
X-Received: by 2002:a05:651c:1511:b0:30b:ad2c:dfe4 with SMTP id
 38308e7fff4ca-3235211023amr11830601fa.30.1746354653993; Sun, 04 May 2025
 03:30:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250203084906.681418-1-apatel@ventanamicro.com>
 <20250203084906.681418-9-apatel@ventanamicro.com> <20250203225140.GA483650-robh@kernel.org>
In-Reply-To: <20250203225140.GA483650-robh@kernel.org>
From: Anup Patel <apatel@ventanamicro.com>
Date: Sun, 4 May 2025 16:00:43 +0530
X-Gm-Features: ATxdqUGUPU3OFwgF9F3HEI1t-oVp4wPJkT1-hzjaASNwyPdtsiItmeAO9QQEekY
Message-ID: <CAK9=C2WKjDUGc5Se1nG=XTp3wn5ZytUcnghO_u85bSoqGiwmvA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 08/17] dt-bindings: clock: Add bindings for RISC-V
 RPMI clock service group
To: Rob Herring <robh@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jassi Brar <jassisinghbrar@gmail.com>, Thomas Gleixner <tglx@linutronix.de>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>, 
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

On Tue, Feb 4, 2025 at 4:21=E2=80=AFAM Rob Herring <robh@kernel.org> wrote:
>
> On Mon, Feb 03, 2025 at 02:18:57PM +0530, Anup Patel wrote:
> > Add device tree bindings for the clock service group defined by the
> > RISC-V platform management interface (RPMI) specification.
> >
> > Signed-off-by: Anup Patel <apatel@ventanamicro.com>
> > ---
> >  .../bindings/clock/riscv,rpmi-clock.yaml      | 77 +++++++++++++++++++
> >  1 file changed, 77 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/clock/riscv,rpmi-=
clock.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.y=
aml b/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
> > new file mode 100644
> > index 000000000000..c08491c04926
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/riscv,rpmi-clock.yaml
> > @@ -0,0 +1,77 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/riscv,rpmi-clock.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: RISC-V RPMI clock service group based clock controller
> > +
> > +maintainers:
> > +  - Anup Patel <anup@brainfault.org>
> > +
> > +description: |
> > +  The RISC-V Platform Management Interface (RPMI) [1] defines a
> > +  messaging protocol which is modular and extensible. The supervisor
> > +  software can send/receive RPMI messages via SBI MPXY extension [2]
> > +  or some dedicated supervisor-mode RPMI transport.
> > +
> > +  The RPMI specification [1] defines clock service group for accessing
> > +  system clocks managed by a platform microcontroller.
> > +
> > +  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +  References
> > +  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +  [1] RISC-V Platform Management Interface (RPMI)
> > +      https://github.com/riscv-non-isa/riscv-rpmi/releases
> > +
> > +  [2] RISC-V Supervisor Binary Interface (SBI)
> > +      https://github.com/riscv-non-isa/riscv-sbi-doc/releases
> > +
> > +properties:
> > +  compatible:
> > +    oneOf:
> > +      - description:
> > +          Intended for use by the SBI implementation in machine mode o=
r
> > +          software in supervisor mode.
> > +        const: riscv,rpmi-clock
> > +
> > +      - description:
> > +          Intended for use by the SBI implementation in machine mode.
> > +        const: riscv,rpmi-mpxy-clock
> > +
> > +  mboxes:
> > +    maxItems: 1
> > +    description:
> > +      Mailbox channel of the underlying RPMI transport or SBI message =
proxy.
> > +
> > +  riscv,sbi-mpxy-channel-id:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description:
> > +      The SBI MPXY channel id to be used for providing RPMI access to
> > +      the supervisor software. This property is mandatory when using
> > +      riscv,rpmi-mpxy-clock compatible string.
>
> That constraint can be expressed as:
>
> dependentSchemas:
>   riscv,sbi-mpxy-channel-id:
>     properties:
>       compatible:
>         const: riscv,rpmi-mpxy-clock
>
> Please double check that works.
>
> > +
> > +  "#clock-cells":
> > +    const: 1
> > +    description:
> > +      This property is mandatory when using riscv,rpmi-clock compatibl=
e string.
>
> Similar constraint here.
>
> Though the only thing the 2 compatibles have in common is 'mboxes'. I
> think it would be better to just split this into 2 docs.

Yes, it is much simpler to have 2 separate docs. I will update
in the next revision.

Regards,
Anup

>
> > +
> > +required:
> > +  - compatible
> > +  - mboxes
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    mpxy_mbox: sbi-mpxy-mbox {
>
> mailbox {
>
> > +          compatible =3D "riscv,sbi-mpxy-mbox";
> > +          #mbox-cells =3D <2>;
> > +    };
> > +    rpmi-clk {
>
> clock-controller {
>
> > +        compatible =3D "riscv,rpmi-clock";
> > +        mboxes =3D <&mpxy_mbox 0x1000 0x0>;
> > +        #clock-cells =3D <1>;
> > +    };
> > +...
> > --
> > 2.43.0
> >
