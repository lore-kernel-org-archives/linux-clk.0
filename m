Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A589DC4332F
	for <linux-clk@archiver.kernel.org>; Sat, 23 Apr 2022 10:01:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234763AbiDWKEo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 23 Apr 2022 06:04:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234768AbiDWKEj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 23 Apr 2022 06:04:39 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F3E4016C15E
        for <linux-clk@vger.kernel.org>; Sat, 23 Apr 2022 03:01:41 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id g20so13157694edw.6
        for <linux-clk@vger.kernel.org>; Sat, 23 Apr 2022 03:01:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=hwSE7TDc6cFAJaZEfJMscDdMHu75MY/lCb9p7EVlJQM=;
        b=eKVlG0S5gFmB0DrWoxFQqgFXu+ghvX31Kgv3S3YxydkVIY5AIvTvSdjBvZ+mM/GI0o
         m1a4sM4CX2Ajaxzy4ED8eKYeoP5MQokiq4IyLjpvUbjVAiDv4AAR3ymDYwOV1YsEoGht
         eV1HZImAsWkTLH04ic5Z9s540rwlVpVuugWpY94GOcXM0ZZSNYB9aDQ4h0dD+Go8Q3aX
         fdFBTjXp9eQ6GoRDf8/1fs8z0DzE+liSWz2iyjWjPOVVjtvOKS9LmpchEtNSFjggePgZ
         QY33TmJGbtURKKG0hbMuwHpsfW+RrrrSJegkYNXmyqT/c7S17sMBeZ6a4D7EabN2uJCT
         ezsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=hwSE7TDc6cFAJaZEfJMscDdMHu75MY/lCb9p7EVlJQM=;
        b=2YdVmx2L4sXKWJfokRLXTOubJqS6lxAsGRDjZiGE/TB9ENPEkKjI5Jm24hPFWoXLGE
         Se913gQcUtxiU/QVkN05nULfVqq5jwcQ/jbkyndlj9SXWq9oQ6fJHetUHzKFO690J6/F
         gd81ZqUSO1Zc8fozcdPegQAokx+7FI7I7RwAd40jTcQbvK8H1VgSY15t5C1B/lqyBI9o
         WDFCxgQ52qmhwYbIdnd/boGQZyT3RzPj5k0y3Xv3guPHPFcs7SZ683qNrjtB8kwQL92/
         aSzbpOa7nUz8b5PqaytDROrzrD367cwioGz5xqcEoFVx8Wi8F9sWTV9LSM4NMX7dpA2V
         PkMg==
X-Gm-Message-State: AOAM533hIOY09LJD9SK0BvMif6PEhr0WR45myQaxGZjXJvF1V2ZZFbQV
        bFY33qda2mRaolWmTIuN81bLZg==
X-Google-Smtp-Source: ABdhPJzENh0r45+mF7Yc1XCr0LaVa3RPTBAzJvk8WTJfvb2ZwRvgYOxp/O+nQamFJVQ3evuGuO+cAw==
X-Received: by 2002:a05:6402:254c:b0:423:e51b:e1b2 with SMTP id l12-20020a056402254c00b00423e51be1b2mr9448917edb.161.1650708100556;
        Sat, 23 Apr 2022 03:01:40 -0700 (PDT)
Received: from [192.168.0.234] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id r3-20020aa7cb83000000b0041b573e2654sm2003756edt.94.2022.04.23.03.01.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Apr 2022 03:01:39 -0700 (PDT)
Message-ID: <38c0cb0d-a678-d249-5d90-ea55a95a3898@linaro.org>
Date:   Sat, 23 Apr 2022 12:01:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCHv1 07/19] dt-bindings: mmc: sdhci-of-dwcmhsc: Add rk3588
Content-Language: en-US
To:     Sebastian Reichel <sebastian.reichel@collabora.com>,
        Heiko Stuebner <heiko@sntech.de>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Adrian Hunter <adrian.hunter@intel.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-mmc@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, kernel@lists.collabora.co.uk,
        kernel@collabora.com
References: <20220422170920.401914-1-sebastian.reichel@collabora.com>
 <20220422170920.401914-8-sebastian.reichel@collabora.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220422170920.401914-8-sebastian.reichel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22/04/2022 19:09, Sebastian Reichel wrote:
> Add compatible value for the Rockchip rk3588 dwcmshc controller.
> 
> Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
