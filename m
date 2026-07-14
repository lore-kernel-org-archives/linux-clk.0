Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC16A19CCF5
	for <linux-clk@vger.kernel.org>; Tue, 14 Jul 2026 13:15:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784034919; cv=pass; b=Hw62XSfUA9PZ23pbPqYuxB02gIAeJTBgfwjk3SDipnTTT3txZAIgxAQDaC6yjJMbLesMhwo9zo05OhxDRn1Uy68f1XnN8OegtgW+5djwPf/FF4Q1G5Pl/VM6TvIJHnX7lc62T862E7q9EHbSH8TlfJw55D7f3CfSgD/8NkYrkoM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784034919; c=relaxed/simple;
	bh=XEp4xPrufFEiSkrjh9AXuD4jVVMbyf5wsJtN2q7RBEM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XnglJ2J2tze2CdvQxfwzF5Rlqs53ddtnSLA3DsVnu2zFDU27cVsY1nQS4aO57i57ApmdpdwFPjL2gMbVHQwbwgJvzQ1BJEsU7IDGD+6D5qAFUTzibxtfESnnJs8Q2y7K9GOp8ZquB6NiXl7Ee/LTslj6xkqX9NSoMgT8weQIGEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SaGz3NUB; arc=pass smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SaGz3NUB"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-490cf322ed0so31464625e9.1
        for <linux-clk@vger.kernel.org>; Tue, 14 Jul 2026 06:15:17 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784034916; cv=none;
        d=google.com; s=arc-20260327;
        b=JIrIBbwL1fKshboH/UiizaaU2HrPzZ28Ach1xAQg+ZOdugnbeUlbJtGrc6777muGnG
         e4v/KspSNmfEBm/Ka4rm1bfzgSXAdjC5VfLqc6JIaa3E/a4t9k77arQagz8DfRnbNiWU
         8NacVM8o7wUeAhc7x2306e+EBEiDAY2Z8lTCbNKGErtjoMv2oUp3OE6Ki4ep5fjc5VsN
         Gw8CYONibWNNm+yyKOSuPbrdImNI5C+OnVMOAeIUXrgJ8xm33g5g6nvrUFUT/h1bFwvL
         f3H5xvdR0dReFwUEFZGgTDmX1koweP79ztzGY3rP06WqHNqmdt4F9yJnb3eppwYZLnuZ
         lUqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zYR8riHhwHFuYojsg/ml0oqHNKKCoDuF/KqtRlzn4Dg=;
        fh=oby61eDsHWeVZQu8U+/dE7QQjmW8u9FeSKJNleu8vDU=;
        b=CKZXIIOvGMykesKCslB2t0BZMjLAbPZ8toe3IjKUUaMHmSEHTK7em4Eztp4XXxU38L
         Zy114Os3sEitTyqvDkL2Liq0bGKXqNJOfQRNo+uSHOZwWLOmyn90zd52jGHt3E1ycICV
         OTcRHdwWjUUnS5GluFriQ2DJLKyVQvye9kaH7VVkyJ/8pFUPSnscNRC/5KN3I073zW/6
         LmJmsYc1MSSHKRUbBnCFHiFv3odqG9nS/JoRJWg+eynlpnCXvs3WeQWwcslLBzwEy8BP
         XnglabVvrodmjHRWIDpZ9lbN2wIVFlemK9ykGUH5Oa5y3bi7EAetTdADmpixuIuZWj2I
         D7UA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784034916; x=1784639716; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zYR8riHhwHFuYojsg/ml0oqHNKKCoDuF/KqtRlzn4Dg=;
        b=SaGz3NUBQ2GHG8xCmhlhOvvjGUghtG3Ipcsm6tfITrC8ZZnP7nTePufsvZ6cflZpod
         QUizEVUcGU6d3lZddyIMOIv9O1IQh8dsIRjpP9mwPudguyeCdMMrrclFFNEtEBl+AVAx
         gNKfvAEXdo0joezZNbM5vjDxpubz55O09Hq7NJ3t4sGR08aZSdMHP/c/inb9myiKPSdm
         17NC6765bfaG2+JZuS+rXZOQ4WVUICc3rxVqNp+xviP/1lpldG66Be9oCvjI5yzHjtn3
         0rAOq9sF66RKv2BkT/+ls8+LNyuEvHybhO6ch5QhudaEIvhozGg2zYqQfsnytjIhsH/C
         mBLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784034916; x=1784639716;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zYR8riHhwHFuYojsg/ml0oqHNKKCoDuF/KqtRlzn4Dg=;
        b=qqi3r5ClgqJajOR+rBFBLsolKCeAxc/qqSu8J2xYrohq1/RtgVV0AmbyvkUgnu6f3T
         fmHFn1L8kIIPsLQxgyYr9dFF50+9ViAYseT/E42xzl5l4U0imwtrSb58mCH787Uiqbba
         Y6AW8Muv7SfoAXw9qV42D6D6mBdmh7ov4jf9JcPuCagNhRtqxsszllvL5nNYUhNS5TqF
         1RA7Vqmp7X2JpyLSPij+O7HOSielLnRvM92CGxQohq/DCLfmROzfzj1WX9Bq09DICf9c
         GzjtKhk6Ie1xT+k1CS7NV9KoNEoVEpdjGRg3tJ8eYSB0jl/BS+qIyhn+HzFYTgISSgCI
         wBhA==
X-Forwarded-Encrypted: i=1; AHgh+RpwzgSUTqSWEG7u67R2XsiArgmGJsWpIFwhAlhnzkmkz+wl1QKEICVV0xHMwNFNtQAjGqXvQLbPq5A=@vger.kernel.org
X-Gm-Message-State: AOJu0YzVbEY+ffh88FHeUnUxl3M0x7JtXp+7Oocf6hXmd73HVCu+Vgwv
	QyueIpck831owk2VQypml8QkjvkcWGFiKhX2KoZiChgP7ImmNSDErR44YjzQJ7uqTDV9sRWjwLu
	BKEA7FbGoaOMH3L3GyfhkZfJSStQye+M=
X-Gm-Gg: AfdE7cmhiYr9Ucw2ULCuN71t03enk0FP846/mVVVA/tmW7GO01qpEd8TDIVt9HQdIwB
	+S61Se4Mrn9M60XLJeGR/CJ2O4cJQbUxQ+B7H5Y6mJP8bLegDTiOoLy5j5AVEC/JDICJjbxLW+g
	kyw1KGxJiFXFiYhKXPD3tr+QxzoqvyQayc6LwVQJnronZbFfuTKHVFjY3jlVYXlUCVfVQ1XW6Ip
	EhT6otOFlJDZtUy2hYgCGuXvftawgrKb+orKS1D9RWiSthdcKKlmOMt9UI8r4piRYvZ+zADziW8
	m19btEwpqI2o/g4pVHS9qGuyGmHj4bmUK4kG0JNg2x3lmo0izcea8zbbUmE=
X-Received: by 2002:a05:600d:6413:10b0:494:1cdd:4f9e with SMTP id
 5b1f17b1804b1-4941cdd5035mr50422985e9.31.1784034915742; Tue, 14 Jul 2026
 06:15:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260702123112.161160-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260702123112.161160-6-prabhakar.mahadev-lad.rj@bp.renesas.com> <CAMuHMdXYpDfoRhgfhqeU4_acGQj7f4ivEdB3Ms6SKeeSwY5iLw@mail.gmail.com>
In-Reply-To: <CAMuHMdXYpDfoRhgfhqeU4_acGQj7f4ivEdB3Ms6SKeeSwY5iLw@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Tue, 14 Jul 2026 14:14:48 +0100
X-Gm-Features: AUfX_mxf9CoAWS1OaHlxkRnP3RC1vp9ZjYGgKTNfss75dU2ZLfsEhv632kdc6DM
Message-ID: <CA+V-a8t1TbnD14s-d=UVTL58jWA9Sxcyb6mt9tfgAMBUkoJmRA@mail.gmail.com>
Subject: Re: [PATCH RFC v2 5/9] dt-bindings: watchdog: renesas,r9a09g057-wdt:
 Add SYS syscon support
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

On Mon, Jul 13, 2026 at 4:55=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68=
k.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, 2 Jul 2026 at 14:31, Prabhakar <prabhakar.csengg@gmail.com> wrote=
:
> > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> >
> > On the Renesas RZ/T2H SoC, the Watchdog Timer Control Register (WDTDCR)
> > resides within the System Controller (SYS) block rather than the WDT
> > address space itself.
> >
> > Previously, this was handled by including a second register range in th=
e
> > "reg" property. However, this is architecturally incorrect as the SYS
> > block consists of two distinct regions (0x80290000 and 0x81290000) that
> > contain registers for multiple peripheral blocks.
> >
> > Now that the SYS driver provides a unified syscon regmap, introduce the
> > "renesas,sys" phandle-array property to allow the WDT driver to
> > access its control register via the system controller.
> >
> > Mark the use of a second "reg" entry as deprecated in favor of the
> > new phandle-array approach for SoCs that require WDTDCR access.
> >
> > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > ---
> > v1->v2:
> > - No change.
>
> Thanks for the update!
>
> > --- a/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.=
yaml
> > +++ b/Documentation/devicetree/bindings/watchdog/renesas,r9a09g057-wdt.=
yaml
> > @@ -48,6 +48,17 @@ properties:
> >    resets:
> >      maxItems: 1
> >
> > +  renesas,sys:
>
> In Documentation/devicetree/bindings/pci/renesas,r9a08g045-pcie.yaml,
> the similar property is called "renesas,sysc".
>
Ok, I will rename this to "renesas,sysc".

> > +    description:
> > +      System controller registers control the start/stop of the WDT, a=
nd halt debug.
> > +    $ref: /schemas/types.yaml#/definitions/phandle-array
> > +    items:
> > +      - items:
> > +          - description: phandle to system controller
> > +          - description: watchdog IP instance index
> > +            minimum: 0
> > +            maximum: 5
> > +
> >    timeout-sec: true
> >
> >  required:
> > @@ -73,15 +84,29 @@ allOf:
> >            minItems: 2
> >          clock-names:
> >            minItems: 2
> > +        renesas,sys: false
> >      else:
> >        properties:
> >          clocks:
> >            maxItems: 1
> >          clock-names:
> >            maxItems: 1
> > -        reg:
> > -          minItems: 2
> >          resets: false
> > +      allOf:
> > +        - if:
> > +            required:
> > +              - renesas,sys
> > +          then:
> > +            properties:
> > +              reg:
> > +                maxItems: 1
> > +          else:
> > +            properties:
> > +              reg:
> > +                description: Deprecated. Use renesas,sys to pass the o=
ffset
> > +                             of WDTDCR register instead.
>
> the index of the watchdog IP instance?
>
I will update the description to "Deprecated. Use the renesas,sysc
property along with the watchdog IP instance index instead."

Cheers,
Prabhakar
