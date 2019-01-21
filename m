Return-Path: <SRS0=Ex8p=P5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73459C37122
	for <linux-clk@archiver.kernel.org>; Mon, 21 Jan 2019 23:26:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 372622089F
	for <linux-clk@archiver.kernel.org>; Mon, 21 Jan 2019 23:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1548113160;
	bh=kL7SpnjpA7oiE93gL+Ld4pSYUGhSxDS6d1LVjo0b4Uw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=OrQ72FSio9nSTaxF3/6rUDnO8ghaW3zZvgxikfItpdsmJKLW/QK6qCwxMzTVjx2LB
	 wtNR/VXuI9vBjmErBd9S2TTMNPtSStR1jGQ7YyqFFAp7xy7wNP6yMNSeC+uIX3lfve
	 s3LvNcSVTR5EkIpAxHEHT5nL37oAfQ0/+6n85POE=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727457AbfAUX0A (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Jan 2019 18:26:00 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:33486 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726027AbfAUXZ7 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Jan 2019 18:25:59 -0500
Received: by mail-oi1-f193.google.com with SMTP id c206so15961323oib.0;
        Mon, 21 Jan 2019 15:25:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=WmTQWk1tuBBNXtE3quj9vUE/URNM/tFV42TrtrkRjgQ=;
        b=QjaT4J7uun5rs3cMbwKexErcPN0Tqr3UUi6NZmRcL1BUB4QXTnk3h1St7bo4k5EpAg
         9aVFNvNP1nj83fnJMPK7JxONcPTi/h8XgQ2POps3lygFl4xrQvlrH6HVGUEAhRHylkqJ
         Vi/3KMNY1c0Ldhi8nQLzbcPHaJev5xyp/BQPZ0fJc9m10qXc6uxymXEjs6Iw8pWzTxIK
         GKLUOxp0W7leDii74/n5mij9lNhnyYmmhfZg65MNqAW1Y2OKHl2J3EPOCJBqqCu5IMTU
         n4AnfUNRUBGtUnRvmhJ2H7OYfnYBDaS40Ya9TUlGV7RTgM9W+PUBn6bDznGUfLntsau2
         wGzg==
X-Gm-Message-State: AJcUuke8/NNlNYjYJQxwQY5X6FgFKqet2SRSPzTL6VZKjsveavF1waO4
        3XtA1KEgQPkOeW7F2oeu+0K45Vbxgg==
X-Google-Smtp-Source: ALg8bN7m0tkrqSqNG1qXNtkUsrzARDXJzoXBMMN8z78PD5etWwRyXXrxaYtAVjevxsjxkGAblpb8zw==
X-Received: by 2002:aca:ef0b:: with SMTP id n11mr6719829oih.116.1548113158823;
        Mon, 21 Jan 2019 15:25:58 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s66sm6805802oia.55.2019.01.21.15.25.57
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Jan 2019 15:25:57 -0800 (PST)
Date:   Mon, 21 Jan 2019 17:25:52 -0600
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
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>
Subject: Re: [PATCH RESEND v1 1/4] dt-bindings: fsl: scu: add fallback
 compatible  string for clock
Message-ID: <20190121232552.GA22199@bogus>
References: <1547207400-28307-1-git-send-email-aisheng.dong@nxp.com>
 <1547207400-28307-2-git-send-email-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1547207400-28307-2-git-send-email-aisheng.dong@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 11 Jan 2019 11:55:56 +0000, Aisheng Dong wrote:
> SCU clock can be used in a similar way by IMX8QXP and IMX8QM SoCs.
> Let's add a "fsl,scu-clk" fallback compatible string to allow other
> SoCs to reuse the common part.
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
>  Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
