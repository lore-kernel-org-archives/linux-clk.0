Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 035E7C77B7C
	for <linux-clk@archiver.kernel.org>; Thu,  4 May 2023 20:39:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229845AbjEDUjC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 May 2023 16:39:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53670 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230265AbjEDUis (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 May 2023 16:38:48 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 67B2B2154C
        for <linux-clk@vger.kernel.org>; Thu,  4 May 2023 13:32:54 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F374761211
        for <linux-clk@vger.kernel.org>; Thu,  4 May 2023 20:31:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAE0CC433D2;
        Thu,  4 May 2023 20:31:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1683232301;
        bh=AMX9eSGT0Ex1FIrIwXwAGiq+3+mlAoFPTGH7Izm0rJg=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=rkajFyLTPUkb4Quul9gANHVxIdzIYJE07aUyIjp5xOl8t+BsOUdZ3mcOX1ss/RHeb
         hHxfskc9yxn9+gwVz7EutctEcclzINK6ehSlG15ZuWF2p/y0e5LX82dEvjnFU216wM
         uRuSEgsOTCqJECOa8eEOwF59qeRz7l1IVZ99Nt6NF3H9JJl9eri5SvDBLjweBzf15L
         +CJw4QCPLKW5W0sXi76FRe+OhsLRTKPoefkTx0CC5wayU0o8IpcVrK7TgDrxe1BxuM
         kVdmbCDllsdd1hhvE0Rqh/kREEpL3tZS3sjKt3AD5x01hc839xQ39bwaDWPokaOCEB
         8Iyy5/LLcV2Fg==
Date:   Thu, 4 May 2023 13:31:40 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Vadim Fedorenko <vadfed@meta.com>
Cc:     Jiri Pirko <jiri@resnulli.us>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Milena Olech <milena.olech@intel.com>,
        Michal Michalik <michal.michalik@intel.com>,
        <linux-arm-kernel@lists.infradead.org>,
        Jiri Pirko <jiri@nvidia.com>, <poros@redhat.com>,
        <mschmidt@redhat.com>, <netdev@vger.kernel.org>,
        <linux-clk@vger.kernel.org>
Subject: Re: [RFC PATCH v7 7/8] netdev: expose DPLL pin handle for netdevice
Message-ID: <20230504133140.06ab37d0@kernel.org>
In-Reply-To: <20230428002009.2948020-8-vadfed@meta.com>
References: <20230428002009.2948020-1-vadfed@meta.com>
        <20230428002009.2948020-8-vadfed@meta.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 27 Apr 2023 17:20:08 -0700 Vadim Fedorenko wrote:
> @@ -2411,6 +2412,10 @@ struct net_device {
>  	struct rtnl_hw_stats64	*offload_xstats_l3;
>  
>  	struct devlink_port	*devlink_port;
> +
> +#if IS_ENABLED(CONFIG_DPLL)
> +	struct dpll_pin		*dpll_pin;
> +#endif

kdoc is missing. I'm guessing that one pin covers all current user
cases but we should clearly document on what this pin is, so that when
we extend the code to support multiple pins (in/out, per lane, idk)
we know which one this was.. ?
