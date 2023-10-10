Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89486CD68ED
	for <linux-clk@archiver.kernel.org>; Tue, 10 Oct 2023 07:22:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1442473AbjJJHW4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 10 Oct 2023 03:22:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33650 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1442463AbjJJHWx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 10 Oct 2023 03:22:53 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E841BA9;
        Tue, 10 Oct 2023 00:22:49 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5955CC433C9;
        Tue, 10 Oct 2023 07:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1696922569;
        bh=HdveOZcCi6fbx2k3SXgqy9feZFP15W5KsiQ52J4+Hl4=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=P0kX3vICr8l+I3vZqvv2Rw5r6agrRkILfihq9evNZ2MXgUs5DcLz0PTcWivxYskBj
         WrTtur4NQUJ4G6GYtQMKJEx4/gduo/bWcr7spDibbRdwZNWj0JJx3FcOHrP/s+STE9
         BZEKEC/lb7l8Om6t47ujTuLFJsGcS8f0gfnjj2r6zPXJ56JH0bI5g7haNxuGU98Ban
         NdA88UPAsUeCQNnD8YYnbESvt1p43n6XJ+lOuwEhXIXCkEb0+8JjB2r/9Kdkx755R1
         NCuVfXkyKG5+n0Vsi4ipckAsUSnO7LefkHR4+j2OIrXMSX1/A2hQ3iMbzOZdR0q2b1
         OUtEBWgVpsuyQ==
Received: (nullmailer pid 4170099 invoked by uid 1000);
        Tue, 10 Oct 2023 07:22:47 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-clk@vger.kernel.org, Chuan Liu <chuan.liu@amlogic.com>,
        linux-amlogic@lists.infradead.org,
        Kevin Hilman <khilman@baylibre.com>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        Jerome Brunet <jbrunet@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Stephen Boyd <sboyd@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>
In-Reply-To: <20231010062917.3624223-2-xianwei.zhao@amlogic.com>
References: <20231010062917.3624223-1-xianwei.zhao@amlogic.com>
 <20231010062917.3624223-2-xianwei.zhao@amlogic.com>
Message-Id: <169692256667.4170036.13538067012213224006.robh@kernel.org>
Subject: Re: [PATCH V2 1/4] dt-bindings: clock: add Amlogic C3 PLL clock
 controller bindings
Date:   Tue, 10 Oct 2023 02:22:47 -0500
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Tue, 10 Oct 2023 14:29:14 +0800, Xianwei Zhao wrote:
> Add the C3 PLL clock controller dt-bindings for Amlogic C3 SoC family
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
> V1 -> V2: Fix errors when check dtbinding use "make dt_binding_check"
> ---
>  .../bindings/clock/amlogic,c3-pll-clkc.yaml   | 59 +++++++++++++++++++
>  .../dt-bindings/clock/amlogic,c3-pll-clkc.h   | 42 +++++++++++++
>  2 files changed, 101 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.yaml
>  create mode 100644 include/dt-bindings/clock/amlogic,c3-pll-clkc.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.example.dts:18:18: fatal error: dt-bindings/clock/amlogic,c3-peripherals-clkc.h: No such file or directory
   18 |         #include <dt-bindings/clock/amlogic,c3-peripherals-clkc.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[2]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/clock/amlogic,c3-pll-clkc.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1427: dt_binding_check] Error 2
make: *** [Makefile:234: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20231010062917.3624223-2-xianwei.zhao@amlogic.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

