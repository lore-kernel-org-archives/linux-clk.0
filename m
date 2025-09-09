Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D73F340D84;
	Tue,  9 Sep 2025 13:33:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757424797; cv=none; b=Ybl2itFwYlaPEFCP0RtgGNC7SiLsVpbahOXG5Tu8imqXx3eSvHO2Y0YUa5NM90svYpom2ObWY3jPD8lgI7pytn6cW7/CdsVNdJIB8ya2gVByunjQmuigmJ4+uEc8IR084COLoxbiq3GDH2eWLl1AVsz9C9bUa4yUO3zqrip3LZM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757424797; c=relaxed/simple;
	bh=HvqrxfVpH7iJhCYu7YCrbtWJo9St/OC+LmsQzVrb2yI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Q2N/NP2w2mL65d9cVsGznmrAVLlR281klvYqggzCHajm8HEK6zUaW4yPvEqcc2OJr7N7tYpbQpZYbgMl7xP859aA0n//4eIyxFm9AEtJr2d67DwJpqo7KYg4fZ2+6brSk1sPpd8YK7TqI1w2gCLGdS5W2aP3Ymt9pnECqlB+SZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-55f7c0fb972so6121511e87.3;
        Tue, 09 Sep 2025 06:33:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757424792; x=1758029592;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=OiPDvR6ZseDfZONnWJWsyImGvwysMua8qOuAT6/itt0=;
        b=lgW1xP7/qJO8Ae/ua3obAsNR6BXYFdiQd2uHT7wTyjYrWIa9WMPmpglWP38BmtwNg5
         y2EKt+NyteRwhYLCl4WQ3Vcp8skWqQ5ls4KGv4tQ7T3U7FyRMWihPxGGEl3x6MDVvb7N
         k4HhOKReHMPGIlTNGZlK9AXPKWn09BI3d141h9avvpNuTS1k/pAWFAbipnHbj3HT4Q5k
         CHR8jkKT9yYcyGaW+ty26vMuhBLwrFoSTSouoy5KRG6TxYnNb5d9Tmm+EMAXdBsTvmHx
         6Vpd/VEC3FV6DtHp7a6gG1gcOk0EA7VaA2OEBKaj5Ee+CHEsrnff96jZcN0uO5aIYSio
         cgyQ==
X-Forwarded-Encrypted: i=1; AJvYcCU8w2rJmE6XxQG+W/5EvfkddRV9LLq+AnUaeCc2FLKUQhncblDZMwHwRcXx7HfPHoOd1TziXzpB7XcY@vger.kernel.org, AJvYcCX2o2aFjkJoQSPiXHo6skAFtoIGjD+lECiMbfJd6jQsFzk8BgY/LzSTCYD35kE+pbkQajVI3ax93NbG@vger.kernel.org
X-Gm-Message-State: AOJu0YxoktbY0U7HDrP9I+C2faPxFO/G/m+YiYLUh5EFxKWsrP3f5b13
	uFKd2jisuY0LXl5kGci+NeFJPf4eIwOj6oetQ/IvADcwDSckgfzLmyTVaLAs9WaL
X-Gm-Gg: ASbGncsUmp7AZSNuTx9CzThLSaZwbCty7qY5ILkdkddZEz8eknSCcsKjG21KBQmtK0k
	9GCuCs0p4BdrF/bhMhmk3xiE87nJ+y6qaDDQQvyqb+HNz40z15I1fJjMPaq6w4of48itQgFGNPP
	Lybl8eLNsWY8iKMhU/058nQTb/puZokaihDAkXBvKq2rpLHlcKlZwuVTn3mCsGj/QQhfGTC2stI
	O6myjReIlhotuJG87H9zScfRk7miH/KegCZrO0JkIq4G8nzHPvxwCPAAw91mEtGp0ttWxPK+S18
	XFXSQTqDfbFKb1VQCp/pUzE4zzSxpZODLCQDQpli0xFn6xGVvk85nq+yRdrqAJW7Eq+/t6ypaUB
	7f8vEX7HhT2FfBzePgYe9RnpQsZPi7PKmWnGvobaZIKs6RS7KedAMe1mf0nGzU5pj4Q==
X-Google-Smtp-Source: AGHT+IGofTC5HeARuqmuZ4nFlnyJ/oOrYNFZNubfat4FWSuE8OQiiAorhnhjuHYlLfWmznsANDyTdg==
X-Received: by 2002:a05:6512:124a:b0:55f:33d5:5bbd with SMTP id 2adb3069b0e04-56261314a11mr3544620e87.1.1757424792081;
        Tue, 09 Sep 2025 06:33:12 -0700 (PDT)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5680c424fa5sm534524e87.25.2025.09.09.06.33.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Sep 2025 06:33:10 -0700 (PDT)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-336d2b0ea8dso43580951fa.3;
        Tue, 09 Sep 2025 06:33:10 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUf2fTQa+HIaGkqFRTa4DQlFafzcp8BHCclu7pm81l1QEsm53tRLqpyOm62wDCPjjKSo/CIyM+4dhIU@vger.kernel.org, AJvYcCUkFt8zIbOjSy7FqbcN5fu8Qm5NnN7qzcufgUfMuE59SzvogDuqJi6rq6Ig4ZGWYaRu/UQ3mTs9xWzb@vger.kernel.org
X-Received: by 2002:a2e:a54a:0:b0:338:a33:96e0 with SMTP id
 38308e7fff4ca-33b52891786mr32184271fa.21.1757424790514; Tue, 09 Sep 2025
 06:33:10 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250903000910.4860-1-andre.przywara@arm.com> <20250903000910.4860-4-andre.przywara@arm.com>
 <CAGb2v66DHvE5gcWDvHwoiiCgNEnPiGjB6ash407PwJr8oMwyhw@mail.gmail.com> <20250903112054.173fe7b8@donnerap>
In-Reply-To: <20250903112054.173fe7b8@donnerap>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Tue, 9 Sep 2025 21:32:57 +0800
X-Gmail-Original-Message-ID: <CAGb2v64Cv4BUiwq2kX4OSeRcMU=YC=-CxQTtnQG_-0=B=tsaYg@mail.gmail.com>
X-Gm-Features: Ac12FXwVCVC7-rgwvVDgpfgKJIONLlDmlW4y0Cq7K_8SdacVRdO0XPJ7BtdhumE
Message-ID: <CAGb2v64Cv4BUiwq2kX4OSeRcMU=YC=-CxQTtnQG_-0=B=tsaYg@mail.gmail.com>
Subject: Re: [PATCH 3/5] clk: sunxi-ng: mp: support clocks with just a shift register
To: Andre Przywara <andre.przywara@arm.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	Mikhail Kalashnikov <iuncuim@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 3, 2025 at 6:21=E2=80=AFPM Andre Przywara <andre.przywara@arm.c=
om> wrote:
>
> On Wed, 3 Sep 2025 12:20:55 +0800
> Chen-Yu Tsai <wens@csie.org> wrote:
>
> > On Wed, Sep 3, 2025 at 8:09=E2=80=AFAM Andre Przywara <andre.przywara@a=
rm.com> wrote:
> > >
> > > The "mp" clock models a mod clock with divider and a shift field. At
> > > least one clock in the Allwinner A523 features just a power-of-2 divi=
der
> > > field, so support an initialisation of the clock without providing an
> > > actual divider field.
> > >
> > > Add a check whether the "width" field is 0, and skip the divider
> > > handling in this case, as the GENMASK macro will not work with a zero
> > > length.
> > >
> > > Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> > > ---
> >
> > In my series I have a patch that adds this to the divider clocks,
> > thus adding a P-clock type to the M-clock bits.
>
> Yeah, I saw that, but wasn't convinced this would be better. Hence wanted
> to post my version as an alternative.
>
> > Maybe use that instead? I prefer we use actual matching types instead
> > of disabling one part of a complex clock type.
>
> Good that you bring up that topic: when looking for matching clocks I saw
> we have a lot of them, though often one is just a subset of some others,
> with some code duplication. And we use the pattern of "use type A, but
> without feature X" already, for instance for "NKMP without the K".
>
> So I was wondering if we should revisit this and clean this up. IIUC thos=
e
> clocks were all modelled after the H3 and earlier generation, and the
> clocks have changed since then. For instance I don't see PLLs with two
> multipliers (NK) after the A64 anymore.
>
> So what about we consolidate the various types into just a few distinct
> ones, like NKMP for all PLLs, for instance, and provides macros that
> disable fields as needed? This could ideally be done under the hood,
> leaving the per-SoC drivers mostly alone, hopefully.
>
> What do people think about that?

I guess we could combine the NK* types, since those are relatively few.

I would like to keep the basic ones, those with just one multiplier or
one divider, possibly combined with a mux and/or a gate, alone. These
are based on core clk helpers. We only add features like fixed post
dividers or update bit support on top of them.


ChenYu

> Cheers,
> Andre
>
> > >  drivers/clk/sunxi-ng/ccu_mp.c | 6 ++++--
> > >  1 file changed, 4 insertions(+), 2 deletions(-)
> > >
> > > diff --git a/drivers/clk/sunxi-ng/ccu_mp.c b/drivers/clk/sunxi-ng/ccu=
_mp.c
> > > index 354c981943b6f..a03dac294d048 100644
> > > --- a/drivers/clk/sunxi-ng/ccu_mp.c
> > > +++ b/drivers/clk/sunxi-ng/ccu_mp.c
> > > @@ -236,9 +236,11 @@ static int ccu_mp_set_rate(struct clk_hw *hw, un=
signed long rate,
> > >         spin_lock_irqsave(cmp->common.lock, flags);
> > >
> > >         reg =3D readl(cmp->common.base + cmp->common.reg);
> > > -       reg &=3D ~GENMASK(cmp->m.width + cmp->m.shift - 1, cmp->m.shi=
ft);
> > > +       if (cmp->m.width)
> > > +               reg &=3D ~GENMASK(cmp->m.width + cmp->m.shift - 1, cm=
p->m.shift);
> > >         reg &=3D ~GENMASK(cmp->p.width + cmp->p.shift - 1, cmp->p.shi=
ft);
> > > -       reg |=3D (m - cmp->m.offset) << cmp->m.shift;
> > > +       if (cmp->m.width)
> > > +               reg |=3D (m - cmp->m.offset) << cmp->m.shift;
> > >         if (shift)
> > >                 reg |=3D ilog2(p) << cmp->p.shift;
> > >         else
> > > --
> > > 2.46.3
> > >
>
