Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4256C00140
	for <linux-clk@archiver.kernel.org>; Fri,  5 Aug 2022 06:53:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237495AbiHEGx3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 Aug 2022 02:53:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59558 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230492AbiHEGx2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 Aug 2022 02:53:28 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6D5021EC7D
        for <linux-clk@vger.kernel.org>; Thu,  4 Aug 2022 23:53:27 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id t22so2194546lfg.1
        for <linux-clk@vger.kernel.org>; Thu, 04 Aug 2022 23:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=svGbdJtoA42vxhMw0xl6uJ/CKt4Zq7+usPD0U/PNy5Q=;
        b=fcizwj7UD0ZDd1mZ0oDmsurKWnpaQ6W8uIjVJaOD0QvmsghpTV2mhyjgilSZfV3gfp
         VKxKifhMNxIxkv84hkBVE/pSxJMeMj+KoWkFL2y+KDM6m2ZZWeC9sJYVxT6Eo7Xe5I1W
         iV/F1O2wQ9eUQTVwfppVzZa0FHW+OxPbQV5/ji8lTUwWD3fxaFyFZOx4kNeQCte4KSj8
         xKOGnH+sqff7E8e7Pb1UHtsuYRJl+IYJZbr6Ce0PeJiLzh1nHgmWeMbzZFyduUJFdbcX
         GB7zxiqDzQ0zakdY5rGcgEwK7b7VDGioVCMp2950fn0J5lmPnn7nh8gr6S99j3QHei4p
         vsYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=svGbdJtoA42vxhMw0xl6uJ/CKt4Zq7+usPD0U/PNy5Q=;
        b=Qk2dxAgot8a57e4irjRwPR+fAvIIPb3fQJo1RUPeQtdqRGWoMcwUcICcIod5vO4LcR
         BDP1rw1yO0Jr9O5163XelOQV1DyviaR3wDbQjxF73VvTtEIMaIZluyM9lGIXXTlXTuks
         y9NKYx6lgoujEbFSQlFv0Y2x2pGYnn203v6GW3WWzPRjRDpGJhxHvEmUuoBIGNprB+LH
         Cv6OIkTTsE4DI9P6QONpBG4pe1lTvE9KUcmZb4xj+71bKCRzmdEwsuz9hrUA3z+/KFQz
         pTPvxXAzGNP1ODpDGT0lJhdl8bSpBztTunsIfF+pqLZuBuZBJUWsMrG6RE4j0+fOYd3L
         jKFg==
X-Gm-Message-State: ACgBeo31kMzo6f2lYCaGDLJ5Z+IM0LwlD0w2wmhiKnwiFRKSXZ0IdTAX
        bJ/HfEgYcPwV5fqoivbiCYfzIg==
X-Google-Smtp-Source: AA6agR5PP/ENG7yXEHTvyafw/XQB2vIAh7cCSieTd83vPiy91LJfZPa5YrNOmaUMVOVwlr0V6qymXg==
X-Received: by 2002:a05:6512:230b:b0:48a:7c11:664d with SMTP id o11-20020a056512230b00b0048a7c11664dmr2034885lfu.390.1659682405752;
        Thu, 04 Aug 2022 23:53:25 -0700 (PDT)
Received: from [192.168.1.6] ([77.222.167.48])
        by smtp.gmail.com with ESMTPSA id z16-20020a2e9650000000b0025dd6c8933csm362348ljh.114.2022.08.04.23.53.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Aug 2022 23:53:23 -0700 (PDT)
Message-ID: <bee3d724-1efb-d5c7-6698-c98a198e69fd@linaro.org>
Date:   Fri, 5 Aug 2022 08:53:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
Subject: Re: [PATCH v4 3/8] dt-bindings: clock: Add ids for Lynx 10g PLLs
Content-Language: en-US
To:     Sean Anderson <sean.anderson@seco.com>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        linux-phy@lists.infradead.org
Cc:     devicetree@vger.kernel.org, Madalin Bucur <madalin.bucur@nxp.com>,
        Camelia Alexandra Groza <camelia.groza@nxp.com>,
        linuxppc-dev@lists.ozlabs.org, Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
References: <20220804220602.477589-1-sean.anderson@seco.com>
 <20220804220602.477589-4-sean.anderson@seco.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220804220602.477589-4-sean.anderson@seco.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 05/08/2022 00:05, Sean Anderson wrote:
> This adds ids for the Lynx 10g SerDes's internal PLLs. These may be used
> witn assigned-clock* to specify a particular frequency to use.
> 
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> ---
> 
> Changes in v4:
> - New
> 
>  include/dt-bindings/clock/fsl,lynx-10g.h | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
>  create mode 100644 include/dt-bindings/clock/fsl,lynx-10g.h
> 
> diff --git a/include/dt-bindings/clock/fsl,lynx-10g.h b/include/dt-bindings/clock/fsl,lynx-10g.h
> new file mode 100644
> index 000000000000..f5b955658106
> --- /dev/null
> +++ b/include/dt-bindings/clock/fsl,lynx-10g.h
> @@ -0,0 +1,14 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */

This should be dual license.

> +/*
> + * Copyright (C) 2022 Sean Anderson <sean.anderson@seco.com>

It's confusing to see personal copyrights with company email. Either the
copyright is attributed to your employer or to you. If to you, use
private email.

> + */
> +
> +#ifndef __DT_BINDINGS_CLK_LYNX_10G_H
> +#define __DT_BINDINGS_CLK_LYNX_10G_H
> +
> +#define LYNX10G_CLKS_PER_PLL 2
> +
> +#define LYNX10G_PLLa(a)		((a) * LYNX10G_CLKS_PER_PLL)
> +#define LYNX10G_PLLa_EX_DLY(a)	((a) * LYNX10G_CLKS_PER_PLL + 1)

These do not look like proper IDs for clocks for bindings. Numbering
starts from 0 or 1 and any "a" needs to be clearly explained. What do
you bind here?

> +
> +#endif /* __DT_BINDINGS_CLK_LYNX_10G_H */


Best regards,
Krzysztof
