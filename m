Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D843EB64DA
	for <linux-clk@archiver.kernel.org>; Thu, 20 Jul 2023 14:54:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232345AbjGTOyp (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 Jul 2023 10:54:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232362AbjGTOyk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Jul 2023 10:54:40 -0400
X-Greylist: delayed 363 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Thu, 20 Jul 2023 07:54:37 PDT
Received: from out-52.mta1.migadu.com (out-52.mta1.migadu.com [IPv6:2001:41d0:203:375::34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21B5E270A
        for <linux-clk@vger.kernel.org>; Thu, 20 Jul 2023 07:54:36 -0700 (PDT)
Message-ID: <e4531880-7904-114e-9d4d-24b4a77a3565@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1689864511;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=PqpxIaHBRk8xxnz7Hdg9ZoxK/nTzDsDxJQBDdoeP+q0=;
        b=wKkmkI7zWECYryWudv8WwXejFM9fQVXOYPItQC7Vr2+bUrtnphnf/7+MnLeelaJoddxerT
        G3x/jZXMDwU0LYiaVKPG7MaIONfFPw6eNZmiwlewAH42RXBuzIU7xgQlce228EOuW4bZCL
        tjLZgZ7MLhEA2s8gn6octroI1IJTY7g=
Date:   Thu, 20 Jul 2023 15:48:30 +0100
MIME-Version: 1.0
Subject: Re: [PATCH net-next 01/11] tools: ynl-gen: fix enum index in
 _decode_enum(..)
Content-Language: en-US
To:     "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>,
        Jiri Pirko <jiri@resnulli.us>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        "Olech, Milena" <milena.olech@intel.com>,
        "Michalik, Michal" <michal.michalik@intel.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>, poros <poros@redhat.com>,
        mschmidt <mschmidt@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Bart Van Assche <bvanassche@acm.org>
References: <20230720091903.297066-1-vadim.fedorenko@linux.dev>
 <20230720091903.297066-2-vadim.fedorenko@linux.dev>
 <ZLk5MMjChnRFNU49@nanopsycho>
 <DM6PR11MB46577F18C3C4229FEC00D7DA9B3EA@DM6PR11MB4657.namprd11.prod.outlook.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <DM6PR11MB46577F18C3C4229FEC00D7DA9B3EA@DM6PR11MB4657.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 20.07.2023 14:58, Kubalewski, Arkadiusz wrote:
>> -----Original Message-----
>> From: Jiri Pirko <jiri@resnulli.us>
>> Sent: Thursday, July 20, 2023 3:40 PM
>>
>> Thu, Jul 20, 2023 at 11:18:53AM CEST, vadim.fedorenko@linux.dev wrote:
>>> From: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
>>>
>>> Remove wrong index adjustement, which is leftover from adding
>>
>> s/adjustement/adjustment/
>>
> 
> Sure will fix,
> Although those "tools: ynl" patches were not intended to be a part of dpll
> Series, they are being discussed on the other thread:
> https://lore.kernel.org/netdev/20230718162225.231775-1-arkadiusz.kubalewski@intel.com/
> 
> I think Vadim have sent them, because I included them in the branch candidate
> for next version, seems was not clear enough on that..
> I think we can skip them for next submission.

Yeah, I just realised that these patches have been sent earlier as separate
series and are still under review. Once they are committed I'll remove them
from DPLL series, but for now they are needed for spec generation of DPLL
yaml, so it's good to have them anyway.

> Thank you!
> Arkadiusz
> 
>>
>>> support for sparse enums.
>>> enum.entries_by_val() function shall not subtract the start-value, as
>>> it is indexed with real enum value.
>>>
>>> Fixes: c311aaa74ca1 ("tools: ynl: fix enum-as-flags in the generic
>>> CLI")
>>> Signed-off-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
>>> Signed-off-by: Vadim Fedorenko <vadim.fedorenko@linux.dev>
>>
>> Reviewed-by: Jiri Pirko <jiri@nvidia.com>
> 

