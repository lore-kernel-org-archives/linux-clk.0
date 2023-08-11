Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C579C41513
	for <linux-clk@archiver.kernel.org>; Fri, 11 Aug 2023 09:31:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232954AbjHKJbO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 11 Aug 2023 05:31:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234316AbjHKJav (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 11 Aug 2023 05:30:51 -0400
Received: from out-75.mta0.migadu.com (out-75.mta0.migadu.com [91.218.175.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 137352D6D
        for <linux-clk@vger.kernel.org>; Fri, 11 Aug 2023 02:30:49 -0700 (PDT)
Message-ID: <8d52ab61-e532-0ef8-4227-ea1ab469f4cb@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1691746247;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=JZUyYZ+8XJKTUbZKK1DdFQCGq8cNFYsFwnq8YwkTDfs=;
        b=GxU9QjIRAA/RVyaUj1LaqCJKMOW/MhFBn7HuPQpEBaRlc0/os4PZM4k8PctvTdV7pEAoit
        sd1dFvUpsQz3nw3NVmf7QCM1FNKzCmMtDo//9eCKoYRlJZ/7qlzkuUvSisYCAl8riGEODZ
        YMhbjwuujNIc9Px/jlE4XGJ9iWNOP5U=
Date:   Fri, 11 Aug 2023 10:30:43 +0100
MIME-Version: 1.0
Subject: Re: [PATCH net-next v3 6/9] ice: add admin commands to access cgu
 configuration
Content-Language: en-US
To:     Jakub Kicinski <kuba@kernel.org>
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
References: <20230809214027.556192-1-vadim.fedorenko@linux.dev>
 <20230809214027.556192-7-vadim.fedorenko@linux.dev>
 <20230810192102.2932d58f@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20230810192102.2932d58f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 11/08/2023 03:21, Jakub Kicinski wrote:
> On Wed,  9 Aug 2023 22:40:24 +0100 Vadim Fedorenko wrote:
>> From: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
>>
>> Add firmware admin command to access clock generation unit
>> configuration, it is required to enable Extended PTP and SyncE features
>> in the driver.
>> Add definitions of possible hardware variations of input and output pins
>> related to clock generation unit and functions to access the data.
> 
> Doesn't build, but hold off a little with reposting, please hopefully
> I'll have more time tomorrow to review.

Yeah, we've found the issue already and Arkadiusz has prepared a patch
to fix it. I can do the repost once you are ok to review.
