Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B818C27C40
	for <linux-clk@archiver.kernel.org>; Thu, 24 Aug 2023 18:07:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242939AbjHXSHC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 24 Aug 2023 14:07:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50538 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242964AbjHXSGf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 24 Aug 2023 14:06:35 -0400
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com [IPv6:2a00:1450:4864:20::135])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 700A9E7D
        for <linux-clk@vger.kernel.org>; Thu, 24 Aug 2023 11:06:33 -0700 (PDT)
Received: by mail-lf1-x135.google.com with SMTP id 2adb3069b0e04-5008d16cc36so101514e87.2
        for <linux-clk@vger.kernel.org>; Thu, 24 Aug 2023 11:06:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1692900391; x=1693505191;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=hXj7S19q5RtNo0D6iEd60OU8sFKZ3w5IrG/8uMz9J+Y=;
        b=Ki5a+t6UrQ1+9tLh7WV4ENOQmIOrWU6BmGDMU8UqYaFeZE9pPEOZYZESCIffhk8M1O
         YPZNXY0mZRFBW5BCBfyPUwnJsUcUA0sxsXjYb40YDXmWWQwZFfxqIUYa7upR5ev2fBcX
         CKBi2M4O1sdyvu4eBzBRlVn7Z8qkLzvofJiFNPD289RLB5bIldVpNXbivz8P08qQXAEK
         HZOXNDNWHE7iYK5NAcDu/l33E/HipVpF/y3xwCHCQQT5DG9WE3gHM2ExyWYiLuwRmu2a
         amCDOMNHvfRQ3n6KRtPhxOB7tWUCeg9ueZl8ZGV+wPVbB6KUQJfE3EtxvbedTWXiLy45
         SgUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692900391; x=1693505191;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=hXj7S19q5RtNo0D6iEd60OU8sFKZ3w5IrG/8uMz9J+Y=;
        b=bLSIIHbJWzD/NgAFKJPAvazdDz4fCR+gE7jLdHSQhdc7dxo8GbT1RPOTRSoSEE0H42
         OE8XJaMe3T1eTO3Se48i+GgFNZ4jSuwx/HOnAcDfVURuF4WmIOp4dFFJQhhnxaRStVm0
         oUvAlu5LtbvS85cBptJlToK1pFwtk8LBuYvCglkfIezazZiDJUUDXN+rzaM3j2ARu0hJ
         N16BHaFRr7sSEm9recAbgU+sa3PSFvGb2YsTagNlSPALYFfwVnT71A8dGj1G5o78XDpF
         iFXbpeb0/4Qg8A8hYQlVCa3GCfpx8t5tWhaROO6IUcNTGz8nYa1BIUztlDnSTx0xE9LN
         lE0Q==
X-Gm-Message-State: AOJu0YxYRBEzqDtwfFahuT0JZH+bxC+bw5bXt/sCbWSj3PkTZD74ffT7
        8/nvx9AX2tchXv1JpNuyE6Nppw==
X-Google-Smtp-Source: AGHT+IHvVpbN9zi77RkQ8HXMO7WXhe94dT4RB/bcvBKwuEkMOB6WxM8tK+7RaBfXqx9rlD5oCnH8rw==
X-Received: by 2002:a19:791d:0:b0:4fb:7675:1c16 with SMTP id u29-20020a19791d000000b004fb76751c16mr10077974lfc.49.1692900391074;
        Thu, 24 Aug 2023 11:06:31 -0700 (PDT)
Received: from [192.168.0.22] ([77.252.47.198])
        by smtp.gmail.com with ESMTPSA id z24-20020a170906815800b0099b42c90830sm11256190ejw.36.2023.08.24.11.06.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 24 Aug 2023 11:06:30 -0700 (PDT)
Message-ID: <84865d1b-1322-2f40-2c1b-069f12e6ea29@linaro.org>
Date:   Thu, 24 Aug 2023 20:06:29 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH v2] dt-bindings: clock: meson: Convert axg-audio-clkc to
 YAML format
Content-Language: en-US
To:     Jerome Brunet <jbrunet@baylibre.com>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     Alexander Stein <alexander.stein@mailbox.org>,
        Kevin Hilman <khilman@baylibre.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-amlogic@lists.infradead.org
References: <20230824164649.2914789-1-jbrunet@baylibre.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230824164649.2914789-1-jbrunet@baylibre.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 24/08/2023 18:46, Jerome Brunet wrote:
> From: Alexander Stein <alexander.stein@mailbox.org>
> 
> Convert Amlogic AXG Audio Clock Controller binding to yaml.
> 

...

> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 29
> +
> +  # All clocks except pclk are optional inputs of the controller
> +  # which may or may not be wired in depending on SoC variants, boards config, etc ...
> +  # The order in which those clocks appear is unpredictable and does not matter.
> +  # Lacking a better way to describe this, the optional clocks are repeated 28 times.

Use pattern.


Best regards,
Krzysztof

