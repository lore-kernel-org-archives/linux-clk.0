Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F9CAC636D3
	for <linux-clk@archiver.kernel.org>; Mon, 30 Jan 2023 22:12:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231388AbjA3WL7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 30 Jan 2023 17:11:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56426 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231522AbjA3WL5 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 30 Jan 2023 17:11:57 -0500
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com [IPv6:2a00:1450:4864:20::32c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49A7449961
        for <linux-clk@vger.kernel.org>; Mon, 30 Jan 2023 14:11:55 -0800 (PST)
Received: by mail-wm1-x32c.google.com with SMTP id d4-20020a05600c3ac400b003db1de2aef0so9276901wms.2
        for <linux-clk@vger.kernel.org>; Mon, 30 Jan 2023 14:11:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9I5pl8DSHmaWXNB0PemQm1q2dxgc93EP+DNyvXZvXX4=;
        b=hSE6hMx5cHbbag2pGvUGtlSJ0IWqHMjds6j4grw2kUJ3JuoUkpAg8P2Z29H64voQp1
         kEHa9cUnonHudEzcnfDnMAtyfVdJR5mADezrTePzasDhkARzwO5POgYFTQyjDMH7zDkd
         5NMAM1F2wKwOWL82M0xAasy6Bp3SiHi41n2A9iucDRbpmn7zvHT7uBDs8lEvk3b4bG73
         t5xE+SH/RjUL9aCZjy3PNlbVY1DJKLMP11TpoqY5BeiYvS7KLZ15dO7i0dj0yVvlaPd0
         7kNqpdC0amP+7Cw1c4zUmNdnNlM1/iiTdxNXKeMF0QSSx1CNsfe3fP+fUbrH6eUwWAOv
         TieQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9I5pl8DSHmaWXNB0PemQm1q2dxgc93EP+DNyvXZvXX4=;
        b=hxXRbKWHYhEPIkzhuxHhPs6nJ61NcKl0AeoacYb6mI9mswVMsCvOZXSut3ukyQv1yC
         3qRnL1wkDtu6d7w+Z5ZMpHRZmhS+C5yBLcuKRrdNs0jnRzyMZy20/KaTJlZb/6oI++jw
         bLr14Xs6GnZ81R3RKBWTSCV6q6OGPuLZdAuYc2py65TyR3FsvPlWyyTuv/NsL/oFZ+mZ
         GJQmI9IJVJee7hUgiheBrcKGOgaeT8oA/qLT+mTw2Y3O+hjH9tnEw1U9jadVR9s9O/qV
         fLxyt7UZqb/iGm1LkgSUaT2VHyXAPBU0xoY4jJ4Jn2Bc8HgEsPArbd2+i71k97d7GCtm
         Wwcw==
X-Gm-Message-State: AO0yUKVG011IrQB/ifAqZZ6dgjLuwCSk6YUHmeSSJVVq6WWNKmlWTjzT
        Fa9d17oUunR3KZviEdEghJ5LdQ==
X-Google-Smtp-Source: AK7set9kXkviydhoYszyF+Pxt81ps5PQMVZGsIpP1V/XMSwer/iHzhncD/OWVHvxEri6J1yR//rrTg==
X-Received: by 2002:a05:600c:1ca7:b0:3dc:1050:5553 with SMTP id k39-20020a05600c1ca700b003dc10505553mr987240wms.23.1675116713757;
        Mon, 30 Jan 2023 14:11:53 -0800 (PST)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id n6-20020adff086000000b002bdbead763csm13337430wro.95.2023.01.30.14.11.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jan 2023 14:11:53 -0800 (PST)
Date:   Tue, 31 Jan 2023 00:11:51 +0200
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Oleksij Rempel <o.rempel@pengutronix.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Abel Vesa <abelvesa@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Richard Cochran <richardcochran@gmail.com>,
        kernel@pengutronix.de, Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Russell King <linux@armlinux.org.uk>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 00/19] ARM: imx: make Ethernet refclock configurable
Message-ID: <Y9hApxZv2QiWftB4@linaro.org>
References: <20230117061453.3723649-1-o.rempel@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230117061453.3723649-1-o.rempel@pengutronix.de>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23-01-17 07:14:34, Oleksij Rempel wrote:
> changes v2:
> - remove "ARM: imx6q: use of_clk_get_by_name() instead of_clk_get() to
>   get ptp clock" patch
> - fix build warnings
> - add "Acked-by: Lee Jones <lee@kernel.org>"
> - reword some commits as suggested by Fabio


Unfortunatley it doesn't apply on my tree. Can you please rebase and resend?

Thanks.

> 
> Most of i.MX SoC variants have configurable FEC/Ethernet reference clock
> used by RMII specification. This functionality is located in the
> general purpose registers (GRPx) and till now was not implemented as
> part of SoC clock tree.
> 
> With this patch set, we move forward and add this missing functionality
> to some of i.MX clk drivers. So, we will be able to configure clock topology
> by using devicetree and be able to troubleshoot clock dependencies
> by using clk_summary etc.
> 
> Currently implemented and tested i.MX6Q, i.MX6DL and i.MX6UL variants.
> 
> Oleksij Rempel (19):
>   clk: imx: add clk-gpr-mux driver
>   clk: imx6q: add ethernet refclock mux support
>   ARM: imx6q: skip ethernet refclock reconfiguration if enet_clk_ref is
>     present
>   ARM: dts: imx6qdl: use enet_clk_ref instead of enet_out for the FEC
>     node
>   ARM: dts: imx6dl-lanmcu: configure ethernet reference clock parent
>   ARM: dts: imx6dl-alti6p: configure ethernet reference clock parent
>   ARM: dts: imx6dl-plybas: configure ethernet reference clock parent
>   ARM: dts: imx6dl-plym2m: configure ethernet reference clock parent
>   ARM: dts: imx6dl-prtmvt: configure ethernet reference clock parent
>   ARM: dts: imx6dl-victgo: configure ethernet reference clock parent
>   ARM: dts: imx6q-prtwd2: configure ethernet reference clock parent
>   ARM: dts: imx6qdl-skov-cpu: configure ethernet reference clock parent
>   ARM: dts: imx6dl-eckelmann-ci4x10: configure ethernet reference clock
>     parent
>   clk: imx: add imx_obtain_fixed_of_clock()
>   clk: imx6ul: fix enet1 gate configuration
>   clk: imx6ul: add ethernet refclock mux support
>   ARM: dts: imx6ul: set enet_clk_ref to CLK_ENETx_REF_SEL
>   ARM: mach-imx: imx6ul: remove not optional ethernet refclock overwrite
>   ARM: dts: imx6ul-prti6g: configure ethernet reference clock parent
> 
>  arch/arm/boot/dts/imx6dl-alti6p.dts           |  12 +-
>  arch/arm/boot/dts/imx6dl-eckelmann-ci4x10.dts |  13 +-
>  arch/arm/boot/dts/imx6dl-lanmcu.dts           |  12 +-
>  arch/arm/boot/dts/imx6dl-plybas.dts           |  12 +-
>  arch/arm/boot/dts/imx6dl-plym2m.dts           |  12 +-
>  arch/arm/boot/dts/imx6dl-prtmvt.dts           |  11 +-
>  arch/arm/boot/dts/imx6dl-victgo.dts           |  12 +-
>  arch/arm/boot/dts/imx6q-prtwd2.dts            |  17 ++-
>  arch/arm/boot/dts/imx6qdl-skov-cpu.dtsi       |  12 +-
>  arch/arm/boot/dts/imx6qdl.dtsi                |   4 +-
>  arch/arm/boot/dts/imx6ul-prti6g.dts           |  14 ++-
>  arch/arm/boot/dts/imx6ul.dtsi                 |  10 +-
>  arch/arm/mach-imx/mach-imx6q.c                |  10 +-
>  arch/arm/mach-imx/mach-imx6ul.c               |  20 ---
>  drivers/clk/imx/Makefile                      |   1 +
>  drivers/clk/imx/clk-gpr-mux.c                 | 119 ++++++++++++++++++
>  drivers/clk/imx/clk-imx6q.c                   |  13 ++
>  drivers/clk/imx/clk-imx6ul.c                  |  33 ++++-
>  drivers/clk/imx/clk.c                         |  14 +++
>  drivers/clk/imx/clk.h                         |   8 ++
>  include/dt-bindings/clock/imx6qdl-clock.h     |   4 +-
>  include/dt-bindings/clock/imx6ul-clock.h      |   7 +-
>  include/linux/mfd/syscon/imx6q-iomuxc-gpr.h   |   6 +-
>  23 files changed, 296 insertions(+), 80 deletions(-)
>  create mode 100644 drivers/clk/imx/clk-gpr-mux.c
> 
> -- 
> 2.30.2
> 
