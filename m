Return-Path: <SRS0=Aryr=VI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E745C74A56
	for <linux-clk@archiver.kernel.org>; Thu, 11 Jul 2019 14:36:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5527F21019
	for <linux-clk@archiver.kernel.org>; Thu, 11 Jul 2019 14:36:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="cBiNl8tr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728638AbfGKOgN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Jul 2019 10:36:13 -0400
Received: from mail-pf1-f195.google.com ([209.85.210.195]:34098 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728505AbfGKOgN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Jul 2019 10:36:13 -0400
Received: by mail-pf1-f195.google.com with SMTP id b13so2866685pfo.1
        for <linux-clk@vger.kernel.org>; Thu, 11 Jul 2019 07:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=NI8ueteaj89rqZ5qyru0FAVjhgBE62EIuzbdLtCxeKE=;
        b=cBiNl8trXGosCTmFvIf1MABw+fY+EVySwYoqRsdJ4JVY5BGj8y3q9IhczgvhEaXDHL
         F0s+sTFh7UoajjJlMFq+/NDjewYjvgjpX5y4wMmqN91q4GbArNbdy9an8ETi6mpZHBzH
         9jF0+pekIj16fRZ6vivsubJDhz+CI4ksAG6FlrkvGGSS7pNGxVzmiztes70DheBRpAzg
         9xYLylJoHtRRqDszezdpDtwds9HSQh8WHR4a6nOYIMy6cWqFTGvCKlvxo8ddAN4sQymO
         rhwmaCzc9yw8FFwrjSHvcYPXMegGC5MlBW3Api+uWcS+KuSjaoIawHY8wN82biItP3Gg
         yvHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NI8ueteaj89rqZ5qyru0FAVjhgBE62EIuzbdLtCxeKE=;
        b=rehBBQ9PU7QdEoZxyeDeRK6NYNOgQw1+NIWRIOzCfK6HYy+9N4UMsHEb+enRXiL0Px
         GLkSg4IwkRYBEL38vlf3YbFQNhTOKKsgfVEnfBMjz7NPEJN09JkOs55l227URaNo0vxp
         OKRZKL+C7vbq8TqUZPzNVlPniqvEWCCTmMnVSBi3wZ4dynzoC8nVgf6+Rl0bV3huWB0V
         +xc4Knd9+RBcjzRqffv0QHuFgWWpF1ar9tapbv4zdEnsgL7fLRaJ5uYZoNr44gNbXLb1
         LRoMKm0E9zrfj6oRc+DLCkUgxYKh3aV1lIzS1B6mG5sT6CH4MB26hAI7kDzr7IXCqnUN
         jxJA==
X-Gm-Message-State: APjAAAUXc1ZH2pUvxI4V8s94oN0QzhAHz3ywBG/+PXPiF6s8Cn9fJaTC
        X2ZRDncQQtCqHnWrbFZJxsSOJQ==
X-Google-Smtp-Source: APXvYqz82P7lOd6wmnkvJ/9R8IhUwO4X1ef7XuOJL659cKsBmpHcSpp10bqgBCy6pMqMFsQQfs7M+A==
X-Received: by 2002:a63:3f48:: with SMTP id m69mr4684981pga.17.1562855772275;
        Thu, 11 Jul 2019 07:36:12 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id g1sm14756235pgg.27.2019.07.11.07.36.10
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 11 Jul 2019 07:36:11 -0700 (PDT)
Date:   Thu, 11 Jul 2019 07:37:21 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
Cc:     sboyd@kernel.org, david.brown@linaro.org, jassisinghbrar@gmail.com,
        mark.rutland@arm.com, mturquette@baylibre.com, robh+dt@kernel.org,
        will.deacon@arm.com, arnd@arndb.de, horms+renesas@verge.net.au,
        heiko@sntech.de, sibis@codeaurora.org,
        enric.balletbo@collabora.com, jagan@amarulasolutions.com,
        olof@lixom.net, vkoul@kernel.org, niklas.cassel@linaro.org,
        georgi.djakov@linaro.org, amit.kucheria@linaro.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, khasim.mohammed@linaro.org
Subject: Re: [PATCH v3 03/14] mbox: qcom: replace integer with valid macro
Message-ID: <20190711143721.GC7234@tuxbook-pro>
References: <20190625164733.11091-1-jorge.ramirez-ortiz@linaro.org>
 <20190625164733.11091-4-jorge.ramirez-ortiz@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190625164733.11091-4-jorge.ramirez-ortiz@linaro.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue 25 Jun 09:47 PDT 2019, Jorge Ramirez-Ortiz wrote:

> Use the correct macro when registering the platform device.
> 
> Co-developed-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> ---
>  drivers/mailbox/qcom-apcs-ipc-mailbox.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/mailbox/qcom-apcs-ipc-mailbox.c b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> index a05dc3aabac7..c8088e9caf02 100644
> --- a/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> +++ b/drivers/mailbox/qcom-apcs-ipc-mailbox.c
> @@ -97,7 +97,7 @@ static int qcom_apcs_ipc_probe(struct platform_device *pdev)
>  
>  	apcs->clk = platform_device_register_data(&pdev->dev,
>  						  "qcom-apcs-msm8916-clk",
> -						  -1, NULL, 0);
> +						  PLATFORM_DEVID_NONE, NULL, 0);
>  	if (IS_ERR(apcs->clk))
>  		dev_err(&pdev->dev, "failed to register APCS clk\n");
>  
> -- 
> 2.21.0
> 
