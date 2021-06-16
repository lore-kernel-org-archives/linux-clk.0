Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46678C48BE5
	for <linux-clk@archiver.kernel.org>; Wed, 16 Jun 2021 17:57:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2A9EF6128B
	for <linux-clk@archiver.kernel.org>; Wed, 16 Jun 2021 17:57:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230291AbhFPR7x (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Jun 2021 13:59:53 -0400
Received: from mail-io1-f50.google.com ([209.85.166.50]:37861 "EHLO
        mail-io1-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231495AbhFPR7w (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Jun 2021 13:59:52 -0400
Received: by mail-io1-f50.google.com with SMTP id q15so135730ioi.4;
        Wed, 16 Jun 2021 10:57:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2nI7BwNM49i6XeNNGXZCWBHU5+j8R0I/mZyPgtf/J9c=;
        b=lFbOYzSzSCd+2GxB0jbpC39qwW3pLRMQo+QvNW8TRDjsPpfmL7H1T4M0RK/WzGKCfH
         ugbsrJ0w1XKklAMni90ADWWhZSEdS9UITdTe9cHJAxC+3YzlR7dXtK8yaPCxn37olCt2
         zN66wuiu+ttRvhyUMhgxx56donlzNQVhjtdBuq/e2883ZJtNExG6Yp3vGnn2R1JpPOjO
         /BUgS59zbkXceanOwpRtaW2zsbpkKwnshfXw5rTS2+sHZDtlo1hzG/k3cbME2yeJyFgd
         +6yzRzrHfcm6aPqkZXIkTtXgxnOGzxqpI2UD/QBr82BRrb6yVRnWaEfKjLSVM6jQpMnQ
         OY+A==
X-Gm-Message-State: AOAM530B7wx3kQYw7CyxxExclaNnU2D4fuS2w9AGhO0wb8pZWe3uwYrQ
        G4+LBz8zG3Ri33lnBxuaSA==
X-Google-Smtp-Source: ABdhPJw1vZAkLCfml358/opm1GwlrW7IRqGGUbZTSCQf3zfblv8ZlCIypxnkzmt81SuA6iHamPopEQ==
X-Received: by 2002:a6b:8e97:: with SMTP id q145mr474002iod.144.1623866266249;
        Wed, 16 Jun 2021 10:57:46 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id p19sm1535944iob.7.2021.06.16.10.57.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Jun 2021 10:57:45 -0700 (PDT)
Received: (nullmailer pid 3618111 invoked by uid 1000);
        Wed, 16 Jun 2021 17:57:43 -0000
Date:   Wed, 16 Jun 2021 11:57:43 -0600
From:   Rob Herring <robh@kernel.org>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     linux-clk@vger.kernel.org, Sergej Sawazki <ce3a@gmx.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH] dt-bindings: clock: gpio-mux-clock: Convert to
 json-schema
Message-ID: <20210616175743.GA3618066@robh.at.kernel.org>
References: <14cb3b4da446f26a4780e0bd1b58788eb6085d05.1623414619.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <14cb3b4da446f26a4780e0bd1b58788eb6085d05.1623414619.git.geert+renesas@glider.be>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 11 Jun 2021 14:30:47 +0200, Geert Uytterhoeven wrote:
> Convert the simple GPIO clock multiplexer Device Tree binding
> documentation to json-schema.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>  .../bindings/clock/gpio-mux-clock.txt         | 19 --------
>  .../bindings/clock/gpio-mux-clock.yaml        | 45 +++++++++++++++++++
>  2 files changed, 45 insertions(+), 19 deletions(-)
>  delete mode 100644 Documentation/devicetree/bindings/clock/gpio-mux-clock.txt
>  create mode 100644 Documentation/devicetree/bindings/clock/gpio-mux-clock.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
