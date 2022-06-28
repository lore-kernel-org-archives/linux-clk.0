Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 52865C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 28 Jun 2022 06:58:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245570AbiF1G6x (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Jun 2022 02:58:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343825AbiF1G6k (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Jun 2022 02:58:40 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6123C2716D
        for <linux-clk@vger.kernel.org>; Mon, 27 Jun 2022 23:58:39 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id o16so16220562wra.4
        for <linux-clk@vger.kernel.org>; Mon, 27 Jun 2022 23:58:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=uWCwSBsZzcDsXerOmBKtj8q7pC0dytvTE5QF/VhPSWk=;
        b=uMaTZlsfbzqjhEiVTj0O/iYD7nAQ1DmFCBbQIqU/xo28jBNsxWPGVfaJ7JpKcO8PYx
         4WLYUtzmU7WIE1U0Zn9KXiJjDbJuqowo2U8MZ9vzM5HTlsMO4gCwYCI3SoiXVnlwjJ7v
         A/N7vLB8ANExEvDVKHqabUxGnYCgAnvGbXPDOZoWVY2/U3oH0futdZga/r+c1wdehzkS
         lf0rsv9tN5K/HXXZ4XsH1d2M/g/8QfZNBYbUTmQDYU4TA/Rzf0LuQrSi1zieE5SNIWsp
         7CJ9rkB5ecjFAnLkt1mVIB3m3xCl76+di0kDmoLgMVB/lu5/CCtqUF2BlZA9LZz7LEsZ
         I9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=uWCwSBsZzcDsXerOmBKtj8q7pC0dytvTE5QF/VhPSWk=;
        b=zXZLnhhRF0lLz5kVPhePzPUZn8qWkoE4v10PQsD7dXhwTjtNEU592P7ocKt4sY5Qhx
         QZ4gk1o6EUXnkrGb445tK4dhFHgC/NgtczeOx2EnwAzStwmlKJXp6IHqms42tBHFiY7/
         rzt3LIWF+tZNdvdeUO5eXMt/4Rqyv8QTfZkFithsLDz/c8Jh/Vj/El22IOPjn/QkEOYz
         VZ4drfF8m8eTyWK/LyISIWSHQCpF2U4T8nM4labjtnBHsCH6pGmf5ZXofbzgCQpIFYdv
         RZOnxu6WVMpZwgftmpaBqxRWN6tzE5+dIgHvbmlUlTI2ONe0SjT86mYo2fqHih60m2OW
         j7yA==
X-Gm-Message-State: AJIora+C94OLs++Pveo0aGv9UfGcW7Z5bJOpTcwk0SHJ+FT7fOnUq/SX
        7XkqoTm23hd++nMGY955LyJs4g==
X-Google-Smtp-Source: AGRyM1s2XUn6XqdPxK0J7NgHSR6nFE03RvtcwySu69kLez+73qYwJFz8S3w5dEWFd7y0gRbfY+UlcA==
X-Received: by 2002:a5d:4102:0:b0:21b:8a6f:ff64 with SMTP id l2-20020a5d4102000000b0021b8a6fff64mr15859102wrp.186.1656399517870;
        Mon, 27 Jun 2022 23:58:37 -0700 (PDT)
Received: from [192.168.0.251] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id t10-20020adfe10a000000b00210320d9fbfsm15092681wrz.18.2022.06.27.23.58.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jun 2022 23:58:37 -0700 (PDT)
Message-ID: <b0468d5e-fa2d-c874-3daa-6670509c15a0@linaro.org>
Date:   Tue, 28 Jun 2022 08:58:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
Subject: Re: [PATCH 2/3] clk: samsung: exynosautov9: add missing gate clks for
 peric0/c1
Content-Language: en-US
To:     Chanho Park <chanho61.park@samsung.com>,
        'Sylwester Nawrocki' <s.nawrocki@samsung.com>,
        'Tomasz Figa' <tomasz.figa@gmail.com>,
        'Chanwoo Choi' <cw00.choi@samsung.com>,
        'Stephen Boyd' <sboyd@kernel.org>,
        'Michael Turquette' <mturquette@baylibre.com>,
        'Rob Herring' <robh+dt@kernel.org>,
        'Krzysztof Kozlowski' <krzysztof.kozlowski+dt@linaro.org>
Cc:     'Alim Akhtar' <alim.akhtar@samsung.com>,
        linux-samsung-soc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20220627005210.6473-1-chanho61.park@samsung.com>
 <CGME20220627005413epcas2p37d6b3cbea055cecade47ad304b40b7e3@epcas2p3.samsung.com>
 <20220627005210.6473-3-chanho61.park@samsung.com>
 <6d7b0ea7-7918-aea4-6f2f-46d4870d92ad@linaro.org>
 <000301d88a94$37aa7320$a6ff5960$@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <000301d88a94$37aa7320$a6ff5960$@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 28/06/2022 04:10, Chanho Park wrote:
>> Subject: Re: [PATCH 2/3] clk: samsung: exynosautov9: add missing gate clks
>> for peric0/c1
>>
>> On 27/06/2022 02:52, Chanho Park wrote:
>>> "gout_peric0_pclk_1" and "gout_peric1_pclk_1" should be added to
>>> peric0 and peric1 respectively.
>>
>> Where is exactly the bug? The commit msg suggests that they were added to
>> different block, but there is no code removal.
> 
> I thought they should be added from previous patch because clock IDs were existing without implementations.
> I can drop fixes tags next patchset.

The clock IDs as bindings can be added upfront - it's independent from
implementation. Please drop the fixes.

Best regards,
Krzysztof
