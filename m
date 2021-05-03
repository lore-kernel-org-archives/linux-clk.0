Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B4CF9C43616
	for <linux-clk@archiver.kernel.org>; Mon,  3 May 2021 16:50:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8D1FD613EB
	for <linux-clk@archiver.kernel.org>; Mon,  3 May 2021 16:50:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233171AbhECQvC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 May 2021 12:51:02 -0400
Received: from mail-oi1-f171.google.com ([209.85.167.171]:42663 "EHLO
        mail-oi1-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232179AbhECQsP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 May 2021 12:48:15 -0400
Received: by mail-oi1-f171.google.com with SMTP id v24so5972457oiv.9;
        Mon, 03 May 2021 09:47:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=FZniUUahTWZ1gHJuDlztknakv+Y1D1uukL0qFU35ff0=;
        b=kmQku92mXOphBsSi1HVZasWRcoqvGT8+h/x+7d9PxG4/BSgaFdC3AwzglEgttZ1MfZ
         uO6QZKygRVd5fmt9w/F+WDWHgLgHCVJu19RaZe/dcObHsxreDrMcLjtdCH4Fwoe/vN2c
         3VUjalZWnvbmWP5BA5J35V41uDm9rsIeB/zVDfL2wlJkiF+ZtCXumCZXqyQYKuKTY8Mw
         wA3DeX3qyUGWcTTo8Zg0Cqbdya+pKb6fhRvCHj0oaVSnihZh/9AbpqoNG3VFkENIpaHC
         KX13OFSQeNQc0xpX49PyWD13Yzaz7q0mo5zw9hTN70VJOjrOHQAMgcb8iptfU5J1yP/i
         4Dsg==
X-Gm-Message-State: AOAM5313xRIxJSr7hwf/TFxJn1H09bn2qa2hQ+jGWJI12e9MeIq4MAI5
        /uibsIhJaehwaKmesjEMBg==
X-Google-Smtp-Source: ABdhPJxknYuxl9mXk7CK9WkA6mZSKILDuCUBdJXCfPYTG+JezGHjq3O4OMuQDQOr6o20c+a3hRN6jA==
X-Received: by 2002:aca:bc42:: with SMTP id m63mr20900017oif.96.1620060442141;
        Mon, 03 May 2021 09:47:22 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h2sm50440oop.47.2021.05.03.09.47.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 May 2021 09:47:21 -0700 (PDT)
Received: (nullmailer pid 1987723 invoked by uid 1000);
        Mon, 03 May 2021 16:47:21 -0000
Date:   Mon, 3 May 2021 11:47:21 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dong Aisheng <aisheng.dong@nxp.com>
Cc:     linux-imx@nxp.com, linux-arm-kernel@lists.infradead.org,
        kernel@pengutronix.de, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, dongas86@gmail.com, shawnguo@kernel.org,
        abel.vesa@nxp.com, sboyd@kernel.org
Subject: Re: [PATCH 2/6] dt-bindings: arm: imx: scu: drop deprecated legacy
 clock binding
Message-ID: <20210503164721.GA1987669@robh.at.kernel.org>
References: <20210423033334.3317992-1-aisheng.dong@nxp.com>
 <20210423033334.3317992-2-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210423033334.3317992-2-aisheng.dong@nxp.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 23 Apr 2021 11:33:30 +0800, Dong Aisheng wrote:
> The legacy clock binding are not maintained anymore. It has only
> a very preliminary supported clocks during initial upstream and
> meaningless for users. So drop it from binding doc now.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
> ---
>  Documentation/devicetree/bindings/arm/freescale/fsl,scu.txt | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
