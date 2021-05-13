Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8925DC43460
	for <linux-clk@archiver.kernel.org>; Thu, 13 May 2021 07:18:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 68EDD6143C
	for <linux-clk@archiver.kernel.org>; Thu, 13 May 2021 07:18:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231451AbhEMHTf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 May 2021 03:19:35 -0400
Received: from mail.kernel.org ([198.145.29.99]:34928 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229786AbhEMHTd (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 13 May 2021 03:19:33 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 729D4611AE;
        Thu, 13 May 2021 07:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1620890304;
        bh=WAvO94HsJCdneEYNhdUxVhfZZdUZi9qG7hKuUaNAHiY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GsjYj+VEwKTwuIV0Hlc6xnP18ifEA36HCMSai0I5JUnGPQu0lEngubR/4Ro+03zYk
         +hSJaLMOA+3V1F6XzbcdkWv+ugSOB823LOSt8TINLs037Q7zFsjAh6JvifCfEZnyVF
         pTNIzxIJtpt/r3cbMC73JqrquANtz1CmIE5WOYfetaZWwN7deE2IrsREh28CwFVb5X
         F1Rhsobm6bn9qreTg2gTfCnactdBDjX/EOH2GxfgjOa0ePktwA+hWJ4qHeJsj0O0GL
         AfVCTsniYkkGo2W7m0h3lodRihadnblxyob7oiSxy+7IF5FvwHUtnRejacYMNIlnFa
         4TFCSkrkQEY7Q==
Date:   Thu, 13 May 2021 10:18:20 +0300
From:   Abel Vesa <abelvesa@kernel.org>
To:     Dong Aisheng <aisheng.dong@nxp.com>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        dongas86@gmail.com, kernel@pengutronix.de, shawnguo@kernel.org,
        linux-imx@nxp.com, abel.vesa@nxp.com, sboyd@kernel.org,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 1/6] dt-bindings: arm: imx: scu: fix naming typo of clk
 compatible string
Message-ID: <YJzSvPtw7djhGHnD@ryzen.lan>
References: <20210423033334.3317992-1-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210423033334.3317992-1-aisheng.dong@nxp.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21-04-23 11:33:29, Dong Aisheng wrote:
> There is a typo in binding doc that the name of compatible string of
> scu clock should be "fsl,xxx-clk" rather than "fsl,xxx-clock".
> In reality, both example and dts using "fsl,xxx-clk", so fixing the doc
> is enough.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

Reviewed-by: Abel Vesa <abel.vesa@nxp.com>

> ---
>  Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> index 395359dc94fd..3adf3f6f2beb 100644
> --- a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> +++ b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> @@ -86,8 +86,8 @@ This binding uses the common clock binding[1].
>  
>  Required properties:
>  - compatible:		Should be one of:
> -			  "fsl,imx8qm-clock"
> -			  "fsl,imx8qxp-clock"
> +			  "fsl,imx8qm-clk"
> +			  "fsl,imx8qxp-clk"
>  			followed by "fsl,scu-clk"
>  - #clock-cells:		Should be either
>  			2: Contains the Resource and Clock ID value.
> -- 
> 2.25.1
> 
