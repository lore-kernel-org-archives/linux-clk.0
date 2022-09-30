Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 32116C433FE
	for <linux-clk@archiver.kernel.org>; Fri, 30 Sep 2022 14:33:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231405AbiI3OdQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Sep 2022 10:33:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230165AbiI3OdP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Sep 2022 10:33:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1972D1A88C0;
        Fri, 30 Sep 2022 07:33:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9EF4B62345;
        Fri, 30 Sep 2022 14:33:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CF0FC433D6;
        Fri, 30 Sep 2022 14:33:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1664548394;
        bh=5epeeF6cHoZR+tq0tUOX3/+1Kb5T8cJOHegvWxP0eMg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=kVPb6GAoSIk2UOnKJT+QUsxWIOQe78/TOg4iWYHmPRBb+jr9K9DOltPWe7LKA8TfQ
         Kx0Rnobx0hwvdk0qzzVYdPk3v9uNMOouF3yydnQcCfDsrqJHlU360ylESxk/o1oDyB
         mSrROU6mbdW+bVddaCtP1s60oA0PBAYIYRK8/Q6QB1za8ofrc0DpPYA44bz327aZuJ
         72RijaREfNt5nt7DiCdqeuVD7DCUJcm8yyOPE0OmIW3CYF7leuE0GgZe0kQlBvj8vU
         TvbNEWVXbd8i3XJyFRneou5lnYJHuQHzwGnTwyO4kKwN2urBDBisM+8oqIABuVn1Qj
         dJPM9zOFK1PVA==
Date:   Fri, 30 Sep 2022 07:33:12 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Jiri Pirko <jiri@resnulli.us>
Cc:     Vadim Fedorenko <vfedorenko@novek.ru>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Vadim Fedorenko <vadfed@fb.com>, Aya Levin <ayal@nvidia.com>,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/3] Create common DPLL/clock configuration API
Message-ID: <20220930073312.23685d5d@kernel.org>
In-Reply-To: <Yzap9cfSXvSLA+5y@nanopsycho>
References: <20220626192444.29321-1-vfedorenko@novek.ru>
        <YzWESUXPwcCo67LP@nanopsycho>
        <6b80b6c8-29fd-4c2a-e963-1f273d866f12@novek.ru>
        <Yzap9cfSXvSLA+5y@nanopsycho>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 30 Sep 2022 10:33:57 +0200 Jiri Pirko wrote:
> >> Also, did you consider usage of sysfs? Why it isn't a better fit than
> >> netlink?  
> >
> >We already have sysfs implemented in the ptp_ocp driver. But it looks like
> >more hardware is going to be available soon with almost the same functions,
> >so it would be great to have common protocol to configure such devices.  
> 
> Sure, but more hw does not mean you can't use sysfs. Take netdev as an
> example. The sysfs exposed for it is implemented net/core/net-sysfs.c
> and is exposed for all netdev instances, no matter what the
> driver/hardware is.

Wait, *you* are suggesting someone uses sysfs instead of netlink?

Could you say more because I feel like that's kicking the absolute.
