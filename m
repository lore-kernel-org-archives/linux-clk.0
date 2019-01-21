Return-Path: <SRS0=Ex8p=P5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABCE0C37121
	for <linux-clk@archiver.kernel.org>; Mon, 21 Jan 2019 23:27:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 755B72089F
	for <linux-clk@archiver.kernel.org>; Mon, 21 Jan 2019 23:27:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1548113252;
	bh=PhDRZnYPQiFkslBIDnjjZIPx/QsSo5hRw2lW4ojaRAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Szr3AmT3AUOT/mSGw0lSl6jq1hBlbkD6QeZV6Hp4A6Ajull86944ehVVi/QIZcO7C
	 WPaPDXn0ZDNlD9yuGZU92SPUQtRqGmVbd8uoowOB7bcExeABqpVZxg4dSBtpvS0IXe
	 2UkvHQI0epTmZja4umWmTD2sEpa2XIpmu2AwmAqE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727153AbfAUX1c (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Jan 2019 18:27:32 -0500
Received: from mail-oi1-f195.google.com ([209.85.167.195]:41167 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726027AbfAUX1b (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Jan 2019 18:27:31 -0500
Received: by mail-oi1-f195.google.com with SMTP id j21so15906054oii.8;
        Mon, 21 Jan 2019 15:27:31 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QAEazAvtZGRVmztR0fZs7peeBmBQfNODzrZoRRkZ2+E=;
        b=kfXyQbpT6FiPbKM7ogViDVdAMObIcjhWs1dlhGKW9l2y3d8Xm5/XPRKpRABuSBGJZL
         u1q0L7X5C4CgWaB0t5HZTpyRiiekLCs2YGmt7pYhf6lOAwTYn8CsHRdC0TZE3D6wrlA1
         9SZtO45cH1vJ9ZOEIWIVVD9aZc/jVYntWdpcYNmJImsFpty0WtFi0wW2d3ywlzbB5cuS
         UAUQwdUoW3p8GEl/zlbIhfBNKYBdbLU6Xh+KKG5P84DsJ3R/XbsGYPReUGqnblHoym3j
         czNpxSURIJbxr9Q5gtkXTm8p/6kHjHpsAE3RyyAL/03bry8M1SUIdqhWkZh42sREaJdf
         FXMw==
X-Gm-Message-State: AJcUukeOd8xKab+FEeqO65iGqxcNXkm+t1C0A8r/wmLouj+wmaUfhGAG
        yDbA8v0vyPF2GnvS6F3aNg==
X-Google-Smtp-Source: ALg8bN6NodnEkkJvprhSDsOkQyWETycLI0imaTFl/Iy7Pb0+Q05zVAycdcoM/CR/TcTjXYk2Y6p8Pg==
X-Received: by 2002:aca:4e11:: with SMTP id c17mr6686465oib.254.1548113251114;
        Mon, 21 Jan 2019 15:27:31 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id c78sm8060369oig.30.2019.01.21.15.27.30
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Jan 2019 15:27:30 -0800 (PST)
Date:   Mon, 21 Jan 2019 17:27:30 -0600
From:   Rob Herring <robh@kernel.org>
To:     Aisheng Dong <aisheng.dong@nxp.com>
Cc:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH RESEND v1 2/4] dt-bindings: fsl: scu: add imx8qm scu
 clock support
Message-ID: <20190121232730.GA22676@bogus>
References: <1547207400-28307-1-git-send-email-aisheng.dong@nxp.com>
 <1547207400-28307-3-git-send-email-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1547207400-28307-3-git-send-email-aisheng.dong@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Jan 11, 2019 at 11:56:00AM +0000, Aisheng Dong wrote:
> Add imx8qm scu clock support
> 
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
>  Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> index 5ec6dca..b6a883e 100644
> --- a/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> +++ b/Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt
> @@ -71,7 +71,8 @@ This binding uses the common clock binding[1].
>  
>  Required properties:
>  - compatible:		Should be one of:
> -			  "fsl,imx8qxp-clock"
> +			  "fsl,imx8qm-clock",
> +			  "fsl,imx8qxp-clock".

No need for the punctuation here. The whole point of one per line is to 
have 1 line changes. Otherwise,

Reviewed-by: Rob Herring <robh@kernel.org>

>  			followed by "fsl,scu-clk"
>  - #clock-cells:		Should be 1. Contains the Clock ID value.
>  - clocks:		List of clock specifiers, must contain an entry for
> -- 
> 2.7.4
> 
