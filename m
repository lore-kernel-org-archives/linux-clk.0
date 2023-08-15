Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBAB1C001E0
	for <linux-clk@archiver.kernel.org>; Tue, 15 Aug 2023 18:39:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230070AbjHOSjH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 15 Aug 2023 14:39:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239239AbjHOSi4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 15 Aug 2023 14:38:56 -0400
Received: from out-25.mta1.migadu.com (out-25.mta1.migadu.com [IPv6:2001:41d0:203:375::19])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A10B1733
        for <linux-clk@vger.kernel.org>; Tue, 15 Aug 2023 11:38:51 -0700 (PDT)
Message-ID: <39e701b4-0992-2c96-67b3-38c341c77af5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1692124729;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=l71H0XchJUj51QCQRpzWl8MiAbxVsza3vleYUTSEqtE=;
        b=CMD5FNJiviDfxbHNuk8RG4XO8ZCqfxARGsXr9AgrSsoS1mpjwsidIpYQI3xR5mTzGEs0vU
        r1oAuACK5hLHQ76YInPYdy5/aekG7KQ5oICC1lV13jAW8FomaE/Cf7fmbogyFtNBLy7Qp3
        D+G2ERY4tAgLAvqfauVyah4hdUvW7WM=
Date:   Tue, 15 Aug 2023 19:38:41 +0100
MIME-Version: 1.0
Subject: Re: [PATCH net-next v4 3/9] dpll: core: Add DPLL framework base
 functions
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
        intel-wired-lan@lists.osuosl.org, Jiri Pirko <jiri@nvidia.com>
References: <20230811200340.577359-1-vadim.fedorenko@linux.dev>
 <20230811200340.577359-4-vadim.fedorenko@linux.dev>
 <20230814201709.655a24e2@kernel.org>
 <ef2eca98-4fcc-b448-fecb-38695238f87b@linux.dev>
 <20230815112856.1f1bd3ac@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20230815112856.1f1bd3ac@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 15/08/2023 19:28, Jakub Kicinski wrote:
> On Tue, 15 Aug 2023 19:20:31 +0100 Vadim Fedorenko wrote:
>>>> +	ret = xa_alloc(&dpll_device_xa, &dpll->id, dpll, xa_limit_16b,
>>>> +		       GFP_KERNEL);
>>>
>>> Why only 16b and why not _cyclic?
>>
>> I cannot image systems with more than 65k of DPLL devices. We don't
>> store any id's of last used DPLL device, so there is no easy way to
>> restart the search from the last point. And it's not a hot path to
>> optimize it.
> 
> I think this gets used under the xa_lock() so you can just add a static
> variable inside the function to remember previous allocation.
> 
> I don't expect >64k devices either, obviously, but what are we saving
> by not allowing the full u32 range?

I don't see any benefits for either _cyclic or u32 range, but if you 
insist I can change it.
