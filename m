Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BC0D3C38142
	for <linux-clk@archiver.kernel.org>; Thu, 19 Jan 2023 10:33:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229914AbjASKdU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 Jan 2023 05:33:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230352AbjASKdH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 Jan 2023 05:33:07 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9D62E5EF81
        for <linux-clk@vger.kernel.org>; Thu, 19 Jan 2023 02:32:54 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id r30so1377413wrr.10
        for <linux-clk@vger.kernel.org>; Thu, 19 Jan 2023 02:32:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9k2ZCvXwJCt6LMPn3Qm6skL5MW78g6QFwWzJJkZLtZk=;
        b=RmhHiXoeA97MjfWH1RB8qm6wclb9aooX22GME4ePw6MMjpZhZBdNhBXAc5XZL5sBL0
         6EgZ4av2GKr+mk2Yrr1MavRpsn9P5hcxax0a7S6c5fd0O0o34YJG8T9anZ35qGB/OmU4
         7V0yp/nvMcuFhHF8QysdjUpxtUil5tlGd1FRmMWc2kLw+Ydeyswp3hbvFtkinNrQdeoF
         9eJHN9FRRh4EtiCLfXbKFh90V3HEuTkKi+vaFqoOjHtHXvqoW2CWDAuogQ6z+9C40SkT
         cjhQc3o5fQ+BlqyrOTZJ+YdafDiwRkxkjchN+hWTBkyaxJC5GmxrQzIfhzMhbUnJHSKb
         UCEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9k2ZCvXwJCt6LMPn3Qm6skL5MW78g6QFwWzJJkZLtZk=;
        b=jcdMBzL6H/sLJGFxttNreDW/16068k5pw9Bgl080fX9qj/+87ZVzJfrG/qWt0AtvT7
         x8L1+Ssknf4szhJh5+c0DmL1angqahWzM1RD1ADDfG5hhvTXZiu4fZH2yU2oUZRuCkXV
         dh5t0rymFnmiJ3IsQrJGPg0RyHH0T5qtuYcJrSc3Ye84e9sDmGiR63/iVjsjkANklOE0
         4V/CbPIv4gdw8PnTAU2PVlygSHnNnK38qTJxWgSj8o0gJ90guGSD+6Qen670F+aqquP3
         orHIFni5ltQ76YajLSj8DyA/OTHJOobgFbx0nITAfMxz5zOkdW2IdsBBptObfQD1hDiT
         XbHA==
X-Gm-Message-State: AFqh2kpkqt/Dmvbrszi1GbHdMRQISc8/+Q6p2z4+GRPMyCbd9oWJzNSJ
        rM16k25Zwtd+XtJmndLgEmACxA==
X-Google-Smtp-Source: AMrXdXuYd2TH1VffEdv9EbMiawuBaGDqOQv4dyU1JIm4zVGy84yqlClhcPpAsfLs75moxtlYA6unqw==
X-Received: by 2002:a5d:6f15:0:b0:2bd:fdd8:2d0a with SMTP id ay21-20020a5d6f15000000b002bdfdd82d0amr10699155wrb.40.1674124372952;
        Thu, 19 Jan 2023 02:32:52 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id ba29-20020a0560001c1d00b002b065272da2sm12541420wrb.13.2023.01.19.02.32.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Jan 2023 02:32:52 -0800 (PST)
Message-ID: <038c7f64-c003-08e2-0489-3a78411bee31@linaro.org>
Date:   Thu, 19 Jan 2023 11:32:50 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.0
Subject: Re: [RESEND PATCH v1 2/2] dt-bindings: imx8ulp: clock: no spaces
 before tabs
Content-Language: en-US
To:     Marcel Ziswiler <marcel@ziswiler.com>,
        linux-arm-kernel@lists.infradead.org
Cc:     Marcel Ziswiler <marcel.ziswiler@toradex.com>,
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
References: <20230119085421.102804-1-marcel@ziswiler.com>
 <20230119085421.102804-3-marcel@ziswiler.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230119085421.102804-3-marcel@ziswiler.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 19/01/2023 09:54, Marcel Ziswiler wrote:
> From: Marcel Ziswiler <marcel.ziswiler@toradex.com>
> 
> This fixes the following warnings:
> 
> include/dt-bindings/clock/imx8ulp-clock.h:204: warning: please, no space
>  before tabs
> include/dt-bindings/clock/imx8ulp-clock.h:215: warning: please, no space
>  before tabs
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

