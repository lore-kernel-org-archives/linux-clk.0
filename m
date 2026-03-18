Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com [209.85.221.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 035CE3D9026
	for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 14:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773844541; cv=none; b=XGsVyx8Cq9kWxJK1zpzDa2INKJfEPOp+hRSyuP5MzNDI+xociP+g2O5vrUC/CdYPK2RUhOIR+dwq2AIKUiXpJ8I8VMJSzNJVa1Z382QkpcDPiTo/uIfL4PgErspaJe3hVCesimP2NiLAJHywwzIZnbduITfPZyC3oeQHfvPrd9k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773844541; c=relaxed/simple;
	bh=oguUgHwyjHxRKaSmaLBscl2CTie+JbETASTbeTu1iFs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IeVhr2zxYK4gDN8OES9z5nENqzSis1psMzkGKV8iqdflc/azrS2of5Xp6VkwNKwISOcGOMt4FHe5hUMzhhQ7RT712SrihjVt+h/i2typFQTOjso0/OM0y4slOkC/cNE+ypQKi5Om8bGe/iFeJVohNcYzZ1DlryeaFvcjZPBeIa8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f177.google.com with SMTP id 71dfb90a1353d-56b679e72d9so2126912e0c.3
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 07:35:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773844539; x=1774449339;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Q1em1q7s6aFVpI39hYWLY9rgxMn5ODmIsTxQ+BBYDwI=;
        b=IDNa3LdpXQYHV1RIk8+naw6rEh5xqF24rWAOBNBKcH+nmcmtTWtIXplWZsGeLoFOXZ
         akz3GuTqTjheUHlR6DupGSCP6sd9GRm3UNien6ijz3tla67LW0PCL8/LPrDWwXN6i1hn
         jan9PZ45GGSNuN0nmmV1hyUSCQjbP2IbqZGwJBIkRxUJdDfc2T5cXSYA9XyXIAUMoIlY
         x7rDyPQbcmlnhzKMsp9Y9gTAGNwZ1+3qzenWE/LDJ5z+9fNndCSgwczI3J/ke+L53Nru
         d3iAoaXJm6VpJXuXI+W0n0dE3NIq3MULSsHLQLsFbvKBy+NL2TNmtjxL644uyo00Dw9x
         nhIA==
X-Forwarded-Encrypted: i=1; AJvYcCVSKxsRtUCd7Ua9Cq14NPuftW9cl3FDx/AfyfQWPWaVcSUsDHnsQWk0f/OJgnUWq50MbLw4nJ8gJts=@vger.kernel.org
X-Gm-Message-State: AOJu0YxF0M6uWGGh0j90MewEM7GbW1qa7rRj7Aue60DC6GdvANB79YVj
	VaMRqLB0wuqm7PM9u56OZKpQPMW4pjgitCzVOW9NWB/cCVCFdVP0+7E6HOCPOSxBXfg=
X-Gm-Gg: ATEYQzzUn+rW33QB433bDoXg/F9hZYEFPgjTVNpVCW5p9gwhyr5HnYnc0ab6XIudUdo
	vl8cJxdjRrYmRuOV2La2OBoFGvGyyFkZhKcTQWL8RNDg9xPrT7+lnBD+e0GW+UZ04AYpi9es/3x
	3AGLEoqJ8y7u7FU0G0y2Q6hSJ595sNgEcFIhBsq39hzdN8U38hGkpu8G9Z8YtpiSLVDZj9UWEDz
	zOoSaJ5jILPY/R1mIqlmn+Rw07RUZ1d5cTvGYlzT6zeFiXqUcjWH+44ZANFAKCwEB7miFwKEpMB
	vN66pyrBrYtaUGiLGOyWUys3CgwqDm56SwNG258UwLh7bhzM3mw3w4LnyPU7Hs3E8yguFiSWOs+
	0/85c9yuJKj/HjtKTWsGodAA5qRVQQR8J17AC/x/KrK+UAvBeUK6bB3mitYsLXkGWmNJnEvJBCF
	Jfox6PHUgyGSR6iOfhqLtr91OhhHzP4O7Nozh5ncX+DBa6kC7PPlW6QeR+aE+BNTcV
X-Received: by 2002:a05:6102:3ec8:b0:5ef:b5fc:dd48 with SMTP id ada2fe7eead31-6027d107b37mr1536734137.9.1773844538879;
        Wed, 18 Mar 2026 07:35:38 -0700 (PDT)
Received: from mail-vk1-f170.google.com (mail-vk1-f170.google.com. [209.85.221.170])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-6027eddf4d3sm1495939137.8.2026.03.18.07.35.37
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Mar 2026 07:35:37 -0700 (PDT)
Received: by mail-vk1-f170.google.com with SMTP id 71dfb90a1353d-56b679e72d9so2126894e0c.3
        for <linux-clk@vger.kernel.org>; Wed, 18 Mar 2026 07:35:37 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX+ynVZOgk5xdUn3cguamjOIDWItbTv9YcEMOuYpk3vjnbAsEZK6OraSFdsrp17gz9xToXRV10FLKw=@vger.kernel.org
X-Received: by 2002:a05:6102:32c1:b0:5ff:c831:b97f with SMTP id
 ada2fe7eead31-6027d0a94c6mr1479588137.1.1773844537627; Wed, 18 Mar 2026
 07:35:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260312111521.115392-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260312111521.115392-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260312111521.115392-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 18 Mar 2026 15:35:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVxhiWXLapcHAUL6nA=-+6YLme8v8CruMESng3ZO4f2OQ@mail.gmail.com>
X-Gm-Features: AaiRm52MgP6LI1mgHHWHF3R-1Rw2VakqXMBCl1TWbozu2vUbn0Op_voGtlrMZic
Message-ID: <CAMuHMdVxhiWXLapcHAUL6nA=-+6YLme8v8CruMESng3ZO4f2OQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] clk: renesas: r9a09g057: Add PCIe clocks and reset
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Thu, 12 Mar 2026 at 12:15, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Add clocks and reset entries for the PCIe controller.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a09g057-cpg.c
> +++ b/drivers/clk/renesas/r9a09g057-cpg.c
> @@ -508,6 +508,10 @@ static const struct rzv2h_mod_clk r9a09g057_mod_clks[] __initconst = {
>                                                 BUS_MSTOP(8, BIT(6))),
>         DEF_MOD("gbeth_1_aclk_i",               CLK_PLLDTY_DIV8, 12, 3, 6, 3,
>                                                 BUS_MSTOP(8, BIT(6))),
> +       DEF_MOD("pcie_0_aclk",                  CLK_PLLDTY_ACPU_DIV2, 12, 4, 6, 4,
> +                                               BUS_MSTOP(1, BIT(13) | BIT(15))),
> +       DEF_MOD("pcie_0_clk_pmu",               CLK_PLLDTY_ACPU_DIV2, 12, 5, 6, 5,
> +                                               BUS_MSTOP(1, BIT(13) | BIT(15))),

So the PCIE0 and PCIE1 modules are always stopped/started together, oh well...

>         DEF_MOD("cru_0_aclk",                   CLK_PLLDTY_ACPU_DIV2, 13, 2, 6, 18,
>                                                 BUS_MSTOP(9, BIT(4))),
>         DEF_MOD_NO_PM("cru_0_vclk",             CLK_PLLVDO_CRU0, 13, 3, 6, 19,

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in renesas-clk for v7.1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
