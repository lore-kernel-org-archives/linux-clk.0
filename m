Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C55CC54EAA
	for <linux-clk@archiver.kernel.org>; Thu, 26 Jan 2023 10:50:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234698AbjAZKuj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 26 Jan 2023 05:50:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235698AbjAZKug (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Jan 2023 05:50:36 -0500
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9C1532534
        for <linux-clk@vger.kernel.org>; Thu, 26 Jan 2023 02:50:07 -0800 (PST)
Received: by mail-ed1-x529.google.com with SMTP id x10so1462534edd.10
        for <linux-clk@vger.kernel.org>; Thu, 26 Jan 2023 02:50:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=LjQL7TO9ONiXI0Kn8PVbO14Ye8gCiDTv38CuhVRinkI=;
        b=bCUnBjlWA3SxAUJS/jXAShOJzTXgwtniRqMifGDS9oXFifuRksxHVZQVxerZgUZ15J
         PmMSQ4AyrBx1Zi4nCogj0PTlz/F0hGeNX5uGG1QLCnz9M1kx0WW/OS9kY16ivxVDdcam
         M1K7VKNp6Sptq5nKVoWF+tgkJECHGQb4PKoY0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=LjQL7TO9ONiXI0Kn8PVbO14Ye8gCiDTv38CuhVRinkI=;
        b=w5A8waD41gexxCF53/VAKwOAbTKBX4bJdkszZSa0oQ7G1FCXRaQS5j6zogk4MMYWMp
         5BnplQ6fPtIf47Y3R/apLQR1oXiz1tbZ77D4W4uBFeUMjnbo0SUv8tMevY+/Ugl4QnDP
         NxAiztZR+ahZ9LVSgdkY1Xm9jLfNk6qgdST8V1IFMBRbMxF5CFUG9rbajbLWar7rvP8z
         2ZPKw+hpgqV7MMQaO1mi2MbWafSRsx63fUdING4NTEHl85+8BQWWlztrB88mbu63v56m
         tc+vA9VBW5HvR94/R4GUabvB9vwWVN9pYPTnwEsQz/4TdS9Rl+AsYb3GDCcvIIE2dW0A
         ogKg==
X-Gm-Message-State: AO0yUKVWZLOv4HegY6mHT8Vw2X722jyG5ZOeuoP5VT2gCN6WHehTjwNA
        J9MofRKJJ93oqhb64UAYU2plYS5iQgIklTQgGxpJVQ==
X-Google-Smtp-Source: AK7set9zqfLQV+2RRlvYb42Nj5OPfBN03/lMqEKmwcBlV06jvoNbdDi+VRMfZ0I00MIOc2R0Ag8kDGvNb5fVbOKfWSM=
X-Received: by 2002:a05:6402:3483:b0:4a0:b0ed:9ff8 with SMTP id
 v3-20020a056402348300b004a0b0ed9ff8mr1098942edc.39.1674730206125; Thu, 26 Jan
 2023 02:50:06 -0800 (PST)
MIME-Version: 1.0
References: <20230101175740.1010258-1-dario.binacchi@amarulasolutions.com> <1fc8686b0b66c3b3ff80c044ecf1add6.sboyd@kernel.org>
In-Reply-To: <1fc8686b0b66c3b3ff80c044ecf1add6.sboyd@kernel.org>
From:   Michael Nazzareno Trimarchi <michael@amarulasolutions.com>
Date:   Thu, 26 Jan 2023 11:49:54 +0100
Message-ID: <CAOf5uwkMRSc7q1xUv4D=hc4w0HL=+x1_J60yyru_hGSuf5m0bA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 00/11] clk: imx8mn: setup clocks from the device tree
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Dario Binacchi <dario.binacchi@amarulasolutions.com>,
        linux-kernel@vger.kernel.org, angelo@amarulasolutions.com,
        tommaso.merciai@amarulasolutions.com,
        Chen-Yu Tsai <wenst@chromium.org>,
        linux-amarula@amarulasolutions.com, anthony@amarulasolutions.com,
        jagan@amarulasolutions.com, Abel Vesa <abelvesa@kernel.org>,
        Adam Ford <aford173@gmail.com>,
        Fabio Estevam <festevam@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Li Jun <jun.li@nxp.com>, Lucas Stach <l.stach@pengutronix.de>,
        Marek Vasut <marex@denx.de>,
        Markus Niebel <Markus.Niebel@ew.tq-group.com>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi

On Wed, Jan 25, 2023 at 10:11 PM Stephen Boyd <sboyd@kernel.org> wrote:
>
> Quoting Dario Binacchi (2023-01-01 09:57:29)
> > The idea for this series was born back from Dublin (ELCE 2022) after
> > having attended the talk entitled "Updating and Modernizing Clock
> > Drivers" held by Chen-Yu Tsai and the availability of a board with
> > imx8mn SOC.
>
> Interesting. I didn't see any mention of putting clks into DT in that
> presentation.
>
> >
> > This series aims to setup all imx8mn's clocks from the device tree and
> > remove the legacy setup code with hardwired parameters.
>
> Please, no! We don't want one node per clk style of bindings.

I think the idea behind is:
- create a way from silicon vendor to export their clock mapping with
automatic exportation
- reduce the copy and paste code across the drivers
- avoid code duplication

Is the binding a way to solve this problem? If you don't want one node
per clk style bindings, did you still think that the way
to go is totally wrong?

Michael
