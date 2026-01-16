Received: from mail-yw1-f175.google.com (mail-yw1-f175.google.com [209.85.128.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB7B92E2679
	for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 21:48:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768600130; cv=none; b=RNcrFD4JVVWP8Rx12hDPthcuTHWJBkA3kriiktjMK4PjtGM94MaDeTRUmEci1U3dl09ZbsbrpNC5uppRjY4eHpf2YeOqsN9TAWin9oQ4/5tO97MIH78TDJCKYvdmhaNks2N21nnLyDnuOYh4ukgorPjHRADiJOxnbJyUOn+FDUQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768600130; c=relaxed/simple;
	bh=YUlJc7Sr3zDM3jr9HxQY7NThbaP+oqVN9MaKS4Seviw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=h9sLweAGXbyeHRimK4l2af8wMH68mLMEJBAdgA/EiAqGTkBwN2LvJsOb4t8iPNtd5vpHCSi0eTkI7RWSSEsuKdDi14Ee1bmcQ6tBREszT0pfWU3kCjgO1p0vFwW3CQHG6F68ZLs/dpZVNm/ON52qAYg3rSoCMJrVlejq4SpPcSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com; spf=pass smtp.mailfrom=tenstorrent.com; dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b=ZRbpPk/E; arc=none smtp.client-ip=209.85.128.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=oss.tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tenstorrent.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tenstorrent.com header.i=@tenstorrent.com header.b="ZRbpPk/E"
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-79018a412edso24817347b3.0
        for <linux-clk@vger.kernel.org>; Fri, 16 Jan 2026 13:48:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tenstorrent.com; s=google; t=1768600126; x=1769204926; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mY05kIgIMl2dh4w/PgKOxyQ2I8chWiVdB03iWdA4Tog=;
        b=ZRbpPk/E7FRnJ7BMYHtVIliZZqZnvfJtHgkTCmWXbbat7JE2BTe5eKVdYVOyoAAYq1
         VYM1NLpdyxVQKz6jR+d37CWqpSdWuuyAbShxVH+jGA5hEc4S//i1gV0B8DfWAElCHBN5
         /NAFr6oSsfWbZmz8EDiBUHznXH1Eipv2483tDLYtNPoB+mM7I3i/Gs9kJDdbwKDNQsoI
         7hO8QgfKWx6IAJvQSp21coL+RQtofqb8u8gTR5figsZSHhnoR7uNiCnz0Hv+0d0B/mPm
         NiO8sVpcQOoKROgzRw0zal7XV6LnfMFbuYEhCx7GBOSRtYfej38OwlphZftRnAMMfhd4
         Xgsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768600126; x=1769204926;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mY05kIgIMl2dh4w/PgKOxyQ2I8chWiVdB03iWdA4Tog=;
        b=e07FEhDeqtBuPfVMOzlezKC8tHla5WFKibs6y4BeADFYsMB97WJzjamI5lr0O8CysN
         TAjwTYAEbotOlptes5uQItMKFwVoHU1yf7qWmetpcPe3/dWPk0H3BnQkGf1M7Z3Jpu2S
         T6sw0v6OaKRx+kdWeQPkx3VL1NbpdjVAnkJLQuUuUXgjCmwXztx81dzH2SCb5Dq6j2Hu
         i8xaxBfAusLtKOg5G+yvRmDU7H7jZ1Twh0efuADmxIGsEKUuQ+RG/2e8wxC0H8y44xTv
         dOd9vJnExcetEzFmULIcx5Q9d9fO1GTLD5ZPChPGT/1lJU/YhH2NHFcOCf6Gg4DJpTWw
         u0ow==
X-Forwarded-Encrypted: i=1; AJvYcCVru7QRNS4SpxjZk9RPhPdFhtF2bzMfqUNO+Pas2Ja9lEgAdU8Agq5TIEnq4HSPHa5KmAcWbxCpXGw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwXwyeYEedb6/V/We9flv7+PhA2zbTOrzmVNnGzTdo4wBKklnHQ
	RWHgSjCt3IumkLfn3NQD+vlCeCtERgHxISh0pP4/VSvn/5FX/xpGTwXt2m7iE2GZIaAWmVe1Vi+
	EHYGCRZPFxzOu4d+Uh2SXqCcFxZ7fqbQcph47vIJuDQ==
X-Gm-Gg: AY/fxX4Gifg8KU0Cf4qQ9mZjMwrwFDm7HM9rXtSfncAaU26bRUpF8DIgesue+uk+BVn
	6o4dFyu6l+dUxTq5SBM0RhX7+J0rh6HsHNwQGKR8MS3RaX67Pl2+kDRy0njAlR5jDQaeRwS9hTo
	zZgFki6B7NOzp9s3+Z1tRa5wpVACIt9nrfEJu+j4Hd8k+wmyCaum6yeguITgaxh5U1NxVDM7y/o
	08PYPf8i+VtD2qHT71t4U7td35GHcHjPgpWWRT1aQ0VfqqqYdlBA7U1K9OiVv/PPVTN7yGyTIKn
	70sNa7Lmdph+rOjX97H/SV/iVNWdljyMnp5oeQL7oKw3B4WcmqGwPCSuqUY+
X-Received: by 2002:a05:690e:4191:b0:63f:ab00:1a07 with SMTP id
 956f58d0204a3-649164f2191mr3364006d50.49.1768600125896; Fri, 16 Jan 2026
 13:48:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260115-atlantis-clocks-v1-0-7356e671f28b@oss.tenstorrent.com>
 <20260115-atlantis-clocks-v1-1-7356e671f28b@oss.tenstorrent.com> <20260116040329.GA1375823-robh@kernel.org>
In-Reply-To: <20260116040329.GA1375823-robh@kernel.org>
From: Anirudh Srinivasan <asrinivasan@oss.tenstorrent.com>
Date: Fri, 16 Jan 2026 15:48:34 -0600
X-Gm-Features: AZwV_QioGa-4X2KzI3YnQR765ca18KetbCGwv9R3-erpeNxDeN2zkJbwLVpqjgI
Message-ID: <CAEev2e8dRFD4FVyoNs6Eo-Qrvp4oKAQ96YTOyN5HUWVKVDUjuA@mail.gmail.com>
Subject: Re: [PATCH 1/8] dt-bindings: soc: tenstorrent: Add tenstorrent,atlantis-syscon
To: Rob Herring <robh@kernel.org>
Cc: Drew Fustini <dfustini@oss.tenstorrent.com>, Joel Stanley <jms@oss.tenstorrent.com>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, linux-riscv@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, joel@jms.id.au, fustini@kernel.org, mpe@kernel.org, 
	mpe@oss.tenstorrent.com, npiggin@oss.tenstorrent.com, agross@kernel.org, 
	agross@oss.tenstorrent.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

On Thu, Jan 15, 2026 at 10:03=E2=80=AFPM Rob Herring <robh@kernel.org> wrot=
e:

Seems like there was a small typo in the example (sycon instead of
syscon) and your bot caught that. I'll fix that.

> >  .../tenstorrent/tenstorrent,atlantis-syscon.yaml   | 58 ++++++++++++++=
+++++
>
> Filename should match compatible.
>
> If "RCPU" is what the h/w block is called and sufficient to identify it,
> then drop the "syscon-" part.

This hw block has control registers for clock and reset for the SoC.
This block is instantiated multiple times, with each instantiation
controlling clocks/resets from a different subsystem. I originally
planned to add these later on, so you'd have 4 different compatibles
like "tenstorrent,atlantis-syscon-{rcpu,hsio,pcie,mm}".

Instead, I guess I should add all 4 in right now (the clock driver
patches don't support all currently).

Is the current file name okay for that
(tenstorrent,atlantis-syscon.h)? I based this off the spacemit-k1
clock/reset controller [1], so it would look very similar to that.

> > +  "#clock-cells":
> > +    const: 1
> > +    description:
> > +      See <dt-bindings/clock/tenstorrent,atlantis-syscon.h> for valid =
indices.
>
> Be consistent with the compatible string for the file name.

I will squash down the dt-bindings patches in this series into one
that adds both the clock-cells and reset-cells to this entry. For the
clock/reset indices, should I just use a single file (say
dt-bindings/soc/tenstorrent,atlantis-syscon.h) or separate files for
clock and reset?

> > +    clocks {
> > +      osc_24m: clock-24m {
> > +        compatible =3D "fixed-clock";
> > +        clock-frequency =3D <24000000>;
> > +        clock-output-names =3D "osc_24m";
> > +        #clock-cells =3D <0>;
> > +      };
> > +    };
>
> Drop this node. Not relevant to the example.

Understood

[1] https://elixir.bootlin.com/linux/v6.18.2/source/Documentation/devicetre=
e/bindings/soc/spacemit/spacemit,k1-syscon.yaml
