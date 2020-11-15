Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E9C7BC5519F
	for <linux-clk@archiver.kernel.org>; Sun, 15 Nov 2020 01:17:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 90B3024137
	for <linux-clk@archiver.kernel.org>; Sun, 15 Nov 2020 01:17:36 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="frVzHUXN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726356AbgKOBRQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 14 Nov 2020 20:17:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726196AbgKOBRP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 14 Nov 2020 20:17:15 -0500
Received: from mail-oi1-x241.google.com (mail-oi1-x241.google.com [IPv6:2607:f8b0:4864:20::241])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 89529C0613D2
        for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2020 17:17:15 -0800 (PST)
Received: by mail-oi1-x241.google.com with SMTP id k26so14898349oiw.0
        for <linux-clk@vger.kernel.org>; Sat, 14 Nov 2020 17:17:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=pj+MD2pHMa3/a5BID/gxIQr3rVhY6quJevJmMVimKc8=;
        b=frVzHUXNVUxr91okTqjjjP7fThJDxaC7L3xw6O3zXZ4HUDx7L46cVwhtQUI9o0nFKI
         EgDXIg6WNBQ2peaZgOk3TAFJ60HzTlqkpLmZ3pPy3oXvhXBCbujjOCmyrkuP1mQj1ECu
         0KLkrcWulYx01dD3HV+PjZ4GdHm437Xz9Z0X0s2fM50HUaebXscmkNZyBaqWnAnHgPrB
         12/f5S8K6npW9DTab6CNLOh40TgEbaSP+xteNvUfgIKnkQb7BGKMAppYtEFY74bXF7l8
         hzacH4r3a/padP/V3QPtF9Oyy/g/vNtt0WmCE8tCVFO/0mVuu9bO8zUkW0Z6GHv1lxeB
         Q+wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=pj+MD2pHMa3/a5BID/gxIQr3rVhY6quJevJmMVimKc8=;
        b=azynxs8FPDVYLHSN8Qr8c3o2AGIONo8psWnbHci+5segwnH7fYzph6yLxSJCX/ky+M
         6+wW8WjX8l5D9Sabimt3Af4eRt+YqdcEe229slqzf5oStZ5E/Bu/KEqYVK+ApF8lj3Zy
         K7S4k/FzJDsxMnQ1khoekdUKoHGc7ukA6I9LOUlRLZtWQZfLYE7vM8Hz4q19TH04oZ/+
         DFSmTcWl/7De71RrbNxspZpEz3FNwNtvMHKZdxvShpC3ZwfnUkbXT/PpoQewtwH81IBI
         uFHz2oSJpkGAzyav967wBP6q3SpEaTayvdp2ul8ndp+7bWI/1OlADHqle0TSiye3uXBH
         gkEg==
X-Gm-Message-State: AOAM5301vJk2oZYLSM+XySbBJO5jtxA6KhCkOMxEFW12ctpzRAd+gaCK
        YkPRpBRZTCYuyj1906kwj+JNYw==
X-Google-Smtp-Source: ABdhPJw1Ot9M8b4w8AzlV/jC6vaqEz6FuXllkYd4X8y3bf9rS5yIN8DeRQNLbmNknFlOFNDfwqS2tQ==
X-Received: by 2002:aca:c787:: with SMTP id x129mr5843715oif.168.1605403034654;
        Sat, 14 Nov 2020 17:17:14 -0800 (PST)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id v21sm3013136ota.78.2020.11.14.17.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2020 17:17:13 -0800 (PST)
Date:   Sat, 14 Nov 2020 19:17:11 -0600
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Vinod Koul <vkoul@kernel.org>
Cc:     Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        Naveen Yadav <naveenky@codeaurora.org>
Subject: Re: [PATCH v2 2/4] clk: qcom: Add SDX55 GCC support
Message-ID: <20201115011711.GI332990@builder.lan>
References: <20201105104817.15715-1-manivannan.sadhasivam@linaro.org>
 <20201105104817.15715-3-manivannan.sadhasivam@linaro.org>
 <20201106093819.GE2621@vkoul-mobl>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201106093819.GE2621@vkoul-mobl>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri 06 Nov 03:38 CST 2020, Vinod Koul wrote:

> On 05-11-20, 16:18, Manivannan Sadhasivam wrote:
> > From: Naveen Yadav <naveenky@codeaurora.org>
> > 
> > Add Global Clock Controller (GCC) support for SDX55 SoCs from Qualcomm.
> > 
> > Signed-off-by: Naveen Yadav <naveenky@codeaurora.org>
> > [mani: converted to parent_data, commented critical clocks, cleanups]
> > Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
> > ---
> >  drivers/clk/qcom/Kconfig     |    7 +
> >  drivers/clk/qcom/Makefile    |    1 +
> >  drivers/clk/qcom/gcc-sdx55.c | 1626 ++++++++++++++++++++++++++++++++++
> >  3 files changed, 1634 insertions(+)
> >  create mode 100644 drivers/clk/qcom/gcc-sdx55.c
> > 
> > diff --git a/drivers/clk/qcom/Kconfig b/drivers/clk/qcom/Kconfig
> > index 3a965bd326d5..7897a3947e6d 100644
> > --- a/drivers/clk/qcom/Kconfig
> > +++ b/drivers/clk/qcom/Kconfig
> > @@ -413,6 +413,13 @@ config SDM_LPASSCC_845
> >  	  Say Y if you want to use the LPASS branch clocks of the LPASS clock
> >  	  controller to reset the LPASS subsystem.
> >  
> > +config SDX_GCC_55
> > +	tristate "SDX55 Global Clock Controller"
> > +	help
> > +	  Support for the global clock controller on SDX55 devices.
> > +	  Say Y if you want to use peripheral devices such as UART,
> > +	  SPI, I2C, USB, SD/UFS, PCIe etc.
> > +
> >  config SM_DISPCC_8250
> >  	tristate "SM8150 and SM8250 Display Clock Controller"
> >  	depends on SM_GCC_8150 || SM_GCC_8250
> > diff --git a/drivers/clk/qcom/Makefile b/drivers/clk/qcom/Makefile
> > index 11ae86febe87..886b877e70c7 100644
> > --- a/drivers/clk/qcom/Makefile
> > +++ b/drivers/clk/qcom/Makefile
> > @@ -64,6 +64,7 @@ obj-$(CONFIG_SDM_GCC_845) += gcc-sdm845.o
> >  obj-$(CONFIG_SDM_GPUCC_845) += gpucc-sdm845.o
> >  obj-$(CONFIG_SDM_LPASSCC_845) += lpasscc-sdm845.o
> >  obj-$(CONFIG_SDM_VIDEOCC_845) += videocc-sdm845.o
> > +obj-$(CONFIG_SDX_GCC_55) += gcc-sdx55.o
> >  obj-$(CONFIG_SM_DISPCC_8250) += dispcc-sm8250.o
> >  obj-$(CONFIG_SM_GCC_8150) += gcc-sm8150.o
> >  obj-$(CONFIG_SM_GCC_8250) += gcc-sm8250.o
> > diff --git a/drivers/clk/qcom/gcc-sdx55.c b/drivers/clk/qcom/gcc-sdx55.c
> > new file mode 100644
> > index 000000000000..bf114165e24b
> > --- /dev/null
> > +++ b/drivers/clk/qcom/gcc-sdx55.c
> > @@ -0,0 +1,1626 @@
> > +// SPDX-License-Identifier: GPL-2.0-only
> > +/*
> > + * Copyright (c) 2018-2019, The Linux Foundation. All rights reserved.
> > + * Copyright (c) 2020, Linaro Ltd.
> > + */
> > +
> > +#include <linux/clk-provider.h>
> > +#include <linux/module.h>
> > +#include <linux/platform_device.h>
> > +#include <linux/regmap.h>
> > +
> > +#include <dt-bindings/clock/qcom,gcc-sdx55.h>
> > +
> > +#include "common.h"
> > +#include "clk-alpha-pll.h"
> > +#include "clk-branch.h"
> > +#include "clk-pll.h"
> > +#include "clk-rcg.h"
> > +#include "clk-regmap.h"
> > +#include "reset.h"
> > +
> > +enum {
> > +	P_BI_TCXO,
> > +	P_CORE_BI_PLL_TEST_SE,
> 
> This is for test and we removed this for upstream, so can you do that as
> well (not parent will decrease for clks below)
> 

We have several other platforms that includes the bi_pll_test clock -
and it's there in the hardware, so I think we should just keep it.

Is it causing any issues?

Regards,
Bjorn

> With that updated:
> 
> Reviewed-by: Vinod Koul <vkoul@kernel.org>
> 
> -- 
> ~Vinod
