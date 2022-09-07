Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68172C38145
	for <linux-clk@archiver.kernel.org>; Wed,  7 Sep 2022 10:33:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229643AbiIGKdA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 7 Sep 2022 06:33:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229547AbiIGKc7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 7 Sep 2022 06:32:59 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B74A282FBE
        for <linux-clk@vger.kernel.org>; Wed,  7 Sep 2022 03:32:58 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id t14so12378346wrx.8
        for <linux-clk@vger.kernel.org>; Wed, 07 Sep 2022 03:32:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=2ruloj/z3HDay2BKVOinqhlNi8ynnawFv8TyAHfi4aE=;
        b=dZyKHcWPXPMjfQQVb82YQg0g8szO5nzUeoT7amZCpaUh53dl4c7uRXuhm0Rq1iMrjB
         IuTII7EPndQipA8fXtUisPXVsvaKqv/GmO2BV+nppTZW7ShvKyY9YS0i7ozhF1DYZcSk
         FwNnL2X42/NvVkiIZj/dREcbb4WBZ6C4kY30TFCsnVeBnDRPUCBk3IIduMdbnrhuxbje
         sQBFkmtnhB+ZjRhmS8iUZxmRa3aRo3NdJ34J3AlJEt2o4QDtqOBMQ7qR6Ae/sbltCYF4
         3FM50+A0mSmA9rRU8gGKYRh+rZPTvLz4fCyBcNwisI083CdHHtEDYS9MzFuv/2NCX/mF
         OIEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=2ruloj/z3HDay2BKVOinqhlNi8ynnawFv8TyAHfi4aE=;
        b=Gff9IPe/pWuz4jXMXiYlAjI4W7GnK0WgZAzG7D3WRoReE6vppv2DM/QDFbTQqoBz/M
         6VoqtsANDXdC1Z7587mid3zNpxw8Qiu6XTj/zG6hnC5SxIyWh9uKVu2iLchkVYFJI1kH
         t44SaBl+LXjO0DJzAyFI3IvWMFBkUnGKmJy3Bq5eriSjRLyWfDV02QUDmwy4NT1aFHmo
         +dFl0EEFaHF/Cn5+D1+77CSPFOipRLZvt+lt1qthOc+n282hRbY3Cj4lkIrMDZNxFPv3
         kiekT9nIla5aa1muS3yd6dfzfVCaG6UYW8D6kXpPMHjEtOpujwmriE/BqwId5+ts5TFD
         1frg==
X-Gm-Message-State: ACgBeo0EaUL+KPIq1Jysgv6weXIIDD/9hFcO9SK+U51i8paz4gtTy+Fq
        gMsWzg5APhCoMtl5/TOsC2CobQ==
X-Google-Smtp-Source: AA6agR76EAW1iCZg1Y5GR+57LAFTMm7SP2jL98SG0N0sPj/FczolhY5MHi5c9sJ4SR8elSFOgFivuQ==
X-Received: by 2002:a5d:58eb:0:b0:228:62cb:a615 with SMTP id f11-20020a5d58eb000000b0022862cba615mr1721578wrd.71.1662546777302;
        Wed, 07 Sep 2022 03:32:57 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id m9-20020a05600c4f4900b003a84375d0d1sm27308382wmq.44.2022.09.07.03.32.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Sep 2022 03:32:56 -0700 (PDT)
Date:   Wed, 7 Sep 2022 13:32:55 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Li Jun <jun.li@nxp.com>
Cc:     abelvesa@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clocks: imx8mp: Add ID for usb suspend
 clock
Message-ID: <YxhzV5pG6/ZMHZR7@linaro.org>
References: <1661328262-3867-1-git-send-email-jun.li@nxp.com>
 <YxJJ0IQ1Gu1lp02p@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YxJJ0IQ1Gu1lp02p@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-09-02 21:22:08, Abel Vesa wrote:
> On 22-08-24 16:04:21, Li Jun wrote:
> > usb suspend clock has a gate shared with usb_root_clk.
> > 
> > Signed-off-by: Li Jun <jun.li@nxp.com>
> 
> Applied both, thanks!

As discussed in the thread [1], I dropped this patch from my tree for
now. You need to send a new version wil Fixes tag.

[1] https://lore.kernel.org/all/YxhxSdDGXfO%2F%2Fbgc@linaro.org/
> 
> > 
> > diff --git a/include/dt-bindings/clock/imx8mp-clock.h b/include/dt-bindings/clock/imx8mp-clock.h
> > index 9d5cc2ddde89..1417b7b1b7df 100644
> > --- a/include/dt-bindings/clock/imx8mp-clock.h
> > +++ b/include/dt-bindings/clock/imx8mp-clock.h
> > @@ -324,8 +324,9 @@
> >  #define IMX8MP_CLK_CLKOUT2_SEL			317
> >  #define IMX8MP_CLK_CLKOUT2_DIV			318
> >  #define IMX8MP_CLK_CLKOUT2			319
> > +#define IMX8MP_CLK_USB_SUSP			320
> >  
> > -#define IMX8MP_CLK_END				320
> > +#define IMX8MP_CLK_END				321
> >  
> >  #define IMX8MP_CLK_AUDIOMIX_SAI1_IPG		0
> >  #define IMX8MP_CLK_AUDIOMIX_SAI1_MCLK1		1
> > -- 
> > 2.34.1
> > 
