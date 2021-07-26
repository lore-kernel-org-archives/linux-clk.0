Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B136C4338F
	for <linux-clk@archiver.kernel.org>; Mon, 26 Jul 2021 21:53:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 064B560F59
	for <linux-clk@archiver.kernel.org>; Mon, 26 Jul 2021 21:53:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233463AbhGZVMy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Jul 2021 17:12:54 -0400
Received: from mail-il1-f171.google.com ([209.85.166.171]:41635 "EHLO
        mail-il1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233380AbhGZVMt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Jul 2021 17:12:49 -0400
Received: by mail-il1-f171.google.com with SMTP id u7so7162101ilj.8;
        Mon, 26 Jul 2021 14:53:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IXAKV/l0kP9SHRYfoiPV0gMiejA+aj5bOuiKVlPykZY=;
        b=XplgseEcXs0W5fajVIXNUuWG61n4Do7Gau77EBMH65ljbIEQFKDhjK6tGMV1RhuJqh
         U2CYnK7WLscOTHHLzyAgbfjSj69XEn3nX6MDcAqzZ8s1t6LPvSxHbW4sbT0hdWO453LT
         I9fxbV+dusxOLrEZetQuUCT9xulTlfLVH6Dlz30g4Eec4r4uPK7C0Zp/i+f9PknDv2VT
         KJZ9Acr2tSMQ119AxQoAUE+E9+u14bmUVIPSIw46xHa58z1xSoTIUm4WppbPjMTfYxPH
         n3wR4uE/nCGPDmj1dmJt6PVkxYoeB6lMLBArXLdCN5cnGfsFO4FDsVdJPvJvqyoyORIv
         zlgQ==
X-Gm-Message-State: AOAM532Zmp/Y7tIFlaSPo7Xi4d/KWXycyvVB8sbrkzCczWu3x34kNgbu
        u2y0/USUleaCaqYC7zFqcOx1CbBDPQ==
X-Google-Smtp-Source: ABdhPJzVh15QLMJGUDbuboGdisyc4KKn38I+bfwIUiMnA1lkKgje5EywKf0tA9kndw3i15G1xdZ/Lw==
X-Received: by 2002:a92:d24d:: with SMTP id v13mr14978274ilg.238.1627336396792;
        Mon, 26 Jul 2021 14:53:16 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id x11sm535881ilu.3.2021.07.26.14.53.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jul 2021 14:53:16 -0700 (PDT)
Received: (nullmailer pid 932853 invoked by uid 1000);
        Mon, 26 Jul 2021 21:53:14 -0000
Date:   Mon, 26 Jul 2021 15:53:14 -0600
From:   Rob Herring <robh@kernel.org>
To:     Sean Anderson <sean.anderson@seco.com>
Cc:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        Luca Ceresoli <luca@lucaceresoli.net>,
        Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Adam Ford <aford173@gmail.com>
Subject: Re: [PATCH v6 1/3] dt-bindings: clk: vc5: Add properties for
 configuring the SD/OE pin
Message-ID: <20210726215314.GA932558@robh.at.kernel.org>
References: <20210723231306.674310-1-sean.anderson@seco.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210723231306.674310-1-sean.anderson@seco.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 23 Jul 2021 19:13:04 -0400, Sean Anderson wrote:
> These properties allow configuring the SD/OE pin as described in the
> datasheet.
> 
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> ---
> 
> Changes in v6:
> - Use tri-state properties
> 
> Changes in v5:
> - Don't use dummy if's for oneOfs under allOfs
> 
> Changes in v4:
> - Specify that bindings should specify these properties, but don't make
>   any guarantees about the driver's behavior when they are not present.
> - Clarify description of idt,(en|dis)able-shutdown properties.
> - Make opposing properties mutually exclusive.
> - Add these properties to the example.
> 
> Changes in v3:
> - Add idt,disable-shutdown and idt,output-enable-active-low to allow for
>   a default of not changing the SP/SH bits at all.
> 
> Changes in v2:
> - Rename idt,sd-active-high to idt,output-enable-active-high
> - Add idt,enable-shutdown
> 
>  .../bindings/clock/idt,versaclock5.yaml       | 40 +++++++++++++++++++
>  1 file changed, 40 insertions(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
