Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7898C7EE22
	for <linux-clk@archiver.kernel.org>; Mon, 15 May 2023 09:31:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231730AbjEOJbN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 15 May 2023 05:31:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36888 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240305AbjEOJaq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 15 May 2023 05:30:46 -0400
Received: from mail-wr1-x42b.google.com (mail-wr1-x42b.google.com [IPv6:2a00:1450:4864:20::42b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2F946E56
        for <linux-clk@vger.kernel.org>; Mon, 15 May 2023 02:30:38 -0700 (PDT)
Received: by mail-wr1-x42b.google.com with SMTP id ffacd0b85a97d-306281edf15so11797176f8f.1
        for <linux-clk@vger.kernel.org>; Mon, 15 May 2023 02:30:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1684143036; x=1686735036;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W6BSTCYK/WuLOkz9AG6TW1a3eQQDrhG76l1jFykbWQU=;
        b=u66WDxVUfm+0HPKxUq0rT+tvZOm6xx/h1Cb4vw2QwXBlTM5jGsxEK+iBZuVyV4zlMb
         a2KuKq3KcrZiDQc7crBEXsEiJO3H2/m0uxxK8TzTDJLa3I1Rre6LpT6YhXKELrwEsWwy
         5xzbq3E4GnxwRos1bYU1/uNQkOfABtcgHvYZmUJz+Si0F1jskldMzs/QvM8vvFbIrYJr
         aGjMLR69fbVjLSbqGVeWzRSXb4gnrNq5DaTujTw8HXYu0fHz1PQ8yIdULns8fGUNxaY2
         4ncf1t70/AoR7F5o+9FTNs/gcGeJuqD6Z/RCVXtWxdf7EQEHl66tUyqJDgX/Xp86Cl4i
         vPQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684143036; x=1686735036;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W6BSTCYK/WuLOkz9AG6TW1a3eQQDrhG76l1jFykbWQU=;
        b=UZAAnQIdfmqNTgPBord1eEQGRAEWf48XWvEtFaWIf3ubHCMfWaPTdcpoznEDRMesFC
         pZUMIcnmCTlEptM+hkl4aXtLuACD/XAzD7FVhlMlpwdFY9C1wzUFjxhAed9blRiOnVFx
         2hVWqueLJYABenxCTRrSwpHrVxIeBPycf9gG8DN/VvbBCKrPOEeENfJ/cSeU9bxx0NPL
         9tprjS1FsGlj7p2dSgfPy0sBdktZvPUFY7nt70pl/e0A6+iekPYcmJe8num1bGFNHbCK
         Oie/1dYbsbm0l7BV7C+WGHmYzPydcrmVJ8edt7weSITUh4ZgwfDfhqg72u59v1EblXRR
         wJgg==
X-Gm-Message-State: AC+VfDxxAw1gvKh2TLGSj/ypbGAqQUZmLnCnwmA1iNvxheLx4W51K/7/
        voFuaVXJ/Z4lAysliDrEvbCsqw==
X-Google-Smtp-Source: ACHHUZ7HsO3IDkKNYHrf1UocuJiNC3jR9r3hPnrkeVc35ERImxr3DuADDzUzGPZ+70i4Ke4a3nRwCg==
X-Received: by 2002:a5d:58f4:0:b0:306:8f5b:1b49 with SMTP id f20-20020a5d58f4000000b003068f5b1b49mr24839324wrd.47.1684143036436;
        Mon, 15 May 2023 02:30:36 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id q12-20020a05600000cc00b0030795b2be15sm24162409wrx.103.2023.05.15.02.30.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 May 2023 02:30:35 -0700 (PDT)
Date:   Mon, 15 May 2023 11:30:34 +0200
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
Message-ID: <ZGH7uvxD55Pan0gf@nanopsycho>
References: <20230428002009.2948020-1-vadfed@meta.com>
 <20230428002009.2948020-2-vadfed@meta.com>
 <ZFOe1sMFtAOwSXuO@nanopsycho>
 <20230504142451.4828bbb5@kernel.org>
 <MN2PR11MB46645511A6C93F5C98A8A66F9B749@MN2PR11MB4664.namprd11.prod.outlook.com>
 <ZFygbd1H+VdvCTyH@nanopsycho>
 <DM6PR11MB4657924148B84F502A44903D9B749@DM6PR11MB4657.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR11MB4657924148B84F502A44903D9B749@DM6PR11MB4657.namprd11.prod.outlook.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Thu, May 11, 2023 at 10:51:43PM CEST, arkadiusz.kubalewski@intel.com wrote:
>>From: Jiri Pirko <jiri@resnulli.us>
>>Sent: Thursday, May 11, 2023 10:00 AM
>>
>>Thu, May 11, 2023 at 09:40:26AM CEST, arkadiusz.kubalewski@intel.com wrote:
>>>>From: Jakub Kicinski <kuba@kernel.org>
>>>>Sent: Thursday, May 4, 2023 11:25 PM
>>>>
>>>>On Thu, 4 May 2023 14:02:30 +0200 Jiri Pirko wrote:
>>>>> >+definitions:
>>>>> >+  -
>>>>> >+    type: enum
>>>>> >+    name: mode
>>>>> >+    doc: |
>>>>> >+      working-modes a dpll can support, differentiate if and how dpll
>>>>>selects
>>>>> >+      one of its sources to syntonize with it, valid values for
>>>>>DPLL_A_MODE
>>>>> >+      attribute
>>>>> >+    entries:
>>>>> >+      -
>>>>> >+        name: unspec
>>>>>
>>>>> In general, why exactly do we need unspec values in enums and CMDs?
>>>>> What is the usecase. If there isn't please remove.
>>>>
>>>>+1
>>>>
>>>
>>>Sure, fixed.
>>>
>>>>> >+        doc: unspecified value
>>>>> >+      -
>>>>> >+        name: manual
>>>>
>>>>I think the documentation calls this "forced", still.
>>>>
>>>
>>>Yes, good catch, fixed docs.
>>>
>>>>> >+        doc: source can be only selected by sending a request to dpll
>>>>> >+      -
>>>>> >+        name: automatic
>>>>> >+        doc: highest prio, valid source, auto selected by dpll
>>>>> >+      -
>>>>> >+        name: holdover
>>>>> >+        doc: dpll forced into holdover mode
>>>>> >+      -
>>>>> >+        name: freerun
>>>>> >+        doc: dpll driven on system clk, no holdover available
>>>>>
>>>>> Remove "no holdover available". This is not a state, this is a mode
>>>>> configuration. If holdover is or isn't available, is a runtime info.
>>>>
>>>>Agreed, seems a little confusing now. Should we expose the system clk
>>>>as a pin to be able to force lock to it? Or there's some extra magic
>>>>at play here?
>>>
>>>In freerun you cannot lock to anything it, it just uses system clock from
>>>one of designated chip wires (which is not a part of source pins pool) to
>>>feed the dpll. Dpll would only stabilize that signal and pass it further.
>>>Locking itself is some kind of magic, as it usually takes at least ~15
>>>seconds before it locks to a signal once it is selected.
>>>
>>>>
>>>>> >+      -
>>>>> >+        name: nco
>>>>> >+        doc: dpll driven by Numerically Controlled Oscillator
>>>>
>>>>Noob question, what is NCO in terms of implementation?
>>>>We source the signal from an arbitrary pin and FW / driver does
>>>>the control? Or we always use system refclk and then tune?
>>>>
>>>
>>>Documentation of chip we are using, stated NCO as similar to FREERUN, and
>>it
>>
>>So how exactly this is different to freerun? Does user care or he would
>>be fine with "freerun" in this case? My point is, isn't "NCO" some
>>device specific thing that should be abstracted out here?
>>
>
>Sure, it is device specific, some synchronizing circuits would have this
>capability, while others would not.
>Should be abstracted out? It is a good question.. shall user know that he is in
>freerun with possibility to control the frequency or not?
>Let's say we remove NCO, and have dpll with enabled FREERUN mode and pins
>supporting multiple output frequencies.
>How the one would know if those frequencies are supported only in
>MANUAL/AUTOMATIC modes or also in the FREERUN mode?
>In other words: As the user can I change a frequency of a dpll if active
>mode is FREERUN?

Okay, I think I'm deep in the DPLL infra you are pushing, but my
understanding that you can control frequency in NCO mode is not present
:/ That only means it may be confusing and not described properly.
How do you control this frequency exactly? I see no such knob.

Can't the oscilator be modeled as a pin and then you are not in freerun
but locked this "internal pin"? We know how to control frequency there.


>
>I would say it is better to have such mode, we could argue on naming though.
>
>>
>>>runs on a SYSTEM CLOCK provided to the chip (plus some stabilization and
>>>dividers before it reaches the output).
>>>It doesn't count as an source pin, it uses signal form dedicated wire for
>>>SYSTEM CLOCK.
>>>In this case control over output frequency is done by synchronizer chip
>>>firmware, but still it will not lock to any source pin signal.
>>>
>>>>> >+    render-max: true
>>>>> >+  -
>>>>> >+    type: enum
>>>>> >+    name: lock-status
>>>>> >+    doc: |
>>>>> >+      provides information of dpll device lock status, valid values for
>>>>> >+      DPLL_A_LOCK_STATUS attribute
>>>>> >+    entries:
>>>>> >+      -
>>>>> >+        name: unspec
>>>>> >+        doc: unspecified value
>>>>> >+      -
>>>>> >+        name: unlocked
>>>>> >+        doc: |
>>>>> >+          dpll was not yet locked to any valid source (or is in one of
>>>>> >+          modes: DPLL_MODE_FREERUN, DPLL_MODE_NCO)
>>>>> >+      -
>>>>> >+        name: calibrating
>>>>> >+        doc: dpll is trying to lock to a valid signal
>>>>> >+      -
>>>>> >+        name: locked
>>>>> >+        doc: dpll is locked
>>>>> >+      -
>>>>> >+        name: holdover
>>>>> >+        doc: |
>>>>> >+          dpll is in holdover state - lost a valid lock or was forced by
>>>>> >+          selecting DPLL_MODE_HOLDOVER mode
>>>>>
>>>>> Is it needed to mention the holdover mode. It's slightly confusing,
>>>>> because user might understand that the lock-status is always "holdover"
>>>>> in case of "holdover" mode. But it could be "unlocked", can't it?
>>>>> Perhaps I don't understand the flows there correctly :/
>>>>
>>>>Hm, if we want to make sure that holdover mode must result in holdover
>>>>state then we need some extra atomicity requirements on the SET
>>>>operation. To me it seems logical enough that after setting holdover
>>>>mode we'll end up either in holdover or unlocked status, depending on
>>>>lock status when request reached the HW.
>>>>
>>>
>>>Improved the docs:
>>>        name: holdover
>>>        doc: |
>>>          dpll is in holdover state - lost a valid lock or was forced
>>>          by selecting DPLL_MODE_HOLDOVER mode (latter possible only
>>>          when dpll lock-state was already DPLL_LOCK_STATUS_LOCKED,
>>>	  if it was not, the dpll's lock-status will remain
>>
>>"if it was not" does not really cope with the sentence above that. Could
>>you iron-out the phrasing a bit please?
>
>
>Hmmm,
>        name: holdover
>        doc: |
>          dpll is in holdover state - lost a valid lock or was forced
>          by selecting DPLL_MODE_HOLDOVER mode (latter possible only
>          when dpll lock-state was already DPLL_LOCK_STATUS_LOCKED,
>          if dpll lock-state was not DPLL_LOCK_STATUS_LOCKED, the
>          dpll's lock-state shall remain DPLL_LOCK_STATUS_UNLOCKED
>          even if DPLL_MODE_HOLDOVER was requested)
>
>Hope this is better?

Okay.

>
>
>Thank you!
>Arkadiusz
>
>[...]
