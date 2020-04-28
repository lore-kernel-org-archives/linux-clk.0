Return-Path: <SRS0=1QlQ=6M=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97BAAC83004
	for <linux-clk@archiver.kernel.org>; Tue, 28 Apr 2020 02:16:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 74574206D9
	for <linux-clk@archiver.kernel.org>; Tue, 28 Apr 2020 02:16:19 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=ragnatech-se.20150623.gappssmtp.com header.i=@ragnatech-se.20150623.gappssmtp.com header.b="lzuD7wTw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726307AbgD1CQT (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 27 Apr 2020 22:16:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726251AbgD1CQT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 27 Apr 2020 22:16:19 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B03FAC03C1A8
        for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2020 19:16:18 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id a21so16879927ljj.11
        for <linux-clk@vger.kernel.org>; Mon, 27 Apr 2020 19:16:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ragnatech-se.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=vowBaRwq0si4JBeKvtxOM6U6u8O2nYYDgq9C0dU5xaM=;
        b=lzuD7wTwss2MnGqvd+kl6Bu+I3zijKAZwOMpbiAWZfzCR7dr82BNMggkl/brsgzBZ4
         Pojqj/y98Veoa5IeLjJ5lq2eUebmZRIlEqrHqEDBM22Yfrs9h41w+Be2b/m37N+Pg0ej
         9PYR2Esw2BoJ6oozcAZaFMnYWjQGle5iXsFWNUslZtYa1FluJ44UcTINbsOSE7eRXK/D
         Bf0H57Ea2zTQku+co1d3X80MdaFlQp5aLHaVpzVpY+w+YBtzF/Gesw7v5zpJ7nL136QC
         DPTwGUeF4KxwsnAOlNugP3ZuJVdra3zoio+oT51HMf74sa5/5rw8r/TIzVXRYkv140X7
         ekCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=vowBaRwq0si4JBeKvtxOM6U6u8O2nYYDgq9C0dU5xaM=;
        b=IDNYgsyLYQoKnqyyeiiNDjjrCGkqtWqGdZjChac8T4QcqPpRXEECRZXYWtXBTLABxN
         Wl7Q64SCevnIHFQs/UjWEBVDBxrOAko/GAbEVm9ki3Ox//PXRgu+3d+dgGDOdhigj0jr
         K7Opfetrqmu2KYmbgExW2fVhTQKk4uTMr95XX0adDQXmWAveltOQclC4oRP4izzG4nbp
         0FXJvkfHrvIx6ldknepmYkKYzz0YLSdnI6x6hsvrRQ20eVyISvTnZpfMaO8pPY/3hqR6
         6SBcI+3gKzlZl9ld14yArwrWYc0qIUhfnb6HlrNEkVuTYaYnd1SfGqQ8Kt5cJJ24LXSe
         bp8Q==
X-Gm-Message-State: AGi0PuanYELhCwZfrPNIBo/yEfjM6eycWWvmICq9qhDlJqk69OKjjzYX
        kuF6Mf50p77JuHR7Abx2FqndjyhMauQ=
X-Google-Smtp-Source: APiQypJLCE6b/3p7N1d9GX5Gt6e6N2dH1YsvEnPSg42kBB0pU1eHTo5f2rOs62yJWYUU/QUqzByUBQ==
X-Received: by 2002:a2e:700b:: with SMTP id l11mr12096875ljc.255.1588040175966;
        Mon, 27 Apr 2020 19:16:15 -0700 (PDT)
Received: from localhost (h-209-203.A463.priv.bahnhof.se. [155.4.209.203])
        by smtp.gmail.com with ESMTPSA id u9sm11448547ljl.33.2020.04.27.19.16.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2020 19:16:15 -0700 (PDT)
Date:   Tue, 28 Apr 2020 04:16:15 +0200
From:   Niklas =?iso-8859-1?Q?S=F6derlund?= 
        <niklas.soderlund@ragnatech.se>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: rcar-gen2: Remove superfluous
 CLK_RENESAS_DIV6 selects
Message-ID: <20200428021615.GB1208690@oden.dyn.berto.se>
References: <20200427193446.29738-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20200427193446.29738-1-geert+renesas@glider.be>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Geert,

Thanks for your work.

On 2020-04-27 21:34:46 +0200, Geert Uytterhoeven wrote:
> CLK_RENESAS_CPG_MSSR selects CLK_RENESAS_DIV6, and CLK_RCAR_GEN2_CPG
> selects CLK_RENESAS_CPG_MSSR, so there is no longer a need for the
> individual R-Car Gen2 clock driver options to select CLK_RENESAS_DIV6.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

> ---
> To be queued in clk-renesas-for-v5.8.
> 
>  drivers/clk/renesas/Kconfig | 3 ---
>  1 file changed, 3 deletions(-)
> 
> diff --git a/drivers/clk/renesas/Kconfig b/drivers/clk/renesas/Kconfig
> index 149787b0005d7ad0..9eb79bf906430a9b 100644
> --- a/drivers/clk/renesas/Kconfig
> +++ b/drivers/clk/renesas/Kconfig
> @@ -95,12 +95,10 @@ config CLK_R8A7779
>  config CLK_R8A7790
>  	bool "R-Car H2 clock support" if COMPILE_TEST
>  	select CLK_RCAR_GEN2_CPG
> -	select CLK_RENESAS_DIV6
>  
>  config CLK_R8A7791
>  	bool "R-Car M2-W/N clock support" if COMPILE_TEST
>  	select CLK_RCAR_GEN2_CPG
> -	select CLK_RENESAS_DIV6
>  
>  config CLK_R8A7792
>  	bool "R-Car V2H clock support" if COMPILE_TEST
> @@ -109,7 +107,6 @@ config CLK_R8A7792
>  config CLK_R8A7794
>  	bool "R-Car E2 clock support" if COMPILE_TEST
>  	select CLK_RCAR_GEN2_CPG
> -	select CLK_RENESAS_DIV6
>  
>  config CLK_R8A7795
>  	bool "R-Car H3 clock support" if COMPILE_TEST
> -- 
> 2.17.1
> 

-- 
Regards,
Niklas Söderlund
