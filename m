Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 14E64C07E9A
	for <linux-clk@archiver.kernel.org>; Mon, 12 Jul 2021 20:26:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F16E161283
	for <linux-clk@archiver.kernel.org>; Mon, 12 Jul 2021 20:26:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234152AbhGLU3B (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Jul 2021 16:29:01 -0400
Received: from mail-il1-f170.google.com ([209.85.166.170]:34365 "EHLO
        mail-il1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230284AbhGLU27 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Jul 2021 16:28:59 -0400
Received: by mail-il1-f170.google.com with SMTP id e13so20948975ilc.1;
        Mon, 12 Jul 2021 13:26:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=XGowe6pKLcQ6wrVEr7rqqQr0JzqFgR5IIGu0AFt0TOU=;
        b=kCvUsCKxBMbZ10k2uiZLro0QMHNQGw7NDwDiPBQCLhwHeHvTb8HJTkR7vCgb/QcdlF
         SudegsE6E8HIAfzWjvF0ROU6YAnF5EzcvV17iSHGz6WqLA5h4HUze6PHzHtsPPX4zBE3
         YYiqYha34jPA2smqbW9Nkv8VXtkb6YTuZ0ubrZweG16jJFo1VsCTOCXOeWwnwtKY5k7G
         w90q9txZjUR6IAAkbomZBJV2f25g9yjw27J2qjxDn7vlK1Yt0gDo4LyjxbQ8/YbuN3KN
         Ty4npRrGc6TLtI7YfCtjhSH15Jn8a1mDfelTqNUGylxl0B1S71QhvkgtnFhTk5Nmrpon
         vxGw==
X-Gm-Message-State: AOAM5327qQrSkgRy9IVOl7Y5B+mpD5AqyqBq+3TzunBiqJSWkPfzNMD7
        zciSE4CfQzfBg+DCc8JiRg==
X-Google-Smtp-Source: ABdhPJyZP5WEo9UJtLOF6DkrbFzPNHiTt/OXfmemM3yMp7PgdwgVsC/Q0WQ5cy6B+xX7s6DG189tYw==
X-Received: by 2002:a92:8e03:: with SMTP id c3mr451538ild.167.1626121570740;
        Mon, 12 Jul 2021 13:26:10 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id j18sm8347514ioa.53.2021.07.12.13.26.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 12 Jul 2021 13:26:10 -0700 (PDT)
Received: (nullmailer pid 2430623 invoked by uid 1000);
        Mon, 12 Jul 2021 20:26:07 -0000
Date:   Mon, 12 Jul 2021 14:26:07 -0600
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Ulf Hansson <ulf.hansson@linaro.org>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: clock: u8500: Rewrite in YAML and extend
Message-ID: <20210712202607.GA2413103@robh.at.kernel.org>
References: <20210619230526.1864087-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210619230526.1864087-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, Jun 20, 2021 at 01:05:25AM +0200, Linus Walleij wrote:
> This rewrites the ux500/u8500 clock bindings in YAML schema and extends them
> with the PRCC reset controller.
> 
> The bindings are a bit idiomatic but it just reflects their age, the ux500
> platform was used as guinea pig for early device tree conversion of platforms
> in 2015. The new subnode for the reset controller follows the pattern of the
> old bindings and adds a node with reset-cells for this.
> 
> Cc: devicetree@vger.kernel.org
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../bindings/clock/stericsson,u8500-clks.yaml | 113 ++++++++++++++++++
>  .../devicetree/bindings/clock/ux500.txt       |  64 ----------
>  .../reset/stericsson,db8500-prcc-reset.h      |  51 ++++++++
>  3 files changed, 164 insertions(+), 64 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/stericsson,u8500-clks.yaml
>  delete mode 100644 Documentation/devicetree/bindings/clock/ux500.txt
>  create mode 100644 include/dt-bindings/reset/stericsson,db8500-prcc-reset.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/stericsson,u8500-clks.yaml b/Documentation/devicetree/bindings/clock/stericsson,u8500-clks.yaml
> new file mode 100644
> index 000000000000..b3eca95299ab
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/stericsson,u8500-clks.yaml
> @@ -0,0 +1,113 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/stericsson,u8500-clks.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ST-Ericsson DB8500 (U8500) clocks
> +
> +maintainers:
> +  - Ulf Hansson <ulf.hansson@linaro.org>
> +  - Linus Walleij <linus.walleij@linaro.org>
> +
> +description: While named "U8500 clocks" these clocks are inside the
> +  DB8500 digital baseband system-on-chip and its siblings such as
> +  DB8520. These bindings consider the clocks present in the SoC
> +  itself, not off-chip clocks. There are four different on-chip
> +  clocks - RTC (32 kHz), CPU clock (SMP TWD), PRCMU (power reset and
> +  control management unit) clocks and PRCC (peripheral reset and
> +  clock controller) clocks.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - const: stericsson,u8500-clks
> +      - const: stericsson,u8540-clks
> +      - const: stericsson,u9540-clks

enum instead of oneOf+const

> +
> +  reg:
> +    items:
> +      - description: PRCC 1 register area
> +      - description: PRCC 2 register area
> +      - description: PRCC 3 register area
> +      - description: PRCC 5 register area
> +      - description: PRCC 6 register area
> +
> +  prcmu-clock:
> +    description: A subnode with one clock cell for PRCMU (power, reset, control
> +      management unit) clocks. The cell indicates which PRCMU clock in the
> +      prcmu-clock node the consumer wants to use.
> +    type: object
> +
> +    properties:
> +      '#clock-cells':
> +        const: 1
> +
> +    additionalProperties: false
> +
> +  prcc-periph-clock:
> +    description: A subnode with two clock cells for PRCC (peripheral
> +      reset and clock controller) peripheral clocks. The first cell indicates
> +      which PRCC block the consumer wants to use, possible values are 1, 2, 3,
> +      5, 6. The second cell indicates which clock inside the PRCC block it
> +      wants, possible values are 0 thru 31.
> +    type: object
> +
> +    properties:
> +      '#clock-cells':
> +        const: 2
> +
> +    additionalProperties: false
> +
> +  prcc-kernel-clock:
> +    description: A subnode with two clock cells for PRCC (peripheral reset
> +      and clock controller) kernel clocks. The first cell indicates which PRCC
> +      block the consumer wants to use, possible values are 1, 2, 3, 5, 6. The
> +      second cell indicates which clock inside the PRCC block it wants, possible
> +      values are 0 thru 31.
> +    type: object
> +
> +    properties:
> +      '#clock-cells':
> +        const: 2
> +
> +    additionalProperties: false
> +
> +  prcc-reset-controller:
> +    description: A subnode with two reset cells for the reset portions of the
> +      PRCC (peripheral reset and clock controller). The first cell indicates
> +      which PRCC block the consumer wants to use, possible values are 1, 2, 3
> +      5 and 6. The second cell indicates which reset line inside the PRCC block
> +      it wants to control, possible values are 0 thru 31.

type: object ?

Needs #reset-cells?

Though, it doesn't appear to be used, so drop?

> +
> +  rtc32k-clock:
> +    description: A subnode with zero clock cells for the 32kHz RTC clock.
> +    type: object
> +
> +    properties:
> +      '#clock-cells':
> +        const: 0
> +
> +    additionalProperties: false
> +
> +  smp-twd-clock:
> +    description: A subnode for the ARM SMP Timer Watchdog cluster with zero
> +      clock cells.
> +    type: object
> +
> +    properties:
> +      '#clock-cells':
> +        const: 0
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - prcmu-clock
> +  - prcc-periph-clock
> +  - prcc-kernel-clock
> +  - rtc32k-clock
> +  - smp-twd-clock
> +
> +additionalProperties: false
