Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44D1EC636D4
	for <linux-clk@archiver.kernel.org>; Mon, 13 Feb 2023 10:49:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229908AbjBMKta (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Feb 2023 05:49:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57918 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229973AbjBMKtZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Feb 2023 05:49:25 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FBB815545
        for <linux-clk@vger.kernel.org>; Mon, 13 Feb 2023 02:49:17 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id j32-20020a05600c1c2000b003dc4fd6e61dso10936572wms.5
        for <linux-clk@vger.kernel.org>; Mon, 13 Feb 2023 02:49:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=aT7VvlUOMpPipvm3wlZIQFUoYoelXFY2v3Bc54ifSV8=;
        b=uVsqKR2n23byaQccB17GNoz6E2ceIFKQHOLqJuhlaihMGwJ30tjevxEAGEZKkkDQUp
         JcrWtq+bMvTC4AJDW2dS6feliE6lF7p7/n0NEEFF4wnHiMiP0bQEcKQoP7TEFEi1vzLV
         pZdhbf77a+/tF1lupLVNJNkXRyCmrUz0Fi95sMaHTdQHqIIRDxfX3tLLf07CU9vRT3LI
         us1Mz95V82+S+l6TPFKMtzJl2hgINB+dO2z6hAmjE3vRMt45oiXNwuC6MV8/yemKckPY
         andzKtbiYifzlucHDXFrOKfZfTNRlAcUtCbjRW7ibg1TQ6G1tBd6g1EzU1Bmh1m5N2fh
         f66g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aT7VvlUOMpPipvm3wlZIQFUoYoelXFY2v3Bc54ifSV8=;
        b=XtN5QNC3+8fDxvdGL+WS2aaFTalO5p9ZDdtsjwjyvYCGzeAokc9vapcS0VA6+AVVT7
         0ed3Ap547hiROuaduc/YgBHzCZ++GDMt3bhP9MaHcOOZjnlnngDrkRxbZzUf6+DgtPc8
         YUofHZIl4htylvuNtfYgevThWbTTOju2NcvzN8RZed63YYdRg1R+vgKhOFKnqOPs4GAE
         98aVLMMDeTG4GDD40EkckQPNpOWufuwzO91ufE+WytNau4Dm6oJe8vWf3hYzGJBBkRNz
         qJxTiTObj0+HeKuBkPgEpm97rFo6XyeKcNTgCFCcy6c8+ZegHS+ZG0UX5pI06KUmCyw/
         t/Pg==
X-Gm-Message-State: AO0yUKXhPtz99TloTG0+FfVZsURDkJIbqSTynaB9oHUth6879BoTYoJY
        yfaiNsTnwlXLojg0IHsrxNkW4w==
X-Google-Smtp-Source: AK7set/iyRzJtsUzppLZveqjUXX5TxSHJLjHGTOcruKk8MIGtnSbZ2Wc34V220Eswb4eIaFuasj61Q==
X-Received: by 2002:a05:600c:a287:b0:3df:fff4:5f6f with SMTP id hu7-20020a05600ca28700b003dffff45f6fmr18380252wmb.36.1676285355734;
        Mon, 13 Feb 2023 02:49:15 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id n13-20020a05600c3b8d00b003dc434900e1sm14568936wms.34.2023.02.13.02.49.13
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 13 Feb 2023 02:49:15 -0800 (PST)
Message-ID: <9443acf1-0380-fda4-7a05-d603ee010ffb@linaro.org>
Date:   Mon, 13 Feb 2023 11:49:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/6] dt-bindings: rtc: convert rtc-meson-vrtc.txt to
 dt-schema
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Alessandro Zummo <a.zummo@towertech.it>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-rtc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org
References: <20230209-b4-amlogic-bindings-convert-take2-v1-0-c4fe9049def9@linaro.org>
 <20230209-b4-amlogic-bindings-convert-take2-v1-1-c4fe9049def9@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230209-b4-amlogic-bindings-convert-take2-v1-1-c4fe9049def9@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 09/02/2023 14:41, Neil Armstrong wrote:
> Convert the Amlogic Virtual RTC bindings to dt-schema.
> 
> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
> ---


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

