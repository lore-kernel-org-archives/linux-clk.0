Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 406C8C6FD1F
	for <linux-clk@archiver.kernel.org>; Thu, 16 Mar 2023 07:34:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230256AbjCPHei (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Mar 2023 03:34:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229747AbjCPHeg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 16 Mar 2023 03:34:36 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BA5612848
        for <linux-clk@vger.kernel.org>; Thu, 16 Mar 2023 00:33:58 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id w9so3938789edc.3
        for <linux-clk@vger.kernel.org>; Thu, 16 Mar 2023 00:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678952003;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JvT+O6JyRo0F05dzn7oIrPWKecuQu71C9w69TOt77mA=;
        b=Mt1kfBJc4En2FuXBuXB6yx3GalwXh7DlBBWDt/mTcQY/PgHPrezn151FrdXzFl5cXw
         OAUhnzCjqxfpyTFYlZzXxB9z0C+LZ32uel5w0JYVbuBIGoBtglvyggXMCbdpaTWmX+7S
         9QuEWJsqcBGZTJV1PlhDx8JFuzxY/Cgk7UKUhQ70ozLs+3gfY0BAsOyJHd+K6Y9yirmP
         JJlSxoN6sXHXrQ4N0Ykqeo+7mcLPgQHsr4lLKS/Mifh/T2BIKvfL9Mab3TrGORn4BLRc
         a5EsNInSQxjkNiU0hNTLKo+ZFRVEK08pnh6r1JBlBkgSElqK8gaUQfP4sIJpLXTdhPBd
         Z2OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678952003;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=JvT+O6JyRo0F05dzn7oIrPWKecuQu71C9w69TOt77mA=;
        b=lfqdXu7Al4AmwbH1yYsO4qUtSZdmunPonxW8IPwFdlzVxufdZdyODjlJoPdeAdGUox
         u4HhLHByYVQP3V8AihBt6l4sqgQX28R1M0YLv5PfBGi40c35JIbwGDGi5bJeDdRTgdSq
         Avrf/IDQ+gxFDyD0nH6KvhW/YFFgW8bbqw+0l7Rtje/3MNaQpb6oQJvDVI2bjjX0V91N
         7MxDblF0YElGcDg/RIJM6u/ovrD3ajpa1WwauuND/TDU0Do20Q2XxPKzUqYJpVlvxLyI
         cGa8X2/cjw4R0Uu5lCpgUSFXAWHO7tFBExnka73ezmbuGaDAc/meAaRQdq1IsLY1+lbH
         Jp2g==
X-Gm-Message-State: AO0yUKWt7gyHHp2oj/mSnBZdaItJpGVflkTRVK/JDSvvwbLi7uPhwMR4
        ZlCqTJMqWwqdibCsMSvYtYDfSQ==
X-Google-Smtp-Source: AK7set+TFVuFkFEpPQr3QyG9IDsqqwpg4uF11Kp4JQI8rPc5seUfifZSwCVWHuk5POr1GcQZQcWfXg==
X-Received: by 2002:a50:ed11:0:b0:4fd:240d:f36e with SMTP id j17-20020a50ed11000000b004fd240df36emr4547426eds.36.1678952003716;
        Thu, 16 Mar 2023 00:33:23 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:9827:5f65:8269:a95f? ([2a02:810d:15c0:828:9827:5f65:8269:a95f])
        by smtp.gmail.com with ESMTPSA id x60-20020a50bac2000000b004fd219242a5sm3456183ede.7.2023.03.16.00.33.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 16 Mar 2023 00:33:23 -0700 (PDT)
Message-ID: <f8b323b4-fd07-f5fd-70cf-31450e9ef204@linaro.org>
Date:   Thu, 16 Mar 2023 08:33:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Subject: Re: [PATCH 07/15] dt-bindings: arm: Add initial bindings for Nuvoton
 platform
Content-Language: en-US
To:     Jacky Huang <ychuang570808@gmail.com>, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, lee@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, p.zabel@pengutronix.de,
        gregkh@linuxfoundation.org, jirislaby@kernel.org
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-serial@vger.kernel.org,
        schung@nuvoton.com, Jacky Huang <ychuang3@nuvoton.com>
References: <20230315072902.9298-1-ychuang570808@gmail.com>
 <20230315072902.9298-8-ychuang570808@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230315072902.9298-8-ychuang570808@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 15/03/2023 08:28, Jacky Huang wrote:
> From: Jacky Huang <ychuang3@nuvoton.com>
> 
> Add binding for ARMv8 based Nuvotn SoCs and platform boards.
> Add initial bindings for ma35d1 series development boards.
> 
> Signed-off-by: Jacky Huang <ychuang3@nuvoton.com>
> ---
>  .../devicetree/bindings/arm/nuvoton.yaml      | 30 +++++++++++++++++++

And what is npcm for? Why it was made an directory?

All these should be just one Nuvoton.

>  1 file changed, 30 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/nuvoton.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/nuvoton.yaml b/Documentation/devicetree/bindings/arm/nuvoton.yaml
> new file mode 100644
> index 000000000000..f95e7b30711e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/arm/nuvoton.yaml
> @@ -0,0 +1,30 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause


Best regards,
Krzysztof

