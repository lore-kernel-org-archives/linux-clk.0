Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CEF99C4332F
	for <linux-clk@archiver.kernel.org>; Thu, 13 Jan 2022 13:30:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235155AbiAMNaL (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Jan 2022 08:30:11 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:56278
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235150AbiAMNaK (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Jan 2022 08:30:10 -0500
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com [209.85.208.70])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id D48B7402A5
        for <linux-clk@vger.kernel.org>; Thu, 13 Jan 2022 13:30:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642080608;
        bh=Gdbdjf8zVy+P14tpf21E4rjEbB+nBaQfGlpLQYdJfQ0=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=C8eWvpPY71qN+Qddb2gZiPAZvv95C6kkV5Et9K8HzOGSXj5V0LcbaEBUjWJtWLSWP
         QzjlCHIuZsW2DLelfYVLecydqlvSn026GwjsqBxiJiA4YG8Bvw4uaqCw4nJp2vXkRJ
         xNSIOckx9a8XYLjW1BIVzql39jskEWOmP4oRiLuprYHKJicK6o4LGdNgqXQ75ioCmx
         0NnUMhcc3vIrqRAKSCoraeX4TT9xdHzt4fviBrCRnE2DqlWsgVyF0wV/wyek/YaOTg
         J482UGF6JMxYKX9b0+bt7QMrHVM/lge6bHnzee/qX8MOcQv4O4AwB5zjWQIthq/Vzl
         d+AqsCGVFlObw==
Received: by mail-ed1-f70.google.com with SMTP id z9-20020a05640240c900b003fea688a17eso5349436edb.10
        for <linux-clk@vger.kernel.org>; Thu, 13 Jan 2022 05:30:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=Gdbdjf8zVy+P14tpf21E4rjEbB+nBaQfGlpLQYdJfQ0=;
        b=R/pVQ1ydGWTzNG1sKhAAMucuWRXLYH18RUCj9PJPnUWxuypGghFYKp24uqnmsAek8Q
         AAskm5bO+0b9fC2WzpRqenOsECNsm2jXPZ+5rlQbB7ZjeDhUQWLN0xGrOP+xa40j9R6k
         DtPcR779I45GutcKKEUk1TDYrgo+AI1n8eQQJthecPBRA2yV/aRCWyx77OTv2rutlBdg
         GTR8Xtk5b+It3Vua5enUICURhrSuJfW4+qRRIAtAfqB0smcb/uykiQSied+9Ub2CQmne
         0smoGDdaF9AxYgooPzgmb4QEOv7thihXUVj+lU+Q7gvRz94F/VXbFlFJMlfh7r39Sr0g
         LoPw==
X-Gm-Message-State: AOAM530puB5+44nFFgPYIBBpQXwzFHigp/VjeLWBiNoApekX6dWb/nim
        S3x9Jk3z5lC4d7Bq+DUFN5wxnwNcSPJVRu8uFZ5O2Cm9xsyySD4AF91ABqUszan8VCo5k63Tkih
        sNiu4kr+WAQVboazIvenOiNVfxtWhWCPnaLRyYg==
X-Received: by 2002:a17:906:a109:: with SMTP id t9mr3500773ejy.718.1642080607708;
        Thu, 13 Jan 2022 05:30:07 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyMNkfQi4+m47jbNQiciQP+7ptefZU6skQjA2XWtlYYF4xXnLw2qZV1JKz789+WCaQqP5cfCw==
X-Received: by 2002:a17:906:a109:: with SMTP id t9mr3500755ejy.718.1642080607579;
        Thu, 13 Jan 2022 05:30:07 -0800 (PST)
Received: from [192.168.0.30] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id w3sm877146eji.134.2022.01.13.05.30.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 13 Jan 2022 05:30:07 -0800 (PST)
Message-ID: <9c3ef183-2872-f070-4d22-0ab2e79d2555@canonical.com>
Date:   Thu, 13 Jan 2022 14:30:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH 19/23] arm64: dts: fsd: Add SPI device nodes
Content-Language: en-US
To:     Alim Akhtar <alim.akhtar@samsung.com>,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc:     soc@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, olof@lixom.net,
        linus.walleij@linaro.org, catalin.marinas@arm.com,
        robh+dt@kernel.org, s.nawrocki@samsung.com,
        linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
        Aswani Reddy <aswani.reddy@samsung.com>, linux-fsd@tesla.com
References: <20220113121143.22280-1-alim.akhtar@samsung.com>
 <CGME20220113122440epcas5p4651d7cb2fc6d6a70fd5eaab5eadcf996@epcas5p4.samsung.com>
 <20220113121143.22280-20-alim.akhtar@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220113121143.22280-20-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 13/01/2022 13:11, Alim Akhtar wrote:
> From: Aswani Reddy <aswani.reddy@samsung.com>
> 
> This patch add device tree node for SPI IPs and needed
> GPIO pin configurations needed for SPI IP
> 
> Cc: linux-fsd@tesla.com
> Signed-off-by: Aswani Reddy <aswani.reddy@samsung.com>
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  arch/arm64/boot/dts/tesla/fsd.dts  | 12 +++++++
>  arch/arm64/boot/dts/tesla/fsd.dtsi | 57 ++++++++++++++++++++++++++++++
>  2 files changed, 69 insertions(+)
> 


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>


Best regards,
Krzysztof
