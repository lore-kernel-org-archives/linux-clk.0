Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFE3241A564
	for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 15:29:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786375761; cv=none; b=ViXJ/jxKS+f4KYxETlEPJo3ULix3RYCltn6PQ0sW0ztIz5DNI8kXJyRvuk0zHr86LW+AXiSGnU3A8T7IpFbHZgCl1HN55bE2CQELKD6vsh8/HLacpau0LNxdRwY2QWMKgu8efr+9zT7+lJMOagbH3AdmKaYwTV/H9DCWHnYTQ8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786375761; c=relaxed/simple;
	bh=v2X/qFTKhEWl9w9+03oXecpIVvhrFrzjOCau2uvjiek=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QGZggTKlr5Od9dspJxE+pyWgNJebAS1kFzNZiVZ9LwZHwIt+k0C7ElT7EycC9oq0uco6X4DlCx4oOMAL5OFCm62feaST13hFLNXZVo1SoEdmwqh71wiw8+Pak8aDTXjN9G6B+BxNCM3npXiL99hekiaqPLjXTnNm0pg6dJ2UM/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.221.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5bf94664327so885579e0c.1
        for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 08:29:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786375759; x=1786980559;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uWDR9skH5cx/JxnFLoh56vDW6LJ+vetkUcp06X/F6BE=;
        b=iE7O3GZHbVnlg//aET8jyWKRO8HPHk9DraEv2J1aakj2PpesxGlIyPFRUOpIC4t2nV
         LhTNyqlnrzW2c3PUG40DKJftwJDECEkMxWcNrWIlKDRKtE5UcO0msCcPHrGw5n9ATtJP
         iWJg1zDNRLOfhYv6hjD213O6lUWDQhny3LHUfmnASewcQ2NZS859YiHRZfGnBQatfkPy
         ITcCUmW8AqnJiI02kFUf6SesdgikN72pMVMzummhonlKrtE5kJshT2OhF+IrZHLE1AN3
         pX2WhvjSY4pF4LoqgjLWI6uAmPWnnUCXdsSmgYm2g7gsvOYhTVTIqa3/jAGKbgH4ofZM
         UOXw==
X-Forwarded-Encrypted: i=1; AHgh+RrcZ0qViG7VtO3VUCuiINxCp4kjGylI7r8apz7LygdUG4/Ki+jPJYQoZDY0dZp670sEpRutaV5i2uI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBLL6YIr8o8rJYD7EGDK11CfeIs//32xGMSjo6rxpnuISSoUAL
	8567S67AA4hKoKBoZqTvU7r2l94j7LxH1DC5o83/QVCO3QPNvpQi6IWPBBS/8pZE
X-Gm-Gg: AR+sD12Kydq8aVmgSmEBasomz/TTtS9IhKGFJgG1ZPYldZMq8P98g58b3erDF8vDHG9
	S9NX9u/eXAHaR0GrFFE1+YMlxYtgXIHpgjwc7RITGbGGoAs5MD36DYXl8SSfHKwSciDuJN4sKEY
	6ul9EVSQwVSI1qCbpcmaGcAw8m7ZttsHynHWnvzaU3w3a9tdWZ8hIkopBtj0lYwF4Uw8Pziz8Jz
	Pmxan7GqwcU3x54UTQPNECl6ij6VraC5asNt5mUQbyWKdhW/jCPWF7RmY1Miv1hAzPC9n8VW/HS
	/rOlwhil7oS7LFJ1KzrLIyE/lZADEfKPFWCLDpR0cgwoLTWrEBZXVm3CVMKINW2WTcJhBNQwxUW
	OsfoKvhVZGupJQCWoJwpoeYO2B50SSxRaISnaKzfNbrH6OwCTq3W/B9aJ71C1/ImCEk3Mg+xx4F
	tsfk2JYYJQFlXIQjqwtOO2ROVtVKkGx2xeaNjqjJoCyg979rHZSaOmPIhLPSX53Xru51mV3gHqX
	lAD18LdhDzLJT1LB+OsbCBF0G+Qg8X9idkw
X-Received: by 2002:a05:6122:2206:b0:5be:2177:70b3 with SMTP id 71dfb90a1353d-5c41163b3d1mr2062603e0c.10.1786375758689;
        Mon, 10 Aug 2026 08:29:18 -0700 (PDT)
Received: from mail-vs1-f52.google.com (mail-vs1-f52.google.com. [209.85.217.52])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5c40b1a8007sm4590414e0c.11.2026.08.10.08.29.17
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Aug 2026 08:29:18 -0700 (PDT)
Received: by mail-vs1-f52.google.com with SMTP id ada2fe7eead31-745497ac8fcso353369137.0
        for <linux-clk@vger.kernel.org>; Mon, 10 Aug 2026 08:29:17 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AHgh+Rqy2FPUaEPnzopDhZhWWRRex3XrSLFPcaiCIWVXEzmnZ2M8nEqW74klWgBJd59ve7M1wkqrdBOifLM=@vger.kernel.org
X-Received: by 2002:a05:6102:41a3:b0:739:626d:4473 with SMTP id
 ada2fe7eead31-764e1236bf4mr4640136137.0.1786375757471; Mon, 10 Aug 2026
 08:29:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260716123434.2576253-1-prabhakar.mahadev-lad.rj@bp.renesas.com> <20260716123434.2576253-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
In-Reply-To: <20260716123434.2576253-3-prabhakar.mahadev-lad.rj@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 10 Aug 2026 17:29:04 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWEm4yjOH0ziVR3CVDsDJDyJWE7K3GNQpCEiWW5bxaJNw@mail.gmail.com>
X-Gm-Features: AUfX_mxfmVTB6woxgoCnGx3pPeCPHCjtZ4q0ym9LciGln7n8cSU0E7kTq7doZmc
Message-ID: <CAMuHMdWEm4yjOH0ziVR3CVDsDJDyJWE7K3GNQpCEiWW5bxaJNw@mail.gmail.com>
Subject: Re: [PATCH v3 2/8] clk: renesas: r9a09g077: Register SYSC regmap
To: Prabhakar <prabhakar.csengg@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck <linux@roeck-us.net>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-renesas-soc@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, 
	Prabhakar <prabhakar.csengg+renesas@gmail.com>, Biju Das <biju.das.jz@bp.renesas.com>, 
	Fabrizio Castro <fabrizio.castro.jz@renesas.com>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"

Hi Prabhakar,

On Thu, 16 Jul 2026 at 14:34, Prabhakar <prabhakar.csengg@gmail.com> wrote:
> From: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
>
> Register a syscon regmap for the System Controller (SYSC) integrated into
> the RZ/T2H and RZ/N2H CPG block.
>
> Unlike traditional Renesas CPG/MSSR implementations, the RZ/T2H and RZ/N2H
> CPG block also integrates the SYSC, which provides low-power management,
> clock monitoring, write protection and peripheral configuration registers
> shared by multiple drivers.
>
> Implement the RZ/T2H-specific .post_init() callback to create and register
> a syscon regmap covering the SYSC register space using the CPG device node.
> For backward compatibility, return without registering the regmap when the
> mapped resources correspond to older Device Trees that expose only the
> legacy 64 KiB CPG register window.
>
> Signed-off-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> ---
> v2->v3:
> - Dropped dangerous registers from writeable_readable list.
> - Renamed sysc_init to post_init and updated signature to take
>   cpg_mssr_pub struct.
> - Created a single regmap covering both SYSC register regions
>   instead of two separate regmaps.
> - Updated commit message

Thanks for the update!

> --- a/drivers/clk/renesas/r9a09g077-cpg.c
> +++ b/drivers/clk/renesas/r9a09g077-cpg.c

> @@ -87,6 +90,19 @@ MODULE_IMPORT_NS("RZV2H_CPG");
>  #define CPG_PLL_MON(x)         ((x) - 0x10)
>  #define CPG_PLL_MON_LOCK       BIT(0)
>
> +#define RZT2H_SYSC_SIZE                        0x20000

This is the size of the two SYSC regions combined (more below).

> +#define RZT2H_SYSC_OFFSET              0x10000
> +#define RZT2H_SYSC_BLOCK_MASK          BIT(16)
> +#define RZT2H_SYSC_OFFSET_MASK         GENMASK(15, 0)
> +#define RZT2H_SYSC_BLOCK(x)            FIELD_GET(RZT2H_SYSC_BLOCK_MASK, x)
> +#define RZT2H_SYSC_REG_OFFSET(x)       FIELD_GET(RZT2H_SYSC_OFFSET_MASK, x)
> +#define RZT2H_SYSC_BASE(b0, b1, x)     (RZT2H_SYSC_BLOCK(x) ? (b1) : (b0))

Passing the two bases looks a bit ugly to me...

> +
> +struct r9a09g077_sysc_reg {
> +       void __iomem *base0;
> +       void __iomem *base1;

What about combining them into an array?

    void __iomem base[2];

The you can do

    void __iomem *base = sysc->base[RZT2H_SYSC_BLOCK(reg)];

below?

> +};
> +
>  enum rzt2h_clk_types {
>         CLK_TYPE_RZT2H_DIV = CLK_TYPE_CUSTOM,   /* Clock with divider */
>         CLK_TYPE_RZT2H_MUX,                     /* Clock with clock source selector */
> @@ -875,6 +891,118 @@ r9a09g077_cpg_clk_register(struct device *dev, const struct cpg_core_clk *core,
>         }
>  }
>
> +static int r9a09g077_regmap_read(void *context, unsigned int reg, unsigned int *val)
> +{
> +       struct r9a09g077_sysc_reg *sysc = context;
> +       void __iomem *base = RZT2H_SYSC_BASE(sysc->base0, sysc->base1, reg);
> +
> +       *val = readl(base + RZT2H_SYSC_REG_OFFSET(reg));
> +
> +       return 0;
> +}

> +static bool r9a09g077_writeable_readable_sysc0(struct device *dev, unsigned int reg)
> +{
> +       switch (reg) {
> +       /* ELOPA/B and GTIOCSEL */
> +       case 0x0000 ... 0x0008:
> +       /* Encoder config */
> +       case 0x1000 ... 0x1164:
> +       /* PCIe config */
> +       case 0x2000 ... 0x2024:
> +       case 0x2030 ... 0x2054:
> +       case 0x2060:
> +       /* xSPI config */
> +       case 0x3000 ... 0x300C:
> +       case 0x3100 ... 0x310C:
> +       /* MD_MON */
> +       case 0x4100:
> +       /* PRCRN */
> +       case 0x4200:
> +               return true;
> +
> +       default:
> +               return false;
> +       }
> +}
> +
> +static bool r9a09g077_writeable_readable_sysc1(struct device *dev, unsigned int reg)
> +{
> +       switch (reg) {
> +       /* WDTDCRm */
> +       case 0x5100 ... 0x5114:
> +       /* PRCRS */
> +       case 0x6000:
> +               return true;
> +
> +       default:
> +               return false;
> +       }
> +}
> +
> +static bool r9a09g077_writeable_readable_sysc(struct device *dev, unsigned int reg)
> +{
> +       if (RZT2H_SYSC_BLOCK(reg))
> +               return r9a09g077_writeable_readable_sysc1(dev, RZT2H_SYSC_REG_OFFSET(reg));
> +
> +       return r9a09g077_writeable_readable_sysc0(dev, RZT2H_SYSC_REG_OFFSET(reg));

I like symmetry, though ;-)

IMO the separate sysc0 and sysc1 functions don't add much value.
What about:

    offset = RZT2H_SYSC_REG_OFFSET(reg);
    switch (RZT2H_SYSC_BLOCK(reg)) {
    case 0:
            switch (offset) {
                    ...
            }

    case 1:
            switch (offset) {
                    ...
            }
    }

    return false;

> +}
> +
> +static int r9a09g077_post_init(struct device *dev, struct cpg_mssr_pub *pub)
> +{
> +       struct regmap_config *regmap_cfg __free(kfree) = kzalloc_obj(*regmap_cfg);
> +       struct r9a09g077_sysc_reg *sysc_reg;
> +       struct regmap *regmap;
> +
> +       /*
> +        * Return early if the SYSC sizes are not as expected for backwards
> +        * compatibility with older device trees.
> +        */
> +       if (pub->size0 != RZT2H_SYSC_SIZE || pub->size1 != RZT2H_SYSC_SIZE)

While RZT2H_SYSC_SIZE is the correct value to use here, it is not
correct from a semantic point of view.

> +               return 0;
> +
> +       if (!regmap_cfg)
> +               return -ENOMEM;
> +
> +       sysc_reg = devm_kzalloc(dev, sizeof(*sysc_reg), GFP_KERNEL);
> +       if (!sysc_reg)
> +               return -ENOMEM;
> +
> +       /* Only allow access in the SYSC regions */
> +       sysc_reg->base0 = pub->base0 + RZT2H_SYSC_OFFSET;
> +       sysc_reg->base1 = pub->base1 + RZT2H_SYSC_OFFSET;
> +
> +       regmap_cfg->name = "rzt2h_sysc";
> +       regmap_cfg->reg_bits = 32;
> +       regmap_cfg->reg_stride = 4;
> +       regmap_cfg->val_bits = 32;
> +       regmap_cfg->fast_io = true;
> +       regmap_cfg->max_register = RZT2H_SYSC_SIZE - 1;

This is the size of the two blocks combined.

> +       regmap_cfg->readable_reg = r9a09g077_writeable_readable_sysc;
> +       regmap_cfg->writeable_reg = r9a09g077_writeable_readable_sysc;
> +
> +       regmap = devm_regmap_init(dev, &r9a09g077_sys_regmap_bus, sysc_reg, regmap_cfg);
> +       if (IS_ERR(regmap))
> +               return PTR_ERR(regmap);
> +
> +       return of_syscon_register_regmap(dev->of_node, regmap);
> +}
> +
>  const struct cpg_mssr_info r9a09g077_cpg_mssr_info = {
>         /* Core Clocks */
>         .core_clks = r9a09g077_core_clks,
> @@ -889,4 +1017,6 @@ const struct cpg_mssr_info r9a09g077_cpg_mssr_info = {
>
>         .reg_layout = CLK_REG_LAYOUT_RZ_T2H,
>         .cpg_clk_register = r9a09g077_cpg_clk_register,
> +
> +       .post_init = r9a09g077_post_init,
>  };
> diff --git a/drivers/clk/renesas/renesas-cpg-mssr.c b/drivers/clk/renesas/renesas-cpg-mssr.c
> index 80f4403ea2ba..2987c34f2ba2 100644
> --- a/drivers/clk/renesas/renesas-cpg-mssr.c
> +++ b/drivers/clk/renesas/renesas-cpg-mssr.c
> @@ -1267,6 +1267,7 @@ static int __init cpg_mssr_common_init(struct device *dev,
>  {
>         struct cpg_mssr_priv *priv;
>         unsigned int nclks, i;
> +       struct resource res;
>         int error;
>
>         if (info->init) {
> @@ -1285,13 +1286,23 @@ static int __init cpg_mssr_common_init(struct device *dev,
>         priv->dev = dev;
>         spin_lock_init(&priv->pub.rmw_lock);
>
> -       priv->pub.base0 = of_iomap(np, 0);
> +       error = of_address_to_resource(np, 0, &res);
> +       if (error)
> +               return error;
> +
> +       priv->pub.size0 = resource_size(&res);
> +       priv->pub.base0 = ioremap(res.start, priv->pub.size0);
>         if (!priv->pub.base0) {
>                 error = -ENOMEM;
>                 goto out_err;
>         }
>         if (info->reg_layout == CLK_REG_LAYOUT_RZ_T2H) {
> -               priv->pub.base1 = of_iomap(np, 1);
> +               error = of_address_to_resource(np, 1, &res);
> +               if (error)
> +                       goto out_err;
> +
> +               priv->pub.size1 = resource_size(&res);
> +               priv->pub.base1 = ioremap(res.start, priv->pub.size1);

Instead of complicating the code here, r9a09g077_post_init() might as
well call of_address_to_resource(dev->of_node) itself.

>                 if (!priv->pub.base1) {
>                         error = -ENOMEM;
>                         goto out_err;
> @@ -1414,6 +1425,9 @@ static int __init cpg_mssr_probe(struct platform_device *pdev)
>
>         error = cpg_mssr_reset_controller_register(priv);
>
> +       if (!error && info->post_init)
> +               error = info->post_init(priv->dev, &priv->pub);

No cleanup in case of error, so the regmap is considered optional, right?

> +
>  reserve_exit:
>         cpg_mssr_reserved_exit(priv);
>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
