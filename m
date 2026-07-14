Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2193D3033FF
	for <linux-clk@vger.kernel.org>; Tue, 14 Jul 2026 13:22:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784035346; cv=pass; b=Bh5en4uFomaSLkwl7X8iBfC/wXq/w9Wilk+UqbXagex4QTdI6FkGfrWgP1QH7J/AqH9u00Ubzhs+8vWErIbvkI824eMJGcysZxOQc42Xfq5fSeNj5hDYFDArrHep35jZZejws7OMWWpTe3iX9YcO8bq1ogEOHT/9gh2chEJ8tGA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784035346; c=relaxed/simple;
	bh=7EpWkjOIX2bvUj7bhrZlFgeAZ49Zdzo9NleFTDfsS0w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cNtJMY7YHcTzSOJV2xvQgvw/k2krUvYAsA/jtCmnPEFzGH3nODJqdwR5HWaJO+D2TVhOLf2sVPcq9NWfAIE4gHWSmxWs+WbZyyKJ6EXwx5XYmX1cWu1M4uSJxPaptpeg78UVUgHk+7jqyV6l9sSd1DmeGptUx8vWLHLMbUbzE2c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=B4l90eyf; arc=pass smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="B4l90eyf"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-476a130c138so985227f8f.0
        for <linux-clk@vger.kernel.org>; Tue, 14 Jul 2026 06:22:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784035343; cv=none;
        d=google.com; s=arc-20260327;
        b=nHbkfrlUHhZGiQG5VjtFr4ww0zxKr4j9aIzCOzpCi+4NKcmMpzgaKgsMQgA3e4UlaY
         Qoj9Um0zQLrQtyBHPxnSRkF9prhi/GibTUEwcVU4LWI9cfaLDIOv3DPH5U+h4E74dpOc
         YN55L17NfXg53ojnBaj/VhbdzTyAdabLsBEDBtPyvvgulQ5kJfaG9lVuzJ3lnmJIUtsY
         A8J308Le83XX0NbBpX159pvZIlg8vUxJrGv48a/HuOi+gWkw5fzSWel0fQn30HK1/GqQ
         8UCCK0cxOsMtLMqM0WDjLu2ZPyGA2JvnsYVZ85M6vl7TRUutRpJzP1ZzLjFi8yyM4nOK
         bPEw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=gd9QWw526oknp7pc7L5j5Qo1NtCYrA+LbHXHAVKWIIE=;
        fh=d17UtatQNMPPay1dFedBVssYGuyuo/AlttqQff+TOGQ=;
        b=KlaVLQttPQctSFZEeK+foQvW8dVpkJLyjKnXeNJ8/Vz2osAiDMep+QB3of4sgUT8ZP
         3Wap8r73IDxzvon1W7ClX1TRZZe0wPo5XyLyZWRTAkH6UMypjj6Y9uxpNgf9sDX6zG66
         92jFAX57NyWIpl47BgnLHohK8DPuVV+VMVqedNFSS4ac1uE4xlTOLZ8p4uHT6GTAAwM5
         hRb99IB12Nz4GI1PAeZ3ijA5np6gF9ZcDUMs8hdshIk4qo2GcSnm3ZyFUzAlB2vGL3qA
         e+EPGaYXGJy5yGMWao/8G7yMonxKX/WFELoam0gO8A1cQdt09Jpwa0Q0vjtH8WwR+oeT
         yveA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784035343; x=1784640143; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=gd9QWw526oknp7pc7L5j5Qo1NtCYrA+LbHXHAVKWIIE=;
        b=B4l90eyfla2j6MFR41xOPXv7A4x1XRFSzPN0nowphIxuDh07m0WEWw0M2Sye1SgRy5
         Z7cGxEZTPj37pONqjgCqZ2CxMMSdgLvnZkXNya4mO4/NlD2iNFyuZPtAN7s5nHczZeYk
         hBcsI63u7ss99EzSNJBihvSHm2IERdi5suzh7ED1a35P448C6ldyms8MaCwskKGD0EC/
         SeJZLrdRxykA0fDTz8TJXSDys7cEaZQC9i4et2F9WEm5lcnkd7z0GBq0yJdBoaw4tIaJ
         bV33eXOaS9cnT+XJ8UipXMLXlrzd3Bqzn2tQT6JysybKRizKt1NPeiXkDwjZ4e5+PMAu
         4ryQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784035343; x=1784640143;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=gd9QWw526oknp7pc7L5j5Qo1NtCYrA+LbHXHAVKWIIE=;
        b=IMrjGfCm5y85eymOS51BhkzHtj08vG6RlnICYnBY0qSTuMsTf8b7y+yIPC9r+p6IzI
         2sRUmSxooWwR0n0Cz9XBpamm2FDuIK4yhtFFb1OO7lTl+UILQxZY9NUoiQ8mi/7++Ykj
         Lz2XGpwxBxkv4dbGW4z3+KHxVS6JSIneBwZvIDHQJ2xF4YNxupiezbHliS5fkgG8SwbK
         8v5CTaS38QZoXQR/+lec4oCe0sx9RN/XUW5m6iworl4yhNk7SDhlJsp/PCrlGKDZrHRm
         B0ky0AEaQgqvcI/a2U8a6b+xRNDySuZK4Q9OiqwAnJBlFk3x20yL90dSt7EVD24W7pX2
         dU7Q==
X-Forwarded-Encrypted: i=1; AHgh+RoPL4y5RnMjfGGrqfwlPRNAMX+I8zKaEf7wZZZdNYWa7l1ZJ1JeYRIZSDYTLZd52lUjF1UREuFnYk4=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXAGNMQIzxmym5+rbepb25lGOBaNQxYZYFvGY1VZfkext/dJu2
	bA6gIKQzt8fU4FeavIrfpWiKC6ioTF7eh9Dwig8gM/4bU3XQPxya67XuCLJAajkjAjhXpYQ3ZLb
	CmB0jeXmlFpm9A3lrrd1ba+118s+jDTs=
X-Gm-Gg: AfdE7clTQxK0jcuYMtqWE2v/B4rInazK2gjxHzQuBCnjFnTaDqYvcAjHrmF7ZshXyRY
	4lUpxSlxbGjgQHFvQOYkx93kykmq2pMPmAkayTJqPeXZpKgaGNSiVcipxdwDA+JiaBrUfdksL7+
	3mM0fIzTkh+Smr9xH6FdtqYvDGKBWg2u8lUSkgRZOfuyxKppkNwFh3224JqeH1BjC9KWimiDq6d
	lftA8Ymw+rV96Dcd3/grYvJZLceTlzWnZHBIXkkwpLtCi382l1gPrsMc7q6bVWdTw+097LJK673
	HKJoxC4DkAUEhgzeTokgg/zgwZ2djV3a0xN8QX9UsKHpAH+LCpr6meuTryk=
X-Received: by 2002:a05:6000:612:b0:478:65a8:262d with SMTP id
 ffacd0b85a97d-47f2dcd1a6cmr15559441f8f.9.1784035343221; Tue, 14 Jul 2026
 06:22:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260702123112.161160-2-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdU62updtKeBBk-vO3YP+qaWTGqHQnzKvFJbrz4J5eEPMQ@mail.gmail.com>
In-Reply-To: <CAMuHMdU62updtKeBBk-vO3YP+qaWTGqHQnzKvFJbrz4J5eEPMQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 14 Jul 2026 14:21:56 +0100
X-Gm-Features: AUfX_mx629uzNMG8Nucw8hUhgYkDfx2F61U6edckb4KFpd8R3v5p5R-Ssz_7kJI
Message-ID: <CA+V-a8uWMJo8-WaFiXJQDs97gsrAEJG0-4PYgsp8J1LMjxd4-Q@mail.gmail.com>
Subject: Re: [PATCH RFC v2 1/9] dt-bindings: clock: renesas,cpg-mssr: Support
 RZ/T2H system controllers
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Magnus Damm <magnus.damm@gmail.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-watchdog@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

Thank you for the review.

On Mon, Jul 13, 2026 at 4:50=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, 2 Jul 2026 at 14:31, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > The RZ/T2H and RZ/N2H SoCs features system controller blocks for low-po=
wer
> > management and access control that reside within the CPG/MSSR address
> > space. To properly represent these hardware modules, allow them to be
> > defined as child nodes of the CPG/MSSR controller.
> >
> > Update the CPG/MSSR binding to support child nodes by adding
> > system-controller child nodes using a patternProperty, requiring a reg
> > property and a renesas,sys-block property to identify the controller
> > instance.
> >
> > Restrict these new properties to the RZ/T2H and RZ/N2H SoCs to ensure
> > existing bindings for other Renesas SoCs remain unaffected.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2:
> > - Updated commit message.
>
> Thanks for the update!
>
> > --- a/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> > +++ b/Documentation/devicetree/bindings/clock/renesas,cpg-mssr.yaml
> > @@ -99,6 +99,41 @@ properties:
> >        the datasheet.
> >      const: 1
> >
> > +  '#address-cells':
> > +    description:
> > +      Required for the RZ/T2H SoC to define the address space for chil=
d
> > +      system-controller nodes.
> > +    const: 2
> > +
> > +  '#size-cells':
> > +    description:
> > +      Required for the RZ/T2H SoC to define the size of the register
> > +      blocks for child system-controller nodes.
> > +    const: 2
> > +
> > +  ranges:
> > +    description:
> > +      Required for the RZ/T2H SoC to provide 1:1 address translation
> > +      from the child system-controller nodes to the CPU address space.
> > +
> > +patternProperties:
> > +  "^system-controller@[0-9a-f]+$":
> > +    type: object
> > +    description:
> > +      System controller child nodes representing sub-blocks for
> > +      Low Power Management (LPM) and Access Control.
>
> According to the documentation for the PRCi bit in Section 11.3.1
> ("PRCRN : Non_Safety Area Protect Register"), the low power consumption
> bits are in the xx28_xxxx blocks?
>
Yes the low power consumption (MSTPX) bits are in the xx28_xxxx blocks.

> > +    properties:
> > +      reg:
> > +        maxItems: 1
> > +      renesas,sys-block:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description: Index of the system controller instance.
> > +        enum: [0, 1]
>
> I am not so fond of such "index" properties.
> And of subnodes ;-)
>
The intention was to allow consumers to easily specify which sysblock to us=
e.

> > +    required:
> > +      - reg
> > +      - renesas,sys-block
> > +    additionalProperties: false
> > +
> >  required:
> >    - compatible
> >    - reg
> > @@ -126,6 +161,10 @@ allOf:
> >        properties:
> >          reg:
> >            maxItems: 1
> > +        '#address-cells': false
> > +        '#size-cells': false
> > +      patternProperties:
> > +        "^system-controller@[0-9a-f]+$": false
> >    - if:
> >        not:
> >          properties:
>
> As RZ/T2H and RZ/N2H are rather different than the other (mostly
> R-Car) variants, perhaps it makes sense to spin them off to a separate
> bindings document?
>
Ok, I will split this up in the next version.

Cheers,
Prabhakar
