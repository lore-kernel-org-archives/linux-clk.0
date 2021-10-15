Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA9CDC433F5
	for <linux-clk@archiver.kernel.org>; Fri, 15 Oct 2021 16:26:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A81BF61181
	for <linux-clk@archiver.kernel.org>; Fri, 15 Oct 2021 16:26:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241300AbhJOQ25 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 15 Oct 2021 12:28:57 -0400
Received: from foss.arm.com ([217.140.110.172]:45576 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S241277AbhJOQ25 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 15 Oct 2021 12:28:57 -0400
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 83ECA11D4;
        Fri, 15 Oct 2021 09:26:50 -0700 (PDT)
Received: from bogus (unknown [10.57.25.56])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 8BFD93F66F;
        Fri, 15 Oct 2021 09:26:49 -0700 (PDT)
Date:   Fri, 15 Oct 2021 17:26:47 +0100
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     Cristian Marussi <cristian.marussi@arm.com>
Cc:     linux-clk@vger.kernel.org,
        Etienne Carriere <etienne.carriere@foss.st.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH] clk: Drop unused COMMON_CLK_STM32MP157_SCMI config
Message-ID: <20211015162647.rzgtsoksk4c7ircq@bogus>
References: <20211015150043.140793-1-sudeep.holla@arm.com>
 <20211015152147.GD6376@e120937-lin>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211015152147.GD6376@e120937-lin>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, Oct 15, 2021 at 04:21:47PM +0100, Cristian Marussi wrote:
> On Fri, Oct 15, 2021 at 04:00:43PM +0100, Sudeep Holla wrote:
> > Commit 21e743300dd0 ("clk: stm32mp1: new compatible for secure RCC support")
> > introduced a new Kconfig option COMMON_CLK_STM32MP157_SCMI which is not
> > used anywhere.
> > 
> > Further, it looks like this Kconfig option is just to select bunch of other
> > options which doesn't sound correct to me. There is no need for another
> > SCMI firmware based clock driver and hence the same applies for the config
> > option too.
> > 
> > Let us just drop the unused COMMON_CLK_STM32MP157_SCMI before it gives
> > someone idea to write a specific clock driver for this SoC/platform.
> > 
> > Cc: Etienne Carriere <etienne.carriere@foss.st.com>
> > Cc: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> > Cc: Stephen Boyd <sboyd@kernel.org>
> > Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> > ---
> 
> LGTM.
> 
> Reviewed-by: Cristian Marussi <cristian.marussi@arm.com>
>

Thanks.

> Looking at the original commit, and guessing its original aim,
> is it not better to put some sort of WARN in the STM32MP157 driver
> when the specific "rcc-secure" compatible is found configured BUT
> !IS_ENABLED(COMMON_CLK_SCMI) ?
>

IMO, that makes sense. I will leave that to Etienne/Gabriel to decide.

> Thanks,
> Cristian
> 
> >  drivers/clk/Kconfig | 10 ----------
> >  1 file changed, 10 deletions(-)
> > 
> > diff --git a/drivers/clk/Kconfig b/drivers/clk/Kconfig
> > index c5b3dc97396a..b64058d1af2d 100644
> > --- a/drivers/clk/Kconfig
> > +++ b/drivers/clk/Kconfig
> > @@ -339,16 +339,6 @@ config COMMON_CLK_STM32MP157
> >  	help
> >  	  Support for stm32mp157 SoC family clocks
> >  
> > -config COMMON_CLK_STM32MP157_SCMI
> > -	bool "stm32mp157 Clock driver with Trusted Firmware"
> > -	depends on COMMON_CLK_STM32MP157
> > -	select COMMON_CLK_SCMI
> > -	select ARM_SCMI_PROTOCOL
> > -	default y
> > -	help
> > -	  Support for stm32mp157 SoC family clocks with Trusted Firmware using
> > -	  SCMI protocol.
> > -
> >  config COMMON_CLK_STM32F
> >  	def_bool COMMON_CLK && (MACH_STM32F429 || MACH_STM32F469 || MACH_STM32F746)
> >  	help
> > -- 
> > 2.25.1
> > 

-- 
Regards,
Sudeep
