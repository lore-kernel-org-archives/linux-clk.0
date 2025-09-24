Received: from mail-qv1-f42.google.com (mail-qv1-f42.google.com [209.85.219.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228012FE567
	for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 11:52:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758714777; cv=none; b=gEOtlLZ+vsExjM8fB9cgBXYlVYXJqRKSdZY1Mp2TKKrkiNIYIymo44+zSo1iT7qQdD/CrLhtWQyVXmDLIE5NO5cDvbsHL2brhrsiIywG9AEq14PXQafJHCAJJxAcoNklt747LX0z47bfTgQEfzBIkHAILboaxjjMRS3OhQgRdMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758714777; c=relaxed/simple;
	bh=F2T9cBlXa2Aul5PaZEk7a5BmBGQxeyNBSTLZ+tD9rX4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=N7dBvBhYO5lZ3pREeE8aPu8aVzuHsmDdqnWACEV5hqHmqUQkY9fnLF3/5Sv/u3oHBAA8TU5352epM/pg9quOk9oJ/bnt5x3WUGa3qKZJQ+cq1IK+sYIRS2At5x2R7+EyDjQlzcfebcIAas11AJ+FYdT4J6AbwSPBzL52lBr8k2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.219.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f42.google.com with SMTP id 6a1803df08f44-79a7d439efbso49093806d6.0
        for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 04:52:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758714775; x=1759319575;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IXddTGI8uaXfvwfDYhb5Vv63RMQiOgf8BHFZrk9FEJU=;
        b=kQcDBSsTlRdzEk/m4t8W5/Ksv+G3Hn1fHgqE4I0ifL3UOT+k/2nt6k7cOcizOPB790
         7CyB+7j/l86W/MVImWKQKam3Ynwx5vLiX4PGQ6h6yAb2fVvwFWcj8d0JkmZIYp/K7MBD
         adjBbrunx78+epE7iPqxGNqCnCENhmiNzJ69ep3Y+Xi4marUQZlIe411nzDZDtF20LIQ
         YPIKIOxWLGX8wVhf868MARKTSn3ICL+WxPFDr2bHPz3daNR5wP+Go/eubNa+3S/fnogN
         kDU/AlB/LbW7yGeBUFC1r+wQqdLrQlQeZ3VqlPhmXbKK3kmp5m5ngiK6Zya0i20kMktp
         bXiw==
X-Forwarded-Encrypted: i=1; AJvYcCXblDXQAk7Y8XbEtdInlpxp4RdBO6O8uOCWBKWLOmXy2KaJK/d9EwivdRocgJf5g78703kOTqui920=@vger.kernel.org
X-Gm-Message-State: AOJu0YwjtlhiQNW07pcW/xJHpl9f9+3KJdwEmy/OH4b85/5khUq9bjK7
	QBTmot6I7X7U6bUC30WYh8Kfn6gGJdzk4FbUpfesURCbaWCae/h0My1qsLygTt3w
X-Gm-Gg: ASbGncuhjumYO7DWHCCmEYSO1YTDffccCIftB44liPcEEd3+45VR/HCL0e3aQD+/xtK
	U9F27G3wVPB33rb0sLG9Le9DnIb+sdd4kMe/aoPdHUsdOPLJeiORY62vc22xcx5WoQV1TKgndl+
	jNsNsCrfDr6vE7VEvb5vjg9TSiwh/bQbdrYW64dWcVglJPvO9nVwdrDF/749o6uCS0dXmNoYetK
	J5ebSSaPG6puP36FlLBEmB5Lo7wDjKnsaW59jit0vT9b4HpR1rSO/cqzl7mRMcOVDgSWVcM2f/2
	To8QTIK/IDow/FAg/1Lut1zvs/1P4uDOawf50yCVyc69jQcmsYtmLM2EerIcLWfWvAybPSrI3eC
	U0+uxO7gUY+1lnhxmNUINgBt7fLdQ+/EOvPSCoL0H/vxEDsQS29gk3mBRuAx9g39K
X-Google-Smtp-Source: AGHT+IH2Yg4Kvbx9jRbTtFtGBimVbEdMDd7Bd7jZ9rE769F9Ngg4fPgCF35QaySVPiR7CKuGLsgt+w==
X-Received: by 2002:a05:6214:ac1:b0:78f:62ef:5a50 with SMTP id 6a1803df08f44-7e715454c27mr65311626d6.42.1758714774712;
        Wed, 24 Sep 2025 04:52:54 -0700 (PDT)
Received: from mail-qt1-f169.google.com (mail-qt1-f169.google.com. [209.85.160.169])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-7e1553c0c29sm35801136d6.43.2025.09.24.04.52.54
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 24 Sep 2025 04:52:54 -0700 (PDT)
Received: by mail-qt1-f169.google.com with SMTP id d75a77b69052e-4c88e79866aso27858621cf.1
        for <linux-clk@vger.kernel.org>; Wed, 24 Sep 2025 04:52:54 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCU7GQlIYZBWzVlzRZX0GJEBTm6rJ5RhjkEvGPeg1WdeVeX+KVxpfE9NIdKYnGPwYDaeLzvzhrWO3k8=@vger.kernel.org
X-Received: by 2002:a05:6102:50a5:b0:59d:458d:b629 with SMTP id
 ada2fe7eead31-5a57a7cbc00mr1938022137.30.1758714461166; Wed, 24 Sep 2025
 04:47:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250923160524.1096720-1-cosmin-gabriel.tanislav.xa@renesas.com>
 <20250923160524.1096720-3-cosmin-gabriel.tanislav.xa@renesas.com>
 <CAMuHMdVEDJZ6wdGZs_CDs=jLPV1u382o6=cZ1HfKQOffGf7jGw@mail.gmail.com> <TYWPR01MB88052A16F01666B693EE28E3851CA@TYWPR01MB8805.jpnprd01.prod.outlook.com>
In-Reply-To: <TYWPR01MB88052A16F01666B693EE28E3851CA@TYWPR01MB8805.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 24 Sep 2025 13:47:29 +0200
X-Gmail-Original-Message-ID: <CAMuHMdV_-F5S+PvPOpvJ9nE9uhR+nGsK8m3fum9OUn3r9PKJWw@mail.gmail.com>
X-Gm-Features: AS18NWBGLDA1OtvFhfhRzZsHpYufqx92wigmowEKITBkUz8CBA3NmIgNrG3GBeU
Message-ID: <CAMuHMdV_-F5S+PvPOpvJ9nE9uhR+nGsK8m3fum9OUn3r9PKJWw@mail.gmail.com>
Subject: Re: [PATCH 2/7] dt-bindings: iio: adc: document RZ/T2H and RZ/N2H ADC
To: Cosmin-Gabriel Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
Cc: Jonathan Cameron <jic23@kernel.org>, David Lechner <dlechner@baylibre.com>, 
	=?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Geert Uytterhoeven <geert+renesas@glider.be>, "magnus.damm" <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"linux-iio@vger.kernel.org" <linux-iio@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"

Hi Cosmin,

On Wed, 24 Sept 2025 at 13:33, Cosmin-Gabriel Tanislav
<cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> > From: Geert Uytterhoeven <geert@linux-m68k.org>
> > On Tue, 23 Sept 2025 at 18:06, Cosmin Tanislav
> > <cosmin-gabriel.tanislav.xa@renesas.com> wrote:
> > > Document the A/D 12-Bit successive approximation converters found in the
> > > Renesas RZ/T2H (R9A09G077) and RZ/N2H (R9A09G087) SoCs.
> > >
> > > RZ/T2H has two ADCs with 4 channels and one with 6.
> > > RZ/N2H has two ADCs with 4 channels and one with 15.
> > >
> > > Signed-off-by: Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>

> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/iio/adc/renesas,r9a09g077-adc.yaml
> > > @@ -0,0 +1,170 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id:
> > http://devicetree.org/schemas/iio/adc%252
> > Frenesas%2Cr9a09g077-adc.yaml%23&data=05%7C02%7Ccosmin-
> > gabriel.tanislav.xa%40renesas.com%7C8c536bc422b9440a018708ddfb401335%7C53d82571da1947e49cb4625a166a4a2a
> > %7C0%7C0%7C638942974801495945%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiO
> > iJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=0zAY5VARxHP%2FN0wV7Gv1%2B9DZi%2Bg8JzBbi%
> > 2BkzCDdN59M%3D&reserved=0
> > > +$schema: http://devicetree.org/meta-
> > schemas%2Fcore.yaml%23&data=05%7C02%7Ccosmin-
> > gabriel.tanislav.xa%40renesas.com%7C8c536bc422b9440a018708ddfb401335%7C53d82571da1947e49cb4625a166a4a2a
> > %7C0%7C0%7C638942974801538982%7CUnknown%7CTWFpbGZsb3d8eyJFbXB0eU1hcGkiOnRydWUsIlYiOiIwLjAuMDAwMCIsIlAiO
> > iJXaW4zMiIsIkFOIjoiTWFpbCIsIldUIjoyfQ%3D%3D%7C0%7C%7C%7C&sdata=VlYwNJVc7W%2BnLFKHf%2FG2Gk0HfWSsQ58cR0a8
> > fQpckwE%3D&reserved=0
> > > +
> > > +title: Renesas RZ/T2H / RZ/N2H ADC12
> > > +
> > > +maintainers:
> > > +  - Cosmin Tanislav <cosmin-gabriel.tanislav.xa@renesas.com>
> > > +
> > > +description: |
> > > +  A/D Converter block is a successive approximation analog-to-digital converter
> > > +  with a 12-bit accuracy. Up to 15 analog input channels can be selected.
> >
> > The documentation for several registers talks about bitmasks for ch0-ch15,
> > so the actual hardware block supports up to 16 channels.
>
> Maybe the hardware block can support up to 16 channels, but on T2H,
> which uses a 729-pin FCBGA pacakge, ADC2 only exposes 6 channels,
> and on N2H, which uses a 576-pin FCBGA package, ADC2 only exposes 15
> channels. On both of them, only 4 channels are exposed for ADC0 and
> ADC1. As of this moment, this binding describes the ADC hardware blocks
> of T2H and N2H, why would we use 16 here?

Because the description at the top describes the hardware block,
not the restrictions in the integration in specific SoCs.

> > > +  renesas,max-channels:
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    description: |
> > > +      Maximum number of channels supported by the ADC.
> > > +      RZ/T2H has two ADCs with 4 channels and one with 6 channels.
> > > +      RZ/N2H has two ADCs with 4 channels and one with 15 channels.
> >
> > According to the documentation, both SoCs have three instances?
>
> Yes, both SoCs have three instances and (obviously) we've tested all
> of them, as they're exposed on the evaluation board, as defined in
> the dts patches in this series.

My apologies, I misread.

> > > +patternProperties:
> > > +  "^channel@[0-9a-e]$":
> >
> > 0-9a-f
> >
>
> 15 channels max for N2H, which is where 0-9a-e comes from. f is not valid.
> Do you want to document 16 channels on the presumption that the hardware
> block has 16 channels, even though only up to 15 are ever exposed out of
> any SoC currently supported?

Exactly...

> This can be amended when/if we add support
> for an SoC with 16 channels using the same ADC IP.

We can do that later, more churn...

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
