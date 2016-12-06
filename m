Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mga07.intel.com ([134.134.136.100]:26458 "EHLO mga07.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752109AbcLFACK (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 5 Dec 2016 19:02:10 -0500
To: "alsa-devel@alsa-project.org" <alsa-devel@alsa-project.org>,
        linux-clk@vger.kernel.org
From: Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>
Subject: warnings with clk_disable_unprepare()
Message-ID: <d755ee65-937f-1581-ac74-347b9e4c8d51@linux.intel.com>
Date: Mon, 5 Dec 2016 18:02:08 -0600
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi,
In the modified cht-bsw_rt5645 machine driver for Asus X205TA and 
T100HA, I disable the audio mclk with a call to clk_disable_unprepare() 
when I see a SND_SOC_DAPM_EVENT_OFF event in the platform_clock_control 
hook.

For some reason I seem to get multiple SND_SOC_DAPM_EVENT_OFF events and 
the clock framework complains with dmesg warnings that the refcount is 
already zero (which has no functional side effect).

WARNING: CPU: 0 PID: 2002 at drivers/clk/clk.c:476 clk_unprepare+0x1a/0x21

WARNING: CPU: 2 PID: 2095 at drivers/clk/clk.c:594 
clk_core_disable_lock+0x12/0x1b

I could fix this in three different ways:
- remove multiple SND_SOC_DAPM_EVENT_OFF events (not sure what the root 
cause is, maybe issues with jack detection?)
- call a clk_is_enabled() or clk_refcount() function before calling 
clk_disable_unprepare() (but they don't seem to exist in 
include/linux/clk.h)
- count the references myself (which does exactly the same as what the 
clk framework already does so it's not terribly elegant)

Any suggestions on what the least-bad solution might be?
Thanks
-Pierre
