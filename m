Return-Path: <SRS0=sRHc=WX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85278C3A5A3
	for <linux-clk@archiver.kernel.org>; Tue, 27 Aug 2019 16:00:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5882C2173E
	for <linux-clk@archiver.kernel.org>; Tue, 27 Aug 2019 16:00:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1566921628;
	bh=TK9LHwjkU2YNvA4Lsn20vx3vFlU8KBcOPaAUUSAqIr0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=q9aU5D9OMsZUFoucHoyQnOBVp+v5JfW+O2g1kMw6H+GQDSfA+BujrLc0P8bPUpbx5
	 CS+5Fqhgcrh7Sf3zg7z4cYXzupEf3LHlolPCDvOKp9X6Ciy1V37ySsXEASg10G9/h0
	 +MH20/cnjv93xs/5eLbLUFEMCEh2L26D1e69Ac7A=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726537AbfH0QA2 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 27 Aug 2019 12:00:28 -0400
Received: from mail-ot1-f68.google.com ([209.85.210.68]:37002 "EHLO
        mail-ot1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726257AbfH0QA1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 27 Aug 2019 12:00:27 -0400
Received: by mail-ot1-f68.google.com with SMTP id f17so19193532otq.4;
        Tue, 27 Aug 2019 09:00:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=CwAy1Ps+MjuuEKpxDHokPNhG1OQvVQq/qbn73rtHDl4=;
        b=srB8FMJForIHlEw03N6VrBJNgdesxEm6cCAKjtT3gWg8TmdCIPY7ZHdQNaBnqOAATm
         EDXXVZFZjfmHMvMzfe4/tU02MjNoIWZc9B49f1jcNOSLe4c0LtZwWpSXkw56w2ccUEsM
         Wq1kTw4sCv6b7bil6x+brotrP+UyYBulmDQX4Hmi94N5XQhmqtesdBWoUBrju0yOd57r
         SReuAZd7+Rej96zvQwtHenqonGojMHWN91g1n0HMmJB0r5FdTZnVXkHPLO5LyYCnA2sf
         cmYuTIj6uBZJ+3dON5v0FGVjtM8DJ+zspbrvOBBmV3VDrXQ7iE9fH8yEcNOcGxjxIex0
         Py7A==
X-Gm-Message-State: APjAAAXESdDOR8ubQNEkmc8WCKoZhTMAFc46iPe76TywdvEvAoxS7nEK
        dOVGqmO369zl4gYz/SAfQiPBBGM=
X-Google-Smtp-Source: APXvYqwSKzfBpjOCtUh3Bg/GdA55c3XRKq0U7eMrWbyBtx4KABdnq/2qKlzSzSMzYXuXK2SHHvO5FA==
X-Received: by 2002:a9d:170b:: with SMTP id i11mr19812279ota.60.1566921626608;
        Tue, 27 Aug 2019 09:00:26 -0700 (PDT)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id h197sm4768104oib.14.2019.08.27.09.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2019 09:00:26 -0700 (PDT)
Date:   Tue, 27 Aug 2019 11:00:25 -0500
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
Subject: Re: [PATCH V2 03/13] dt-bindings: bcm2835-cprman: Add bcm2711 support
Message-ID: <20190827160025.GA13142@bogus>
References: <1565713248-4906-1-git-send-email-wahrenst@gmx.net>
 <1565713248-4906-4-git-send-email-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1565713248-4906-4-git-send-email-wahrenst@gmx.net>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 13 Aug 2019 18:20:38 +0200, Stefan Wahren wrote:
> The new BCM2711 supports an additional clock for the emmc2 block.
> So we need an additional compatible.
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> Acked-by: Eric Anholt <eric@anholt.net>
> ---
>  Documentation/devicetree/bindings/clock/brcm,bcm2835-cprman.txt | 4 +++-
>  include/dt-bindings/clock/bcm2835.h                             | 2 ++
>  2 files changed, 5 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
