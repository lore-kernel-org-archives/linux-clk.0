Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30E4DFA373F
	for <linux-clk@archiver.kernel.org>; Sun, 23 Oct 2022 15:34:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230167AbiJWPeA (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 23 Oct 2022 11:34:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230235AbiJWPd7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 23 Oct 2022 11:33:59 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6DECD7646F
        for <linux-clk@vger.kernel.org>; Sun, 23 Oct 2022 08:33:57 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id h24so4461691qta.7
        for <linux-clk@vger.kernel.org>; Sun, 23 Oct 2022 08:33:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=25kVQPQG2znFAF9RxCCNUOxMKGya3FwJ+y6I9/YjZ3g=;
        b=cJc/VzN5gpUzhU64fYp5atWXE1bdvd50oacKDPWZR3CkPaHgchhB+GMa9sud5EBjzE
         Qw17HIXtXiEu7cub8VNj/py/htxJfniIrX5Db+lp5gv8CRj54wVsEBA8fDtxuDCD5Rql
         TWklIU1edzHaKXXsrsAa6GuNg2YlNpkrucCWHFURkxGuu2LY1f+oOCrsr8np0MvtfkQy
         EF67TlXPQi9wL/09bSN57CvYs38TmA4gGSfGs+1C3rzvtgSGnO4S0PDBmMKUqfQWX3Zx
         zF5VF+l6nS+uI3OEsrvcOiwbtQBnIHAVQZbTH95OIQzMBoPe46LMzpopD6MtsfYpmJaA
         Ewig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=25kVQPQG2znFAF9RxCCNUOxMKGya3FwJ+y6I9/YjZ3g=;
        b=lPSh3NT3Ox8DILyWIkg7Yx0RURH0cKv1JiZiilOc3YK5TRnCUKiQusihID/wQa3xWk
         zVQYL9YSsF8sdDeSRstEEmaqgQwLQg/fVfwhqE7RYn7CI82cY4XjwXBdEQuDmpKg+pJ3
         1mJhCsIR0p7Y7soS4aJODkesSqe/4s2goLJRbMhAIWdj44WFeT9Tj7l/VtHv4p/z86lv
         CjV7KbESKLMLccuKMNI4VkL3w5AufLL568v0F6LTfGOJDmVRsHDep/cxrxYVmtZLwaes
         07XSgEy+Et1ZupRGH1eeXTX3mEegqo05Ypt4qzoQONkkH6nEDD3aklvEkRPL4QAZT1Kk
         yQ9g==
X-Gm-Message-State: ACrzQf0KKw6rcgo9lOPnTl1KIrD/vR75FjN5Xiea+gJRF5vQwtxKESDl
        VwAt4vNkl93G8figNrxTfZTeTQ==
X-Google-Smtp-Source: AMsMyM6swSIg2sGVruIpJY6Rp2ZQxDPnIP4a+ggvbvy5C9Vy1hEqWe61Vv2Gdgvdonhozz5yuBCSGQ==
X-Received: by 2002:ac8:4e90:0:b0:39c:f65a:3376 with SMTP id 16-20020ac84e90000000b0039cf65a3376mr24038567qtp.228.1666539236624;
        Sun, 23 Oct 2022 08:33:56 -0700 (PDT)
Received: from [192.168.1.8] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id x5-20020a05620a258500b006bb366779a4sm13033072qko.6.2022.10.23.08.33.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Oct 2022 08:33:56 -0700 (PDT)
Message-ID: <50000fa9-74bd-d837-db5c-a38d470c069d@linaro.org>
Date:   Sun, 23 Oct 2022 11:33:54 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [PATCH v4 1/3] dt-bindings: ingenic: Add support for the JZ4755
 CGU
Content-Language: en-US
To:     Siarhei Volkau <lis8215@gmail.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Paul Cercueil <paul@crapouillou.net>,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org
References: <20221023131331.4107782-1-lis8215@gmail.com>
 <20221023131331.4107782-2-lis8215@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20221023131331.4107782-2-lis8215@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23/10/2022 09:13, Siarhei Volkau wrote:
> Update documentation prior to adding driver changes.

Instead you should rather explain what you are adding - what is this
hardware. What if you want to add it without driver changes?

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

> 
> Signed-off-by: Siarhei Volkau <lis8215@gmail.com>
> ---


Best regards,
Krzysztof

