Received: from mail-ua1-f49.google.com (mail-ua1-f49.google.com [209.85.222.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37B6240FDBA
	for <linux-clk@vger.kernel.org>; Tue, 20 Jan 2026 11:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768907017; cv=none; b=GSj9Y3JG2HozUvu5qoBa/QW0ixlkRqvXVpheflSzXO79lPPxJ8pHERTLfVhWRUCeUjY2dRBCWdc5UW1w2wmx6e6/iWrlFAHW0DojGd5jiwL+id1foK/FgHhjtfcf+A2mKmUDYazyiXMtEMHmcriFPGcfT6Pn48+1vPdps9G1Sys=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768907017; c=relaxed/simple;
	bh=Yt74Pwf1lMdOPJDNa5I9rk37qMEnD4Vx9P4hWUTzXJI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JKb2OtsVpkRvS5GtNxa2TpJlkotH8ljVHcx5+c81vVk92rW0tnf9YWvf4iLLQmFODow3qu6hAiUBuxF9H09ZIjwnyvmSuIzJxkF9PYCtmmFqiaiAVTsbfXyYGtrH/K3JUvuXHgDLmrEJWAuXmqAZYcSlBL7GMteCO5K/IM7vIfs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f49.google.com with SMTP id a1e0cc1a2514c-94124140e02so3344043241.1
        for <linux-clk@vger.kernel.org>; Tue, 20 Jan 2026 03:03:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768907015; x=1769511815;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mc4ovVXcdd2t1CG9+kKl14hd1FxE21SIum3OHqj6bo8=;
        b=ORMHYECkmPD0ReJWt8sEBWSLgYUuq9ciM3FS6Y/kyEN6I0qsmaxYx1IlrHc1R5wRrS
         vV09zLBiLrMfm3w3cQUxVT8Mo4omE2Ib/dC2VtbrrD0Ity8/vYFPVbjXI4Yl3PnpdrSM
         0wjjPvea4MKS2S/VSuQ/T/YfEu1a+SWrQrNsyFp20Op5k7VpCB62dvcRYwS0SOVUlVgD
         Khd+QCZZ2Y9pacLsc/41GEQiD8mvNxgI5nAI0ZuvbUVLbftODMV/fV0Y35CfzXnn7S81
         TVJIx3ojPVFomulfDjCBVDE5zMExuPNGbmLJu2OAxnTsPJqslaLOT+NTXUBXf2av3Zei
         9Bqw==
X-Forwarded-Encrypted: i=1; AJvYcCVixJL4LbyQLUXoWhxTmavj4KTC8E3yc2+MlnMm23y4MKC0Zg28gF9srx5ZU5+AUFKaZ8GPJw2Pe44=@vger.kernel.org
X-Gm-Message-State: AOJu0YySDPUbmIwhq2cp/5XmKn3c3rxJ4lPmVXBzcCUkAiUwFfbTszT2
	sHpdWtm00MnSa+xGSQM3gH2XgScDIpXxOT80Zk5NVNEB1aiWagXJhC6mfDqhqAEO
X-Gm-Gg: AZuq6aIMCokaUglOAll5rxaizWAvYpxWSfEnFX4B8i3WivqW24aNndbIpO36OhZfwS3
	EDGHJpHz3QXmbIph7vNaWVlEMBg3lgeKxIY6FWgz0OwpeXz8kXwxSOzwQlRjyK8KD7HwPBNddGp
	c1XOMoeRASsn1+jNkrSL2Cj59WdfmmkBCCc5xSOohy0pa7aXgBHFUhU59ENGtqJcNLoPRcPpP2C
	882s9zN1UIGDy5CwsoLN6w5grsTRBiOfHsU3/FSru+JVVt3SoXml6qFE8vkoDkejl4ccvgOHX/3
	5Yn+IDUHmeph0un1OuDA0pS/c14GJtcpfNghC6BUQa+2UUHJ1mPs1EIMmXkoIn3QXnw+4EbPQ41
	bMzT+smrDDMZQbJOt4b4evVmNVa3AMBdYbXjn+Ammv7kLFJYjtafPVA51r+jyajhsnh6Hm7Tu5U
	3/NiTNXwS9IpIzdI5+HCa6H89arPCAxFtjwT92CzDgbyZ7Jac97Vn5ZyePeeM=
X-Received: by 2002:a05:6102:3ec7:b0:5dd:b287:e5f4 with SMTP id ada2fe7eead31-5f50a45462dmr442236137.0.1768907014952;
        Tue, 20 Jan 2026 03:03:34 -0800 (PST)
Received: from mail-ua1-f45.google.com (mail-ua1-f45.google.com. [209.85.222.45])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-5f1a68fe9cdsm4210964137.2.2026.01.20.03.03.33
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jan 2026 03:03:34 -0800 (PST)
Received: by mail-ua1-f45.google.com with SMTP id a1e0cc1a2514c-9413e5ee53eso3285798241.0
        for <linux-clk@vger.kernel.org>; Tue, 20 Jan 2026 03:03:33 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWyoc3g+Gou0bZvD/h9RXhOVe3eYZtIFkEl25scDoQzLzm2k+vhSG3SZqiM4cv+HJQPR1aAAOBXE+U=@vger.kernel.org
X-Received: by 2002:a05:6102:390b:b0:5ef:a59e:617a with SMTP id
 ada2fe7eead31-5f50a95f019mr413993137.21.1768907013323; Tue, 20 Jan 2026
 03:03:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260114153337.46765-1-john.madieu.xa@bp.renesas.com> <20260114153337.46765-5-john.madieu.xa@bp.renesas.com>
In-Reply-To: <20260114153337.46765-5-john.madieu.xa@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 20 Jan 2026 12:03:21 +0100
X-Gmail-Original-Message-ID: <CAMuHMdXKvfRr2us9YhXh5a_qtZcv8wCvz_EnVa4PEANocg_0_Q@mail.gmail.com>
X-Gm-Features: AZwV_QgrKR7tnicz6yGCyKjhkngXRza_8zoEMe8PqpfHwLCDwwFyDmgdfB6vgIY
Message-ID: <CAMuHMdXKvfRr2us9YhXh5a_qtZcv8wCvz_EnVa4PEANocg_0_Q@mail.gmail.com>
Subject: Re: [PATCH 04/16] clk: renesas: r9a09g047: Add PCIe clocks and reset
To: John Madieu <john.madieu.xa@bp.renesas.com>
Cc: claudiu.beznea.uj@bp.renesas.com, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, mani@kernel.org, krzk+dt@kernel.org, robh@kernel.org, 
	bhelgaas@google.com, conor+dt@kernel.org, magnus.damm@gmail.com, 
	biju.das.jz@bp.renesas.com, linux-pci@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-clk@vger.kernel.org, john.madieu@gmail.com
Content-Type: text/plain; charset="UTF-8"

Hi John,

On Wed, 14 Jan 2026 at 16:36, John Madieu <john.madieu.xa@bp.renesas.com> wrote:
> Add necessary clocks and reset entries for the PCIe controller
>
> Signed-off-by: John Madieu <john.madieu.xa@bp.renesas.com>

Thanks for your patch!

> --- a/drivers/clk/renesas/r9a09g047-cpg.c
> +++ b/drivers/clk/renesas/r9a09g047-cpg.c
> @@ -438,6 +438,10 @@ static const struct rzv2h_mod_clk r9a09g047_mod_clks[] __initconst = {
>                                                 BUS_MSTOP(3, BIT(4))),
>         DEF_MOD("tsu_1_pclk",                   CLK_QEXTAL, 16, 10, 8, 10,
>                                                 BUS_MSTOP(2, BIT(15))),
> +       DEF_MOD_INIT_OFF("pcie_aclk",           CLK_PLLDTY_ACPU_DIV2, 12, 4, 6, 4,

"pcie_0_aclk", to match the documentation.

> +                                               BUS_MSTOP(1, BIT(15))),
> +       DEF_MOD_INIT_OFF("pcie_clk_pmu",        CLK_PLLDTY_ACPU_DIV2, 12, 5, 6, 5,

"pcie_0_clk_pmu"

> +                                               BUS_MSTOP(1, BIT(15))),

Do you need pcie_refclk_in and pcie_coreclkin?
Especially the latter seems to be document sparsely.

>  };
>
>  static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
> @@ -503,6 +507,7 @@ static const struct rzv2h_reset r9a09g047_resets[] __initconst = {
>         DEF_RST(10, 15, 5, 0),          /* USB2_0_PRESETN */
>         DEF_RST(11, 0, 5, 1),           /* GBETH_0_ARESETN_I */
>         DEF_RST(11, 1, 5, 2),           /* GBETH_1_ARESETN_I */
> +       DEF_RST(11, 2, 5, 3),           /* PCIE_ARESETN */

PCIE_0_ARESETN

>         DEF_RST(12, 5, 5, 22),          /* CRU_0_PRESETN */
>         DEF_RST(12, 6, 5, 23),          /* CRU_0_ARESETN */
>         DEF_RST(12, 7, 5, 24),          /* CRU_0_S_RESETN */

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
