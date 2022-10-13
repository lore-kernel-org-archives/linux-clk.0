Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0CF5C4332F
	for <linux-clk@archiver.kernel.org>; Thu, 13 Oct 2022 13:59:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229534AbiJMN7g (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Oct 2022 09:59:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbiJMN7e (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Oct 2022 09:59:34 -0400
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 61507B8C32
        for <linux-clk@vger.kernel.org>; Thu, 13 Oct 2022 06:59:02 -0700 (PDT)
Received: by mail-qv1-f48.google.com with SMTP id i9so1333972qvo.0
        for <linux-clk@vger.kernel.org>; Thu, 13 Oct 2022 06:59:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PQ10/6LRc84micnFOBKpFzY/QjfgjefSJQE0Vl51KIY=;
        b=FWQpdB+246DKDbgKp/9ISuIE6YWt3f8uxuh6Eg//8tM2Qh6GkiiJM4COHD/Vw2pg+H
         UGcYA4ywGuTqgGfEB203o7yAPj6CJ8QkcSiq2qMsXq3F/ZMnkkAeOjHiYPQJe1m2h+AV
         YlvsLQ6AYH1T6e8FXJ6WAjRLEcZsGott+NQl9AXQVfJ+NmzsGWHud0+sxehF2bpdL8LV
         hdDANzFkucyfcAG3FFhhLmB21BynPOCWqerRye7rODHnb+SlTaVVhWsHxiB7uVvUR3pR
         /wSQ0iG7/j9ElpZwEFs1NSE+k+5jEJ8Ej77X+7xZe/+4eVKkn6bIqIdGMF4D/gKEGaf2
         O4Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PQ10/6LRc84micnFOBKpFzY/QjfgjefSJQE0Vl51KIY=;
        b=qAga1e1XiVYfao28trZRj//8kmxqKCbGG5MgsnlVx5A6W2TedpnNWb0O+OtKnO58Bt
         7xFD1Vo0n6ZU+15xVYzHI4IT2ZLYtrjtiPrAYZKBx5BkTJ3jTfyES6bBTPXA7IJDlExf
         st82G98GkotCsEN2urUd/tF6GeSARs1sR9P6ZMYp2FXAoaTswzRBTuJ4tbnaJwWWLFXn
         8g40Gv65XOIOiS265+4pQosLrOnUZ2Zb+T0oFpj9jlLBrniTENBBh4d02xVJE/VDHGEx
         G2fkQRGN+9f6Uqq+knohZQo8nRBqsAv+S+WPjjN68D80w1ODevzOw8XkHHeUlAv6dxuT
         p15Q==
X-Gm-Message-State: ACrzQf3rtPGo7vkieGXHG1fPapx2+5y0OeC6/65lXAnqJy86dxozrh0N
        hETExJMH2A+TUGpOzoxsrY9hYw==
X-Google-Smtp-Source: AMsMyM6XPi6X7sylpI0WdrSyatbD37xQO/0BUZe9dso2t46gwVsug9naadzRVdUbWODl4qHyPIpJWQ==
X-Received: by 2002:ad4:5763:0:b0:4af:b800:be6b with SMTP id r3-20020ad45763000000b004afb800be6bmr27984799qvx.70.1665669102521;
        Thu, 13 Oct 2022 06:51:42 -0700 (PDT)
Received: from [192.168.1.57] (cpe-72-225-192-120.nyc.res.rr.com. [72.225.192.120])
        by smtp.gmail.com with ESMTPSA id h28-20020a05620a13fc00b006ce7bb8518bsm368862qkl.5.2022.10.13.06.51.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Oct 2022 06:51:41 -0700 (PDT)
Message-ID: <ea5feb23-54ce-45da-47a4-078ffb79ebd0@linaro.org>
Date:   Thu, 13 Oct 2022 09:49:30 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.2
Subject: Re: [PATCH 4/5] clk: imx6q: Add ipp-di0 and ipp-di1 clocks
Content-Language: en-US
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Abel Vesa <abelvesa@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>
Cc:     Pengutronix Kernel Team <kernel@pengutronix.de>,
        NXP Linux Team <linux-imx@nxp.com>,
        Anson Huang <Anson.Huang@nxp.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20221013131839.1365394-1-alexander.stein@ew.tq-group.com>
 <20221013131839.1365394-5-alexander.stein@ew.tq-group.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221013131839.1365394-5-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13/10/2022 09:18, Alexander Stein wrote:
> Described in CCM_CHSCCDR and CCM_CSCDR2 in the fields ipuX_diX_pre_clk_sel.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  drivers/clk/imx/clk-imx6q.c               | 20 ++++++++++++--------
>  include/dt-bindings/clock/imx6qdl-clock.h |  4 +++-

Don't mix bindings with drivers.

Best regards,
Krzysztof

