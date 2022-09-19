Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAECDECAAD3
	for <linux-clk@archiver.kernel.org>; Mon, 19 Sep 2022 10:05:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230148AbiISKF0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Sep 2022 06:05:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36472 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230109AbiISKFZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 19 Sep 2022 06:05:25 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28E5065D7
        for <linux-clk@vger.kernel.org>; Mon, 19 Sep 2022 03:05:25 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id q17so19331723lji.11
        for <linux-clk@vger.kernel.org>; Mon, 19 Sep 2022 03:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=1m6rTMKNi34J7sLNFezHq9Zai2Cnn9/zIHw82h382uo=;
        b=jVVkXI7aV1ZfDnFfJ10wIoue4SuXD2taKfvnuvUvj4m49PSFro6C5uU/oi0e7RjzLM
         Y8Lp3oq59a3xY5brIvbWnnigIifUgrwrStd7XNluzEShiDlMRkArim5NNJ6JjiEHCHNE
         WDaJXWO2NVFald5fq1mNVwu6u2MCXHvvUgGm7bb+Kr5QtKUUaMU5/1oGmmzrIedwY+TG
         muvBYD0Ph7gmUDMNSjlcoZaobbEC+wEF0nhRuU+KwYF1A6AUVYz6aQyY6V21AHIZPbV6
         sbggmMeIIbhS2hJmHTtJYdLHTJtXUhssgOX7PZTt7Owho6gVSOAQBn7QulvQVNBJgBeI
         SIzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=1m6rTMKNi34J7sLNFezHq9Zai2Cnn9/zIHw82h382uo=;
        b=b8x5YIXnu43weToMumJdcwGznkMGcEJmL9m7WPDKG9Ex3Pmx7wOHGNyo330gqWwehJ
         dtSifTGDVCiCZeM6Rm4LpPOWt7sbYuVKBVNw/33aZKaXoDpa+ZBg3UCpzVk4VhK9jN1P
         R9ElwHlZuxdk/P1AcQvqRICAU3fUD4wovEqH8Sp30Ey66MXF2vXcErvVeM8RGj4W9RFI
         hIAH7bNfCHFW14E5QpkVSxlnoqxKF4K+f8LMrGZyte1YrmMNGzM7hDP3k6jYEzsPVmQn
         BV3ibHYp/ZvZ6WjNWELLtf0BcvOnjhdtY+rszZDxJZ7HrytsD/ZuFbxpa1Q4R/ccYmPI
         Nnbg==
X-Gm-Message-State: ACrzQf37HwrlG3QQgqs3rtnUAs3/d5RJC+gZSevtt1LmwTRxL4TsHZma
        WNRMDrJcDWoJwbUYakWY1VX1tQ==
X-Google-Smtp-Source: AMsMyM73xxCTYNUwa7FeSMykXFeY+X43ry66C5w+e7n3KKOef83rPxP42JDs4oNPg2K8kg2S3nIRFg==
X-Received: by 2002:a2e:a551:0:b0:26c:4e2a:cbe1 with SMTP id e17-20020a2ea551000000b0026c4e2acbe1mr1657025ljn.9.1663581923520;
        Mon, 19 Sep 2022 03:05:23 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id g13-20020a0565123b8d00b0049f53b65790sm1962232lfv.228.2022.09.19.03.05.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 19 Sep 2022 03:05:23 -0700 (PDT)
Message-ID: <10dc71fe-6ef7-ecfa-2840-7172d693c32b@linaro.org>
Date:   Mon, 19 Sep 2022 12:05:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Subject: Re: [PATCH V3] dt-bindings: clock: add i.MX8M Anatop
Content-Language: en-US
To:     "Peng Fan (OSS)" <peng.fan@oss.nxp.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, abelvesa@kernel.org,
        abel.vesa@linaro.org, sboyd@kernel.org
Cc:     shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
        festevam@gmail.com, linux-imx@nxp.com, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, Peng Fan <peng.fan@nxp.com>
References: <20220919055904.1659124-1-peng.fan@oss.nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220919055904.1659124-1-peng.fan@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 19/09/2022 07:59, Peng Fan (OSS) wrote:
> From: Peng Fan <peng.fan@nxp.com>
> 
> i.MX8M Family features an anatop module the produces PLL to clock
> control module(CCM) root clock. Add the missing yaml file.
> 
> Signed-off-by: Peng Fan <peng.fan@nxp.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
