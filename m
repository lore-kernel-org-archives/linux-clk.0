Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7FB05C7EE2C
	for <linux-clk@archiver.kernel.org>; Wed, 17 May 2023 07:53:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230248AbjEQHxV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 17 May 2023 03:53:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229827AbjEQHxS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 17 May 2023 03:53:18 -0400
Received: from mail-ej1-x635.google.com (mail-ej1-x635.google.com [IPv6:2a00:1450:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B2D563AA1
        for <linux-clk@vger.kernel.org>; Wed, 17 May 2023 00:53:14 -0700 (PDT)
Received: by mail-ej1-x635.google.com with SMTP id a640c23a62f3a-965ab8ed1fcso68484866b.2
        for <linux-clk@vger.kernel.org>; Wed, 17 May 2023 00:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1684309993; x=1686901993;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YxZmzXZkXDBaGgGWBd0FKqOvFO0QoVnqw9tUxsTvOAs=;
        b=ooHuR6MkMk7X91Ce8AshfMTwcLvBEooZNPRz3QYxhe86Lp+rfo7jPEybaYeF/l7T4N
         5ErDRsYbYm5CjMPC/m0Y/2bg2dJNQbbqhZXowFei6t0G3t9K+2xV9n6pXUfRgkyxtLLq
         jRpSstSiT8ri3BHemZBHSL1/h+eKYYB+CeWORnv7n/CgBZR30X1e9vrZ1J3oIV2cSMTt
         b+xetZhXjhV31DMdQs/e+IIgITXchKJbNgD6UcT/xMKaiH8100mbf6dAa+tFeUg4heSt
         Zi94RLTwwdUtzjTcTyNYiTE+ZnZVFkaTjl/mRN6tlEtdyPiFmRl6X9B2tLAWUEJI4OI4
         jA1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684309993; x=1686901993;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YxZmzXZkXDBaGgGWBd0FKqOvFO0QoVnqw9tUxsTvOAs=;
        b=Ik5C7vg9tFnz9zjK70cpd2HqxkhgGU1p59xaTqQ1IMBfG6YHbt9BqfuBGqAxs0wWRy
         CHuIu/7544z8bZGO5fEqwt/3+l9swjeJMl79ZMQVsu5EK+n4xPYeYvXtx0cgOxQltoCZ
         8RbPyV3o5WYze9Tu0Dp9REtB5feF3DawQpgyqFzTVdTk7j7wcyzmuo5S1GDRxmslL6sM
         Ftp5UlSs3Wb/njwceq39kk+02fCwJ1Nq1yKx90JjeIUioABSCbrH+u/AFQJyKO5NrEU3
         2OupRWWw2JuBndneck0zaFgwvbnC4IHzCUIjqFGHQ6tGSYwzwYweAoIYa4glqNHYPJHr
         b2AA==
X-Gm-Message-State: AC+VfDzd6m7svt7WiiWg/hMlxF5rzOXXdEZnhRPO0+fIJcV3CMwZ+B/1
        NuOxtkR0k/JyS7tWZ1Id6NSLRg==
X-Google-Smtp-Source: ACHHUZ4d4FF1MqDNE/QWLvtFqwDL3H45IrtZ4O8CBJ3/OL1X7qUrMJSaS5NCwnE95sV4+LxlBVpd0Q==
X-Received: by 2002:a17:906:7947:b0:94e:dd68:aba1 with SMTP id l7-20020a170906794700b0094edd68aba1mr36835117ejo.67.1684309993120;
        Wed, 17 May 2023 00:53:13 -0700 (PDT)
Received: from krzk-bin ([2a02:810d:15c0:828:c9ff:4c84:dd21:568d])
        by smtp.gmail.com with ESMTPSA id h15-20020a1709067ccf00b0094f23480619sm12056895ejp.172.2023.05.17.00.53.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 May 2023 00:53:12 -0700 (PDT)
Date:   Wed, 17 May 2023 09:53:10 +0200
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Andrew Davis <afd@ti.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Subject: Re: [PATCH 2/2] dt-bindings: clock: ehrpwm: Remove unneeded syscon
 compatible
Message-ID: <20230517075310.iduc2eisw7a5bm45@krzk-bin>
References: <20230516184626.154892-1-afd@ti.com>
 <20230516184626.154892-2-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230516184626.154892-2-afd@ti.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 16 May 2023 13:46:26 -0500, Andrew Davis wrote:
> This node's register space is not accessed by any other node, which
> is the traditional use for the "syscon" hint. It looks to have been
> added here to make use of a Linux kernel helper syscon_node_to_regmap().
> The Linux driver now uses a more appropriate helper that does not
> require the hint, so let's remove it from the binding.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  .../devicetree/bindings/clock/ti,am654-ehrpwm-tbclk.yaml     | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/ti,j721e-system-controller.example.dtb: scm-conf@100000: clock-controller@4140:compatible: ['ti,am654-ehrpwm-tbclk', 'syscon'] is too long
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/ti,j721e-system-controller.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/ti,j721e-system-controller.example.dtb: clock-controller@4140: compatible: ['ti,am654-ehrpwm-tbclk', 'syscon'] is too long
	From schema: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/ti,am654-ehrpwm-tbclk.yaml

See https://patchwork.ozlabs.org/patch/1782200

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.
