Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3BB78C5479D
	for <linux-clk@archiver.kernel.org>; Mon,  9 Jan 2023 10:53:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233045AbjAIKwb (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Jan 2023 05:52:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60006 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236231AbjAIKwW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Jan 2023 05:52:22 -0500
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com [IPv6:2a00:1450:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 17F55B49F
        for <linux-clk@vger.kernel.org>; Mon,  9 Jan 2023 02:52:21 -0800 (PST)
Received: by mail-ej1-x62a.google.com with SMTP id ss4so11740767ejb.11
        for <linux-clk@vger.kernel.org>; Mon, 09 Jan 2023 02:52:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=/LJ5qX1H/OsHCtXTS+GhxMpXNyq3lMbowOelfPrgxUQ=;
        b=kmapB8u4A6JvgZJJT8k0ygQTWdxJDz5H8+aPTeyaUrbd5/js+eY/vn+wa9XkOqfLhB
         BhWrZS3Gxu1V0al/tfEzGW+lc3v2fmJ1kpyV+GtjvWgzEWNn3C+BglF4HFwaX3U9nkdz
         rHaf+p07+E8WImv4+wldD32TKVS5tavGrAkPAiuzp4iSkAjP3ZN54fGIuUW9kq5QTZK6
         aP+a48UExf0EJ+zvDJEYuBu7RwMiMUzcJQaM2Waa7J1Lqzff3o63L3fPkcXAFGNovKto
         yYcxGKgYnz6QYpfrplC859RPUcFau3N9uBbFrvGAY+0QMJjSU8YL/euVGtT7IYjd3C7D
         sJ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/LJ5qX1H/OsHCtXTS+GhxMpXNyq3lMbowOelfPrgxUQ=;
        b=Bt4gzW3yjAnhuLJWqc+zgaszS8auyMGJgUA+ieeSm0WDeoPBfY6vbcAwzs2b/fNnf2
         bbjOYGHuKnHuj94FttbFRVXDE7TY2hbDkF0GwxqZIgPMFOZzPiXWWrjH4aM1X8rYECyX
         l463xLthRzJxnKrS+HgM+TK81Pez0Gde9SiVmLVbhaxIHh2meSu7krv2QzdeMWevtuDG
         WMJNFok6p5ui9gAt98d2wsurUWooEsOAHyXgCy4KIvNMW1INEXaOnlQUT6QQCnQ/8LeV
         xTfNMb+XP0HL1df07eDqBw+V5NlRwjGlchAXjwAE1Tn4bkpO8KewI68OO5yLkgOQlBmS
         HHlg==
X-Gm-Message-State: AFqh2kqP2IZJy2xk2u/o/swyDzzL3evC6ZBx1L9GhbWLVjbor3bE7CAS
        HzfahqwTaR0wvy6pnKgxRaRWvQ==
X-Google-Smtp-Source: AMrXdXvuD1E1y0CbxxatR4UenaHvSzJIn3aL1usjTAb96Q8/IV+uiX9xzNJnJ8FmKTWu/xBonchvJQ==
X-Received: by 2002:a17:907:8746:b0:7c1:413d:5b0 with SMTP id qo6-20020a170907874600b007c1413d05b0mr61562637ejc.47.1673261539704;
        Mon, 09 Jan 2023 02:52:19 -0800 (PST)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id og5-20020a1709071dc500b0084d420503a3sm1757332ejc.178.2023.01.09.02.52.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 02:52:19 -0800 (PST)
Date:   Mon, 9 Jan 2023 12:52:17 +0200
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
Message-ID: <Y7vx4TuxzLwVKy0K@linaro.org>
References: <1664549663-20364-1-git-send-email-jun.li@nxp.com>
 <1664549663-20364-2-git-send-email-jun.li@nxp.com>
 <PA4PR04MB964042A30D09FAF4A5C40227892B9@PA4PR04MB9640.eurprd04.prod.outlook.com>
 <20221027173919.12E23C433C1@smtp.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221027173919.12E23C433C1@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-10-27 10:39:16, Stephen Boyd wrote:
> Quoting Jun Li (2022-10-19 02:26:00)
> > Hi Stephen,
> > 
> > > -----Original Message-----
> > > From: Jun Li <jun.li@nxp.com>
> > > Sent: Friday, September 30, 2022 10:54 PM
> > > To: sboyd@kernel.org; abelvesa@kernel.org
> > > Cc: robh+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
> > > shawnguo@kernel.org; s.hauer@pengutronix.de; kernel@pengutronix.de;
> > > festevam@gmail.com; dl-linux-imx <linux-imx@nxp.com>;
> > > mturquette@baylibre.com; l.stach@pengutronix.de; Peng Fan
> > > <peng.fan@nxp.com>; alexander.stein@ew.tq-group.com;
> > > gregkh@linuxfoundation.org; devicetree@vger.kernel.org;
> > > linux-arm-kernel@lists.infradead.org; linux-clk@vger.kernel.org
> > > Subject: [PATCH v4 2/3] clk: imx: imx8mp: add shared clk gate for usb suspend
> > > clk
> > > 
> > > 32K usb suspend clock gate is shared with usb_root_clk, this shared clock
> > > gate was initially defined only for usb suspend clock, usb suspend clk is
> > > kept on while system is active or system sleep with usb wakeup enabled, so
> > > usb root clock is fine with this situation; with the commit cf7f3f4fa9e5
> > > ("clk: imx8mp: fix usb_root_clk parent"), this clock gate is changed to be
> > > for usb root clock, but usb root clock will be off while usb is suspended,
> > > so usb suspend clock will be gated too, this cause some usb functionalities
> > > will not work, so define this clock to be a shared clock gate to conform
> > > with the real HW status.
> > > 
> > > Fixes: 9c140d9926761 ("clk: imx: Add support for i.MX8MP clock driver")
> > > Cc: stable@vger.kernel.org # v5.19+
> > > Tested-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> > > Signed-off-by: Li Jun <jun.li@nxp.com>
> > 
> > Is this version okay for you? 
> > 
> 
> I thought that Abel was going to pick these up.

Oh, sorry, I thought the fixes will be picked up by you.

I'll apply it to my tree then.
