Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B2F1C4338F
	for <linux-clk@archiver.kernel.org>; Thu, 29 Jul 2021 19:54:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6235860F21
	for <linux-clk@archiver.kernel.org>; Thu, 29 Jul 2021 19:54:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232249AbhG2Tyi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 29 Jul 2021 15:54:38 -0400
Received: from mail-io1-f41.google.com ([209.85.166.41]:44844 "EHLO
        mail-io1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229896AbhG2Tyh (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 29 Jul 2021 15:54:37 -0400
Received: by mail-io1-f41.google.com with SMTP id l18so8610592ioh.11;
        Thu, 29 Jul 2021 12:54:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=agDK+KljcQcvbEkie478xz4qKpaetAkSyYL26XY85vE=;
        b=OUUftMzzEg6IlgNw4YLUVpDFdvepgtWesOANNWCFPA8vWaSm9VjXk3ylrejVY7CZI4
         d/yvy97kfAIUqOD3iUpoHE+W8UbmnqJgvbIvt2s4kSFulUaJCYeMwueHdJW+5xGa+XKN
         JDOQPAT6+k/A9V7drp9esxi7/c3/Kp7kPDUR/8BL4iaJ7maxK7i23lJMoLUel8PAXiTi
         tHffRaJh9/A4fILUJ7Ee9bDODfJLtc9nUmtNbJNve5rMbtEIQnrTsoJrNft2OP4+jn80
         N1/oAmas/2e1cxjmmfkusEjfuFZCGfad9ckNefPnMx0X1hF9wnvtMjEh1ZUM9eAPkpSa
         R+8w==
X-Gm-Message-State: AOAM532oh8tt9JrcTGRnYt2HgsZs2KXX/h1H3gO68gRw8t0YkBPj3C4h
        EiKbrLr5REDBnQtevnNTag==
X-Google-Smtp-Source: ABdhPJy3XSbKdbiXhOCqzGfvfo36ub0ApsGvz7A26hYdxBPp9/PbHUy08JdN0jcSXnBGsdvMN/X09A==
X-Received: by 2002:a5e:c803:: with SMTP id y3mr5408025iol.107.1627588473340;
        Thu, 29 Jul 2021 12:54:33 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id n12sm2509104ilo.57.2021.07.29.12.54.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Jul 2021 12:54:32 -0700 (PDT)
Received: (nullmailer pid 775940 invoked by uid 1000);
        Thu, 29 Jul 2021 19:54:31 -0000
Date:   Thu, 29 Jul 2021 13:54:31 -0600
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Philipp Zabel <p.zabel@pengutronix.de>, linux-clk@vger.kernel.org,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: Re: [PATCH 1/2 v2] dt-bindings: clock: u8500: Rewrite in YAML and
 extend
Message-ID: <YQMHdy9FFoN9xX6Y@robh.at.kernel.org>
References: <20210720231837.1576130-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210720231837.1576130-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 21 Jul 2021 01:18:36 +0200, Linus Walleij wrote:
> This rewrites the ux500/u8500 clock bindings in YAML schema and extends them
> with the PRCC reset controller.
> 
> The bindings are a bit idiomatic but it just reflects their age, the ux500
> platform was used as guinea pig for early device tree conversion of platforms
> in 2015. The new subnode for the reset controller follows the pattern of the
> old bindings and adds a node with reset-cells for this.
> 
> Cc: devicetree@vger.kernel.org
> Cc: Philipp Zabel <p.zabel@pengutronix.de>
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v1->v2:
> - Use an enum for compatible.
> - Mark the reset controller as object (node)
> - Mandate 2 #reset-cells on the reset controller.
> - Small blurb that PRCC 4 does not exist.
> - Rebase on v5.14-rc1
> - Cc Philipp Zabel
> ---
>  .../bindings/clock/stericsson,u8500-clks.yaml | 121 ++++++++++++++++++
>  .../devicetree/bindings/clock/ux500.txt       |  64 ---------
>  .../reset/stericsson,db8500-prcc-reset.h      |  51 ++++++++
>  3 files changed, 172 insertions(+), 64 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/stericsson,u8500-clks.yaml
>  delete mode 100644 Documentation/devicetree/bindings/clock/ux500.txt
>  create mode 100644 include/dt-bindings/reset/stericsson,db8500-prcc-reset.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
