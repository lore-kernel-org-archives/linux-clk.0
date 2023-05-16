Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 56E55C77B75
	for <linux-clk@archiver.kernel.org>; Tue, 16 May 2023 09:22:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231515AbjEPJWX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 May 2023 05:22:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231642AbjEPJV6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 16 May 2023 05:21:58 -0400
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4D62E3AB4
        for <linux-clk@vger.kernel.org>; Tue, 16 May 2023 02:21:21 -0700 (PDT)
Received: by mail-ed1-x536.google.com with SMTP id 4fb4d7f45d1cf-50db91640d3so13073869a12.0
        for <linux-clk@vger.kernel.org>; Tue, 16 May 2023 02:21:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684228877; x=1686820877;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GIxKr3aX2BYjnoWfUPAEf66ji9uTTT0hy2kkalP7tEo=;
        b=z2ocyro2qH97P1SExYDO0aZUDuVW2RYJH99+aT0lMGrRSNCAAMT7aH47X6trbdCej+
         0/gvFtvV3lw8YzkvRKgrtmvxrvbCh868VlGHvRMVzdlHNZ5/x/lGHZvK04XR7C+BbrRv
         VESyB/VVG2qES+iiv9YWTiDEHTA4N15GpS9K7eTCLR+1WSAflIJtqwtgqicnMt7Y0faF
         rsDxU3AZiGxmBtYal+wqdUHvxqe8YjkrbHR0gYqXcouIECcDhRkZtXt3Gwz9L63CpF6C
         eIOGQOhIw02s2mlM3xzQd+etEMvLEdXyu+QdAoYPfKYQ+aCyIuBnR04uWUI/hS8M5bfO
         jEgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684228877; x=1686820877;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GIxKr3aX2BYjnoWfUPAEf66ji9uTTT0hy2kkalP7tEo=;
        b=WmIhsxB46NtlNnBwK62zBxCWSyqMIFIkcSyWg/hmqyWXZJpNthX/mz6MSd2lWDQsal
         kaxgE7Hx35kBI0yVaI5gXir6Q9DPWgW5kgru5LfGcQ72jCRj2FvXAu3NDH/SQLtwppji
         27+CQpe49hAPBcNfUbWVBH/JjyKgid+6Qa/GRzE3fnZ+P6njj0JQ+LhcF79g1TS5fkvk
         w9jZ0exlOXU9/ye4QKmLEoxBgRgDLnSZbyQBB+PNFiMJxF1pJCgIkoVB8lgtayt0VV1k
         WHqn43bWvLhAraGfcXpEymGgms9543hiXstwSxrTFpijJJdrnA59gQ66eRY5JGsypIRe
         wISg==
X-Gm-Message-State: AC+VfDznFBO16o86rBgqzGLTXcQu00aztc6sVox3mFLgseEkeDPyKJrK
        IT6R1fQjDAHW6WUyW96NKyRVHA==
X-Google-Smtp-Source: ACHHUZ7dzFmPjJCKif5jB1+N0nHY21kGqLzOZEPILSuue896Kpc4Nn7f7bqfkz3TWcmxSoNINxsYNw==
X-Received: by 2002:a17:907:7251:b0:96a:1ab:b4a2 with SMTP id ds17-20020a170907725100b0096a01abb4a2mr26409591ejc.25.1684228877779;
        Tue, 16 May 2023 02:21:17 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:77d1:16a1:abe1:84fc? ([2a02:810d:15c0:828:77d1:16a1:abe1:84fc])
        by smtp.gmail.com with ESMTPSA id tl14-20020a170907c30e00b00961277a426dsm10532335ejc.205.2023.05.16.02.21.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 May 2023 02:21:17 -0700 (PDT)
Message-ID: <0efd549a-6caf-aa92-f78d-3dd0dbb12b0f@linaro.org>
Date:   Tue, 16 May 2023 11:21:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH V8 RESEND 1/4] dt-bindings: clock: document Amlogic S4 SoC
 PLL clock controller
Content-Language: en-US
To:     Yu Tu <yu.tu@amlogic.com>, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Kevin Hilman <khilman@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc:     kelvin.zhang@amlogic.com, qi.duan@amlogic.com
References: <20230516064736.10270-1-yu.tu@amlogic.com>
 <20230516064736.10270-2-yu.tu@amlogic.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230516064736.10270-2-yu.tu@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16/05/2023 08:47, Yu Tu wrote:
> Add the S4 PLL clock controller dt-bindings in the s4 SoC family.
> 
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> ---

This is a friendly reminder during the review process.

It looks like you received a tag and forgot to add it.

If you do not know the process, here is a short explanation:
Please add Acked-by/Reviewed-by/Tested-by tags when posting new
versions. However, there's no need to repost patches *only* to add the
tags. The upstream maintainer will do that for acks received on the
version they apply.

https://elixir.bootlin.com/linux/v5.17/source/Documentation/process/submitting-patches.rst#L540

If a tag was not added on purpose, please state why and what changed.

Best regards,
Krzysztof

