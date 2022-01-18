Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 137E8C433F5
	for <linux-clk@archiver.kernel.org>; Tue, 18 Jan 2022 18:38:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348155AbiARSir (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Jan 2022 13:38:47 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:36822
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S244540AbiARSio (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Jan 2022 13:38:44 -0500
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id E86EA3F1E2
        for <linux-clk@vger.kernel.org>; Tue, 18 Jan 2022 18:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642531123;
        bh=qiMWFcACm7KXDNL4mR8VjkWhK+rixFnnFkcu11vXqgg=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=UMOSFwjtG3OWbfZxoVOGtgDtGMa5rCRtEB9Hihx+m7MMOIaVDKBifxc2CSJL72GsZ
         8LNzGkuaXqjdNPkNDWobun52UIf0Lqx0sLuEh4zf5nzK83npBxiBAEDBjVg8WUTZST
         UCyDSbrnFjnkUaR26drB0CU2UqnPsQd00nzzRf3tiSQG60IFO3MMgps2+9D980lHDL
         FjNeNkQ+ym9T0qfR3HQguVBknXpJCTHxS8HKHACfTQySe8FY08AURoXzWPHqyTxzYL
         z+m6qSCxtpB1beTypIcRfDG4XoPYLYdGRrtcOEfe5jvw7/4IIv/SkSjMZm4+YmJmQj
         jXbpzpnoQf5Xw==
Received: by mail-ed1-f70.google.com with SMTP id o10-20020a056402438a00b00403212b6b1aso4740989edc.13
        for <linux-clk@vger.kernel.org>; Tue, 18 Jan 2022 10:38:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=qiMWFcACm7KXDNL4mR8VjkWhK+rixFnnFkcu11vXqgg=;
        b=JhDdxv295Bv8ptfrLDXYuSSunjgBk0uuefM4tmkWot2V/1+kKbwMr//cGtbfk6am6J
         Txvj0slxh0ht5HxXxs/hCD/kt/dJA5Ll+5wRPQdnwrv2dBwvr9tK//1g73DWAz593Ayz
         I2lxqv0DUAmCLHUnKKJkuvvSY7Kouw2pTrvfjtDlArMZmq9t06HJqDM78DbYFkMRncP6
         pDAtnz6V2QMZJkzHFAtpKq9vSOgepv+5ISdijiJN2/JFI1ruIowuHxbI7Pxr9vjNDJ0R
         P9KzoWfgwlg7tsquZERDPg4IyjWOyoa/dnNMBIALu1qKj9Mgu+qeE2Jbi4tPmWkSJ43d
         pjBg==
X-Gm-Message-State: AOAM5304aqE0bCTTL7qIySiAHEZKgV6yM5GtDEM6J/iIrbXkOp1npaST
        66/IggLCJTkg6z4tG3IFodjH7K2R8Cx1bHD+sU1dDOGZ+ZqCRjZGE74zcVYHWWFJZafPshyqrQw
        Ri38mzOseei4RfkuUm2wTQntuFxWq4c1W1m0iSw==
X-Received: by 2002:a05:6402:13d4:: with SMTP id a20mr24451516edx.233.1642531123691;
        Tue, 18 Jan 2022 10:38:43 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxooD5A0kIvNYe5f8A0rLWxL+hfWG//ldtWWszWaLLfWPoEYsl9gzRPsANc68kPgrb0WUfY1w==
X-Received: by 2002:a05:6402:13d4:: with SMTP id a20mr24451497edx.233.1642531123570;
        Tue, 18 Jan 2022 10:38:43 -0800 (PST)
Received: from [192.168.0.42] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id f5sm199260edu.38.2022.01.18.10.38.42
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jan 2022 10:38:43 -0800 (PST)
Message-ID: <b165825c-a04f-d5bd-6bce-8725acdc461d@canonical.com>
Date:   Tue, 18 Jan 2022 19:38:42 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 11/16] dt-bindings: pinctrl: samsung: Add compatible
 for Tesla FSD SoC
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     soc@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, olof@lixom.net, arnd@arndb.de,
        linus.walleij@linaro.org, catalin.marinas@arm.com,
        robh+dt@kernel.org, s.nawrocki@samsung.com,
        linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
        linux-fsd@tesla.com
References: <20220118144851.69537-1-alim.akhtar@samsung.com>
 <CGME20220118150056epcas5p4825077a17b8c37b0e7cea60c4dced3c8@epcas5p4.samsung.com>
 <20220118144851.69537-12-alim.akhtar@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220118144851.69537-12-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18/01/2022 15:48, Alim Akhtar wrote:
> Add compatible for Tesla Full Self-Driving SoC. The
> pinctrl hardware IP is similar to what found on most of the
> exynos series of SoC, so this new compatible is added in

s/exynos/Exynos/

> samsung pinctrl binding.

s/samsung/Samsung/

> 
> Cc: linux-fsd@tesla.com
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  Documentation/devicetree/bindings/pinctrl/samsung-pinctrl.txt | 1 +
>  1 file changed, 1 insertion(+)
> 

It seems that I will take my dtschema patch (together with pinctrl
driver changes) after merge window, so this will have to be rebased on
new dtschema.

Best regards,
Krzysztof
