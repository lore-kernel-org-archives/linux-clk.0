Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85FDFC48BDF
	for <linux-clk@archiver.kernel.org>; Fri, 18 Jun 2021 20:05:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 69B8E61284
	for <linux-clk@archiver.kernel.org>; Fri, 18 Jun 2021 20:05:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230136AbhFRUIB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 18 Jun 2021 16:08:01 -0400
Received: from mail-ot1-f42.google.com ([209.85.210.42]:43841 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232763AbhFRUIA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 18 Jun 2021 16:08:00 -0400
Received: by mail-ot1-f42.google.com with SMTP id i12-20020a05683033ecb02903346fa0f74dso10847791otu.10;
        Fri, 18 Jun 2021 13:05:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=ROPFWJUa9urWqeDhZ2jrqeoT00Ti8THuW8SgyGYM7bA=;
        b=rongGxsfQGPr14GLp7Usm78kio0mcI7HlNDdlyUK27NddL+0wFiZ8wFidwZKxkeu1N
         HTE8yKYlfnyG17zCBBPWNQARzrDDniG97KlzniD/DBgWnFjSZHpfpPggMmVTuYx7OYd3
         HxhaDcOHoOiQbflVlbHaRPXNzsjSmZHTf4WSm4uzkR3GbyjkT2pIN1RsfaTEA8yrXoQr
         yly8E1RvixtODaDlmJY7xRoIEz0fUqH+WXf5/mT8GdFy7p1ywFo98JdWqcP3gvURZ0gr
         5pMKGnuUWlHmbxlOZRf8WKCOMAOXM+T64kzfXzx+sBJ25nUfH84V/ywnCJnDqgE0zNEj
         P1QA==
X-Gm-Message-State: AOAM533riS2ovT1CUHbE02YT3ylvZoqKzU4zppGRcx3fYVQdtcEoadTr
        2VtD3mI2m/fKbsx/5nXb5ln1avgRyw==
X-Google-Smtp-Source: ABdhPJybdK1Y0q6cV+6l+ynYsFVXFfgv7pvT+VRhPT20KEdAAT6fljSQ9L8zl066BzUXNknGWnoYkg==
X-Received: by 2002:a05:6830:30a8:: with SMTP id g8mr11248528ots.122.1624046749862;
        Fri, 18 Jun 2021 13:05:49 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id j7sm2004762oij.25.2021.06.18.13.05.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jun 2021 13:05:49 -0700 (PDT)
Received: (nullmailer pid 2792052 invoked by uid 1000);
        Fri, 18 Jun 2021 20:05:47 -0000
Date:   Fri, 18 Jun 2021 14:05:47 -0600
From:   Rob Herring <robh@kernel.org>
To:     Daniel Mack <daniel@zonque.org>
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        sboyd@kernel.org, kuninori.morimoto.gx@renesas.com,
        mturquette@baylibre.com, robh+dt@kernel.org
Subject: Re: [PATCH v3 2/9] dt-bindings: clock: cs2000-cp: Document
 aux-output-source
Message-ID: <20210618200547.GA2791857@robh.at.kernel.org>
References: <20210617190912.262809-1-daniel@zonque.org>
 <20210617190912.262809-3-daniel@zonque.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210617190912.262809-3-daniel@zonque.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 17 Jun 2021 21:09:05 +0200, Daniel Mack wrote:
> This new optional property can be used to control the function of the
> auxiliary output pin. Introduce a new dt-bindings include file that
> contains the numerical values.
> 
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> ---
>  .../bindings/clock/cirrus,cs2000-cp.yaml           | 14 ++++++++++++++
>  include/dt-bindings/clock/cirrus,cs2000-cp.h       | 14 ++++++++++++++
>  2 files changed, 28 insertions(+)
>  create mode 100644 include/dt-bindings/clock/cirrus,cs2000-cp.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
