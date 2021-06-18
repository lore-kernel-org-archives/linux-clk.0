Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB494C48BDF
	for <linux-clk@archiver.kernel.org>; Fri, 18 Jun 2021 20:26:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BC85F613ED
	for <linux-clk@archiver.kernel.org>; Fri, 18 Jun 2021 20:26:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233560AbhFRU3F (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 18 Jun 2021 16:29:05 -0400
Received: from mail-oo1-f41.google.com ([209.85.161.41]:45867 "EHLO
        mail-oo1-f41.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230430AbhFRU3E (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 18 Jun 2021 16:29:04 -0400
Received: by mail-oo1-f41.google.com with SMTP id q20-20020a4a6c140000b029024915d1bd7cso2741793ooc.12;
        Fri, 18 Jun 2021 13:26:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=JMDE9d2OpIzJqsllrrrtxy56jEAPV/w1C8zIX1Y/20U=;
        b=QklpDEdKdyf2CNZz5+orHl7+bXf2cYcMbvb3uZ2l1lCec/pCS8uITYKqpSCj55luSC
         /2eESG6DlSTcTG9pOqqrkd7sydIUxjetyunUtUprCCb1AG5wy+1jRcRtWs5LZ4Wj6cVN
         0XMdHQgSHM44n/F5SGkINOUErpoaaFye2vIYi6HznuyPcXRW7545HW+Nf962+S9Rci9f
         WD5+nj/+eQcA8Wb56gxZofuP6xYu/pKfIah27U0ZOJ4T527ngblIlGMX8URYBzlXq/Ak
         TFmstzByGU+7wkDc7iC9bhQbp0dr2MKS9c3VrDD+QC00AR8sdMJPD31t9OKH+v/6GjcY
         7SNg==
X-Gm-Message-State: AOAM532+yd3G4kj0/AjBPb8cvC7/rTe7WswT5gOx18NqVNBAIpCUlu7x
        5OADkLUX9CrBFG5w+oPQzg==
X-Google-Smtp-Source: ABdhPJyytXcuNEdcTO3D6XaXoeBf5Sq7GTsJY431hfKsxXxjTTIv8i5IC/1wfRtxizuae9jmNnDJGQ==
X-Received: by 2002:a4a:5246:: with SMTP id d67mr10453244oob.33.1624048014122;
        Fri, 18 Jun 2021 13:26:54 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id l18sm2194412otr.50.2021.06.18.13.26.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 13:26:53 -0700 (PDT)
Received: (nullmailer pid 2821367 invoked by uid 1000);
        Fri, 18 Jun 2021 20:26:52 -0000
Date:   Fri, 18 Jun 2021 14:26:52 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sean Anderson <sean.anderson@seco.com>
Cc:     linux-clk@vger.kernel.org, Adam Ford <aford173@gmail.com>,
        devicetree@vger.kernel.org, Luca Ceresoli <luca@lucaceresoli.net>
Subject: Re: [PATCH] dt-bindings: clk: vc5: Fix example
Message-ID: <20210618202652.GA2821316@robh.at.kernel.org>
References: <20210607190546.2616259-1-sean.anderson@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210607190546.2616259-1-sean.anderson@seco.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 07 Jun 2021 15:05:46 -0400, Sean Anderson wrote:
> The example properties do not match the binding. Fix them, and prohibit
> undocumented properties in clock nodes to prevent this from happening in
> the future.
> 
> Fixes: 766e1b8608bf ("dt-bindings: clk: versaclock5: convert to yaml")
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> ---
> 
>  .../devicetree/bindings/clock/idt,versaclock5.yaml         | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 

Applied, thanks!
