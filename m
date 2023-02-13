Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED519C636CC
	for <linux-clk@archiver.kernel.org>; Mon, 13 Feb 2023 07:42:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229850AbjBMHmG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Feb 2023 02:42:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38760 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229677AbjBMHmF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Feb 2023 02:42:05 -0500
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89693E3AD
        for <linux-clk@vger.kernel.org>; Sun, 12 Feb 2023 23:42:01 -0800 (PST)
Received: by mail-wr1-x432.google.com with SMTP id m14so11095545wrg.13
        for <linux-clk@vger.kernel.org>; Sun, 12 Feb 2023 23:42:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=rkcICsNhEU3d9tXzff/t2x809VmrN16PslQXHTNnYGM=;
        b=CWGBkVYaqwkHpd/Gy5btELcuJ8o3jHeujUhaFF8inQ8Jo78q2hU2jWPvxLuJEZFuUc
         9qqMrWvRL1g3dH63M2XaTXzXG5Cr2EYuryEU/e1Jkgprv1zydTaMnqFa6JBsh62KYKbN
         phjEaQU5G9g/qEmyJs08kOG8LR0L4xXe0Y3LT5E+0QK8Ko5EG300QFfUUZsakSpaGkdW
         JwtaPYHUuM5BHcStEb1Sysq4BTWXlregVT1cc7amd9IpdrPeOrhzj4p+XxA/39AFLmOf
         s4NZimpBErK4m1iisdwwLvFoc1X7BdWJJU+1sAtATBg0LFkGtmozDUK0IJ6mvCAo+UWO
         dNkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rkcICsNhEU3d9tXzff/t2x809VmrN16PslQXHTNnYGM=;
        b=lSeTtJxDF84VQ+qZXLSrNLCFvM1/yDcvN/TBooMCSQCOAW0GesCeL8BpZDuwYOgBZ2
         bmc9V1YGqvUDL6AZGZH+7hg/soj9E6nlTMQx8dX/mKg91aewvFsXyPjhPtNqzef+QhCx
         zQTqaAS0M8utIbDD52a30MLc4MU5oaZoIhYj3Q6ZxN+91ZM46x1Bl38TJTgCvkpNACEY
         7AyZ8+J0HT+Pebu3DBIwpmm/MFxdbqqWuOWomqkFvtV+IKngFMmhiK8jUOBshhTZNjVZ
         MqRTi8WUr6qvtoc+XVYC2/xr4NB6oF0xcox4jHitsp6eH+bzC8YRJPAAkmluB/Wmly8S
         XcnQ==
X-Gm-Message-State: AO0yUKXLiaG4ZuH11pYJ6yE3GNEouhXyWGVDCylklchU4MoeHC49v+Pu
        eGYNMXwnB9vGEf5NytTKMaF/zg==
X-Google-Smtp-Source: AK7set9Parg0elqGoKFE2NlW3nK6McqblFHlJe/YUstOKW6WpXRElM/EaaFyEzr8NUViQtRPLJCTRA==
X-Received: by 2002:a5d:5311:0:b0:2c5:5edb:7068 with SMTP id e17-20020a5d5311000000b002c55edb7068mr414542wrv.60.1676274120183;
        Sun, 12 Feb 2023 23:42:00 -0800 (PST)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id s7-20020a5d5107000000b002c556a4f1casm2728080wrt.42.2023.02.12.23.41.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Feb 2023 23:41:59 -0800 (PST)
Date:   Mon, 13 Feb 2023 09:41:58 +0200
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>,
        LI Qingwu <qing-wu.li@leica-geosystems.com.cn>
Cc:     LI Qingwu <qing-wu.li@leica-geosystems.com.cn>,
        Peng Fan <peng.fan@nxp.com>,
        "abelvesa@kernel.org" <abelvesa@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "linux-imx@nxp.com" <linux-imx@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "18701859600@163.com" <18701859600@163.com>,
        GEO-CHHER-bsp-development 
        <bsp-development.geo@leica-geosystems.com>,
        Marco Felsch <m.felsch@pengutronix.de>
Subject: Re: [PATCH V5 1/1] clk: imx8mp: Alias M7 SRC/DIV to M7 CORE
Message-ID: <Y+npxisKxJaaSrul@linaro.org>
References: <20230111101030.686885-1-Qing-wu.Li@leica-geosystems.com.cn>
 <20230111101030.686885-2-Qing-wu.Li@leica-geosystems.com.cn>
 <Y8VfEfnWwt8+QB1W@linaro.org>
 <a1285cb87151130de782fc1941b13f34.sboyd@kernel.org>
 <Y9VruNgUuA5h3d70@linaro.org>
 <AS8PR06MB74325B5E249EC287F052518BD7D39@AS8PR06MB7432.eurprd06.prod.outlook.com>
 <911ff831eaa686c87682d8e95e90326c.sboyd@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <911ff831eaa686c87682d8e95e90326c.sboyd@kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23-01-30 14:34:30, Stephen Boyd wrote:
> Quoting LI Qingwu (2023-01-29 23:44:22)
> > 
> > > > Is it needed for clk-fixes? When did the system start hanging?
> > > 
> > > Li, Peng, can you provide some details here?
> > 
> > Since IMX8MP_CLK_M7_SRC and IMX8MP_CLK_M7_DIV were not assigned,
> > if using any one of them in device tree, Linux system hanging after start M7 core.
> 
>  $ git grep -e IMX8MP_CLK_M7_SRC -o -e IMX8MP_CLK_M7_DIV
>  include/dt-bindings/clock/imx8mp-clock.h:IMX8MP_CLK_M7_SRC
>  include/dt-bindings/clock/imx8mp-clock.h:IMX8MP_CLK_M7_DIV
> 
> so we're OK to let Abel apply this?

Replying here as the CC emails in Li's next-in-thread email are all messed up and
the reply I sent there bounced back.

As Stephen pointed out, in upstream, there is no current user for those
two clock IDs. So I suppose we can keep the Fixes tag, but currently,
on upstream, there is no chance a consumer could hang as there is no
consumer yet for these clocks.

Stephen, I'll add this to my 6.4 material, again, since there is no
actual comsumer yet, if that's OK with you.

