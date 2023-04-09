Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FF91C77B61
	for <linux-clk@archiver.kernel.org>; Sun,  9 Apr 2023 13:46:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbjDINqY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 9 Apr 2023 09:46:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46368 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbjDINqX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 9 Apr 2023 09:46:23 -0400
Received: from mail-ej1-x634.google.com (mail-ej1-x634.google.com [IPv6:2a00:1450:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CA7C43A99
        for <linux-clk@vger.kernel.org>; Sun,  9 Apr 2023 06:46:22 -0700 (PDT)
Received: by mail-ej1-x634.google.com with SMTP id sb12so6840774ejc.11
        for <linux-clk@vger.kernel.org>; Sun, 09 Apr 2023 06:46:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681047981; x=1683639981;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=fv1Htcq000795meXUCt94e3ZQK9pCFAbOsZ+LsTps1o=;
        b=GzZ0Sfy4wKkDs1EgCXEYxzTTBKeM1btI1U2KzPgExEY4H6r2CJj2YX6YMPBG1akYpB
         1EPc3MSCKgQ9CCoCruLnDpk3tJEfwTdf64XerXrMqiv8/ybwdd1zJV4ukk8f9KY9Axzy
         NFDGonSvLxDvJCzteSbKYv99I9Oodr7aSwsFF7yAC7Ehqzl9iH6AfKZJHoIYZawlYKUS
         Y3zUWTH8VCBH2saZ4jbRAMlTl+QEqFS9WGeEeJJS1eLi6JoTnBEHum5M/N97+XHt7WIZ
         3DEO/1HXkUf13VwHF9caxaIKUs7koQN4cBen5OEgqbt04mVKsDsqSUMoAibpjqcj9pyA
         i0qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681047981; x=1683639981;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fv1Htcq000795meXUCt94e3ZQK9pCFAbOsZ+LsTps1o=;
        b=4fJtRtF0jHbVQxQHdMN8EDL762/UXB2LrGOfh/W/XofuIf4lv2KBbSQ9iPi03JBHkG
         r5KyJuBeZo9CJunjV/EJ+MMuxyc6SCywBwFFl8R0XBNxOhKZOp7+jzt8ulDrk2cijjrC
         n1cDSI7WbNMTqoj0wUYs3TPEIpd3IGtjstZWB2msdobRkhXBNh8+r0DPNg07ru34Sjd6
         sOI0sB+Xe7sdML7bgu1maB7pGTtz4Iyj90d9zxfo6VQcj/mmvBOZwmbl4jYISolid7L2
         xWpFHCivP2g3v0DubKWnclYZgEa+di/KD+f+S4JUw+ym6u1QNGcylDxLJHznkXCFVSI7
         +JIA==
X-Gm-Message-State: AAQBX9euHJbsLtz0qXzricCATY9MgX8R2fyAMUJqEQ4jgHAsko0jcQuB
        JLfdQmFlcLyQO4rH14ilTm8tgA==
X-Google-Smtp-Source: AKy350ZI+1T5LtiV9iDPsr8PJ+ruphexg15E+ozh+duVVEi9yDsmhR/OTWpZPwIik/6Pw/KHoX3Neg==
X-Received: by 2002:a17:906:9711:b0:94a:76f6:8e52 with SMTP id k17-20020a170906971100b0094a76f68e52mr1165889ejx.35.1681047981234;
        Sun, 09 Apr 2023 06:46:21 -0700 (PDT)
Received: from linaro.org ([188.25.26.161])
        by smtp.gmail.com with ESMTPSA id mm25-20020a170906cc5900b0093e9fb91837sm4154400ejb.76.2023.04.09.06.46.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 09 Apr 2023 06:46:20 -0700 (PDT)
Date:   Sun, 9 Apr 2023 16:46:19 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc:     abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jacky Bai <ping.bai@nxp.com>, Ye Li <ye.li@nxp.com>,
        Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH V3 4/7] clk: imx: fracn-gppll: Add 300MHz freq support
 for imx9
Message-ID: <ZDLBq3WJOVoFbnV/@linaro.org>
References: <20230403095300.3386988-1-peng.fan@oss.nxp.com>
 <20230403095300.3386988-5-peng.fan@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230403095300.3386988-5-peng.fan@oss.nxp.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23-04-03 17:52:57, Peng Fan (OSS) wrote:
> From: Jacky Bai <ping.bai@nxp.com>
> 
> Add 300MHz frequency config support on i.MX93 PLL.
> 
> Reviewed-by: Ye Li <ye.li@nxp.com>
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>
> Signed-off-by: Peng Fan <peng.fan@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
>  drivers/clk/imx/clk-fracn-gppll.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/clk/imx/clk-fracn-gppll.c b/drivers/clk/imx/clk-fracn-gppll.c
> index e2633ad94640..c54f9999da04 100644
> --- a/drivers/clk/imx/clk-fracn-gppll.c
> +++ b/drivers/clk/imx/clk-fracn-gppll.c
> @@ -85,7 +85,8 @@ static const struct imx_fracn_gppll_rate_table fracn_tbl[] = {
>  	PLL_FRACN_GP(484000000U, 121, 0, 1, 0, 6),
>  	PLL_FRACN_GP(445333333U, 167, 0, 1, 0, 9),
>  	PLL_FRACN_GP(400000000U, 200, 0, 1, 0, 12),
> -	PLL_FRACN_GP(393216000U, 163, 84, 100, 0, 10)
> +	PLL_FRACN_GP(393216000U, 163, 84, 100, 0, 10),
> +	PLL_FRACN_GP(300000000U, 150, 0, 1, 0, 12)
>  };
>  
>  struct imx_fracn_gppll_clk imx_fracn_gppll = {
> -- 
> 2.37.1
> 
