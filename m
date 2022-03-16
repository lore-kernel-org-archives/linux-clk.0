Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33433C433FE
	for <linux-clk@archiver.kernel.org>; Wed, 16 Mar 2022 08:33:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349383AbiCPIeU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Mar 2022 04:34:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241869AbiCPIeT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Mar 2022 04:34:19 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37788DE86
        for <linux-clk@vger.kernel.org>; Wed, 16 Mar 2022 01:33:05 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id b19so1801606wrh.11
        for <linux-clk@vger.kernel.org>; Wed, 16 Mar 2022 01:33:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=7BvpZeowevIb87CxIuiNa0pESwSLe00CabXMSsOuMuQ=;
        b=hNeQokt0fmuAA+5vnxHgJBgljGTOBpbtM65phSfAYl3GcefXKZ2lWF3/GmrwSl5d7g
         nmR/rdY6sQiqDcJIc0jnqpmR8Fklbx6b3p0lG5Ov7PshhnB35ACT1Vm61dUF3llSPKPA
         sqVvsm07AjJreYNMZ3+KF3Pf2pjYVhYjexVAw0d9xgWbGG79cQLdjpL49g6laO8E5/to
         VGVphxqgrJ1ANbrmccMKLroLMffIBjWt1/CVPokR+aJuLFehW/+BrwmbsypueQQgoiC3
         jqzrI/my6XIwKyh6koZkAlHQNc5dwqoRNUTfimovO3vnieKdNNhlIWTpugYDm72tJRqb
         QsRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:organization:in-reply-to
         :content-transfer-encoding;
        bh=7BvpZeowevIb87CxIuiNa0pESwSLe00CabXMSsOuMuQ=;
        b=oY2JRYuUuQvc2f/SGji0eB3R3tfIupArBGjWhOJIYr1xlqAoGwondkZtglnXtc/Pk8
         lOVqgyIs1njT/fecTpZdZLlEnABRY9EM4UW7bk14HCotjE0PQsXOaw6fzOBCDPrCmuLe
         0rFZI7nSk/+IwYX5ODK9zZRaS1nR5tqC5TCis9SKq+VnX90Fol+E5+TZFUzurReCp+lO
         nF9n8baKpZSvmx1TalCrUw/kcsqM5HjFBkPk332fqR+LTujXcX/qck4Hy4x2PFBV+QzR
         FJNB/0QUHePKVQj2Fo59/H3t/YvZkDRSrtHIiIb6aPnNi+iLRUjHEbxM/9FU9B4BHNLv
         /tMQ==
X-Gm-Message-State: AOAM531LJYctZL7aLEtIS3V2BC4da06itPomThbcDj/W3PQlvroxBqeT
        YrDdC2n4Yj2ronNRf1NnCrfEjw==
X-Google-Smtp-Source: ABdhPJzJNIEO2OOFb0fLeQNLGAy9/4xQ9pFyGnlANpx+I2SRdPmAxC1H7JIFDloo0UnZCNIeHlKGng==
X-Received: by 2002:a5d:5046:0:b0:1ed:9eac:bade with SMTP id h6-20020a5d5046000000b001ed9eacbademr23412319wrt.697.1647419583692;
        Wed, 16 Mar 2022 01:33:03 -0700 (PDT)
Received: from [192.168.1.10] (i16-les01-ntr-213-44-230-108.sfr.lns.abo.bbox.fr. [213.44.230.108])
        by smtp.gmail.com with ESMTPSA id g1-20020a1c4e01000000b003899c8053e1sm1473580wmh.41.2022.03.16.01.33.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 16 Mar 2022 01:33:03 -0700 (PDT)
Message-ID: <73cca4e1-c427-1fa3-52f6-18c211dd84b7@baylibre.com>
Date:   Wed, 16 Mar 2022 09:33:02 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH v8 08/16] drm/meson: dw-hdmi: Don't open code
 devm_clk_get_enabled()
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Russell King <linux@armlinux.org.uk>,
        David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     linux-clk@vger.kernel.org, kernel@pengutronix.de,
        dri-devel@lists.freedesktop.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org
References: <20220314141643.22184-1-u.kleine-koenig@pengutronix.de>
 <20220314141643.22184-9-u.kleine-koenig@pengutronix.de>
From:   Neil Armstrong <narmstrong@baylibre.com>
Organization: Baylibre
In-Reply-To: <20220314141643.22184-9-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 14/03/2022 15:16, Uwe Kleine-König wrote:
> devm_clk_get_enabled() returns a clock prepared and enabled and already
> registers a devm exit handler to disable (and unprepare) the clock.
> 
> There is slight change in behavior as a failure to enable the clock
> now results in an error message, too. Also the actual error code is added
> to the message.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>
> ---
>   drivers/gpu/drm/meson/meson_dw_hdmi.c | 48 +++++++++------------------
>   1 file changed, 16 insertions(+), 32 deletions(-)
> 
> diff --git a/drivers/gpu/drm/meson/meson_dw_hdmi.c b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> index 5cd2b2ebbbd3..6034e80c5b2e 100644
> --- a/drivers/gpu/drm/meson/meson_dw_hdmi.c
> +++ b/drivers/gpu/drm/meson/meson_dw_hdmi.c
> @@ -670,29 +670,6 @@ static void meson_disable_regulator(void *data)
>   	regulator_disable(data);
>   }
>   
> -static void meson_disable_clk(void *data)
> -{
> -	clk_disable_unprepare(data);
> -}
> -
> -static int meson_enable_clk(struct device *dev, char *name)
> -{
> -	struct clk *clk;
> -	int ret;
> -
> -	clk = devm_clk_get(dev, name);
> -	if (IS_ERR(clk)) {
> -		dev_err(dev, "Unable to get %s pclk\n", name);
> -		return PTR_ERR(clk);
> -	}
> -
> -	ret = clk_prepare_enable(clk);
> -	if (!ret)
> -		ret = devm_add_action_or_reset(dev, meson_disable_clk, clk);
> -
> -	return ret;
> -}
> -
>   static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>   				void *data)
>   {
> @@ -702,6 +679,7 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>   	struct drm_device *drm = data;
>   	struct meson_drm *priv = drm->dev_private;
>   	struct dw_hdmi_plat_data *dw_plat_data;
> +	struct clk *clk;
>   	int irq;
>   	int ret;
>   
> @@ -763,17 +741,23 @@ static int meson_dw_hdmi_bind(struct device *dev, struct device *master,
>   	if (IS_ERR(meson_dw_hdmi->hdmitx))
>   		return PTR_ERR(meson_dw_hdmi->hdmitx);
>   
> -	ret = meson_enable_clk(dev, "isfr");
> -	if (ret)
> -		return ret;
> +	clk = devm_clk_get_enabled(dev, "isfr");
> +	if (IS_ERR(clk)) {
> +		dev_err(dev, "Failed to get enabled isfr pclk (%pe)\n", clk);
> +		return PTR_ERR(clk);
> +	}
>   
> -	ret = meson_enable_clk(dev, "iahb");
> -	if (ret)
> -		return ret;
> +	clk = devm_clk_get_enabled(dev, "iahb");
> +	if (IS_ERR(clk)) {
> +		dev_err(dev, "Failed to get enabled iahb pclk (%pe)\n", clk);
> +		return PTR_ERR(clk);
> +	}
>   
> -	ret = meson_enable_clk(dev, "venci");
> -	if (ret)
> -		return ret;
> +	clk = devm_clk_get_enabled(dev, "venci");
> +	if (IS_ERR(clk)) {
> +		dev_err(dev, "Failed to get enabled venci pclk (%pe)\n", clk);
> +		return PTR_ERR(clk);
> +	}
>   
>   	dw_plat_data->regm = devm_regmap_init(dev, NULL, meson_dw_hdmi,
>   					      &meson_dw_hdmi_regmap_config);

Acked-by: Neil Armstrong <narmstrong@baylibre.com>
