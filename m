Return-Path: <SRS0=Z81n=PE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F541C43387
	for <linux-clk@archiver.kernel.org>; Thu, 27 Dec 2018 21:54:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 24AA5214C6
	for <linux-clk@archiver.kernel.org>; Thu, 27 Dec 2018 21:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1545947692;
	bh=awRPkOCwZCqEXgSjcvnRe+MIIT79iYUZ5M4RJz1z0gk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=HQY9sNndBbe5F6smossbh7fXjU40rvX0W8KGc82l/6xv5EMvtMV4/ZMFmPEIMBrQP
	 GOGjOC35uMzFYbZv9I5+6E5TLJA9h1KvI2ie1LtS99+MYYhS9zISt05iKW9RxRl2UI
	 tOVwZ4OCBc2tGAnSzJdV+k79s3xT66HjaI7rd1EY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729937AbeL0Vyv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Dec 2018 16:54:51 -0500
Received: from mail-io1-f66.google.com ([209.85.166.66]:40086 "EHLO
        mail-io1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729935AbeL0Vyv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Dec 2018 16:54:51 -0500
Received: by mail-io1-f66.google.com with SMTP id a2so3129122iok.7;
        Thu, 27 Dec 2018 13:54:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=qVKjW1jPignFC6PDbZudzDYlcK9KOJ0D+lc5t1OhGkk=;
        b=AEy/nQylTz790UnVO/KtUeOrxhbWlHzdNPBv1zQrGlHUFM5athHflGSP4q2VTPeyZO
         wAMnS7lunVQSEPfCYLV3fX9jycy3BlD1MLxLVX1UDtvmv1AT8a6LvBOCykxYtucVNb//
         F7tU+7cfBWfljVXEKUfeYrPsKFIojXz4lGsInBzStzCDFa6dtYlibNsFzHE2TzFSD/2U
         Py1vjmRSCL/miH0jQNDfIn+f7X3bCWUjoHSIVOghM0PNArTd1FAFMuXF8qLF+vpJRWg7
         0zBvF0RDc/Tcgcw/oJ5A5FaFWDwn6L4C0RGeCsprrTGcHmD9jNzC8pz+QIEUS9CROxRR
         UB6w==
X-Gm-Message-State: AJcUukeY1D2zI/vGvQfS1iOKVzUQn4PXzgzLH0PrizLNLOqPenQ+NWq6
        hXMYDsQyWc9o/ML2K0G8cQ==
X-Google-Smtp-Source: ALg8bN49OFGnMLTGDjsDK+EoPFZBSNCvPAEs+X6v6LWm5j66PJz3T9YclANLW4lO9+T2Gv19Mxbs/w==
X-Received: by 2002:a6b:c386:: with SMTP id t128mr17449483iof.304.1545947690494;
        Thu, 27 Dec 2018 13:54:50 -0800 (PST)
Received: from localhost ([24.51.61.172])
        by smtp.gmail.com with ESMTPSA id s4sm6546133iom.83.2018.12.27.13.54.49
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Dec 2018 13:54:49 -0800 (PST)
Date:   Thu, 27 Dec 2018 15:54:47 -0600
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
        Aisheng Dong <aisheng.dong@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH V2 1/1] clk: imx8qxp: make the name of clock ID generic
Message-ID: <20181227215447.GA12514@bogus>
References: <1545581665-15446-1-git-send-email-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1545581665-15446-1-git-send-email-aisheng.dong@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Sun, 23 Dec 2018 16:20:02 +0000, Aisheng Dong wrote:
> SCU clock can be used in a similar way by IMX8QXP and IMX8QM SoCs.
> Let's make the name of clock ID generic to allow other SoCs to reuse
> the common part.
> 
> This patch only changes the clock id name and file name, so no
> functional change.
> 
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
> According to Stephen's suggestion[1], resend the needed changes
> for 4.21 separately, then we can pick it up and send it as part
> of a follow-on fixes PR during the merge window next week.
> As there's still no users in kernel and the plan is also to avoid
> any using of it, so please help review at an early time.
> v1->v2:
>  * resend Patch [4/5] which needs to change for v4.21.
>  * update headfile name accordingly
> [1] https://patchwork.kernel.org/patch/10737463/
> ---
>  drivers/clk/imx/clk-imx8qxp-lpcg.c        | 148 +++++++--------
>  drivers/clk/imx/clk-imx8qxp.c             | 154 ++++++++--------
>  include/dt-bindings/clock/imx8-clock.h    | 289 ++++++++++++++++++++++++++++++
>  include/dt-bindings/clock/imx8qxp-clock.h | 289 ------------------------------
>  4 files changed, 440 insertions(+), 440 deletions(-)
>  create mode 100644 include/dt-bindings/clock/imx8-clock.h
>  delete mode 100644 include/dt-bindings/clock/imx8qxp-clock.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
