Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F85EC77B7F
	for <linux-clk@archiver.kernel.org>; Wed,  3 May 2023 07:57:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229649AbjECH5E (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 3 May 2023 03:57:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55082 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229625AbjECH5C (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 3 May 2023 03:57:02 -0400
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com [IPv6:2a00:1450:4864:20::52a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7DEF213E
        for <linux-clk@vger.kernel.org>; Wed,  3 May 2023 00:57:00 -0700 (PDT)
Received: by mail-ed1-x52a.google.com with SMTP id 4fb4d7f45d1cf-50bc4bc2880so5316077a12.2
        for <linux-clk@vger.kernel.org>; Wed, 03 May 2023 00:57:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1683100619; x=1685692619;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pcYFfZqejHZcwp6Yf370vPWTJUqUejy/+clrmToxzqI=;
        b=olDiilzCabAGiFawMWw7motGsETub6lHxM/WovTgYKHi1YXDv/jO0fLpvUPxuI6SEY
         AnJmrxUvXv74KkirN14i5EkJD0o/00UrFAs12SeFh0qIFrPGsbycIoSXNCo8DUVB/Fej
         SH1mxGk1GfOWpqzCsKZSRcxVnPEcLEPDccLXVaS0Sp+EEkrt5z61aKH23a7Fv8pqdDVL
         +6zDalgXJBKwh0eoXNcwLGPomF+uen0Zx0CqOjGOdDbn2u4gsy7Hj3UMqDNpzUG1bV34
         D8ADLZTOPFVd/TEJO1P+5ptI5y0v9z+ipJx5bfJIu74uSUa7mCQYT8sprl7AzZy2WWOS
         m8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683100619; x=1685692619;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pcYFfZqejHZcwp6Yf370vPWTJUqUejy/+clrmToxzqI=;
        b=MVMU4p7VAhShmQiNvwVwFbqsf6DQmyf1SwcqxnVsB71n3TZHsj4VpwfuIhYrVf6DZG
         lI1HJkbXL+nIgfYqaRF9qpM/dMWaiBY2wmQXPFlqgV8vy0yB+J6XRk9+ayydugpQvw0I
         UrMm4KhDw+OzA6kONhw6bA96I+QpXEoiykpqYhqZBEFf41jso4Anjc0Kw9xKjjnQHIIh
         XzZOBaJbcVT1AmWcObvUBr1boJecEnZNlscjS2Te3D6OHLIGaMmWRrUhfL4T7f8cPrjr
         /CCBU+A0iIe7r5xD8D8DxqzNXZyWuE5+BpZKMOg7x8wWCFzGzZKaWGXWCbo8Mn4ocnrK
         zPXA==
X-Gm-Message-State: AC+VfDxx/eTQxzYRTvB9e+UifMxHWbwZPl449Y3z3O5mM2JYQHa1QnIq
        TD77CeZ57X+QZhDspAbSePhGnA==
X-Google-Smtp-Source: ACHHUZ75tPCKlOQ/bn/9cUaJxhFluM9jLzpY4mk18g4A1GcSnQv350qD16SCW+v0l8wSswuicKZcUg==
X-Received: by 2002:a17:907:9724:b0:962:582d:89d7 with SMTP id jg36-20020a170907972400b00962582d89d7mr2527333ejc.38.1683100619256;
        Wed, 03 May 2023 00:56:59 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id g22-20020a170906595600b0094ed3abc937sm16841404ejr.82.2023.05.03.00.56.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 May 2023 00:56:58 -0700 (PDT)
Date:   Wed, 3 May 2023 09:56:57 +0200
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
Message-ID: <ZFITyWvVcqgRtN+Q@nanopsycho>
References: <ZBA8ofFfKigqZ6M7@nanopsycho>
 <DM6PR11MB4657120805D656A745EF724E9BBE9@DM6PR11MB4657.namprd11.prod.outlook.com>
 <ZBGOWQW+1JFzNsTY@nanopsycho>
 <20230403111812.163b7d1d@kernel.org>
 <ZDJulCXj9H8LH+kl@nanopsycho>
 <20230410153149.602c6bad@kernel.org>
 <ZDwg88x3HS2kd6lY@nanopsycho>
 <20230417124942.4305abfa@kernel.org>
 <ZFDPaXlJainSOqmV@nanopsycho>
 <20230502083244.19543d26@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230502083244.19543d26@kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Adding back the cclist stripped due to Claws bug.

Tue, May 02, 2023 at 05:32:44PM CEST, kuba@kernel.org wrote:
>On Tue, 2 May 2023 10:52:57 +0200 Jiri Pirko wrote:
>> >> Index internal within a single instance. Like Intel guys, they have 1
>> >> clock wired up with multiple DPLLs. The driver gives every DPLL index.
>> >> This is internal, totally up to the driver decision. Similar concept to
>> >> devlink port index.  
>> >
>> >devlink port index ended up as a pretty odd beast with drivers encoding
>> >various information into it, using locally grown schemes.
>> >
>> >Hard no on doing that in dpll, it should not be exposed to the user.  
>> 
>> So you say to have ID fully dynamic and non deterministic? I'm lost a
>> bit.
>
>Yup, non-deterministic, just a cyclic ID allocated by the core starting
>from 1. Finding the right device / pin needs to be done via
>informational attributes not making assumptions about the ID.

Okay.

When netdev will have pin ID in the RT netlink message (as it is done
in RFCv7), it is easy to get the pin/dpll for netdev. No problem there.

However, for non-SyncE usecase, how do you imagine scripts to work?
I mean, the script have to obtain dpll/pin ID by deterministic
module_name/clock_id/idx tuple.

There are 2 options to do that:
1) dump all dplls/pins and do lookup in userspace
2) get a dpll/pin according to given module_name/clock_id/idx tuple

The first approach is not very nice.
The currently pushed RFCv7 of the patchset does not support 2)

Now if we add support for 2), we basically use module_name/clock_id/idx
as a handle for "get cmd". My point is, why can't we use it for "set
cmd" as well and avoid the ID entirely?

What am I missing here?
