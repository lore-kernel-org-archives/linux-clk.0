Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9954AC4332F
	for <linux-clk@archiver.kernel.org>; Thu, 13 Oct 2022 06:56:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229721AbiJMG41 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Oct 2022 02:56:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37306 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229746AbiJMG40 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Oct 2022 02:56:26 -0400
Received: from mail-ed1-x52e.google.com (mail-ed1-x52e.google.com [IPv6:2a00:1450:4864:20::52e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EAEC41162F6
        for <linux-clk@vger.kernel.org>; Wed, 12 Oct 2022 23:56:23 -0700 (PDT)
Received: by mail-ed1-x52e.google.com with SMTP id u21so1286577edi.9
        for <linux-clk@vger.kernel.org>; Wed, 12 Oct 2022 23:56:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=hTQYscxea5kpG4IJ5jBXCinWCVMiCrKi+HoK6IiLIuE=;
        b=lyTp+EXHucXB3gaWPjRGYXQMejZgFKzdyuXcwUHwK/NMFQkvEIz2T+8sR8gQxuRPOc
         pCcbhL+BK56Sv8Z/mrBdBG/jjzxHl6k2Tn4GKGItpIccU1nQwLk68dTQ88eqUIRfC4M5
         sjk7kUMFUXpmoL8DD6VVWPPaXhHN0Ou3WfghHmfYowrypXhWs5nvAFvZtRcHSaMk7OMt
         IgbgI/LpU7PHxryNxPK7mCYYW3JUT0HA/iRl8n5Vfu2A9fleTXXYD1lj5geUvdpVxYXz
         jGtI8VOO+AwICr7D7sCm3qDrxVt5nmOYhbKYLjodACCc5SCGDiQTAqTlF4N+tA5LZKkV
         qAdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hTQYscxea5kpG4IJ5jBXCinWCVMiCrKi+HoK6IiLIuE=;
        b=OQrj5p/CCOOwsgU8XjqhNln8T03AX1l2wKOFe9A5oLDV7fdh9SvQh+cQ96EB/uZ+sR
         4wvU5FlcTc2o5hDgwemIdO3gUhieXQuoo3CY65kOWKQA14wbaD+2vwmSugFjBWYOPwMN
         n0c/px2FJD8pctBsNWxLZtfQCRiR4AawjWIWlOuSKR3kmKON0fT3XSV5de2454LXjAtL
         XkChKEZRiOSfYvwZg00LhweSRG7naVN0jGETFlcljyrmXJzXr725nTccx2J+x7OOr2Yw
         E4twWh1+58iCx9f1fCQBPL7XrmF1uCs2FAMcaihHl5KgVtLy6h0szyWwlLcFfFsYOx8a
         1/VA==
X-Gm-Message-State: ACrzQf1mLnfUOK9qQ76BdizBFbCmYqWaOv0qZcELXVtVr8+HppQo28TO
        zrlt7FCRKs33ZwtkuvAAi4h9KA==
X-Google-Smtp-Source: AMsMyM4WS/KUJ98zs7jglOqWm2qitHwvXXYr6c0kUOoIpkYdD262tltvqeI0sJmiYyPjtYLM/dWnvw==
X-Received: by 2002:a05:6402:1e8e:b0:45c:af84:63dd with SMTP id f14-20020a0564021e8e00b0045caf8463ddmr6086445edf.190.1665644181835;
        Wed, 12 Oct 2022 23:56:21 -0700 (PDT)
Received: from localhost ([86.61.181.4])
        by smtp.gmail.com with ESMTPSA id gc35-20020a1709072b2300b0073dc5bb7c32sm2436288ejc.64.2022.10.12.23.56.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Oct 2022 23:56:21 -0700 (PDT)
Date:   Thu, 13 Oct 2022 08:56:20 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Vadim Fedorenko <vfedorenko@novek.ru>
Cc:     Jakub Kicinski <kuba@kernel.org>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-clk@vger.kernel.org, Vadim Fedorenko <vadfed@fb.com>
Subject: Re: [RFC PATCH v3 1/6] dpll: Add DPLL framework base functions
Message-ID: <Y0e2lFnpVuC0HisN@nanopsycho>
References: <20221010011804.23716-1-vfedorenko@novek.ru>
 <20221010011804.23716-2-vfedorenko@novek.ru>
 <Y0abOsYjGapUTJHv@nanopsycho>
 <e076fa5c-93ec-9bdb-f490-46503d96a10f@novek.ru>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e076fa5c-93ec-9bdb-f490-46503d96a10f@novek.ru>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Wed, Oct 12, 2022 at 10:15:23PM CEST, vfedorenko@novek.ru wrote:
>On 12.10.2022 11:47, Jiri Pirko wrote:
>> Mon, Oct 10, 2022 at 03:17:59AM CEST, vfedorenko@novek.ru wrote:
>> > From: Vadim Fedorenko <vadfed@fb.com>
>> > 
>> > DPLL framework is used to represent and configure DPLL devices
>> > in systems. Each device that has DPLL and can configure sources
>> > and outputs can use this framework.
>> > 
>> > Signed-off-by: Vadim Fedorenko <vadfed@fb.com>
>> > Co-developed-by: Jakub Kicinski <kuba@kernel.org>
>> > Co-developed-by: Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>
>> 
>> 
>> [...]
>> 
>> 
>> > +struct dpll_device *dpll_device_alloc(struct dpll_device_ops *ops, const char *name,
>> > +				      int sources_count, int outputs_count, void *priv)
>> 
>> Having constant array of "pins" would not work for SyncE. For example in
>> mlxsw driver, netdevs can appear and disappear within the device
>> lifetime (for example port splits, linecard provision). We need to
>> register/unregister pins dynamically.
>> 
>Yes, I agree, and we are working to implement pin object with dynamic
>attach/detach or reg/unreg functions.

Awesome. Looking forward to the next patchset version!
