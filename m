Return-Path: <SRS0=DnCL=OU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 232D3C6783B
	for <linux-clk@archiver.kernel.org>; Tue, 11 Dec 2018 21:36:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CD09920849
	for <linux-clk@archiver.kernel.org>; Tue, 11 Dec 2018 21:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1544564183;
	bh=Rhhq0ynna81WdSe1hdBS6dnLyu7sV2XTFEjZsNi/vqM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=V0fqFfH0vVSChfFQ/F/J/374EKiUi2BCMi+Rw5FWM8wlcYEj/aZqGrc3A2uk2mPBb
	 InPY/hC1XG8eh4fAT40DzkArfWCvWUf4JPsHsA0Q/LWo6sKuA3K/GfKNBbGLLwCJCl
	 I+1AR7813TSPdDoyOU7THcc9aoZh7LCtYeyBFXSA=
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org CD09920849
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726201AbeLKVgW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 11 Dec 2018 16:36:22 -0500
Received: from mail-ot1-f42.google.com ([209.85.210.42]:41042 "EHLO
        mail-ot1-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726158AbeLKVgW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 11 Dec 2018 16:36:22 -0500
Received: by mail-ot1-f42.google.com with SMTP id u16so15575134otk.8;
        Tue, 11 Dec 2018 13:36:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cQHpFb8NEPDhe26nThUjb73vSjVXPuZLtBGppGPPVXg=;
        b=Vz+o/6iCnkXnQf5Z90dKmxe/RPVSOAVxs7QXy7+iDJBI6f/+MtGsoyfS2XpYcX9xgB
         1gZ1bCCgTZeL8Padji7N8zYcZW4LckLKNWMWZ64zpCY4tUYecsrJH3A7+/3wyXlYEeby
         XuOh6ZfN89QYPll2orqHHwTaU6JpFH5sZ1H9KSckb3bJ7N5EqMFo/MgEdiEdIMacQdHq
         nGcNEgik+ZDgGAjBs9l+ppb/3GctGkHHxTB1JJnjinB83Csw2EI+JpE8V88I95BUBq+s
         jGE4PSECIRCxfAqM55S4eAQwzK/+VwBIHnxVO3mVamc41CDBsCHQCcrEfBuAOgpXQkEV
         VWwQ==
X-Gm-Message-State: AA+aEWYn5MWtNcCboBOwgtASd1bxEXEL6bSHWP9hPVOOxdwyIjO0vN89
        3ItyHBmzp2xaJKNWQLjj0w==
X-Google-Smtp-Source: AFSGD/VbUTRtLus3aoOzT4jVEllQdWBoJQsYauVqS71WQOEjOlIkQXj0UA5yLLpQi2iMGurekgsANQ==
X-Received: by 2002:a9d:3ecb:: with SMTP id b69mr11847307otc.329.1544564181508;
        Tue, 11 Dec 2018 13:36:21 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id j23sm7091671oih.22.2018.12.11.13.36.20
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 11 Dec 2018 13:36:21 -0800 (PST)
Date:   Tue, 11 Dec 2018 15:36:20 -0600
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
Subject: Re: [PATCH 4/4] dt-bindings: clk: armada3700: document the PCIe clock
Message-ID: <20181211213620.GA15108@bogus>
References: <20181123094444.27956-1-miquel.raynal@bootlin.com>
 <20181123094444.27956-5-miquel.raynal@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181123094444.27956-5-miquel.raynal@bootlin.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 23 Nov 2018 10:44:43 +0100, Miquel Raynal wrote:
> Add a reference to the missing PCIe clock managed by this IP. The
> clock resides in the south bridge.
> 
> Signed-off-by: Miquel Raynal <miquel.raynal@bootlin.com>
> ---
>  .../devicetree/bindings/clock/armada3700-periph-clock.txt        | 1 +
>  1 file changed, 1 insertion(+)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
