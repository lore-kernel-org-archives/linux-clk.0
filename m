Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57310C433EF
	for <linux-clk@archiver.kernel.org>; Fri, 25 Feb 2022 07:25:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238087AbiBYH0H (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Feb 2022 02:26:07 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236865AbiBYH0F (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Feb 2022 02:26:05 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF13A25317F
        for <linux-clk@vger.kernel.org>; Thu, 24 Feb 2022 23:25:33 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id d187so3979783pfa.10
        for <linux-clk@vger.kernel.org>; Thu, 24 Feb 2022 23:25:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=69Gf58wBq8Dh5eVfCBlMrle4NsrKmADuIFSdP7YDRTM=;
        b=HeUyM6GBC3LnvDkWZI8Y9sGWlt+M3w0qOxargDS/ayD5Xl9zvIa0AYM5xt5cE8eZy9
         xgwaMQ3IzfsIhBTk/vf3UQKYP8m7bQxJyJA8Lwu3swAH8uTx3LZwFIuh0CNRhN4dFhG1
         hxGUaXWs0EwwflcOkQmPFL7R3gRT/ZEcc0Oed1YwrTDJtqpb5CVDQcjQiQlgea8Z5X1I
         7ZIJULHxE78fNfBqi/vQL7h2BZ83lqj29QBwNJcy0gx/ztzI8I37beo4+qSbCJ49pCzJ
         dH/u+yqlhhDN02XIqm6ml6FG0NEmUP4Hxk+QeBxNxXmfnAuTFt9EWoq1Yzqt2qgfiSVg
         ytmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=69Gf58wBq8Dh5eVfCBlMrle4NsrKmADuIFSdP7YDRTM=;
        b=Gawukfzz0ZzsKuRCnRCFcn7iPxY684kXgV42vwjiNCBH2FyqQWCxWLZobylUbQOx8V
         nyjFlbTp7MzKoWluWfm9O8l2/N5iH9z2pYlajb6jsAaCn2p14WTdHYypI9tGCTdr9jII
         4xadyLsOxwJULVv2mZyzVigU1x8kFf9za9UIU8KeufXHa1y3ZYlgZv3i4RwndwFrQ2i1
         k8iUfK7D7m0B0hxGPL1QCbBW40V7vjtHstCYE2m8g64zuzFSiB+Mt9FZFohF/8DRKTjI
         9wBO7rtK2AYqKdNNFx+HwNeoGFJyO1fxQiBdeOMQ24VDCXvZ8QnzhUK/sKzciGmsAId6
         Wmtg==
X-Gm-Message-State: AOAM531JNu9wuyuvkvFDJgkeUdXLoZbt5Hwmxir/ks4Cptnvd57rNpWG
        eHVcgHHERltweeufhC6N2NkH
X-Google-Smtp-Source: ABdhPJzZQ6FY+KsBp8kvwfgEP4p390Va71pEf3cz8HAhmjyLk7qZ++KEF44vyE2iv5QmQgfFK+1X0A==
X-Received: by 2002:a63:d443:0:b0:364:51b7:c398 with SMTP id i3-20020a63d443000000b0036451b7c398mr5155662pgj.511.1645773933286;
        Thu, 24 Feb 2022 23:25:33 -0800 (PST)
Received: from thinkpad ([220.158.159.240])
        by smtp.gmail.com with ESMTPSA id l13-20020a056a00140d00b004e13da93eaasm2065900pfu.62.2022.02.24.23.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Feb 2022 23:25:32 -0800 (PST)
Date:   Fri, 25 Feb 2022 12:55:27 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Rohit Agarwal <quic_rohiagar@quicinc.com>
Cc:     bjorn.andersson@linaro.org, agross@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/5] dt-bindings: clock: Add A7 PLL binding for SDX65
Message-ID: <20220225072527.GA274289@thinkpad>
References: <1645505785-2271-1-git-send-email-quic_rohiagar@quicinc.com>
 <1645505785-2271-2-git-send-email-quic_rohiagar@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1645505785-2271-2-git-send-email-quic_rohiagar@quicinc.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Feb 22, 2022 at 10:26:21AM +0530, Rohit Agarwal wrote:
> Add information for Cortex A7 PLL clock in Qualcomm
> platform SDX65.
> 
> Signed-off-by: Rohit Agarwal <quic_rohiagar@quicinc.com>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
>  Documentation/devicetree/bindings/clock/qcom,a7pll.yaml | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/qcom,a7pll.yaml b/Documentation/devicetree/bindings/clock/qcom,a7pll.yaml
> index 8666e99..0e96f69 100644
> --- a/Documentation/devicetree/bindings/clock/qcom,a7pll.yaml
> +++ b/Documentation/devicetree/bindings/clock/qcom,a7pll.yaml
> @@ -10,7 +10,7 @@ maintainers:
>    - Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
>  
>  description:
> -  The A7 PLL on the Qualcomm platforms like SDX55 is used to provide high
> +  The A7 PLL on the Qualcomm platforms like SDX55, SDX65 is used to provide high
>    frequency clock to the CPU.
>  
>  properties:
> -- 
> 2.7.4
> 
