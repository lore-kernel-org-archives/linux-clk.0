Return-Path: <SRS0=NuDk=PZ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,USER_AGENT_MUTT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CD6CC43444
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jan 2019 06:26:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F179F205C9
	for <linux-clk@archiver.kernel.org>; Thu, 17 Jan 2019 06:26:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="WwjJnC/V"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730154AbfAQG0N (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 17 Jan 2019 01:26:13 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:41189 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730025AbfAQG0N (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 17 Jan 2019 01:26:13 -0500
Received: by mail-pg1-f195.google.com with SMTP id m1so3962057pgq.8
        for <linux-clk@vger.kernel.org>; Wed, 16 Jan 2019 22:26:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=b6oO4hJkrokTcoyK5DzVWM2dwkV29FZtWLlVvwJwlU0=;
        b=WwjJnC/VD2ffmy1KuOcgUPjpS1m4sX2+Oe0ygvF+4Exsd86SYih8UqvNisckxbtqdX
         NuLgMv4GAZgL8Eoqtejn0cs3dggqLfLVfcx2q/C97QFua1OfNZF5rtHdwm+3lp/pLjHP
         f0AAydrkxqcVnVoqHNpOAgcSm4ErWbDD5kbj8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=b6oO4hJkrokTcoyK5DzVWM2dwkV29FZtWLlVvwJwlU0=;
        b=G9pVlhDujyZbcEzX3KaULpvy/m0LjQ73WQAw+GBXaCC6nqHpqLUdkNaN8JIejcP8S3
         5W4XAteMud3dxBwxigPQINBr4pWeVfvijjZZUkkthncPn86ebHwDgV7XxonDMfIgokHq
         Zm3t94WxPut3hyidDaLNvwCMMcYVhQlKsTi83WJ+lFHWyl5l5jdKFDSCXC2WmGQ86mpB
         ULy6NioDBUU2TQ9/Ad6ifYswQNJLu4gWAR+yy8aXBP0dQzaiDaRomsnyhj1Ixcbc+iG4
         nO24Xc1+dexARIy/ZEvZPwJE2RdEmuSj4V2gqBxzAnKOIMQlJksp03R+EKLxF9QDKK/D
         p3Pg==
X-Gm-Message-State: AJcUukeRrnDmJBwMzMY5laDpixVCK3BJ3KLds5TENyB/XHVw+aWhqnDb
        id+jgW7oMYg/Udf5Oa7CHy1hHw==
X-Google-Smtp-Source: ALg8bN4o6v2C4wRkw9EJ8UWK1ReUBkRAibfXPLX+4mL7IPo64cLU1BMxGKk/QVkH+yqrBe6pkNbWCQ==
X-Received: by 2002:a63:7306:: with SMTP id o6mr12096593pgc.343.1547706372118;
        Wed, 16 Jan 2019 22:26:12 -0800 (PST)
Received: from builder (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id d69sm1178833pfg.168.2019.01.16.22.26.10
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 16 Jan 2019 22:26:11 -0800 (PST)
Date:   Wed, 16 Jan 2019 22:25:31 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc:     robh+dt@kernel.org, mark.rutland@arm.com, andy.gross@linaro.org,
        david.brown@linaro.org, sboyd@kernel.org, will.deacon@arm.com,
        mturquette@baylibre.com, jassisinghbrar@gmail.com,
        vkoul@kernel.org, niklas.cassel@linaro.org, sibis@codeaurora.org,
        georgi.djakov@linaro.org, arnd@arndb.de,
        horms+renesas@verge.net.au, heiko@sntech.de,
        enric.balletbo@collabora.com, jagan@amarulasolutions.com,
        olof@lixom.net, amit.kucheria@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH 02/13] mbox: qcom: add APCS child device for QCS404
Message-ID: <20190117062531.GA25498@builder>
References: <1545039990-19984-1-git-send-email-jorge.ramirez-ortiz@linaro.org>
 <1545039990-19984-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1545039990-19984-3-git-send-email-jorge.ramirez-ortiz@linaro.org>
User-Agent: Mutt/1.10.0 (2018-05-17)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon 17 Dec 01:46 PST 2018, Jorge Ramirez-Ortiz wrote:

> There is clock controller functionality in the APCS hardware block of
> qcs404 devices similar to msm8916.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> ---
>  drivers/mailbox/qcom-apcs-ipc-mailbox.c | 21 +++++++++++++--------
>  1 file changed, 13 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> index aed23ac..dc8fdab1 100644
> --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> @@ -97,16 +97,21 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
>  		return ret;
>  	}
>  
> -	if (of_device_is_compatible(np, "qcom,msm8916-apcs-kpss-global")) {
> -		apcs->clk = platform_device_register_data(&pdev->dev,
> -							  "qcom-apcs-msm8916-clk",
> -							  -1, NULL, 0);
> -		if (IS_ERR(apcs->clk))
> -			dev_err(&pdev->dev, "failed to register APCS clk\n");
> -	}
> -
>  	platform_set_drvdata(pdev, apcs);
>  
> +	if (of_device_is_compatible(np, "qcom,msm8916-apcs-kpss-global") ||
> +	    of_device_is_compatible(np, "qcom,qcs404-apcs-apps-global"))
> +		goto register_clk;
> +
> +	return 0;
> +
> +register_clk:
> +	apcs->clk = platform_device_register_data(&pdev->dev,
> +						  "qcom-apcs-msm8916-clk",
> +						  -1, NULL, 0);
> +	if (IS_ERR(apcs->clk))
> +		dev_err(&pdev->dev, "failed to register APCS clk\n");
> +
>  	return 0;
>  }
>  
> -- 
> 2.7.4
> 
