Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C6DBC433FE
	for <linux-clk@archiver.kernel.org>; Mon, 21 Mar 2022 19:01:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352405AbiCUTDH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Mar 2022 15:03:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352410AbiCUTC7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Mar 2022 15:02:59 -0400
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B87A96BDC6;
        Mon, 21 Mar 2022 12:01:33 -0700 (PDT)
Received: by mail-oi1-f173.google.com with SMTP id e4so14189181oif.2;
        Mon, 21 Mar 2022 12:01:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=nTS2qwxUjqkOxdza+qR3eJAIN++xMhTtIwt7IFM0yNk=;
        b=1r0xm5kqRK3C8yfVMgBsHwL/UxxKM8ttv340jzPmV4Ncbz3V+uM/YkUNEFFLPcULtA
         6EPJJ5dkn2zzij/aID841ee/gOq17j9HPQU4qsYU/O1yTSmy//IkJhcJXvMzTSzZOohZ
         gD+OjABKaKTw02nh5lWjPdTabyJ22bC0X7/x3Om1bUhRRLzAK4qKmUXjod2+fJnPijIJ
         c1Z0KvM/lKTudfyDV8tbAL3LMkWIShJaMGsh7i6TvknOxMEcf2jreslvGjv0U7bGI41w
         bWWGyOwZ+PgliifQKnRBCOzR2f1zRPJshie0nLllVGCnwbtwBnHf69iv0/XWFS9q9Tl3
         yA1g==
X-Gm-Message-State: AOAM531ZtKEtqv4HS2g0EDBAh+KOPClwdf3Fh0PeafBAwSMx8Cth0rdx
        Jf9TZ4euXMM7mCCeOdPV9w==
X-Google-Smtp-Source: ABdhPJwBf3B8U+YRggLxFORt7XVFKeJf5OQOyxnaahYvv0Am8tpP+ceivfPpcJFwo+I8oEj4Bk+ysA==
X-Received: by 2002:a05:6808:198a:b0:2da:59cd:46c6 with SMTP id bj10-20020a056808198a00b002da59cd46c6mr285275oib.75.1647889293043;
        Mon, 21 Mar 2022 12:01:33 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id v8-20020a05683018c800b005cb39fc3e15sm5777211ote.13.2022.03.21.12.01.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Mar 2022 12:01:31 -0700 (PDT)
Received: (nullmailer pid 371596 invoked by uid 1000);
        Mon, 21 Mar 2022 19:01:30 -0000
Date:   Mon, 21 Mar 2022 14:01:30 -0500
From:   Rob Herring <robh@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     devicetree@vger.kernel.org, Ulf Hansson <ulf.hansson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/5 v2] dt-bindings: clock: u8500: Add clkout clock
 bindings
Message-ID: <YjjLitPzqOA3tCYj@robh.at.kernel.org>
References: <20220319225156.1451636-1-linus.walleij@linaro.org>
 <20220319225156.1451636-2-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220319225156.1451636-2-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, 19 Mar 2022 23:51:52 +0100, Linus Walleij wrote:
> This adds device tree bindings for the externally routed clocks
> CLKOUT1 and CLKOUT2 clocks found in the DB8500.
> 
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
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
