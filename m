Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99501C001DB
	for <linux-clk@archiver.kernel.org>; Fri, 11 Aug 2023 02:21:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229992AbjHKCVJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 10 Aug 2023 22:21:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbjHKCVJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 10 Aug 2023 22:21:09 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 094412724
        for <linux-clk@vger.kernel.org>; Thu, 10 Aug 2023 19:21:05 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 9964460DC6
        for <linux-clk@vger.kernel.org>; Fri, 11 Aug 2023 02:21:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C485C433C9;
        Fri, 11 Aug 2023 02:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1691720464;
        bh=UK6+nIoJRgJe0+F29KexKJZ3mwOyj8uyJA/QEbO/nzk=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=nlyPGGNQHpnfgEzkccS7V21YanmKRT5NmOZkZ0vxI3cxuA+qEIXYdbV1YPv15SwfV
         dJDrm3q8As5NaOwmz+ZyyvRwaRGdhPZb6ZhWvu8eN7xRR2MNdRYpU+11nVYFlWGZyQ
         b0dun7VFZkFM3de5z4jea7M9rrUqSH4UJ3E7bZzbiTaTxjCjDzcDoTq4xlb+IthX5x
         kfRFFau04EZPlvmSAZnPsNuwkCuObqRy65BsD2Pgq3OvZwWWpyFiELT3rkHE0WFoMR
         Jx589/2coK2xhWBfT3vJK3n0qnq9h7DrvHVGGywWYcbE2mtLB3xhtCrFHsY2PNX69X
         J9bBJgjMygL8Q==
Date:   Thu, 10 Aug 2023 19:21:02 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc:     Jiri Pirko <jiri@resnulli.us>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Milena Olech <milena.olech@intel.com>,
        Michal Michalik <michal.michalik@intel.com>,
        linux-arm-kernel@lists.infradead.org, poros@redhat.com,
        mschmidt@redhat.com, netdev@vger.kernel.org,
        linux-clk@vger.kernel.org, Bart Van Assche <bvanassche@acm.org>,
        intel-wired-lan@lists.osuosl.org
Subject: Re: [PATCH net-next v3 6/9] ice: add admin commands to access cgu
 configuration
Message-ID: <20230810192102.2932d58f@kernel.org>
In-Reply-To: <20230809214027.556192-7-vadim.fedorenko@linux.dev>
References: <20230809214027.556192-1-vadim.fedorenko@linux.dev>
        <20230809214027.556192-7-vadim.fedorenko@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed,  9 Aug 2023 22:40:24 +0100 Vadim Fedorenko wrote:
> From: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
> 
> Add firmware admin command to access clock generation unit
> configuration, it is required to enable Extended PTP and SyncE features
> in the driver.
> Add definitions of possible hardware variations of input and output pins
> related to clock generation unit and functions to access the data.

Doesn't build, but hold off a little with reposting, please hopefully
I'll have more time tomorrow to review.
