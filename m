Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 92F0FEE49AC
	for <linux-clk@archiver.kernel.org>; Tue, 22 Aug 2023 16:33:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237845AbjHVQde (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Aug 2023 12:33:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237859AbjHVQdd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Aug 2023 12:33:33 -0400
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com [IPv6:2a00:1450:4864:20::12f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EE396E53
        for <linux-clk@vger.kernel.org>; Tue, 22 Aug 2023 09:33:22 -0700 (PDT)
Received: by mail-lf1-x12f.google.com with SMTP id 2adb3069b0e04-4ff88239785so7166341e87.0
        for <linux-clk@vger.kernel.org>; Tue, 22 Aug 2023 09:33:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692722001; x=1693326801;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2xSrhz5Us97Qf9+7A783D7YhpLpwN4x1lqakquu3VGg=;
        b=tiEBp3JL4YsbBo0QBtgI3BmQCPsYGmzCdpu19U5Nd41sv+ssgGLIFtY5a1xz0xtsP/
         BKPV24/E5/rZr1hm9Q31b6qODcKiXkchKBWAx4wxEzP+sIwra+poInZczv74sJUEnrvW
         suDXeUnVmclfMTBeErpwG3IQKd89egEpnhRv8CuJBKLaiW+YaczEgROWpPB8YPuczdGt
         Cd1gB5TRwa48+WR33V341n6aJiGfIUhWkWOCEHwSlblbZkDmMzV4ork+r5tBySfvhwbY
         kKuuBtulfExcTuvOKdTUoQgBewgcUPZUDiJ9ofZhY0gNyPk+XIYeRlet7T3VAfOD3z35
         X/eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692722001; x=1693326801;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2xSrhz5Us97Qf9+7A783D7YhpLpwN4x1lqakquu3VGg=;
        b=TYsEcfTU75CGYFTjTQ9cKEXIZagARBnYOBWCpOSzqBHQCj5nM+KmPIL2dDS4Tkr0R3
         oEE1nPEWBQiehgxXRoBVt8db0BgD1AF7haqmU6XaRiKiqpU94jv0mvXYe/toEtve918A
         1QDo9vpwvzJnkbkDlgCJHfsK15P/RXsEmbp+b0RDz6WfNeesO34/Jk/zXCB/LXtR9WXJ
         cB1t7DjrVNtW8xk8TJwLrLIP0v70TKFuoLx21D5IxhiMDdU4x9zOO1L5xYC9IHTB1k7f
         bDip3akG26eOe9ScjBgFokh9Duay64h/oIxfC+de8zpQy5z1fVFxaNNccDfkDr7bwuWF
         bu6A==
X-Gm-Message-State: AOJu0YwsTuiosZ1Lfey6UF/4OvKaKqueFGWH6bSMqaeV8tnDICSd0tjd
        PjXNxc7iFowiWrfDbN3MrmeZLA==
X-Google-Smtp-Source: AGHT+IFS5+pN89cVqDrLU2XMxBLLm1IgGNr/2RbOgFBpign6kDrEGDdwUp0uhR5vmCE6wdyEgQI7Kw==
X-Received: by 2002:a05:6512:1584:b0:4f8:711b:18b0 with SMTP id bp4-20020a056512158400b004f8711b18b0mr8883753lfb.3.1692722000583;
        Tue, 22 Aug 2023 09:33:20 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id w17-20020aa7d291000000b0050488d1d376sm7750157edq.0.2023.08.22.09.33.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Aug 2023 09:33:20 -0700 (PDT)
Message-ID: <1c812715-731e-18fe-e431-311f18af1bb5@linaro.org>
Date:   Tue, 22 Aug 2023 18:33:18 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH V10 2/4] dt-bindings: clock: document Amlogic S4 SoC
 peripherals clock controller
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
References: <20230822082750.27633-1-yu.tu@amlogic.com>
 <20230822082750.27633-3-yu.tu@amlogic.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230822082750.27633-3-yu.tu@amlogic.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 22/08/2023 10:27, Yu Tu wrote:
> Add the S4 peripherals clock controller dt-bindings in the S4 SoC
> family.
> 
> Signed-off-by: Yu Tu <yu.tu@amlogic.com>
> ---

As well ignored email from v8 and v7 and earlier versions.

Best regards,
Krzysztof

