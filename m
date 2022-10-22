Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C2A20C38A2D
	for <linux-clk@archiver.kernel.org>; Sat, 22 Oct 2022 00:41:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230027AbiJVAlL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 21 Oct 2022 20:41:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230013AbiJVAlJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 21 Oct 2022 20:41:09 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 142F9FAE4F
        for <linux-clk@vger.kernel.org>; Fri, 21 Oct 2022 17:41:05 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id j21so3083663qkk.9
        for <linux-clk@vger.kernel.org>; Fri, 21 Oct 2022 17:41:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=RrPjIQcXUTVTQbLthehjSdVtJ5wsCBFGwdqvbET3Nv4=;
        b=uT4tEVDvrXXsIXLYLHC/+JilwU8FMbcbfjqAEp/aD4vUyde7trCRpCmJ40r2iekff+
         E/1KOxu5YgexrykOsTc4YeQzEGCMJMkfzVzMnT5zPzbMyLc10EO3OdT6pPKQ24kR8KI5
         ++LqaKPkR356Wwf4gX/48JgCN2mOAhrx1ImM5imLBxeJeT0qyAMXSY6fKfFItKKy+t+A
         eBP358K1vY6Tr8PrveFnyqpdec2Y8ws/UvrnCaP/li7xvG3CPm7dZ4dYEkEPN7tZDX1c
         MkWOWV7kBsXOoW9NSeFYG0tysE4RDZuqepX+ApjEMHI77lud9YXGL/Bfw18oh796Ws07
         Xifg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=RrPjIQcXUTVTQbLthehjSdVtJ5wsCBFGwdqvbET3Nv4=;
        b=J+7L0BF+1pOPZMcGVk0PuPuLRB/MRt1vcTPZjM8++Vu1zUgh7QL1JS7yvXSHRN2hmK
         3Q/UhLmSjk8l2j1KMQGz6HDVu1TN7gtoSpJEEzPhNkcmQqNaRoqJfAG3IiddTQBtc0Oc
         i7kS6qRIuRwX5NXL1Y7/6ACYdJCeQvsjF2r6tPsW7jhn3aUwa96mQTjm7FAXE4AWC50M
         9S1S9e3+Tq5arb2CWvGoHs4O2WgSSGq7q/lk9cmRusqf1HNCVMJ5+2WWKTcHH+fzp+5I
         vTTScVKCQHz5mGEx3qS4zefsuARJjvJtS4wQlTbV5h+1F+0lNqum0wJlx29QYskzZ8aF
         8KfQ==
X-Gm-Message-State: ACrzQf3BUINk9ETkRiatfb7gy7ZCXRNpXQwTIIZpUm7GNourWrLqNInu
        tSavIO5jXmgkYtM8J1eoZagL5g==
X-Google-Smtp-Source: AMsMyM7ykfJjUZmYjeyoc8pHNbxFeVP6AU7RqpZSlor378l+nEizeZzw9rnBwLc5aiiGfYCyYMAA4g==
X-Received: by 2002:ae9:ef4e:0:b0:6ee:80b6:2ee4 with SMTP id d75-20020ae9ef4e000000b006ee80b62ee4mr15503825qkg.126.1666399264741;
        Fri, 21 Oct 2022 17:41:04 -0700 (PDT)
Received: from [192.168.10.124] (pool-72-83-177-149.washdc.east.verizon.net. [72.83.177.149])
        by smtp.gmail.com with ESMTPSA id br44-20020a05620a462c00b006bbb07ebd83sm10201344qkb.108.2022.10.21.17.41.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Oct 2022 17:41:04 -0700 (PDT)
Message-ID: <977ecc3e-c5d8-dae9-149e-5ff4e7f30130@linaro.org>
Date:   Fri, 21 Oct 2022 20:41:02 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v2 1/1] dt-bindings: clock: ti,cdce925: Convert to DT
 schema
Content-Language: en-US
To:     Alexander Stein <alexander.stein@ew.tq-group.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org
References: <20221021064757.379558-1-alexander.stein@ew.tq-group.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221021064757.379558-1-alexander.stein@ew.tq-group.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21/10/2022 02:47, Alexander Stein wrote:
> Convert the TI CDCE925 clock binding to DT schema format.
> Including a small fix: Add the missing 'ti' prefix in the example
> compatible.
> 
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
> I have to admit I only have one specific addon platform for this
> hardware, which is actually a CECD813 tbh.
> 
> Changes in v2:
> * Fix bindings title
> * Removed nodename pattern
> * Add 'additionalProperties: false' for PLL subnodes
> * Fix typo in required list
> * I added myself as maintainer


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

