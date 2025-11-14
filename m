Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com [209.85.160.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F15D81E5B7A
	for <linux-clk@vger.kernel.org>; Fri, 14 Nov 2025 14:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763129762; cv=none; b=dLH4FKi/ENB+oxVEd2SsUlO6S3KnM+G8j0do6majCCA5rv5HpVMVwZbPfeqifGAtF/QEyUEsyxax4UPpc8US5I/Q0SMegglsUOM0xEnujVdslZC+qI/0919K5EabT37FqnntshwjCejyf2kXEZIow3Jcj8R+K32lowe0txBUVLc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763129762; c=relaxed/simple;
	bh=84XtXMYyLrUslFVhsAI6sSkRE/oTRpyap+QZDKrDWFg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=I6+vsPDsH79EkbFftYMpLl/h5+QXE0HATqBA6v0gTNVyk6U0IWZ35Q+ZzGcLloFwEvyfkWiLuR4eKL4aQg6hakVlje8EYa/BIlSXzzMsv/D3QWqaxJDeC7R4YFBWit1k4XFUwGeXURBMYjb5XKo2bCwEEad+ANOoeMtVml1GcTw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=d+yGzJqi; arc=none smtp.client-ip=209.85.160.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="d+yGzJqi"
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-3d18422565eso1400579fac.1
        for <linux-clk@vger.kernel.org>; Fri, 14 Nov 2025 06:15:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1763129759; x=1763734559; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=605KA+j3WIIvcfzgxWg8ZYVUvIOsOaWV0PzJBY7zgrk=;
        b=d+yGzJqiXKzogYgTY2d6Z5mnKMNUTWq4zQZeYtMm7LUfWgTJ7iw6nd7v2PkC9mmEFp
         VdkK0uZK4leU25RzEiS4CZjUvKveQkZROcMeSlOXNtBsKr3nGN451gjDM0FW3ILi7OyY
         KVnrWag8ej+ri3IRb55MTGhDqOQCXrVI4upRNZg3DQ51juV+nZJJ5uopWJE2boEcilxU
         8hCBpbD0Lj2h//9tJI3ovkVtceSnR/uGFjRPQLBWTeU782E1x6SX7B3txpf+PHRnIy4L
         C3nWCm8/LZVp2PK99gB89IHJBhkpQ3LAdgwrKSCd05RGWCoiGgAQ9gR2GFggoC/RXJpH
         vsfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763129759; x=1763734559;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=605KA+j3WIIvcfzgxWg8ZYVUvIOsOaWV0PzJBY7zgrk=;
        b=Ohszut0MyTJ8uC+h37JYLGLhgfiAHdC5W2yyDK0Cz8VOCGKhssEfWWyPAVcwxy89Us
         2kiK2B2hrHI6OeZyWdVgeh15T8PotHTlKFgrAklvtg9iFliJQVkcry9CutBHmqbrX0tT
         0r1cYeSGIusIzhnJuzmgv9033thQaY9r8YpH0tGf1LL1C2PjbzLniVIMjW9TEiIaqiWs
         s5xgyo7Bo2SN6mkyp6BsKxsMMfZ0SqE/QWYHH+dRUQUDSY9rNQHdQnRpN4muYJTC5E+A
         3um6jGZ8xVWbI/MZTMiaZkyMiwqWVnob8XFw4zAnpH8f+xt90KxMJoQus9a+m81Bz0EU
         cFvg==
X-Forwarded-Encrypted: i=1; AJvYcCUqlV4f8ZR5G2oT0apwFpQdJ+lMMoKP6rQ0U+crJNDBScyEYQRiQ5nCU2h4GhwjjbjN2Gnq5SiF+iI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwCf0G6k0gWTtaW3Fm9Sha5o2xKgq+AzV2YoJLl/Bt1FnaFpNA8
	9Fp6gDQBXgPQNcu/b7Zwy3a4GOyOkiV8SljzWc1dP7/c3TAKBYSjdyzomCefHfsLVQpD3+FLblC
	FeoIouuIOP5bzOns2mDrfsKJ6jq8v3ULiR2lR9kIj4w==
X-Gm-Gg: ASbGncsMpcKojbtuNvJTdv8H8VHXFpdD621ofjRiKDlL4oInwiaYvVJQaPLyb4JHf0F
	zfwvThhxhnCFDuMXoRIWLzQim95eUN5cFn/aB/rnFpIHiMeS+8BUhHOaTJBiSLSB1TDHbpvkjn6
	c61sH61erlmPqJnxgS+GDn7/HJkxYNEh3rT4BjNAG6IxAuCD+sdfCR7cW4YkG0WWatJxw0kcp6+
	VOaI5xTdSA8YzjSHroZn7PTTdTRBRD8xno5Q65MZgkIdwIl7stPF1oEBQs5
X-Google-Smtp-Source: AGHT+IHFAOcopcMRDmLLjpXIMGkDicnHz6DOQWd9hkogRhyGcqfzsm1tRjKsU007mKGUgCn3eB5pyfIzXQ5lLIUbgl0=
X-Received: by 2002:a05:6870:7182:b0:3d4:cea7:62b5 with SMTP id
 586e51a60fabf-3e86920a732mr1731868fac.48.1763129759003; Fri, 14 Nov 2025
 06:15:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251110-automatic-clocks-v4-0-8f46929f50b7@linaro.org>
 <20251110-automatic-clocks-v4-1-8f46929f50b7@linaro.org> <3bb47929b08370d9114ff1dd6b0d0f16d354d63b.camel@linaro.org>
 <9c344c5f43e71f30ccbd07b201eb470ed8e5fe35.camel@linaro.org>
In-Reply-To: <9c344c5f43e71f30ccbd07b201eb470ed8e5fe35.camel@linaro.org>
From: Peter Griffin <peter.griffin@linaro.org>
Date: Fri, 14 Nov 2025 14:15:48 +0000
X-Gm-Features: AWmQ_bnLz1hABBDAKCHnQD782gXnmLLLuHhSJOeNXuWZEnGWp9H0xn505uSki68
Message-ID: <CADrjBPr1ny7u7jFHdB5dbAytx2C_MsR7gPL9m-=0BiZZzPEhiA@mail.gmail.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: clock: google,gs101-clock: add
 samsung,sysreg property as required
To: =?UTF-8?Q?Andr=C3=A9_Draszik?= <andre.draszik@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, 
	Tudor Ambarus <tudor.ambarus@linaro.org>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Sam Protsenko <semen.protsenko@linaro.org>, 
	Sylwester Nawrocki <s.nawrocki@samsung.com>, Chanwoo Choi <cw00.choi@samsung.com>, 
	Will McVicker <willmcvicker@google.com>, Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	kernel-team@android.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Andr=C3=A9,

Thanks for the review feedback!

On Tue, 11 Nov 2025 at 09:57, Andr=C3=A9 Draszik <andre.draszik@linaro.org>=
 wrote:
>
> On Tue, 2025-11-11 at 09:54 +0000, Andr=C3=A9 Draszik wrote:
> > Hi Peter,
> >
> > On Mon, 2025-11-10 at 14:21 +0000, Peter Griffin wrote:
> > > [...]
> > >
> > > diff --git a/Documentation/devicetree/bindings/clock/google,gs101-clo=
ck.yaml
> > > b/Documentation/devicetree/bindings/clock/google,gs101-
> > > clock.yaml
> > > index 31e106ef913dead9a038b3b6d8b43b950587f6aa..5ce5ba523110af3a2a774=
0b8ba28e2271c76bddb 100644
> > > --- a/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> > > +++ b/Documentation/devicetree/bindings/clock/google,gs101-clock.yaml
> > > @@ -52,6 +52,11 @@ properties:
> > >    reg:
> > >      maxItems: 1
> > >
> > > +  samsung,sysreg:
> > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > +    description:
> > > +      Phandle to system registers interface.
> > > +
> > >  required:
> > >    - compatible
> > >    - "#clock-cells"
> > > @@ -166,6 +171,22 @@ allOf:
> > >              - const: bus
> > >              - const: ip
> > >
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          contains:
> > > +            enum:
> > > +              - google,gs101-cmu-apm
> > > +              - google,gs101-cmu-misc
> > > +              - google,gs101-hsi0
> >
> > Shouldn't this be google,gs101-cmu-hsi0?
> >
> > > +              - google,gs101-cmu-hsi2
> > > +              - google,gs101-cmu-peric0
> > > +              - google,gs101-cmu-peric1
> > > +
> > > +    then:
> > > +      required:
> > > +        - samsung,sysreg
> >
> > The above still allows (but doesn't enforce) samsung,sysreg on cmu-top.
> >
> > Maybe it'd be better to invert the test, as cmu-top is the only
> > outlier, and then the binding doesn't need to be updated when more
> > CMUs are added (untested):
> >
> >   - if:
> >       properties:
> >         compatible:
> >           contains:
> >             const: google,gs101-cmu-top
> >
> >     then:
> >       required:
> >         - samsung,sysreg
> >
> >     else:
> >       properties:
> >         samsung,sysreg: false
>
> obviously then: and else: cases should be swapped.

I'll send an updated version with these suggestions integrated in a moment.

Thanks,

Peter
