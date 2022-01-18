Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8505C433FE
	for <linux-clk@archiver.kernel.org>; Tue, 18 Jan 2022 18:48:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245297AbiARSsw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Jan 2022 13:48:52 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:44554
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244907AbiARSsv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Jan 2022 13:48:51 -0500
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com [209.85.208.69])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id DBFB63F19C
        for <linux-clk@vger.kernel.org>; Tue, 18 Jan 2022 18:48:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642531729;
        bh=osZDE2qGikhWPKRozLWA0fiHv6mtb/zkWnvdgeIXyQ0=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=tn708PlEAXS3uC9b/0dBREp55C1djsNVY6cjpTGDfyRhqZ1qBj7erMBxq7AeCmQ6i
         xRdG2f/lw7eZydQ0p4PL9B38awbt1cUUppkysn/IAsMQvScmMKyks9/8AKHpSCARoX
         Lnw43+1ZPsoJgErVVt4N6ivDlCBHRRfcC/fW5Rj1XcVYcngiX8VRsYPMAswBqUPGBm
         MQdT4HbJa+CZnOlkpSux6TGaQ3QwxOvUHryJe3Bzsvif1jhjRgNhoWjJEQ+4FtGt03
         nN0aEsMH5JdhjDUmRSJzLBwaV6b45QAcXY3G8cgPtbSIKf9R58+1Buf68xkRhm0Qmw
         DmKxbhKq1g4Ig==
Received: by mail-ed1-f69.google.com with SMTP id h11-20020a05640250cb00b003fa024f87c2so17892755edb.4
        for <linux-clk@vger.kernel.org>; Tue, 18 Jan 2022 10:48:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=osZDE2qGikhWPKRozLWA0fiHv6mtb/zkWnvdgeIXyQ0=;
        b=4AGZw8+oCI24cYnCLGCMC7mgVIlDc4AgWyLfeVfDRu8sM/fLO5mT6vn2buj7ZzlhNz
         cVuznSx+KkCo2aZpbO4XsCdVKpj/SpfQ8e34AKfBj4Yz7sSG0MQEMAjVAwwYo9ZKHF0F
         wCHknbmn9rpRBWI13NApcDfcUFkmYY4UjupU73Z2CW7zeazVx7vNK+t6YvUKIXQhSMXe
         HQRDuIcN+ptxVU/C3dsgzqIq6qskdI4jyfERxHCHSjNSVZeSz/2BBkOxpTQBIGjdfiwm
         PkKSU9DRmhwY6eHs2FfKZgTfB2578VGNSPcQL/kFlMEJcjihCQ+n4m6zYqlj+yYdc665
         zJ+A==
X-Gm-Message-State: AOAM532EljVZfvTEsDIwlbaqXHCI9XWehJYmj7ecMONMCtHaPMCXAnUo
        rW7AQN09b0bj+HRP+ljrMY24tRa7Irnc9jxelB9Gti65We+Y4E0f9UD4Vymfb7JLo8iqcXNIVNe
        C0cH2zsO618Sen5HUfoZKhj29q9kjgWv3dmCMHQ==
X-Received: by 2002:a17:907:a41e:: with SMTP id sg30mr20960068ejc.249.1642531729182;
        Tue, 18 Jan 2022 10:48:49 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxpN3EF5AfOUem/IDvegEXyXvqnsF247GmVHd467UwQ9IoE4dMFmiP2V+P6uDursbIxrwr+/w==
X-Received: by 2002:a17:907:a41e:: with SMTP id sg30mr20960052ejc.249.1642531729018;
        Tue, 18 Jan 2022 10:48:49 -0800 (PST)
Received: from [192.168.0.42] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id ga7sm5590389ejc.50.2022.01.18.10.48.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jan 2022 10:48:48 -0800 (PST)
Message-ID: <a1ca1ad2-5e24-0cd4-cbf2-bdf867cccbd7@canonical.com>
Date:   Tue, 18 Jan 2022 19:48:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 12/16] pinctrl: samsung: add FSD SoC specific data
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     soc@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, olof@lixom.net, arnd@arndb.de,
        linus.walleij@linaro.org, catalin.marinas@arm.com,
        robh+dt@kernel.org, s.nawrocki@samsung.com,
        linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
        linux-fsd@tesla.com, Ajay Kumar <ajaykumar.rs@samsung.com>
References: <20220118144851.69537-1-alim.akhtar@samsung.com>
 <CGME20220118150100epcas5p3b7cf28e13fd177336dc9b06875d94f43@epcas5p3.samsung.com>
 <20220118144851.69537-13-alim.akhtar@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220118144851.69537-13-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18/01/2022 15:48, Alim Akhtar wrote:
> Adds Tesla FSD SoC specific data to enable pinctrl.
> FSD SoC has similar pinctrl controller as found in the most
> samsung/exynos SoCs.

s/samsung/Samsung/
s/exynos/Exynos/

> 
> Cc: linux-fsd@tesla.com
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Ajay Kumar <ajaykumar.rs@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  .../pinctrl/samsung/pinctrl-exynos-arm64.c    | 71 +++++++++++++++++++
>  drivers/pinctrl/samsung/pinctrl-samsung.c     |  2 +
>  drivers/pinctrl/samsung/pinctrl-samsung.h     |  1 +
>  3 files changed, 74 insertions(+)
> 

Looks good to me. I'll take it via Samsung pinctrl tree after the merge
window.

Best regards,
Krzysztof
