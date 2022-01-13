Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB53AC433FE
	for <linux-clk@archiver.kernel.org>; Thu, 13 Jan 2022 13:21:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233266AbiAMNVG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Jan 2022 08:21:06 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:55780
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235066AbiAMNVF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Jan 2022 08:21:05 -0500
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5D6F7402A5
        for <linux-clk@vger.kernel.org>; Thu, 13 Jan 2022 13:21:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642080064;
        bh=wDhZU+ZCOzAWYEfifJv+1WyYVoJtwb8GVGdyzI9FKek=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=hh20x37zUEmxjS8fmeWIQ83hw9zmMO3VjltW6EUzoo5/xrGN231+ZyNOWX7UvtDv1
         K1A1geU6dxMUkyKW3sYVbFWxbpca9kKz1th18RmCg+/2lgWpIaVWukOuYzg2IBHZWJ
         6ZdhGxrQSPEb1b3WeeKyW3qalvjjOnPRTiyieH3Rmj1eWDGghfPR9+PwFmiSGR+FIQ
         xa0u2/AJ8uJUFFgXWnj03Q0QmsqBWMlJlqqFOVdDUdGuobGclP6zi0NSO5n5QhZrxm
         ZDQWmGXXasPKjkjLcQzXOr6F5p93jPVU0y7nnzuiZQyjirHUYVq9t78KIrzz4f9qAG
         yMsEg4JYjRDGw==
Received: by mail-ed1-f71.google.com with SMTP id z10-20020a05640235ca00b003f8efab3342so5341581edc.2
        for <linux-clk@vger.kernel.org>; Thu, 13 Jan 2022 05:21:04 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=wDhZU+ZCOzAWYEfifJv+1WyYVoJtwb8GVGdyzI9FKek=;
        b=TFPdaKYbbecrlZNewgHfAW3Fn/XAgrotcMVxR9EO+JtyicpG0on+JJQorfIuHeuv1t
         WVZOZdwGfNuAdMW4ly3rHk0lPgmXilDC6H5K4yqDYtTS6NXA8dPUW6qOWXJovhnwaoP3
         px9MgZPcdERZxXjCFUpddrQg5FLE4rGoyvkdffbe9JanAOjiUOjuR3HKdrTcbnjzS7s7
         N5zRXM+EKhl7IAEzP2BXqZOcgjnh7UJ2IqnQy4qqhftT62wV+aPALDIYeSsLgUVGJTf3
         r9bYz+JBxIJnK5RKyGj6xpFGyWrg3WD26oAmhUKDrGeLplomYnS7iTImn1/rNAPzj0Gh
         rl4w==
X-Gm-Message-State: AOAM530Vw47zFRTmxr9yFk3C/aK3y2LrCeYKN4fE0s7DDZpRQkSx2BE6
        ixuVvhnIPIOAxqZfSSCK0gsEtGUakZUnd082tw986SZHGfe/Vvawe3rzHJDU4P8dJwLFRl4yRYe
        4ZUk+NPAoOthIcrS3maqswifulqdA4CZMArgOmw==
X-Received: by 2002:a17:906:478a:: with SMTP id cw10mr3411063ejc.39.1642080063227;
        Thu, 13 Jan 2022 05:21:03 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzjpHVm/kyvq/k9DvoV9wE1ANwk87SXDg69GoUVpA6UcGba7Z0TUVTx/35US4JZ+QG3PKmo5Q==
X-Received: by 2002:a17:906:478a:: with SMTP id cw10mr3411040ejc.39.1642080063052;
        Thu, 13 Jan 2022 05:21:03 -0800 (PST)
Received: from [192.168.0.30] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id e18sm873252ejs.78.2022.01.13.05.21.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jan 2022 05:21:02 -0800 (PST)
Message-ID: <138009e6-6097-3ebf-fd20-ca9babb156e8@canonical.com>
Date:   Thu, 13 Jan 2022 14:21:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 17/23] Documentation: bindings: Add fsd spi compatible in
 dt-bindings document
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     soc@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, olof@lixom.net,
        linus.walleij@linaro.org, catalin.marinas@arm.com,
        robh+dt@kernel.org, s.nawrocki@samsung.com,
        linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
        linux-fsd@tesla.com, Adithya K V <adithya.kv@samsung.com>
References: <20220113121143.22280-1-alim.akhtar@samsung.com>
 <CGME20220113122427epcas5p1885d8b3b735e8f127b6694a309796e5a@epcas5p1.samsung.com>
 <20220113121143.22280-18-alim.akhtar@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220113121143.22280-18-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13/01/2022 13:11, Alim Akhtar wrote:
> This patch adds spi controller dt-binding compatible information for
> Tesla Full Self-Driving SoC.
> 
> Cc: linux-fsd@tesla.com
> Signed-off-by: Adithya K V <adithya.kv@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  Documentation/devicetree/bindings/spi/spi-samsung.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

Please rebase on upcoming Samsung SPI dtschema patches.

> diff --git a/Documentation/devicetree/bindings/spi/spi-samsung.txt b/Documentation/devicetree/bindings/spi/spi-samsung.txt
> index 49028a4f5df1..3af2408454b4 100644
> --- a/Documentation/devicetree/bindings/spi/spi-samsung.txt
> +++ b/Documentation/devicetree/bindings/spi/spi-samsung.txt
> @@ -11,6 +11,7 @@ Required SoC Specific Properties:
>      - samsung,s5pv210-spi: for s5pv210 and s5pc110 platforms
>      - samsung,exynos5433-spi: for exynos5433 compatible controllers
>      - samsung,exynos7-spi: for exynos7 platforms <DEPRECATED>
> +    - tesla,fsd-spi: spi controller support for Tesla Full Self-Driving SoC

Compatible - same discussions/questions as with other ones.

>  
>  - reg: physical base address of the controller and length of memory mapped
>    region.
> 


Best regards,
Krzysztof
