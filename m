Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20FD1ECAAD5
	for <linux-clk@archiver.kernel.org>; Mon, 29 Aug 2022 09:41:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229476AbiH2JlX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 29 Aug 2022 05:41:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230070AbiH2JlF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 29 Aug 2022 05:41:05 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0CC265D136
        for <linux-clk@vger.kernel.org>; Mon, 29 Aug 2022 02:40:54 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id bu22so9090150wrb.3
        for <linux-clk@vger.kernel.org>; Mon, 29 Aug 2022 02:40:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc;
        bh=FM+u/mT19a85swWLirrWas+cuEiZlUx6xGmwi5sOw9Q=;
        b=CR/429N71yazrm5/GlvVbONcJoh6cPfXGYcwqJEQTMhYzAMFpXA+Pf13aXAA5ocPLQ
         PyO7mI3WKEZbFSHVp8DN8HtyhahXiQ1vJQZoDmPmfpfUSUFNMk7llu6DyryxCtPx51QM
         UggdjRr6OCpz2I1aB+YBSjdf7baBkWv2LNjU15dug5RLH3NaZuT1TGf4hhVoihKnyOrn
         KS0aId49TCKXRZ+8As1clAfdlLcfqjkFqBKf6TJnPItx+8Wd42Cuzq29FQqGL0n0vdPc
         MWlZHocaeL1NO/HzOZLtPJ3ZWcqMRTdFyyeXatsF/XKP99Km19neLAkjnP+4aVzKklhJ
         Cigw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc;
        bh=FM+u/mT19a85swWLirrWas+cuEiZlUx6xGmwi5sOw9Q=;
        b=P+V6kdldPzB6d/lqHnKoEj7H4WdLFLdlldZlQFF1lu2hhVtrBC2ySFDXd5xMIkpchL
         V5JheOcM4+BGqMkK3aYCFmL5Wj86CJGV4W0MGoeG5l/XJEXyRPadc02XzsRUyuBonpsf
         xi1KPJXfOkrmYdQ5WDgj83DL47Fl19tly0noPRM+hJdP+orrIct8B2JDhu9rLC+sA+CV
         rdgj4SKME3FUFBdkzOL1znCg0PWS7aqwD0MMK2tXwAy7uRfoTQFB1LJ2+yV/DYm94D+j
         qWOgq/hdOeG+4GjnLwnvVzoWrNczzz+AfkDuuCv+fLdJCyqv8CLIFB3dnclSJQxWond2
         VAZA==
X-Gm-Message-State: ACgBeo3ywoD12CFLclSq3WNVsQxPVagwjDvUm1GYnfplGQoFaDBKvXI5
        fNb38LZJAv05ELAuG/UM4sIAPg==
X-Google-Smtp-Source: AA6agR6yz+KetRQLU5z5+8USMBrJz6Xsi96fJACvOe/SZcUPY6d6c25Q1ykCxbsnofqIb7BISTZIQQ==
X-Received: by 2002:a05:6000:1045:b0:226:df71:fd5e with SMTP id c5-20020a056000104500b00226df71fd5emr588745wrx.427.1661766053017;
        Mon, 29 Aug 2022 02:40:53 -0700 (PDT)
Received: from linaro.org ([94.52.112.99])
        by smtp.gmail.com with ESMTPSA id k13-20020a7bc40d000000b003a83ac538a1sm7489435wmi.29.2022.08.29.02.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Aug 2022 02:40:52 -0700 (PDT)
Date:   Mon, 29 Aug 2022 12:40:50 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Marcel Ziswiler <marcel@ziswiler.com>
Cc:     linux-arm-kernel@lists.infradead.org,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Fabio Estevam <festevam@gmail.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 4/5] clk: imx6sll: add proper spdx license identifier
Message-ID: <YwyJorBWti0FTYg/@linaro.org>
References: <20220826192252.794651-1-marcel@ziswiler.com>
 <20220826192252.794651-5-marcel@ziswiler.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220826192252.794651-5-marcel@ziswiler.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22-08-26 21:22:51, Marcel Ziswiler wrote:
> From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> This fixes the following error:
> 
> include/dt-bindings/clock/imx6sll-clock.h:1: warning: Improper SPDX
>  comment style for 'include/dt-bindings/clock/imx6sll-clock.h', please
>  use '/*' instead
> include/dt-bindings/clock/imx6sll-clock.h:1: warning: Missing or
>  malformed SPDX-License-Identifier tag in line 1
> 
> Signed-off-by: Marcel Ziswiler <marcel.ziswiler@toradex.com>

Reviewed-by: Abel Vesa <abel.vesa@linaro.org>

> ---
> 
>  include/dt-bindings/clock/imx6sll-clock.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/dt-bindings/clock/imx6sll-clock.h b/include/dt-bindings/clock/imx6sll-clock.h
> index f446710fe63d..494fd0c37fb5 100644
> --- a/include/dt-bindings/clock/imx6sll-clock.h
> +++ b/include/dt-bindings/clock/imx6sll-clock.h
> @@ -1,4 +1,4 @@
> -// SPDX-License-Identifier: GPL-2.0
> +/* SPDX-License-Identifier: GPL-2.0 */
>  /*
>   * Copyright (C) 2016 Freescale Semiconductor, Inc.
>   * Copyright 2017-2018 NXP.
> -- 
> 2.36.1
> 
