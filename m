Return-Path: <SRS0=BgTf=NW=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.5 required=3.0 tests=MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B434AC43441
	for <linux-clk@archiver.kernel.org>; Sun, 11 Nov 2018 22:40:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 86D41214F1
	for <linux-clk@archiver.kernel.org>; Sun, 11 Nov 2018 22:40:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 86D41214F1
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731327AbeKLIaX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 12 Nov 2018 03:30:23 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:34576 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730788AbeKLIaW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 12 Nov 2018 03:30:22 -0500
Received: by mail-ot1-f67.google.com with SMTP id t5so6377640otk.1;
        Sun, 11 Nov 2018 14:40:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=PRggpepsYoBWMzUKqqkktiI6vnQ9tYjyWZlY19PySSk=;
        b=JSUCJQa00y7FrWnP0Hxg4t3IFpfEigTQAwx4bMI34h6QmrHvFEAanq56w/MhW0WjKx
         yskcB2dd0A15pEJ3Ses0eIlvSr0sI/WhpOW7+eXjf4t6GdzSVX8b0Fqa59Vo5MsXCExz
         7RT6me6xsd4KFbbkwai3m4Lmisc+kJXfT/dRrJI2TjylCKhyGyTUN6I8hD44XSyDGkku
         I76UcAWutbVsad9IKrum0agQJf8xYsUPlvQiCv4+K3ESW7yrnme7NzXMFz97IsaNpEo3
         enwSyuZ8wJJao8NxVD+Rdi4hYnNbftTTMf51zKi7L+JIVIJQ+opMmxiDQNlXgV6q2+BU
         pxOg==
X-Gm-Message-State: AGRZ1gIB4muyvLXvMuUHAN18EUyEBnydMxi9+KYgsv327+3a0uu99Tjy
        zFiHMlLIbUgjsu/aklZPWg==
X-Google-Smtp-Source: AJdET5ca8Mx2sibs2b76GE7kpml76XCrh1sSJXEEYzVYZ2Od7if7XiS4Nxm7Bgsgc8vFoeUZpeUxew==
X-Received: by 2002:a9d:5249:: with SMTP id q9mr10281074otg.160.1541976022009;
        Sun, 11 Nov 2018 14:40:22 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id d140-v6sm11287939oig.7.2018.11.11.14.40.21
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 11 Nov 2018 14:40:21 -0800 (PST)
Date:   Sun, 11 Nov 2018 16:40:20 -0600
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
Subject: Re: [PATCH V6 4/6] dt-bindings: clock: add imx8qxp lpcg clock binding
Message-ID: <20181111224020.GA2539@bogus>
References: <1541862894-8209-1-git-send-email-aisheng.dong@nxp.com>
 <1541862894-8209-5-git-send-email-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1541862894-8209-5-git-send-email-aisheng.dong@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sat, 10 Nov 2018 15:20:01 +0000, "A.s. Dong" wrote:
> The Low-Power Clock Gate (LPCG) modules contain a local programming
> model to control the clock gates for the peripherals. An LPCG module
> is used to locally gate the clocks for the associated peripheral.
> 
> Note:
> This level of clock gating is provided after the clocks are generated
> by the SCU resources and clock controls. Thus even if the clock is
> enabled by these control bits, it might still not be running based
> on the base resource.
> 
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
>  .../devicetree/bindings/clock/imx8qxp-lpcg.txt     |  51 +++++++
>  include/dt-bindings/clock/imx8qxp-clock.h          | 153 +++++++++++++++++++++
>  2 files changed, 204 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/imx8qxp-lpcg.txt
> 

Reviewed-by: Rob Herring <robh@kernel.org>
