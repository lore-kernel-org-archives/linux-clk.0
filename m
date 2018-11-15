Return-Path: <SRS0=YASP=N2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21B41C43441
	for <linux-clk@archiver.kernel.org>; Thu, 15 Nov 2018 09:46:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DE26120825
	for <linux-clk@archiver.kernel.org>; Thu, 15 Nov 2018 09:46:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Hvc9TnhK"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DE26120825
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728634AbeKOTx5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 15 Nov 2018 14:53:57 -0500
Received: from mail-wm1-f65.google.com ([209.85.128.65]:55420 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387724AbeKOTx4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 15 Nov 2018 14:53:56 -0500
Received: by mail-wm1-f65.google.com with SMTP id y139so782216wmc.5
        for <linux-clk@vger.kernel.org>; Thu, 15 Nov 2018 01:46:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=Sa3kl/RsjKWO+z6SiPlqidK82hY1mr0ur092VFUOkug=;
        b=Hvc9TnhKlehbUHjKPaiBDz5attI7I+wYSLh51MLpJ+eNQOGP+XvngiocaMnKDtu+1f
         Bf3zLY+D025HUG61N+Kch7XAk57Reh1GvqeC/M9mD/ylAkgHC2v74GdevWIpoIjnZB4/
         LE2D5zyl6XVltLRNrcybf7WA+jnzzEHUZqoE4Ls1qYvst68jGjgCqFMQGXd99Lvz5EYK
         E9FYlqtkEk7C4P0xgVLfGiwKS9HrIJlMHrOUwzOZeoZZDr1gBvmIn+w0fvv43T0BI3zW
         tNRNy5i8Goc8R23dqT2yhXCJaUukUhJsl8J52WYTXcGgBwYUQ+e8JXxE3Edpe58KeN+g
         sx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=Sa3kl/RsjKWO+z6SiPlqidK82hY1mr0ur092VFUOkug=;
        b=V9HNoTkWlYTMF/slTGClD7uIRq9I7qGwBjbVtplFRELk144RN2VKQV81ViomU0kr4C
         M1ceMoXzRfgkgBhGvs/8THrVIB9Fi6WKDGPZJB/YTVrj5w/yHsAZJlCcVqTPMGgdZMzP
         0hirVELuyYSpJ45GuN0R4Csl3lhKUxDiGWRUFlBljVIRBXOuzvgsPfg9QRNw9B7awL9b
         wVSYYmfVHrjgr+Ipn/zG/9nFol/r31LrzVjk0PWQPcjyaGLBUj9Zv6hcU8TmGa1bDD37
         +6ywoO56V1vvu0f3wk3i7KkySeseV9cFhV9mn+znCcOUcI1TXc2cJy5MuneFFjiD/WLC
         mcmQ==
X-Gm-Message-State: AGRZ1gKK4OTFM6b39qrQhwzmBJb52oSqLzUfNRJsYDRxaaq7OfhJoEdf
        ClT5RGM2asZMpr8hXHu4wDOCGA==
X-Google-Smtp-Source: AJdET5ec4VYABAIx97zKtMEl91kHSFI522CxXZHs5m5Fzho1KOKbdonjkjwCFKFBhqoDTg90XkhVyQ==
X-Received: by 2002:a1c:c545:: with SMTP id v66mr4879066wmf.132.1542275209188;
        Thu, 15 Nov 2018 01:46:49 -0800 (PST)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
        by smtp.gmail.com with ESMTPSA id m7sm5251705wml.32.2018.11.15.01.46.47
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 15 Nov 2018 01:46:48 -0800 (PST)
Message-ID: <533bd2bd4dced1610a803e7b2d51995e5577ba1d.camel@baylibre.com>
Subject: Re: [RFC v1 5/7] clk: meson: meson8b: mark the CPU clock as
 CLK_IS_CRITICAL
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        narmstrong@baylibre.com
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org
Date:   Thu, 15 Nov 2018 10:46:46 +0100
In-Reply-To: <20181114225725.2821-6-martin.blumenstingl@googlemail.com>
References: <20181114225725.2821-1-martin.blumenstingl@googlemail.com>
         <20181114225725.2821-6-martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.2 (3.30.2-2.fc29) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 2018-11-14 at 23:57 +0100, Martin Blumenstingl wrote:
> We don't want the common clock framework to disable the "cpu_clk" if
> it's not used by any device. The cpufreq-dt driver does not enable the
> CPU clocks. However, even if it would we would still want the CPU clock
> to be enabled at all times because the CPU clock is also required even
> if we disable CPU frequency scaling on a specific board.
> 
> The reason why we want the CPU clock to be enabled is a clock further up
> in the tree:
> Since commit 6f888e7bc7bd58 ("clk: meson: clk-pll: add enable bit") the
> sys_pll can be disabled. However, since the CPU clock is derived from
> sys_pll we don't want sys_pll to get disabled. The common clock
> framework takes care of that for us by enabling all parent clocks of our
> CPU clock when we mark the CPU clock with CLK_IS_CRITICAL.
> 
> Until now this is not a problem yet because all clocks in the CPU
> clock's tree (including sys_pll) are read-only. However, once we allow
> modifications to the clocks in that tree we will need this.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> ---
>  drivers/clk/meson/meson8b.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/meson/meson8b.c b/drivers/clk/meson/meson8b.c
> index 8a3c346e110d..d566dd5bc567 100644
> --- a/drivers/clk/meson/meson8b.c
> +++ b/drivers/clk/meson/meson8b.c
> @@ -646,7 +646,8 @@ static struct clk_regmap meson8b_cpu_clk = {
>  						  "cpu_scale_out_sel" },
>  		.num_parents = 2,
>  		.flags = (CLK_SET_RATE_PARENT |
> -			  CLK_SET_RATE_NO_REPARENT),
> +			  CLK_SET_RATE_NO_REPARENT |
> +			  CLK_IS_CRITICAL),
>  	},
>  };
>  

Acked-by: Jerome Brunet <jbrunet@baylibre.com>

