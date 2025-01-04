Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C44C16ABC6;
	Sat,  4 Jan 2025 12:14:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735992854; cv=none; b=NcOz1N6j9AyAzIvly3NbED6zGrIKgmQCq8dI9vCpywtc82yMm3Qo3/8p8/wyOOxebe1Ynd40NxvOMNCPH9ZgCR01xdDvOFPH5nG+OfVibT9q9Z5OF86vkwW37cJmcpkICwV3fpZ8x2gdDQoLmmQe0eEJYq+Z0+0/uaKgrcvCbBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735992854; c=relaxed/simple;
	bh=mRbAFmp2kCDc0UVL8KQM0BUG51NQoZD7o2kENjBSrIo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BRRC/xKJdxR29lUIFPwoe4mAsNp5O/Se8kiXSvI0IQSeSQjU0X+g5qwuOgSrNSPN1lEJ6Du1JyOVMBWYJwcfRHOJekHrgU9IR4DwdsdSIpcPz/KVE1wqL9BQydFngp8usD3S1K8bDKgPvbkwKuKLsWjpl4x1TS2lOTZ0fOiLCPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.208.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=csie.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3003943288bso150086481fa.0;
        Sat, 04 Jan 2025 04:14:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735992848; x=1736597648;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :reply-to:in-reply-to:references:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hAfNelAexbY+CFB6MXvVBZBPJB4LR8vgcGQXD+h9DFA=;
        b=SaI8B99rZVFnncXJI1hUzymJzKqsUsH21ugxvCIx0PWgKMDoneKpTBTOwy3HJIm48+
         vT9jKnlTtTPD8ueDL2UBEmUsqQxRb0Ir8WBYI3MjCorZJnIcJqWbHJbjnkckXgaJOfZG
         KQV8PYb2qSzdoo5tGMPyTWGEahbzMnXchShtJWAegitPR6zBYkZXsUL5uD1qZaIlYmE9
         w1zr76xl1kklT8MNqRoKQGK07N9egFtMfJrE6ZXljfRQKlSclZ6RdNjDAHZJuKCvQjz1
         QWHXkuym3E90AwcRp9k79Bofsdy4opPgp4OS1UBTqYrLriJxxH1jxnS0fKwV905v4tD2
         IuyA==
X-Forwarded-Encrypted: i=1; AJvYcCUEEGTqCECpPgtgOP3G6GYvyKOI7TxLY2CNJiwMIkZypjrpGEUj5hoTWc6FMQyuV83GvkT+SAi/RvJD@vger.kernel.org, AJvYcCUmQGoLdtDjkSwcXsFblNWKITbY2ALq5dxZmT/q/eaJMw8ScyTbKYrwKJ5mvlfUFWqQWiAPWdEDGU7F@vger.kernel.org, AJvYcCVwFRI166PL2nixCgUwt1DdX0LBkwO7yJf9zAsPKJXp8Q2dqe9bpg/yDdhVKfOtueV4j8qyQCp7mev4YRYl@vger.kernel.org
X-Gm-Message-State: AOJu0YxbdD+XH8cRaXivPG7Uqk1q0pItyqP4BOvxbh+/mMEyj6jIOBIm
	yKkZtpA4IGubj2krtbjqMTBAVgTCnBZ/5wTR+Cd5o9g5qMY8zh63Y+tVygLK
X-Gm-Gg: ASbGncsER/UrNChjHATz41VYt7AIywLI+v0EQrlTC9ARNmfAPvma7+E9CG/f5srDZoh
	HHgd7MYAMUrvK1fgOEO4yW+xfqbXa6D2dZkmTT2Mx85suPqEFw3ia2Czgm+0ocZdZH3g0pTTAW8
	8732Y93wq0fPl0rjGCzdcS+F33gKFNZ52r7yaj1r9I7SH4Z64R+7szGh6LltIvIvQTiNE81/6k4
	d3JBM5ti46gOrTyS2a2euR/mgayDiSZzyZkjzf+siKpXIEqF564gQr1t1TVPvxcEHFufPr6AH5H
	9hgQ/qRAdXLq0g==
X-Google-Smtp-Source: AGHT+IHcnWWJCGjqSomHMiTQdPeTlbMXYpQhPzJv9k+faTCSfRDpIUoEBVnf76gvaZbFIDM6h5jEHg==
X-Received: by 2002:a05:651c:198a:b0:302:3c78:4ea4 with SMTP id 38308e7fff4ca-304685f7231mr178013551fa.30.1735992848217;
        Sat, 04 Jan 2025 04:14:08 -0800 (PST)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com. [209.85.208.180])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3045b082c63sm48318721fa.96.2025.01.04.04.14.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 04 Jan 2025 04:14:07 -0800 (PST)
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-30227ccf803so150132231fa.2;
        Sat, 04 Jan 2025 04:14:07 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUEEpFmhQjgJ5VRHByM0T3xJnKFd9E7nRUB0VCtMRNi3OExrtysUC73N3GXv5Nx0moRT+OAMYaS6wrIe8gf@vger.kernel.org, AJvYcCULSZ7YemxiNtSBeOWsMvQozKdhYkRKP6IsG/KWPhW6YmRiF+JLwJ5Jw15ql5+XabOLGtM5A3b4+I6M@vger.kernel.org, AJvYcCWMoCmgjcjKbMNI153iBIwM8if5bu0xaHleR1jHx3aB0BX4HDsb97cOVb9xnN7IM/ET925/Tl9wunnZ@vger.kernel.org
X-Received: by 2002:a05:651c:1547:b0:302:1c90:58e5 with SMTP id
 38308e7fff4ca-3046841d378mr162276581fa.0.1735992847046; Sat, 04 Jan 2025
 04:14:07 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250104074035.1611136-1-anarsoul@gmail.com> <20250104074035.1611136-2-anarsoul@gmail.com>
 <CAGb2v66W9q-uQkepYgrD9QKnOwmpUdDakRoKjmsT_4=Adyj09Q@mail.gmail.com>
 <ca0cad16-7c39-4635-8f09-f9f3c95c9fef@kernel.org> <20250104120256.65511a28@minigeek.lan>
In-Reply-To: <20250104120256.65511a28@minigeek.lan>
Reply-To: wens@csie.org
From: Chen-Yu Tsai <wens@csie.org>
Date: Sat, 4 Jan 2025 20:13:54 +0800
X-Gmail-Original-Message-ID: <CAGb2v66h1k9Wm5Xr1NMYsOgV--2oaHrTfyVFmUisdKmsG1HBCw@mail.gmail.com>
Message-ID: <CAGb2v66h1k9Wm5Xr1NMYsOgV--2oaHrTfyVFmUisdKmsG1HBCw@mail.gmail.com>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: sunxi: Export PLL_VIDEO_2X and PLL_MIPI
To: Andre Przywara <andre.przywara@arm.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Vasily Khoruzhick <anarsoul@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Maxime Ripard <mripard@kernel.org>, Roman Beranek <me@crly.cz>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	Dragan Simic <dsimic@manjaro.org>, Frank Oltmanns <frank@oltmanns.dev>, 
	Stuart Gathman <stuart@gathman.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jan 4, 2025 at 8:04=E2=80=AFPM Andre Przywara <andre.przywara@arm.c=
om> wrote:
>
> On Sat, 4 Jan 2025 11:33:23 +0100
> Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> > On 04/01/2025 11:23, Chen-Yu Tsai wrote:
> > > On Sat, Jan 4, 2025 at 3:40=E2=80=AFPM Vasily Khoruzhick <anarsoul@gm=
ail.com> wrote:
> > >>
> > >> Export PLL_VIDEO_2X and PLL_MIPI, these will be used to explicitly
> > >> select TCON0 clock parent in dts
> > >>
> > >> Fixes: ca1170b69968 ("clk: sunxi-ng: a64: force select PLL_MIPI in T=
CON0 mux")
> > >> Reviewed-by: Dragan Simic <dsimic@manjaro.org>
> > >> Reviewed-by: Chen-Yu Tsai <wens@csie.org>
> > >> Tested-by: Frank Oltmanns <frank@oltmanns.dev> # on PinePhone
> > >> Tested-by: Stuart Gathman <stuart@gathman.org> # on OG Pinebook
> > >> Signed-off-by: Vasily Khoruzhick <anarsoul@gmail.com>
> > >> ---
> > >>  include/dt-bindings/clock/sun50i-a64-ccu.h | 2 ++
> > >>  1 file changed, 2 insertions(+)
> > >>
> > >> diff --git a/include/dt-bindings/clock/sun50i-a64-ccu.h b/include/dt=
-bindings/clock/sun50i-a64-ccu.h
> > >> index 175892189e9d..4f220ea7a23c 100644
> > >> --- a/include/dt-bindings/clock/sun50i-a64-ccu.h
> > >> +++ b/include/dt-bindings/clock/sun50i-a64-ccu.h
> > >> @@ -44,7 +44,9 @@
> > >>  #define _DT_BINDINGS_CLK_SUN50I_A64_H_
> > >>
> > >>  #define CLK_PLL_VIDEO0         7
> > >> +#define CLK_PLL_VIDEO0_2X      8
> > >>  #define CLK_PLL_PERIPH0                11
> > >> +#define CLK_PLL_MIPI           17
> > >
> > > You can't really split code movement into two patches.
> > >
> > > With this patch applied the clk driver will fail to build because
> > > the macros are now redefined in both header files.
> >
> > Are you sure? The values seem the same to me... I don't see how this
> > could fail.
>
> Yes, IIRC the C standard allows repeated definitions with the same
> value. And I definitely tested this before (and hence recommended this
> approach to Vasily) and it compiled without any warnings here.

Hmm. Didn't know that. Good to know, and I just tried it on my end.

Thanks
ChenYu

> Cheers,
> Andre
>
> >
> > >
> > > Barring recombining the patches, please add a patch before this
> > > adding #ifndef's around the two macros that are moved.
> > >
> >
> > No, not necessary, just churn,
> >
> >
> > Best regards,
> > Krzysztof
> >
>
