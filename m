Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 00042C433E6
	for <linux-clk@archiver.kernel.org>; Wed, 10 Mar 2021 10:37:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AB7E764FE1
	for <linux-clk@archiver.kernel.org>; Wed, 10 Mar 2021 10:37:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229747AbhCJKg5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 10 Mar 2021 05:36:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37456 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229706AbhCJKgo (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 10 Mar 2021 05:36:44 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D12FAC061762
        for <linux-clk@vger.kernel.org>; Wed, 10 Mar 2021 02:36:42 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id f12so22727904wrx.8
        for <linux-clk@vger.kernel.org>; Wed, 10 Mar 2021 02:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to;
        bh=Jb7ZelfORH1QHJnFWCjShP1okoL5Fzbc3XNjssblVDM=;
        b=Wtl+/BWmYdVQ1eCD7d/+zWRstywW8SSDLChG2No8Nt659lCdvZ1AH6TF9QhRKJfJfJ
         elWDFxQJHuG/54mKawxKkPBWZdKweaH2UfMrGgDmWg5wsIRALmZbsWcI51/06wquWogj
         1ikDFcfaOfCDthMi0nY9erfPIqnIDOMToHoakc2XbndZgaxBgvssewb0ZC/USXxJ+60E
         rv3NyN8XbPueJGxjNsB3vi/SeKJCjFBlc4kOWZsnSjYgIGz8rGjVHlqDiCzQHYFfwxWa
         p7aUw8ynGbHTXaEL8uHwJc/HX1f1Iu+QJJbKzOAI2WmatTLrls4wgrbNcd73tOLQes/f
         yXow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=Jb7ZelfORH1QHJnFWCjShP1okoL5Fzbc3XNjssblVDM=;
        b=sjNCT7D+8vhJMA5QTbP0Ms83Uj1k29gJUkHYbBI2mJrt6FZatOOuHiViYEmEFiABoX
         nHYLodT7Q+3OcxXh88T+y1tz+aSLoPrTkObRne4lav69fg1uKENLLEgLIxh4a7UBbG7v
         bSbnY7/QXK4MgC2j5e8pLuz5q3YJwrm8/M1bmNqBdTFEdqKzoa5u0ZDZw4XgYVFIyquM
         Zrfk6BdCm3SA0bviwz7Z5ltx7JQcKDNatIJcQwtBNMCwOGuCqgTOMMZvSEbz8JhcdX5V
         s+5Z3NtesXjUnwqR+v2nJ9TblNKfmYl78mI/RSrEWz+mFBrVhsHIhuCP8qsGOk+wDD2P
         PgrA==
X-Gm-Message-State: AOAM533cdSpk+LdWvwVuvTyHOEzGPb3ZdxYVgmPJS4P6eN4Nj4yxx1uz
        Xk3EIEhVtToU43i/FHuR51ujCTxUD4Wp7g==
X-Google-Smtp-Source: ABdhPJwWYgVLki6B90CCw0UsfdKlqtXBlodzOFwgFzBQoo1El4DPbwMQZWGcm7Uz/h6ROKgdbsyCkA==
X-Received: by 2002:adf:e482:: with SMTP id i2mr2787952wrm.392.1615372601570;
        Wed, 10 Mar 2021 02:36:41 -0800 (PST)
Received: from dell ([91.110.221.204])
        by smtp.gmail.com with ESMTPSA id u63sm8634794wmg.24.2021.03.10.02.36.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Mar 2021 02:36:41 -0800 (PST)
Date:   Wed, 10 Mar 2021 10:36:39 +0000
From:   Lee Jones <lee.jones@linaro.org>
To:     Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
Cc:     mazziesaccount@gmail.com, linux-kernel@vger.kernel.org,
        linux-power@fi.rohmeurope.com, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH v3 06/15] mfd: Add ROHM BD71815 ID
Message-ID: <20210310103639.GG701493@dell>
References: <cover.1615198094.git.matti.vaittinen@fi.rohmeurope.com>
 <be0e8cd06ed75e799c942e5076ee7b56ad658467.1615198094.git.matti.vaittinen@fi.rohmeurope.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <be0e8cd06ed75e799c942e5076ee7b56ad658467.1615198094.git.matti.vaittinen@fi.rohmeurope.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 08 Mar 2021, Matti Vaittinen wrote:

> Add chip ID for ROHM BD71815 and PMIC so that drivers can identify
> this IC.
> 
> Signed-off-by: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
> Acked-for-MFD-by: Lee Jones <lee.jones@linaro.org>
> ---
>  include/linux/mfd/rohm-generic.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/mfd/rohm-generic.h b/include/linux/mfd/rohm-generic.h
> index 66f673c35303..e5392bcbc098 100644
> --- a/include/linux/mfd/rohm-generic.h
> +++ b/include/linux/mfd/rohm-generic.h
> @@ -14,6 +14,7 @@ enum rohm_chip_type {
>  	ROHM_CHIP_TYPE_BD71828,
>  	ROHM_CHIP_TYPE_BD9571,
>  	ROHM_CHIP_TYPE_BD9574,
> +	ROHM_CHIP_TYPE_BD71815,

Is there a technical reason why these can't be re-ordered?

>  	ROHM_CHIP_TYPE_AMOUNT
>  };
>  

-- 
Lee Jones [李琼斯]
Senior Technical Lead - Developer Services
Linaro.org │ Open source software for Arm SoCs
Follow Linaro: Facebook | Twitter | Blog
