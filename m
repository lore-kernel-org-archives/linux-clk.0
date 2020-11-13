Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C53D3C55ABD
	for <linux-clk@archiver.kernel.org>; Fri, 13 Nov 2020 17:28:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 896C821D1A
	for <linux-clk@archiver.kernel.org>; Fri, 13 Nov 2020 17:28:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="eSoHOmCR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726704AbgKMR1b (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 13 Nov 2020 12:27:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58980 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726632AbgKMR13 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 Nov 2020 12:27:29 -0500
Received: from mail-ua1-x943.google.com (mail-ua1-x943.google.com [IPv6:2607:f8b0:4864:20::943])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3847C0613D1
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2020 09:27:28 -0800 (PST)
Received: by mail-ua1-x943.google.com with SMTP id v16so3232473uat.9
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2020 09:27:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dNeg4qP6VUUjIOr+EpogB4eFqk9juY9gyiBCzYtl5Fw=;
        b=eSoHOmCRpkW35KVQ2MpDLBLg7TiBXu6RgfAM9EYJrcogKGzZK3ZrJ0UeaNTaRtl5sx
         A66LbXrWPSVbH2BwoDyi0kDiZ8QB9ejt4wkdkO/b3wntF1zKPntpX03TUUiCngKDbfPU
         7waZgx5I9He1RJmz/ka1FrVQymueBbbSANj9A=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dNeg4qP6VUUjIOr+EpogB4eFqk9juY9gyiBCzYtl5Fw=;
        b=F/nYlcp0bz0xmQRfUgcvy+ePaXggz7saP75rKBT36vc3Ylt08j1kVxKUOAkDgVxLBj
         6oNyYULkQrwI+HP4nCfyWqsK84perSBbDL33mdcTyWW0n9iZKt2sSNF8/a+duQG6U54R
         eBcNT807ZCL9ky15Db799UeWKUXPxwscO4OMUHvnVNPsMdQTkMxCcVt2ogDFlyZLZqqB
         h4Hk3PhLi23B6O1PR3ntTSxqBS3KZVvBjdBecdXisPGLGkOSbdOEkauVxxuU3P2TIdER
         cFhmp4HQRAQGQaxq5VwTNt5NuI9qYO8Z+pWTqlbM/LuezeVZ9E1sbRrbFonSErCqiP6G
         piiA==
X-Gm-Message-State: AOAM532WrdbSXMyEt7Rf9ox0c8gy9Iw5eSGAFAnosV2CbtorFY4NIrSf
        jm4nhF89GYldyUolzOnCKaNnmEG9WfyB1Q==
X-Google-Smtp-Source: ABdhPJyjeMgVHmpRVWQiW+Z8PhodgH/6dxvODY7qkc4XsXFhSdmmBMyFTP6teK/CY6sdMY1pslS5Vg==
X-Received: by 2002:ab0:592e:: with SMTP id n43mr1882679uad.98.1605288444510;
        Fri, 13 Nov 2020 09:27:24 -0800 (PST)
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com. [209.85.221.176])
        by smtp.gmail.com with ESMTPSA id v4sm1141816vsa.16.2020.11.13.09.27.24
        for <linux-clk@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Nov 2020 09:27:24 -0800 (PST)
Received: by mail-vk1-f176.google.com with SMTP id s135so2284361vkh.6
        for <linux-clk@vger.kernel.org>; Fri, 13 Nov 2020 09:27:24 -0800 (PST)
X-Received: by 2002:a1f:2306:: with SMTP id j6mr1991952vkj.21.1605288440171;
 Fri, 13 Nov 2020 09:27:20 -0800 (PST)
MIME-Version: 1.0
References: <20201113101419.GC168908@mwanda>
In-Reply-To: <20201113101419.GC168908@mwanda>
From:   Doug Anderson <dianders@chromium.org>
Date:   Fri, 13 Nov 2020 09:27:08 -0800
X-Gmail-Original-Message-ID: <CAD=FV=V1tvAw-myadWTA0K_RzJ7R9oYzVuc5-y74Ov06M0dk0w@mail.gmail.com>
Message-ID: <CAD=FV=V1tvAw-myadWTA0K_RzJ7R9oYzVuc5-y74Ov06M0dk0w@mail.gmail.com>
Subject: Re: [PATCH] clk: qcom: lpass-sc7180: Clean up on error in lpass_sc7180_init()
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-clk <linux-clk@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

On Fri, Nov 13, 2020 at 2:14 AM Dan Carpenter <dan.carpenter@oracle.com> wrote:
>
> Clean up the first driver if the second driver can't be registered.
>
> Fixes: 4ee9fe3e292b ("clk: qcom: lpass-sc7180: Disentangle the two clock devices")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> ---
>  drivers/clk/qcom/lpasscorecc-sc7180.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/clk/qcom/lpasscorecc-sc7180.c b/drivers/clk/qcom/lpasscorecc-sc7180.c
> index 1a3925badd7c..9081649f476f 100644
> --- a/drivers/clk/qcom/lpasscorecc-sc7180.c
> +++ b/drivers/clk/qcom/lpasscorecc-sc7180.c
> @@ -491,7 +491,13 @@ static int __init lpass_sc7180_init(void)
>         if (ret)
>                 return ret;
>
> -       return platform_driver_register(&lpass_hm_sc7180_driver);
> +       ret = platform_driver_register(&lpass_hm_sc7180_driver);
> +       if (ret) {
> +               platform_driver_unregister(&lpass_core_cc_sc7180_driver);
> +               return ret;
> +       }
> +
> +       return 0;

Reviewed-by: Douglas Anderson <dianders@chromium.org>
