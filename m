Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CBE1C77B75
	for <linux-clk@archiver.kernel.org>; Fri, 12 May 2023 10:31:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240395AbjELKbI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 May 2023 06:31:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239935AbjELKbG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 May 2023 06:31:06 -0400
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com [IPv6:2a00:1450:4864:20::331])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E6C5A35A2
        for <linux-clk@vger.kernel.org>; Fri, 12 May 2023 03:31:02 -0700 (PDT)
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-3f315712406so316328125e9.0
        for <linux-clk@vger.kernel.org>; Fri, 12 May 2023 03:31:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683887461; x=1686479461;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=yVyd3nrAFCEpG6TOtlbRSc+LQxBB0GhvmjWrl9ISpYU=;
        b=v9GCAW88fTPUPCBKonqAIPqDLUbrqAkeqqo489ynO828vcyEIC8G28SCuzGuofwAXt
         VRnUZmMsz8zVE+snWk7DUGWZaSDiuo2sNfzAI0RFuRiCs/yicv+KSnf4iER0Go/kvPqS
         55sgNJ7JB2meHoZTBrfdSkBTUo97X4UDuQ8+A2+87R8ZJKAsjcLgtbxZHC61A3et50t9
         199qzTzykhu7BvtJ+9rgER+DEyOj/Ig0bT3Ke/fNJcscrWmdtCRE/etdMyu7EBsG4NYp
         vtxRC5hRT6/N8LOirBqS+eW6t7o+BuUA3v/YVg4b8O0h4sjbRu1idCb9cx85HA/qYjcQ
         a8Vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683887461; x=1686479461;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yVyd3nrAFCEpG6TOtlbRSc+LQxBB0GhvmjWrl9ISpYU=;
        b=F9l9gjRTeltKJcvsC/tH1vykdFIOcXerBX+z5gqwBLNF7So7wDpMs169GAB9o5K0N5
         rtAQbuDzrnOn6jEEbWcVLTmgbwfTn6wJHErx7M+ohYYv2cihvbqyoTasmDUwgZCNv2+g
         8pfTRPRmypNgoNzp6ktfIsmZT7+5eLNIx7Op1AHj3s/hjUP4i/XeJXVNl9D0CTjoIQQ+
         Y4ED5TF3EmThDrxzf0/bTHEOMD2/yxEZwv/kzmAv/Oz4gF7IYdoYb/Ai/UBAJFh+aOZ4
         NqJhm0AEBTGcni41UrIIpY/Dfr9Nj7vIVTLxyJ8ldsbZfJu+ca48vffjvy5byAZg/WLo
         r/7w==
X-Gm-Message-State: AC+VfDwfriKTZc45XfZKxfAPbozfosnz0gvCU9+TlJ1R+6gXSYecLFZk
        RGUWCcGhbil0Vd+1XxbEh9Cltw==
X-Google-Smtp-Source: ACHHUZ7FeZJG9jqcVQqpGOX7/7Z98vyZ9jB9cw9ljYRTYKlHyvOfXeTOZPQTqbXNYleD5deGp1b8RQ==
X-Received: by 2002:adf:ce8c:0:b0:306:2713:f7f with SMTP id r12-20020adfce8c000000b0030627130f7fmr19792716wrn.11.1683887461254;
        Fri, 12 May 2023 03:31:01 -0700 (PDT)
Received: from linaro.org ([86.121.163.20])
        by smtp.gmail.com with ESMTPSA id n3-20020a5d4843000000b003047d5b8817sm22905770wrs.80.2023.05.12.03.30.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 May 2023 03:31:00 -0700 (PDT)
Date:   Fri, 12 May 2023 13:30:59 +0300
From:   Abel Vesa <abel.vesa@linaro.org>
To:     Saravana Kannan <saravanak@google.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mike Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        linux-arm-msm@vger.kernel.org, mka@chromium.org
Subject: Re: [PATCH v3 1/2] clk: Add generic sync_state callback for
 disabling unused clocks
Message-ID: <ZF4VY2ngPtg9Xytc@linaro.org>
References: <20221227204528.1899863-1-abel.vesa@linaro.org>
 <ebc257025ebd641e624ef506ea09c800.sboyd@kernel.org>
 <Y/OV3CF0ootyooDJ@linaro.org>
 <Y/OfjbxI1tHYJHNv@linaro.org>
 <CAGETcx_mD3pbAmT5FDZaVAsKb_2PAnrHL8B_6gSR=+a0O4kHfQ@mail.gmail.com>
 <Y/PALlrQpwPlum9M@linaro.org>
 <CAGETcx_TZN3=GKrEf5fy_tA=JnOfw7m-N=+hD=qhe_yRRpngPw@mail.gmail.com>
 <ZFzmaavGYy4isU7J@linaro.org>
 <CAGETcx8_maXSCmQcU_UE499pwJRLY4E7yydWsxbU91==vgCoFw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAGETcx8_maXSCmQcU_UE499pwJRLY4E7yydWsxbU91==vgCoFw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 23-05-11 17:46:16, Saravana Kannan wrote:
> On Thu, May 11, 2023 at 5:58 AM Abel Vesa <abel.vesa@linaro.org> wrote:
> >
> > On 23-02-21 11:58:24, Saravana Kannan wrote:
> > > On Mon, Feb 20, 2023 at 10:47 AM Abel Vesa <abel.vesa@linaro.org> wrote:
> > > >
> > > > On 23-02-20 09:51:55, Saravana Kannan wrote:
> > > > > On Mon, Feb 20, 2023 at 8:28 AM Abel Vesa <abel.vesa@linaro.org> wrote:
> > > > > >
> > > > > > On 23-02-20 17:46:36, Abel Vesa wrote:
> > > > > > > On 23-02-17 21:38:22, Stephen Boyd wrote:
> > > > > > > > Quoting Abel Vesa (2022-12-27 12:45:27)
> > > > > > > > > There are unused clocks that need to remain untouched by clk_disable_unused,
> > > > > > > > > and most likely could be disabled later on sync_state. So provide a generic
> > > > > > > > > sync_state callback for the clock providers that register such clocks.
> > > > > > > > > Then, use the same mechanism as clk_disable_unused from that generic
> > > > > > > > > callback, but pass the device to make sure only the clocks belonging to
> > > > > > > > > the current clock provider get disabled, if unused. Also, during the
> > > > > > > > > default clk_disable_unused, if the driver that registered the clock has
> > > > > > > > > the generic clk_sync_state_disable_unused callback set for sync_state,
> > > > > > > > > skip disabling its clocks.
> > > > >
> > > > > Hi Abel,
> > > > >
> > > > > We have the day off today, so I'll respond more later. Also, please cc
> > > > > me on all sync_state() related patches in the future.
> > > > >
> > > >
> > > > Sure thing.
> > > >
> > > > > I haven't taken a close look at your series yet, but at a glance it
> > > > > seems incomplete.
> > > > >
> > > > > Any reason you didn't just try to revive my series[1] or nudge me?
> > > > > [1]- https://lore.kernel.org/lkml/20210407034456.516204-3-saravanak@google.com/
> > > >
> > > > This patchset is heavily reworked and much more simpler as it relies
> > > > strictly on the sync_state being registered by the clock provider.
> > >
> > > It's simpler because it's not complete. It for sure doesn't handle
> > > orphan-reparenting. It also doesn't make a lot of sense for only some
> > > clock providers registering for sync_state(). If CC-A is feeding a
> > > clock signal that's used as a root for clocks in CC-B, then what
> > > happens if only CC-B implements sync_state() but CC-A doesn't. The
> > > clocks from CC-B are still going to turn off when CC-A turns off its
> > > PLL before CC-B registers.
> >
> > I gave your patchset a try and it breaks the uart for qcom platforms.
> > That is because your patchset enables the clock on __clk_core_init and
> > does not take into account the fact that 'boot enabled' clocks should be
> > left untouched.
> 
> Those are probably just hacks when we didn't have sync_state(). But
> sure, we can make sure existing drivers aren't broken if the flag is
> set.

I probably didn't make myself clear enough here. ANY clock that is
enabled (HW-wise) before the kernel boots should remain AS IS, that is, no writing
the enable bit, no reparenting, and so on. This rule applies to the clock itself
and for all of its parents. This is because, for some clocks, writing the
enable bit might lead to glitches. UART is just one example. So, please, do not
try enabling such clocks until the consumer driver does so.

> 
> > This also means the orphan-reparenting enabling should
> > be dropped as well.
> 
> No, maybe for boot enabled clocks, but not for all clocks in general.
> You need this for sync_state() to work correctly for clocks left on at
> boot but "boot enabled" isn't set.

I think you lost me here. What do you mean by 'this'? If you mean the
enabling of orphan clocks, then the rule above still applies. It
doesn't matter if the clock is an orphan one or not. It can be orphan
from linux point of view, but the actual parent (even if it is not
registered with the linux clock tree) might still be enabled. This means
the clock itself will be also enabled. And by enabling them when
registering, we can have glitches. Therefore, please, do not do this
either.

The registering of a boot enabled clock should not change/override/touch
the current state of it in any way!

Stephen, can you confirm this as well?

> 
> > As for the second part, related to providers that might not have a
> > registered sync_state(), your patchset sets the clock core generic
> > one. This is also wrong because it doesn't take into account the fact
> > that there might be providers that need to do their own stuff on
> > sync_state() and should do that by registering their own implementation
> > of it.
> 
> Right, in which case, they can set theirs or they get the default one.

I'm still not sure that defaulting to the clk_sync_state callback is a
good choice here. I have to think some more about what the impact is for
providers that do not have any sync_state callback registered currently.

> 
> > Therefore, I'll respin your patchset and use only the skipping of
> > disabling the unused clocks, but I'll drop all the enable on init and orphan
> > reparenting changes.
> 
> I think it'll result in a broken patch.

Yep, tried that and it doesn't work. What happened was that, because you
were enabling the 'boot enabled' clocks when registering them (on __clk_core_init),
the disabling from the sync state needs to be without dropping the enable/prepare
counts. This is why I think my patchset here is the best alternative he have
currently, as it does exactly what it is supposed to do, namingly, to leave
untouched the boot enabled clocks until sync state and then disabling
them with via clk_disable_unused_subtree which calls the disable and
unprepare ops without decrementing the prepare and enable counts.

> 
> Sorry, I've been a bit busy with some other work and I haven't been
> able to get to the clk_sync_state(). I'll try to rebase it soon and
> send it out too.

Well, I already did that and I described above why that won't help.

> 
> -Saravana
