Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01004C433EF
	for <linux-clk@archiver.kernel.org>; Fri,  8 Apr 2022 13:56:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236598AbiDHN6r (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 8 Apr 2022 09:58:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236126AbiDHN6r (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 8 Apr 2022 09:58:47 -0400
Received: from vps0.lunn.ch (vps0.lunn.ch [185.16.172.187])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62F913134A
        for <linux-clk@vger.kernel.org>; Fri,  8 Apr 2022 06:56:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
        s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
        Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
        Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
        bh=dngIcVIDwXBGuNu1rq593+iPVa4YStJsJHog+HHb5xU=; b=wkK8yny5rMKMJPLI7an5XIOtnY
        OjG1u+YDWkCx0n4aizW/8y44T4ZdpkE1hBbGEAkKixf560sYFXst8jWC3mIfPuZtASACaqP2xMNU+
        aMQYVnGCwdsi0cwwHnq6LXizkyrBaUeDGUnCRiaIHMYOFNflV74nldy94BY5XfPtyLa0=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
        (envelope-from <andrew@lunn.ch>)
        id 1ncp6O-00EpxS-Bb; Fri, 08 Apr 2022 15:56:40 +0200
Date:   Fri, 8 Apr 2022 15:56:40 +0200
From:   Andrew Lunn <andrew@lunn.ch>
To:     Conor Dooley <conor.dooley@microchip.com>
Cc:     mturquette@baylibre.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, daire.mcnamara@microchip.com,
        linux-riscv@lists.infradead.org, palmer@rivosinc.com,
        linux@armlinux.org.uk
Subject: Re: [PATCH v1] clk: microchip: mpfs: don't reset disabled peripherals
Message-ID: <YlA/GEA0uai/s0g4@lunn.ch>
References: <20220408131352.3421559-1-conor.dooley@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220408131352.3421559-1-conor.dooley@microchip.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Apr 08, 2022 at 01:13:53PM +0000, Conor Dooley wrote:
> The current clock driver for PolarFire SoC puts the hardware behind
> "periph" clocks into reset if their clock is disabled. CONFIG_PM was
> recently added to the riscv defconfig and exposed issues caused by this
> behaviour, where the Cadence GEM was being put into reset between its
> bringup & the PHY bringup:
> 
> https://lore.kernel.org/linux-riscv/9f4b057d-1985-5fd3-65c0-f944161c7792@microchip.com/
> 
> Fix this by removing the reset enable/disable code from the driver &
> rely (for now) on the bootloader bringing peripherals out of reset
> during boot.

Maybe you should keep the clock enable -> disable reset part, and only
remove the clock disable -> assert reset part. You are making the
assumption that the bootloader disables reset on everything, when in
fact it could only disable resets on peripherals it needs, and it
needs the ethernet for TPTP boot.

What is your long term fix? It seems like you need to add a reset
controller. The macb already seems to support that:

macb_main.c:	/* Fully reset GEM controller at hardware level using zynqmp-reset driver,
macb_main.c:	ret = device_reset_optional(&pdev->dev);

So once you have it, it should be easy to wire up for this
peripheral. Once you have them all using the reset controller, you can
then remove all the reset code from the clock driver.

   Andrew
