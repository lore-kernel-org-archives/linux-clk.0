Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 224D6EB64DA
	for <linux-clk@archiver.kernel.org>; Sun, 18 Jun 2023 18:50:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229621AbjFRSuD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 18 Jun 2023 14:50:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbjFRSt7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 18 Jun 2023 14:49:59 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28A811AA
        for <linux-clk@vger.kernel.org>; Sun, 18 Jun 2023 11:49:57 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-51a2c8e5a2cso3915088a12.2
        for <linux-clk@vger.kernel.org>; Sun, 18 Jun 2023 11:49:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687114195; x=1689706195;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=egmO6OV1Bz5VQAFOcSA2yvmgko4DP3AIwWBe4wogBpU=;
        b=wLCkTuSoXWs5OS2GH4oguloxCQysCpprbQeNWLtky7hUgZHjRadqUIbRvgawQNifDQ
         oxsEjZsPi9sAxu1RMB+b6Klph0vydmaobht3oGdC7URgNF1q2If0fGEO7pOTYDuWK27e
         VrlJ/HJWC6AOvmTj1YhacvKVSO+odtnr2b+P8y0dDKt7jJTR2ju5viq7L3/yT4tfOES2
         vjwF8mcoTDS6SfdK6g6+kNefAL3dEbyicUvm2FMAtyx1ovF/VV+8hdB05ojPtRWjhBEs
         eXC690pbMVE1af9SPWw7oE/Rb2ZaPOBnoVkyEon98jUDMHAWCQ1tD7SGa6LrXdTVhfEG
         eJHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687114195; x=1689706195;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=egmO6OV1Bz5VQAFOcSA2yvmgko4DP3AIwWBe4wogBpU=;
        b=hopELDmGX11T3arRnoWUj1H23uO7WDk/XhmLxFTP6/9R2a/sWFjxXeJxe2Lla93llX
         96N1sLF+8bKXexiB3mojkrJ7TY8GOuMt4jqC8CXlZ3H1DvIxx7BkXvZHHDu2SXTh5/Xc
         MDbWF7BnE2CXx8oTfHDwZ/09DRzn4gOb5+OGKrzBF9AkyApSzHHzEG0U29keii61lwJG
         WFUO0ZZkTqGiFdepdBSKNDIfgQWOuaSKgET+PQVrv9qjH3sZcWqSmDWODkQvM0TycQ2k
         SOCg3WDEoh3Vpw5dONKo7Ai2RqqMTZAUPtXawffCOgDm3cVAUn5adGTUwZg+W7jp1U0b
         /UlA==
X-Gm-Message-State: AC+VfDzNXL0pvSJgw82agU0yathFk9WnyuaICFCcuk9PhBzVuPItbEXT
        8H/caGL73Qh3FkhB9BwiwggYbQ==
X-Google-Smtp-Source: ACHHUZ6ixmDs1JdGQPRJq6X11DNyyezRvqtTA2KxBvxWBzmnAllpu+/PMH+f+AF/HZ/Q80Y3VkcLSw==
X-Received: by 2002:a17:907:9406:b0:988:2a2f:919f with SMTP id dk6-20020a170907940600b009882a2f919fmr3215551ejc.6.1687114195206;
        Sun, 18 Jun 2023 11:49:55 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id p13-20020a1709060e8d00b00982a99d9757sm4912284ejf.221.2023.06.18.11.49.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 18 Jun 2023 11:49:54 -0700 (PDT)
Message-ID: <8d5f38e6-2ca6-2c61-da29-1d4d2a3df569@linaro.org>
Date:   Sun, 18 Jun 2023 20:49:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Subject: Re: [PATCH 2/4] dt-bindings: clock: Add Intel Agilex5 clocks and
 resets
Content-Language: en-US
To:     niravkumar.l.rabara@intel.com, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Dinh Nguyen <dinguyen@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Philipp Zabel <p.zabel@pengutronix.de>,
        Wen Ping <wen.ping.teh@intel.com>,
        Richard Cochran <richardcochran@gmail.com>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, netdev@vger.kernel.org,
        Adrian Ng Ho Yin <adrian.ho.yin.ng@intel.com>
References: <20230618132235.728641-1-niravkumar.l.rabara@intel.com>
 <20230618132235.728641-3-niravkumar.l.rabara@intel.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230618132235.728641-3-niravkumar.l.rabara@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 18/06/2023 15:22, niravkumar.l.rabara@intel.com wrote:
> From: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
> 
> Add clock and reset ID definitions for Intel Agilex5 SoCFPGA
> 
> Co-developed-by: Teh Wen Ping <wen.ping.teh@intel.com>
> Signed-off-by: Teh Wen Ping <wen.ping.teh@intel.com>
> Signed-off-by: Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
> ---
>  .../bindings/clock/intel,agilex5.yaml         |  42 ++++++++
>  include/dt-bindings/clock/agilex5-clock.h     | 100 ++++++++++++++++++
>  .../dt-bindings/reset/altr,rst-mgr-agilex5.h  |  79 ++++++++++++++
>  3 files changed, 221 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/intel,agilex5.yaml
>  create mode 100644 include/dt-bindings/clock/agilex5-clock.h
>  create mode 100644 include/dt-bindings/reset/altr,rst-mgr-agilex5.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/intel,agilex5.yaml b/Documentation/devicetree/bindings/clock/intel,agilex5.yaml
> new file mode 100644
> index 000000000000..e408c52deefa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/intel,agilex5.yaml

Filename matching compatible, so missing "clk"

> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/intel,agilex5.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Intel SoCFPGA Agilex5 platform clock controller binding

Drop "binding"

> +
> +maintainers:
> +  - Teh Wen Ping <wen.ping.teh@intel.com>
> +  - Niravkumar L Rabara <niravkumar.l.rabara@intel.com>
> +
> +description:
> +  The Intel Agilex5 Clock controller is an integrated clock controller, which
> +  generates and supplies to all modules.

"generates and supplies" what?

> +
> +properties:
> +  compatible:
> +    const: intel,agilex5-clkmgr


Why "clkmgr", not "clk"? You did not call it Clock manager anywhere in
the description or title.

> +
> +  '#clock-cells':
> +    const: 1
> +
> +  reg:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#clock-cells'

Keep the same order as in properties:

> +
> +additionalProperties: false
> +
> +examples:
> +  # Clock controller node:
> +  - |
> +    clkmgr: clock-controller@10d10000 {
> +      compatible = "intel,agilex5-clkmgr";
> +      reg = <0x10d10000 0x1000>;
> +      #clock-cells = <1>;
> +    };
> +...
> diff --git a/include/dt-bindings/clock/agilex5-clock.h b/include/dt-bindings/clock/agilex5-clock.h
> new file mode 100644
> index 000000000000..4505b352cd83
> --- /dev/null
> +++ b/include/dt-bindings/clock/agilex5-clock.h

Filename the same as binding. Missing vendor prefix, entirely different
device name.

> @@ -0,0 +1,100 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * Copyright (C) 2022, Intel Corporation
> + */

...

> +
> +#endif	/* __AGILEX5_CLOCK_H */
> diff --git a/include/dt-bindings/reset/altr,rst-mgr-agilex5.h b/include/dt-bindings/reset/altr,rst-mgr-agilex5.h
> new file mode 100644
> index 000000000000..81e5e8c89893
> --- /dev/null
> +++ b/include/dt-bindings/reset/altr,rst-mgr-agilex5.h

Same filename as binding.

But why do you need this file? Your device is not a reset controller.

Best regards,
Krzysztof

