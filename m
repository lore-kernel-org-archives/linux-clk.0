Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D3A3C433B4
	for <linux-clk@archiver.kernel.org>; Fri, 21 May 2021 02:00:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E3BB06138C
	for <linux-clk@archiver.kernel.org>; Fri, 21 May 2021 02:00:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237809AbhEUCBl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 May 2021 22:01:41 -0400
Received: from mail-oi1-f182.google.com ([209.85.167.182]:42722 "EHLO
        mail-oi1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237368AbhEUCBi (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 May 2021 22:01:38 -0400
Received: by mail-oi1-f182.google.com with SMTP id c196so10087190oib.9;
        Thu, 20 May 2021 19:00:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=AIzyCD7tcMQFaCHRjYF433tE/tVUbCpzDEpVWvyVp2g=;
        b=JdCOVtHO2KBkvfb1Z4bK69NnFGlzoaSyQRBRDM2pBnY5yGb3eGBBpvvXJs9zswhG4R
         qlk+LobmbCDYtp39E83FtdigPTCu7rnEFXI7MDkydW8cf4yaUk5n+X+PJwu9LGIeQ/Ro
         zkbC3GefW7NJ4/aHMrdybo8vxCsO2mlPcXbi7Jay7gB3yXZsBbVvgp0EjV0hEDzbGVPs
         QhzdmY8k8y8EOoummg05bPje/UGtQZKdN+PiKsYiJ9wHEFzYRd90D6E/DMIUkbMuiIx/
         TUy/GcsLU2Un7p6tsR1nzzUsY7XzPn1S080x/xEkVJio+qqY5ircLFQco4tEoTKbMPqK
         Vb3Q==
X-Gm-Message-State: AOAM5325aMqeocVxJFg0k2NFHoXSs1V5IOYVVjaAbw3ldrFxheKoSP32
        ciRNZuNPOHhrM4Y0gyyJIQ==
X-Google-Smtp-Source: ABdhPJxQdvWlSyDQb5BZCJMmUarQEihQIZIZqdmCgpX9Qu2IMO4NVRwHYOC+17BuKPPyW2TYSIC//A==
X-Received: by 2002:aca:cf09:: with SMTP id f9mr330658oig.37.1621562415873;
        Thu, 20 May 2021 19:00:15 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d185sm900734oib.25.2021.05.20.19.00.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 May 2021 19:00:15 -0700 (PDT)
Received: (nullmailer pid 2499621 invoked by uid 1000);
        Fri, 21 May 2021 02:00:14 -0000
Date:   Thu, 20 May 2021 21:00:14 -0500
From:   Rob Herring <robh@kernel.org>
To:     Daniel Mack <daniel@zonque.org>
Cc:     robh+dt@kernel.org, mturquette@baylibre.com,
        kuninori.morimoto.gx@renesas.com, linux-clk@vger.kernel.org,
        sboyd@kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 2/3] dt-bindings: clock: cs2000-cp: Document
 aux-output-source
Message-ID: <20210521020014.GA2499566@robh.at.kernel.org>
References: <20210519201551.690654-1-daniel@zonque.org>
 <20210519201551.690654-3-daniel@zonque.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210519201551.690654-3-daniel@zonque.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 19 May 2021 22:15:50 +0200, Daniel Mack wrote:
> This new optional property can be used to control the function of the
> auxiliary output pin. Introduce a new dt-bindings include file that
> contains the numerical values.
> 
> Signed-off-by: Daniel Mack <daniel@zonque.org>
> ---
>  .../bindings/clock/cirrus,cs2000-cp.yaml           | 13 +++++++++++++
>  include/dt-bindings/clock/cirrus,cs2000-cp.h       | 14 ++++++++++++++
>  2 files changed, 27 insertions(+)
>  create mode 100644 include/dt-bindings/clock/cirrus,cs2000-cp.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
