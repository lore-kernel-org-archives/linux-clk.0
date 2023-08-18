Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA74BEE4999
	for <linux-clk@archiver.kernel.org>; Fri, 18 Aug 2023 21:08:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238040AbjHRVIM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 18 Aug 2023 17:08:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239873AbjHRVIF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 18 Aug 2023 17:08:05 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7352E10DF
        for <linux-clk@vger.kernel.org>; Fri, 18 Aug 2023 14:08:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id F294A638DE
        for <linux-clk@vger.kernel.org>; Fri, 18 Aug 2023 21:08:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0058EC433C8;
        Fri, 18 Aug 2023 21:08:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692392883;
        bh=9PW7XD5R4LZ4P7zabAS3qiTayGngkSCuqnZCmVwe9dw=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=aaf9BDExt36VfZBMPPSdidpXdIQoWZcYO305X6BlL1BIDK6MPWxaHcg+b8IYb8dbH
         GuozxVDvqiapYSYqzErQsKtMxlWCho62w5jTKa/zw7MDvVim4GFWQSsnFf/T0LhWnw
         ULBINfw7xg5bJLfxNtx1CpXKZlvAWW5+y8q5xLRocs0/Aoi0VoZ1yTx3iOJ78H2s1y
         MlogIWvRT7Dzor55QsJAiziDU7IF8IeNqOsrRUZ0iDM+1wKs0AnGxL+3QyGlSVeom7
         lRE9C0IuDkewd5MTGhOQR/OW1W/RC+LJvH7Ud1m7LQQBYrnI6jHWwwNEr3fVISmX1u
         qp89I7UvF1DTQ==
Date:   Fri, 18 Aug 2023 14:08:02 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     Michal Michalik <michal.michalik@intel.com>
Cc:     netdev@vger.kernel.org, vadim.fedorenko@linux.dev,
        jiri@resnulli.us, arkadiusz.kubalewski@intel.com,
        jonathan.lemon@gmail.com, pabeni@redhat.com, poros@redhat.com,
        milena.olech@intel.com, mschmidt@redhat.com,
        linux-clk@vger.kernel.org, bvanassche@acm.org
Subject: Re: [PATCH RFC net-next v1 2/2] selftests/dpll: add DPLL system
 integration selftests
Message-ID: <20230818140802.063aae1f@kernel.org>
In-Reply-To: <20230817152209.23868-3-michal.michalik@intel.com>
References: <20230817152209.23868-1-michal.michalik@intel.com>
        <20230817152209.23868-3-michal.michalik@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 17 Aug 2023 17:22:09 +0200 Michal Michalik wrote:
> High level flow of DPLL subsystem integration selftests:
> (after running run_dpll_tests.sh or 'make -C tools/testing/selftests')
> 1) check if Python in correct version is installed,
> 2) create temporary Python virtual environment,
> 3) install all the required libraries,
> 4) run the tests,
> 5) do cleanup.

How fragile do you reckon this setup will be?
I mean will it work reliably across distros and various VM setups?
I have tried writing tests based on ynl.py and the C codegen, and
I can't decide whether the python stuff is easy enough to deploy.
Much easier to scp over to the test host a binary based on the 
C code. But typing tests in python is generally quicker...
What are your thoughts?

Thanks for posting the tests!
