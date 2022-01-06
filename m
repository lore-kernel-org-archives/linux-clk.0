Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D0C6EC433FE
	for <linux-clk@archiver.kernel.org>; Thu,  6 Jan 2022 01:23:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344355AbiAFBXS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 5 Jan 2022 20:23:18 -0500
Received: from ams.source.kernel.org ([145.40.68.75]:55168 "EHLO
        ams.source.kernel.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344334AbiAFBXO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 5 Jan 2022 20:23:14 -0500
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id AFBBFB81ECF
        for <linux-clk@vger.kernel.org>; Thu,  6 Jan 2022 01:23:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5A263C36AE3;
        Thu,  6 Jan 2022 01:23:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1641432192;
        bh=AFGoZCnrH9W4tDbugNaB/wpnz/1uSF+jT2hDAIdOJMM=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=GHwE9aKfto2t0lAeYz7TQWafqpVCQaj/YhHgqUM5s/BPG7f+j3QCbis1z/qKGE+ZD
         o+Slz8P67hN4iCISPKmC2sgeFltoTwMi9y1vUznZR0nFkIMxy5NT9PR8NATnXhW38W
         a1CDAWCaO0/lxNUq5V8mB1/xrQsyt7gqaEynYJq44Tn9Lhmfy+gunjoQ51f4XoAxxm
         pxIxxEWfja/afBnInTG+sXjxQpNl1elwXsqpFProt/16uxQay0lvZgcVRxTeWaIEoY
         HFoX6WsoYmu/z7us+vdU3Tb8ZPflyjFTytzYEmToqz+XaHuQ6ZVcjvI+bmUvWRGyys
         awFq9CSPGj+ug==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20211015150043.140793-1-sudeep.holla@arm.com>
References: <20211015150043.140793-1-sudeep.holla@arm.com>
Subject: Re: [PATCH] clk: Drop unused COMMON_CLK_STM32MP157_SCMI config
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Sudeep Holla <sudeep.holla@arm.com>,
        Cristian Marussi <cristian.marussi@arm.com>,
        Etienne Carriere <etienne.carriere@foss.st.com>,
        Gabriel Fernandez <gabriel.fernandez@foss.st.com>
To:     Sudeep Holla <sudeep.holla@arm.com>, linux-clk@vger.kernel.org
Date:   Wed, 05 Jan 2022 17:23:11 -0800
User-Agent: alot/0.9.1
Message-Id: <20220106012312.5A263C36AE3@smtp.kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Sudeep Holla (2021-10-15 08:00:43)
> Commit 21e743300dd0 ("clk: stm32mp1: new compatible for secure RCC suppor=
t")
> introduced a new Kconfig option COMMON_CLK_STM32MP157_SCMI which is not
> used anywhere.
>=20
> Further, it looks like this Kconfig option is just to select bunch of oth=
er
> options which doesn't sound correct to me. There is no need for another
> SCMI firmware based clock driver and hence the same applies for the config
> option too.
>=20
> Let us just drop the unused COMMON_CLK_STM32MP157_SCMI before it gives
> someone idea to write a specific clock driver for this SoC/platform.
>=20
> Cc: Etienne Carriere <etienne.carriere@foss.st.com>
> Cc: Gabriel Fernandez <gabriel.fernandez@foss.st.com>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Signed-off-by: Sudeep Holla <sudeep.holla@arm.com>
> ---

Applied to clk-next

I got tired of waiting
