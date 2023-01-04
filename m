Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C33C3C4708E
	for <linux-clk@archiver.kernel.org>; Wed,  4 Jan 2023 16:10:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239738AbjADQKV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 4 Jan 2023 11:10:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239881AbjADQJj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 4 Jan 2023 11:09:39 -0500
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AC8C240851
        for <linux-clk@vger.kernel.org>; Wed,  4 Jan 2023 08:09:19 -0800 (PST)
Received: by mail-ed1-x530.google.com with SMTP id u18so47797358eda.9
        for <linux-clk@vger.kernel.org>; Wed, 04 Jan 2023 08:09:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=7Fdz8ydnkLz5wna1uPMyDPqPnfgZcb47kfpiU1wAhAo=;
        b=GLxN5JXuiOtzMgmWrdYlcn0q2EhxBeBj1Rl8jzjd0XS6VAIeuEbKEWnWpKnCu4FZsi
         /M4yqOkCuBcCOPjewV8qkVtP4lrZJXY37qkXPCp125xA85llOpBibFgovnnHpVgVfCkZ
         UDkOFnE6O6SFEzF3Ov+SbSMj0cf6n2R3GNslY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=7Fdz8ydnkLz5wna1uPMyDPqPnfgZcb47kfpiU1wAhAo=;
        b=BnfW+hZEH+1teo9wg+OvILye40Bn0Ihi+cvV78mjK07S3jmwy3hEh5LTOrW0wRsuwa
         Q5IHbRLfhJQ8HeHxqmInR3dWcQCoIWUQmWPz3nhOvcHxCzJBjUHd94ri75mnAW9sAcKN
         gm+HMTfSQtnaa+XE96BMuoamUIu3X7p6XcSGD6rO+8w86OtWUVOOMaqZNAJ8g7GPpXE2
         eKpcS2P2MowCN14wdTM4g5OiK2q/49XEaG95bE5eJc/NiR9uomdq5fCL/50FjUVVyvYb
         RmIrPay4hx6hUva4Vsq8jcD3ZAvgUG6ohoN3ReR+3vKaZkLk78mBNPEafcClkMcKL70p
         iP6Q==
X-Gm-Message-State: AFqh2krxQtaoIoAFl4wU4h5q8dxvEhEetBt2ivt1yho2ya0Je7H88+ns
        4Gby4DuUNSNgvvZkFgSc5+MHKGcpCydzs1ArH1H+ig==
X-Google-Smtp-Source: AMrXdXsv1xg2M0bhVn1lwVtKy4iXv8iFGb+5mdRNNhgcOA/iAYMeYuCuQaM7J9fZy2xr9HWmpKkA9zSLNNe3G6JTUuY=
X-Received: by 2002:aa7:d35a:0:b0:46c:4b56:8c06 with SMTP id
 m26-20020aa7d35a000000b0046c4b568c06mr4381025edr.230.1672848558235; Wed, 04
 Jan 2023 08:09:18 -0800 (PST)
MIME-Version: 1.0
References: <20230101175740.1010258-1-dario.binacchi@amarulasolutions.com> <73979439-2e41-c4ea-02e0-d382f7ae1459@denx.de>
In-Reply-To: <73979439-2e41-c4ea-02e0-d382f7ae1459@denx.de>
From:   Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date:   Wed, 4 Jan 2023 17:09:07 +0100
Message-ID: <CABGWkvpaCmV9Hwpbvd2KdZNqNZHeon4Cz2r+AucfpXTTHt52Cw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/11] clk: imx8mn: setup clocks from the device tree
To:     Marek Vasut <marex@denx.de>
Cc:     linux-kernel@vger.kernel.org, angelo@amarulasolutions.com,
        michael@amarulasolutions.com, tommaso.merciai@amarulasolutions.com,
        Chen-Yu Tsai <wenst@chromium.org>,
        linux-amarula@amarulasolutions.com, anthony@amarulasolutions.com,
        jagan@amarulasolutions.com, Abel Vesa <abelvesa@kernel.org>,
        Adam Ford <aford173@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Li Jun <jun.li@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
        Markus Niebel <Markus.Niebel@ew.tq-group.com>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Marek,

On Tue, Jan 3, 2023 at 12:04 AM Marek Vasut <marex@denx.de> wrote:
>
> On 1/1/23 18:57, Dario Binacchi wrote:
> > The idea for this series was born back from Dublin (ELCE 2022) after
> > having attended the talk entitled "Updating and Modernizing Clock
> > Drivers" held by Chen-Yu Tsai and the availability of a board with
> > imx8mn SOC.
> >
> > This series aims to setup all imx8mn's clocks from the device tree and
> > remove the legacy setup code with hardwired parameters.
> >
> > I am well aware that the series lacks patches for the DT bindings. The
> > effort up to this point has been important and so I thought I'd ask for
> > feedback from the community before proceeding to implement them. If it
> > is positive I will add the DT binding patches starting from version 2.
> >
> > The series has been tested on the BSH SystemMaster (SMM) S2 board:
> > https://www.apertis.org/reference_hardware/imx8mn_bsh_smm_s2pro_setup
>
> I might be wrong, but I vaguely recall AT91 (?) had this kind of massive
> clock tree description in DT and they then switched to much simpler
> clock description where the clock topology is encoded in the driver
> instead (like what iMX does right now). It might be worth having a look
> at that and the reasoning around that conversion.

I took inspiration from Tero Kristo's work on the clock subsystem for
TI platforms.
I think he did a great job in both device tree definition and driver
implementation.
IMHO, this way the drivers are more flexible and the code can be more easily
re-used on more platforms.

Thanks and regards,
Dario

-- 

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com
