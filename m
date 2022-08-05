Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91227C00140
	for <linux-clk@archiver.kernel.org>; Fri,  5 Aug 2022 14:09:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237618AbiHEOJ4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 Aug 2022 10:09:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42142 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230095AbiHEOJz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 Aug 2022 10:09:55 -0400
Received: from mail-il1-f177.google.com (mail-il1-f177.google.com [209.85.166.177])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0521D21E1D;
        Fri,  5 Aug 2022 07:09:54 -0700 (PDT)
Received: by mail-il1-f177.google.com with SMTP id g18so1429536ilk.4;
        Fri, 05 Aug 2022 07:09:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=message-id:date:subject:references:in-reply-to:cc:to:from
         :x-gm-message-state:from:to:cc;
        bh=4wU29egtLMNG+tGI0yk/oLxzbleDgRoflVboG4WD0GM=;
        b=NQZVvYaofgHp5VxlbvAFoYynkodJJzDMvyy/pha9rLYbT6SbvfLjrCkLsHebilRX+y
         eKj+xzXmQAlF6LQ6R5ud+BbgWEGOEI7kr6cf8nIiKhz3p4YGwCicqBNBvxsNc0CUo3oR
         nzF/1EwwGglJ0R+j6vFwYNrrY2eomDSJ3FpUsMnXugCeaYZKM7GHA2JtZx8YzCxtaAMp
         niT08vWY87BoCdLhQBMzrCkR1nRY7wuJiU25ZeI2Kxjn+PzdwN/yzHqNHj1uOI7H+F5m
         Jau5boNMOoJCF0gF9fs7u+q443uq6NJdi4FQ/SufWlfh1FxXlS5TYn7GRy8MmqImmp4e
         j4oA==
X-Gm-Message-State: ACgBeo3I4IITGmOS6GqyuJDKqkj6/SqWFXzQYwKPB3EdO9JeOW5oPNyg
        R0yuFl7NIWBydVtRo1/3Qw==
X-Google-Smtp-Source: AA6agR5/LQJibOTqVIimFgDhK095NQ+fg7nigus3m4Dfff2GNYlsUbKl8lciS3gMG3znsPQfY2wOsg==
X-Received: by 2002:a05:6e02:1a87:b0:2de:8da2:9ecf with SMTP id k7-20020a056e021a8700b002de8da29ecfmr3104073ilv.263.1659708593198;
        Fri, 05 Aug 2022 07:09:53 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id s17-20020a92cc11000000b002ddf58d8828sm1687134ilp.19.2022.08.05.07.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 Aug 2022 07:09:52 -0700 (PDT)
Received: (nullmailer pid 1802483 invoked by uid 1000);
        Fri, 05 Aug 2022 14:09:50 -0000
From:   Rob Herring <robh@kernel.org>
To:     Sean Anderson <sean.anderson@seco.com>
Cc:     Kishon Vijay Abraham I <kishon@ti.com>,
        Ioana Ciornei <ioana.ciornei@nxp.com>,
        linux-phy@lists.infradead.org,
        Camelia Alexandra Groza <camelia.groza@nxp.com>,
        Madalin Bucur <madalin.bucur@nxp.com>,
        Vinod Koul <vkoul@kernel.org>, linuxppc-dev@lists.ozlabs.org,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-kernel@lists.infradead.org,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
In-Reply-To: <20220804220602.477589-3-sean.anderson@seco.com>
References: <20220804220602.477589-1-sean.anderson@seco.com> <20220804220602.477589-3-sean.anderson@seco.com>
Subject: Re: [PATCH v4 2/8] dt-bindings: phy: Add Lynx 10G phy binding
Date:   Fri, 05 Aug 2022 08:09:50 -0600
Message-Id: <1659708590.965354.1802482.nullmailer@robh.at.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 04 Aug 2022 18:05:56 -0400, Sean Anderson wrote:
> This adds a binding for the SerDes module found on QorIQ processors.
> Each phy is a subnode of the top-level device, possibly supporting
> multiple lanes and protocols. This "thick" #phy-cells is used due to
> allow for better organization of parameters. Note that the particular
> parameters necessary to select a protocol-controller/lane combination
> vary across different SoCs, and even within different SerDes on the same
> SoC.
> 
> The driver is designed to be able to completely reconfigure lanes at
> runtime. Generally, the phy consumer can select the appropriate
> protocol using set_mode.
> 
> There are two PLLs, each of which can be used as the master clock for
> each lane. Each PLL has its own reference. For the moment they are
> required, because it simplifies the driver implementation. Absent
> reference clocks can be modeled by a fixed-clock with a rate of 0.
> 
> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
> ---
> 
> Changes in v4:
> - Use subnodes to describe lane configuration, instead of describing
>   PCCRs. This is the same style used by phy-cadence-sierra et al.
> 
> Changes in v3:
> - Manually expand yaml references
> - Add mode configuration to device tree
> 
> Changes in v2:
> - Rename to fsl,lynx-10g.yaml
> - Refer to the device in the documentation, rather than the binding
> - Move compatible first
> - Document phy cells in the description
> - Allow a value of 1 for phy-cells. This allows for compatibility with
>   the similar (but according to Ioana Ciornei different enough) lynx-28g
>   binding.
> - Remove minItems
> - Use list for clock-names
> - Fix example binding having too many cells in regs
> - Add #clock-cells. This will allow using assigned-clocks* to configure
>   the PLLs.
> - Document the structure of the compatible strings
> 
>  .../devicetree/bindings/phy/fsl,lynx-10g.yaml | 236 ++++++++++++++++++
>  1 file changed, 236 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/fsl,lynx-10g.yaml
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Error: Documentation/devicetree/bindings/phy/fsl,lynx-10g.example.dts:51.27-28 syntax error
FATAL ERROR: Unable to parse input tree
make[1]: *** [scripts/Makefile.lib:383: Documentation/devicetree/bindings/phy/fsl,lynx-10g.example.dtb] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1404: dt_binding_check] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/patch/

This check can fail if there are any dependencies. The base for a patch
series is generally the most recent rc1.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit.

