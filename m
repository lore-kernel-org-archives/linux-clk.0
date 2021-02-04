Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88CC8C433E6
	for <linux-clk@archiver.kernel.org>; Thu,  4 Feb 2021 15:41:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5CC1C64F4D
	for <linux-clk@archiver.kernel.org>; Thu,  4 Feb 2021 15:41:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237522AbhBDPly (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 Feb 2021 10:41:54 -0500
Received: from mail-ot1-f51.google.com ([209.85.210.51]:44850 "EHLO
        mail-ot1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237519AbhBDPlv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 Feb 2021 10:41:51 -0500
Received: by mail-ot1-f51.google.com with SMTP id e70so3760036ote.11;
        Thu, 04 Feb 2021 07:41:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=T/w3UsXs5CpLGbmrcFDWBtdDM8zstN972mWNd93eBiA=;
        b=SqB6AxxGslYa4lM+s8+/OJ2bPWXAmwrgMjTc2wg5/3E3xnOxsIZgLj9Nn2wUwRIn+w
         IxHe+LftmFPOoz3Om+xLLF6X/zp2ucJdt1b5G/T9BmaB0SduRNHY6omc1CsBrKmWT7dZ
         9XHe/PBRuek2TxklG0hgcEMDwRjMwpblLZ/R51wtiFy8xctLGAGZQ/CtpdPSGrHAOcqZ
         6SJ7poZv9usjisYbqvrcK0H+BlxmBM1PQsC1j/kXlBKKZ8Gs3U0Mfjzs8s7lwbEUcAp9
         aFqRY3HooPH4WL/v8ifa8BzWpHDolF6Y1UXt3DvuvrMj3tKpthSF3BEbfY1J2OHvnQKO
         ZYhw==
X-Gm-Message-State: AOAM5329BYxIwHQ2LnBh9zUBnAUAlPXyo6zr17Kug+noRIABnTnrRhQ5
        m+BNqMa/toSVzUTm7Xgxk/fq7yQ3Fw==
X-Google-Smtp-Source: ABdhPJz4BR3qX/jeBDQvEtIUDmfz1nIT1DEUIWsG2rluhKtoac9X2XNuMRYb0+rMeeEuMxQeN6KuQA==
X-Received: by 2002:a4a:9e55:: with SMTP id w21mr6010393ook.67.1612452067897;
        Thu, 04 Feb 2021 07:21:07 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id g13sm869623otj.67.2021.02.04.07.21.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Feb 2021 07:21:07 -0800 (PST)
Received: (nullmailer pid 452044 invoked by uid 1000);
        Thu, 04 Feb 2021 15:20:57 -0000
From:   Rob Herring <robh@kernel.org>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc:     shubhrajyoti.datta@gmail.com, gregkh@linuxfoundation.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org, git-dev@xilinx.com,
        linux-clk@vger.kernel.org, sboyd@kernel.org
In-Reply-To: <1612446810-6113-2-git-send-email-shubhrajyoti.datta@xilinx.com>
References: <1612446810-6113-1-git-send-email-shubhrajyoti.datta@xilinx.com> <1612446810-6113-2-git-send-email-shubhrajyoti.datta@xilinx.com>
Subject: Re: [PATCH v8 1/7] dt-bindings: add documentation of xilinx clocking wizard
Date:   Thu, 04 Feb 2021 09:20:57 -0600
Message-Id: <1612452057.740171.452043.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 04 Feb 2021 19:23:24 +0530, Shubhrajyoti Datta wrote:
> Add the devicetree binding for the xilinx clocking wizard.
> 
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
> v6:
> Fix a yaml warning
> v7:
> Add vendor prefix speed-grade
> v8:
> Fix the warnings
> 
>  .../bindings/clock/xlnx,clocking-wizard.yaml       | 62 ++++++++++++++++++++++
>  1 file changed, 62 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.example.dt.yaml: clock-generator@40040000: 'speed-grade' is a required property
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.example.dt.yaml: clock-generator@40040000: 'clock-output-names', 'reg' do not match any of the regexes: 'pinctrl-[0-9]+'
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml

See https://patchwork.ozlabs.org/patch/1436021

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

