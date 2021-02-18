Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F6B9C433DB
	for <linux-clk@archiver.kernel.org>; Thu, 18 Feb 2021 15:13:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EDFF864EAE
	for <linux-clk@archiver.kernel.org>; Thu, 18 Feb 2021 15:13:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230318AbhBRPNe (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Feb 2021 10:13:34 -0500
Received: from mail-oi1-f170.google.com ([209.85.167.170]:45534 "EHLO
        mail-oi1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233090AbhBROGL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 18 Feb 2021 09:06:11 -0500
Received: by mail-oi1-f170.google.com with SMTP id q186so2028828oig.12;
        Thu, 18 Feb 2021 06:05:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=KtcEmPpSnPlXNJYI0QW3bJNLsG24V6cHzjJN8cs0kfI=;
        b=gFx8lYL8NGfsatWYCrgCsISbxom5hRWoOw+cDi7iCDIrEFjj9DrBQJK668d14Sm/DK
         /HzLcF0AGNXSJEaLcRpICX1Eos4mnaPzeeBXRvhZa5OMdMYRWpX3XPgvDQfzdFP1/1YY
         XY3NDPecHqtIEsskIjfglNcqQGaN9fNv6JGtfbvcoJ/L9JLFAR/GIAd1nFPH3zKOfPH+
         5A051V8kQ14dHoy5G40BtfvOB3cAxWN1l31a/arfShLOwxS2/VE/rgJqR5I7P7H/slzy
         C/xtjZli+V1KZcIwbqO7CORKGw/1bcP6opksV9/JEHzd6OsU5NzFWz50W/HX6oEv/+UC
         aG7A==
X-Gm-Message-State: AOAM532e8+J27JOr++ckhCj08A3Cw5UlCKIBJjZQASs/EbNQHJzjBIn8
        2SHRMGsZ3pcH4qEDaBaXVg==
X-Google-Smtp-Source: ABdhPJyL0Gv0XnbWpigry+S1fDQBquHwFmfpE9RiS9yj7XKQCJTwdVK3sajDPl9U1FyJto3CUCxrPg==
X-Received: by 2002:aca:5bd7:: with SMTP id p206mr2700528oib.66.1613657103101;
        Thu, 18 Feb 2021 06:05:03 -0800 (PST)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id x201sm1182163oix.2.2021.02.18.06.05.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Feb 2021 06:05:02 -0800 (PST)
Received: (nullmailer pid 524584 invoked by uid 1000);
        Thu, 18 Feb 2021 14:05:01 -0000
From:   Rob Herring <robh@kernel.org>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc:     linux-clk@vger.kernel.org, shubhrajyoti.datta@gmail.com,
        mturquette@baylibre.com, sboyd@kernel.org,
        gregkh@linuxfoundation.org, miquel.raynal@bootlin.com,
        devicetree@vger.kernel.org
In-Reply-To: <1613623791-4598-2-git-send-email-shubhrajyoti.datta@xilinx.com>
References: <1613623791-4598-1-git-send-email-shubhrajyoti.datta@xilinx.com> <1613623791-4598-2-git-send-email-shubhrajyoti.datta@xilinx.com>
Subject: Re: [PATCH v9 1/7] dt-bindings: add documentation of xilinx clocking wizard
Date:   Thu, 18 Feb 2021 08:05:01 -0600
Message-Id: <1613657101.302670.524583.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 18 Feb 2021 10:19:45 +0530, Shubhrajyoti Datta wrote:
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
> v9:
> Fix the warnings
> 
>  .../bindings/clock/xlnx,clocking-wizard.yaml       | 65 ++++++++++++++++++++++
>  1 file changed, 65 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.example.dts:19.26-26.11: Warning (unit_address_vs_reg): /example-0/clock-controller: node has a reg or ranges property, but no unit name

See https://patchwork.ozlabs.org/patch/1441521

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

