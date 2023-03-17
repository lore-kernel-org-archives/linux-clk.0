Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20916C6FD1D
	for <linux-clk@archiver.kernel.org>; Fri, 17 Mar 2023 10:07:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229925AbjCQKHN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 17 Mar 2023 06:07:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229943AbjCQKHM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 17 Mar 2023 06:07:12 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1B9616422E
        for <linux-clk@vger.kernel.org>; Fri, 17 Mar 2023 03:07:11 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id q16so3914529wrw.2
        for <linux-clk@vger.kernel.org>; Fri, 17 Mar 2023 03:07:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112; t=1679047629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6nbUDuEU6uTWIAdeLCP5lhT1CFPOOyV80Bskgn2+yJU=;
        b=mgl13Gym82GcWn1Wtlr4PcbrzztuXSmQQdp5RIO2IM5NsR2RaJmV41CVihP2rt6aVq
         a5+4vMzNMSxrAEzWZTTtSJvSxqSwVuJUpwecD8sKMR69GM4Mq/NUZCwIF8ocuGvCr6eb
         5XjmjMtuHQfxwkAw+uTyG3voLkMncng+PKbjB4cBCVpRNQXjx5e9GXWHeswe0oipDOSi
         VwEvN1scjgKQfxA69wAyMGIxIDz0buNaigpdPnK86kVygveJjDH0ldYcOP/4qLMEIJZX
         zbTfk4EqAMwzKmnY962UueqHGhstFQVHGHRlZ9jObIusQQNOxxn5D2LKW0SRwWskjU8E
         3OPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1679047629;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6nbUDuEU6uTWIAdeLCP5lhT1CFPOOyV80Bskgn2+yJU=;
        b=wyocH6sjOkzcqJmXJemvnedaR6fADlfQ1wN9Vquu/9/t7T/+wxOae1+5rzCIXNMDSl
         rqcEJdHeKpB+BKpPJfhXhm1ikGhH9123RhgVcE1Nb+yx2nDhn4N3FW6eFWPwwDOWyplw
         L2VW4n6XCTxVCpjzGAjmnHp2FYAcSgbeX/CmscHDEagp7ZF8ogQL5K3Le7p9zNGSPzAQ
         CnCHSRo+T98kfU3RYE2CwyJsgdVsprukqi83x5uv6PRZQSj3xyYUgKiPtr8ymD5q8qSW
         0t++Goz8agRjuanw6Tz6oC9mi1upCKXTapbIDIpkXpCRLZQoTlfC1vVa0yC5ezDxJmys
         UWaQ==
X-Gm-Message-State: AO0yUKUXiKHxfKeCtfCsqNr0o2O+i8Xz0mBj3lLHt1aVBnoeZWJVz8hp
        Cl9PqnkdRLF9ZyrG5oyItOOf4Q==
X-Google-Smtp-Source: AK7set/qq8MbDkna0M2I0vYYINGvM6YraMvrzeQW+GKf79XOPl/1BxYkvQpFPdQ+QbLBSRHxaXNaGw==
X-Received: by 2002:a5d:522b:0:b0:2cf:e67c:8245 with SMTP id i11-20020a5d522b000000b002cfe67c8245mr6724886wra.44.1679047629414;
        Fri, 17 Mar 2023 03:07:09 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id h4-20020a5d5044000000b002c70851fdd8sm1573504wrt.75.2023.03.17.03.07.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Mar 2023 03:07:08 -0700 (PDT)
Date:   Fri, 17 Mar 2023 11:07:07 +0100
From:   Jiri Pirko <jiri@resnulli.us>
To:     "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>
Cc:     Vadim Fedorenko <vadfed@meta.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Vadim Fedorenko <vadim.fedorenko@linux.dev>,
        poros <poros@redhat.com>, mschmidt <mschmidt@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "Michalik, Michal" <michal.michalik@intel.com>
Subject: Re: [PATCH RFC v6 1/6] dpll: spec: Add Netlink spec in YAML
Message-ID: <ZBQ7y/TT9UgQgKlh@nanopsycho>
References: <20230312022807.278528-1-vadfed@meta.com>
 <20230312022807.278528-2-vadfed@meta.com>
 <ZBCIPg1u8UFugEFj@nanopsycho>
 <DM6PR11MB4657F423D2B3B4F0799B0F019BBC9@DM6PR11MB4657.namprd11.prod.outlook.com>
 <ZBMdZkK91GHDrd/4@nanopsycho>
 <ZBMzmHnW707gIvAU@nanopsycho>
 <DM6PR11MB4657BD050F326085A21817C99BBD9@DM6PR11MB4657.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR11MB4657BD050F326085A21817C99BBD9@DM6PR11MB4657.namprd11.prod.outlook.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Fri, Mar 17, 2023 at 01:53:49AM CET, arkadiusz.kubalewski@intel.com wrote:
>>From: Jiri Pirko <jiri@resnulli.us>
>>Sent: Thursday, March 16, 2023 4:20 PM
>>
>>Thu, Mar 16, 2023 at 02:45:10PM CET, jiri@resnulli.us wrote:
>>>Thu, Mar 16, 2023 at 02:15:59PM CET, arkadiusz.kubalewski@intel.com wrote:
>>
>>[...]
>>
>>
>>>>>>+      flags: [ admin-perm ]
>>>>>>+
>>>>>>+      do:
>>>>>>+        pre: dpll-pre-doit
>>>>>>+        post: dpll-post-doit
>>>>>>+        request:
>>>>>>+          attributes:
>>>>>>+            - id
>>>>>>+            - bus-name
>>>>>>+            - dev-name
>>>>>>+            - mode
>>>>>
>>>>>Hmm, shouldn't source-pin-index be here as well?
>>>>
>>>>No, there is no set for this.
>>>>For manual mode user selects the pin by setting enabled state on the one
>>>>he needs to recover signal from.
>>>>
>>>>source-pin-index is read only, returns active source.
>>>
>>>Okay, got it. Then why do we have this assymetric approach? Just have
>>>the enabled state to serve the user to see which one is selected, no?
>>>This would help to avoid confusion (like mine) and allow not to create
>>>inconsistencies (like no pin enabled yet driver to return some source
>>>pin index)
>>
>>Actually, for mlx5 implementation, would be non-trivial to implement
>>this, as each of the pin/port is instantiated and controlled by separate
>>pci backend.
>>
>>Could you please remove, it is not needed and has potential and real
>>issues.
>>
>>[...]
>
>Sorry I cannot, for priority based automatic selection mode multiple sources
>are enabled at any time - selection is done automatically by the chip.
>Thus for that case, this attribute is only way of getting an active source.
>Although, maybe we could allow driver to not implement it, would this help
>for your case? As it seems only required for automatic mode selection.

Please see the other reply for this patch where I describe what I
think is wrong about this approach and suggesting a solution.


>
>Thank you,
>Arkadiusz
