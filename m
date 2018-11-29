Return-Path: <SRS0=q0iC=OI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4502BC43441
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 00:09:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 037B52081C
	for <linux-clk@archiver.kernel.org>; Thu, 29 Nov 2018 00:09:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=linaro.org header.i=@linaro.org header.b="eelre0W6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 037B52081C
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=linaro.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726764AbeK2LNG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Nov 2018 06:13:06 -0500
Received: from mail-pf1-f196.google.com ([209.85.210.196]:46593 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726623AbeK2LNG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Nov 2018 06:13:06 -0500
Received: by mail-pf1-f196.google.com with SMTP id c73so49149pfe.13
        for <linux-clk@vger.kernel.org>; Wed, 28 Nov 2018 16:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Dm5yKDsCCmFghFtH6IsP3qEa/K7VqKLcVFMifvPkMa8=;
        b=eelre0W6Zv+ZBbqaluvJSjLFYvyRxDInTNeIdR2Be2QGEnU5hTwre6DTQTnZx5e9zo
         K//ZEhkmhw0I++w9HZkY8bvyjxOCZo8VRCp6K02B9UJYkzpmd5Jtn/VCfhnjAR5EAekV
         ZKcvXSMbYQUQZamIZ1bbFuhqU+y4BDe/1jdIo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Dm5yKDsCCmFghFtH6IsP3qEa/K7VqKLcVFMifvPkMa8=;
        b=rR/cBlEHsD9wI5dgNnMqSUJgUEX+icTCVAGlHlAqxgjahXkDNsPE1Z3ykDSShVfK6Q
         oBRLTLZ30jolr6FxDWhIkQstkwT+issmemt/0EjwGX52edAzkyUfeRxuyo8sNuMpbuo9
         +Kq0xvdomT3AN0GFNtwW9r7PzSw29YgOnPvbBJUod66DzN71Wi+srs9+zoesf5ahHO5R
         6+7z0wITfKxjJSdGoEpX7JTMU850QGcYYqa9CjgsLFZ1L8GlQU7799NOx3VrQomXD0cQ
         DZwzppEmTLj5VQluV+eZc5bOKDE/OREs17qhaspnE+fFbq7u1aRB55XvtKHG3C07yBbt
         ogYw==
X-Gm-Message-State: AA+aEWbd/yk3F6g3rMrjzj5SAmQFD2ehOGcKDQ3jzjyAZQnhKN7vRz9N
        5wo5Cz1aAIbn6Wx10khdpYQT1Q==
X-Google-Smtp-Source: AFSGD/W5NXzW2CBQObsp5Bkz0wHWdFemIQTjjZpuvna8mMdIMJpta0j2pz0aPa7KeOO99nXVey8VJQ==
X-Received: by 2002:a62:931a:: with SMTP id b26mr34425395pfe.65.1543450181331;
        Wed, 28 Nov 2018 16:09:41 -0800 (PST)
Received: from minitux (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id r66sm97969pfk.157.2018.11.28.16.09.40
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 28 Nov 2018 16:09:40 -0800 (PST)
Date:   Wed, 28 Nov 2018 16:09:38 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Jordan Crouse <jcrouse@codeaurora.org>
Cc:     sboyd@kernel.org, mturquette@baylibre.com, andy.gross@linaro.org,
        david.brown@linaro.org, rnayak@codeaurora.org,
        okukatla@codeaurora.org, tdas@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-soc@vger.kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/2] clk: qcom: gdsc: Don't override existing gdsc pd
 functions
Message-ID: <20181129000938.GH24969@minitux>
References: <20181126165416.32519-1-jcrouse@codeaurora.org>
 <20181126165416.32519-2-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181126165416.32519-2-jcrouse@codeaurora.org>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon 26 Nov 08:54 PST 2018, Jordan Crouse wrote:

> In extreme cases an individual gdsc may wish to override the
> power domain enable or disable callback functions for their own
> purposes. Only set the generic gdsc callback if the function pointers
> are not already set.
> 
> Acked-by: Rajendra Nayak <rnayak@codeaurora.org>

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> Signed-off-by: Jordan Crouse <jcrouse@codeaurora.org>
> ---
>  drivers/clk/qcom/gdsc.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
> index a077133c7ce3..dd63aa36b092 100644
> --- a/drivers/clk/qcom/gdsc.c
> +++ b/drivers/clk/qcom/gdsc.c
> @@ -350,8 +350,10 @@ static int gdsc_init(struct gdsc *sc)
>  	else
>  		gdsc_clear_mem_on(sc);
>  
> -	sc->pd.power_off = gdsc_disable;
> -	sc->pd.power_on = gdsc_enable;
> +	if (!sc->pd.power_off)
> +		sc->pd.power_off = gdsc_disable;
> +	if (!sc->pd.power_on)
> +		sc->pd.power_on = gdsc_enable;
>  	pm_genpd_init(&sc->pd, NULL, !on);
>  
>  	return 0;
> -- 
> 2.18.0
> 
