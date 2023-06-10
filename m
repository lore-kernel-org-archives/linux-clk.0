Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 896E2C77B7A
	for <linux-clk@archiver.kernel.org>; Sat, 10 Jun 2023 16:38:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229461AbjFJQib (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 10 Jun 2023 12:38:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48490 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230041AbjFJQi3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 10 Jun 2023 12:38:29 -0400
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com [IPv6:2a00:1450:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 97E11359C
        for <linux-clk@vger.kernel.org>; Sat, 10 Jun 2023 09:38:26 -0700 (PDT)
Received: by mail-ed1-x534.google.com with SMTP id 4fb4d7f45d1cf-5148e4a2f17so5021053a12.1
        for <linux-clk@vger.kernel.org>; Sat, 10 Jun 2023 09:38:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686415105; x=1689007105;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=o5Z8VlvkCStH7vxf1jFhlFENo/0pPXJ8U3fEycKzrWA=;
        b=PRoSKAG2RDvzzPUABOLOymit81bQYaB+0lNRFd6731dseHDZ5c8naeisILruqRSdA1
         ie+Q3Hbq9Wlvbb6x80oshl7FDG/DXYC1CIeUUugs49wKb4IFvS2KVkfMl4Nuw3jDnS8q
         CYHw+zfbxckF74Rz7FT716uIhU3f66A71BEbGTIBGunm68/5s6R9U9xq++RgkwRwIDqF
         tNREd/ZsLYzOZjKvoVuZ2WRKRKfhsCJH6l1Qhai8j8hoF+8Qkt1HtDUg6rYkOPGV0h5A
         JKljseim/7VvNNQ5N6SVBDR5Qw2oxcqpvgnGGKUQ6lWpGZCWvV+9BKM81dmanrqkYpSD
         65uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686415105; x=1689007105;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o5Z8VlvkCStH7vxf1jFhlFENo/0pPXJ8U3fEycKzrWA=;
        b=AtFqKrQskDSHGNnWW4/eCwbV/b/+boKwdhV/uaw/pxKyIa61NwSm7BHGK2gflzfAY8
         FsT8qTPfkJzVyufc2GOdTRn6O26eY1F8aCX6oi8CP9cUSi2C/xDM3mH795+n024w0rgY
         b450oreefFxvJighJk4zkn3xaUfJNgbm9R4FRO5wCIQXb8Py6UJ98t6ld37HhTm4Nanq
         kr99ABhIw+MII5b7fWngOsdoJIPsvnUMSfcc+i+6Vj6EXmBlsqKV8L1v6lJcevVlvXT/
         N+hZViZRdepNF0RTnv8+NRnqZvRrWnfu9xyeOtBduQkgPumgEC0GlQAevDbpYhMP4Umz
         pZMQ==
X-Gm-Message-State: AC+VfDxzJBT7/9I5sn0SUevNuktaR/GVT7Th1A1HRVVT7Fu/bVWsRtf2
        KxCmGMRBFsG8UEpl4MzAJPtWZQ==
X-Google-Smtp-Source: ACHHUZ506o3wBTlotTQVHg2X72UPSYjMikadLcES55vMuL13uBnezt6/6muniiigdJhpo1pXJ5vzLg==
X-Received: by 2002:a17:907:1b0b:b0:978:6a98:a019 with SMTP id mp11-20020a1709071b0b00b009786a98a019mr5275123ejc.33.1686415105087;
        Sat, 10 Jun 2023 09:38:25 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id a18-20020a170906469200b00966265be7adsm2752005ejr.22.2023.06.10.09.38.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 10 Jun 2023 09:38:24 -0700 (PDT)
Message-ID: <e69cf560-4cd2-4b80-97c8-3f02a4118982@linaro.org>
Date:   Sat, 10 Jun 2023 18:38:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 08/18] dt-bindings: clk: g12a-clks: expose all clock ids
Content-Language: en-US
To:     Neil Armstrong <neil.armstrong@linaro.org>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Kevin Hilman <khilman@baylibre.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>
Cc:     linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
References: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-0-9676afa6b22c@linaro.org>
 <20230607-topic-amlogic-upstream-clkid-public-migration-v1-8-9676afa6b22c@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230607-topic-amlogic-upstream-clkid-public-migration-v1-8-9676afa6b22c@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 07/06/2023 12:56, Neil Armstrong wrote:
> Due to a policy change in clock ID bindings handling, expose
> all the "private" clock IDs to the public clock dt-bindings
> to move out of the previous maintenance scheme.
> 
> This refers to a discussion at [1] & [2] with Krzysztof about
> the issue with the current maintenance.
> 
> It was decided to move every g12a-clkc ID to the public clock
> dt-bindings headers to be merged in a single tree so we
> can safely add new clocks without having merge issues.
> 


Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

