Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA11B36A030
	for <linux-clk@vger.kernel.org>; Wed, 21 Jan 2026 10:25:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768991151; cv=none; b=MyABV4nAh8aOD7mMFx9dwYQmfOuBMesGa1joutaQMWGmCCsUTNeW3fPnzmwFvrb42ORCsjsM/w6/DHTCBBM0f4lilCfDQOAHFLKLpHY0yaxj/Q7m1ds4DXOMDg2emMz09YR/DXT0bFPov/CnrYELPgyHZSKoYNy811PrxTyrc1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768991151; c=relaxed/simple;
	bh=Nvus+CBCqOlTSbWo49/3x1+8dGKD+L2I7BSM+bCrpkI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nHQVmy8GJ7d8qWFLSoGvcHbJ+2+jDEqxFfma7PbfWPx41+TX2423PkEYX60efp5BSSI7GhI9IYoLtd0mBeUYbFHvPK821mnHO7MaoJDbwdFDIMQiV/pnY7PDChHnFhIG7mSTd1eEM/hT1xz1yinQxL1ipicOTTlttSwqk1l4Zx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56367b39e3eso535936e0c.1
        for <linux-clk@vger.kernel.org>; Wed, 21 Jan 2026 02:25:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768991141; x=1769595941;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AO+jELtAqR5E9j/qLczmHfGIJgU+mWLnq5p5v66Y2yE=;
        b=lIzQMR5lpKL9bgghGaFstzOG1o44XZh7cCwdMxTvpIW/lVkLjQpMEH6x9YwxLTE1mA
         jGv+pDCP7mOw1kViEsthrDJuUNbYw17SY3sAqq1Qp/1BEy0Wjsnp6J5x6nl1WN7jaeg2
         NJqD6oSaJrVCPgveM5c49CcF1pOiDaYo7F0tJrfIUrzXkNO71qzHGvg7mEAZhTpeIKS2
         kHMo3/DtosQI4uXKHXifs5f8YaWfxTQQreVTd8EdyC5xq5pAy0TVoDtSipaxmJxawh9D
         ij4SDw5UEObvRcciCqNYtSAN+YVS7oUhA00fLRNbEL/1bzGCgIASX72JQIGujwHMuejn
         JlDA==
X-Forwarded-Encrypted: i=1; AJvYcCXAcOL0dMeJ14FKnEk+ukp4DkCN4gnpH7+28wxLUbznufLES2MBICbmzPtNaLceKshfy/EQhcwg5u8=@vger.kernel.org
X-Gm-Message-State: AOJu0YyJpLjgf1bcPnroCup2RaeuQ6Ofsi1zb9Ar7HYHQ2K0/SDdMUGW
	Ly7D9KnRM1jCHSek/hQmxrEmdJyzh54sqoNh4dmrIpSUeEodm/a+tGtI8NxmNXE+
X-Gm-Gg: AZuq6aJ9M2y1eUsl390JQBkqK03XGm6VRhacKkr8KnwidsCPpuqSdU0NQ8cFypJJv9X
	B55yapZ+8xfp7wMobaGeNPFqKd1XOgFVQwwkNx/w95L9scaNCi5GpOD44I0TdfHaBclokGGsjUD
	wQQtwxjarEX0wYJJa9+A02kqEvj3jUyvz81jTzmy4KzgJSU8GHZKYK6CthWju6quhkv6xRImYsN
	rHSj+Qj2Zln3TC4TeV1M4styt0nqJtoywe2uEkJ+KvLxPifeCkMncbjE+ZcnvfKX4jmaw0nD1LH
	JRDd0JRnG1oWRg/IwJYgTTfBRh36UtoeT+Tambxunn/8IQix8rmI8xwc6H/wYxWfXDqgE/sxvx0
	DZ28LlhTWA4SkYcdNiBBouNYiPVmHMl9G3NDTVg3AjB9m3xV5C/xPRQWIBX8yrXBpVYymGB25v5
	AW7Fuy5nn/hFwaysa5GOciiKKzNY76fFufOYB3sQh2Etali5vQrLiV
X-Received: by 2002:a05:6102:f13:b0:5ec:3107:6b71 with SMTP id ada2fe7eead31-5f192508297mr7812238137.14.1768991141386;
        Wed, 21 Jan 2026 02:25:41 -0800 (PST)
Received: from mail-vk1-f180.google.com (mail-vk1-f180.google.com. [209.85.221.180])
        by smtp.gmail.com with ESMTPSA id a1e0cc1a2514c-947d03d6836sm4649100241.6.2026.01.21.02.25.40
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Jan 2026 02:25:40 -0800 (PST)
Received: by mail-vk1-f180.google.com with SMTP id 71dfb90a1353d-56624fea96fso71027e0c.0
        for <linux-clk@vger.kernel.org>; Wed, 21 Jan 2026 02:25:40 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVKWJLINdAfeeSbkICKpX8EPorJ0kpn7YlM6wiwRnRJPabpuKXjmfhAHNAMWnIHGKdwFLvRMkq3vmg=@vger.kernel.org
X-Received: by 2002:a05:6122:8008:b0:563:50ff:69b4 with SMTP id
 71dfb90a1353d-563aa9c7454mr6150186e0c.7.1768991140325; Wed, 21 Jan 2026
 02:25:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260114153337.46765-1-john.madieu.xa@bp.renesas.com>
 <20260114153337.46765-17-john.madieu.xa@bp.renesas.com> <TY3PR01MB11346AE1205D35A8D8BC90B9B868FA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
 <TY6PR01MB1737773DEF65ABEBEF11D2E96FF8FA@TY6PR01MB17377.jpnprd01.prod.outlook.com>
 <TY3PR01MB11346C084AC2534C52822BC8B868FA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
In-Reply-To: <TY3PR01MB11346C084AC2534C52822BC8B868FA@TY3PR01MB11346.jpnprd01.prod.outlook.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 21 Jan 2026 11:25:29 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWXrYCULkavZGBE2foOh4A7kesda8Be1PfW-rE0WEsjKQ@mail.gmail.com>
X-Gm-Features: AZwV_Qh0oraDBmK-XBjWZ-KYpOXfBLlpVps5djRVJqCRGWxVzazW7dn9SuHVFa4
Message-ID: <CAMuHMdWXrYCULkavZGBE2foOh4A7kesda8Be1PfW-rE0WEsjKQ@mail.gmail.com>
Subject: Re: [PATCH 16/16] arm64: dts: renesas: r9a09g047e57-smarc: Enable PCIe
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: John Madieu <john.madieu.xa@bp.renesas.com>, 
	Claudiu Beznea <claudiu.beznea.uj@bp.renesas.com>, 
	"lpieralisi@kernel.org" <lpieralisi@kernel.org>, "kwilczynski@kernel.org" <kwilczynski@kernel.org>, 
	"mani@kernel.org" <mani@kernel.org>, "geert+renesas@glider.be" <geert+renesas@glider.be>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	"bhelgaas@google.com" <bhelgaas@google.com>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"magnus.damm" <magnus.damm@gmail.com>, 
	"linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, 
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "john.madieu@gmail.com" <john.madieu@gmail.com>
Content-Type: text/plain; charset="UTF-8"

On Wed, 14 Jan 2026 at 17:50, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> > From: John Madieu <john.madieu.xa@bp.renesas.com>
> > > From: Biju Das <biju.das.jz@bp.renesas.com>
> > > > From: John Madieu <john.madieu.xa@bp.renesas.com>
> > > >
> > > > The RZ Smarc Crarrier-II board has PCIe slots mounted on it.
> > > > Enable PCIe support.
> > > >
> > > > Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

> > > > --- a/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
> > > > +++ b/arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
> > > > @@ -96,6 +96,13 @@ &i2c0 {
> > > >   clock-frequency = <400000>;
> > > >  };
> > > >
> > > > +&pcie {
> > > > + dma-ranges = <0x42000000 0 0x40000000 0 0x40000000 1 0x00000000>;
> > >
> > > This entry to be only in SoC dtsi like RZ/G3S.
> > >
> > > > + pinctrl-0 = <&pcie_pins>;
> > > > + pinctrl-names = "default";
> > >
> > > The pinctrl entries to be moved to board specific file as it will be
> > > used by RZ/G3S, RZ/G3E and Upcoming SoC in future.
> >
> > To summarize, you suggest me to keep only the dma-ranges update in this file and move pinctrl
> > assignment into r9a09g047e57-smarc.dts right ?
>
> Just "status" should be sufficient. Drop dma-ranges and move the pinctrl entries to board dts.

Agreed. After that, the future RZ/G3L DTB build issues related to PCIe are gone.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
