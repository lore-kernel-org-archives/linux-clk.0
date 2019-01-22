Return-Path: <SRS0=Mnuj=P6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 021F1C37122
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jan 2019 00:10:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BE8512085A
	for <linux-clk@archiver.kernel.org>; Tue, 22 Jan 2019 00:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1548115814;
	bh=O69gUrzvQdtPbltNGSMANqLLOln8m0bo6Bz9oWKy/DI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=ifPXLh+8G9Thpt9yUQglCCjhmdjJicJa4IkaFdlnbpkE6xxXtTwtTODCFkWukSuUi
	 j+/TGQ73fIXwIiFXPAwHgwfbFRlaZafcA9+F8NhBAKY5KBoXGY6GJZ9vfC2QjBIjWD
	 PG/c0iKdHKUwV/lz7GxnNfHfONLvtUctr7j5t4ug=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725994AbfAVAKO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Jan 2019 19:10:14 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:36156 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725962AbfAVAKO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Jan 2019 19:10:14 -0500
Received: by mail-ot1-f66.google.com with SMTP id k98so22122644otk.3;
        Mon, 21 Jan 2019 16:10:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=EfZC0VAj6Y+cZhl1NaUQWilAbKYR4kf4ei+g9fCWmgA=;
        b=XVz4ktWssR1Ciq2kA1hD3EAhDhSJdfRHwLDmZem8i5Dwqr5Bo6rQlqQL+sTSFf2zxA
         /9MukR3JQ/REbYGwCHOy0NS3WLz/hJLMRkC1NeTPLAG8IN1ObzOSMr2JMmng41VFDmwx
         a6Pvjwz6yqYka0tpLuf4rTvTDizigvb5FOKhQ/vmNKaTKaofQa4cI8D3K2oepDf7LT5X
         bVTTsQJOe0THJgPoOC/UxNRcBIdwCy3NsmeMqylL4FCKvHxd5PeRh0UELA2KuzFDgKUP
         AwJnyeDCOK3ZVaSR9sRjeT49h72AM5r+3W8xlLM6A4gd/MUxlR0aRZKE+uyJMHjIvOkg
         j/7g==
X-Gm-Message-State: AJcUukcibTsp0eR2nyf+wkdytpgrMWOxX4+uC/756XH94qrYfR0QMN7O
        UXYeXl3/O/PqXRBltJ7UH1rykjTkmA==
X-Google-Smtp-Source: ALg8bN7sx3ZCStWsbGDx/KbHLSJDDP8GPLomahRsm4xBDZGGjuAoeqwukFBth+AiGKth58noj3A33A==
X-Received: by 2002:a9d:1296:: with SMTP id g22mr19371916otg.305.1548115813104;
        Mon, 21 Jan 2019 16:10:13 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id n185sm6912065oih.18.2019.01.21.16.10.11
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Jan 2019 16:10:12 -0800 (PST)
Date:   Mon, 21 Jan 2019 18:10:11 -0600
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
Subject: Re: [PATCH RESEND v1 4/4] dt-bindings: imx8-clock: add a53 and a72
 clock id
Message-ID: <20190122001011.GA15952@bogus>
References: <1547207400-28307-1-git-send-email-aisheng.dong@nxp.com>
 <1547207400-28307-5-git-send-email-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1547207400-28307-5-git-send-email-aisheng.dong@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Jan 11, 2019 at 11:56:09AM +0000, Aisheng Dong wrote:
> Add a53 and a72 clock id, as there's still no users, we update
> IMX_LSIO_MEM_CLK base to start from 6 to allow a53 and a72 clock
> id to be continued with a35 clk.
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
>  include/dt-bindings/clock/imx8-clock.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/include/dt-bindings/clock/imx8-clock.h b/include/dt-bindings/clock/imx8-clock.h
> index 4236818..2f1aa2f 100644
> --- a/include/dt-bindings/clock/imx8-clock.h
> +++ b/include/dt-bindings/clock/imx8-clock.h
> @@ -13,10 +13,12 @@
>  
>  /* CPU */
>  #define IMX_A35_CLK					1
> +#define IMX_A53_CLK					2
> +#define IMX_A72_CLK					3

All 3 cores in one chip? If not maybe these should be split or define 
them as cpu cluster x clocks.

>  
>  /* LSIO SS */
> -#define IMX_LSIO_MEM_CLK				2
> -#define IMX_LSIO_BUS_CLK				3
> +#define IMX_LSIO_MEM_CLK				6
> +#define IMX_LSIO_BUS_CLK				7
>  #define IMX_LSIO_PWM0_CLK				10
>  #define IMX_LSIO_PWM1_CLK				11
>  #define IMX_LSIO_PWM2_CLK				12
> -- 
> 2.7.4
> 
