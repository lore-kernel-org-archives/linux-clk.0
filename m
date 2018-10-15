Return-Path: <SRS0=3y70=M3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07280C04AA5
	for <linux-clk@archiver.kernel.org>; Mon, 15 Oct 2018 15:47:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AF9A32089D
	for <linux-clk@archiver.kernel.org>; Mon, 15 Oct 2018 15:47:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="jNJMFmBW"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF9A32089D
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=verge.net.au
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726660AbeJOXct (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 Oct 2018 19:32:49 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:48555 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726524AbeJOXct (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 Oct 2018 19:32:49 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 40D3D25B815;
        Tue, 16 Oct 2018 02:46:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1539618419; bh=DFfjGCdxqktqqdQB/hSnDquUZXX0R0Zv04ue02Esqa4=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jNJMFmBWwAT0nIrRksZJTTI7fjX26WMutilRN205TVt3qLaNXIDbOv6pklxCfuWeQ
         oCnGgGrQxJ5rsBXWSJyEsmYFdJ9P4tD6NPe8e3M10kaelVHkezgIkpGErH6cbS1N4Y
         0jQ4zrrQleVa4o6F1wLpFIxqynDKdBnz9DrKHm/8=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 2E20B940443; Mon, 15 Oct 2018 17:46:57 +0200 (CEST)
Date:   Mon, 15 Oct 2018 17:46:57 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Chris Brandt <chris.brandt@renesas.com>
Cc:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-clk@vger.kernel.org, linux-mmc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v4 3/3] dt-bindings: mmc: tmio_mmc: Document Renesas
 R7S9210
Message-ID: <20181015154656.zlzfuw2oi5oazni3@verge.net.au>
References: <20181012122924.5543-1-chris.brandt@renesas.com>
 <20181012122924.5543-4-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181012122924.5543-4-chris.brandt@renesas.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Oct 12, 2018 at 07:29:24AM -0500, Chris Brandt wrote:
> Document support for the RZ/A2 (R7S9210) SoC.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

> ---
> v2:
>  * Documented that R7S9210 has 2 clocks
> ---
>  Documentation/devicetree/bindings/mmc/tmio_mmc.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt b/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
> index d39d5e46f7d2..cdfbcce34b97 100644
> --- a/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
> +++ b/Documentation/devicetree/bindings/mmc/tmio_mmc.txt
> @@ -13,6 +13,7 @@ Required properties:
>  - compatible: should contain one or more of the following:
>  		"renesas,sdhi-sh73a0" - SDHI IP on SH73A0 SoC
>  		"renesas,sdhi-r7s72100" - SDHI IP on R7S72100 SoC
> +		"renesas,sdhi-r7s9210" - SDHI IP on R7S9210 SoC
>  		"renesas,sdhi-r8a73a4" - SDHI IP on R8A73A4 SoC
>  		"renesas,sdhi-r8a7740" - SDHI IP on R8A7740 SoC
>  		"renesas,sdhi-r8a7743" - SDHI IP on R8A7743 SoC
> @@ -54,7 +55,7 @@ Required properties:
>  	  "core" and "cd". If the controller only has 1 clock, naming is not
>  	  required.
>  	  Devices which have more than 1 clock are listed below:
> -	  2: R7S72100
> +	  2: R7S72100, R7S9210
>  
>  Optional properties:
>  - pinctrl-names: should be "default", "state_uhs"
> -- 
> 2.16.1
> 
