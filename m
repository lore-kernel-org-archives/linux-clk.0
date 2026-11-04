Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793810570;
	b=qGpNugt2dkaaS0o5WlfhKpXUT/i8+GfzxeLNbGFQgVz4jOFl11W5jrud2BZJ6ZWeY7xD
	 dzoeaMkeEIxkpolbbJOX5QglruVa911WquaEkMFTzCKTu6clYTR99H2m88+08h7Nm0JVt
	 MWyRMZnqIaEBmgASFVLbvz25Po20Vp2WvzaShYdD3Q0owst9mnL/DrlzoNkmXGwnbyydR
	 SRWrt67Jbdpv7zmth/Fu3Nm7SVfa3zlz4JvT435i/kyUVqU0OtRCf2/5lT9vEaz9VYuJt
	 SJmrdNsToirUGIIhabGRTqGp1DImaVAWrOaF8mjgCfgYdrm9AYYE8sHAls2W2qcrZHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793810570;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=KJ+1oCAIH39mLuoRRIwRDFkQlDS7B45Vb+3W30Jd5To=;
	b=kMaWwpnI/KAkAzwNT13xqqryytorf2Yr95oquMjGyr+1vHRv9NhFa4SsR1NRCsXR/JQ2
	 IGecxtugqMB/EGHLeNjeLH9TmPehGrInUu6CwArhAHsnJULzMIH/wT6xnZFYwXgrZO/92
	 QBhwmDjFo1aRsBBzPekuLu1iXLj0WSzDu0wKdyGUaEHmGP39NQX0xu8BQgVEE4t+oPiZm
	 do5+Jg0GEUcpzNMUCn6N2R+KnwXyEMlHdQygMeTRa8iQ9qJWh+s12fOvXxJTYLwvT7Oqg
	 x0+Qf8WfjOEF1HHgqpt5hVHetQvI9pYNfnAWkiqbQg5Dxhk2+He7yYm4dsm4TJrU5Mg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.217.43
Received: from mail-vs1-f43.google.com (mail-vs1-f43.google.com [209.85.217.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2F15606A31B
	for <linux-clk@vger.kernel.org>; Wed,  4 Nov 2026 16:42:49 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2F15606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vs1-f43.google.com with SMTP id ada2fe7eead31-7ce645a1c6aso518382137.3
        for <linux-clk@vger.kernel.org>; Wed, 04 Nov 2026 08:42:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793810568; x=1794415368;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=KJ+1oCAIH39mLuoRRIwRDFkQlDS7B45Vb+3W30Jd5To=;
        b=fGvVkLbG6Q9+wAEv0ltMDXfbWIspkML8Y5NkmZcddfoJUFl8li1sS6QmvDXTN2s743
         0GJkiQ3f0Re02TpSPHp0W80P5qfHIOFrbRJ535H4BRXVf2lUVPtkQkjW24cjdBYIcsWo
         guiEn+Dk8QqC/21/RXi7BbkBe19ltq5kDN1NMehOtLHhFXUtblJlMOxN164/STnqiJhg
         KNEhl4RpR+ePLl0jN1qSpXWSbPmhEYFJPRp26lnFLn1u5iUxiizgcs92uUIkYp0NO3X6
         BOuPFe2r9AzN90igesT2HP4CPMJ5+RZrIUL2VfQXJnWNKHr955nBZabz5WDTfUtDxnWZ
         4pbQ==
X-Forwarded-Encrypted: i=1; AKwUvBzGBvHk4WR+ewJ/R5WN0I8gfIQb/snvwKNtInZggXFPEC3iWqPFZiZMdQGJbtsjUZj2CxUSrElGjhw=@vger.kernel.org
X-Gm-Message-State: APuU4Z+Azvzzl6110AeTEPiQoX89tTRNj7/pc2mN+8dTKjzwAZXSKTxa
	ZrLbFBUsozc1P0ZDqgfKxLxGeEbCB+Jq9WtAP9Q7xuQexzsplM5092VTwcIzJXTJ2IA=
X-Gm-Gg: AYBFou0vU/3Uds1Fgvr8x8/bXvxUo4FKr06QqXzDku13NgWN6e1uNqBtvE8txDqgw8R
	z3qwb9uHT03te6RWx6t0vS8uEAKMqR19q5386o/0t16pXf3EaUQgv6zm5DMPDn4t7UCtCPeFPAk
	v+X9Rlp/r4MRkEmZSuN4BF5u6tp5nAMLUShe4aU4SjbHrx7UYCT36sn2J0MciUTxgKLP6Jg1BDy
	MpF07taGqtfIcAdMhKD3Ti21/AQyX8HgD+Nxx0UJRfFbUUGZ8hUypooRoXoLTuBdsPUn3Pzyb62
	Q2t4nQF17dQnv41lMzGkuRg5z2dr84bvoW8LBcxPVuEkFFrBKQQc0q2hbc4bCePY+Sy+BvtBSkb
	96nRIp9H+oSFqB7NEGqF5oBoe0R57ep7Hor5eM9tK3+HpMQnLRHTm3iiFCJ6O0qMcSQ92OdHd2y
	pjFpP097XlNyzOsAqSLypmkYuy2og2GceYkR6fyiI9YYM00HrHWqxma6tMmW44CUqMUjQvRm6EW
	5TW73WmddTnE56zIQzN3vNXg6Ol1Y4SVxE/e4iD6DajpocxKbuQbLsgT0U8k/a3bcGtpySJkjaY
	b0qpAUWZ7T3sgHjjwDOqoILZNToLWfBU2sLAjhXocptH1gpl+yT5h4ycl3qXvEwdxg==
X-Received: by 2002:a05:6102:5048:b0:7cc:56a:58d2 with SMTP id ada2fe7eead31-7d072d49698mr7575430137.31.1793810568425;
        Wed, 04 Nov 2026 08:42:48 -0800 (PST)
Received: from mail-vs1-f48.google.com (mail-vs1-f48.google.com. [209.85.217.48])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d26fe2d5fesm1928668137.7.2026.11.04.08.42.48
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 08:42:48 -0800 (PST)
Received: by mail-vs1-f48.google.com with SMTP id ada2fe7eead31-7c03a445cb8so556017137.0
        for <linux-clk@vger.kernel.org>; Wed, 04 Nov 2026 08:42:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzP9zSAdvs34SOakwZ/Qcu7JzKFfWjGITWFlKWTyYzI24DqKwIFrZvrwsmL87wtfxOu5RVYgbFpQDM=@vger.kernel.org
X-Received: by 2002:a05:6102:290c:b0:7a8:10eb:96ce with SMTP id
 ada2fe7eead31-7d07277c1d1mr6700629137.4.1793810568003; Wed, 04 Nov 2026
 08:42:48 -0800 (PST)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20260929113921.119489-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260929113921.119489-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260929113921.119489-2-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 4 Nov 2026 17:42:37 +0100
X-Gmail-Original-Message-ID: <CAMuHMdV5Sn9FaMNEaxQKF7_rm5hvM-pfC2-KU14=96DFGp85jg@mail.gmail.com>
X-Gm-Features: AclHuK-yEEtBzpAX8urnUe9YWbbPPxJguJG6y14QRK8iWGHBOGMP4whb2TqDpDg
Message-ID: <CAMuHMdV5Sn9FaMNEaxQKF7_rm5hvM-pfC2-KU14=96DFGp85jg@mail.gmail.com>
Subject: Re: [PATCH 1/2] clk: renesas: r9a09g057: Add ADC clocks and reset
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Tue, 29 Sept 2026 at 13:39, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add clocks and reset entries for the ADC controller.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a09g057-cpg.c
> +++ b/drivers/clk/renesas/r9a09g057-cpg.c

> @@ -173,11 +183,18 @@ static const struct cpg_core_clk r9a09g057_core_clks[] __initconst = {
>         DEF_PLL(".pllgpu", CLK_PLLGPU, CLK_QEXTAL, PLLGPU),
>
>         /* Internal Core Clocks */
> +       DEF_FIXED(".pllcm33_div2", CLK_PLLCM33_DIV2, CLK_PLLCM33, 1, 2),
>         DEF_FIXED(".pllcm33_div3", CLK_PLLCM33_DIV3, CLK_PLLCM33, 1, 3),
>         DEF_FIXED(".pllcm33_div4", CLK_PLLCM33_DIV4, CLK_PLLCM33, 1, 4),
>         DEF_FIXED(".pllcm33_div5", CLK_PLLCM33_DIV5, CLK_PLLCM33, 1, 5),
>         DEF_FIXED(".pllcm33_div16", CLK_PLLCM33_DIV16, CLK_PLLCM33, 1, 16),
>         DEF_DDIV(".pllcm33_gear", CLK_PLLCM33_GEAR, CLK_PLLCM33_DIV4, CDDIV0_DIVCTL1, dtable_2_64),
> +       DEF_CSDIV(".adc_pclk_gear", CLK_PLLCM33_ADC_PCLK_GEAR, CLK_PLLCM33_DIV2,

".pllcm33_adc_pclk_gear"?

> +                 CSDIV1_DIVCTL0, dtable_8_10),
> +       DEF_FIXED(".adc_pclk_gear_div2", CLK_PLLCM33_ADC_PCLK_DIV2,

".pllcm33_adc_pclk_gear_div2"?

> +                 CLK_PLLCM33_ADC_PCLK_GEAR, 1, 2),
> +       DEF_CSDIV(".adc_adclk_gear", CLK_PLLCM33_ADC_ADCLK_GEAR, CLK_PLLCM33_ADC_PCLK_GEAR,

".pllcm33_adc_adclk_gear"?

> +                 CSDIV1_DIVCTL1, dtable_2_16),

>         DEF_SMUX(".smux2_xspi_clk0", CLK_SMUX2_XSPI_CLK0, SSEL1_SELCTL2, smux2_xspi_clk0),
>         DEF_SMUX(".smux2_xspi_clk1", CLK_SMUX2_XSPI_CLK1, SSEL1_SELCTL3, smux2_xspi_clk1),
>         DEF_CSDIV(".pllcm33_xspi", CLK_PLLCM33_XSPI, CLK_SMUX2_XSPI_CLK1, CSDIV0_DIVCTL3,

> @@ -669,6 +690,7 @@ static const struct rzv2h_reset r9a09g057_resets[] __initconst = {
>         DEF_RST(13, 13, 6, 14),         /* GPU_0_RESETN */
>         DEF_RST(13, 14, 6, 15),         /* GPU_0_AXI_RESETN */
>         DEF_RST(13, 15, 6, 16),         /* GPU_0_ACE_RESETN */
> +       DEF_RST(15, 6, 7, 7),           /* ADC_ADRST_N */

ADC_0_ADRST_N?

>         DEF_RST(15, 7, 7, 8),           /* TSU_0_PRESETN */
>         DEF_RST(15, 8, 7, 9),           /* TSU_1_PRESETN */
>  };

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
