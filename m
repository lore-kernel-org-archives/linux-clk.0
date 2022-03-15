Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB9E3C4332F
	for <linux-clk@archiver.kernel.org>; Tue, 15 Mar 2022 22:26:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352228AbiCOW1f (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Mar 2022 18:27:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40770 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1347725AbiCOW1d (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Mar 2022 18:27:33 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16A505C66C;
        Tue, 15 Mar 2022 15:26:20 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id BEA19B81906;
        Tue, 15 Mar 2022 22:26:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DA61C340E8;
        Tue, 15 Mar 2022 22:26:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1647383177;
        bh=5hrzHxo6eD1Jx7XwV0bLxEcWCCkreTCWAqNogWklphY=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=KM9JQWMIYCksFllFqAbIUUOXq/UIjhpgsRXttIV9COuvl3nG7q122di3fsuZVvC8D
         gWPXUnuaHlH906PPIEih0lNxlVh2XEMMqrO3q4SQmaHL8xR3zpTbMdiR9k/zHvNs2c
         CWnvvkJHMqh4D2hNt+1sfj8dzWjuFnmUxGTIRMXm8f7cKVAXM1Y55Ql3VhAtfQy20N
         Ni6r1YgKoKo18FIdLcuC8BA0It4OIdU+vqe/XMV1/J4E3iwTOTtY7vybghQfuMgkjd
         zQgSfkL0w6HFL6yGKramWfCIm5jyC5vHKvXopdGT8qcm/F1Ub62dpqDGW8sBO+xvjL
         lWWyuOUw3MiPw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20220313232926.1004842-1-linus.walleij@linaro.org>
References: <20220313232926.1004842-1-linus.walleij@linaro.org>
Subject: Re: [PATCH 1/2] dt-bindings: clock: u8500: Add clkout clock bindings
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        devicetree@vger.kernel.org
To:     Linus Walleij <linus.walleij@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>
Date:   Tue, 15 Mar 2022 15:26:15 -0700
User-Agent: alot/0.10
Message-Id: <20220315222617.6DA61C340E8@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Linus Walleij (2022-03-13 16:29:25)
> This adds device tree bindings for the externally routed clocks
> CLKOUT1 and CLKOUT2 clocks found in the DB8500.
>=20
> Cc: Ulf Hansson <ulf.hansson@linaro.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  .../bindings/clock/stericsson,u8500-clks.yaml   | 16 ++++++++++++++++
>  include/dt-bindings/clock/ste-db8500-clkout.h   | 17 +++++++++++++++++
>  2 files changed, 33 insertions(+)
>  create mode 100644 include/dt-bindings/clock/ste-db8500-clkout.h
>=20
> diff --git a/Documentation/devicetree/bindings/clock/stericsson,u8500-clk=
s.yaml b/Documentation/devicetree/bindings/clock/stericsson,u8500-clks.yaml
> index 9bc95a308477..afd049be948a 100644
> --- a/Documentation/devicetree/bindings/clock/stericsson,u8500-clks.yaml
> +++ b/Documentation/devicetree/bindings/clock/stericsson,u8500-clks.yaml
> @@ -109,6 +109,22 @@ properties:
> =20
>      additionalProperties: false
> =20
> +  clkout-clock:
> +    description: A subnode with three clock cells for externally routed =
clocks,
> +      output clocks. These are two PRCMU-internal clocks that can be div=
ided and
> +      muxed out on the pads of the DB8500 SoC. The first cell indicates =
which
> +      output clock we are using, possible values are 0 (CLKOUT1) and 1 (=
CLKOUT2).
> +      The second cell indicates which clock we want to use as source, po=
ssible
> +      values are 0 thru 7, see the defines for the different source cloc=
ks.
> +      The third cell is a divider, legal values are 1 thru 63.

I suspect the description would be shorter if the properties of this
node were described in the binding.

> +    type: object
> +
> +    properties:
> +      '#clock-cells':
> +        const: 3
> +
> +    additionalProperties: false
> +

Can you update the example?

>  required:
>    - compatible
>    - reg
