Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2529BE732DB
	for <linux-clk@archiver.kernel.org>; Thu, 28 Sep 2023 14:47:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231166AbjI1OrZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Sep 2023 10:47:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42282 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230466AbjI1OrU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 28 Sep 2023 10:47:20 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87BBD1AE;
        Thu, 28 Sep 2023 07:47:18 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7281C43395;
        Thu, 28 Sep 2023 14:47:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1695912438;
        bh=ImbJJt6lxA8I9pgmrzl1yvRbcB2Hjbk9mPdoIz4rOhc=;
        h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
        b=r9fyjiAJjrsDcK5xUPyR39tdDZzscjdbcTlaVXqFYJ7f8ZiyLNT+hvLyGmwBuT1EX
         CCuLc5/7IIiDZSFbAAbJyhLe9tbjkUY2J9fam3hQm2VVKETUs68AZztINVKfPjPvWq
         c3nPwq9X/9C7W56zW5IzaZXzAb6A+MnKL2HryVomatX0iSPwiITU3hPTuheVLwK4J/
         pfQFCuBZDMVefdsco7rJxZz2BlRHnqbDSF2ZPepWvgOteyqUkxP1EkJ913nZVtx6tv
         2pXlC19w43Orm43W3l2poUcEWHscncVxInCoqkpq7dwTuCDUDbzz9al6fchGSi7FGR
         X9P2qRZlW2c+w==
Received: (nullmailer pid 408734 invoked by uid 1000);
        Thu, 28 Sep 2023 14:47:11 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From:   Rob Herring <robh@kernel.org>
To:     Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-amlogic@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Neil Armstrong <neil.armstrong@linaro.org>,
        linux-arm-kernel@lists.infradead.org,
        Kevin Hilman <khilman@baylibre.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree@vger.kernel.org,
        Michael Turquette <mturquette@baylibre.com>
In-Reply-To: <20230928063448.3544464-3-xianwei.zhao@amlogic.com>
References: <20230928063448.3544464-1-xianwei.zhao@amlogic.com>
 <20230928063448.3544464-3-xianwei.zhao@amlogic.com>
Message-Id: <169591240804.408241.17087442588468882782.robh@kernel.org>
Subject: Re: [PATCH 2/4] dt-bindings: clock: add Amlogic C3 peripherals
 clock controller bindings
Date:   Thu, 28 Sep 2023 09:47:11 -0500
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Thu, 28 Sep 2023 14:34:46 +0800, Xianwei Zhao wrote:
> Add the peripherals clock controller dt-bindings for Amlogic C3 SoC family
> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  .../clock/amlogic,c3-peripherals-clkc.yaml    |  86 +++++++
>  .../clock/amlogic,c3-peripherals-clkc.h       | 230 ++++++++++++++++++
>  2 files changed, 316 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/amlogic,c3-peripherals-clkc.yaml
>  create mode 100644 include/dt-bindings/clock/amlogic,c3-peripherals-clkc.h
> 

My bot found errors running 'make DT_CHECKER_FLAGS=-m dt_binding_check'
on your patch (DT_CHECKER_FLAGS is new in v5.13):

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/amlogic,c3-peripherals-clkc.yaml: properties:clocks: 'oneOf' conditional failed, one must be fixed:
	[{'description': 'input oscillator (usually at 24MHz)'}, {'description': 'input fixed pll'}, {'description': 'input fixed pll div2'}, {'description': 'input fixed pll div2p5'}, {'description': 'input fixed pll div3'}, {'description': 'input fixed pll div4'}, {'description': 'input fixed pll div5'}, {'description': 'input fixed pll div7'}, {'description': 'input gp0 pll'}, {'description': 'input hifi pll'}] is too long
	[{'description': 'input oscillator (usually at 24MHz)'}, {'description': 'input fixed pll'}, {'description': 'input fixed pll div2'}, {'description': 'input fixed pll div2p5'}, {'description': 'input fixed pll div3'}, {'description': 'input fixed pll div4'}, {'description': 'input fixed pll div5'}, {'description': 'input fixed pll div7'}, {'description': 'input gp0 pll'}, {'description': 'input hifi pll'}] is too short
	False schema does not allow 10
	1 was expected
	10 is greater than the maximum of 2
	10 is greater than the maximum of 3
	10 is greater than the maximum of 4
	10 is greater than the maximum of 5
	10 is greater than the maximum of 6
	10 is greater than the maximum of 7
	10 is greater than the maximum of 8
	10 is greater than the maximum of 9
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/clock/amlogic,c3-peripherals-clkc.yaml: properties:clock-names: 'oneOf' conditional failed, one must be fixed:
	[{'const': 'xtal'}, {'const': 'fixed_pll'}, {'const': 'fclk_div2'}, {'const': 'fclk_div2p5'}, {'const': 'fclk_div3'}, {'const': 'fclk_div4'}, {'const': 'fclk_div5'}, {'const': 'fclk_div7'}, {'const': 'gp0_pll'}, {'const': 'hifi_pll'}] is too long
	[{'const': 'xtal'}, {'const': 'fixed_pll'}, {'const': 'fclk_div2'}, {'const': 'fclk_div2p5'}, {'const': 'fclk_div3'}, {'const': 'fclk_div4'}, {'const': 'fclk_div5'}, {'const': 'fclk_div7'}, {'const': 'gp0_pll'}, {'const': 'hifi_pll'}] is too short
	False schema does not allow 10
	1 was expected
	10 is greater than the maximum of 2
	10 is greater than the maximum of 3
	10 is greater than the maximum of 4
	10 is greater than the maximum of 5
	10 is greater than the maximum of 6
	10 is greater than the maximum of 7
	10 is greater than the maximum of 8
	10 is greater than the maximum of 9
	hint: "minItems" is only needed if less than the "items" list length
	from schema $id: http://devicetree.org/meta-schemas/items.yaml#
Error: Documentation/devicetree/bindings/clock/amlogic,c3-peripherals-clkc.example.dts:23.31-32 syntax error
FATAL ERROR: Unable to parse input tree
make[2]: *** [scripts/Makefile.lib:419: Documentation/devicetree/bindings/clock/amlogic,c3-peripherals-clkc.example.dtb] Error 1
make[2]: *** Waiting for unfinished jobs....
make[1]: *** [/builds/robherring/dt-review-ci/linux/Makefile:1427: dt_binding_check] Error 2
make: *** [Makefile:234: __sub-make] Error 2

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20230928063448.3544464-3-xianwei.zhao@amlogic.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

