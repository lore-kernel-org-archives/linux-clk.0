Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B3AEC433EF
	for <linux-clk@archiver.kernel.org>; Tue, 19 Apr 2022 16:34:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238492AbiDSQhQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Apr 2022 12:37:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47916 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230428AbiDSQhP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 19 Apr 2022 12:37:15 -0400
Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E7DA29C9B;
        Tue, 19 Apr 2022 09:34:32 -0700 (PDT)
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-de3eda6b5dso18122501fac.0;
        Tue, 19 Apr 2022 09:34:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=M9eDzAyk4sGVv8K5LskKnAnIYX6zDJ5kUNQhT7FAjz0=;
        b=BuRkvSvI8I2ODbbx30ZgqM1sUhpZEG0YSEbGoA9d+Mo352ydVvSH1SQGbZBy7DfEc8
         W/qzo/aI8j8t3C6kSniJVoN9ni3e0SDbIhWE430XWRqXNlEOl1lnM2RGASArNCJp3hWR
         jP9wq+lL5ngO/V224+gxjN3nmOR+ryukRSNPT32DKSkq4cA+X+StV3xzFMjVY4cflW14
         9E0RZhJR/7F8UCwrYyDX8Z+AB5Jv7wF0P46c/VkdHlrYO3J9n45l8kOoz/AVftZRUkw7
         ctQNxzxcOZqBfZmyYcDJehtVgugU5KqqRbBdBrC6j1rjH51hQMeQUDkpEfCRulhVu+OR
         o7CQ==
X-Gm-Message-State: AOAM533bHIFMeasbKlQaLWa//shDXwpLcgg8kMi4kPJb55GmeF1z6Itz
        mGgsjlktQ31zxC2bahLR/g==
X-Google-Smtp-Source: ABdhPJxNq0Y98ca5iv9R82zAY8/p7woHmaFMtJBI59fHLXUFRFR45IJO9m0vWUl0Ukh8l8LKLUFIeQ==
X-Received: by 2002:a05:6870:17a4:b0:e5:8eee:1607 with SMTP id r36-20020a05687017a400b000e58eee1607mr7272179oae.12.1650386071551;
        Tue, 19 Apr 2022 09:34:31 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id b16-20020a056870471000b000e5caa2b264sm2750013oaq.20.2022.04.19.09.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Apr 2022 09:34:31 -0700 (PDT)
Received: (nullmailer pid 2915852 invoked by uid 1000);
        Tue, 19 Apr 2022 16:34:30 -0000
Date:   Tue, 19 Apr 2022 11:34:30 -0500
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     devicetree@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
        linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH 1/5 v3] dt-bindings: clock: u8500: Add clkout clock
 bindings
Message-ID: <Yl7klt2S5Jo+PZHN@robh.at.kernel.org>
References: <20220414221751.323525-1-linus.walleij@linaro.org>
 <20220414221751.323525-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220414221751.323525-2-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 15 Apr 2022 00:17:47 +0200, Linus Walleij wrote:
> This adds device tree bindings for the externally routed clocks
> CLKOUT1 and CLKOUT2 clocks found in the DB8500.
> 
> Cc: devicetree@vger.kernel.org
> Reviewed-by: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - Pick up Ulf's ACK.
> ChangeLog v1->v2:
> - Push the description of the clock-cells down under the clock-cells
>   subnode.
> - Add an example, as this was missing and requested.
> ---
>  .../bindings/clock/stericsson,u8500-clks.yaml | 57 +++++++++++++++++++
>  include/dt-bindings/clock/ste-db8500-clkout.h | 17 ++++++
>  2 files changed, 74 insertions(+)
>  create mode 100644 include/dt-bindings/clock/ste-db8500-clkout.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
