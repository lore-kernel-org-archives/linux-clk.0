Received: from mail-ej1-f45.google.com (mail-ej1-f45.google.com [209.85.218.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DD163D75D0
	for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 13:44:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777038301; cv=none; b=XN5fyTtoajPZRs79iJXTT3SWiJKynzxttHk0eNAzEwTSVjH2jeTlOALQMyEU0tfTxhaBb8yM2d5Bb10e1ggkJ1MiFkCkXx48YFkue3rjB6yPOH6V/NbpyhNYIm93/bM0hSxsriJYnM9Ic/pLhYVDhei3/2DoWtIo/F7VoSTzkCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777038301; c=relaxed/simple;
	bh=FBo4MpOuHym9isd4kpc6ESQ5scuBE3X0XXVkHE8M6lM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LMGsHYR9w7YLmeCVkehqrpfPEMBf++HB5pEYCYuU7aP7+N8MxNwkIke3eUser79DwXlqQ9NeZ3IySIKvAFNxFkE6QuOgTUbSEPPOWP75Z0gYrXFNX1lj5GwGiqeYYW+a/r/AOp6w6cjAG1CqDVppm51n/CCkvlzf5oWlFTTBkgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.218.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ej1-f45.google.com with SMTP id a640c23a62f3a-b8d7f22d405so1325615666b.0
        for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 06:44:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777038297; x=1777643097;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tAdDpaEBGdJ4DrL6veRXDKf9tGg5aCWLhuxw6BI8jYM=;
        b=NGxWvZT3uIzq0OMbE5cPjqxv15KIX8GsJQn2HXXkbc8vdCoiOQFBZz0lPbuH49Hp5U
         uB9efARb1HHwclZ9EABt05FnlmNsbDHGR2k7puBVv43tDKWFaGssT8IoZ2tSM4EUHbZ+
         q8Og3FeMK47pdzGGq5rFBlTroBPfXoXDGo3jm19fh0zKtvtejBLxX//Fmb1NZB8eToYa
         +w1gsfETFASbOIFV95lUQA60qI5eURAsoaFa+69YAD+nRbKnImbp22rO6EBhyuUy4V+e
         EK/gu75K1fPdXtybCBiSHIsVTZBP4oiVNaw4ZB32J9EHcnzK62foNyU57FYaH3ui/WSL
         pZww==
X-Forwarded-Encrypted: i=1; AFNElJ9G13UUByHoGj61XSPcN9RNPSyDa21sp7rX216TwcuJ+ICJIFpr12nxD/9Mz7WVCPPU7Cj4/3a/EBg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMTLcdIQsAOwwwWZFkN+OZvcNbuDDKSMnwRCyoNDfWj3xiWKBQ
	YTwOSXplQhOwpJBTHrcv9Gx9Qwu+SAOyUOI41wXyge+SX1FB4rIxOp0cceV/2RnVETA=
X-Gm-Gg: AeBDieulcZfqOS/I4fh8f7tH+ySxf6SINgmzKDtI7LkJf6DQ3ZZeLLGLXQmyQzN5GKR
	P7wwqtIU0UNYuOzuiGHznTxBh0RobUjCKMEgWFY8C5h7Pqlxo5zLIa6Mu36CF/jmY1lLoJIEbBM
	wEU8SCDnJjUoI7ZZSExzY241oGsfRX9Am2jZGNYXiDIKS42rx/wbji7Z9j/jOMYBlUcI9w1sTva
	YbTekwQJ00w9TfaUCJbV2R79XzS7640KGBW1vJBDm/6E3N0gE2ntyMjaQn4XsWbki15997yIiuz
	gcmFdQdRuBvJKTJqyr7upEieOic50zr5zc7H2Bb4Db22BKUnzbKqEc7AeO2onBIW6+53CnmhR3I
	+/YNWX1GxJyKjPw7X+xOwZXlcjAJ1XFxBTr74Y3aNPab+gN6aoK1SFe1PD0WNYQBeoFeIy+oxWd
	KPHpH9Fj534RfVHctcX25HbS59CArBI8HMER9wHmYiADnR0AEz2+fOJW6My6/twbU+IAZvgoc=
X-Received: by 2002:a17:907:c30a:b0:b96:f863:deba with SMTP id a640c23a62f3a-ba41aa13734mr1550972866b.32.1777038296642;
        Fri, 24 Apr 2026 06:44:56 -0700 (PDT)
Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com. [209.85.218.51])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba454d1bf00sm765718766b.33.2026.04.24.06.44.55
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Apr 2026 06:44:55 -0700 (PDT)
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-b79f8f7ea43so1081504266b.2
        for <linux-clk@vger.kernel.org>; Fri, 24 Apr 2026 06:44:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ91ObLTFahTtpvM8DpOnSRvu0kOPBugLfjM1Y6JoF5m6djDdsJLawpqdwSZtQoldjRxW6chHuNtM7I=@vger.kernel.org
X-Received: by 2002:a17:907:c10:b0:ba6:8f34:b419 with SMTP id
 a640c23a62f3a-ba68f34b5c5mr1336772766b.13.1777038294976; Fri, 24 Apr 2026
 06:44:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260422233744.149872-1-marek.vasut+renesas@mailbox.org> <20260422233744.149872-3-marek.vasut+renesas@mailbox.org>
In-Reply-To: <20260422233744.149872-3-marek.vasut+renesas@mailbox.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 24 Apr 2026 15:44:42 +0200
X-Gmail-Original-Message-ID: <CAMuHMdVTwvWTt-3Kp5CmiDFw-E2eEtcoF_P4+OWkKXgAr3asoQ@mail.gmail.com>
X-Gm-Features: AQROBzD95mCpvpKjt-tx1E1uXUYHVxRwIWBz9wiPmciBkPhVEaN-gD0qoxp4r-g
Message-ID: <CAMuHMdVTwvWTt-3Kp5CmiDFw-E2eEtcoF_P4+OWkKXgAr3asoQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/4] clk: renesas: r8a7740: Implement ZT/ZTR trace
 clock on R-Mobile A1
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Marek,

On Thu, 23 Apr 2026 at 01:38, Marek Vasut
<marek.vasut+renesas@mailbox.org> wrote:
> Implement ZT trace bus and ZTR trace clock on the R-Mobile A1.
>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>

Thanks for your patch!

> --- a/drivers/clk/renesas/clk-r8a7740.c
> +++ b/drivers/clk/renesas/clk-r8a7740.c
> @@ -37,6 +37,8 @@ static struct div4_clk div4_clks[] = {
>         { "zg", CPG_FRQCRA, 16 },
>         { "b", CPG_FRQCRA,  8 },
>         { "m1", CPG_FRQCRA,  4 },
> +       { "ztr", CPG_FRQCRB,  20 },

This is not 100% correct: ZTR has an optional /2 post-divider that is
controlled by the ZTRCKCR.CKSEL bit.   As the Coresight drivers do
not seem to care about the clock rate, I guess this is fine.

> +       { "zt", CPG_FRQCRB,  16 },
>         { "hp", CPG_FRQCRB,  4 },
>         { "hpp", CPG_FRQCRC, 20 },
>         { "usbp", CPG_FRQCRC, 16 },

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.2.

Gr{oetje,eeting}s,

                        Geert


--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
