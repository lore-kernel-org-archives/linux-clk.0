Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8550AC54EBD
	for <linux-clk@archiver.kernel.org>; Mon,  9 Jan 2023 11:05:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234365AbjAILFR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Jan 2023 06:05:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237185AbjAILE4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Jan 2023 06:04:56 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com [IPv6:2a00:1450:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 852B2140B4
        for <linux-clk@vger.kernel.org>; Mon,  9 Jan 2023 03:04:55 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id u9so19168388ejo.0
        for <linux-clk@vger.kernel.org>; Mon, 09 Jan 2023 03:04:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tv4unt6g/AUf+t5glAMtGuBCzixTzpJWSEQGM4BGflY=;
        b=VQx2zAlL8kN6uG+7JWYEJoITY9l4pHtMCOnQx8CPY/og4NlmE+j1FYm7qnBALMJSN4
         e+SPSYfTzK+mKzP/0W9y9d580v+9fJx4ylZmmDc9Ak+sjWCIjmWTmJThOIxdW0iVjnPb
         6AbXKo3ebSBdHJszF8W2KkL65tqVZ9Boy7O3qVBNjqwhZevA991TFA/bWzFDkDYE8+s5
         Ug9ognRPLeYX1u9Qdd82CZgu4iFED8K3opd8GmBW6PanaAz+kLQUW8fRYzX55SQUT7Vn
         ITRSfewIzMvY7pUh7zQ/Gjv4JJ1VueMc1ye6ilnDAyPCTZLB5GbqBXQEM5TLi9du+jT+
         SZiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tv4unt6g/AUf+t5glAMtGuBCzixTzpJWSEQGM4BGflY=;
        b=DWw2v0kBbzwi37O0KDFYfWC3yuv4wEAlYj0lpCdMw5hizCJNXhZtXCwM6Q3FK8d+e2
         9LiHnLUYkgFZIb6XPay8JMq5IG/uYf+ZsZUnuHwfiPTn0noYj50FIoEvYon2mTXjQ07W
         PLUM91DGdNobzdnj28VLNWzgxEiUDHf42sdVgcj5vHKkRCyJFj60n33sJ2gvVeXRm8Dz
         68r+4kxVmyrYroAhPcHieCdjzUpmfcWZrPJdaKoUBa8x0cJpd8UVzqrNvANz/QPZmkdw
         l2Sl2LtAhBB9zTTtrLE67EZzTyzmKYnXlMZ/7dA+yOZ6ao7wTKNEaYO3LqIV6UPi4Lew
         N7wg==
X-Gm-Message-State: AFqh2kqS5K+HHczkPbh0rXUcYPa0eLjrVcQ3kjBL+mX3c2E2cYxB3FiH
        3HWEPS7NZDjHIi9Lgyi4vwQBHrqhxEaAzHxk
X-Google-Smtp-Source: AMrXdXv5Toeyv23qi+jF5SyuM7XY19FOEceyiyCUGuFHt8aKOmJpRZUFfHJ6di+BUYbHPfDz1mn29A==
X-Received: by 2002:a17:906:f13:b0:7b2:7a42:3e43 with SMTP id z19-20020a1709060f1300b007b27a423e43mr52579788eji.23.1673262294124;
        Mon, 09 Jan 2023 03:04:54 -0800 (PST)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id o21-20020aa7c7d5000000b0046ac017b007sm3525171eds.18.2023.01.09.03.04.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 03:04:53 -0800 (PST)
Date:   Mon, 9 Jan 2023 13:04:52 +0200
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Jun Li <jun.li@nxp.com>, abelvesa@kernel.org,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "l.stach@pengutronix.de" <l.stach@pengutronix.de>,
        Peng Fan <peng.fan@nxp.com>,
        "alexander.stein@ew.tq-group.com" <alexander.stein@ew.tq-group.com>,
        "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [PATCH v4 2/3] clk: imx: imx8mp: add shared clk gate for usb
 suspend clk
Message-ID: <Y7v01GIfOk3LVkQO@linaro.org>
References: <1664549663-20364-1-git-send-email-jun.li@nxp.com>
 <1664549663-20364-2-git-send-email-jun.li@nxp.com>
 <PA4PR04MB964042A30D09FAF4A5C40227892B9@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <20221027173919.12E23C433C1@smtp.kernel.org>
 <Y7vx4TuxzLwVKy0K@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y7vx4TuxzLwVKy0K@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23-01-09 12:52:17, Abel Vesa wrote:
> On 22-10-27 10:39:16, Stephen Boyd wrote:
> > Quoting Jun Li (2022-10-19 02:26:00)
> > > Hi Stephen,
> > > 
> > > > -----Original Message-----
> > > > From: Jun Li <jun.li@nxp.com>
> > > > Sent: Friday, September 30, 2022 10:54 PM
> > > > To: sboyd@kernel.org; abelvesa@kernel.org
> > > > Cc: robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
> > > > shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
> > > > festevam@gmail.com; dl-linux-imx <linux-imx@nxp.com>;
> > > > mturquette@baylibre.com; l.stach@pengutronix.de; Peng Fan
> > > > <peng.fan@nxp.com>; alexander.stein@ew.tq-group.com;
> > > > gregkh@linuxfoundation.org; devicetree@vger.kernel.org;
> > > > linux-arm-kernel@lists.infradead.org; linux-clk@vger.kernel.org
> > > > Subject: [PATCH v4 2/3] clk: imx: imx8mp: add shared clk gate for usb suspend
> > > > clk
> > > > 
> > > > 32K usb suspend clock gate is shared with usb_root_clk, this shared clock
> > > > gate was initially defined only for usb suspend clock, usb suspend clk is
> > > > kept on while system is active or system sleep with usb wakeup enabled, so
> > > > usb root clock is fine with this situation; with the commit cf7f3f4fa9e5
> > > > ("clk: imx8mp: fix usb_root_clk parent"), this clock gate is changed to be
> > > > for usb root clock, but usb root clock will be off while usb is suspended,
> > > > so usb suspend clock will be gated too, this cause some usb functionalities
> > > > will not work, so define this clock to be a shared clock gate to conform
> > > > with the real HW status.
> > > > 
> > > > Fixes: 9c140d9926761 ("clk: imx: Add support for i.MX8MP clock driver")
> > > > Cc: stable@vger.kernel.org # v5.19+
> > > > Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > > Signed-off-by: Li Jun <jun.li@nxp.com>
> > > 
> > > Is this version okay for you? 
> > > 
> > 
> > I thought that Abel was going to pick these up.
> 
> Oh, sorry, I thought the fixes will be picked up by you.
> 
> I'll apply it to my tree then.

Ugrh, ignore this.

Already applied.

My inbox is messed up a bit right now.

Sorry about that.

