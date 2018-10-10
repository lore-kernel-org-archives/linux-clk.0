Return-Path: <SRS0=fkKI=MW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E8A0C43441
	for <linux-clk@archiver.kernel.org>; Wed, 10 Oct 2018 08:41:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3DE58214FF
	for <linux-clk@archiver.kernel.org>; Wed, 10 Oct 2018 08:41:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 3DE58214FF
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726617AbeJJQCH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 Oct 2018 12:02:07 -0400
Received: from mail-vs1-f65.google.com ([209.85.217.65]:42274 "EHLO
        mail-vs1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726722AbeJJQCH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 10 Oct 2018 12:02:07 -0400
Received: by mail-vs1-f65.google.com with SMTP id e126so4252310vsc.9;
        Wed, 10 Oct 2018 01:40:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JsU9oWtKpBB3ekTUeuHIk/QRb3o/smx+Tm9LRWAU3Es=;
        b=qntwW7VHhEC97ZtUjjBtrLLCQfNdb9+i71Km/2v8r8I+Trpy+rZ1Ffk7MW6AzkXqSC
         QQqM/17ksitAGfnhOyWIjwz0+e9VHfE2nEzWqUmonM9eCepoJLnD2QIOqiws71tKD6us
         gqi9+7cndVuzrNIpYWF72fkQqc/fCSqa2NS9RmqPJNugPGT4fXt1P0zPLuTncjxsCcAR
         ODghdQcK+qhWpFbuN9xEv/XFHL2O251Nff3okJotaXsdtbJbewuynU8DJAjvnMMHFhbB
         r+q4rSXEqwYKt+Wgt3xFSVaNkFM6HTRw9Vlmcf3Tac++/kUMKxNcygvCm05bgItMn//U
         hfYA==
X-Gm-Message-State: ABuFfoiZicd29qzezsL6RgkwUKwHaDYy/zS7rgiGZ92CFFco9tRVH5VJ
        BLfOOYc6CmuThRQO2+Rhp2MGmWLwsHrPx1s0iNg=
X-Google-Smtp-Source: ACcGV63GQAIm86CYQmBVGxiiE0+b1cetActUQWfeuBRN6rdm0n2HXysT41ocosJkQj8Kn55cOKDD5LoQ1RwsCNJ8VTU=
X-Received: by 2002:a9f:30cb:: with SMTP id k11-v6mr4085914uab.28.1539160859524;
 Wed, 10 Oct 2018 01:40:59 -0700 (PDT)
MIME-Version: 1.0
References: <20181008162349.42957-1-chris.brandt@renesas.com> <20181008162349.42957-3-chris.brandt@renesas.com>
In-Reply-To: <20181008162349.42957-3-chris.brandt@renesas.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 10 Oct 2018 10:40:47 +0200
Message-ID: <CAMuHMdWNe2Z=q1tHO5_YLX1Q6+ef5BiQU=feBdcJfzcNvzo8HQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] mmc: renesas_sdhi_internal_dmac: Add R7S9210 support
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Chris,

On Mon, Oct 8, 2018 at 6:24 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> The SDHI/MMC controller in the RZ/A2 is almost the same as R-Car gen3, but
> with some minor differences.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Thanks for your patch!

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
> +/* RZ/A2 does not have this bit (not safe to set it) */

This comment confused me, as SDHI_INTERNAL_DMAC_ADRR_MODE_FIXED is
set for RZ/A2.

s/this bit/the ADDR_MODE bit/?

> +#define SDHI_INTERNAL_DMAC_ADRR_MODE_FIXED 2
> +
>  /* Definitions for sampling clocks */
>  static struct renesas_sdhi_scc rcar_gen3_scc_taps[] = {
>         {

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
