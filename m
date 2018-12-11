Return-Path: <SRS0=DnCL=OU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6DEEC6783B
	for <linux-clk@archiver.kernel.org>; Tue, 11 Dec 2018 21:35:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7CC0D20849
	for <linux-clk@archiver.kernel.org>; Tue, 11 Dec 2018 21:35:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544564152;
	bh=b00yZcBpvlR2dwuZZDAQuvhSvJdwSPhhSiyVFbBFAhU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=sf/eu4BlaMaBatpTAfKPTZb9zFSiknkTcrdTu4ytwqAVLVBj5ELrM+qbwkUXaMkNT
	 uKHXsM5Vr0sz6gwja3nxPvOaInugbIi7kxdAbylJoYkG2CMxyo7N2GV2s8m6HGxWNr
	 ySkrGtFV4ZyZkhPvhLdsNxbPPSnBC4uIBsXnVr6Y=
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 7CC0D20849
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726183AbeLKVfw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 11 Dec 2018 16:35:52 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:43892 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726179AbeLKVfv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 11 Dec 2018 16:35:51 -0500
Received: by mail-oi1-f193.google.com with SMTP id u18so13293133oie.10;
        Tue, 11 Dec 2018 13:35:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TZt48pk0F6rGaTLGifdYaAHRMLrT7hdlYbGLBiry3cs=;
        b=VGFS5nLiDiPTkCrVwIbTyiARAFeGAkVWAHUURWCnIgvN8Jb/k/bUv50qEyxQHa4c5S
         NiyWGgpj/SJxEH1ug6Z8UmVnQDTimzrDX8HyTWRCP2avAZoMtkW2qYCIq51QSX1ndyj8
         cxG85lspKU5Oxw2PZY59vFhGX6IG3Rm9h0NPNwiOUzcDmsMYGEiO3D3e+6vLdWcMTWxe
         RSjYVOBxKBZxVoIezQy9H9R+QKH+EhXiMAVPNUqD46UanOtQB3P2yPvkgcy8U8NUS+Vq
         MnMIqd7zb19hnvlx4MvuSbWn1GaSs9tuHHLd+mBH5lV5X7d1NwAQBoOFamePXIxEViNL
         Y3IA==
X-Gm-Message-State: AA+aEWYPSaXECHtA3F4BO+EJml2XMOJlzLhUlje8m144UJ9BB7NAV3P+
        EebP3fj2bZ1VsKjGFp3qFZfpcxw=
X-Google-Smtp-Source: AFSGD/VbwekOHV4dY7L6kGiCsl78HDk/9iEAvzMUaUUij6CqAiCwpVRnWqg430YZ+sOPdKdJLrs3yg==
X-Received: by 2002:aca:d8c1:: with SMTP id p184mr2345517oig.22.1544564151156;
        Tue, 11 Dec 2018 13:35:51 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y25sm6582454otq.60.2018.12.11.13.35.50
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Dec 2018 13:35:50 -0800 (PST)
Date:   Tue, 11 Dec 2018 15:35:49 -0600
From:   Rob Herring <robh@kernel.org>
To:     Miquel Raynal <miquel.raynal@bootlin.com>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Antoine Tenart <antoine.tenart@bootlin.com>,
        Gregory Clement <gregory.clement@bootlin.com>,
        Maxime Chevallier <maxime.chevallier@bootlin.com>,
        Nadav Haklai <nadavh@marvell.com>,
        Miquel Raynal <miquel.raynal@bootlin.com>
Subject: Re: [PATCH 3/4] dt-bindings: clk: armada3700: fix typo in SoC name
Message-ID: <20181211213549.GA14039@bogus>
References: <20181123094444.27956-1-miquel.raynal@bootlin.com>
 <20181123094444.27956-4-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181123094444.27956-4-miquel.raynal@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 23 Nov 2018 10:44:42 +0100, Miquel Raynal wrote:
> This documentation is about Armada 3700 SoCs.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/clock/armada3700-periph-clock.txt     | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
