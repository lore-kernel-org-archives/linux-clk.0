Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A447C7EE22
	for <linux-clk@archiver.kernel.org>; Thu, 11 May 2023 08:01:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235469AbjEKIA7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 May 2023 04:00:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60492 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237808AbjEKIAs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 May 2023 04:00:48 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AB00DDD
        for <linux-clk@vger.kernel.org>; Thu, 11 May 2023 01:00:38 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id 4fb4d7f45d1cf-50bd875398dso12504816a12.1
        for <linux-clk@vger.kernel.org>; Thu, 11 May 2023 01:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1683792037; x=1686384037;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=wEgpzaMTC/X6SsRH5CQ7hwSBgGWTsbUsbTezZEi8pTI=;
        b=GfPaQ0CTArFj4Uwryvv+V9goljOzlqoIf+pZCp43gqmDNI4VAs6F0l8Kpl6yGAfaGh
         CGOqVQzWtTqDaCqvV7Z3gbvSkZBg4YVqpTBV8paMS9QkOrEQV81FfxO85FlpNaRZOM4o
         Jsu1A+Ip12aFRwyxh1q2NaUCOMTY6ln+Z2RcgBEWB7nWkyMEp39qmFUzJ+xLEIMqNJFf
         3t3dcDXA6zphtzQRBS+hN5Hx8JgWNN0ZzilD9GV47UT+mejaSzoG8g+vF9sx8OyhJm+e
         Q/B5LRXNzI4uGeb31KTMRvzdOvJ1TI/l6jFbjl9F02vrfcWPI5HWGbZwVinVtNuxBHHy
         8gZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683792037; x=1686384037;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wEgpzaMTC/X6SsRH5CQ7hwSBgGWTsbUsbTezZEi8pTI=;
        b=SgeSfGv02pD7/bJ9asHS2a8tzRQtyPvWdWGH8Ewjt9bOCV71ffibZzZstY4TUK+VQ2
         6Im4EirAZ14LZ7vQ+TOuflrEPgrKAYPySEn/6BKe03JX95XytGhpklZIbXEWD4c935PB
         0JgmfjjtC59hjSsNYtAQnaoqS5kSTW1UFgGMPa/QtqdqEybxGXFxel2Y2qAgF4Sez8v7
         eXWQkzzfOX9zx2rAhQ1OPd7OWh1vXN7211jiylmjkMTrpcwcp24TagAG9oaFV00QWlij
         u6LCSElgJHhn5BXnGQ5yCcvMtT4q6N2Fc2vIQ5UhzikeezFRwUn8L4ej7GbvImWjhVYn
         6keg==
X-Gm-Message-State: AC+VfDwjlZ9zpqz6ACNRf5yeqRFx1nDSuoMDbuDx/TVJY7lIUDzlEVw+
        z2k5EeXzLETid3g9O64xOKpA7A==
X-Google-Smtp-Source: ACHHUZ4xkPoobxJSKKK37mixtKZcFyYSdlDYFHBvM5YUr1hTzKRDC8wunLInjvpEQINHv76V1Dsw3g==
X-Received: by 2002:a50:fa86:0:b0:508:41df:b276 with SMTP id w6-20020a50fa86000000b0050841dfb276mr16851910edr.22.1683792037046;
        Thu, 11 May 2023 01:00:37 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id n2-20020aa7c442000000b0050d97582ce1sm2643468edr.48.2023.05.11.01.00.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 01:00:36 -0700 (PDT)
Date:   Thu, 11 May 2023 10:00:35 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        Vadim Fedorenko <vadfed@meta.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        "Olech, Milena" <milena.olech@intel.com>,
        "Michalik, Michal" <michal.michalik@intel.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>, poros <poros@redhat.com>,
        mschmidt <mschmidt@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        Vadim Fedorenko <vadim.fedorenko@linux.dev>
Subject: Re: [RFC PATCH v7 1/8] dpll: spec: Add Netlink spec in YAML
Message-ID: <ZFygo47TtTdb8IQa@nanopsycho>
References: <20230428002009.2948020-1-vadfed@meta.com>
 <20230428002009.2948020-2-vadfed@meta.com>
 <ZFOe1sMFtAOwSXuO@nanopsycho>
 <20230504142451.4828bbb5@kernel.org>
 <ZFTap8tIHWdbzGwp@nanopsycho>
 <MN2PR11MB4664357BAEC609040CF480C69B749@MN2PR11MB4664.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MN2PR11MB4664357BAEC609040CF480C69B749@MN2PR11MB4664.namprd11.prod.outlook.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Thu, May 11, 2023 at 09:44:30AM CEST, arkadiusz.kubalewski@intel.com wrote:
>
>>From: Jiri Pirko <jiri@resnulli.us>
>>Sent: Friday, May 5, 2023 12:30 PM
>>
>>Thu, May 04, 2023 at 11:24:51PM CEST, kuba@kernel.org wrote:
>>>On Thu, 4 May 2023 14:02:30 +0200 Jiri Pirko wrote:
>>
>>[...]
>>
>>>
>>>> >+    name: device
>>>> >+    subset-of: dpll
>>>> >+    attributes:
>>>> >+      -
>>>> >+        name: id
>>>> >+        type: u32
>>>> >+        value: 2
>>>> >+      -
>>>> >+        name: dev-name
>>>> >+        type: string
>>>> >+      -
>>>> >+        name: bus-name
>>>> >+        type: string
>>>> >+      -
>>>> >+        name: mode
>>>> >+        type: u8
>>>> >+        enum: mode
>>>> >+      -
>>>> >+        name: mode-supported
>>>> >+        type: u8
>>>> >+        enum: mode
>>>> >+        multi-attr: true
>>>> >+      -
>>>> >+        name: lock-status
>>>> >+        type: u8
>>>> >+        enum: lock-status
>>>> >+      -
>>>> >+        name: temp
>>>> >+        type: s32
>>>> >+      -
>>>> >+        name: clock-id
>>>> >+        type: u64
>>>> >+      -
>>>> >+        name: type
>>>> >+        type: u8
>>>> >+        enum: type
>>>> >+      -
>>>> >+        name: pin-prio
>>>> >+        type: u32
>>>> >+        value: 19
>>>>
>>>> Do you still need to pass values for a subset? That is odd. Well, I
>>>> think is is odd to pass anything other than names in subset definition,
>>>> the rest of the info is in the original attribute set definition,
>>>> isn't it?
>>>> Jakub?
>>>
>>>Probably stale code, related bug was fixed in YNL a few months back.
>>>Explicit value should no longer be needed.
>>
>>What about the rest, like type, enum, multi-attr etc. Are they needed
>>for subset? If yes, why?
>>
>>
>
>It seems the name and type is needed. Without type generation scripts fails.
>For now fixed with having only name/type on subset attributes.

Okay. Jakub, any idea why "type" is needed here?


>
>Thanks!
>Arkadiusz
