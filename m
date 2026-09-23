Received: from mail-vs2-f43.google.com (mail-vs2-f43.google.com [74.125.227.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 278C6443C38
	for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2026 10:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790158180; cv=none; b=JVB7KmuQV2ixqRa3JOB0y9Qa30e3Ippj7wOzhC+20q2qDLCM4FkwNlA3P8HRNtbTLGXYu44GF58W4QhOgo3BJbNlOaV5t7rQd+AslqLqKl05Y8cbPRc+1s68MEkusfEUjcCoQjRAPhnw1GWVbhOE3jIpDONFCd9KgX70Y8e83qA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790158180; c=relaxed/simple;
	bh=2LdCcTq4LNtMTs4VP/lve2MGkZ+oDMGD2pGvHN7osSk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gC7ozr9pK+Kj8w16Nu6iTPiuy/QJ2x8rwRqq7LYuVTrMtStS/naAanGjqBF7vsW20Yo7fskDM53rglSv1kPHAUPDys+1eC8mQaZ5TVS82J5Qp3jmApiRSK4CWOY9aIn+EcCaJA8ZtVWZLsytwQZVXW5eya8A0qv9+VWAwqeWVzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=74.125.227.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs2-f43.google.com with SMTP id ada2fe7eead31-78ffc0e2f23so298065137.0
        for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2026 03:09:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790158175; x=1790762975;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=5JmHt/Rh/an+rJjkQKYQn4lwdATJnF0qKTKMvhSPsOo=;
        b=c98RpVhOSw/fkQJC0vTMz8fIeC2sDT/2oeNSXjw67OEngz4y3CefCPtAQwqG8sfxIX
         MJqHrY9TanIt+Pns/P4gmFX4BgBT2tXl0OMr4/+kVj4lYoMc6Njycx789C9Vi56iLUAq
         zG5LUyUZVw9aNkNmJbGjkLb4gfxmrBFgmmcYrHjNRJBhag7jdn7ON+H7ElaULz41GcnG
         /qE5umSEARVk9Y3yFp8m9D06Gev7oCPk6w372mbdtdfQRt1rtp2vkNWZ2A0ISkrzS+RE
         WLssjIvxj+wzHwpAzdUEH3lC0YecYiGQDtVPs7PnKtMyZNDzaUKExYtVcBbaiXxWMCsu
         hEoA==
X-Forwarded-Encrypted: i=1; AKwUvBwsxlUuyE0C1C/TY6FC5K2tl38uzgPQy8uctN9qIFSG4XHspmsI23yAIN1QhF4VTOthX1ctr21rP2Y=@vger.kernel.org
X-Gm-Message-State: AFuF++lKDqQS4ZJtfFByxOHu88WaPAcKRspMrISYPbkD5WUgoJObJH5i
	tZisdvpMx1HXdHOcTDKfECnYlBvmXMO+aD147rpvrvXuj7dNok0gXGiaqvFm+1I0uyQ=
X-Gm-Gg: AYBFou2y+Hx3MBcH4DGARbL3fGk4zEOsQC3L3H5vvqLS2BlMmUSN4ybfKyUlrfzRAJp
	u9MR8bc1zgAg94WEw5DtH2SEc7boWpTFYvEvN21EFMie8C0VHicU47N/V0t/ovCEkoexMcFXQyp
	1uLwElYpfMYvu/pcRbETwqcNhwP4Avt7DaSfaGoSSWIvGt637ij6bAWXnttD4I71lyPKz0kJecD
	qt4AFqDrFx9LigA2Beb0FvkqljDjStPXe/mQRuhb/yNOY81TWTNEuyqgcbXvRkUiys5cVTQTMe6
	p9ED39E7AZUZzojuldAMrSWqoLUDXczSlGM6TKYCnJZw1P9++CkBOzoxHRYVoy+c0lGfMd4TuC+
	vrZtzM4rMDWxMMCkjVvaYmb/7M/MaX/9/pQTT4JjPoqM7xfyqmITzBQa/1FLmldB+n/576bYKg+
	wcZned3G0pDgzkK6XzOumaZOtf2FIbZDj9ZXnhQnPeIGjrDrobuB1aCye67K5x/fBmB1c5drNFy
	IhiLD6bn1QGuhcqOWdsry5AVX8qAI7TYNPwApt6N7qX4P1h
X-Received: by 2002:a05:6102:80a6:b0:7aa:17a9:f6b7 with SMTP id ada2fe7eead31-7ac1bd56ea4mr1586769137.7.1790158175577;
        Wed, 23 Sep 2026 03:09:35 -0700 (PDT)
Received: from mail-ua2-f24.google.com (mail-ua2-f24.google.com. [74.125.226.216])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c9f0551688sm2436292e0c.15.2026.09.23.03.09.35
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Sep 2026 03:09:35 -0700 (PDT)
Received: by mail-ua2-f24.google.com with SMTP id a1e0cc1a2514c-97e7c72bfe9so254631241.2
        for <linux-clk@vger.kernel.org>; Wed, 23 Sep 2026 03:09:35 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AKwUvBw09UuB+sjj6uUQMLxLuGGcZEj82s06wIdnSrpwVX/IelR1r5BZtDLUZ3XY1bnunr5UOJZBh8dU+J8=@vger.kernel.org
X-Received: by 2002:a05:6102:148c:b0:7a2:2068:6b5e with SMTP id
 ada2fe7eead31-7ac1db33915mr1747643137.24.1790158175046; Wed, 23 Sep 2026
 03:09:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260922042707.116378-1-biju.das.jz@bp.renesas.com> <20260922042707.116378-2-biju.das.jz@bp.renesas.com>
In-Reply-To: <20260922042707.116378-2-biju.das.jz@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 23 Sep 2026 12:09:23 +0200
X-Gmail-Original-Message-ID: <CAMuHMdUyxEY1qOeq7EEHN+o-Buw9pv-Onb0+PBM=Sr-KUaBH_Q@mail.gmail.com>
X-Gm-Features: AclHuK90RfgbLCVpd5oXAGDuN45J9ZOaUMmASuNEB-lgAPFfCrXT51zAR35pjWI
Message-ID: <CAMuHMdUyxEY1qOeq7EEHN+o-Buw9pv-Onb0+PBM=Sr-KUaBH_Q@mail.gmail.com>
Subject: Re: [PATCH v3 1/8] clk: renesas: r9a08g046: Add TSU,ADC1 clocks and reset
To: Biju Das <biju.das.jz@bp.renesas.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, Chris Paterson <Chris.Paterson2@renesas.com>, 
	Biju Das <biju.das@bp.renesas.com>, 
	Prabhakar Mahadev Lad <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Biju,

On Tue, 22 Sept 2026 at 06:27, Biju Das <biju.das.jz@bp.renesas.com> wrote:
> Add clock P20 (PLL2_DIV2/8), module clocks for ADC1 (ADCLK, PCLK)
> and TSU (PCLK), along with the corresponding module resets for
> ADC1 and TSU on the RZ/G3S (R9A08G046) SoC.
>
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a08g046-cpg.c
> +++ b/drivers/clk/renesas/r9a08g046-cpg.c
> @@ -559,6 +560,12 @@ static const struct rzg2l_mod_clk r9a08g046_mod_clks[] = {
>                                         MSTOP(BUS_MCPU2, BIT(0))),
>         DEF_MOD("gpio_hclk",            R9A08G046_GPIO_HCLK, R9A08G046_OSCCLK, 0x598, 0,
>                                         MSTOP(BUS_PERI_CPU, BIT(6))),
> +       DEF_MOD("adc1_adclk",           R9A08G046_ADC1_ADCLK, R9A08G046_CLK_P20, 0x5a8, 2,
> +                                       MSTOP(BUS_PERI_VIDEO, BIT(14))),
> +       DEF_MOD("adc1_pclk",            R9A08G046_ADC1_PCLK, R9A08G046_CLK_P20, 0x5a8, 3,
> +                                       MSTOP(BUS_PERI_VIDEO, BIT(14))),
> +       DEF_MOD("tsu_pclk",             R9A08G046_TSU_PCLK, R9A08G046_CLK_P20, 0x5ac, 0,
> +                                       MSTOP(BUS_PERI_VIDEO, BIT(15))),

Table 4.5-10 ("Registers for Module Standby Mode (2/2)") states the
TSU bit is located in the MCPU2 MSTOP registers, but that seems to be
a typo.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.4.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
