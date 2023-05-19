Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A31F2C77B7F
	for <linux-clk@archiver.kernel.org>; Fri, 19 May 2023 06:15:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229557AbjESGP7 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 19 May 2023 02:15:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41738 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229436AbjESGP6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 19 May 2023 02:15:58 -0400
Received: from mail-wr1-x436.google.com (mail-wr1-x436.google.com [IPv6:2a00:1450:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B7FC1AC
        for <linux-clk@vger.kernel.org>; Thu, 18 May 2023 23:15:56 -0700 (PDT)
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3078cc99232so2721242f8f.3
        for <linux-clk@vger.kernel.org>; Thu, 18 May 2023 23:15:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1684476955; x=1687068955;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=oU2aaZIcfAL/J7x8hKgNcEmwTba6so0CuVNNIebXyJo=;
        b=VofQDRVT1jdG/lDa+izEbTfQZSQdPXUA+AlBPDKbeiloOfTHZ8kCdyoR7Df0sXAtix
         dUoEu4fRTeosTJ3qUfJDz2v2dkvKwPZcroDBm+D909j9XXnIfm7iBbGhPhuNYeOUh7XK
         pvmm3+eiQe3+Q0eINYgpEnTONkJwumRgzZUPAKMLPK+1ERAPxQBIRqX50WtPNe85Os5P
         JTPQznB+kf6ckenm/uitdJGARkLZ3PM7WpuBjwH+23Wn+RXLXllj1o2B8iYanABsyf83
         EqxshMNzFHtPrdmnX4qTL8+laetM18hIauFvX8qJoQomRfllrIWmGnuDu8XMArTMl9sk
         P4Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684476955; x=1687068955;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oU2aaZIcfAL/J7x8hKgNcEmwTba6so0CuVNNIebXyJo=;
        b=j/68EMdba3iLo7ZCbyLmFx3wlBVgvO3/Va0Pow8DBjyeH70/Kh7W03noBMy4NbYJ6B
         MmLje3MqQaVwvci4UnQuVvrbxpm/vshwdI8vK89tpHE1VMVxfBYAhTnkBBjvlX6MMOb3
         FYONF6R7L5yU+O4zXiBWIwIMX2Q+QPfmdMQfqXeDT4JlEy+TlY41OByKADnoY+XdTl3L
         a/pGd6yrE2EgE+LsAIsRN586gNEydPwupUYOWZ4gNR2Qh5nSWrOMdcTGDEX2rYkQCw0B
         TdiI/8pOVMUnF6Tpz/KpJJbx+NJGw0qhRRXXx9pCvDsYW6JnN6YvOy1LjHXln/dtFh5f
         BV6A==
X-Gm-Message-State: AC+VfDywmFTWndMFrSkfDs01zayWe5IQ3+nDV9KCEw/4fMrXyshT5zaY
        ZcO0IyckhS89kN6sPLFtVqkkLg==
X-Google-Smtp-Source: ACHHUZ5CXRNO+/Y9dUrlLh8l0PKouHwzklNi4pxgozOUKSXhvSQfzpurqtkaDV1PH5HIwXBp/bfUNw==
X-Received: by 2002:adf:e912:0:b0:309:3bb5:7968 with SMTP id f18-20020adfe912000000b003093bb57968mr1185087wrm.16.1684476954774;
        Thu, 18 May 2023 23:15:54 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id l16-20020a5d4bd0000000b0030642f5da27sm4224263wrt.37.2023.05.18.23.15.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 May 2023 23:15:54 -0700 (PDT)
Date:   Fri, 19 May 2023 08:15:53 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     "Kubalewski, Arkadiusz" <arkadiusz.kubalewski@intel.com>
Cc:     Vadim Fedorenko <vadfed@meta.com>,
        Jakub Kicinski <kuba@kernel.org>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        "Olech, Milena" <milena.olech@intel.com>,
        "Michalik, Michal" <michal.michalik@intel.com>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>, poros <poros@redhat.com>,
        mschmidt <mschmidt@redhat.com>,
        "netdev@vger.kernel.org" <netdev@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
Subject: Re: [RFC PATCH v7 5/8] ice: implement dpll interface to control cgu
Message-ID: <ZGcUGdSPSJJsO8Kl@nanopsycho>
References: <20230428002009.2948020-1-vadfed@meta.com>
 <20230428002009.2948020-6-vadfed@meta.com>
 <ZGJn/tKjzxNYcNKU@nanopsycho>
 <DM6PR11MB46570013B31FCCF1FCE0854D9B799@DM6PR11MB4657.namprd11.prod.outlook.com>
 <ZGNtH1W3Y/pnx2Hk@nanopsycho>
 <DM6PR11MB465765FA0C789D6D49B32C159B7F9@DM6PR11MB4657.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR11MB465765FA0C789D6D49B32C159B7F9@DM6PR11MB4657.namprd11.prod.outlook.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Thu, May 18, 2023 at 06:07:33PM CEST, arkadiusz.kubalewski@intel.com wrote:
>>From: Jiri Pirko <jiri@resnulli.us>
>>Sent: Tuesday, May 16, 2023 1:47 PM
>>
>>Tue, May 16, 2023 at 11:22:37AM CEST, arkadiusz.kubalewski@intel.com wrote:
>>>>From: Jiri Pirko <jiri@resnulli.us>
>>>>Sent: Monday, May 15, 2023 7:13 PM
>>>>
>>>>Fri, Apr 28, 2023 at 02:20:06AM CEST, vadfed@meta.com wrote:
>>>>
>>>>[...]
>>>>
>>>>>+static const enum dpll_lock_status
>>>>>+ice_dpll_status[__DPLL_LOCK_STATUS_MAX] = {
>>>>>+	[ICE_CGU_STATE_INVALID] = DPLL_LOCK_STATUS_UNSPEC,
>>>>>+	[ICE_CGU_STATE_FREERUN] = DPLL_LOCK_STATUS_UNLOCKED,
>>>>>+	[ICE_CGU_STATE_LOCKED] = DPLL_LOCK_STATUS_CALIBRATING,
>>>>
>>>>This is a bit confusing to me. You are locked, yet you report
>>>>calibrating? Wouldn't it be better to have:
>>>>DPLL_LOCK_STATUS_LOCKED
>>>>DPLL_LOCK_STATUS_LOCKED_HO_ACQ
>>>>
>>>>?
>>>>
>>>
>>>Sure makes sense, will add this state.
>>
>>Do you need "calibrating" then? I mean, the docs says:
>>  ``LOCK_STATUS_CALIBRATING``   dpll device calibrates to lock to the
>>                                source pin signal
>>
>>Yet you do: [ICE_CGU_STATE_LOCKED] = DPLL_LOCK_STATUS_CALIBRATING
>>Seems like you should have:
>>[ICE_CGU_STATE_LOCKED] = DPLL_LOCK_STATUS_LOCKED
>>[ICE_CGU_STATE_LOCKED_HO_ACQ] = DPLL_LOCK_STATUS_LOCKED_HO_ACQ,
>>
>>and remove DPLL_LOCK_STATUS_CALIBRATING as it would be unused?
>>
>>Also, as a sidenote, could you use the whole names of enum value names
>>in documentation? Simple reason, greppability.
>>
>
>Yes, removed CALIBRATING.
>Fixed the docs.

Cool, thanks!


>
>Thank you!
>Arkadiusz
>
>>Thanks!
>>
>>
>>>
>>>>
>>>>>+	[ICE_CGU_STATE_LOCKED_HO_ACQ] = DPLL_LOCK_STATUS_LOCKED,
>>>>>+	[ICE_CGU_STATE_HOLDOVER] = DPLL_LOCK_STATUS_HOLDOVER,
>>>>>+};
>>>>
>>>>[...]
