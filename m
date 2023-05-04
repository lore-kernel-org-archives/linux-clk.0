Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A8726C7EE21
	for <linux-clk@archiver.kernel.org>; Thu,  4 May 2023 11:14:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229774AbjEDLOa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 4 May 2023 07:14:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229806AbjEDLO3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 4 May 2023 07:14:29 -0400
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com [IPv6:2a00:1450:4864:20::334])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8AB546B3
        for <linux-clk@vger.kernel.org>; Thu,  4 May 2023 04:14:26 -0700 (PDT)
Received: by mail-wm1-x334.google.com with SMTP id 5b1f17b1804b1-3f178da21b5so2594355e9.3
        for <linux-clk@vger.kernel.org>; Thu, 04 May 2023 04:14:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1683198865; x=1685790865;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=PUa05Tm/5AD86rND95WZHUr+PT5uRa9QsOrn0+SQoe4=;
        b=FNrcp8eahY9HHQAPrOgE2l3jAoEftR2Qknbq5yzRzzIUIAFx3S8UYtGuYvyHSs3d1Q
         Wu23bwG/gQPhj19eBHus6zkVE8PogGJ48pXiWcVb7wzQ/O+UImiQfq/ug2TabGweL5Xr
         e/g7lIsR88buuDlgb/o9V8l0zZRrOHujpWoJKnvAZWrYlYrXlVhhMdNWY3LqFwgNbo04
         edoAYMRQVGAiZOhQxa9biNJOTD4BlVf0wjMeWVrdzu2SYrKt9YRuNhtkiHT4jKPlRk7P
         NYaHV3lRr5axoeVEnnsavGi82lcY366W0bS8vpCJNUQtkROgPyXHEeKPfRDSpNt5y2m2
         JTqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683198865; x=1685790865;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PUa05Tm/5AD86rND95WZHUr+PT5uRa9QsOrn0+SQoe4=;
        b=NPZozN5ECPWu5lhfD/RgwqM72za0x1ex/5yoFfJIhi+1r2wQXz2pjVZ/wyLIdBTUAR
         7IgNbdzLUj9WSLtmKQENi47d+4ffMpyCPbc70V8Dcm705BCFeTDy13Wxvb+Ix4L45eyZ
         wheG9Zb0bqFubNuN1cL70Ez0i1g7Oq7fxqYBjdDgi/ZIlyp3DkkMR33O+1kpeitqjefG
         OoovREadR3gfvvxGckLjqitcWUof2Jv9kvBcK8mkbdWFBuO8FwXIR//Cj7+0xH+qeiPL
         3i+9gjDMjXhJfKqLGZSbt0HXp/UlCMAg5GEdtyFGcFc+xiyNRbjgD6M3SvjHodh9FJl0
         EGHQ==
X-Gm-Message-State: AC+VfDzCCmAmnhDmBI5BZwJ9DgjYXuQ1I3u5so7vcD4WcSD3ny+JNPQa
        zZwc0fEn684689AjKvAySyLg5A==
X-Google-Smtp-Source: ACHHUZ5HJnCkhVQ11dRZ+saw0vpjw8c6PMeCja53U+LDrpNNXXiocrze1hQAaIb3Oks6llFH6BLBVw==
X-Received: by 2002:a5d:558b:0:b0:306:3bf0:f1ec with SMTP id i11-20020a5d558b000000b003063bf0f1ecmr2498018wrv.7.1683198865228;
        Thu, 04 May 2023 04:14:25 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id k9-20020a5d6e89000000b0030629536e64sm12715926wrz.30.2023.05.04.04.14.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 May 2023 04:14:24 -0700 (PDT)
Date:   Thu, 4 May 2023 13:14:23 +0200
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
Message-ID: <ZFOTj70DxE2IMitO@nanopsycho>
References: <20230403111812.163b7d1d@kernel.org>
 <ZDJulCXj9H8LH+kl@nanopsycho>
 <20230410153149.602c6bad@kernel.org>
 <ZDwg88x3HS2kd6lY@nanopsycho>
 <20230417124942.4305abfa@kernel.org>
 <ZFDPaXlJainSOqmV@nanopsycho>
 <20230502083244.19543d26@kernel.org>
 <ZFITyWvVcqgRtN+Q@nanopsycho>
 <20230503191643.12a6e559@kernel.org>
 <ZFOQWmkBUtgVR06R@nanopsycho>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZFOQWmkBUtgVR06R@nanopsycho>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Thu, May 04, 2023 at 01:00:42PM CEST, jiri@resnulli.us wrote:
>Thu, May 04, 2023 at 04:16:43AM CEST, kuba@kernel.org wrote:
>>On Wed, 3 May 2023 09:56:57 +0200 Jiri Pirko wrote:
>>> >Yup, non-deterministic, just a cyclic ID allocated by the core starting
>>> >from 1. Finding the right device / pin needs to be done via
>>> >informational attributes not making assumptions about the ID.  
>>> 
>>> Okay.
>>> 
>>> When netdev will have pin ID in the RT netlink message (as it is done
>>> in RFCv7), it is easy to get the pin/dpll for netdev. No problem there.
>>> 
>>> However, for non-SyncE usecase, how do you imagine scripts to work?
>>> I mean, the script have to obtain dpll/pin ID by deterministic
>>> module_name/clock_id/idx tuple.
>>
>>No scoped idx.
>
>That means, no index defined by a driver if I undestand you correctly,
>right?
>
>
>>
>>> There are 2 options to do that:
>>> 1) dump all dplls/pins and do lookup in userspace
>>> 2) get a dpll/pin according to given module_name/clock_id/idx tuple
>>> 
>>> The first approach is not very nice.
>>> The currently pushed RFCv7 of the patchset does not support 2)
>>> 
>>> Now if we add support for 2), we basically use module_name/clock_id/idx
>>> as a handle for "get cmd". My point is, why can't we use it for "set
>>> cmd" as well and avoid the ID entirely?
>>
>>Sure, we don't _have_ to have an ID, but it seems go against normal
>>data normalization rules. And I don't see any harm in it.
>>
>>But you're asking for per-device "idx" and that's a no-go for me,
>>given already cited experience.
>>
>>The user space can look up the ID based on identifying information it
>>has. IMO it's better to support multiple different intelligible elements
>
>Do you mean fixed tuple or variable tuple?
>
>CMD_GET_ID
>  -> DPLL_A_MODULE_NAME
>     DPLL_A_CLOCK_ID

Sorry, I hit the send button by a mistake.
I ment to add a question here:
What is the next intelligible element to identify DPLL device here?

>  <- DPLL_A_ID
>
>CMD_GET_PIN_ID
>  -> DPLL_A_MODULE_NAME
>     DPLL_A_CLOCK_ID

What is the next intelligible element to identify a pin here?

>  <- DPLL_A_PIN_ID
>
>
>
>>than single integer index into which drivers will start encoding all
>>sort of info, using locally invented schemes.
>
>There could be multiple DPLL and pin instances for a single
>module/clock_id tuple we have to distinguish somehow. If the driver
>can't pass "index" of DPLL or a pin, how we distinguish them?
>
>Plus is is possible that 2 driver instances share the same dpll
>instance, then to get the dpll pointer reference, they do:
>INSTANCE A:
>dpll_0 = dpll_device_get(clock_id, 0, THIS_MODULE);
>dpll_1 = dpll_device_get(clock_id, 1, THIS_MODULE);
>
>INSTANCE B:
>dpll_0 = dpll_device_get(clock_id, 0, THIS_MODULE);
>dpll_1 = dpll_device_get(clock_id, 1, THIS_MODULE);
>
>My point is, event if we don't expose the index to the userspace,
>we need to have it internally.
>
