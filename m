Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D7FEC43219
	for <linux-clk@archiver.kernel.org>; Thu, 13 Jan 2022 12:27:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231135AbiAMM1d (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Jan 2022 07:27:33 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:53508
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230253AbiAMM1b (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Jan 2022 07:27:31 -0500
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 5FB65402A9
        for <linux-clk@vger.kernel.org>; Thu, 13 Jan 2022 12:27:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642076850;
        bh=nWMCwBQ8qvto3g6GTsUmmbjQ5M6s0nUnB5kDMDyzI/g=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=NY2XkyypJfAUe+CR4evsCF0239IV6QOdkIjIG6Z0SDuWUOEmuXSP4aKUHCiUQiTRv
         KOz42HUCybFssrJcYYyJGXQC2KeVjmt6MdLxsxgSaHZiv/oD6TN64k2kzCzN2kff3X
         1YPhUYKjauzNSREqMoY6fS2dEDAJ9r/8q/93wSuFxSJWO3xZkUUp1Xe4sq7dmXzp8b
         5J2SkFWMkKe+nqFlWGj9P3/Uihe1MpKe/9BdR18WpnmYCUlycDSD0AGq4DGFeEgdu2
         sxC/ZMvhYu9fYi8JnMWz63GLGO/GTaxNALPbezrAL7CxqH8ZgKEVkFtIz3mH0YRW68
         VDN54OKE1XHwA==
Received: by mail-wm1-f72.google.com with SMTP id m9-20020a05600c4f4900b0034644da3525so3519362wmq.3
        for <linux-clk@vger.kernel.org>; Thu, 13 Jan 2022 04:27:30 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=nWMCwBQ8qvto3g6GTsUmmbjQ5M6s0nUnB5kDMDyzI/g=;
        b=rlv/r7l2UKtf7JtQOcwdCfvLTAtk/mHl5n+pds6BETMpocRGxdSNhek9FcunRsqXzl
         FPG0tFqvznhjBHP7duhaJxsu7L3cv6zJdTjK44M3YjwP9ipBaBvnegRA+7Pq8MieWap6
         VtOP3Pwuw3qrqGmC30xeePdgF0oFdXs6LEYnZcBx5Ejy+7gavRUghbII3rcKtgaR2xwY
         Xwp093rHzJDoadqTVoeiR86jOyXKZ9QUKKSQv+Y064WfnKZvS8N8TP2lRvAPQIY8wxME
         ksscpwEpYOJ/HWHuvGil6VCDEaUiuJ3drlxNtfzV6qqTn9JO4GHHxX3xehHimqhM9NjR
         UFzA==
X-Gm-Message-State: AOAM5325kaI6Kq3jtTjp2UmPHJJLtOrpfglH1UZWPB03+lnxfbjHLK1l
        WyJhMtNbRw98tK6k75pOUfRW2LIsxf4ITFqp9woZ2kplVAJzoX2C24NqyqzHgu0nJD6VXWJ3CLg
        mui/+7lUpoLzoErrAiKRgbu+TBgtO3GAIAiJ88A==
X-Received: by 2002:a05:600c:602a:: with SMTP id az42mr3740592wmb.27.1642076850019;
        Thu, 13 Jan 2022 04:27:30 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzedcYD/WlL7vOvIVMshZ/IWP+2akJUFLDFNrlxlTqOjVhXt7ld4JHBwe6pD2xPZ5jcRCsI9A==
X-Received: by 2002:a05:600c:602a:: with SMTP id az42mr3740566wmb.27.1642076849775;
        Thu, 13 Jan 2022 04:27:29 -0800 (PST)
Received: from [192.168.0.29] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id c7sm3267537wri.21.2022.01.13.04.27.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jan 2022 04:27:29 -0800 (PST)
Message-ID: <849c7772-0f7e-32ff-6ea6-c46aa6837bb4@canonical.com>
Date:   Thu, 13 Jan 2022 13:27:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 10/23] dt-bindings: pinctrl: samsung: Add compatible for
 Tesla FSD SoC
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     soc@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, olof@lixom.net,
        linus.walleij@linaro.org, catalin.marinas@arm.com,
        robh+dt@kernel.org, s.nawrocki@samsung.com,
        linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
        linux-fsd@tesla.com
References: <20220113121143.22280-1-alim.akhtar@samsung.com>
 <CGME20220113122354epcas5p19e5cebe9e85e9ba1758fa0b9d7d1ef75@epcas5p1.samsung.com>
 <20220113121143.22280-11-alim.akhtar@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220113121143.22280-11-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13/01/2022 13:11, Alim Akhtar wrote:
> Add compatible for Tesla Full Self-Driving SoC. The
> pinctrl hardware IP is similar to what found on most of the
> exynos series of SoC, so this new compatible is added in
> samsung pinctrl binding.
> 
> Cc: linux-fsd@tesla.com
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
> index b8b475967ff9..ba972998a0e4 100644
> --- a/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
> +++ b/Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt
> @@ -24,6 +24,7 @@ Required Properties:
>    - "samsung,exynos7-pinctrl": for Exynos7 compatible pin-controller.
>    - "samsung,exynos850-pinctrl": for Exynos850 compatible pin-controller.
>    - "samsung,exynosautov9-pinctrl": for ExynosAutov9 compatible pin-controller.
> +  - "tesla,fsd-pinctrl": for Tesla FSD SoC compatible pin-controller.
>  

Please rebase this on my latest Samsung pinctrl dtschema patches. You
also need a tesla vendor prefix patch (separate).


Best regards,
Krzysztof
