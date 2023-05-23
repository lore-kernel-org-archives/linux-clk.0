Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A742C77B75
	for <linux-clk@archiver.kernel.org>; Tue, 23 May 2023 11:46:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236678AbjEWLqX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 May 2023 07:46:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230255AbjEWLqX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 23 May 2023 07:46:23 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4DD7E118
        for <linux-clk@vger.kernel.org>; Tue, 23 May 2023 04:46:21 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3095557dd99so4549696f8f.1
        for <linux-clk@vger.kernel.org>; Tue, 23 May 2023 04:46:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20221208.gappssmtp.com; s=20221208; t=1684842380; x=1687434380;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wXiSekeK0+dNYQ7Rl2lu7vRoSGRXoE72FsEwh/pkNec=;
        b=t+w5SJpb+2rMXjGSrr+ycYAAGx3jSe8ZceNk2+WtAc/Sr1DyRn6buZJ1jzbRtn7zho
         xGL4A42tPWO2M2/8+rUPZiO25rWJ8jQHwfM+AOrPG0ADTxM9ph3ThMrRLEKW5XAHpdDi
         A83Joe5XH2/cQVUJoA+HwPS3S/obukDQo0SY2UjxHZEz4mDrU1dCojbSqWQo0nugyFcT
         ZCPDGkkyyouOas7o+JuldkAx407Zo2PuAfqHDCIb1x+NlfQuJzEpSpQ9O53lEvPdVsd5
         TlL0h2hmPIGc7rX69ilptpzz/OEQNnQiXbp5M1rEUbK22g2/Kg0pnsVSp4Dg8VL73JBb
         qpRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684842380; x=1687434380;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wXiSekeK0+dNYQ7Rl2lu7vRoSGRXoE72FsEwh/pkNec=;
        b=BbRusBW8nOXtihIV632ihRndLu99v41OIoJ+jxP4hYSSJGrP4feWO1F2mTGBMQTzoe
         2REUB33b5k7FAkjWuO0l8KMTw0AAdcq7r7sHIWBY8bD/mCUQJwZ5kUPheDzWfKSUruW8
         C8jBEyzaK2Oaq1VkTJxqAuXJTURdLKdV/oDa7HvpMdVzqSh4GmK+TfAjPU4uO20MPZJZ
         BhBl996ATeS+/SrR6HOY28mnmiT5NtRlRvzevWlz1pINiNV+OqAHzKHe45kda5yo/ifj
         zuOSCqDmmYR5Bf1G8lEHoil98ZZ1SaLgNnRgFcbEbd4D5y0ixPt/McevnfvrsEvKz/wR
         n3rA==
X-Gm-Message-State: AC+VfDyVTW8LYHUkScN3gk5Aq3DF+PuG7Sdush7m0B0beteixwFV5WO/
        VlaQ6Qqn1JQ2AWrgrvrA70qf7A==
X-Google-Smtp-Source: ACHHUZ4vJR8IdN6rXRgEnWf9szojVeR1Ubr3de6/rFKhcPiTu8ggdv+zZEpWXWPQvFRZK8+eQJV04A==
X-Received: by 2002:adf:dd09:0:b0:2f6:208d:2234 with SMTP id a9-20020adfdd09000000b002f6208d2234mr10158434wrm.2.1684842379718;
        Tue, 23 May 2023 04:46:19 -0700 (PDT)
Received: from blmsp ([2001:4090:a245:802c:7f03:2fe0:bd27:d746])
        by smtp.gmail.com with ESMTPSA id i18-20020adffc12000000b0030631a599a0sm10805590wrr.24.2023.05.23.04.46.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 May 2023 04:46:19 -0700 (PDT)
Date:   Tue, 23 May 2023 13:46:18 +0200
From:   Markus Schneider-Pargmann <msp@baylibre.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org,
        Alexandre Mergnat <amergnat@baylibre.com>
Subject: Re: [PATCH] clk: mediatek: mt8365: Fix inverted topclk operations
Message-ID: <20230523114618.laajn2et5nbcxszv@blmsp>
References: <20230511133226.913600-1-msp@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230511133226.913600-1-msp@baylibre.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

just wanted to ask if I need to do something specific for it to go into
a rc? Sorry if I missed doing something for that, I haven't had to fix
something in an rc that often before.

Best,
Markus

On Thu, May 11, 2023 at 03:32:26PM +0200, Markus Schneider-Pargmann wrote:
> The given operations are inverted for the wrong registers which makes
> multiple of the mt8365 hardware units unusable. In my setup at least usb
> did not work.
> 
> Fixed by swapping the operations with the inverted ones.
> 
> Reported-by: Alexandre Mergnat <amergnat@baylibre.com>
> Fixes: 905b7430d3cc ("clk: mediatek: mt8365: Convert simple_gate to mtk_gate clocks")
> Signed-off-by: Markus Schneider-Pargmann <msp@baylibre.com>
> ---
>  drivers/clk/mediatek/clk-mt8365.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/clk/mediatek/clk-mt8365.c b/drivers/clk/mediatek/clk-mt8365.c
> index 6b4e193f648d..6d785ec5754d 100644
> --- a/drivers/clk/mediatek/clk-mt8365.c
> +++ b/drivers/clk/mediatek/clk-mt8365.c
> @@ -583,15 +583,15 @@ static const struct mtk_gate_regs top2_cg_regs = {
>  
>  #define GATE_TOP0(_id, _name, _parent, _shift)			\
>  	GATE_MTK(_id, _name, _parent, &top0_cg_regs,		\
> -		 _shift, &mtk_clk_gate_ops_no_setclr_inv)
> +		 _shift, &mtk_clk_gate_ops_no_setclr)
>  
>  #define GATE_TOP1(_id, _name, _parent, _shift)			\
>  	GATE_MTK(_id, _name, _parent, &top1_cg_regs,		\
> -		 _shift, &mtk_clk_gate_ops_no_setclr)
> +		 _shift, &mtk_clk_gate_ops_no_setclr_inv)
>  
>  #define GATE_TOP2(_id, _name, _parent, _shift)			\
>  	GATE_MTK(_id, _name, _parent, &top2_cg_regs,		\
> -		 _shift, &mtk_clk_gate_ops_no_setclr)
> +		 _shift, &mtk_clk_gate_ops_no_setclr_inv)
>  
>  static const struct mtk_gate top_clk_gates[] = {
>  	GATE_TOP0(CLK_TOP_CONN_32K, "conn_32k", "clk32k", 10),
> -- 
> 2.40.1
> 
