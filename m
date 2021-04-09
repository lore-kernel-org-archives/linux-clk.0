Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05A40C433ED
	for <linux-clk@archiver.kernel.org>; Fri,  9 Apr 2021 18:09:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D5F1861007
	for <linux-clk@archiver.kernel.org>; Fri,  9 Apr 2021 18:09:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234306AbhDISKJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 9 Apr 2021 14:10:09 -0400
Received: from mail-oi1-f173.google.com ([209.85.167.173]:44672 "EHLO
        mail-oi1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233332AbhDISKI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 9 Apr 2021 14:10:08 -0400
Received: by mail-oi1-f173.google.com with SMTP id a8so6631156oic.11;
        Fri, 09 Apr 2021 11:09:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fCVQeOozXnmqOmzdZZPptmZjBT4ig9JKwPIdux6ewHA=;
        b=M0IJBe1NSMjweiuOGxl2iX0CZp/JAZq3jo+b9RnEBcsxUsQTv8LpgJ/2XDKhsua2E8
         +DGl2yMV3mRvvXsrA7f8M/0swJjRiFjRjcyjYVjKNBQgw2T1+rzRBtdN5zdCIMhie3Jn
         INLX30fhjCCqZV19Za3dTAa61cYJeiYTYXmHahue9Zg8r8EOqC4puKI22Z47XKfMkSJJ
         DKG43YTRTClltd6hM+B7/hDz/4H4zLbNSNFQib9V2GREu7J5ioBIXOi4d0hcguIGVPLw
         EqjsufeUb2ndqHjy7aKhGzDKXezUpdPSxLpDjY49jLLDhnDl5q/TrL2zRVVKhclDYV4P
         a7kA==
X-Gm-Message-State: AOAM530SOhlim0QrUwW3gsmM0D9R77D2ubs5bJFEBS+4kYfV4OJbrN64
        ir7gxoMn1pIsyta389c4Yg==
X-Google-Smtp-Source: ABdhPJxlkqQLFI9GS+qKWcK5PFzpk2KHZgmVCIWpe09a7zrV4vqhg64yNKJOaDodgq1VnWReAPY2yA==
X-Received: by 2002:aca:1803:: with SMTP id h3mr10921965oih.65.1617991794638;
        Fri, 09 Apr 2021 11:09:54 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id 64sm639617oob.12.2021.04.09.11.09.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Apr 2021 11:09:54 -0700 (PDT)
Received: (nullmailer pid 3895463 invoked by uid 1000);
        Fri, 09 Apr 2021 18:09:52 -0000
Date:   Fri, 9 Apr 2021 13:09:52 -0500
From:   Rob Herring <robh@kernel.org>
To:     Flora Fu <flora.fu@mediatek.com>
Cc:     Matthias Brugger <matthias.bgg@gmail.com>,
        Pi-Cheng Chen <pi-cheng.chen@mediatek.com>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, Mark Brown <broonie@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Chiawen Lee <chiawen.lee@mediatek.com>,
        Chun-Jie Chen <chun-jie.chen@mediatek.com>,
        linux-mediatek@lists.infradead.org,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Liam Girdwood <lgirdwood@gmail.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/8] dt-bindings: clock: Add MT8192 APU clock bindings
Message-ID: <20210409180952.GA3895409@robh.at.kernel.org>
References: <1617766086-5502-1-git-send-email-flora.fu@mediatek.com>
 <1617766086-5502-2-git-send-email-flora.fu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1617766086-5502-2-git-send-email-flora.fu@mediatek.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 07 Apr 2021 11:27:59 +0800, Flora Fu wrote:
> Add clock bindings for APU on MT8192.
> 
> Signed-off-by: Flora Fu <flora.fu@mediatek.com>
> ---
>  include/dt-bindings/clock/mt8192-clk.h | 14 ++++++++++++--
>  1 file changed, 12 insertions(+), 2 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
