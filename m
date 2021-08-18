Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 412BDC4338F
	for <linux-clk@archiver.kernel.org>; Wed, 18 Aug 2021 18:57:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 279A6610FF
	for <linux-clk@archiver.kernel.org>; Wed, 18 Aug 2021 18:57:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232479AbhHRS5u (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 18 Aug 2021 14:57:50 -0400
Received: from mail-oi1-f171.google.com ([209.85.167.171]:37454 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229558AbhHRS5t (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 18 Aug 2021 14:57:49 -0400
Received: by mail-oi1-f171.google.com with SMTP id u10so4797664oiw.4;
        Wed, 18 Aug 2021 11:57:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HgC/ybyqY3X3Vyc30SD07sx/L7/EMecf/ovzzZJ1g38=;
        b=OgvIOA9O0e2T2/hoW0rspACg6u6+ipq2GHQP2ySF0zAo4ABB/ubj8XhDXiIXGSlJWW
         o7f7Soy7tPEfBab7rHENNUi5Kta+LYr0SN4XPfqG7aYiALwaY4kSUwaceun5nvBfpsIA
         WO6JId4leSRtX5S/644dfgHMDy52s2yqb6/X4Eb2TOrE0WZbo2lokZXjw7uvqJXnNEW0
         YyCAVkdQ55EMQCvFvR2L3qSvTZ3E4p4KAE/5Jijv8tVIGxajAl45/yBQeao8cPgWFUl+
         lRtPd26QuTXTqEobqACwn9ubRLytuMqwACOrUspbl7GqFyH62n3u8BygqHoKcvfczEZp
         iZ9A==
X-Gm-Message-State: AOAM533PV5hIQockP6/w3C/R6bBNcXgW4deS+EmkD/yE4U7C84Mo1pwL
        aHD5XEX1EX2ks/LHtT4x0Q==
X-Google-Smtp-Source: ABdhPJwzSPvubnhVgW47Y5Dwns3AygYxs7DpyYgSd9vAbHMUltIm1e+LYC477sfZZfHpSTiibsVoQg==
X-Received: by 2002:aca:3246:: with SMTP id y67mr8191826oiy.67.1629313034235;
        Wed, 18 Aug 2021 11:57:14 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id f1sm178396otl.48.2021.08.18.11.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Aug 2021 11:57:13 -0700 (PDT)
Received: (nullmailer pid 2913887 invoked by uid 1000);
        Wed, 18 Aug 2021 18:57:11 -0000
Date:   Wed, 18 Aug 2021 13:57:11 -0500
From:   Rob Herring <robh@kernel.org>
To:     daire.mcnamara@microchip.com
Cc:     palmer@dabbelt.com, mturquette@baylibre.com,
        conor.dooley@microchip.com, david.abdurachmanov@gmail.com,
        devicetree@vger.kernel.org, sboyd@kernel.org,
        cyril.jean@microchip.com, robh+dt@kernel.org,
        linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 1/2 resend] dt-bindings: clk: microchip: Add Microchip
 PolarFire host binding
Message-ID: <YR1YB8wcZCWGYzWg@robh.at.kernel.org>
References: <20210818141102.36655-1-daire.mcnamara@microchip.com>
 <20210818141102.36655-2-daire.mcnamara@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210818141102.36655-2-daire.mcnamara@microchip.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 18 Aug 2021 15:11:01 +0100, daire.mcnamara@microchip.com wrote:
> From: Daire McNamara <daire.mcnamara@microchip.com>
> 
> Add device tree bindings for the Microchip PolarFire system
> clock controller
> 
> Signed-off-by: Daire McNamara <daire.mcnamara@microchip.com>
> ---
>  .../bindings/clock/microchip,mpfs.yaml        | 67 +++++++++++++++++++
>  .../dt-bindings/clock/microchip,mpfs-clock.h  | 45 +++++++++++++
>  2 files changed, 112 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/microchip,mpfs.yaml
>  create mode 100644 include/dt-bindings/clock/microchip,mpfs-clock.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
