Return-Path: <SRS0=hoZU=QU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 18946C4360F
	for <linux-clk@archiver.kernel.org>; Wed, 13 Feb 2019 22:18:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DBF60222D0
	for <linux-clk@archiver.kernel.org>; Wed, 13 Feb 2019 22:18:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1550096302;
	bh=NjxvG2vH9EGxV1MIyZ9YZ/c9CU2S6KCproJc0e/5f6s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=I6p4FO33pgdCzudmwGj3JV7Hcr0/1u6EnTecK5mkLysqwhrAyfYwOxcmDKh12CTmJ
	 ioLJ+4KMchYguSnXsFRmvv3PMYFZpWJ4qxnaG8Dip0581ThieR4fh0suZfAipNlyY1
	 Wy3N1nb9fnJNoMJAPXVeXrky/Ys+5Rm07D+bdew4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729150AbfBMWSV (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Feb 2019 17:18:21 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:46165 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387673AbfBMWSV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 13 Feb 2019 17:18:21 -0500
Received: by mail-ot1-f65.google.com with SMTP id w25so7058253otm.13;
        Wed, 13 Feb 2019 14:18:20 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=pd9o8ataUkpBXxoO7hMHfmRxCLrxCxgfeyQ1lASG11c=;
        b=L/gtnj4QXiF0iAWM9KpeFa6WRNtfoiyBuC/mbW6FsUlUsSToeVu7sOR9G+xNgJPu1K
         s1Va36np42x38obkVJ7kvycxcm9wp9BRjGXkbYTOUFkxxDZO+uwWSKvAyuKut4Wm8dfl
         JPTMSNPXBb2jmhLHCNlqlga6qCl4NZy+Yo2vI3Fsyr7CjmLvxygtZTb4N/vYtAtZ2L6P
         e141fDQbd6KS5025ge/zHUJQpr0GFmaJfF2h6+/gTdFaUgYiyYHlp+hzd1TlsP7S25XJ
         WKGHWTzi3yxs07+O1dSxlLCGaC2YsRuy+0kz8DoHMVQw5OFbIbJYk8ThJsiAGi/bOPjV
         IVnA==
X-Gm-Message-State: AHQUAuaac5XsCiBlIxCXzKX9+8XIiXinw/aL8t/2QfCRG1+GtPcQujye
        oJI+D9SwkyqfWFcM7gqDHrWnhTg=
X-Google-Smtp-Source: AHgI3IbGgFCrxxQFC0pRBvAkQXUFgoQdsgKV2NPuxrj/AybyL7pOIPot3sLKOaueYCNOwYRay/pIog==
X-Received: by 2002:aca:39d7:: with SMTP id g206mr298035oia.142.1550096299861;
        Wed, 13 Feb 2019 14:18:19 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id t12sm233214otk.61.2019.02.13.14.18.18
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 13 Feb 2019 14:18:18 -0800 (PST)
Date:   Wed, 13 Feb 2019 16:18:18 -0600
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
Subject: Re: [PATCH V3 4/5] dt-bindings: imx8-clock: add a53 and a72 clock id
Message-ID: <20190213221818.GA13126@bogus>
References: <1548335800-6438-1-git-send-email-aisheng.dong@nxp.com>
 <1548335800-6438-5-git-send-email-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1548335800-6438-5-git-send-email-aisheng.dong@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, Jan 24, 2019 at 01:22:45PM +0000, Aisheng Dong wrote:
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
> v1->v2:
>  * change cpu clock to cpu cluster clock per Rob's suggestion
> ---
>  include/dt-bindings/clock/imx8-clock.h | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/include/dt-bindings/clock/imx8-clock.h b/include/dt-bindings/clock/imx8-clock.h
> index b149e63..dcce744 100644
> --- a/include/dt-bindings/clock/imx8-clock.h
> +++ b/include/dt-bindings/clock/imx8-clock.h
> @@ -14,10 +14,12 @@
>  /* CPU */
>  #define IMX_A35_CLK					1
>  #define IMX_CPU_CLUSTER_A35_CLK				1
> +#define IMX_CPU_CLUSTER_A53_CLK				2
> +#define IMX_CPU_CLUSTER_A72_CLK				3

I still don't get this. How many clock outputs does the clock controller 
have for CPUs? If 3, then this is correct. If it's the same clock 
controller bits across different SoCs, then just name it something like 
IMX_CPU_CLUSTER_CLK and reuse the same ID.

>  /* LSIO SS */
> -#define IMX_LSIO_MEM_CLK				2
> -#define IMX_LSIO_BUS_CLK				3
> +#define IMX_LSIO_MEM_CLK				6
> +#define IMX_LSIO_BUS_CLK				7

Changing numbering is not good, but I guess it's early for imx8.

>  #define IMX_LSIO_PWM0_CLK				10
>  #define IMX_LSIO_PWM1_CLK				11
>  #define IMX_LSIO_PWM2_CLK				12
> -- 
> 2.7.4
> 
