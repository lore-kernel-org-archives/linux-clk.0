Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47CA3C07E95
	for <linux-clk@archiver.kernel.org>; Tue, 13 Jul 2021 21:50:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2EF6761351
	for <linux-clk@archiver.kernel.org>; Tue, 13 Jul 2021 21:50:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235756AbhGMVwx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Jul 2021 17:52:53 -0400
Received: from mail-il1-f172.google.com ([209.85.166.172]:36504 "EHLO
        mail-il1-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234947AbhGMVwx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Jul 2021 17:52:53 -0400
Received: by mail-il1-f172.google.com with SMTP id j5so7139728ilk.3;
        Tue, 13 Jul 2021 14:50:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=3dHh7Vil5JrWak2z66/WoqkZsfwWNtjB23PPCa1W0OY=;
        b=GKDOF6PX9s403jfTCKldy6My6f91GuQOw/o/lqk9pT7rxIeAd9Hrz3HOQoN6bGRxUl
         q2+PRsawmEmOC3SpXvffJfOr9ErrXeVxu7HTEK253z+lvFn++XSqYn42N1OEq8MjaD2D
         P5ix974ejPFHBBnaUNBpBucGSHsPE/pECtYLykoDUUtnByqVYXal4UWZdQdHl4ic+r1z
         0mLsDNkcEnNeQCz4g3tKh9b/aKaB5W9hsFHs2snh3c68Z+Ni57GQTuBjg51ncLYJ+OtV
         f9yrhOC5Fbr3vBG44AdXN8PJBq+Qo1j6EARdm/D69gMIztb4zc6KhSkthcEuNj1XljZU
         Psuw==
X-Gm-Message-State: AOAM531ozVMcZvxCf47+/TcMZhKlv/IJhLQCIGBxqZ5kX9KsPjPv8z0/
        gQXr4gHr+DKQgObKKQStMg==
X-Google-Smtp-Source: ABdhPJwhre4QrspuDRU6YJhLmkbv5oRQlsOVAGVEyUWxVg0ueeLz0Pa7fBFOBnnCnLbv4cTCPEmSrw==
X-Received: by 2002:a92:ac06:: with SMTP id r6mr4279396ilh.74.1626213002723;
        Tue, 13 Jul 2021 14:50:02 -0700 (PDT)
Received: from robh.at.kernel.org ([64.188.179.248])
        by smtp.gmail.com with ESMTPSA id a6sm118786ili.21.2021.07.13.14.50.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jul 2021 14:50:02 -0700 (PDT)
Received: (nullmailer pid 903961 invoked by uid 1000);
        Tue, 13 Jul 2021 21:49:59 -0000
Date:   Tue, 13 Jul 2021 15:49:59 -0600
From:   Rob Herring <robh@kernel.org>
To:     Chun-Jie Chen <chun-jie.chen@mediatek.com>
Cc:     linux-clk@vger.kernel.org,
        Project_Global_Chrome_Upstream_Group@mediatek.com,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Matthias Brugger <matthias.bgg@gmail.com>,
        srv_heupstream@mediatek.com, devicetree@vger.kernel.org,
        Nicolas Boichat <drinkcat@chromium.org>,
        Stephen Boyd <sboyd@kernel.org>
Subject: Re: [v13 02/21] dt-bindings: ARM: Mediatek: Add mmsys document
 binding for MT8192
Message-ID: <20210713214959.GA903907@robh.at.kernel.org>
References: <20210706061920.16013-1-chun-jie.chen@mediatek.com>
 <20210706061920.16013-3-chun-jie.chen@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210706061920.16013-3-chun-jie.chen@mediatek.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 06 Jul 2021 14:19:01 +0800, Chun-Jie Chen wrote:
> This patch adds the mmsys document binding for MT8192 SoC.
> 
> Signed-off-by: Chun-Jie Chen <chun-jie.chen@mediatek.com>
> Reviewed-by: Chun-Kuang Hu <chunkuang.hu@kernel.org>
> Reviewed-by: Matthias Brugger <matthias.bgg@gmail.com>
> ---
>  .../devicetree/bindings/arm/mediatek/mediatek,mmsys.txt          | 1 +
>  1 file changed, 1 insertion(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
