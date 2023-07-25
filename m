Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2EE4DC0015E
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jul 2023 07:40:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232677AbjGYHkQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jul 2023 03:40:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232684AbjGYHkB (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Jul 2023 03:40:01 -0400
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9923F46B3
        for <linux-clk@vger.kernel.org>; Tue, 25 Jul 2023 00:38:28 -0700 (PDT)
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-3fd0f000f1cso33083545e9.1
        for <linux-clk@vger.kernel.org>; Tue, 25 Jul 2023 00:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1690270699; x=1690875499;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=VxsCzm5RQIamWdmro27uzpmZ8ZKj+Vx+dNKcKbhIWm4=;
        b=VNJN+YRzIQwAxkO8ldTOQbeO/eKcNHQlB34EjQRnnSp8YCmuvpx8tQwIpE1RCbUmSK
         0OeYzQzUoez35eBdk7PkrRHE3PmqtFjjm3GPgB3x8ebANcIcrZGf6P0IbIO4RBlWSxsx
         18Mn3ByqF04IPUAmeJVohrudVXQcP6dGY8204AJLQ+XDt+mUnCMpGUEYvq8Yzhwe/zPj
         3uATH1Kr+CYRgSYXaTlXlq98bZXxBKif/5IY55iuadzEORvZ51sy6nmcjo6QsRaLfYaz
         XZum559pAAlIvSJhaKUi5r8NUZUin/YqOExCfr0nxTE3WE+9o2BAwxCTVViZdfUsdKAo
         iCoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690270699; x=1690875499;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VxsCzm5RQIamWdmro27uzpmZ8ZKj+Vx+dNKcKbhIWm4=;
        b=ImMBNCsUYAMDVRhnsFj4nZsFqZ78vZeIowxLHDVGA0vxQmX9ru8ZQcsMiR5QvGB1ph
         tAj+wjW+Z2ZHUbBKCIJjgyubsFuWCDvmoTsV0V2QoTj2Uq+/ug6Wc+NxVNFoQv6ncPtW
         EiR/XzkSeIUHcCglFQeA+oFL5910i7xPjr/R2uj7ciKYTyMaRYyeviqMJUzPtkCg5EIM
         VaiyybyZUcWxHWedeDIx1HO8uL0Jcxl5vQlW2ZtM9ijkMRXN4/GRHJ/IWzxB8hriCz9Q
         imIwdTdUxXRdjhVmAKhvD/lNoFKwfCjUHEU/UQ5ubbSnMw4TS1Erl2q8frc+aEi40+gY
         z9JQ==
X-Gm-Message-State: ABy/qLY+jS6YVEy16l7oQkTFSjz5DWQgCCCiyivwu4X0a3w21jKc2Pa1
        umk3Y/zoAacwffuelR06Kiuzaw==
X-Google-Smtp-Source: APBJJlHWryPLjXX3GsNyLOK/hhAcGss6uPd3Zou77FJ+aPVeBzYZRLH0IBgEnOVqhcEDjoAAveJZhA==
X-Received: by 2002:a05:600c:224a:b0:3fa:9741:5b73 with SMTP id a10-20020a05600c224a00b003fa97415b73mr1242984wmm.10.1690270699308;
        Tue, 25 Jul 2023 00:38:19 -0700 (PDT)
Received: from linaro.org ([82.78.74.213])
        by smtp.gmail.com with ESMTPSA id j6-20020a05600c1c0600b003fc3b03caa5sm780232wms.1.2023.07.25.00.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 00:38:18 -0700 (PDT)
Date:   Tue, 25 Jul 2023 10:38:17 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Marco Felsch <m.felsch@pengutronix.de>
Cc:     aford173@gmail.com, adrian.alonso@nxp.com,
        rasmus.villemoes@prevas.dk, bli@bang-olufsen.dk, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, s.hauer@pengutronix.de,
        kernel@pengutronix.de, abelvesa@kernel.org
Subject: Re: [PATCH] clk: imx: pll14xx: align pdiv with reference manual
Message-ID: <ZL976QadmcinquUk@linaro.org>
References: <CAHCN7x+fs7k0y8Sps+0N7NUPVto8UhZD9E8DbVEuDRPv6bdDMg@mail.gmail.com>
 <20230714134938.2124861-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230714134938.2124861-1-m.felsch@pengutronix.de>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23-07-14 15:49:38, Marco Felsch wrote:
> The PLL14xx hardware can be found on i.MX8M{M,N,P} SoCs and always come
> with a 6-bit pre-divider. Neither the reference manuals nor the
> datasheets of these SoCs do mention any restrictions. Furthermore the
> current code doesn't respect the restrictions from the comment too.
> 
> Therefore drop the restriction and align the max pre-divider (pdiv)
> value to 63 to get more accurate frequencies.
> 
> Signed-off-by: Marco Felsch <m.felsch@pengutronix.de>

I'm OK with this:

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
> Hi Adam,
> 
> here is the patch I made for setting the exact video-pll settings.
> 
> Regards,
>   Marco
> 
> 
>  drivers/clk/imx/clk-pll14xx.c | 11 +++++------
>  1 file changed, 5 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/clk/imx/clk-pll14xx.c b/drivers/clk/imx/clk-pll14xx.c
> index 7150c59bbfc95..dc6bc21dff41f 100644
> --- a/drivers/clk/imx/clk-pll14xx.c
> +++ b/drivers/clk/imx/clk-pll14xx.c
> @@ -139,11 +139,10 @@ static void imx_pll14xx_calc_settings(struct clk_pll14xx *pll, unsigned long rat
>  	/*
>  	 * Fractional PLL constrains:
>  	 *
> -	 * a) 6MHz <= prate <= 25MHz
> -	 * b) 1 <= p <= 63 (1 <= p <= 4 prate = 24MHz)
> -	 * c) 64 <= m <= 1023
> -	 * d) 0 <= s <= 6
> -	 * e) -32768 <= k <= 32767
> +	 * a) 1 <= p <= 63
> +	 * b) 64 <= m <= 1023
> +	 * c) 0 <= s <= 6
> +	 * d) -32768 <= k <= 32767
>  	 *
>  	 * fvco = (m * 65536 + k) * prate / (p * 65536)
>  	 */
> @@ -186,7 +185,7 @@ static void imx_pll14xx_calc_settings(struct clk_pll14xx *pll, unsigned long rat
>  	}
>  
>  	/* Finally calculate best values */
> -	for (pdiv = 1; pdiv <= 7; pdiv++) {
> +	for (pdiv = 1; pdiv <= 63; pdiv++) {
>  		for (sdiv = 0; sdiv <= 6; sdiv++) {
>  			/* calc mdiv = round(rate * pdiv * 2^sdiv) / prate) */
>  			mdiv = DIV_ROUND_CLOSEST(rate * (pdiv << sdiv), prate);
> -- 
> 2.39.2
> 
