Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-vk0-f44.google.com ([209.85.213.44]:36055 "EHLO
        mail-vk0-f44.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752404AbdIFVOz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 6 Sep 2017 17:14:55 -0400
Received: by mail-vk0-f44.google.com with SMTP id v203so12990865vkv.3
        for <linux-clk@vger.kernel.org>; Wed, 06 Sep 2017 14:14:55 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20170906204237.24x6fzlfmq7jmuce@sig21.net>
References: <20170906204237.24x6fzlfmq7jmuce@sig21.net>
From: Carlo Caione <carlo@endlessm.com>
Date: Wed, 6 Sep 2017 23:14:54 +0200
Message-ID: <CAL9uMOGf6vsMfsp4wFX+LNxR_UTiYyWpFWPW7L8nGivLi-0uQg@mail.gmail.com>
Subject: Re: S0ix failure due to "clk: x86: Do not gate clocks enabled by the firmware"
To: Johannes Stezenbach <js@sig21.net>
Cc: linux-clk@vger.kernel.org, linux-pm@vger.kernel.org,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Darren Hart <dvhart@infradead.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Wed, Sep 6, 2017 at 10:42 PM, Johannes Stezenbach <js@sig21.net> wrote:
> Hi,
>
> I'm poking around on Asus E200HA, based on Atom x5-Z8300 (Cherrytrail),
> trying to get S0ix working, atm with gross hacks that are recorded in
> https://bugzilla.kernel.org/show_bug.cgi?id=193891
>
>
> I found commit d31fd43c0f9a4 "clk: x86: Do not gate clocks enabled by the firmware"
> prevents S0i3 entry.  Unfortunately the commit message doesn't explain
> the problem it fixes, nor does it mention the platform.

Just to add on top of Pierre-Louis reply.

The problem it fixes is that one of the PMC clocks enabled by the
firmware is being gated by the clock framework since no driver is
claiming it, causing the platform I'm working on to hang at boot. You
can read the whole discussion about this fix in [0].

Also I will probably send an email tomorrow about this but today
(coincidentally) I discovered that this fix is not working anymore on
my platform. This is due to commit a49d25364df ("staging/atomisp: Add
support for the Intel IPU v2"). I haven't had a chance yet to
investigated why though.

Cheers,

[0] https://www.spinics.net/lists/platform-driver-x86/msg12092.html

-- 
Carlo Caione  |  +39.340.80.30.096  |  Endless
