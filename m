Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com [209.85.221.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFBF42DC789
	for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 13:38:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778679534; cv=none; b=oJvxxQjzrT2o6S8qToEM8sTAezqIZOz8MqXCCVcx1pwv1Wz3074qgu6sPdxwlSbUEcmhy/++BK1p6mET7So6b0F5dOq3K1RAJPOtNq9VNuD9Dc7NvdrmADhxzGzbGJhcoU/7f/dOtwGFAPmLF5a7q/9NSe3dun5jha2E3Gzax6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778679534; c=relaxed/simple;
	bh=kPZ7A5cvokRvd7vF4xD+Y1QfccmxOHw5oZJ2oKw4NGM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gnabfGokR9qEKE7h7odewWd4v05fCzTW1xb7k/DLZfAF/jfOSpnyDaJQL99XOciueDuqBv/LAbA8DpCNjwWpqa/pDSdKituY9Wuw5C2qd6sqzKkdW5xiAbU7hq8dMGWcN7vcKZxdAnLr34/Vzol4BIwXAyb0tXRSE1t2koTCsZs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-57512b86273so4209487e0c.3
        for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 06:38:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778679532; x=1779284332;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vrwW8HJMZcY9Fq5J+G2ZrLwjCrrOc6AC4xQETMaCZKg=;
        b=fgOM0jM3yp/xIR1A7FBzjOdMyMygXWZxEAu88ZhbDqfW2R80N7MJZp15GbUgtEcq9O
         kiyB1YnDgk5pbNtHia/fdx18eGnwg2WWhUNMxGp8pvwC+OHsxLg7fsu04XwgRwY6Ha7J
         HBdEFQUVkI6YR6u6lsihPW+3UFOoKrGMzKGytxayXDaYyGdKh2BFlZZNlYaofDJw0Mmv
         AGNkUoxsF/Chq0UP1v1l1kQCSiyclwcOwsC+Cb6OKzIv/serZJA+nNXSr55TmXY2LUaC
         FHF6rL0FjOH04BR2o58IGBjVhLzRTo0EkefboOB6COCBoVvhR/f5EeL4GCRPmPPSV6wK
         wM3w==
X-Forwarded-Encrypted: i=1; AFNElJ/xyJ1aRzhpFDVzlgoGNvH1pCJuO2bos/I2mwZXJoZspBxaCqxG/sqBdO7sC3a2vznFouj8lgoBq/c=@vger.kernel.org
X-Gm-Message-State: AOJu0YwS1JdejUx1+lTtoaqOYe0pwFH6SOGkbtS2OrofMaZA15JibHTr
	FRZcsXmqfhhfD0cTssdnBT1/29ZcR+vw9Sz+3u8BESgI9n5/jY3bpXf7AX6AJ1ft
X-Gm-Gg: Acq92OFhKMjfefhPCuOiswXq/t0M5cla50YDPoZFM2GM+yThpFY1bAJAtWvcDCpR4l/
	3+RbCLXKnNkfg9rhzWjPMg2KI1aN39nhuElPsxeVQzYRxt+SguV5Ffm8m+zKUVwdrn9s0t1C8iV
	UzMt7sIprJb2/FTZaFu8D3Z51Z7H9ZChTdV7SOzto/XYKuk3FIgSQ5cyqjnxxqNpT/Tueog6C+2
	hRKWn6pQ5OPe+hbGyYn30BwkJ0gsG1hZNUHrggw/gZnX8H4QIA1TZ6XM4vrGB0QSvb8Fl0Zgn1r
	eG//0l8e0/bYXE+W1Auv6Pc27cPnyWWmahpuyLm2/teZKTxbmav8Rn8lPkZv6aJuEUTsJdciI+9
	lDQeRMNybQRpAC+tv1ch8hA7SnEARUqDki+TpmHi423HXYdKGjc+sSft8tHoXlTh6toPhgkmlOW
	m99ePmDA2VBFJiPX+fhTdXWkv8y645LR0mGuoC7P+iJItGMmYQb674UWa5Qc2wPAMmj0OrK1E=
X-Received: by 2002:a05:6122:8b0f:b0:56d:8ded:796c with SMTP id 71dfb90a1353d-575e6f60179mr1518561e0c.4.1778679531656;
        Wed, 13 May 2026 06:38:51 -0700 (PDT)
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com. [209.85.217.43])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-575585f72c1sm15662682e0c.12.2026.05.13.06.38.51
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 13 May 2026 06:38:51 -0700 (PDT)
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-632e479586aso2550026137.2
        for <linux-clk@vger.kernel.org>; Wed, 13 May 2026 06:38:51 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8WrlV6XH47kummwq8THf+WfUURH4eYySm7I5acTFatfa0CoHqrPn8AnSwaIA7zN/Mog861AsBcMPk=@vger.kernel.org
X-Received: by 2002:a05:6102:2924:b0:631:b365:40f6 with SMTP id
 ada2fe7eead31-63775f441f7mr1566639137.23.1778679530826; Wed, 13 May 2026
 06:38:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260502185557.93061-1-marek.vasut+renesas@mailbox.org>
 <20260502185557.93061-3-marek.vasut+renesas@mailbox.org> <CAMuHMdUXjwyVk2kuGAJOdPHw=qv_iwO2pSR3Rp+5ayoP2QG25w@mail.gmail.com>
 <c4e6e48d-9a8f-48f0-8666-22efebf86d8a@mailbox.org>
In-Reply-To: <c4e6e48d-9a8f-48f0-8666-22efebf86d8a@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 13 May 2026 15:38:39 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUVAXZtWAUn5fDgTKszHh7voQMJMyPBxbUiqOYRSfzCzA@mail.gmail.com>
X-Gm-Features: AVHnY4LU1BBWpNxE_fkGvk4Rs-4viEWKSh1Rjw7iIL0Qt5GSNDkgP1kR7U3ItzU
Message-ID: <CAMuHMdUVAXZtWAUn5fDgTKszHh7voQMJMyPBxbUiqOYRSfzCzA@mail.gmail.com>
Subject: Re: [PATCH 2/4] clk: renesas: r8a73a4: Implement ZT/ZTR trace clock
 on R-Mobile APE6
To: Marek Vasut <marek.vasut@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, 13 May 2026 at 15:37, Marek Vasut <marek.vasut@mailbox.org> wrote:
> On 5/13/26 3:15 PM, Geert Uytterhoeven wrote:
> > On Sat, 2 May 2026 at 20:56, Marek Vasut
> > <marek.vasut+renesas@mailbox.org> wrote:
> >> Implement ZT trace bus and ZTR trace clock on the R-Mobile APE6.
> >>
> >> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> >
> > Thanks for your patch!
> >
> > /sys/kernel/debug/clk/clk_summary looks a bit off to me:
> >
> >      zt                         0       0        0        208000000
> >      ztr                        0       0        0        277333334
> >
> >> --- a/drivers/clk/renesas/clk-r8a73a4.c
> >> +++ b/drivers/clk/renesas/clk-r8a73a4.c
> >> @@ -43,6 +43,8 @@ static struct div4_clk div4_clks[] = {
> >>          { "m1", CPG_FRQCRA,  4 },
> >>          { "m2", CPG_FRQCRA,  0 },
> >>          { "zx", CPG_FRQCRB, 12 },
> >> +       { "ztr", CPG_FRQCRB, 16 },
> >
> > 20?
> >
> >> +       { "zt", CPG_FRQCRB, 12 },
> >
> > 16? (12 is zx, cfr. above).
> >
> > I.e. the same shifts as on R-Mobile A1.
> >
> >>          { "zs", CPG_FRQCRB,  8 },
> >>          { "hp", CPG_FRQCRB,  4 },
> >>          { NULL, 0, 0 },
> >
> > After fixing the shifts, I get:
> >
> >      zt                         0       0        0        277333334
> >      ztr                        0       0        0        277333334
> >
> > which looks much better. If you agree, I can fix this while applying.
>
> Yes please. I can confirm in APE6 RM v0.7 that the ZTFC is at bit offset
> 16 and ZTRFC at bit offset 20 . Thank you for spotting this.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-devel for v7.2 with the above fixed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
