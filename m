Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D24DC77B7F
	for <linux-clk@archiver.kernel.org>; Thu, 11 May 2023 08:00:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237149AbjEKH77 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 May 2023 03:59:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237768AbjEKH7x (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 May 2023 03:59:53 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2BAA18699
        for <linux-clk@vger.kernel.org>; Thu, 11 May 2023 00:59:44 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-965d73eb65fso1313448766b.2
        for <linux-clk@vger.kernel.org>; Thu, 11 May 2023 00:59:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1683791982; x=1686383982;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=ve1AsxWOY8XkHeL1xhVZQ8hlEzSI4wGJ8N3UWAx19ow=;
        b=rbW/ekvEJlXOt0JHPV/hdaRMMA3Lr6N9AanQN1RTcNc8vnM9or4tsgzktJdzQROdIs
         69sk2EkBM3iwV2jMzXVJS02KTL2PX3QUmJEbPr2HcIJVkpXbQ4oaxpM2gIJH8miuES3F
         z4NMBMMotSG8C4V1ChMcte8jzrIpCmiJXRJ7VSoJ3jGy3BbWPxXzbx25p06zwI1V23mY
         7/tx7JKE3B+yE8IrOZumni8l+lD+D2YopQUn7GYhiF7B1FcSGl3i7dd2+0Jb9LmBpEIC
         EzSMEY/0XdCHDH8CGpYSsWHAel1pp52SHJzTDqDaw19SBs/f4WlSj3QBuwE5noMaU+YB
         sYBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683791982; x=1686383982;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ve1AsxWOY8XkHeL1xhVZQ8hlEzSI4wGJ8N3UWAx19ow=;
        b=hA4P1ck5rstnTtjIq7RGnUhPTttVDkI0OJVze02mHUx66V3Umbd9276hipY4VScFpR
         pgtg8yekbL9DI0eyHxLElfA6HOzUhcBsj6Symzy5Le7++tp0HsiBP4uueBfPVNkVTwx6
         ZlgyDD1gEseFUZzZ+wioU2jDAZqq3PIo9uajSKx9BuuquCDLlinkbiovgxTipIeoNlgp
         C2rgyFgb/vvz/8OlR2cduF+9Bl9TG3ZsgHMtpm7KVgbrA29QY7gu61MzWFK8K18NblOA
         /ImnX+ulPEqBsdGFMcKBWAcfQNTr1yMm2Q66acuNOfwVQYaSiCoZ8oQABkWwGhCQs1kU
         sIOQ==
X-Gm-Message-State: AC+VfDxZsQHKLHhL4tKnWC7SCMlTG2Av0/0hs2pN8GxswULI6O5+IEGT
        bm3Jl6A8QwLNPMqDvAmrp5qUig==
X-Google-Smtp-Source: ACHHUZ7IRkUG4hUD6SnmhMkyDtumYl+gTlLFaLHd3ObzeeO0ddq7vSKhAf3/TPBj/nJ4ZS0LUhSizQ==
X-Received: by 2002:a17:907:8a29:b0:965:f8b7:b0cd with SMTP id sc41-20020a1709078a2900b00965f8b7b0cdmr24583697ejc.25.1683791982562;
        Thu, 11 May 2023 00:59:42 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id og16-20020a1709071dd000b0096637a19dcasm3653875ejc.4.2023.05.11.00.59.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 May 2023 00:59:42 -0700 (PDT)
Date:   Thu, 11 May 2023 09:59:41 +0200
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
Message-ID: <ZFygbd1H+VdvCTyH@nanopsycho>
References: <20230428002009.2948020-1-vadfed@meta.com>
 <20230428002009.2948020-2-vadfed@meta.com>
 <ZFOe1sMFtAOwSXuO@nanopsycho>
 <20230504142451.4828bbb5@kernel.org>
 <MN2PR11MB46645511A6C93F5C98A8A66F9B749@MN2PR11MB4664.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <MN2PR11MB46645511A6C93F5C98A8A66F9B749@MN2PR11MB4664.namprd11.prod.outlook.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Thu, May 11, 2023 at 09:40:26AM CEST, arkadiusz.kubalewski@intel.com wrote:
>>From: Jakub Kicinski <kuba@kernel.org>
>>Sent: Thursday, May 4, 2023 11:25 PM
>>
>>On Thu, 4 May 2023 14:02:30 +0200 Jiri Pirko wrote:
>>> >+definitions:
>>> >+  -
>>> >+    type: enum
>>> >+    name: mode
>>> >+    doc: |
>>> >+      working-modes a dpll can support, differentiate if and how dpll
>>>selects
>>> >+      one of its sources to syntonize with it, valid values for
>>>DPLL_A_MODE
>>> >+      attribute
>>> >+    entries:
>>> >+      -
>>> >+        name: unspec
>>>
>>> In general, why exactly do we need unspec values in enums and CMDs?
>>> What is the usecase. If there isn't please remove.
>>
>>+1
>>
>
>Sure, fixed.
>
>>> >+        doc: unspecified value
>>> >+      -
>>> >+        name: manual
>>
>>I think the documentation calls this "forced", still.
>>
>
>Yes, good catch, fixed docs.
>
>>> >+        doc: source can be only selected by sending a request to dpll
>>> >+      -
>>> >+        name: automatic
>>> >+        doc: highest prio, valid source, auto selected by dpll
>>> >+      -
>>> >+        name: holdover
>>> >+        doc: dpll forced into holdover mode
>>> >+      -
>>> >+        name: freerun
>>> >+        doc: dpll driven on system clk, no holdover available
>>>
>>> Remove "no holdover available". This is not a state, this is a mode
>>> configuration. If holdover is or isn't available, is a runtime info.
>>
>>Agreed, seems a little confusing now. Should we expose the system clk
>>as a pin to be able to force lock to it? Or there's some extra magic
>>at play here?
>
>In freerun you cannot lock to anything it, it just uses system clock from
>one of designated chip wires (which is not a part of source pins pool) to feed
>the dpll. Dpll would only stabilize that signal and pass it further.
>Locking itself is some kind of magic, as it usually takes at least ~15 seconds
>before it locks to a signal once it is selected.
>
>>
>>> >+      -
>>> >+        name: nco
>>> >+        doc: dpll driven by Numerically Controlled Oscillator
>>
>>Noob question, what is NCO in terms of implementation?
>>We source the signal from an arbitrary pin and FW / driver does
>>the control? Or we always use system refclk and then tune?
>>
>
>Documentation of chip we are using, stated NCO as similar to FREERUN, and it

So how exactly this is different to freerun? Does user care or he would
be fine with "freerun" in this case? My point is, isn't "NCO" some
device specific thing that should be abstracted out here?


>runs on a SYSTEM CLOCK provided to the chip (plus some stabilization and
>dividers before it reaches the output).
>It doesn't count as an source pin, it uses signal form dedicated wire for
>SYSTEM CLOCK.
>In this case control over output frequency is done by synchronizer chip
>firmware, but still it will not lock to any source pin signal.
>
>>> >+    render-max: true
>>> >+  -
>>> >+    type: enum
>>> >+    name: lock-status
>>> >+    doc: |
>>> >+      provides information of dpll device lock status, valid values for
>>> >+      DPLL_A_LOCK_STATUS attribute
>>> >+    entries:
>>> >+      -
>>> >+        name: unspec
>>> >+        doc: unspecified value
>>> >+      -
>>> >+        name: unlocked
>>> >+        doc: |
>>> >+          dpll was not yet locked to any valid source (or is in one of
>>> >+          modes: DPLL_MODE_FREERUN, DPLL_MODE_NCO)
>>> >+      -
>>> >+        name: calibrating
>>> >+        doc: dpll is trying to lock to a valid signal
>>> >+      -
>>> >+        name: locked
>>> >+        doc: dpll is locked
>>> >+      -
>>> >+        name: holdover
>>> >+        doc: |
>>> >+          dpll is in holdover state - lost a valid lock or was forced by
>>> >+          selecting DPLL_MODE_HOLDOVER mode
>>>
>>> Is it needed to mention the holdover mode. It's slightly confusing,
>>> because user might understand that the lock-status is always "holdover"
>>> in case of "holdover" mode. But it could be "unlocked", can't it?
>>> Perhaps I don't understand the flows there correctly :/
>>
>>Hm, if we want to make sure that holdover mode must result in holdover
>>state then we need some extra atomicity requirements on the SET
>>operation. To me it seems logical enough that after setting holdover
>>mode we'll end up either in holdover or unlocked status, depending on
>>lock status when request reached the HW.
>>
>
>Improved the docs:
>        name: holdover
>        doc: |
>          dpll is in holdover state - lost a valid lock or was forced
>          by selecting DPLL_MODE_HOLDOVER mode (latter possible only
>          when dpll lock-state was already DPLL_LOCK_STATUS_LOCKED,
>	  if it was not, the dpll's lock-status will remain

"if it was not" does not really cope with the sentence above that. Could
you iron-out the phrasing a bit please?


>          DPLL_LOCK_STATUS_UNLOCKED even if user requests
>          DPLL_MODE_HOLDOVER)
>Is that better?
>
>What extra atomicity you have on your mind?
>Do you suggest to validate and allow (in dpll_netlink.c) only for 'unlocked'
>or 'holdover' states of dpll, once DPLL_MODE_HOLDOVER was successfully
>requested by the user?
>
>>> >+    render-max: true
>>> >+  -
>>> >+    type: const
>>> >+    name: temp-divider
>>> >+    value: 10
>>> >+    doc: |
>>> >+      temperature divider allowing userspace to calculate the
>>> >+      temperature as float with single digit precision.
>>> >+      Value of (DPLL_A_TEMP / DPLL_TEMP_DIVIDER) is integer part of
>>> >+      tempearture value.
>>>
>>> s/tempearture/temperature/
>>>
>>> Didn't checkpatch warn you?
>>
>>Also can we give it a more healthy engineering margin?
>>DPLL_A_TEMP is u32, silicon melts at around 1400C,
>>so we really can afford to make the divisor 1000.
>>
>
>Sure, fixed.
>
>>> >+    name: device
>>> >+    subset-of: dpll
>>> >+    attributes:
>>> >+      -
>>> >+        name: id
>>> >+        type: u32
>>> >+        value: 2
>>> >+      -
>>> >+        name: dev-name
>>> >+        type: string
>>> >+      -
>>> >+        name: bus-name
>>> >+        type: string
>>> >+      -
>>> >+        name: mode
>>> >+        type: u8
>>> >+        enum: mode
>>> >+      -
>>> >+        name: mode-supported
>>> >+        type: u8
>>> >+        enum: mode
>>> >+        multi-attr: true
>>> >+      -
>>> >+        name: lock-status
>>> >+        type: u8
>>> >+        enum: lock-status
>>> >+      -
>>> >+        name: temp
>>> >+        type: s32
>>> >+      -
>>> >+        name: clock-id
>>> >+        type: u64
>>> >+      -
>>> >+        name: type
>>> >+        type: u8
>>> >+        enum: type
>>> >+      -
>>> >+        name: pin-prio
>>> >+        type: u32
>>> >+        value: 19
>>>
>>> Do you still need to pass values for a subset? That is odd. Well, I
>>> think is is odd to pass anything other than names in subset definition,
>>> the rest of the info is in the original attribute set definition,
>>> isn't it?
>>> Jakub?
>>
>>Probably stale code, related bug was fixed in YNL a few months back.
>>Explicit value should no longer be needed.
>
>Yes, checked it works without them, I am removing values for next version.
>
>Thanks!
>Arkadiusz
