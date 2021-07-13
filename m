Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F219C07E95
	for <linux-clk@archiver.kernel.org>; Tue, 13 Jul 2021 21:50:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 411A661363
	for <linux-clk@archiver.kernel.org>; Tue, 13 Jul 2021 21:50:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235716AbhGMVxN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Jul 2021 17:53:13 -0400
Received: from mail-io1-f54.google.com ([209.85.166.54]:45772 "EHLO
        mail-io1-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234947AbhGMVxM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Jul 2021 17:53:12 -0400
Received: by mail-io1-f54.google.com with SMTP id y16so6041606iol.12;
        Tue, 13 Jul 2021 14:50:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=RnEa5dv+l7cOs0gPE0rTIeCxkfrj4i5OqfYNRI+rvCU=;
        b=q62zGV1VElr/XEcGWs6WAWbubpcfIVlQIKJZirRJ/gXmZqsEbvqVBfmOjRtrOaneDn
         tqK0A+0N7rxktuzuFb56JP0sMQzPdSQ8btdfg/d4Uqe8ugQXjDKvEqG87oWnDoDUvK1u
         MGiwo1uxPOwY9LWQfUwA3NKh/9UYrut8CaaG0BaogNhXHeJovya2PzefMPDpSGz655io
         48FsK85lQOYYj/TIfLuko8QHUS7O/W4HHSe2Ebowj7+DL+rEZpVOuvcO08f7rUlR0DZM
         RybxSmV8Jsd3hlPj2T16bidisLfHd2U2472GwZY+Xd6REDV4ATkBWO4G/bOKFQtPeF/y
         3MIA==
X-Gm-Message-State: AOAM533RJa/SESocOGz/qWclEv7+VfQaMHDXEe6pklYQw0tPDQi1FBLC
        pTx+zGbhOzNhLZIOJzrzJw==
X-Google-Smtp-Source: ABdhPJwUAQDIwsXCEWvWxZVw93gRVjeoG6rhcZoj9jDIJ5KLG3p6NJ2qY84PQCRKvmgrQGzfyty8nA==
X-Received: by 2002:a02:cd1a:: with SMTP id g26mr5976739jaq.38.1626213022168;
        Tue, 13 Jul 2021 14:50:22 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id h13sm100447ila.44.2021.07.13.14.50.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 14:50:21 -0700 (PDT)
Received: (nullmailer pid 904604 invoked by uid 1000);
        Tue, 13 Jul 2021 21:50:19 -0000
Date:   Tue, 13 Jul 2021 15:50:19 -0600
From:   Rob Herring <robh@kernel.org>
To:     Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc:     linux-mediatek@lists.infradead.org,
        Nicolas Boichat <drinkcat@chromium.org>,
        devicetree@vger.kernel.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-kernel@vger.kernel.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        linux-clk@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Stephen Boyd <sboyd@kernel.org>, srv_heupstream@mediatek.com
Subject: Re: [v13 03/21] dt-bindings: ARM: Mediatek: Add audsys document
 binding for MT8192
Message-ID: <20210713215019.GA904547@robh.at.kernel.org>
References: <20210706061920.16013-1-chun-jie.chen@mediatek.com>
 <20210706061920.16013-4-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210706061920.16013-4-chun-jie.chen@mediatek.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 06 Jul 2021 14:19:02 +0800, Chun-Jie Chen wrote:
> This patch adds the audsys document binding for MT8192 SoC.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> ---
>  .../devicetree/bindings/arm/mediatek/mediatek,audsys.txt         | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
