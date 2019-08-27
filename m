Return-Path: <SRS0=sRHc=WX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D005DC3A5A3
	for <linux-clk@archiver.kernel.org>; Tue, 27 Aug 2019 16:00:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A811B2070B
	for <linux-clk@archiver.kernel.org>; Tue, 27 Aug 2019 16:00:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1566921640;
	bh=WWvwYSq32q6T/jm9QeyxNK4jfmHzl0P0gil7V0vMbCs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=GrrVzeHlem7U0VjX2OB5K96jH3Qdle3PTrXTAGIvu6IfYBv2F6SHhOW83C6MI59l+
	 K2bub+rJ7N97cIMvH4U+7kQdvINWeQSZR1fQaTxJ+3+1+BTxU4n2PVwClD0kduDtc7
	 foZkrmxozGXozT4gZQyPJB3iliODrkUNvXSWM9po=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727784AbfH0QAk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Aug 2019 12:00:40 -0400
Received: from mail-oi1-f193.google.com ([209.85.167.193]:34975 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725804AbfH0QAj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Aug 2019 12:00:39 -0400
Received: by mail-oi1-f193.google.com with SMTP id a127so15370338oii.2;
        Tue, 27 Aug 2019 09:00:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=D6+OaZ1K2BkxJDOEN54v4VflGey5EU83b3NbO+bgnw4=;
        b=R83W4VXOM39811hc7ah1l/VvLqF7w2RCjMzcTriCPq//1zlUgWBLnRS0jv7TgHyMpT
         U5GsXhGNoh3KHGrwaVNbVdCDv/jIO+3RMWVePQkLjpZsFgB5bi9N4UmB8r//rS5mYeDF
         p34a2K46yG3lXF35vhHsqymNK720ku4aGkgjrKUSxvXMth0pHXrLoMTljjWVgap9khWH
         +ZaAESa18fZf+Jt0ydP+Fo7WnWDY2Svgrxh+wsX8PB3V4/icLzohZAUeI5kadImeB6kg
         f0qbJ5/Q2xDLssY/1p+N6D9EVt+kEEHSQA/P929cpep8L4HF3rL9eTb0UwvoIzcvHd6O
         FxAA==
X-Gm-Message-State: APjAAAV5L6cCnzDK6GW3w1VBaaEtPP6ajsJTcLcTkM18bm2xDjd7LLEH
        cVazyyfwPX7k/cfDxbbNUJoIB/8=
X-Google-Smtp-Source: APXvYqzqysW8b9Vv/AGQrCdVBMtCuN+0jOLgEwEm5B32z9YhyzC8FzlR7LdSUXlhdBuSwDViFOa0Ig==
X-Received: by 2002:aca:4b83:: with SMTP id y125mr16540421oia.25.1566921638739;
        Tue, 27 Aug 2019 09:00:38 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id y62sm5552699otb.69.2019.08.27.09.00.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 09:00:38 -0700 (PDT)
Date:   Tue, 27 Aug 2019 11:00:37 -0500
From:   Rob Herring <robh@kernel.org>
To:     Stefan Wahren <wahrenst@gmx.net>
Cc:     Eric Anholt <eric@anholt.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
        devicetree@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
Subject: Re: [PATCH V2 07/13] dt-bindings: i2c: bcm2835: Add brcm,bcm2711
 compatible
Message-ID: <20190827160037.GA13627@bogus>
References: <1565713248-4906-1-git-send-email-wahrenst@gmx.net>
 <1565713248-4906-8-git-send-email-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1565713248-4906-8-git-send-email-wahrenst@gmx.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 13 Aug 2019 18:20:42 +0200, Stefan Wahren wrote:
> Add a new compatible for the BCM2711, which hasn't the clock stretch bug.
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---
>  Documentation/devicetree/bindings/i2c/brcm,bcm2835-i2c.txt | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
