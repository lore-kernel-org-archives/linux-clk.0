Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 67341C4338F
	for <linux-clk@archiver.kernel.org>; Mon, 23 Aug 2021 18:24:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4E677613A5
	for <linux-clk@archiver.kernel.org>; Mon, 23 Aug 2021 18:24:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232035AbhHWSZS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 23 Aug 2021 14:25:18 -0400
Received: from mail-ot1-f49.google.com ([209.85.210.49]:43717 "EHLO
        mail-ot1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231716AbhHWSZS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 23 Aug 2021 14:25:18 -0400
Received: by mail-ot1-f49.google.com with SMTP id x10-20020a056830408a00b004f26cead745so38777297ott.10;
        Mon, 23 Aug 2021 11:24:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:content-transfer-encoding
         :in-reply-to;
        bh=9LVr7Ep9kqEYckDFYHzb6AN+kIKu8SgVX7aZO3k6n8Q=;
        b=AK7v7ZsvKksNNasZpsuHYwhUp0codH0UjvUvEgR5pZF57WgQJ72I/mKajV510pQ0lW
         2f4t9aTUnEsQ5ZCoOtiP0P1K8ONPrW0rBbZHTiKniLBeAt4ROP7cs1B6tdj9MxGaDh8T
         22fhsyR/kuG7vppC1d993ngXE3ZeVKorLpbFxm/9Y3JTP9Cdv5YSOlndoji6dYDNR5th
         y7dYIGSvIc1ANfcofJbRwURYuAi+zIwCOYwoghC5CIl+quna+P0lg14m5yugghun2CQU
         ksPWx/PrBr7onBaKXm7KMbi8xJR+ZqHLF3mH3ng3RWAhbjkZkK6Gxbp2xTqeYiWcJXFP
         3f3g==
X-Gm-Message-State: AOAM533p+2/TD3skT8Yo1KuJiXJKzEdmE/7Zuc24etbuQCrp6TKWVarE
        p6qtmsPA02evcIBC8bTh2w==
X-Google-Smtp-Source: ABdhPJyY0P+WUkUmlfUESlAS+W72x+H1/jlqO4sbnjW7EVuaPu2IdLyeGjgxi2joYuUmznBunXSf2A==
X-Received: by 2002:a05:6830:40c1:: with SMTP id h1mr8992262otu.10.1629743075189;
        Mon, 23 Aug 2021 11:24:35 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id m35sm3529657ooi.38.2021.08.23.11.24.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Aug 2021 11:24:34 -0700 (PDT)
Received: (nullmailer pid 2469398 invoked by uid 1000);
        Mon, 23 Aug 2021 18:24:33 -0000
Date:   Mon, 23 Aug 2021 13:24:33 -0500
From:   Rob Herring <robh@kernel.org>
To:     =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     bcm-kernel-feedback-list@broadcom.com, linux-clk@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        =?utf-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Scott Branden <sbranden@broadcom.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: brcm,iproc-clocks: fix armpll
 properties
Message-ID: <YSPn4Y+Rgs83lg/g@robh.at.kernel.org>
References: <20210819052918.6753-1-zajec5@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20210819052918.6753-1-zajec5@gmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 19 Aug 2021 07:29:18 +0200, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> armpll clocks (available on Cygnus and Northstar Plus) are simple clocks
> with no cells. Adjust binding props #clock-cells and clock-output-names
> to handle them.
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> ---
>  .../bindings/clock/brcm,iproc-clocks.yaml     | 27 +++++++++++++++++--
>  1 file changed, 25 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
