Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03A42C77B7A
	for <linux-clk@archiver.kernel.org>; Mon, 17 Apr 2023 15:53:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231370AbjDQPx3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Apr 2023 11:53:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50182 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231488AbjDQPxV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Apr 2023 11:53:21 -0400
Received: from out-16.mta1.migadu.com (out-16.mta1.migadu.com [IPv6:2001:41d0:203:375::10])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6979AB444
        for <linux-clk@vger.kernel.org>; Mon, 17 Apr 2023 08:53:10 -0700 (PDT)
Message-ID: <ea8a7a65-3c1c-bb83-2d88-e961306d87d5@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
        t=1681746786;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=b3YsTgVO4RylBnjdLN7yJQDgG+k90LtVzdRN7p16/bg=;
        b=H8DpitgZjbMn5bOEkl1h0l7Gdv4mbNJnD/cWezPSke1ZG9UuUiTqRr5enkiszSqnJKdoUa
        DLvxS42YJIaYOaNGiavj3qoyCwsjMad+fdE+YVO9BDAU5531xehe3DmlzKfGonNnH7uPcI
        K9ebqmGgUfFoCMrGaxQUR52fplNcT70=
Date:   Mon, 17 Apr 2023 16:53:00 +0100
MIME-Version: 1.0
Subject: Re: [PATCH RFC v6 2/6] dpll: Add DPLL framework base functions
To:     Jiri Pirko <jiri@resnulli.us>, Jakub Kicinski <kuba@kernel.org>
Cc:     "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>,
        Vadim Fedorenko <vadfed@meta.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>, poros <poros@redhat.com>,
        mschmidt <mschmidt@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "Olech, Milena" <milena.olech@intel.com>,
        "Michalik, Michal" <michal.michalik@intel.com>
References: <20230312022807.278528-1-vadfed@meta.com>
 <20230312022807.278528-3-vadfed@meta.com> <ZA9Nbll8+xHt4ygd@nanopsycho>
 <2b749045-021e-d6c8-b265-972cfa892802@linux.dev>
 <ZBA8ofFfKigqZ6M7@nanopsycho>
 <DM6PR11MB4657120805D656A745EF724E9BBE9@DM6PR11MB4657.namprd11.prod.outlook.com>
 <ZBGOWQW+1JFzNsTY@nanopsycho> <20230403111812.163b7d1d@kernel.org>
 <ZDJulCXj9H8LH+kl@nanopsycho> <20230410153149.602c6bad@kernel.org>
 <ZDwg88x3HS2kd6lY@nanopsycho>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From:   Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <ZDwg88x3HS2kd6lY@nanopsycho>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16/04/2023 17:23, Jiri Pirko wrote:
> Tue, Apr 11, 2023 at 12:31:49AM CEST, kuba@kernel.org wrote:
>> On Sun, 9 Apr 2023 09:51:48 +0200 Jiri Pirko wrote:
>>> Wait, not sure you get the format of the "name". It does not contain any
>>> bus address, so the auxdev issue you pointed out is not applicable.
>>> It is driver/clock_id/index.
>>> All 3 are stable and user can rely on them. Do you see any issue in
>>> that?
>>
>> What is index? I thought you don't want an index and yet there is one,
>> just scoped by random attributes :(
> 
> Index internal within a single instance. Like Intel guys, they have 1
> clock wired up with multiple DPLLs. The driver gives every DPLL index.
> This is internal, totally up to the driver decision. Similar concept to
> devlink port index.

It feels like a dead-lock in conversation here. We have to agree on 
something because for now it's the only blocker to post the next version 
with all the comments from the previous one addressed in the code.
My position here is that I'm ok to have any of the properties being an 
identifier as well as keep both of them, the code already has all the 
lines to support any decision. I just to want to go back to this part 
again in the next iteration.

