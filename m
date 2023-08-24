Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 69D50C27C40
	for <linux-clk@archiver.kernel.org>; Thu, 24 Aug 2023 15:50:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233569AbjHXPtu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 24 Aug 2023 11:49:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35462 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242318AbjHXPti (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 24 Aug 2023 11:49:38 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB299198D
        for <linux-clk@vger.kernel.org>; Thu, 24 Aug 2023 08:49:36 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 49424640E7
        for <linux-clk@vger.kernel.org>; Thu, 24 Aug 2023 15:49:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 53607C433C8;
        Thu, 24 Aug 2023 15:49:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1692892175;
        bh=eC9VAF+7u+1jW7kBZ1cokph7iWMcoRHh6F6nR9a6IPs=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=OeFVez6ajm6VnzYsfFMDK7+Dd0g3b77EHss18ukapCrNQFaadu5BpgZrEx4B9rZBs
         OjYUjLI4pFi6D4Nvx4J1XAiJs+QHJFktjiKHEvsJVHBw8/COuZhU0StXiRii+4KIVm
         LyzO6nvd9lDTusMwlUplq3V18ae3ypHX2MWIMFFjjUP8Dpwctf91m7DGdjSvCVp1/F
         KWJKGzA1xxlKKmdjxj7sdfRIZ6C9LUfzqf7K6mt6euTJMdSk9ZFLfE8MnyUiF/ptKs
         LYKx6AjZmZdSacR34k7mwBASNnDQA9IM5m15OCwru4j7GNmMHhhToQVxvH9UD/smiC
         CR04bxr2GJliA==
Date:   Thu, 24 Aug 2023 08:49:34 -0700
From:   Jakub Kicinski <kuba@kernel.org>
To:     "Michalik, Michal" <michal.michalik@intel.com>
Cc:     "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "vadim.fedorenko@linux.dev" <vadim.fedorenko@linux.dev>,
        "jiri@resnulli.us" <jiri@resnulli.us>,
        "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>,
        "jonathan.lemon@gmail.com" <jonathan.lemon@gmail.com>,
        "pabeni@redhat.com" <pabeni@redhat.com>, poros <poros@redhat.com>,
        "Olech, Milena" <milena.olech@intel.com>,
        mschmidt <mschmidt@redhat.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "bvanassche@acm.org" <bvanassche@acm.org>
Subject: Re: [PATCH RFC net-next v1 2/2] selftests/dpll: add DPLL system
 integration selftests
Message-ID: <20230824084934.3b9b96ee@kernel.org>
In-Reply-To: <CH3PR11MB84149ADA77B4A6FBD4F0C230E31DA@CH3PR11MB8414.namprd11.prod.outlook.com>
References: <20230817152209.23868-1-michal.michalik@intel.com>
        <20230817152209.23868-3-michal.michalik@intel.com>
        <20230818140802.063aae1f@kernel.org>
        <CH3PR11MB84141E0EDA588B84F7E10F71E31EA@CH3PR11MB8414.namprd11.prod.outlook.com>
        <20230821141327.1ae35b2e@kernel.org>
        <CH3PR11MB84149ADA77B4A6FBD4F0C230E31DA@CH3PR11MB8414.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 24 Aug 2023 08:59:53 +0000 Michalik, Michal wrote:
> >> The biggest concern for me is the requirement of selftests[2]:
> >>   "Don't take too long;"
> >> This approach is reloading the modules few times to check few scenarios.
> >> Also, the DPLL subsystem is being tested against multiple requests - so
> >> it takes some time to finish (not too long but is definitely not instant).  
> > 
> > I think the time constraints are more of a question of practicality.
> > A developer should be able to run the tests as part of their workflow.
> 
> That makes sense - agree. So Jakub, if I understand correctly we have a few
> different problems to solve here:
> 1) how to deploy the module:
>  - now it's separated, we should consider e.g. netdevsim
> 2) if we should have those tests a part of selftests
>  - I would remove it from selftests and move it to ./tools/testing
> 3) if we should use Python at all:
>  - fast to develop and easy to maintain
>  - might be problematic to deploy (no Python, VMs, embedded, no network etc.)
>  
> Do I understand our current outcome of the discussion correctly?

Yes, and on (3) unless someone objects let's stick to Python.
