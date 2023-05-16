Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8A50C7EE2D
	for <linux-clk@archiver.kernel.org>; Tue, 16 May 2023 11:47:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232135AbjEPLrZ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 May 2023 07:47:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232154AbjEPLrJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 16 May 2023 07:47:09 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E1616582
        for <linux-clk@vger.kernel.org>; Tue, 16 May 2023 04:46:42 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id a640c23a62f3a-965ab8ed1fcso2592531466b.2
        for <linux-clk@vger.kernel.org>; Tue, 16 May 2023 04:46:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1684237601; x=1686829601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=93Yzq0NQPKDWbsmyn4CBhtU/WekigFVvB0zAMgN57XI=;
        b=SUIAwvI++5kAvyMBRhzQ8MviZaRm5/h1Y2uQSZusDH1AIVw9ICmGwylsvUeczZiPZR
         bNaGsvQCvTmWmIyaCN/Rdv08q23K/aF8O1MIle6o8HrqjSsXrAv+rbXKsVDk+CMu2vlA
         tkvSYGP8SY4X+4MZuWafcslj/1QsI4q9Q3qzgkwLH3u+eonbhz5tbQxv2ePF1Ldc28CK
         rK4/j/VsoJrElP+ZbpVWibqAaM50B1PHxWEoVQ+ZtH1FjnAYK0YZDxM7Y1nF+rYb1bbB
         Xr15ZesjVZock5QuYL7A3P5QQfnJwTajoUjJKBEd9Tt8SbIwVb+JnutoK7UjCX1TkBZa
         Nk5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1684237601; x=1686829601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=93Yzq0NQPKDWbsmyn4CBhtU/WekigFVvB0zAMgN57XI=;
        b=Ayzl/vDXOFiVe/SuZJZDQhVsP2QPGvdOyIdyKp5KwkfL1GFKgGVNwATrXQebD8j/W7
         VVNy6AmmPHyqGz4M3UKzOWlNvxBfXvxl7E7MW8WyNPXn6bDAHZFCS2v8g1BWkrJYOXHr
         bG5qAryl0/k+6wyf4xk21C7qMUqeDDpiTvcwSOrmQVQ0V7W43DtHnzUbdKpTpgpwaC+b
         LyfmWppjrlL/4R5D2FMaPOihwylCfCCdiFvqoE1BkGlzjPQSjjlb4wpLoq6BaW7GDFQc
         YgJN5WMoUTnixVePA/MfBq87VLnD5Sc2gjW1Fn6/NwL3yMWycAYhL2yKEjo2v4NCvrgX
         25ng==
X-Gm-Message-State: AC+VfDz/2jUL07hJQDM9FdNAimtiRAbEvG4tfJmh8mOc5wljeq5zdebc
        nmHsw2lRg/zDcCr+EWM3DFGF3g==
X-Google-Smtp-Source: ACHHUZ6Le8AKBQWreteycC6kDR3GS8geixujQ/iDzkE/vuc3eDWlUxCWIkF3haHQxfAKxtuwY4i1qA==
X-Received: by 2002:a17:906:58d5:b0:969:9fd0:7cee with SMTP id e21-20020a17090658d500b009699fd07ceemr26824898ejs.10.1684237601227;
        Tue, 16 May 2023 04:46:41 -0700 (PDT)
Received: from localhost ([86.61.181.4])
        by smtp.gmail.com with ESMTPSA id qh20-20020a170906ecb400b009655eb8be26sm10862429ejb.73.2023.05.16.04.46.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 May 2023 04:46:40 -0700 (PDT)
Date:   Tue, 16 May 2023 13:46:39 +0200
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
Message-ID: <ZGNtH1W3Y/pnx2Hk@nanopsycho>
References: <20230428002009.2948020-1-vadfed@meta.com>
 <20230428002009.2948020-6-vadfed@meta.com>
 <ZGJn/tKjzxNYcNKU@nanopsycho>
 <DM6PR11MB46570013B31FCCF1FCE0854D9B799@DM6PR11MB4657.namprd11.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DM6PR11MB46570013B31FCCF1FCE0854D9B799@DM6PR11MB4657.namprd11.prod.outlook.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Tue, May 16, 2023 at 11:22:37AM CEST, arkadiusz.kubalewski@intel.com wrote:
>>From: Jiri Pirko <jiri@resnulli.us>
>>Sent: Monday, May 15, 2023 7:13 PM
>>
>>Fri, Apr 28, 2023 at 02:20:06AM CEST, vadfed@meta.com wrote:
>>
>>[...]
>>
>>>+static const enum dpll_lock_status
>>>+ice_dpll_status[__DPLL_LOCK_STATUS_MAX] = {
>>>+	[ICE_CGU_STATE_INVALID] = DPLL_LOCK_STATUS_UNSPEC,
>>>+	[ICE_CGU_STATE_FREERUN] = DPLL_LOCK_STATUS_UNLOCKED,
>>>+	[ICE_CGU_STATE_LOCKED] = DPLL_LOCK_STATUS_CALIBRATING,
>>
>>This is a bit confusing to me. You are locked, yet you report
>>calibrating? Wouldn't it be better to have:
>>DPLL_LOCK_STATUS_LOCKED
>>DPLL_LOCK_STATUS_LOCKED_HO_ACQ
>>
>>?
>>
>
>Sure makes sense, will add this state.

Do you need "calibrating" then? I mean, the docs says:
  ``LOCK_STATUS_CALIBRATING``   dpll device calibrates to lock to the
                                source pin signal

Yet you do: [ICE_CGU_STATE_LOCKED] = DPLL_LOCK_STATUS_CALIBRATING
Seems like you should have:
[ICE_CGU_STATE_LOCKED] = DPLL_LOCK_STATUS_LOCKED
[ICE_CGU_STATE_LOCKED_HO_ACQ] = DPLL_LOCK_STATUS_LOCKED_HO_ACQ,

and remove DPLL_LOCK_STATUS_CALIBRATING as it would be unused?

Also, as a sidenote, could you use the whole names of enum value names
in documentation? Simple reason, greppability.

Thanks!


>
>>
>>>+	[ICE_CGU_STATE_LOCKED_HO_ACQ] = DPLL_LOCK_STATUS_LOCKED,
>>>+	[ICE_CGU_STATE_HOLDOVER] = DPLL_LOCK_STATUS_HOLDOVER,
>>>+};
>>
>>[...]
