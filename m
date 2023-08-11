Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9669DC0015E
	for <linux-clk@archiver.kernel.org>; Fri, 11 Aug 2023 13:23:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230127AbjHKNXS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 11 Aug 2023 09:23:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229898AbjHKNXS (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 11 Aug 2023 09:23:18 -0400
X-Greylist: delayed 142958 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Fri, 11 Aug 2023 06:23:17 PDT
Received: from out-126.mta1.migadu.com (out-126.mta1.migadu.com [95.215.58.126])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 66B9790
        for <linux-clk@vger.kernel.org>; Fri, 11 Aug 2023 06:23:17 -0700 (PDT)
Message-ID: <271b76c6-a52a-0c8b-5560-8a72c4340faf@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1691760195;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=SkZWE4XFj7n8PtSuWO95wRoJ9c9BRctbYRXHgzE+874=;
        b=q9k1tHJR1cMhrkd4lyzS4+BSxbHSM490dxoSUrrR8QHrxenoc5OqPCuV0LHLB4XLaiM0Dw
        N8ObBd2AOuHAaL+3bIkd10FDI6YsmHru3PRZOeZh6EbkHFkL+Pd8RPXucsT1d+yT5pTWU/
        n+upeYSRMSeTp3dB4DCewzo6X1LIJiE=
Date:   Fri, 11 Aug 2023 14:23:08 +0100
MIME-Version: 1.0
Subject: Re: [PATCH net-next v3 6/9] ice: add admin commands to access cgu
 configuration
Content-Language: en-US
To:     "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>,
        Jakub Kicinski <kuba@kernel.org>
Cc:     Jiri Pirko <jiri@resnulli.us>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        "Olech, Milena" <milena.olech@intel.com>,
        "Michalik, Michal" <michal.michalik@intel.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>, poros <poros@redhat.com>,
        mschmidt <mschmidt@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Bart Van Assche <bvanassche@acm.org>,
        "intel-wired-lan@lists.osuosl.org" <intel-wired-lan@lists.osuosl.org>
References: <20230809214027.556192-1-vadim.fedorenko@linux.dev>
 <20230809214027.556192-7-vadim.fedorenko@linux.dev>
 <20230810192102.2932d58f@kernel.org>
 <8d52ab61-e532-0ef8-4227-ea1ab469f4cb@linux.dev>
 <DM6PR11MB46578D7F73BDA4D6EE7E0E239B10A@DM6PR11MB4657.namprd11.prod.outlook.com>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <DM6PR11MB46578D7F73BDA4D6EE7E0E239B10A@DM6PR11MB4657.namprd11.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 11/08/2023 13:16, Kubalewski, Arkadiusz wrote:
>> From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
>> Sent: Friday, August 11, 2023 11:31 AM
>>
>> On 11/08/2023 03:21, Jakub Kicinski wrote:
>>> On Wed,  9 Aug 2023 22:40:24 +0100 Vadim Fedorenko wrote:
>>>> From: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
>>>>
>>>> Add firmware admin command to access clock generation unit
>>>> configuration, it is required to enable Extended PTP and SyncE features
>>>> in the driver.
>>>> Add definitions of possible hardware variations of input and output pins
>>>> related to clock generation unit and functions to access the data.
>>>
>>> Doesn't build, but hold off a little with reposting, please hopefully
>>> I'll have more time tomorrow to review.
>>
>> Yeah, we've found the issue already and Arkadiusz has prepared a patch
>> to fix it. I can do the repost once you are ok to review.
> 
> Thanks Vadim,
> 
> Just realized you have already replied on this..
> Ok, so I guess v4 after all.
> 
> Thank you!
> Arkadiusz


Yeah, it will be v4 anyway
