Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59412C433EF
	for <linux-clk@archiver.kernel.org>; Mon, 25 Jul 2022 07:24:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232766AbiGYHX7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Jul 2022 03:23:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56270 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232570AbiGYHX4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Jul 2022 03:23:56 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3677B12774
        for <linux-clk@vger.kernel.org>; Mon, 25 Jul 2022 00:23:48 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id h9so14704532wrm.0
        for <linux-clk@vger.kernel.org>; Mon, 25 Jul 2022 00:23:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=QetEzkmBBXj/HOuiTlbMd5kkoGul/UMX9FiZtkQzY38=;
        b=Rd7tGFWCx0xQKhZWnwH9OEYG3o2gtViQ1dGe9wprYcG3Sjw+XWo69SeKMMGPNSHImD
         R4Di2fxv75cI5pLF7G9aq1wlpAipOhgu28O5zH+id4OwH44Ps8rcu1mlfjVHVy5J9Iz4
         1z7gTYDi67EAI1fRlH2KPyTrKY0ZsYa2u13aYGdoPFGZoufsyjmacM8fV3CSVspfoSao
         o7nF1yvIhxuYKqO6RQdPkjBRAGPNHvVRFsYsH2+v7Mcm1dG+125HcYW1Tfimi+4wLbxA
         SZNBneiRAqyZ7IqC5rKo6XnCSwUNb1P8VHRwIfOLT/9Z+PnxhagbHsNG4nC84isXLofI
         QtHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=QetEzkmBBXj/HOuiTlbMd5kkoGul/UMX9FiZtkQzY38=;
        b=q7U9VlXZ9sWlBoJROtMyOoQgsAySESEgkF5uq/XWTCbBqOB0+aatIUOh/+T+7klCU6
         rg/yfhoerWlnsQkfcauTKU0VfvlYoLz4M6eDPop9NfxmrVsxdIYPicl3US65UQK6PoVy
         ubm7R/egEMM5BBVTz48sO3iIlx9RDMHOadic6lhPZTSmvv26uC/TH8HXcVOOGhY5ViQ3
         qToRa9ObA2gim9c1oaaRo+rZiXeU8OaS07xLi8HllrQO60nUsqXJbZFxumE4v9XKfwLX
         plVAk51WpalY9p86mVXrbSurHbvZZtHiGGCM4N9TdaIz96rcmnrxFLr3W9xi7sneAF4A
         QpvQ==
X-Gm-Message-State: AJIora9irHELw58PJLWmM/gKxMmcWG5xoJoyF/pThxyBUgEBdK/cHvOt
        xKZOSvHdJJrN6+Tuov8XrnqHHQ==
X-Google-Smtp-Source: AGRyM1uU+sGv98lNFHgNqjbocZUmrFN6gV5e3mOKlYyLZ3736xfrgnfzygF8oN3WenDK55fOUMmopg==
X-Received: by 2002:adf:f7c7:0:b0:21e:4aab:1641 with SMTP id a7-20020adff7c7000000b0021e4aab1641mr6604291wrq.166.1658733826674;
        Mon, 25 Jul 2022 00:23:46 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id e10-20020adfe7ca000000b0021dbaa4f38dsm13356483wrn.18.2022.07.25.00.23.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Jul 2022 00:23:46 -0700 (PDT)
Date:   Mon, 25 Jul 2022 10:23:44 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     XU pengfei <xupengfei@nfschina.com>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        konrad.dybcio@somainline.org, mturquette@baylibre.com,
        sboyd@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Kernel@nfschina.com
Subject: Re: [PATCH 1/1] clk/qcom/drivers/sm6350: qcom_cc_really_probe(pdev,
 &gcc_sm6350_desc, regmap) is assigned an extra semicolon
Message-ID: <Yt5FAJiEv0WWuDNV@linaro.org>
References: <20220725021623.3910-1-xupengfei@nfschina.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220725021623.3910-1-xupengfei@nfschina.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-07-25 10:16:23, XU pengfei wrote:
> I think this semicolon could be deleted.
>
> Signed-off-by: XU pengfei <xupengfei@nfschina.com>

Thank you for your patch, but there are a few things you should change.

First of, the subject line should be something like:

clk: qcom: gcc-sm6350: Remove unnecessary semicolon

Then, your commit message should say what it does.
Maybe something like:

Remove unnecessary semicolon after qcom_cc_really_probe call.

Also, there is a document that describes everthing about submitting
patches. See Documentation/process/submitting-patches.rst.

> ---
>  drivers/clk/qcom/gcc-sm6350.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/clk/qcom/gcc-sm6350.c b/drivers/clk/qcom/gcc-sm6350.c
> index a4f7fba70393..69412400efa4 100644
> --- a/drivers/clk/qcom/gcc-sm6350.c
> +++ b/drivers/clk/qcom/gcc-sm6350.c
> @@ -2558,7 +2558,7 @@ static int gcc_sm6350_probe(struct platform_device *pdev)
>  	if (ret)
>  		return ret;
>
> -	return qcom_cc_really_probe(pdev, &gcc_sm6350_desc, regmap);;
> +	return qcom_cc_really_probe(pdev, &gcc_sm6350_desc, regmap);
>  }
>
>  static struct platform_driver gcc_sm6350_driver = {
> --
> 2.18.2
>
