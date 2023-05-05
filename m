Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8394BC77B7D
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 10:30:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231393AbjEEKaH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 06:30:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230348AbjEEKaF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 06:30:05 -0400
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com [IPv6:2a00:1450:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E89CD1942E
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 03:30:02 -0700 (PDT)
Received: by mail-ej1-x636.google.com with SMTP id a640c23a62f3a-957dbae98b4so241302366b.1
        for <linux-clk@vger.kernel.org>; Fri, 05 May 2023 03:30:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=resnulli-us.20221208.gappssmtp.com; s=20221208; t=1683282601; x=1685874601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0zEEWPURLzLc29PpkMvuHfunPeqWFI4LDFz37TVYXgU=;
        b=TaYWMqZ64NSjIM+PaA0/SXNmCwqfyHcIofKucfNO5CeMwj4vhFc1K9qdgN3r7dRor9
         or7s134yj186lmBh3mtJkpfPPCK6mRY8xORPV3j0Pd1VPZndsb0TETGxBJ25z4f66AWM
         sVf8sug73c4OrJT+0VmMoM7SrXuvmUGnglH3S4JGnzyi7HmqC5UBPvesDr/Al5G0VYkv
         l1Ulwe6bModaCiZsKkUhCKqHv6CYkZzIy0XIGz2i0sKDdfVnpd3zXIW1fpJIQ/H49PRu
         yuBoaLWT4Qpr1UQarPFYqGeCGSp6GpEiZV87x6ElOFKm0iEQOBmqySX2k+t175ZQtpln
         Q9rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683282601; x=1685874601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0zEEWPURLzLc29PpkMvuHfunPeqWFI4LDFz37TVYXgU=;
        b=LCK0MxV6Gbs3rdxqjtmnTJvtJWr4VBvsU/jSIn739hbIQ2S1j7kxnpfWz/V5F38jKT
         hqbo8moI1d1pgdydUnsAdv7TUkUKZcOvyMzkc8ZQMbz+/PIaKKOynXvlPhG1SBBP6e+e
         25rbWcrFc+jNG5fb4hZhfH+ptdigZVM+WXN7ChH1osuQ4/fkLvRSHHdrAwyg4VRjzyxZ
         BJIXweg8BtmdDB9/DbfxMSpyLyVcbhO49g4ii01+swWCnyGxPfpGH7/Yug8scDSQ3Lcb
         tI3X6GGyeB2a4SESS1QiQz4Btbsc+B9a5Bs78DeYiI9fFe2t28CEhnYF1ywa5NcOz5YT
         m9nQ==
X-Gm-Message-State: AC+VfDx0/tmmPivE8konzqKDDzHv1YBQm49UywEcj6u+XwLfM0Cj/ZsE
        /goGybeUC7M6A2NuZF/xHlIi4g==
X-Google-Smtp-Source: ACHHUZ4rVSFml9uF2WLr4fy3Jcja4p2LW0wH4xEM6OmdQqrd1zxMgn0clzkh5apQnyrsTv6dOorCEQ==
X-Received: by 2002:a17:907:7b92:b0:94e:edf3:dccd with SMTP id ne18-20020a1709077b9200b0094eedf3dccdmr929797ejc.0.1683282601306;
        Fri, 05 May 2023 03:30:01 -0700 (PDT)
Received: from localhost (host-213-179-129-39.customer.m-online.net. [213.179.129.39])
        by smtp.gmail.com with ESMTPSA id hf27-20020a1709072c5b00b00965ddf2e221sm708829ejc.93.2023.05.05.03.30.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 05 May 2023 03:30:00 -0700 (PDT)
Date:   Fri, 5 May 2023 12:29:59 +0200
From:   Jiri Pirko <jiri@resnulli.us>
To:     Jakub Kicinski <kuba@kernel.org>
Cc:     Vadim Fedorenko <vadfed@meta.com>,
        Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>,
        Jonathan Lemon <jonathan.lemon@gmail.com>,
        Paolo Abeni <pabeni@redhat.com>,
        Milena Olech <milena.olech@intel.com>,
        Michal Michalik <michal.michalik@intel.com>,
        linux-arm-kernel@lists.infradead.org, poros@redhat.com,
        mschmidt@redhat.com, netdev@vger.kernel.org,
        linux-clk@vger.kernel.org,
        Vadim Fedorenko <vadim.fedorenko@linux.dev>
Subject: Re: [RFC PATCH v7 1/8] dpll: spec: Add Netlink spec in YAML
Message-ID: <ZFTap8tIHWdbzGwp@nanopsycho>
References: <20230428002009.2948020-1-vadfed@meta.com>
 <20230428002009.2948020-2-vadfed@meta.com>
 <ZFOe1sMFtAOwSXuO@nanopsycho>
 <20230504142451.4828bbb5@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230504142451.4828bbb5@kernel.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Thu, May 04, 2023 at 11:24:51PM CEST, kuba@kernel.org wrote:
>On Thu, 4 May 2023 14:02:30 +0200 Jiri Pirko wrote:

[...]

>
>> >+    name: device
>> >+    subset-of: dpll
>> >+    attributes:
>> >+      -
>> >+        name: id
>> >+        type: u32
>> >+        value: 2
>> >+      -
>> >+        name: dev-name
>> >+        type: string
>> >+      -
>> >+        name: bus-name
>> >+        type: string
>> >+      -
>> >+        name: mode
>> >+        type: u8
>> >+        enum: mode
>> >+      -
>> >+        name: mode-supported
>> >+        type: u8
>> >+        enum: mode
>> >+        multi-attr: true
>> >+      -
>> >+        name: lock-status
>> >+        type: u8
>> >+        enum: lock-status
>> >+      -
>> >+        name: temp
>> >+        type: s32
>> >+      -
>> >+        name: clock-id
>> >+        type: u64
>> >+      -
>> >+        name: type
>> >+        type: u8
>> >+        enum: type
>> >+      -
>> >+        name: pin-prio
>> >+        type: u32
>> >+        value: 19  
>> 
>> Do you still need to pass values for a subset? That is odd. Well, I
>> think is is odd to pass anything other than names in subset definition,
>> the rest of the info is in the original attribute set definition,
>> isn't it?
>> Jakub?
>
>Probably stale code, related bug was fixed in YNL a few months back.
>Explicit value should no longer be needed.

What about the rest, like type, enum, multi-attr etc. Are they needed
for subset? If yes, why?


