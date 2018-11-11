Return-Path: <SRS0=BgTf=NW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0020EC43441
	for <linux-clk@archiver.kernel.org>; Sun, 11 Nov 2018 22:38:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C6A3921508
	for <linux-clk@archiver.kernel.org>; Sun, 11 Nov 2018 22:38:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C6A3921508
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2391320AbeKLI2P (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Nov 2018 03:28:15 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:37334 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391260AbeKLI2O (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Nov 2018 03:28:14 -0500
Received: by mail-oi1-f196.google.com with SMTP id w66-v6so5723713oiw.4;
        Sun, 11 Nov 2018 14:38:15 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=80if7q/gGfGy786gaRRJAdnTJYg+sbW6WlRWXtASF04=;
        b=e+KOMlL6rEN7xzatW+uvqgILGBdyArYJsVLwhykw6trJ1CN3tP2ZO/5K6Yf0hvZTHF
         Bzxb8Q70zu+cNJsglL7fZLWC05evIxx49+uwiXMcuQqqObAPMDfavVXUsnNgbzB28Kdm
         OJjSD6ayO9SiHWmD2/iX+zIBOC+URQI3V9XIsCRd/Trv0jkMy5fXPQnWhFZhrPn5ebFM
         6khcbg/CCjCAkkNv8PCfEFgsoEPjcxsuilsa/jVtD42FcYbPDSdI5iVzUrUhhWKpHH6o
         pJTzhghBCCVuIWSrVbvus52YeXOqF0VfxCzznFqGueRCSou/MMxkt2ETwNraJp075AN+
         0hjg==
X-Gm-Message-State: AGRZ1gLzQ9uYURMIYMOKEIaNYUZ8eGqEnHE73SFZYL+X9mW2SqfiWst7
        4pT8m5e4Mykp8s6fzjgLug==
X-Google-Smtp-Source: AJdET5f/GCpMxPCTzhxtUGy7Vx3Nv4oyFU+KswWydAIaK+fHCl38HCSLb8JZsmgNbHEQEcOwdXEWmw==
X-Received: by 2002:aca:ceca:: with SMTP id e193-v6mr10372627oig.247.1541975895379;
        Sun, 11 Nov 2018 14:38:15 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m6-v6sm853989oia.51.2018.11.11.14.38.14
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Nov 2018 14:38:14 -0800 (PST)
Date:   Sun, 11 Nov 2018 16:38:13 -0600
From:   Rob Herring <robh@kernel.org>
To:     "A.s. Dong" <aisheng.dong@nxp.com>
Cc:     "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "A.s. Dong" <aisheng.dong@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH V6 2/6] dt-bindings: clock: imx8qxp: add SCU clock IDs
Message-ID: <20181111223813.GA31512@bogus>
References: <1541862894-8209-1-git-send-email-aisheng.dong@nxp.com>
 <1541862894-8209-3-git-send-email-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1541862894-8209-3-git-send-email-aisheng.dong@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, 10 Nov 2018 15:19:53 +0000, "A.s. Dong" wrote:
> Add IMX8QXP SCU clock IDs.
> 
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: devicetree@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
> v6: new patch, separate from driver changes to avoid a checkpatch warning
>     IDs are changed a lot due to SCU divider/gate/mux are merged into
>     one general SCU clock and LPCG clocks are moved out.
> ---
>  include/dt-bindings/clock/imx8qxp-clock.h | 136 ++++++++++++++++++++++++++++++
>  1 file changed, 136 insertions(+)
>  create mode 100644 include/dt-bindings/clock/imx8qxp-clock.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
