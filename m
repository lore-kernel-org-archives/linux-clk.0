Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD032C433EF
	for <linux-clk@archiver.kernel.org>; Fri,  4 Mar 2022 23:11:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230077AbiCDXMV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 4 Mar 2022 18:12:21 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229902AbiCDXMP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 4 Mar 2022 18:12:15 -0500
Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C9E827B91C;
        Fri,  4 Mar 2022 15:11:23 -0800 (PST)
Received: by mail-oi1-f174.google.com with SMTP id l25so9365749oic.13;
        Fri, 04 Mar 2022 15:11:23 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=j4+2EFUsPTFATmCLW8BwJBdAFNqHQuDmatsXtkby2WY=;
        b=FvDIBWGFXRWl2UP0Dw/sW1pVnrm2glwULXqw2zY3od2UA4oI4dz8SX97p2vHBy601g
         YI2ZqUZ+6SOOkNk4JOpauwTcFCPo/mEe5l9Dy6swLGVw52D9Ik6fh7agsvIF54sDMemn
         576ltUbDHxzGXT6kqKwCNwIBvDzLHMw9kMp45Z4lN5ATYJvv3p79qIQcchAEbB9tXsUJ
         5cY/ES9Hnf9Pt7J0QPU3SIBozb5miRka6eIy3vnuHNqURnbMk8P0zUC1FfJ++Acec/QC
         7gMrOA9XQDvryMH0AZoiVA3YEvVMVUt2+p47Ex4zApPXdDRvkcnwtisoCJt+pj7LLslz
         P9zA==
X-Gm-Message-State: AOAM532wuYorNcmmwA+V/CsM8aw0GM+VqkSleRJlERg55fZz2iJqlk4R
        MLEdm2TCYzPqkKzDT5fVMQ==
X-Google-Smtp-Source: ABdhPJxvRcw8ySXnrNedhYS8MlGhpGdnJQ0I9IvN+zpYd5qLsjMpqLWAjCJPvSw1/6P31zDJAQ7kZQ==
X-Received: by 2002:a05:6808:2393:b0:2d9:a01a:487b with SMTP id bp19-20020a056808239300b002d9a01a487bmr991524oib.198.1646435482835;
        Fri, 04 Mar 2022 15:11:22 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id h5-20020a056870170500b000d17a9b25d8sm2966092oae.26.2022.03.04.15.11.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Mar 2022 15:11:22 -0800 (PST)
Received: (nullmailer pid 636059 invoked by uid 1000);
        Fri, 04 Mar 2022 23:11:21 -0000
Date:   Fri, 4 Mar 2022 17:11:21 -0600
From:   Rob Herring <robh@kernel.org>
To:     Marek Vasut <marex@denx.de>
Cc:     devicetree@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH v3 1/3] dt-bindings: clk: rs9: Add Renesas 9-series I2C
 PCIe clock generator
Message-ID: <YiKcmSw/G7pVSEKU@robh.at.kernel.org>
References: <20220226040723.143705-1-marex@denx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220226040723.143705-1-marex@denx.de>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, 26 Feb 2022 05:07:21 +0100, Marek Vasut wrote:
> Add binding for Renesas 9-series PCIe clock generators. This binding
> is designed to support 9FGV/9DBV/9DMV/9FGL/9DML/9QXL/9SQ series I2C
> PCIe clock generators, currently the only tested and supported chip
> is 9FGV0241.
> 
> Signed-off-by: Marek Vasut <marex@denx.de>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: devicetree@vger.kernel.org
> To: linux-clk@vger.kernel.org
> ---
> V2: - Drop clock consumer from the binding example
>     - Make clocks, i.e. xtal, mandatory
> V3: - Rename renesas,out-amplitude to renesas,out-amplitude-microvolt
>     - Drop type ref: from renesas,out-amplitude-microvolt property
>     - Explain 'pcm' in description text as 1/1000 of percent
>     - Add newlines
> ---
>  .../bindings/clock/renesas,9series.yaml       | 97 +++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/renesas,9series.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
