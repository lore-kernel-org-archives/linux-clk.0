Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AAF0C433EF
	for <linux-clk@archiver.kernel.org>; Tue, 18 Jan 2022 18:45:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348171AbiARSpP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Jan 2022 13:45:15 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:44338
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232540AbiARSpP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Jan 2022 13:45:15 -0500
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id A48AC4000F
        for <linux-clk@vger.kernel.org>; Tue, 18 Jan 2022 18:45:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642531513;
        bh=8osQ58FXOlPLsyJtfHmM/yZUY3A/YErqa44d4fjUxZo=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=BBOFCz9+SDyR8BQ2W7s9RkXktoZQMFLn/VsJ38oYRl4PZ6DQhRBFwGExiEXGLMEMB
         nQJ/6pGTE/k5iImmpwihfPXqdJCxMsrvPLNjcd1UjMSrpbf0gkw4bHXjJkGijTyNrm
         0YhyJ+9bnqwrlMOLf8Cp9cmpbyl/MHQoJ8oODLghAD6WO5dMbnxA55SsdsxHl2tNZe
         fdfqB0lRVVcuORlZTtcRwvvKyYv2/izveSZx68waHkFdb6JyGYUDTU5uRVnmaIyabf
         vI/NmperPO1JbitGM3uDyCfpfyCa8tJYvev7ImVYmekcPJvkcglYp4T4qwTfJpAr+1
         gj3ZzcDbJdqhw==
Received: by mail-ed1-f70.google.com with SMTP id bm21-20020a0564020b1500b00402c34373f9so5698560edb.2
        for <linux-clk@vger.kernel.org>; Tue, 18 Jan 2022 10:45:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=8osQ58FXOlPLsyJtfHmM/yZUY3A/YErqa44d4fjUxZo=;
        b=b1nr5OVOzLibsj42ZNKmVWgFP0Wq5UV50/RAfgQIan6zNz9G/o/ewi747ANVLKkTIs
         4QGWUYerhPg5Uw9JlKd+oPhqgtl+Y+f7qErlM2RC07lI8N80ynarwQRobmcOBic2cbcn
         eEJLnOvrlPbCrowC1fRspGfuPm07Pu3Kj4AFCpVsk9O7INg6VA9nUkmbT4Yhv45R+o3i
         73E/xGav1Y/JiJMRGwWJm+e3ZAAyzfcbwppQcd1M2ysd5Y7pbR3Ou7Ij7/5ca5oYiBLg
         Am/jfOxqu+bIfMqyoe3KnoU6jx6RGvNOHFamB+CZcQ+7VLvP0S5Da18+DoOeYAugEapQ
         1dSw==
X-Gm-Message-State: AOAM531+4JDPC5zvTYxgrWYmfB4LQagrF8vSTdm2+8uYa3Oey28wQRLA
        YOynCuBmttemJVEZBfAMLNdZuiTFOeHFVSNjsGfQpxjO7E9K9sd7CjxCS+mfFNBkRwsj2xdOZ5i
        F33EEw6o3EgvytFd/zCokjp20AASDyPsq7yqzXw==
X-Received: by 2002:a05:6402:2803:: with SMTP id h3mr27373596ede.241.1642531513207;
        Tue, 18 Jan 2022 10:45:13 -0800 (PST)
X-Google-Smtp-Source: ABdhPJx0Sfnsmx7DF4yXoTCVe+Weay6/LhuR9yDgGS2HHh01RVl40jGVz2Nf6Gg8Nhp5upcIJt2wHg==
X-Received: by 2002:a05:6402:2803:: with SMTP id h3mr27373579ede.241.1642531513056;
        Tue, 18 Jan 2022 10:45:13 -0800 (PST)
Received: from [192.168.0.42] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id k16sm5671861ejk.172.2022.01.18.10.45.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jan 2022 10:45:12 -0800 (PST)
Message-ID: <43e72d34-0e11-9ff6-6924-0cab62b51891@canonical.com>
Date:   Tue, 18 Jan 2022 19:45:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 14/16] arm64: dts: fsd: Add initial device tree support
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     soc@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, olof@lixom.net, arnd@arndb.de,
        linus.walleij@linaro.org, catalin.marinas@arm.com,
        robh+dt@kernel.org, s.nawrocki@samsung.com,
        linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
        linux-fsd@tesla.com, Arjun K V <arjun.kv@samsung.com>,
        Aswani Reddy <aswani.reddy@samsung.com>,
        Ajay Kumar <ajaykumar.rs@samsung.com>,
        Sriranjani P <sriranjani.p@samsung.com>,
        Chandrasekar R <rcsekar@samsung.com>,
        Shashank Prashar <s.prashar@samsung.com>
References: <20220118144851.69537-1-alim.akhtar@samsung.com>
 <CGME20220118150108epcas5p2d9cd4db7cb368c2bfbd7d058eba4107c@epcas5p2.samsung.com>
 <20220118144851.69537-15-alim.akhtar@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220118144851.69537-15-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18/01/2022 15:48, Alim Akhtar wrote:
> Add initial device tree support for "Full Self-Driving" (FSD) SoC
> This SoC contain three clusters of four cortex-a72 CPUs and various
> peripheral IPs.
> 
> Cc: linux-fsd@tesla.com
> Signed-off-by: Arjun K V <arjun.kv@samsung.com>
> Signed-off-by: Aswani Reddy <aswani.reddy@samsung.com>
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> Signed-off-by: Sriranjani P <sriranjani.p@samsung.com>
> Signed-off-by: Chandrasekar R <rcsekar@samsung.com>
> Signed-off-by: Shashank Prashar <s.prashar@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  MAINTAINERS                           |   8 +
>  arch/arm64/Kconfig.platforms          |   7 +
>  arch/arm64/boot/dts/Makefile          |   1 +
>  arch/arm64/boot/dts/tesla/Makefile    |   3 +
>  arch/arm64/boot/dts/tesla/fsd-evb.dts |  39 ++
>  arch/arm64/boot/dts/tesla/fsd.dtsi    | 651 ++++++++++++++++++++++++++
>  6 files changed, 709 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/tesla/Makefile
>  create mode 100644 arch/arm64/boot/dts/tesla/fsd-evb.dts
>  create mode 100644 arch/arm64/boot/dts/tesla/fsd.dtsi
> 

I saw you dropped the MCT timer from DTSI. I wonder why?

Not very happy with FSD naming (as discussed before), but board
compatible looks reasonable. Code looks good to me:
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>

Similarly to previous vendor-prefix patch, please let me know if it's
expected me to take it. I assume no. :)


Best regards,
Krzysztof
