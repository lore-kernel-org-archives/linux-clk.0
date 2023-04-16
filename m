Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 21784C77B7A
	for <linux-clk@archiver.kernel.org>; Sun, 16 Apr 2023 17:54:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229717AbjDPRym (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 16 Apr 2023 13:54:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229644AbjDPRyk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 16 Apr 2023 13:54:40 -0400
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com [IPv6:2a00:1450:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B8CB91FE7
        for <linux-clk@vger.kernel.org>; Sun, 16 Apr 2023 10:54:38 -0700 (PDT)
Received: by mail-ed1-x533.google.com with SMTP id 4fb4d7f45d1cf-5069097bac7so1077172a12.0
        for <linux-clk@vger.kernel.org>; Sun, 16 Apr 2023 10:54:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1681667677; x=1684259677;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JS6gaHiphUmSOWpn+pmyiSugcXzg+J545dx/xJnnaxk=;
        b=WuWEb3nQKRcBC4aQq5LCsl/QIdpbFKoJvTV/SSvo7+KcXslPZLEolPou2WpIPh9FCF
         srBTN+NGP3wj8rwbrUDV8VW47d+Ia+cdOt36cVwkpPie84WhNTiO/G08tM6139DnVgOd
         Dy8L6Fa6tgCAG04ZtOxo+uyGTfV4VjAkykB/5otTlNrA2UVIuusuAX/F56nUUuVtwxWD
         96eYsH0axlMBFn6uCuZh8OTkFdS2nLbwtuzoUk7tVDlq+GxwnO2hQIDEnvwl1J3GmSt1
         ugYCUXZV3Sj18cLHhJWSKF3gciUab1+yK2RmZV3x+B4zT8k8zJmTdCetNRpPXt6ybdBk
         ZCWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1681667677; x=1684259677;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JS6gaHiphUmSOWpn+pmyiSugcXzg+J545dx/xJnnaxk=;
        b=FGsFKlEbpGB9nBOR5MX9XtYDA0hXsum52dtTXYsEWMmHjxgmNJln1yoekCoFTB5AGk
         B2hBGpPhdZGUvcFxMCTo58lcEtLHi9nz8SQzEKlzGF2upmFdzwGOWj3pHR33xs8Q92C4
         9IyPh/f2s336FVZjrRv/4oKtme42eLThzeW8uLqe1qWeLR2GaQKQt+YLoR1k6/PYYus9
         JbGPqyNAs9uzgxhs2OnnB5sDTyN3l7JLBw6IdRDfwM9s96lmgnMZzVs5yTjc7Hv3TKlN
         n7r1gz2hHUpmSTYk9FxH+ChycoFO5t3EqZLtL18UrN+0lB388JrcUGproJSCIDW3B9lC
         wodw==
X-Gm-Message-State: AAQBX9dyXMCDi6WOkJwpCt2eeeyXWINZjrvX6O9zhhtpnavD8YRP1aKy
        J5YkOZMmko5kVhEOIHQQzn+UDw==
X-Google-Smtp-Source: AKy350Y5iFghGHPVY/+36B4z9G0r8ayC/uD7aU0dvjOxkfyBYGegI5B/Jo7ShhZXPQ/Ssg96Hx350Q==
X-Received: by 2002:a05:6402:1486:b0:4fd:29a1:6a58 with SMTP id e6-20020a056402148600b004fd29a16a58mr13688436edv.19.1681667677169;
        Sun, 16 Apr 2023 10:54:37 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:f9e3:1d38:66a7:ae92? ([2a02:810d:15c0:828:f9e3:1d38:66a7:ae92])
        by smtp.gmail.com with ESMTPSA id h23-20020aa7c957000000b005066ca60b2csm4695188edt.63.2023.04.16.10.54.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 Apr 2023 10:54:36 -0700 (PDT)
Message-ID: <00bd1ec1-0745-c521-4df9-e31e1057a6ff@linaro.org>
Date:   Sun, 16 Apr 2023 19:54:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.0
Subject: Re: [PATCH v2 01/12] dt-bindings: soc: samsung: add Exynos4212 PMU
 compatible
Content-Language: en-US
To:     Artur Weber <aweber.kernel@gmail.com>
Cc:     Alim Akhtar <alim.akhtar@samsung.com>,
        Rob Herring <robh+dt@kernel.org>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Tomasz Figa <tomasz.figa@gmail.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>, soc@kernel.org,
        Russell King <linux@armlinux.org.uk>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Kukjin Kim <kgene@kernel.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Vinod Koul <vkoul@kernel.org>,
        Kishon Vijay Abraham I <kishon@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-media@vger.kernel.org,
        linux-phy@lists.infradead.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20230416133422.1949-1-aweber.kernel@gmail.com>
 <20230416133422.1949-2-aweber.kernel@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230416133422.1949-2-aweber.kernel@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16/04/2023 15:34, Artur Weber wrote:
> The platform was originally dropped in commit bca9085e0ae9 ("ARM:
> dts: exynos: remove Exynos4212 support (dead code)"), as there were
> no boards using it.

You meant commit c40610198f35e? This is the one which you partially revert.

> 
> We will be adding a device that uses it, so add it back.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
>  Documentation/devicetree/bindings/soc/samsung/exynos-pmu.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Best regards,
Krzysztof

