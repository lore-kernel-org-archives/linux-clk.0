Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99BC4CCA481
	for <linux-clk@archiver.kernel.org>; Fri,  8 Jul 2022 21:32:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240482AbiGHVcI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Jul 2022 17:32:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46084 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240479AbiGHVcH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Jul 2022 17:32:07 -0400
Received: from mail-il1-f174.google.com (mail-il1-f174.google.com [209.85.166.174])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 375D7A0266;
        Fri,  8 Jul 2022 14:32:06 -0700 (PDT)
Received: by mail-il1-f174.google.com with SMTP id v2so4528845ilo.7;
        Fri, 08 Jul 2022 14:32:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:in-reply-to:references:subject:date
         :message-id;
        bh=h/KThnF0Zvpky0IHZNl9qc+VZZheZmG8gyVJvHSVNhQ=;
        b=pDApoo1JabrmAym7aUKn8T5focOWIruGrKSCpQmFvoo85lROFnI0ZPkauiK1SU1DxL
         fBe6n2sxqLRqhVgjTbtSV4UWOgtoJpSqc5uYUwO7Rfy4rNXaJB37cy1qF2SPL3aG/NQU
         uPe+ge1s0Zxx0KDgQK5tlaFehRpyMqfsGwuOTgK3Xg1kP+95H9zvG/8VeRY2EQihOGk3
         GD3uLxxeBWP7IZxDenR8rQT4eAYp3yqj2uoRbsBINdPjs+8GghGtT2V1wMSeuWpLOJC2
         9L4Dq/6s8VuBsWi2y29hI7P9c86fmkdimDFp6eiYEl7EF3mlFrwmlsIAHSHGNeLZS1Jw
         KC+w==
X-Gm-Message-State: AJIora8n9WraeuYY8rT0IC4c54gvesJLCixpKt+NHKxO5ktLeFbn9GV6
        l1PnqNK36H43J2PPyvLwSQ==
X-Google-Smtp-Source: AGRyM1t7s/dUjWvFjoRJV3IxWtwgWoFoImaYteUvAgrnXfPfUcdPn31tu04YpAfBM1+rNoSePV6BDw==
X-Received: by 2002:a92:c26e:0:b0:2da:be5e:69d9 with SMTP id h14-20020a92c26e000000b002dabe5e69d9mr3235847ild.42.1657315925469;
        Fri, 08 Jul 2022 14:32:05 -0700 (PDT)
Received: from robh.at.kernel.org ([98.38.210.73])
        by smtp.gmail.com with ESMTPSA id s19-20020a02cf33000000b00332044db2aasm18862854jar.95.2022.07.08.14.32.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Jul 2022 14:32:04 -0700 (PDT)
Received: (nullmailer pid 1508203 invoked by uid 1000);
        Fri, 08 Jul 2022 21:32:02 -0000
From:   Rob Herring <robh@kernel.org>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Cc:     git@xilinx.com, git@amd.com, michal.simek@xilinx.com,
        shubhrajyoti.datta@amd.com, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org
In-Reply-To: <1cbbf50917ef9d2e2bc2c8862cb8425d54959049.1657276107.git.shubhrajyoti.datta@xilinx.com>
References: <1cbbf50917ef9d2e2bc2c8862cb8425d54959049.1657276107.git.shubhrajyoti.datta@xilinx.com>
Subject: Re: [LINUX PATCH] dt-bindings: clock: versal: Remove alt_ref_clk from clock source
Date:   Fri, 08 Jul 2022 15:32:02 -0600
Message-Id: <1657315922.459530.1508202.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 08 Jul 2022 16:11:12 +0530, Shubhrajyoti Datta wrote:
> alt_ref_clk is applicable only for PS extended version.
> For PS base version there is no separate alt_ref_clk.
> It is tied with ref_clk. The commit
> 2b2012d1c1d8 (clk: versal: Remove alt_ref_clk from clock sources)
> removes the alt_ref_clk from the u-boot code but not the yaml.
> Remove it from yaml as well.
> 
> Fixes: 026049cf37f2 ("clk: versal: Remove alt_ref_clk from clock sources")
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
> u-boot commit refered
> https://source.denx.de/u-boot/u-boot/-/commit/2b2012d1c1d8515417ba139339d0aa9b47789dca
> 
>  .../devicetree/bindings/clock/xlnx,versal-clk.yaml          | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.example.dtb: versal-firmware: clock-controller:clocks: [[4294967295], [4294967295], [4294967295]] is too long
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.example.dtb: versal-firmware: clock-controller:clock-names:1: 'pl_alt_ref' was expected
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
/builds/robherring/linux-dt-review/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.example.dtb: versal-firmware: clock-controller:clock-names: ['ref', 'alt_ref', 'pl_alt_ref'] is too long
	From schema: /builds/robherring/linux-dt-review/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

