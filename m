Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAE29C433FE
	for <linux-clk@archiver.kernel.org>; Mon,  7 Dec 2020 19:22:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D6D9238A0
	for <linux-clk@archiver.kernel.org>; Mon,  7 Dec 2020 19:22:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725804AbgLGTW1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 7 Dec 2020 14:22:27 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:33422 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725774AbgLGTW1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 7 Dec 2020 14:22:27 -0500
Received: by mail-ot1-f66.google.com with SMTP id b18so13598481ots.0;
        Mon, 07 Dec 2020 11:22:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ewz8r/Um69j9WlwwRelugGfmPY426HhxQX11UEoZHdE=;
        b=uKayHnt79eiqR/fUL56DLpf068TcbbMeIjqWK3iew46Jbehk2gLUD4/AEwzGAIUIh+
         fXvffxGHDgw1QBRXPIHxlgih/7nQmDwZ1+DNg+c+RCxsizPfgQm0Urp5TdoJJYw8ATNK
         Kbaa0LzmlS1pqCwoOdJ3lBSZ/Xdkz2vQrk3mLnO8IO5XeWwHfA1AXBNh7MPcoC8bRSrL
         LkqgVJuHZUw8hTn62w7gcnilVnqJiQkDYX+utx8QQo2kfqMKVkNGn1hMdUfN2CTEUntZ
         QT6wljLj9bhpgZ78wxKpJYbxyBUFG2v/0TvX+5hWuZ95dJlTrP2dsNvBS0p3Ks13aPyJ
         f0lg==
X-Gm-Message-State: AOAM5302UdkMJhbFHYdqGyjTGO4e2XkLg5qoWwWuBL4GrenbzWvzl2Ic
        GCR88BFlwxOCSudNRMf2bw==
X-Google-Smtp-Source: ABdhPJy8WLmAxdxDvthS0YTsB6MtgPeWo6fuiRQw0CcBglvY+DmIP1cJePvI/ormf1GEETxZ9Xx+ow==
X-Received: by 2002:a9d:19a5:: with SMTP id k34mr14081853otk.100.1607368906195;
        Mon, 07 Dec 2020 11:21:46 -0800 (PST)
Received: from xps15 (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id u15sm409591oiv.28.2020.12.07.11.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Dec 2020 11:21:45 -0800 (PST)
Received: (nullmailer pid 658110 invoked by uid 1000);
        Mon, 07 Dec 2020 19:21:44 -0000
Date:   Mon, 7 Dec 2020 13:21:44 -0600
From:   Rob Herring <robh@kernel.org>
To:     Michael Tretter <m.tretter@pengutronix.de>
Cc:     kernel@pengutronix.de, mturquette@baylibre.com, rajanv@xilinx.com,
        rvisaval@xilinx.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        michals@xilinx.com, linux-arm-kernel@lists.infradead.org,
        sboyd@kernel.org, dshah@xilinx.com, tejasp@xilinx.com
Subject: Re: [PATCH 01/12] ARM: dts: define indexes for output clocks
Message-ID: <20201207192144.GA658070@robh.at.kernel.org>
References: <20201116075532.4019252-1-m.tretter@pengutronix.de>
 <20201116075532.4019252-2-m.tretter@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201116075532.4019252-2-m.tretter@pengutronix.de>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 16 Nov 2020 08:55:21 +0100, Michael Tretter wrote:
> The VCU System-Level Control has 4 output clocks. Define indexes for
> these clocks to allow to reference them in the device tree.
> 
> Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
> ---
>  include/dt-bindings/clock/xlnx-vcu.h | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 include/dt-bindings/clock/xlnx-vcu.h
> 

Acked-by: Rob Herring <robh@kernel.org>
