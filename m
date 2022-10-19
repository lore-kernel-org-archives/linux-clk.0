Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62B55C433FE
	for <linux-clk@archiver.kernel.org>; Wed, 19 Oct 2022 05:50:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229922AbiJSFuC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 Oct 2022 01:50:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229926AbiJSFuA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Oct 2022 01:50:00 -0400
Received: from mx1.tq-group.com (mx1.tq-group.com [93.104.207.81])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 867BA2FC33;
        Tue, 18 Oct 2022 22:49:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1666158597; x=1697694597;
  h=subject:from:to:cc:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=sfZASKJMevM/XYzFNRMC+Oxl4B5+UhpkwhkxSapBR3U=;
  b=FUSRG1MftlyRymmhvoWLD68qb+wQamwcyyOwUUTu9We+YC/AhRXEmn0e
   UdYLHhUAfXdfG89cpeI4CIwu1JgWvQEDlH2y0KpkM50v3f6rSpaCk+JXT
   VKOBFBnOwBKAWD/XsrKb50UtMdoYUhAWnqZ4B1FLl5RV1ECzCMFH8VoqD
   T2yeyzWzTfLbl1Air3Y6+XMvkHiq0h7hcUVJzb+yVU5R9YcaaZUwYcVev
   6ho9HKkRzJnVgJsNJNQi/WVeZph4jbbNgD7gq5SIw5GB7qSKBCnPaQs8g
   jgV34jhLGDdF1IDd48dnU9O2OSfMnMaEgOy9DlLbkwMEtDOvwzCVjmCql
   Q==;
X-IronPort-AV: E=Sophos;i="5.95,195,1661810400"; 
   d="scan'208";a="26831791"
Received: from unknown (HELO tq-pgp-pr1.tq-net.de) ([192.168.6.15])
  by mx1-pgp.tq-group.com with ESMTP; 19 Oct 2022 07:49:53 +0200
Received: from mx1.tq-group.com ([192.168.6.7])
  by tq-pgp-pr1.tq-net.de (PGP Universal service);
  Wed, 19 Oct 2022 07:49:53 +0200
X-PGP-Universal: processed;
        by tq-pgp-pr1.tq-net.de on Wed, 19 Oct 2022 07:49:53 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=tq-group.com; i=@tq-group.com; q=dns/txt; s=key1;
  t=1666158593; x=1697694593;
  h=from:to:cc:date:message-id:in-reply-to:references:
   mime-version:content-transfer-encoding:subject;
  bh=sfZASKJMevM/XYzFNRMC+Oxl4B5+UhpkwhkxSapBR3U=;
  b=Fn3RfaszCIF48ezU5jfqW7bf1X7TxRmMbfh7ySD+YgZJcBZfHChOvW6m
   HU42tujQjkvoYoFhSaTe8zap/MUJHNMkqKkfJIwyNh8KfS7DhrN8O31O6
   cVciahLlL38sMQrq/yt6qRmtsfTCnUs/NHmHuV+JZ5J8o2trNNcGTafga
   l0YrCKBAaFCVwGOD0cn1xW8jsRdDf35nudMpY+GROwemJbjiD2zOFw9Bp
   otqfObinqbrTQzFZfnkUAUO9xq2QhrMXrPt1wyTpkAq2XeW2w1KrHBxIH
   rcl5nWeiXiTxsz8GzLTxe5U1kD4QVwrQ6+p64wmdecn1EJjp9vYbjPmmz
   w==;
X-IronPort-AV: E=Sophos;i="5.95,195,1661810400"; 
   d="scan'208";a="26831790"
Subject: Re: Re: [PATCH 1/1] dt-bindings: clock: ti,cdce925: Convert to DT schema
Received: from vtuxmail01.tq-net.de ([10.115.0.20])
  by mx1.tq-group.com with ESMTP; 19 Oct 2022 07:49:52 +0200
Received: from steina-w.localnet (unknown [10.123.53.21])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
        (No client certificate requested)
        by vtuxmail01.tq-net.de (Postfix) with ESMTPSA id CF6CA280056;
        Wed, 19 Oct 2022 07:49:52 +0200 (CEST)
From:   Alexander Stein <alexander.stein@ew.tq-group.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Date:   Wed, 19 Oct 2022 07:49:48 +0200
Message-ID: <8628461.lOV4Wx5bFT@steina-w>
Organization: TQ-Systems GmbH
In-Reply-To: <3339aa03-5e43-7579-837f-d70eb0f4dae6@linaro.org>
References: <20221018072106.2391771-1-alexander.stein@ew.tq-group.com> <3339aa03-5e43-7579-837f-d70eb0f4dae6@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Krzysztof,

thanks for your review.

Am Dienstag, 18. Oktober 2022, 15:51:35 CEST schrieb Krzysztof Kozlowski:
> On 18/10/2022 03:21, Alexander Stein wrote:
> > Convert the TI CDCE925 clock binding to DT schema format.
> > Including a small fix: Add the missing 'ti' prefix in the example
> > compatible.
> > 
> > Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> 
> Thank you for your patch. There is something to discuss/improve.
> 
> > diff --git a/Documentation/devicetree/bindings/clock/ti,cdce925.yaml
> > b/Documentation/devicetree/bindings/clock/ti,cdce925.yaml new file mode
> > 100644
> > index 000000000000..1e68ee68e458
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/clock/ti,cdce925.yaml
> > @@ -0,0 +1,104 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only or BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/clock/ti,cdce925.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: TI CDCE913/925/937/949 programmable I2C clock synthesizers node
> > bindings
> Drop "node bindings"

Thanks, will do so.

> > +
> > +maintainers:
> > +  - Mike Looijmans <mike.looijmans@topic.nl>
> > +
> > +description: |
> > +  Flexible Low Power LVCMOS Clock Generator with SSC Support for EMI
> > Reduction +
> > +  - CDCE(L)913: 1-PLL, 3 Outputs https://www.ti.com/product/cdce913
> > +  - CDCE(L)925: 2-PLL, 5 Outputs https://www.ti.com/product/cdce925
> > +  - CDCE(L)937: 3-PLL, 7 Outputs https://www.ti.com/product/cdce937
> > +  - CDCE(L)949: 4-PLL, 9 Outputs https://www.ti.com/product/cdce949
> > +
> > +properties:
> > +  $nodename:
> > +    pattern: "^clock-controller$"
> 
> Drop this requirement. It is in general expected, but there is no need
> for each binding to specify it.

Should this be put in a common binding then?

> Other problem is that you did not actually test these bindings before
> sending...
> 
> > +
> > +  compatible:
> > +    enum:
> > +      - ti,cdce913
> > +      - ti,cdce925
> > +      - ti,cdce937
> > +      - ti,cdce949
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    items:
> > +      - description: fixed parent clock
> > +
> > +  "#clock-cells":
> > +    const: 1
> > +
> > +  vdd-supply:
> > +    description: Regulator that provides 1.8V Vdd power supply
> > +
> > +  vddout-supply:
> > +    description: |
> > +      Regulator that provides Vddout power supply.
> > +      non-L variant: 2.5V or 3.3V for
> > +      L variant: 1.8V for
> > +
> > +  xtal-load-pf:
> > +    $ref: /schemas/types.yaml#/definitions/uint32
> > +    description: |
> > +      Crystal load-capacitor value to fine-tune performance on a
> > +      board, or to compensate for external influences.
> > +
> > +patternProperties:
> > +  "^PLL[1-4]$":
> > +    type: object
> > +    description: |
> > +      optional child node can be used to specify spread
> > +      spectrum clocking parameters for a board
> > +
> 
>     additionalProperties: false

Will do.

Thanks and best regards,
Alexander

> > +    properties:
> > +      spread-spectrum:
> > +        $ref: /schemas/types.yaml#/definitions/uint32
> > +        description: SSC mode as defined in the data sheet
> > +
> > +      spread-spectrum-center:
> > +        type: boolean
> > +        description: |
> > +          Use "centered" mode instead of "max" mode. When
> > +          present, the clock runs at the requested frequency on average.
> > +          Otherwise the requested frequency is the maximum value of the
> > +          SCC range.
> > +
> 
> Best regards,
> Krzysztof




