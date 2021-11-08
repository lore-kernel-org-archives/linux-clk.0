Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2509AC433F5
	for <linux-clk@archiver.kernel.org>; Mon,  8 Nov 2021 17:46:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1099C619E2
	for <linux-clk@archiver.kernel.org>; Mon,  8 Nov 2021 17:46:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238689AbhKHRs4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Nov 2021 12:48:56 -0500
Received: from mail-oi1-f182.google.com ([209.85.167.182]:44669 "EHLO
        mail-oi1-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231401AbhKHRsz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 Nov 2021 12:48:55 -0500
Received: by mail-oi1-f182.google.com with SMTP id be32so6446422oib.11;
        Mon, 08 Nov 2021 09:46:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2bv40MWFjMfa6LI64xEFVfEQT7Ev+DMKPXy6NdjFcmo=;
        b=a6INF/CACYvNxTNEdxJZPSxgdRNusva+5/8z/KPLw1Lhn9yE+F+AuvBrryHEklk50z
         gFKrT3FNpjJwkCIC/yymtPeN16/XGHWnMHy6gtzc+pX8DiyBSVcAjrHWXTShIBNOxba0
         eAZL47U4bGY/QfnbHGX5exxBzscZ8FNPC+5Q79ntS7/B5Zr3IrfU6tzHXuJHv1Sm7WFy
         0nwg/df6Y2JaPIaclKqzv3tVA78ROzwml3HxwlFCzUiE/kQ5AIU4/r7Cb4nwTXruRS02
         ka5S4Csto2YdtJmZBSo46SDb6rYmq5L8DtQfL0qkZdMwRD41MIxZ3HGbB7gVYw50AVTe
         HT1g==
X-Gm-Message-State: AOAM532XvkapXxuCn6kjGHALNHGnM4/U9d7KmevD1n0Ev4bSomSaQz6k
        +Q8pT3KfifKLzOMGQ7muIw==
X-Google-Smtp-Source: ABdhPJyDm7l9hY5jJMWVe1gkvNJ68G7dXjk7EMTbjxhPnx3unezbYhDQltwlpg5Z5zQgkf3RlGtSJQ==
X-Received: by 2002:a54:4515:: with SMTP id l21mr47063oil.15.1636393570973;
        Mon, 08 Nov 2021 09:46:10 -0800 (PST)
Received: from robh.at.kernel.org (66-90-148-213.dyn.grandenetworks.net. [66.90.148.213])
        by smtp.gmail.com with ESMTPSA id p15sm6248258oto.16.2021.11.08.09.46.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Nov 2021 09:46:10 -0800 (PST)
Received: (nullmailer pid 3815711 invoked by uid 1000);
        Mon, 08 Nov 2021 17:46:09 -0000
Date:   Mon, 8 Nov 2021 11:46:09 -0600
From:   Rob Herring <robh@kernel.org>
To:     Qin Jian <qinjian@cqplus1.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        arnd@arndb.de, linux@armlinux.org.uk, p.zabel@pengutronix.de,
        linux-clk@vger.kernel.org, robh+dt@kernel.org, broonie@kernel.org,
        linux-arm-kernel@lists.infradead.org, maz@kernel.org,
        wells.lu@sunplus.com
Subject: Re: [PATCH v4 02/10] dt-bindings: arm: sunplus: Add bindings for
 Sunplus SP7021 SoC boards
Message-ID: <YYliYfEKMsSr8M6r@robh.at.kernel.org>
References: <cover.1635993377.git.qinjian@cqplus1.com>
 <5d790d13fbe818504552054849646a7a19ae852a.1635993377.git.qinjian@cqplus1.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5d790d13fbe818504552054849646a7a19ae852a.1635993377.git.qinjian@cqplus1.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 04 Nov 2021 10:56:59 +0800, Qin Jian wrote:
> This introduces bindings for boards based Sunplus SP7021 SoC.
> 
> Signed-off-by: Qin Jian <qinjian@cqplus1.com>
> ---
>  .../bindings/arm/sunplus,sp7021.yaml          | 27 +++++++++++++++++++
>  MAINTAINERS                                   |  7 +++++
>  2 files changed, 34 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/arm/sunplus,sp7021.yaml
> 


Please add Acked-by/Reviewed-by tags when posting new versions. However,
there's no need to repost patches *only* to add the tags. The upstream
maintainer will do that for acks received on the version they apply.

If a tag was not added on purpose, please state why and what changed.

