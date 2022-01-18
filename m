Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D90CDC433FE
	for <linux-clk@archiver.kernel.org>; Tue, 18 Jan 2022 18:40:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348169AbiARSkG (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Jan 2022 13:40:06 -0500
Received: from smtp-relay-internal-0.canonical.com ([185.125.188.122]:44120
        "EHLO smtp-relay-internal-0.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1348175AbiARSkE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Jan 2022 13:40:04 -0500
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-0.canonical.com (Postfix) with ESMTPS id 88D5640049
        for <linux-clk@vger.kernel.org>; Tue, 18 Jan 2022 18:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642531203;
        bh=f+2umpBovoEMQQYdKSu7Hsi6nUQIgy6EPRX6r+n6WEs=;
        h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
         In-Reply-To:Content-Type;
        b=gI0kTgF1Vt98cjmP/Mo/+/fFhdfOqDbvartmNnuare2DaxX4mZx3D/CPgYQJMHqtV
         px3DMSAmiRZgQDtEgskfHRGRk7kGP6jsGF64m//qucOVtAFm7KUWI2q9/bDzzmydNK
         Pn6WbOvIacNvtSuQWJdaj/ijZj+HbgHYdkuWtE3927QUTFl10jf/LsM1ZAsqJ7R8aH
         GDONnnaGGWKTXUvLf8ZsYNTrtMcdTwKLzrljjEa8ICPCexvrbisjRrMWR0/U23n6Jt
         cz9lSd5tAbRnKhYWyySixPrId7SB82FRMXX+MRTEh+YIsr/9M/bI7wso0jPNoo5/vl
         kFNBiPLUtkRNw==
Received: by mail-ed1-f72.google.com with SMTP id bm21-20020a0564020b1500b00402c34373f9so5686845edb.2
        for <linux-clk@vger.kernel.org>; Tue, 18 Jan 2022 10:40:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=f+2umpBovoEMQQYdKSu7Hsi6nUQIgy6EPRX6r+n6WEs=;
        b=FIqXvYOEtPkQ5u1OM1LRIDHw1bb1rBL/DGRrnn42yk4kTiI2d69DwN1FfdqKWSQMbn
         Kw8EODwEAU8+Pz4j7tCjOU8/X+JZ7pkYV4SBnyXEVz+J/7PSoeTjUFgUy7XNRJPTdyu8
         42eSBCsgUK7yuwSkGSBRjDeG7zu1kd3EdkbuaX9npPsXUApq3UG5c0ubqrYc+qG/tRhz
         JkfbE0eqfyTEy8t7GSFxlFSNWxf/gx6DkTSy8mb4plA/P+tAvzVkQi6J2o9FQvM5/peM
         /3k38xUufYIMQ5X5dibc3G3NTiWE/2l2TFa7VwMcrGop3rJmAMxEsjwWcgOQ1IOYA8zM
         6Ixg==
X-Gm-Message-State: AOAM530IPouDBrz4u8Gqm95iqC5UcsiKoVIYT2AupRalgsiocQgusT9U
        PRfBgER+OlUEU/2mC9zt9e95FZAB0W41IReiYgQ6Snx0Yb14FFqNaDyoq3awyMoW4jR421keyRK
        ZtPVBRRcge7wxYpYm9G7SwipEVQCO/Fy6olw71w==
X-Received: by 2002:aa7:d617:: with SMTP id c23mr23862858edr.138.1642531202670;
        Tue, 18 Jan 2022 10:40:02 -0800 (PST)
X-Google-Smtp-Source: ABdhPJyu5aW0XJhnNwSWHFutY369qOWBZxrMpbOix0c2l2pCMT1g//7aoxN//m/dPRbAWK/k8U04RQ==
X-Received: by 2002:aa7:d617:: with SMTP id c23mr23862850edr.138.1642531202508;
        Tue, 18 Jan 2022 10:40:02 -0800 (PST)
Received: from [192.168.0.42] (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.gmail.com with ESMTPSA id qw28sm5582890ejc.154.2022.01.18.10.40.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jan 2022 10:40:02 -0800 (PST)
Message-ID: <b1bf4b43-639d-c09c-2fb2-0ac58a6eb858@canonical.com>
Date:   Tue, 18 Jan 2022 19:40:01 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.3.1
Subject: Re: [PATCH v2 13/16] dt-bindings: arm: add Tesla FSD ARM SoC
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
 <CGME20220118150104epcas5p4ac6fdc739d21c7d7eb2e53e469466487@epcas5p4.samsung.com>
 <20220118144851.69537-14-alim.akhtar@samsung.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
In-Reply-To: <20220118144851.69537-14-alim.akhtar@samsung.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18/01/2022 15:48, Alim Akhtar wrote:
> Add device tree bindings for the Tesla FSD ARM SoC.
> 
> Cc: linux-fsd@tesla.com
> Signed-off-by: Alim Akhtar <alim.akhtar@samsung.com>
> ---
>  .../devicetree/bindings/arm/tesla.yaml        | 27 +++++++++++++++++++
>  1 file changed, 27 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/tesla.yaml
> 

Looks good to me. I'll take it via Samsung-SoC after the merge window
unless there are some comments/discussion.


Best regards,
Krzysztof
