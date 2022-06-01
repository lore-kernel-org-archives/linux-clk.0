Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C1F53CCA479
	for <linux-clk@archiver.kernel.org>; Wed,  1 Jun 2022 20:45:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229827AbiFAUpN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 Jun 2022 16:45:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229988AbiFAUnw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Jun 2022 16:43:52 -0400
Received: from mail-oi1-f173.google.com (mail-oi1-f173.google.com [209.85.167.173])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3D26C1CF912;
        Wed,  1 Jun 2022 13:28:33 -0700 (PDT)
Received: by mail-oi1-f173.google.com with SMTP id t144so4110895oie.7;
        Wed, 01 Jun 2022 13:28:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=X2ooahDs8/MVRzFKap0q/0WAIoyQkWLgd3PeK7IUOjw=;
        b=DymliDtKGmRB9JpcjK+BnIOPVi4LqX0rUWwRKYlowjYm9s3vNu6T4I5l/mZuGpjh73
         Q+/OmZ+/j32eLuYp1t77fZeT48/f9Q2liNqFZ3skoXQjnremg2HZSduB4fa41HJNLNhT
         XahRWFCbtzjYdaBqSYrGr7pNKYYMyXnM2LHVPWsceOMsLc/tl/1pJ32Dim5DzcFsjzgH
         Ru3CiJP8AHCVytUzr0d9FTPgvSr+4evwkGlg0AMhM+d1HDoSX8rD+9GoBY6jHq7nvFTR
         Yt2iKOWdffA0oqEw80viowR0tYuSm3ktgsuG4rhQ61Pd/bfsF6A1BRopGHZndHUkWtzZ
         /Lkg==
X-Gm-Message-State: AOAM531j7bd7SgbzlYrWKxiMAL3Frdbjan9VE/Za7BpzvEWBndWa22YT
        yGI84quXDhZeyfRs6eGOWaTM4ZywbA==
X-Google-Smtp-Source: ABdhPJz5a5iAslhZOqDv+VH/4OubZYx7aKW4jPUsIFCTCawCJJKxuEBmtxj3CPj2vN54oLaXy3qf9A==
X-Received: by 2002:a05:6870:350:b0:e2:6f65:b91f with SMTP id n16-20020a056870035000b000e26f65b91fmr18126545oaf.192.1654113540656;
        Wed, 01 Jun 2022 12:59:00 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id h14-20020a4ad74e000000b00419b69c667dsm1312487oot.32.2022.06.01.12.59.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jun 2022 12:59:00 -0700 (PDT)
Received: (nullmailer pid 334128 invoked by uid 1000);
        Wed, 01 Jun 2022 19:58:59 -0000
Date:   Wed, 1 Jun 2022 14:58:59 -0500
From:   Rob Herring <robh@kernel.org>
To:     Marek Vasut <marex@denx.de>
Cc:     linux-clk@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/2] dt-bindings: clk: Introduce 'critical-clocks'
 property
Message-ID: <20220601195859.GA328329-robh@kernel.org>
References: <20220517235919.200375-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517235919.200375-1-marex@denx.de>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, May 18, 2022 at 01:59:18AM +0200, Marek Vasut wrote:
> Some platforms require select clock to be always running, e.g. because
> those clock supply vital devices which are not otherwise attached to
> the system and thus do not have a matching DT node and clock consumer.
> 
> An example is a system where the SoC serves as a crystal oscillator
> replacement for a programmable logic device. The "critical-clocks"
> property of a clock controller allows listing clock which must never
> be turned off.
> 
> Clock listed in the "critical-clocks" property may have other consumers
> in DT, listing the clock in "critical-clocks" only assures those clock
> are never turned off, and none of these optional additional consumers
> can turn the clock off either.
> 
> The implementation is modeled after "protected-clocks".
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: devicetree@vger.kernel.org
> To: linux-clk@vger.kernel.org
> ---
> V2: Update the commit message to clarify the behavior
> V3: s@Some platforms require clock@Some platforms require some clocks@
> ---
>  .../devicetree/bindings/clock/clock-bindings.txt | 16 ++++++++++++++++
>  1 file changed, 16 insertions(+)

This file is removed upstream as it is replaced by the schema in 
dtschema. 

But I'd wait to see what Stephen says. I'm fine with the addition.

Rob
