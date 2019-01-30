Return-Path: <SRS0=JnSZ=QG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BFB5AC282D7
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jan 2019 18:55:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 86FAA20989
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jan 2019 18:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1548874546;
	bh=Na4n0WvK5Cyp++Vn9y8T4w3+fbxz68pPV83abtNcORQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=B/mmIFDjcAU2txsaBZ/11ff8SPFBqrzeL+Fnv139uzDce21RtWrH5IPCnG6VZHSWa
	 Fybp09MNLifxH+SVAa3e2vi+NLx7SHHtVlQR8tbWJMZXzolsD0pnQRskNqY5ouFWU7
	 mUDj4TCtVZkbRh6lk6UBoodRc7n7H1HYj33dqRig=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728461AbfA3Szq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Jan 2019 13:55:46 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:44799 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728446AbfA3Szq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Jan 2019 13:55:46 -0500
Received: by mail-oi1-f193.google.com with SMTP id m6so503575oig.11;
        Wed, 30 Jan 2019 10:55:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZmFG/DH8afjNTG0r4DyJb1XvTRvC0HsocAWEAxF9INk=;
        b=USISVEDTS+z0R7nzf1Gcj8ioSFfiWanrHwCCCY8bIyy75c7L4FFcFLhIIDmCxqFVsS
         3mv8W0/7DllArfk/wgaw101ThvSCEXj+qI+HOISpVDsZgkvxebfyi3VUAMXn8IiPqysq
         XgXc/vVf1so+jKUew2WidE65LCmHLYkyFkh+aEWLrqh+v82NDKSOvlz61FraMnCd3AI0
         z03OeUWwnWtDkxEkSMFPfh1FwBSfPnyT2rUAJutfg/BauCsJALrbj4TqprKuMolnxPbq
         dEQ4Zi/LFQa8mEj4Q9BNB0hvU1Xj8pf6VTGIuQ2DyN3lqlVFql2A4IEwtIqMoekdIFBN
         GGmA==
X-Gm-Message-State: AJcUukf9kXf5AGJJyDYsbu/5RhU79hd9XwXvw6v7J8cCXT0/BWraKmYZ
        vzuXD9l62fnHQeREMhRV8g==
X-Google-Smtp-Source: ALg8bN7EwMQf6RWE3APGW2ove8lvan8m5Rdj0z1DzIpfKUoRoonPfwhlAHTNmyLpQfRnfz6SdzBl7Q==
X-Received: by 2002:aca:3541:: with SMTP id c62mr12457625oia.330.1548874545298;
        Wed, 30 Jan 2019 10:55:45 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id l108sm830742otc.23.2019.01.30.10.55.44
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Jan 2019 10:55:44 -0800 (PST)
Date:   Wed, 30 Jan 2019 12:55:43 -0600
From:   Rob Herring <robh@kernel.org>
To:     Jacky Bai <ping.bai@nxp.com>
Cc:     "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] dt-bindings: imx: Add clock binding doc for imx8mm
Message-ID: <20190130185543.GA22259@bogus>
References: <1548149769-32267-1-git-send-email-ping.bai@nxp.com>
 <1548149769-32267-2-git-send-email-ping.bai@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1548149769-32267-2-git-send-email-ping.bai@nxp.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 22 Jan 2019 09:31:46 +0000, Jacky Bai wrote:
> From: Bai Ping <ping.bai@nxp.com>
> 
> Add the clock binding doc for i.MX8MM.
> 
> Signed-off-by: Bai Ping <ping.bai@nxp.com>
> ---
>  change v1->v2
>  - add the provider node example;
>  - replace table with space after define.
> ---
>  .../devicetree/bindings/clock/imx8mm-clock.txt     |  29 +++
>  include/dt-bindings/clock/imx8mm-clock.h           | 244 +++++++++++++++++++++
>  2 files changed, 273 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/imx8mm-clock.txt
>  create mode 100644 include/dt-bindings/clock/imx8mm-clock.h
> 

Reviewed-by: Rob Herring <robh@kernel.org>
