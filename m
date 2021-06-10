Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AF2FC47094
	for <linux-clk@archiver.kernel.org>; Thu, 10 Jun 2021 14:35:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F968613E9
	for <linux-clk@archiver.kernel.org>; Thu, 10 Jun 2021 14:35:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231417AbhFJOg4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 10 Jun 2021 10:36:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47104 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230458AbhFJOg4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 10 Jun 2021 10:36:56 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1CF19C061574
        for <linux-clk@vger.kernel.org>; Thu, 10 Jun 2021 07:35:00 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id e1so1117757plh.8
        for <linux-clk@vger.kernel.org>; Thu, 10 Jun 2021 07:35:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=oyVrFSGAL08XcdlFRxTSklLBcj59OiHskRNYyLrSzHI=;
        b=IYdWGjr7YsprNy0kFSPHQp45XjPXYP9w1MjsSZnyDJ/QqgCHI5PZ1g4Czgp8/tJNOq
         TsrqukcnZr1Gu6bQPqsqYdbg8XO66Jd9PDiZq2cTJ2RsL5StT2NZMFxfrUyfaFSZjhmG
         mzDGPDqNjBK5JrWQaoSAwlM3tPcCQJPKRaPtj7faLOm9Iw1332YBtKCl4F8NQ8ZaS3Pz
         A60rGBXGHC4i8NMtQ+IjIT/ztt8uMZXtN387TZYu5B34ckqTE3qa0fKRPNF/hrAEgimq
         C6gFHeiOKl2dFdIInnUGLGPgQER4rQLaZy4BUHcJ1W2L/hguSlupFIG3WAie9MUc8Lw7
         2bdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=oyVrFSGAL08XcdlFRxTSklLBcj59OiHskRNYyLrSzHI=;
        b=GUj0s2n43t+fGzc7qfq3vpPUQpSFRDAUBXtrsfUlVKc5Pc+dSHmjjyqUAFBJkYMcl7
         TIDt9kptWxBWqPiKNecpL+w18tNQbpHB5CS4ubjh4NMNuniJvK8tNYNPwWZo/lH/Dd4o
         O+IRCG6brVCn3YEIrksrOivMRN1yFehLW+vkFgjj1suTI8+kTIgK99d2Da+9EVITKiNH
         uok+SNmOa14rV4RZasduBKNxGQsBz6DEVlIWrhSWkPwuto+GObDGOwOU0yu6Cqb6OMlQ
         s9kZ+KBeCRXQBhj0qrFYuYDCrDN/msjHLkKmO1cY7Qy2KGEYzezXKX+kQ7aMTxgIz/1f
         nEMg==
X-Gm-Message-State: AOAM53209j+0zB7GABP1s/HbsXGNPUpZ2vnHHgA6oEGcoFbfNu6yEeAI
        Pk5F4jlZnxm9rCOpgVPYJUOi
X-Google-Smtp-Source: ABdhPJzKI+jvaJVvJEwfwIekR4AVEZldcSpdOKNVfGi25TP+AmnN7uPnu1m/tzX0u7skxjpZL4Gtow==
X-Received: by 2002:a17:90a:1541:: with SMTP id y1mr3680576pja.74.1623335699620;
        Thu, 10 Jun 2021 07:34:59 -0700 (PDT)
Received: from thinkpad ([2409:4072:6d9e:80ad:d341:9a16:2c5c:2249])
        by smtp.gmail.com with ESMTPSA id j12sm2481637pfj.60.2021.06.10.07.34.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Jun 2021 07:34:59 -0700 (PDT)
Date:   Thu, 10 Jun 2021 20:04:51 +0530
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Andreas =?iso-8859-1?Q?F=E4rber?= <afaerber@suse.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Edgar Bernardi Righi <edgar.righi@lsitec.org.br>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-actions@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>
Subject: Re: [PATCH v2 5/6] dt-bindings: clock: Add NIC and ETHERNET bindings
 for Actions S500 SoC
Message-ID: <20210610143451.GD315240@thinkpad>
References: <cover.1622119892.git.cristian.ciocaltea@gmail.com>
 <b76ceb8849370943e675e5ea1a34a25cb513faec.1622119892.git.cristian.ciocaltea@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <b76ceb8849370943e675e5ea1a34a25cb513faec.1622119892.git.cristian.ciocaltea@gmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, May 27, 2021 at 04:16:43PM +0300, Cristian Ciocaltea wrote:
> Add the missing NIC and ETHERNET clock bindings constants for Actions
> Semi Owl S500 SoC.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@gmail.com>
> Acked-by: Rob Herring <robh@kernel.org>

Reviewed-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>

Thanks,
Mani

> ---
> Changes in v2:
>  - Added Acked-by from Rob
> 
>  include/dt-bindings/clock/actions,s500-cmu.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/include/dt-bindings/clock/actions,s500-cmu.h b/include/dt-bindings/clock/actions,s500-cmu.h
> index a250a52a6192..a237eb26accb 100644
> --- a/include/dt-bindings/clock/actions,s500-cmu.h
> +++ b/include/dt-bindings/clock/actions,s500-cmu.h
> @@ -74,10 +74,12 @@
>  #define CLK_RMII_REF		54
>  #define CLK_GPIO		55
>  
> -/* system clock (part 2) */
> +/* additional clocks */
>  #define CLK_APB			56
>  #define CLK_DMAC		57
> +#define CLK_NIC			58
> +#define CLK_ETHERNET		59
>  
> -#define CLK_NR_CLKS		(CLK_DMAC + 1)
> +#define CLK_NR_CLKS		(CLK_ETHERNET + 1)
>  
>  #endif /* __DT_BINDINGS_CLOCK_S500_CMU_H */
> -- 
> 2.31.1
> 
