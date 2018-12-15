Return-Path: <SRS0=SShM=OY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4492C43387
	for <linux-clk@archiver.kernel.org>; Sat, 15 Dec 2018 17:57:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7AC3B206C2
	for <linux-clk@archiver.kernel.org>; Sat, 15 Dec 2018 17:57:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="a3AwqeRN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727168AbeLOR5C (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 15 Dec 2018 12:57:02 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:43634 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726683AbeLOR5B (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 15 Dec 2018 12:57:01 -0500
Received: by mail-pg1-f195.google.com with SMTP id v28so4157483pgk.10
        for <linux-clk@vger.kernel.org>; Sat, 15 Dec 2018 09:57:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Fx1CH20AmmDE/WMJbPFicOqyuTVcQUOrj8oVcYT7KzQ=;
        b=a3AwqeRNM49CfA5BxsVd5NneDnguBzxT8XlH6VD67UiV1mGP14DRgQ7uhE+nQ7rj4G
         bOjWwyLou9Q7B7LjKg+COXKx8ELI8xT313R6J+EKzXfyhhS2jO9ZzT7u7JJ7WqlS969E
         /4BxG511/8HO9DwVxj/43aa1Zw5EW3xzU8Nw0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Fx1CH20AmmDE/WMJbPFicOqyuTVcQUOrj8oVcYT7KzQ=;
        b=qICKuGCN4vFPZWC3vYSVR3EJaTDYmJ6kwfZO3/Rq2OtQIcjkDd7Ty7HUwj3NrW5neE
         s3JpNXku/baF6u4VSCAJd8Qt4ViC0UKLP/mkgvb1QI8QXfn0Tvd6uLQu3CpwLiNq+uHg
         mEkL+4sZktDzo9N29llsWxglgRT+bdtix/KFQaUlU5pSP79gwPG6NYG9rqn/iT7wAs/j
         8IF4fBmL64r4elBkQKt8LVgiV9wyRkTq+RgDT0J36NiuDUeFCn1ogp69fZWQR6ZNft32
         Bk2myh1rn/4IG2DVeOJyNiIZjpltmlqliB1hy5NljmtuxXlKXzM67Dj/Fpddz13oyHy/
         JSFQ==
X-Gm-Message-State: AA+aEWb1f6hSAmomFV8ovK3lOpNfGxjb9QS0J8gabl76Ru5fM3uMPOe5
        ZphUzKwFxXkyq2s1zJWJBb0Ivd20WXk=
X-Google-Smtp-Source: AFSGD/V1R0Xq2BGkK3qZZSlydIAEF8uHkoqzdzB89vu9L5H3RLXV9277SD2zjk/tbkJCcWKcDChCNw==
X-Received: by 2002:a65:65c9:: with SMTP id y9mr6965882pgv.438.1544896620870;
        Sat, 15 Dec 2018 09:57:00 -0800 (PST)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id w128sm11096727pfw.79.2018.12.15.09.56.59
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sat, 15 Dec 2018 09:56:59 -0800 (PST)
Date:   Sat, 15 Dec 2018 09:56:57 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Govind Singh <govinds@codeaurora.org>
Cc:     linux-remoteproc@vger.kernel.org, sboyd@kernel.org,
        linux-clk@vger.kernel.org, sricharan@codeaurora.org,
        sibis@codeaurora.org, linux-arm-msm@vger.kernel.org,
        andy.gross@linaro.org, david.brown@linaro.org,
        linux-soc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 4/7] clk: qcom: Add WCSS gcc clock control for QCS404
Message-ID: <20181215175657.GB12886@minitux>
References: <20181215103557.2748-1-govinds@codeaurora.org>
 <20181215103557.2748-5-govinds@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181215103557.2748-5-govinds@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat 15 Dec 02:35 PST 2018, Govind Singh wrote:
> diff --git a/drivers/clk/qcom/gcc-qcs404.c b/drivers/clk/qcom/gcc-qcs404.c
[..]
> @@ -2726,6 +2770,11 @@ static int gcc_qcs404_probe(struct platform_device *pdev)
>  			return ret;
>  	}
>  
> +#ifdef CONFIG_QCS_WCSSCC_404

We don't do compile time configuration of things like this, expect all
variants of QCS404 (regardless of security solution) to run off the same
kernel binary.

Instead use the recently introduced "protected-clocks" property.

Regards,
Bjorn
