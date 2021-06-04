Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C97DBC4743C
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jun 2021 20:56:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A720C61403
	for <linux-clk@archiver.kernel.org>; Fri,  4 Jun 2021 20:56:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231211AbhFDU54 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Jun 2021 16:57:56 -0400
Received: from mail-oo1-f49.google.com ([209.85.161.49]:35811 "EHLO
        mail-oo1-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229906AbhFDU54 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Jun 2021 16:57:56 -0400
Received: by mail-oo1-f49.google.com with SMTP id s20-20020a4ae9940000b02902072d5df239so2548472ood.2;
        Fri, 04 Jun 2021 13:56:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=M//mZgtCwbk1BSRJ1Wk3leMprXYCUHwVF8AJTmLsFS8=;
        b=uBIO66RgpA/CHd7oLd6bxq1V6k1d/UeFsiZX4Hp5U+te25Jl5Eu10dMsw9mjfVb7j0
         DcZRdPKR8Q71CgF+zC20XFgjCft8GOXrtF+4MOn5KxNsQp7KqCKPSUG9rV47OBDT9B7N
         DgsLq7B5uFl1H3DtarRZ8cW6daU0M/TkHXW+jDFlwSIck78xjD5kKzlznpVOS8uFO3kc
         +ECbStirf4qF+RXJAcXV46eXOT+HBQC/L8eP+k5aCxhDmb4YzXFwpV+dp4El/Gdnuo6i
         jEoxffCLFJvRpa0GmHth3z96iC1nTKViuzylntGRXyaY681L5FxWh3311B7WvFiyi3dN
         EsbQ==
X-Gm-Message-State: AOAM530h4OlKYUVaU2BanDizuFIZRMTyrTjPcLLA0IGGJG0Aimu/Hr3a
        tiSLSUEgOymc55IGz4tWIQ==
X-Google-Smtp-Source: ABdhPJyKTIDHYQyp45mGfxFo+98JHE6cjlNCBJ6+fYk0DFrwAkCtgguQ9eAqK3cBXeOoYcR0nCjcEQ==
X-Received: by 2002:a4a:6107:: with SMTP id n7mr5114746ooc.12.1622840169273;
        Fri, 04 Jun 2021 13:56:09 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id z14sm706688oti.29.2021.06.04.13.56.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Jun 2021 13:56:08 -0700 (PDT)
Received: (nullmailer pid 3901286 invoked by uid 1000);
        Fri, 04 Jun 2021 20:56:07 -0000
Date:   Fri, 4 Jun 2021 15:56:07 -0500
From:   Rob Herring <robh@kernel.org>
To:     Lokesh Vutla <lokeshvutla@ti.com>
Cc:     Vignesh R <vigneshr@ti.com>, mturquette@baylibre.com,
        Rob Herring <robh+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
        Linux ARM Mailing List <linux-arm-kernel@lists.infradead.org>,
        Tero Kristo <kristo@kernel.org>, sboyd@kernel.org,
        ssantosh@kernel.org, linux-clk@vger.kernel.org,
        Device Tree Mailing List <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: ehrpwm: Add support for AM64
 specific compatible
Message-ID: <20210604205607.GA3901252@robh.at.kernel.org>
References: <20210528045743.16537-1-lokeshvutla@ti.com>
 <20210528045743.16537-2-lokeshvutla@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210528045743.16537-2-lokeshvutla@ti.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 28 May 2021 10:27:42 +0530, Lokesh Vutla wrote:
> Introduce AM64 specific compatible for epwm time-base sub-module clock.
> 
> Signed-off-by: Lokesh Vutla <lokeshvutla@ti.com>
> ---
>  .../devicetree/bindings/clock/ti,am654-ehrpwm-tbclk.yaml      | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
