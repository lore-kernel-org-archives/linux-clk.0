Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 831C2C77B78
	for <linux-clk@archiver.kernel.org>; Thu,  4 May 2023 17:51:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229670AbjEDRvq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 May 2023 13:51:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229449AbjEDRvp (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 May 2023 13:51:45 -0400
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com [IPv6:2a00:1450:4864:20::22c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 332B519B0
        for <linux-clk@vger.kernel.org>; Thu,  4 May 2023 10:51:43 -0700 (PDT)
Received: by mail-lj1-x22c.google.com with SMTP id 38308e7fff4ca-2ac675d84b5so9684891fa.3
        for <linux-clk@vger.kernel.org>; Thu, 04 May 2023 10:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1683222701; x=1685814701;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=O45EJsoDq0FqmHnerFViZl2wgrujScPaI15rEDqYMNE=;
        b=uFlPsO8rOXvRxLzCv8wu8QfDcuqRrwfKuf1HallJvCJGOewFVvgFbHzxus9dZORTyM
         dI/tqMDT+drHp2aGr0LMvK0AjH9nMQKVEpN70NfP0/9zVCT7EZDZnVLFAPqNYM0qGjWH
         kNnbG1xtu7iWY5T/O6JkdvO3xxRG0EvdrI4sSXknRaLDsUmPTX0pgBIK1IfFBSW+kdsY
         nyMUaSYyqM5Olpv8RHQtMW4qTBkYjFtsyAzXVnpFMpzVlR3i/awvRa6SJ67n6fazIIgr
         CndOZAOkaKFUG6yu4hSltD/I70enaaPBKq1BGP2jPyLunGzVa4GXVn4s1a1s6ForQW1/
         2NHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683222701; x=1685814701;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=O45EJsoDq0FqmHnerFViZl2wgrujScPaI15rEDqYMNE=;
        b=et6vQtS6r/XkRKTJFBCVrNli0n8lvoVEAj/sx6+S6WjzeU20exTKFruYrIXHuRnK9k
         No7eZxWCCPey10/3NTgD1jMAROpe1gjEoPTdnwG6gi1mZVgbJS+ahTKiMHOxd5c9Ibjl
         IKBjtg/6pAXIBGQiV/oZZ3EAjifLnc0JuudIyUVAnOEpvPsS0ZWyj8jj5yPRpeUhwHZw
         D/XX8+Lhq/kN/DOXLSC8WQhVqjw9jFckVG9yDvrszZVXltzw7jTI72GvbIBtDji5W41G
         PonBYAWzffCI/7gSBMgpoatMFwpDtPE+33zF1tE2208CilxgA1zWEBs+kjXiJEpdovkF
         gWvA==
X-Gm-Message-State: AC+VfDzPBxHqssjG3BQhy+JgfkxcZ9U6Y0SMwbs3yNt68kh2BzO9w4Kk
        5FkrUimvxLM7Gb+CGI6rjzWZ/Q==
X-Google-Smtp-Source: ACHHUZ7OfjupDiodfS/3ZFemfNnPjusNOrEf4cKdOHZtq3CRyMql0W2cUpmGdNjebY8nBN9KSOf/MA==
X-Received: by 2002:a2e:2403:0:b0:2a7:7259:9587 with SMTP id k3-20020a2e2403000000b002a772599587mr1111040ljk.46.1683222701245;
        Thu, 04 May 2023 10:51:41 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id i3-20020a2e9403000000b002a8b5310642sm6707037ljh.5.2023.05.04.10.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 10:51:40 -0700 (PDT)
Date:   Thu, 4 May 2023 19:51:38 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>,
        Vadim Fedorenko <vadim.fedorenko@linux.dev>,
        Vadim Fedorenko <vadfed@meta.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>, poros <poros@redhat.com>,
        mschmidt <mschmidt@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "Olech, Milena" <milena.olech@intel.com>,
        "Michalik, Michal" <michal.michalik@intel.com>
Subject: Re: [PATCH RFC v6 2/6] dpll: Add DPLL framework base functions
Message-ID: <ZFPwqu5W8NE6Luvk@nanopsycho>
References: <ZDJulCXj9H8LH+kl@nanopsycho>
 <20230410153149.602c6bad@kernel.org>
 <ZDwg88x3HS2kd6lY@nanopsycho>
 <20230417124942.4305abfa@kernel.org>
 <ZFDPaXlJainSOqmV@nanopsycho>
 <20230502083244.19543d26@kernel.org>
 <ZFITyWvVcqgRtN+Q@nanopsycho>
 <20230503191643.12a6e559@kernel.org>
 <ZFOQWmkBUtgVR06R@nanopsycho>
 <20230504090401.597a7a61@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230504090401.597a7a61@kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Thu, May 04, 2023 at 06:04:01PM CEST, kuba@kernel.org wrote:
>On Thu, 4 May 2023 13:00:42 +0200 Jiri Pirko wrote:
>> Thu, May 04, 2023 at 04:16:43AM CEST, kuba@kernel.org wrote:
>> >On Wed, 3 May 2023 09:56:57 +0200 Jiri Pirko wrote:  
>> >> Okay.
>> >> 
>> >> When netdev will have pin ID in the RT netlink message (as it is done
>> >> in RFCv7), it is easy to get the pin/dpll for netdev. No problem there.
>> >> 
>> >> However, for non-SyncE usecase, how do you imagine scripts to work?
>> >> I mean, the script have to obtain dpll/pin ID by deterministic
>> >> module_name/clock_id/idx tuple.  
>> >
>> >No scoped idx.  
>> 
>> That means, no index defined by a driver if I undestand you correctly,
>> right?
>
>Yes, my suggestion did not include a scoped index with no
>globally defined semantics.

Okay, makes sense. Devlink port index didn't end up well :/


> 
>> >> There are 2 options to do that:
>> >> 1) dump all dplls/pins and do lookup in userspace
>> >> 2) get a dpll/pin according to given module_name/clock_id/idx tuple
>> >> 
>> >> The first approach is not very nice.
>> >> The currently pushed RFCv7 of the patchset does not support 2)
>> >> 
>> >> Now if we add support for 2), we basically use module_name/clock_id/idx
>> >> as a handle for "get cmd". My point is, why can't we use it for "set
>> >> cmd" as well and avoid the ID entirely?  
>> >
>> >Sure, we don't _have_ to have an ID, but it seems go against normal
>> >data normalization rules. And I don't see any harm in it.
>> >
>> >But you're asking for per-device "idx" and that's a no-go for me,
>> >given already cited experience.
>> >
>> >The user space can look up the ID based on identifying information it
>> >has. IMO it's better to support multiple different intelligible elements  
>> 
>> Do you mean fixed tuple or variable tuple?
>> 
>> CMD_GET_ID
>>   -> DPLL_A_MODULE_NAME  
>>      DPLL_A_CLOCK_ID
>
>> What is the next intelligible element to identify DPLL device here?
>
>I don't know. We can always add more as needed.
>We presuppose that the devices are identifiable, so whatever info
>is used to identify them goes here.

Allright. So in case of ptp_ocp and mlx5, module_name and clock_id
are enough. In case of ice, DPLL_A_TYPE, attr is the one to make
distinction between the 2 dpll instances there

So for now, we can have:
 CMD_GET_ID
   -> DPLL_A_MODULE_NAME
      DPLL_A_CLOCK_ID
      DPLL_A_TYPE
   <- DPLL_A_ID


if user passes a subset which would not provide a single match, we error
out with -EINVAL and proper exack message. Makes sense?





>
>>   <- DPLL_A_ID
>> 
>> CMD_GET_PIN_ID
>>   -> DPLL_A_MODULE_NAME  
>>      DPLL_A_CLOCK_ID
>
>> What is the next intelligible element to identify a pin here?
>
>Same answer. Could be a name of the pin according to ASIC docs.
>Could be the ball name for a BGA package. Anything that's meaningful.

Okay, for pin, the type and label would probably do:
 CMD_GET_PIN_ID
   -> DPLL_A_MODULE_NAME
      DPLL_A_CLOCK_ID
      DPLL_A_PIN_TYPE
      DPLL_A_PIN_LABEL
   <- DPLL_A_PIN_ID

Again, if user passes a subset which would not provide a single match,
we error out with -EINVAL and proper exack message.

If there is only one pin for example, user query of DPLL_A_MODULE_NAME
and DPLL_A_CLOCK_ID would do return a single match. No need to pass
anything else.

I think this could work with both ice and ptp_ocp, correct guys?

For mlx5, I will have 2 or more pins with same module name, clock id
and type. For these SyncE pins the label does not really make sense.
But I don't have to query, because the PIN_ID is going to be exposed for
netdev over RT netlink. Clicks.

Makes sense?


>
>My point is that we don't want a field simply called "index". Because
>then for one vendor it will mean Ethernet port, for another SMA
>connector number and for the third pin of the package. Those are
>different attributes.

Got you and agree.


>
>>   <- DPLL_A_PIN_ID
>> 
>> >than single integer index into which drivers will start encoding all
>> >sort of info, using locally invented schemes.  
>> 
>> There could be multiple DPLL and pin instances for a single
>> module/clock_id tuple we have to distinguish somehow. If the driver
>> can't pass "index" of DPLL or a pin, how we distinguish them?
>> 
>> Plus is is possible that 2 driver instances share the same dpll
>> instance, then to get the dpll pointer reference, they do:
>> INSTANCE A:
>> dpll_0 = dpll_device_get(clock_id, 0, THIS_MODULE);
>> dpll_1 = dpll_device_get(clock_id, 1, THIS_MODULE);
>> 
>> INSTANCE B:
>> dpll_0 = dpll_device_get(clock_id, 0, THIS_MODULE);
>> dpll_1 = dpll_device_get(clock_id, 1, THIS_MODULE);
>> 
>> My point is, event if we don't expose the index to the userspace,
>> we need to have it internally.
>
>That's fine, I guess. I'd prefer driver matching to be the same as user
>space matching to force driver authors to have the same perspective as
>the user. But a "driver coookie" not visible to user space it probably
>fine.

Allright, lets leave them for now. As internal kernel API, could be
changed in the future if needed.

Arkadiusz, Vadim, are you following this?

