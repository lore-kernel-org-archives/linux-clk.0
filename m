Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BF5A5C433F5
	for <linux-clk@archiver.kernel.org>; Fri,  8 Oct 2021 06:45:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9ED6B61073
	for <linux-clk@archiver.kernel.org>; Fri,  8 Oct 2021 06:45:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229830AbhJHGrg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Oct 2021 02:47:36 -0400
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:37104
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229664AbhJHGrg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Oct 2021 02:47:36 -0400
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com [209.85.221.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id EFA1C3FFEC
        for <linux-clk@vger.kernel.org>; Fri,  8 Oct 2021 06:45:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1633675540;
        bh=K6iXGmH+Xr2/o1b+hKgXwSDn2IBjQQPNyuaqrgkHtGo=;
        h=Subject:To:Cc:References:From:Message-ID:Date:MIME-Version:
         In-Reply-To:Content-Type;
        b=EJWAUaal4A5xHZ9T2T3tCyw043CSXEelP69NmQi44Is32Wa4o2Ktr5PJamENfd2bn
         rBwPTlUoFQNMjqUMhrYuZOADG1mbtXYPhyx03YW41LH6Efd7+fGpmsBnK4mtQHCqGK
         cLPj40SjfWE1JqQoSHiT7ObblyoIY2bTJrUGjbosK+pxy29wnEzuGbGNpp8Vqcok33
         aGbrWppT7JMmNxk2L2+/pvRXXk6lYivObkHLb1Zh5HI/dLUnGb8Ev1m/G90dgAh3m1
         bjJ2zzvcm6R6qboVsd754HM49BmRjzzVKDRHKqmYxfXvrviLZhGjRFUTZDdoBvPlx7
         wjxvnGnhzTaeg==
Received: by mail-wr1-f71.google.com with SMTP id h11-20020adfa4cb000000b00160c791a550so6320299wrb.6
        for <linux-clk@vger.kernel.org>; Thu, 07 Oct 2021 23:45:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=K6iXGmH+Xr2/o1b+hKgXwSDn2IBjQQPNyuaqrgkHtGo=;
        b=JzP+mzT1MVSokk31+iyhUhBaYErGEo7YgyjGUXUM2h3L5MJiGRwFodXyIKbcGCHFiE
         pCv8eYM+xbzkxwU4JL9hj9ZCtuPEoG3J4KcvJN7T2+61a4u2giJp2UyaHiuhRFSgMA5P
         ODhi8IaleAgiPuDLCGNmB3AxestyQk3BZZLjzvSaSGkOmOob/ZO29YLbTk1f19hf/nC2
         HJ4PrX01LWmd9s+PE3hVPE+GYdcKy26BDmRkVYVGqB6nLOGOXePSGXWyOvxsKyY1mxTX
         YgrJfP4hsd3sG3p9P4Cj/sB8VYnPR0Zq3V1FKfArBhEmNWvsdi7rm4DlCZ/72nN7ZDC/
         UIFA==
X-Gm-Message-State: AOAM531xAUE8XfWGLxYnR/mHnMgrIDxWGvfktfXWbqlPMFzVGjyixye4
        PIO5PiRk8n+1BmfelYRd/jHNIKD4MW6Umk/lRgyjiciaIWaNPQuNnNswbbJtLKwZfy9NT+KgH4K
        1hHGuKj9LdQdPYKlQ5JsfD2fj5pCc0DtlRGMyUQ==
X-Received: by 2002:a5d:5986:: with SMTP id n6mr1798231wri.75.1633675540662;
        Thu, 07 Oct 2021 23:45:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyOmryVllHENNzxlkya8eUdoqWDAGCtwrtq2AttxUID67l6XccGUczuhDVl0y/YrmmVswUgeg==
X-Received: by 2002:a5d:5986:: with SMTP id n6mr1798196wri.75.1633675540394;
        Thu, 07 Oct 2021 23:45:40 -0700 (PDT)
Received: from [192.168.1.24] (xdsl-188-155-186-13.adslplus.ch. [188.155.186.13])
        by smtp.gmail.com with ESMTPSA id q12sm1467343wrp.75.2021.10.07.23.45.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Oct 2021 23:45:39 -0700 (PDT)
Subject: Re: [PATCH v2 3/5] dt-bindings: clock: Add bindings definitions for
 Exynos850 CMU
To:     Sam Protsenko <semen.protsenko@linaro.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        =?UTF-8?Q?Pawe=c5=82_Chmiel?= <pawel.mikolaj.chmiel@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Ryu Euiyoul <ryu.real@samsung.com>, Tom Gall <tom.gall@linaro.org>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        John Stultz <john.stultz@linaro.org>,
        Amit Pundir <amit.pundir@linaro.org>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-samsung-soc@vger.kernel.org
References: <20211007194113.10507-1-semen.protsenko@linaro.org>
 <20211007194113.10507-4-semen.protsenko@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Message-ID: <abe4bdeb-ee15-d8c8-54af-1cdf7282b004@canonical.com>
Date:   Fri, 8 Oct 2021 08:45:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211007194113.10507-4-semen.protsenko@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 07/10/2021 21:41, Sam Protsenko wrote:
> Clock controller driver is designed to have separate instances for each
> particular CMU. So clock IDs in this bindings header also start from 1
> for each CMU.
> 
> Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
> Acked-by: Rob Herring <robh@kernel.org>
> ---
> Changes in v2:
>   - Added all clock ids
>   - Added CLK_ prefix for all clock constants
>   - Added R-b tag by Krzysztof Kozlowski
>   - Added Ack tag by Rob Herring
> 
>  include/dt-bindings/clock/exynos850.h | 141 ++++++++++++++++++++++++++
>  1 file changed, 141 insertions(+)
>  create mode 100644 include/dt-bindings/clock/exynos850.h
> 
> diff --git a/include/dt-bindings/clock/exynos850.h b/include/dt-bindings/clock/exynos850.h
> new file mode 100644
> index 000000000000..a44c5f91d3c7
> --- /dev/null
> +++ b/include/dt-bindings/clock/exynos850.h
> @@ -0,0 +1,141 @@
> +/* SPDX-License-Identifier: GPL-2.0-only */

The bindings are preferred to be under GPL-2.0+BSD. I don't know about
such policy for the headers but it seems reasonable - allows re-usage in
other systems. Do you mind licensing it under:
GPL-2.0-only or BSD-2-Clause
?

Best regards,
Krzysztof

> +/*
> + * Copyright (C) 2021 Linaro Ltd.
> + * Author: Sam Protsenko <semen.protsenko@linaro.org>
> + *
> + * Device Tree binding constants for Exynos850 clock controller.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_EXYNOS_850_H
> +#define _DT_BINDINGS_CLOCK_EXYNOS_850_H
> +
> +/* CMU_TOP */
