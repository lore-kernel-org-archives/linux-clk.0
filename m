Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D94ACC433F5
	for <linux-clk@archiver.kernel.org>; Wed,  1 Dec 2021 15:51:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234833AbhLAPyn (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 Dec 2021 10:54:43 -0500
Received: from foss.arm.com ([217.140.110.172]:40394 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231537AbhLAPyn (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 1 Dec 2021 10:54:43 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 025EC143B;
        Wed,  1 Dec 2021 07:51:22 -0800 (PST)
Received: from bogus (unknown [10.57.33.218])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B96943F85F;
        Wed,  1 Dec 2021 07:51:20 -0800 (PST)
Date:   Wed, 1 Dec 2021 15:51:17 +0000
From:   Sudeep Holla <sudeep.holla@arm.com>
To:     linux-clk@vger.kernel.org,
        Etienne Carriere <etienne.carriere@foss.st.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Cristian Marussi <cristian.marussi@arm.com>,
        Gabriel Fernandez <gabriel.fernandez@foss.st.com>,
        Sudeep Holla <sudeep.holla@arm.com>
Subject: Re: [PATCH] clk: Drop unused COMMON_CLK_STM32MP157_SCMI config
Message-ID: <20211201155117.ot6hilvtnyovav77@bogus>
References: <20211015150043.140793-1-sudeep.holla@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211015150043.140793-1-sudeep.holla@arm.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Etienne,

On Fri, Oct 15, 2021 at 04:00:43PM +0100, Sudeep Holla wrote:
> Commit 21e743300dd0 ("clk: stm32mp1: new compatible for secure RCC support")
> introduced a new Kconfig option COMMON_CLK_STM32MP157_SCMI which is not
> used anywhere.
> 
> Further, it looks like this Kconfig option is just to select bunch of other
> options which doesn't sound correct to me. There is no need for another
> SCMI firmware based clock driver and hence the same applies for the config
> option too.
> 
> Let us just drop the unused COMMON_CLK_STM32MP157_SCMI before it gives
> someone idea to write a specific clock driver for this SoC/platform.
> 

Any thoughts ? I don't see any reason we need this Kconfig especially
with no users.

-- 
Regards,
Sudeep
