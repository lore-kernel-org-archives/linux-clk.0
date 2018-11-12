Return-Path: <SRS0=O5DU=NX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99A88C43441
	for <linux-clk@archiver.kernel.org>; Mon, 12 Nov 2018 11:05:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 564FC223D8
	for <linux-clk@archiver.kernel.org>; Mon, 12 Nov 2018 11:05:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="ERkKXFvI"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 564FC223D8
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729228AbeKLU6g (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Nov 2018 15:58:36 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:33875 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729238AbeKLU6f (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Nov 2018 15:58:35 -0500
Received: by mail-io1-f66.google.com with SMTP id f6so2891545iob.1
        for <linux-clk@vger.kernel.org>; Mon, 12 Nov 2018 03:05:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=cNdH9cLWUkdwL6NZWZ46uWE3AUHdcg3jRlvfr4WJhRQ=;
        b=ERkKXFvILqFLTGp+eUCj7eGBa62rd1PWlrUSsYm0tjzmZbHfK2Ivy2mYkLQC7+BT0E
         qa7PT26bBqZJFEKwhy6+laSG06s3luBnx7/Ibz3bsmtf1ebsEsu4lr+mXU71ANc+Ks9i
         TQj5OhV75xmH3uwEbjURxWZ5LqwiSGfxgI9R0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=cNdH9cLWUkdwL6NZWZ46uWE3AUHdcg3jRlvfr4WJhRQ=;
        b=jxU4qYA8h1J/KpQFiCJmoSaCzz6yQXUsl5sg8BRfnWeqanU7S6hVd0WNOuYCVkdaBf
         q1KryCgUcAqnTRNJvAlnx8F2ctGzb8U/BjvdxY6mS5cKPVjhdv5jNZHbJQGVMUiRBRRK
         dwIDnE7zrJRS7VEJsZxUbJ4UWUyxBSr1rKh64CRjR1GI/kK5e6FLCIgcQcMYZOUi7hN/
         BGunOMjL8PLwPMi5wUByBRUS30PaFcP6zCcmJqjl6f9RjFpwN7/2PJ2eqgKFTsbCHcm+
         W5s20/Y/buaHMnJ2cIKKSuaZKn/0Nl9L6BkyRzJ+zHFebGrkPMKqq+/IILYrQZj7MZcb
         GW/A==
X-Gm-Message-State: AGRZ1gIZ8uQd3jgbmDFrJoVsMLif2RbSHFo7etmRTy+WS4/vZYdtTB0m
        J0eKlczY2inJ9p2XYLm/IDG0eyE39PGKlz0+KIfoJQRi
X-Google-Smtp-Source: AJdET5cIKyYCJwDYycvEXfuEmnwDupVPWNdMVwA/1HLB2mKhen8bgPEtC5NERZRKpoWCuSUwuBPUA1AWCM7y65a2GhA=
X-Received: by 2002:a6b:3945:: with SMTP id g66mr303313ioa.131.1542020749218;
 Mon, 12 Nov 2018 03:05:49 -0800 (PST)
MIME-Version: 1.0
Received: by 2002:a02:38d:0:0:0:0:0 with HTTP; Mon, 12 Nov 2018 03:05:08 -0800 (PST)
In-Reply-To: <20181024222301.21455-3-chris.brandt@renesas.com>
References: <20181024222301.21455-1-chris.brandt@renesas.com> <20181024222301.21455-3-chris.brandt@renesas.com>
From:   Ulf Hansson <ulf.hansson@linaro.org>
Date:   Mon, 12 Nov 2018 12:05:08 +0100
Message-ID: <CAPDyKFpMAH+528BouQiepHbi55uF=EEQqNoXxMUhQctMdoJu_A@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] mmc: renesas_sdhi_internal_dmac: Add R7S9210 support
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        DTML <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 25 October 2018 at 00:23, Chris Brandt <chris.brandt@renesas.com> wrote:
> The SDHI/MMC controller in the RZ/A2 is almost the same as R-Car gen3, but
> with some minor differences.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Applied for next, thanks!

Kind regards
Uffe

> ---
> v5:
>  * Rebased against -next to fix conficts with RZ/G1C patches
>  * Changed Kconfig message to say "found in some RZ" instead of just
>    "found in RZ/A"
> v4:
>  * Fixed spelling in #define
> v3:
>  * Removed extra space in Kconfig
>  * Removed unneeded parentheses
> v2:
>  * Made comment clearer
> ---
>  drivers/mmc/host/Kconfig                      |  7 ++++---
>  drivers/mmc/host/renesas_sdhi_internal_dmac.c | 28 +++++++++++++++++++++++++--
>  2 files changed, 30 insertions(+), 5 deletions(-)
>
> diff --git a/drivers/mmc/host/Kconfig b/drivers/mmc/host/Kconfig
> index 1b58739d9744..720311ece714 100644
> --- a/drivers/mmc/host/Kconfig
> +++ b/drivers/mmc/host/Kconfig
> @@ -646,13 +646,14 @@ config MMC_SDHI_SYS_DMAC
>
>  config MMC_SDHI_INTERNAL_DMAC
>         tristate "DMA for SDHI SD/SDIO controllers using on-chip bus mastering"
> -       depends on ARM64 || ARCH_R8A77470 || COMPILE_TEST
> +       depends on ARM64 || ARCH_R7S9210 || ARCH_R8A77470 || COMPILE_TEST
>         depends on MMC_SDHI
> -       default MMC_SDHI if (ARM64 || ARCH_R8A77470)
> +       default MMC_SDHI if (ARM64 || ARCH_R7S9210 || ARCH_R8A77470)
>         help
>           This provides DMA support for SDHI SD/SDIO controllers
>           using on-chip bus mastering. This supports the controllers
> -         found in arm64 based SoCs.
> +         found in arm64 based SoCs. This controller is also found in
> +         some RZ family SoCs.
>
>  config MMC_UNIPHIER
>         tristate "UniPhier SD/eMMC Host Controller support"
> diff --git a/drivers/mmc/host/renesas_sdhi_internal_dmac.c b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> index b6f54102bfdd..b9d83d6ed346 100644
> --- a/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> +++ b/drivers/mmc/host/renesas_sdhi_internal_dmac.c
> @@ -34,7 +34,7 @@
>  #define DTRAN_MODE_CH_NUM_CH0  0       /* "downstream" = for write commands */
>  #define DTRAN_MODE_CH_NUM_CH1  BIT(16) /* "upstream" = for read commands */
>  #define DTRAN_MODE_BUS_WIDTH   (BIT(5) | BIT(4))
> -#define DTRAN_MODE_ADDR_MODE   BIT(0)  /* 1 = Increment address */
> +#define DTRAN_MODE_ADDR_MODE   BIT(0)  /* 1 = Increment address, 0 = Fixed */
>
>  /* DM_CM_DTRAN_CTRL */
>  #define DTRAN_CTRL_DM_START    BIT(0)
> @@ -73,6 +73,9 @@ static unsigned long global_flags;
>  #define SDHI_INTERNAL_DMAC_ONE_RX_ONLY 0
>  #define SDHI_INTERNAL_DMAC_RX_IN_USE   1
>
> +/* RZ/A2 does not have the ADRR_MODE bit */
> +#define SDHI_INTERNAL_DMAC_ADDR_MODE_FIXED_ONLY 2
> +
>  /* Definitions for sampling clocks */
>  static struct renesas_sdhi_scc rcar_gen3_scc_taps[] = {
>         {
> @@ -81,6 +84,21 @@ static struct renesas_sdhi_scc rcar_gen3_scc_taps[] = {
>         },
>  };
>
> +static const struct renesas_sdhi_of_data of_rza2_compatible = {
> +       .tmio_flags     = TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
> +                         TMIO_MMC_HAVE_CBSY,
> +       .tmio_ocr_mask  = MMC_VDD_32_33,
> +       .capabilities   = MMC_CAP_SD_HIGHSPEED | MMC_CAP_SDIO_IRQ |
> +                         MMC_CAP_CMD23,
> +       .bus_shift      = 2,
> +       .scc_offset     = 0 - 0x1000,
> +       .taps           = rcar_gen3_scc_taps,
> +       .taps_num       = ARRAY_SIZE(rcar_gen3_scc_taps),
> +       /* DMAC can handle 0xffffffff blk count but only 1 segment */
> +       .max_blk_count  = 0xffffffff,
> +       .max_segs       = 1,
> +};
> +
>  static const struct renesas_sdhi_of_data of_rcar_r8a7795_compatible = {
>         .tmio_flags     = TMIO_MMC_HAS_IDLE_WAIT | TMIO_MMC_CLK_ACTUAL |
>                           TMIO_MMC_HAVE_CBSY | TMIO_MMC_MIN_RCAR2 |
> @@ -113,6 +131,7 @@ static const struct renesas_sdhi_of_data of_rcar_gen3_compatible = {
>  };
>
>  static const struct of_device_id renesas_sdhi_internal_dmac_of_match[] = {
> +       { .compatible = "renesas,sdhi-r7s9210", .data = &of_rza2_compatible, },
>         { .compatible = "renesas,sdhi-mmc-r8a77470", .data = &of_rcar_gen3_compatible, },
>         { .compatible = "renesas,sdhi-r8a7795", .data = &of_rcar_r8a7795_compatible, },
>         { .compatible = "renesas,sdhi-r8a7796", .data = &of_rcar_r8a7795_compatible, },
> @@ -172,7 +191,10 @@ renesas_sdhi_internal_dmac_start_dma(struct tmio_mmc_host *host,
>                                      struct mmc_data *data)
>  {
>         struct scatterlist *sg = host->sg_ptr;
> -       u32 dtran_mode = DTRAN_MODE_BUS_WIDTH | DTRAN_MODE_ADDR_MODE;
> +       u32 dtran_mode = DTRAN_MODE_BUS_WIDTH;
> +
> +       if (!test_bit(SDHI_INTERNAL_DMAC_ADDR_MODE_FIXED_ONLY, &global_flags))
> +               dtran_mode |= DTRAN_MODE_ADDR_MODE;
>
>         if (!dma_map_sg(&host->pdev->dev, sg, host->sg_len,
>                         mmc_get_dma_dir(data)))
> @@ -292,6 +314,8 @@ static const struct tmio_mmc_dma_ops renesas_sdhi_internal_dmac_dma_ops = {
>   */
>  static const struct soc_device_attribute soc_whitelist[] = {
>         /* specific ones */
> +       { .soc_id = "r7s9210",
> +         .data = (void *)BIT(SDHI_INTERNAL_DMAC_ADDR_MODE_FIXED_ONLY) },
>         { .soc_id = "r8a7795", .revision = "ES1.*",
>           .data = (void *)BIT(SDHI_INTERNAL_DMAC_ONE_RX_ONLY) },
>         { .soc_id = "r8a7796", .revision = "ES1.0",
> --
> 2.16.1
>
