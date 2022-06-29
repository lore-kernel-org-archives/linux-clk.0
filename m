Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 65B3CCCA486
	for <linux-clk@archiver.kernel.org>; Wed, 29 Jun 2022 18:07:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231675AbiF2SHK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 29 Jun 2022 14:07:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232594AbiF2SGw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 29 Jun 2022 14:06:52 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A798403DA
        for <linux-clk@vger.kernel.org>; Wed, 29 Jun 2022 11:06:14 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id pk21so34221589ejb.2
        for <linux-clk@vger.kernel.org>; Wed, 29 Jun 2022 11:06:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=V9eIqMH/UAN6dsljysjHWEU7rRIzDBGxrqT4v4OSvk4=;
        b=ES4ssmwCCmCw6EL7JkRYAPpCK/yFcI1PudrO9RMhoo7tFJ7LEghI2hIL5CqsI3esSJ
         OXhd6HIz7Do26OEh55AqkgywyvAf2aduNRuUFdhnBXXn4lkd6sON7wg5UBVvjykHgg9g
         MtsToh2Ag7mixFs/XhBTRPfm0jfAjY2lowruxRQh3C+PIOBhPxXb37/QE5ciUOA3VeTS
         tyyB1CBpvTcUaAeZu7KzjhcKKh63gXW4iU5uek811a/SX+/rZlys0jUyGvWpkR4HSeET
         YaXYp/ulJOL7e0g9/uiyZMXwVYk00NXl9jd7xDJfir6Z56pMzC/ZweJ9y6bMvqWjz5R+
         F0zQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=V9eIqMH/UAN6dsljysjHWEU7rRIzDBGxrqT4v4OSvk4=;
        b=S8zPBf/QFffmnOxWOOiH5K8oSAf5VYwu0ILkFm4o5s1l34BIMN4NDVMIa+99VyEMib
         6sPRTW2D5Fvv/I9XcL9Z76ARPOBCk4LWbcXi4v7cfctf2Uee5ldPh+zNQSi3jXlLYy7S
         Y8PR4jhv/yYYsD7TJlk3XrXjLpOJNwPagULC4v0WY09sZ05h1ebNx5SEIcfn80FmaQzZ
         dW+VbDrhyL+oQh5lPNmunkCFFZjv9o7q4lDHa0tTvsjxLNtyJky6U0BH6GTaFiL/bpmK
         6xhaSnc8/ob396duyM3PgIM51I536yuCcOaxvK2W25dUmBG2ctLwgDGDs8L3xSwFgyug
         O3VA==
X-Gm-Message-State: AJIora994nDhen4p48MqPBgMIAheO/HtPPfX6KpuPYoR+SpeCLUJgfmu
        QJgSPI9wcu/PbEn9QaxglFDjJg==
X-Google-Smtp-Source: AGRyM1tpg8rA6f2qYr5TKClCnZ3sCdM2Nz9dPuhEn1xfE3ExT0QWIsQj5Weetm1BRqAkYa/dcz5Rwg==
X-Received: by 2002:a17:907:3d92:b0:726:39f9:4a33 with SMTP id he18-20020a1709073d9200b0072639f94a33mr4466093ejc.766.1656525972845;
        Wed, 29 Jun 2022 11:06:12 -0700 (PDT)
Received: from [192.168.0.187] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id o3-20020aa7c503000000b0042de8155fa1sm12012803edq.0.2022.06.29.11.06.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 29 Jun 2022 11:06:12 -0700 (PDT)
Message-ID: <1e484314-d7ea-a419-dc09-9f168122e1ec@linaro.org>
Date:   Wed, 29 Jun 2022 20:06:10 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH v6 13/14] arm64: dts: freescale: imx8qxp: Fix the keys
 node name
Content-Language: en-US
To:     "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Dmitry Torokhov <dmitry.torokhov@gmail.com>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Linus Walleij <linus.walleij@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Amit Kucheria <amitk@kernel.org>,
        Zhang Rui <rui.zhang@intel.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Viorel Suman <viorel.suman@nxp.com>,
        Oliver Graute <oliver.graute@kococonnector.com>,
        Liu Ying <victor.liu@nxp.com>,
        Mirela Rabulea <mirela.rabulea@nxp.com>,
        Peng Fan <peng.fan@nxp.com>, Ming Qian <ming.qian@nxp.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-input@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-rtc@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20220629164414.301813-1-viorel.suman@oss.nxp.com>
 <20220629164414.301813-14-viorel.suman@oss.nxp.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220629164414.301813-14-viorel.suman@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 29/06/2022 18:44, Viorel Suman (OSS) wrote:
> From: Abel Vesa <abel.vesa@nxp.com>
> 
> The proper name is 'keys', not 'scu-keys'.
> 
> Signed-off-by: Abel Vesa <abel.vesa@nxp.com>
> Signed-off-by: Viorel Suman <viorel.suman@nxp.com>


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
