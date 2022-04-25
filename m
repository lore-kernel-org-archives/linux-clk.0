Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE5E2C433EF
	for <linux-clk@archiver.kernel.org>; Mon, 25 Apr 2022 19:04:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244842AbiDYTHu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 25 Apr 2022 15:07:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36546 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237610AbiDYTHr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 25 Apr 2022 15:07:47 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8EB7F12C688
        for <linux-clk@vger.kernel.org>; Mon, 25 Apr 2022 12:04:42 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id k27so4426837edk.4
        for <linux-clk@vger.kernel.org>; Mon, 25 Apr 2022 12:04:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=dkJK/bIXn+MjYWm2XRzMDddvE/wybEFyuqEkS+yBujQ=;
        b=w2hlctq3j0qr6JmyRLhuyLCwiyKXnEGlMGtrwDINRO5qUUg7AP3r/DE+QY8iz+289K
         9UnbpwX6BVc3ryyYMIK9dlsTjGrfHX0OnuJfe3w2Dwxk+MZLH3YlomnC76yxuiHIT82n
         7cNw7m1Jc0osEfCPcsjUYmsqv9OZ5dtkoA3Fk8aUyJHf2sw30WeBRVJR/ADQ+wSu65py
         TqR0/yydhPPvNuoxOYJSOXwD1irZR4r7s8SrysTYxthYTxi9zs9N4eh4SUszu2aGGSgm
         AW7mneB8qxrK92xEO4RpB/svfdOF7ag8G/dsMF9Qh8z4+0YVfv7WgquuTplHgCM/Hyq1
         kJmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=dkJK/bIXn+MjYWm2XRzMDddvE/wybEFyuqEkS+yBujQ=;
        b=Nz8ZJ9tpoXfyZ+ZoFsJXHXtnn0ooocHjmdtekLZnnAQaj4BUpwXgGTWeOTWs3SCbuY
         0nTunFw4l7TMu0NGj/YmvhBqkkUMqhtR/At5B6LWQIdzoN+YOMHhDgqdqfZBSytDel8Y
         P/eEURpAPI7+awY/Xosj2ISltSZCsQf4AhZ8Gkw0tP6TJSwppO0lszbQUP71ia7K6OOQ
         QCbWkb5oBlo1qsC0QXOHxU5dS/vMmvsUYQRHptpRyQQjuTROmTjns9dIm1049xHs3Ez2
         v1P46IbRPSAdveLSYh25OeRRo5VfLt4zQ5cEX0Z6oWm6EzTbI4f9xm87bfMqKBPHvCo4
         eRxw==
X-Gm-Message-State: AOAM5317NPqGhvSSUz6qxkhMZVurxPpDxlc6ALyy/6/Ya/dzcQ86E/u1
        7jS5ybMPcBulyHg+w+WPenCcEg==
X-Google-Smtp-Source: ABdhPJx9ZZG4M6AYqL/6gLcP9gmx1DMtXiCtvOZldKX8Fm4IY4JLn4h8Lxwf+bdbC7O3xNQVDZZitA==
X-Received: by 2002:a50:9f06:0:b0:425:c1ba:5037 with SMTP id b6-20020a509f06000000b00425c1ba5037mr17765566edf.285.1650913478943;
        Mon, 25 Apr 2022 12:04:38 -0700 (PDT)
Received: from [192.168.0.244] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id z14-20020a170906944e00b006f38c33b6e3sm1894061ejx.68.2022.04.25.12.04.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 25 Apr 2022 12:04:37 -0700 (PDT)
Message-ID: <377a84e8-504f-7716-937a-4c97d8a04a2a@linaro.org>
Date:   Mon, 25 Apr 2022 21:04:36 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [PATCH 1/3] clk: qcom: gcc-msm8976: Set floor ops for SDCC
Content-Language: en-US
To:     Adam Skladowski <a39.skl@gmail.com>, phone-devel@vger.kernel.org
Cc:     ~postmarketos/upstreaming@lists.sr.ht,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20220425185140.15154-1-a39.skl@gmail.com>
 <20220425185140.15154-2-a39.skl@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220425185140.15154-2-a39.skl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Thank you for your patch. There is something to discuss/improve.

On 25/04/2022 20:51, Adam Skladowski wrote:
> Just like in case of other SoCs change SDCC1/SDCC2 ops to floor to avoid overclocking controller.
> This commit only sets SDCC1/SDCC2 which are used for EMMC/SDCARD.
> It leaves SDCC3 because on this platform it's mostly used for WIFI/BT chips like on Sony Loire family devices.

You need to wrap your commit msg.

https://elixir.bootlin.com/linux/v5.18-rc4/source/Documentation/process/submitting-patches.rst#L586


Best regards,
Krzysztof
