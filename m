Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 882A6C61DB3
	for <linux-clk@archiver.kernel.org>; Thu, 12 Jan 2023 11:05:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230324AbjALLFx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 12 Jan 2023 06:05:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229968AbjALLFX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 12 Jan 2023 06:05:23 -0500
Received: from relay7-d.mail.gandi.net (relay7-d.mail.gandi.net [217.70.183.200])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9180EC77C;
        Thu, 12 Jan 2023 02:57:19 -0800 (PST)
Received: from booty (unknown [77.244.183.192])
        (Authenticated sender: luca.ceresoli@bootlin.com)
        by mail.gandi.net (Postfix) with ESMTPSA id D4EF720004;
        Thu, 12 Jan 2023 10:57:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
        t=1673521038;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=hwka70mk2roiY/2UM2tl1d3OuzaAYPBlsiw7EdglbC4=;
        b=jr6MIV2RHubYbV3OPTJaRVlRwbnEVILsNXncrXzYt7wsExBb+7MKRXqGLaFxtLUGrvNmoN
        0u2GFc1nirY0r0FDB4bwuK0q6szgs0p4Dkpbaxgda1K2SiJhoEdJlCOi/PDfaLCU28DDI4
        sqdzNG1bguAAGK/Ef0tjp6wkwpIXnMKNs8bLT8HkcV5V6qLEXQioKtESOmieOuVr7723jA
        eKSVxzJY62oZfiT1my/GxvGY9s0HBoQMfI4+c1pat+tYH5K6rUSICGWBVtR/RdFFbegpR7
        Z74e35kmcwd1onaJziBzgqvf55vv1j+GzrZxNCb090ry5h8fidVMhK0QhVNspQ==
Date:   Thu, 12 Jan 2023 11:57:15 +0100
From:   Luca Ceresoli <luca.ceresoli@bootlin.com>
To:     Geert Uytterhoeven <geert+renesas@glider.be>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Sean Anderson <sean.anderson@seco.com>,
        Marek Vasut <marek.vasut@gmail.com>,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-reneas-soc@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: clk: vc5: Make SD/OE pin configuration
 properties not required
Message-ID: <20230112115715.3112fa87@booty>
In-Reply-To: <68037ad181991fe0b792f6d003e3e9e538d5ffd7.1673452118.git.geert+renesas@glider.be>
References: <68037ad181991fe0b792f6d003e3e9e538d5ffd7.1673452118.git.geert+renesas@glider.be>
Organization: Bootlin
X-Mailer: Claws Mail 4.0.0 (GTK+ 3.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Geert,

On Wed, 11 Jan 2023 16:55:17 +0100
Geert Uytterhoeven <geert+renesas@glider.be> wrote:

> "make dtbs_check":
> 
>     arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dtb: clock-generator@6a: 'idt,shutdown' is a required property
> 	    From schema: Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
>     arch/arm64/boot/dts/renesas/r8a77951-salvator-xs.dtb: clock-generator@6a: 'idt,output-enable-active' is a required property
> 	    From schema: Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
> 
> Versaclock 5 clock generators can have their configuration stored in
> One-Time Programmable (OTP) memory.  Hence there is no need to specify
> DT properties for manual configuration if the OTP has been programmed
> before.  Likewise, the Linux driver does not touch the SD/OE bits if the
> corresponding properties are not specified, cfr. commit d83e561d43bc71e5
> ("clk: vc5: Add properties for configuring SD/OE behavior").
> 
> Reflect this in the bindings by making the "idt,shutdown" and
> "idt,output-enable-active" properties not required, just like the
> various "idt,*" properties in the per-output child nodes.
> 
> Fixes: 275e4e2dc0411508 ("dt-bindings: clk: vc5: Add properties for configuring the SD/OE pin")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks good catch!

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

-- 
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
