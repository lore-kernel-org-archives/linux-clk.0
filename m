Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20582C678D6
	for <linux-clk@archiver.kernel.org>; Fri, 13 Jan 2023 20:15:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230192AbjAMUPb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 13 Jan 2023 15:15:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45520 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231232AbjAMUP1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 Jan 2023 15:15:27 -0500
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B98DC89BC3
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 12:14:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1673640883;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=V54z6rLYX2VOlDzoy2qPL6F5L+cbM84DrtMdlJiXWFI=;
        b=Hoo0YEqY8yQlnM/u+prrzklcZrCKSkBF8AN5ssMtcpa9sHWk/emJFFgw0ndCLyPdRwJzkM
        ymZ+SRMugmztTCPdbebz4FbSEtA+MJesUMyNSegF8pga62WENRbFMO+YAbC73nF00I8ygz
        qkJd0uHtPiLVEImYtF8wQG/NvwfQ97c=
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-262-r7Y215jlOAe1wc4qSq4edA-1; Fri, 13 Jan 2023 15:14:34 -0500
X-MC-Unique: r7Y215jlOAe1wc4qSq4edA-1
Received: by mail-ot1-f71.google.com with SMTP id y14-20020a0568301d8e00b00670641b451bso11163545oti.15
        for <linux-clk@vger.kernel.org>; Fri, 13 Jan 2023 12:14:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V54z6rLYX2VOlDzoy2qPL6F5L+cbM84DrtMdlJiXWFI=;
        b=NKGs0/UixXEcDJ4s3AA3hvU4YdQbjKrhoBB6I1wOblpBxMjOtwYSDT0+RjktRcfebi
         gba9cwzsp2KU9rIYvJDyz6PCzYSMCcIp/t6Ux9ruau1Wxnwwl/JpcHQ5w2UDwAjw8oa8
         51Htwm+Pkf8m+e1UCDVi9QCbspM7XyKb4JVO3MJmEPGcmTmMKrrZ12q/ce6cnzwVmYTw
         JOaCl4muBqArZxzcwZGnngd4iKssN6utrG7h5Dypl302kunAg0T69bVUu5v8phu7Us2B
         roa8daHETJGyqKZ+3G7ZiCEjmBffRAizNGfwEwMc6Ayih73SjrZKfPMc/j+DW0cogzQ0
         fn+w==
X-Gm-Message-State: AFqh2koBGLoGXB/1PSLxDp7hKPIO6i3aiaOUbGxY1NJ+Dtx416pshs2k
        btdFqmCTH+jj9ABpZqnbD87jN2rMLHY5erXZEkUmEJNbrBJLMpcIE8ndYEXOUN6IpzWpYTXGT3s
        qNwO2wC0r8Hxt3PMFkKCo
X-Received: by 2002:a4a:840b:0:b0:4a3:7135:d6e6 with SMTP id l11-20020a4a840b000000b004a37135d6e6mr27292078oog.2.1673640873203;
        Fri, 13 Jan 2023 12:14:33 -0800 (PST)
X-Google-Smtp-Source: AMrXdXs9qurBkZ0NHbx4xl/ouYmunfvjOxLSlaDzU3BupNJH5CSmq96OKqhSoII4T2zcJaJLgYoaaA==
X-Received: by 2002:a4a:840b:0:b0:4a3:7135:d6e6 with SMTP id l11-20020a4a840b000000b004a37135d6e6mr27292066oog.2.1673640872939;
        Fri, 13 Jan 2023 12:14:32 -0800 (PST)
Received: from halaney-x13s ([2600:1700:1ff0:d0e0::41])
        by smtp.gmail.com with ESMTPSA id y139-20020a4a4591000000b004c60069d1fbsm3018728ooa.11.2023.01.13.12.14.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Jan 2023 12:14:32 -0800 (PST)
Date:   Fri, 13 Jan 2023 14:14:30 -0600
From:   Andrew Halaney <ahalaney@redhat.com>
To:     Bjorn Andersson <quic_bjorande@quicinc.com>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Abel Vesa <abel.vesa@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] clk: qcom: Remove need for clk_ignore_unused on sc8280xp
Message-ID: <20230113201430.c4oa46ry2bx2axhd@halaney-x13s>
References: <20230113041038.4188995-1-quic_bjorande@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230113041038.4188995-1-quic_bjorande@quicinc.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jan 12, 2023 at 08:10:38PM -0800, Bjorn Andersson wrote:
> With the transition of disabling unused clocks at sync_state, rather
> than late_initcall() it's now possible to drop clk_ignore_unused and
> unused clock disabled once client drivers have probed. Do this on
> SC8280XP.
> 
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>

Tested-by: Andrew Halaney <ahalaney@redhat.com> # sc8280xp-lenovo-thinkpad-x13s

I've booted with this (and without clk_ignore_unused) a few times today
and have been working with on the machine without any apparent issues.

Thanks! It is nice to have to modify less of the kernel cli to boot.

> ---
>  drivers/clk/qcom/dispcc-sc8280xp.c | 1 +
>  drivers/clk/qcom/gcc-sc8280xp.c    | 1 +
>  2 files changed, 2 insertions(+)
> 
> diff --git a/drivers/clk/qcom/dispcc-sc8280xp.c b/drivers/clk/qcom/dispcc-sc8280xp.c
> index 167470beb369..c84a6481b879 100644
> --- a/drivers/clk/qcom/dispcc-sc8280xp.c
> +++ b/drivers/clk/qcom/dispcc-sc8280xp.c
> @@ -3199,6 +3199,7 @@ static struct platform_driver disp_cc_sc8280xp_driver = {
>  	.driver = {
>  		.name = "disp_cc-sc8280xp",
>  		.of_match_table = disp_cc_sc8280xp_match_table,
> +		.sync_state = clk_sync_state_disable_unused,
>  	},
>  };
>  
> diff --git a/drivers/clk/qcom/gcc-sc8280xp.c b/drivers/clk/qcom/gcc-sc8280xp.c
> index b3198784e1c3..f4fdc5b9663c 100644
> --- a/drivers/clk/qcom/gcc-sc8280xp.c
> +++ b/drivers/clk/qcom/gcc-sc8280xp.c
> @@ -7441,6 +7441,7 @@ static struct platform_driver gcc_sc8280xp_driver = {
>  	.driver = {
>  		.name = "gcc-sc8280xp",
>  		.of_match_table = gcc_sc8280xp_match_table,
> +		.sync_state = clk_sync_state_disable_unused,
>  	},
>  };
>  
> -- 
> 2.37.3
> 

