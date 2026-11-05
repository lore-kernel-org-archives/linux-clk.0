Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.48
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793898184;
	b=ph6YWGpfqXUcMTD8POIcapKfWAHLOIbI4gBFJc95TQLL4icS7wRBCzUfuMOTvf9D71Ct
	 OINi4i/8Oo+uZJik/ic7W0XV2U9UI9r1La4I9drAOEafmFTvcO5k2/U1/HdsY+BbdiI20
	 xz/Mor9a98Ozp3UAemtawRL2k5JoAFcSeiOd5nDXh/wG4D7XA9jch+7b0v7FUjW1MALkc
	 IlC2R/3mo0fhQ5L1NlULgb1nmraD7xRNFcWkGZ+lU5ukH8wswIDVNnFjBwM7fsgLsMFWt
	 +FqEaYD9MuB8PEPLgnWQHmdqdyPLNBjzTMEY8fcZpITWmibM0n0gejU17m71IUR6Kgw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793898184;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=myxHuKBMV+4xfHAoPcmps6Jo0+mw1I0xl2wkI4iMH50=;
	b=DRAeDj+AKsN7Fo7VW9iRok9KOhyZtCnQORlwmMPpE+FxfU1UPIb6r+RoGguDFcfTN2a4
	 YxU+ivYlMtcBjyJ/wNn4ze7IA7wTt9hjIKzTsvjGLZITeSyjNdXHLtZDeha4SAWIpsKCf
	 jJ89JGHsTY3GvNgl0BxKmaFARfrWrkVZrYraqI0SfUQ8o+L8Sca5T9sgXuHWecSWYmtxK
	 ofNhF3CSCbZotxqGlUfoEQfdYft+mRV1Pyr9DuZxHswUEBg3X6hlkuE9xrQktU0zPgEf8
	 gDk9bbQ0ur/SjovC3BnGOrm4nIMiL6uI9Pu51Vd3SGoZNViSH+JT3HQy/n4TVAGAeBg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="Yie/T8br";
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8FF4E606A334
	for <linux-clk@vger.kernel.org>; Thu,  5 Nov 2026 17:03:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8FF4E606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yie/T8br
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1864715f8f.2
        for <linux-clk@vger.kernel.org>; Thu, 05 Nov 2026 09:03:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793898183; cv=none;
        d=google.com; s=arc-20260327;
        b=KVXXCQeTX7r+8iNEUQ2vwrXZydyA6ErIPmi7XyqMe2ktsmzM1K0cdFllwsTpeG/QS9
         vCdjdtck0vLWwpz1BsOX+CSbs1b3XqDXbUOcadiQA40BSrPgb76LonTT7GyKsbUjvLQm
         Wx2iau30bxi5fnvqAIrS8P/geS0Ll53it3Y5gxTeRqhvBditQo0FhqlrH3AZGNQ0W5I9
         4zlopIHAAQA63hmTDoaA5xcG9kDD16r2knC8XKZ4/7IEFZi4vgdUVa7vCEZjhltNRWn0
         xBfYQAqxaVE66WuVWWweOppgRTJCkgUiJcLGMVr1Ovfx6W4DSg4+fl9KnQRNZ2LMLuu7
         D6sQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=myxHuKBMV+4xfHAoPcmps6Jo0+mw1I0xl2wkI4iMH50=;
        fh=jJJEeIzd/2XyVcKv4V2CT/Pl0KykiyQxoPV4Uj9zJLU=;
        b=KkoOd9blgi46T5xR2uP/I19ddtYsaykPL7Km6Pv7h7Ka497bH0WnosgiQUrS53s/TJ
         JJUOOOrJeV1PU6Pcum8Sn4g7BCHsbqJctgEJdUimyZFFqbGnf/SFLlvVbWnxqCcYP1lD
         /qhssjYwpLWfmO3QFegMoKvMBeNseytV8vISB/+R2Nhdxe/6bNkTtjmahudsT8Vhc/+s
         k+WagskcLdQ7HVWi2yyb2LlJRfJQcHEACrvWUKs8CnErq5xnN1q55yH5Y6o7KRkKSlbr
         QVt7cvBBRhYSNfwf5faU+lFRTu6iYKkLDS9VY1Nhs4VOVaf08y3egs17P/MhF+rMLeV9
         JjyA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793898183; x=1794502983; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=myxHuKBMV+4xfHAoPcmps6Jo0+mw1I0xl2wkI4iMH50=;
        b=Yie/T8brMNwD9XMtoCRe4KocbowOal4KvpE8BrlwXg+74uPYL2na7XdS71r0etDevo
         jSuftvcY6zXZMcR3usSsir+uCR+ND9Q1w46SkNB78+f+N7+KcdKzJuhi8+WzqJpqASSD
         SB6VXbUx2EGWa0XiAHI1sFZ9AKfFC9IWFjzOQplInLIKCD8/r7b7x7UQj4S8JO4lVRCM
         ydZXZeoz2/d4hBHQTZerbPRE1YccCiLk7u/+Pm9ywXZRuncEFx0X1PL9zxUFSebD1b8x
         FciIG7UqaMvwQH+NAO6vdLr08VcCyBYh/am2KOMbdoiyIifCKX/+j/u170FM+Rqfr6HG
         NUVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793898183; x=1794502983;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=myxHuKBMV+4xfHAoPcmps6Jo0+mw1I0xl2wkI4iMH50=;
        b=L95oIA/p8w40QCbao9Ok7hUp9iRp1Cl4CYAgrO8xskyHg93XoUGxPb54oF7TCNIRnz
         W3vTXGBR8oyOQzqv++lpKTPuKGvogR3icZuOHq+drDe+nvnXUWTnWsrLmKGrSKu193y7
         Pd8JMwBjSIDrs+iitJeiqhlry/84DHwbDBAGslRinHNwEExU0Q15CIIS154K/Hi9oXbn
         Y0rfNff2CtwW/odw3ELOeW3hcQFeOkfLSfQVQ9F99xiLYl3SvWbFUcp8mH5VHjY6q2a/
         SQkhmYcl30IULn+z4hWb31HWc1EMZlasdPQOd7SoupPKZH6WQnMO9yrm1pTOFm19dbsd
         eOvw==
X-Forwarded-Encrypted: i=1; AKwUvBxyumkTe0rQ8XOkAKmFEDAX9um15oXcIKv1bjNgIFakO/3e7neD+EZmqGFPVuwS5deF8/PbfNsMfx4=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PDPHivCVx5KBl0YFHQ9LueVYSG8DDwBucwSKZzWo2EcPmFz2y
	h3TtQtFSMBBL2/N230e6a+RpCnzWN5t5yBhGujMKL4odSUnMCCVApUTySXIpPwbJJnA5SrgLXhU
	rsOFyjc41BCT++e+MommjDxxvhoDZB1g=
X-Gm-Gg: AYBFou35+J51kPk+D2WE6TDev18Yv4JB1QSK35yTFTpj4lNxjn94/9tAzFiUdQn+zZJ
	1XMyVwDwoDP82Xz5u5gG6DCXNXtDWHjg0VbSWyu3RuZ9vbGe+jeilYFrONQdYZzPNXupEnVo26b
	YXWj+ZQ+cWWalVN9oT3PSN9XYPP0S6G5kHACsPTRrkT/AuJOqf8WponGlJ5DOL9XNsQl3/+Hf2e
	x4wSuPLQScGxqHLgZ7kC2lTGMJibGWo5Hz9zlThG52WRzAwY+1b0QLOOGrHmizs+5GIjF4ZQeB4
	y/9nC8+bbVFfRW9Af3NCkINhV29rniFGgNbyWa+c7D3EbfgypTUnblRoiQbLdUd7DLaGWxxcyBh
	PiXtZgCCE2T+boxqtq/V03grsUQQA48z41Esep+PDd1/3hMXGmaH9ZTgY3l4n4kKJoa60tJac5+
	WFvM5KRko5gqleJcT/zhZ4DA==
X-Received: by 2002:a05:6000:2501:b0:48e:5d33:da5c with SMTP id
 ffacd0b85a97d-49273f500damr506459f8f.1.1793898182689; Thu, 05 Nov 2026
 09:03:02 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260929113921.119489-1-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <20260929113921.119489-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
 <CAMuHMdX9bJB-BUqJxvzYbaVuNziux1NhgXvkY6rgvGC6tdYe4w@mail.gmail.com>
 <CA+V-a8tbWcODg8E1qDwXU63ohfSgdeMm6GuEkrg=vyrNLQpbgQ@mail.gmail.com> <CAMuHMdX1j6G+Kd80-6s5PEVkOfG_tS2U8p47929G9kHvD1S-eQ@mail.gmail.com>
In-Reply-To: <CAMuHMdX1j6G+Kd80-6s5PEVkOfG_tS2U8p47929G9kHvD1S-eQ@mail.gmail.com>
From: "Lad, Prabhakar" <prabhakar.csengg@gmail.com>
Date: Thu, 5 Nov 2026 17:02:36 +0000
X-Gm-Features: AclHuK9B3JW76CB2qKvqEnvosxoUZui94RMsNVjlo-gO8QGB6XF8SpTGr1OOZV0
Message-ID: <CA+V-a8u6G0=wtBxEkjY3rYf-BQv23jJdc-4NE7aePEx_WkOVqA@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: r9a09g056: Add ADC clocks and reset
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Geert,

On Thu, Nov 5, 2026 at 2:52=E2=80=AFPM Geert Uytterhoeven <geert@linux-m68k=
.org> wrote:
>
> Hi Prabhakar,
>
> On Thu, 5 Nov 2026 at 15:03, Lad, Prabhakar <prabhakar.csengg@gmail.com> =
wrote:
> > On Wed, Nov 4, 2026 at 4:45=E2=80=AFPM Geert Uytterhoeven <geert@linux-=
m68k.org> wrote:
> > > On Tue, 29 Sept 2026 at 13:39, Prabhakar <prabhakar.csengg@gmail.com>=
 wrote:
> > > > From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> > > >
> > > > Add clocks and reset entries for the ADC controller.
> > > >
> > > > Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.c=
om>
> > >
> > > Thanks for your patch!
> > >
> > > Similar comments as for "[PATCH 1/2] clk: renesas: r9a09g057: Add ADC
> > > clocks and reset".
> > >
> > Ok, I will apply the same fixes here.
> >
> > > > --- a/drivers/clk/renesas/r9a09g056-cpg.c
> > > > +++ b/drivers/clk/renesas/r9a09g056-cpg.c
> > >
> > > > @@ -539,6 +556,10 @@ static const struct rzv2h_mod_clk r9a09g056_mo=
d_clks[] __initconst =3D {
> > > >                                                 BUS_MSTOP(3, BIT(4)=
)),
> > > >         DEF_MOD("gpu_0_ace_clk",                CLK_PLLDTY_ACPU_DIV=
2, 15, 2, 7, 18,
> > > >                                                 BUS_MSTOP(3, BIT(4)=
)),
> > > > +       DEF_MOD("adc_0_pclk",                   CLK_PLLCM33_ADC_PCL=
K_DIV2, 16, 7, 8, 7,
> > > > +                                               BUS_MSTOP(3, BIT(9)=
)),
> > > > +       DEF_MOD("adc_0_adclk",                  CLK_PLLCM33_ADC_ADC=
LK_GEAR, 16, 8, 8, 8,
> > > > +                                               BUS_MSTOP(3, BIT(9)=
)),
> > Shall I also rename this adc_0 to adc_?
>
> OK, let's match the docs.
>
Ack.

> >
> > > >         DEF_MOD("tsu_0_pclk",                   CLK_QEXTAL, 16, 9, =
8, 9,
> > > >                                                 BUS_MSTOP(5, BIT(2)=
)),
> > > >         DEF_MOD("tsu_1_pclk",                   CLK_QEXTAL, 16, 10,=
 8, 10,
> > > > @@ -634,6 +655,7 @@ static const struct rzv2h_reset r9a09g056_reset=
s[] __initconst =3D {
> > > >         DEF_RST(13, 13, 6, 14),         /* GPU_0_RESETN */
> > > >         DEF_RST(13, 14, 6, 15),         /* GPU_0_AXI_RESETN */
> > > >         DEF_RST(13, 15, 6, 16),         /* GPU_0_ACE_RESETN */
> > > > +       DEF_RST(15, 6, 7, 7),           /* ADC_ADRST_N */
> > ADC_0/1/2_ADRST_N?
> >
and this I'll keep it as is (ADC_ADRST_N)

> > > >         DEF_RST(15, 7, 7, 8),           /* TSU_0_PRESETN */
> > > >         DEF_RST(15, 8, 7, 9),           /* TSU_1_PRESETN */
> > > >  };
> > >
> > > The lists of clock and reset signals (tables 4.4-2 and 4.4-3) claim
> > > there are 3 sets of clocks and resets, one for each ADC instance,
> > > but this does not seem to be reflected in the register bits?
> > >
> > The clock tree in r01uh1072ej0130-rzv2n (additional document).pdf
> > shows single clock is shared by all the three instances.
>
> I take your word on that (I only have the additional doc for RZ/V2H).
>
This has been tested on the V2N EVK connector J3.

Cheers,
Prabhakar
