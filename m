Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 79DCBCD37B4
	for <linux-clk@archiver.kernel.org>; Sun, 17 Sep 2023 11:01:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230005AbjIQLBF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 17 Sep 2023 07:01:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39222 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229776AbjIQLAd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 17 Sep 2023 07:00:33 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09808136
        for <linux-clk@vger.kernel.org>; Sun, 17 Sep 2023 04:00:28 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 7B459C433C8;
        Sun, 17 Sep 2023 11:00:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1694948427;
        bh=s08oDzPuNzSJeFX6h/ScM9J80V2nEYO6YkYo4nxEPCE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=nritynd2YmYUlN1ie5Ol4kmiqCoZ5YuAdBaqB1rdW9DyUzY5ckHaIv3mlVt52W+Ze
         CkVyNPkKEA0HggjJK7WTDYR+3afmh9aobqqy7H3YnB1Ezsx70YW4ca9y2eJAT8w1x3
         PjDJGUp5NWF6rbMJlTMVaT1cL240EHZqLkchK6JhyZK4IfUhQjnwAS3dnSfOR0i/w5
         PoJfvWfc/cf77esp/YA2sM5hOv88kUAFW5RKvL6CsIdl3nQiILPgkwiwqMSCgF6R54
         fnaMzKOPkuVXNx+PGFTJiBCvQpYzNAqWIQZwOCTOs85sSdkHZiM+PgFtPE1x/lr8MR
         c++vLi1xox62w==
Received: from aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (localhost.localdomain [127.0.0.1])
        by aws-us-west-2-korg-oddjob-1.ci.codeaurora.org (Postfix) with ESMTP id 5A962E26888;
        Sun, 17 Sep 2023 11:00:27 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH net-next v8 0/9] Create common DPLL configuration API
From:   patchwork-bot+netdevbpf@kernel.org
Message-Id: <169494842736.21621.10730860855645661664.git-patchwork-notify@kernel.org>
Date:   Sun, 17 Sep 2023 11:00:27 +0000
References: <20230913204943.1051233-1-vadim.fedorenko@linux.dev>
In-Reply-To: <20230913204943.1051233-1-vadim.fedorenko@linux.dev>
To:     Vadim Fedorenko <vadim.fedorenko@linux.dev>
Cc:     kuba@kernel.org, jiri@resnulli.us, arkadiusz.kubalewski@intel.com,
        jonathan.lemon@gmail.com, pabeni@redhat.com,
        milena.olech@intel.com, michal.michalik@intel.com,
        linux-arm-kernel@lists.infradead.org, poros@redhat.com,
        mschmidt@redhat.com, netdev@vger.kernel.org,
        linux-clk@vger.kernel.org, bvanassche@acm.org,
        intel-wired-lan@lists.osuosl.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello:

This series was applied to netdev/net-next.git (main)
by David S. Miller <davem@davemloft.net>:

On Wed, 13 Sep 2023 21:49:34 +0100 you wrote:
> Implement common API for DPLL configuration and status reporting.
> The API utilises netlink interface as transport for commands and event
> notifications. This API aims to extend current pin configuration
> provided by PTP subsystem and make it flexible and easy to cover
> complex configurations.
> 
> Netlink interface is based on ynl spec, it allows use of in-kernel
> tools/net/ynl/cli.py application to control the interface with properly
> formated command and json attribute strings. Here are few command
> examples of how it works with `ice` driver on supported NIC:
> 
> [...]

Here is the summary with links:
  - [net-next,v8,1/9] dpll: documentation on DPLL subsystem interface
    https://git.kernel.org/netdev/net-next/c/dbb291f19393
  - [net-next,v8,2/9] dpll: spec: Add Netlink spec in YAML
    https://git.kernel.org/netdev/net-next/c/3badff3a25d8
  - [net-next,v8,3/9] dpll: core: Add DPLL framework base functions
    https://git.kernel.org/netdev/net-next/c/9431063ad323
  - [net-next,v8,4/9] dpll: netlink: Add DPLL framework base functions
    https://git.kernel.org/netdev/net-next/c/9d71b54b65b1
  - [net-next,v8,5/9] netdev: expose DPLL pin handle for netdevice
    https://git.kernel.org/netdev/net-next/c/5f1842692880
  - [net-next,v8,6/9] ice: add admin commands to access cgu configuration
    https://git.kernel.org/netdev/net-next/c/8a3a565ff210
  - [net-next,v8,7/9] ice: implement dpll interface to control cgu
    https://git.kernel.org/netdev/net-next/c/d7999f5ea64b
  - [net-next,v8,8/9] ptp_ocp: implement DPLL ops
    https://git.kernel.org/netdev/net-next/c/09eeb3aecc6c
  - [net-next,v8,9/9] mlx5: Implement SyncE support using DPLL infrastructure
    https://git.kernel.org/netdev/net-next/c/496fd0a26bbf

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


