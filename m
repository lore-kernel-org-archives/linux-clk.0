Return-Path: <linux-pm-owner@vger.kernel.org>
Date: Wed, 6 Sep 2017 22:42:37 +0200
From: Johannes Stezenbach <js@sig21.net>
To: linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
Cc: Carlo Caione <carlo@endlessm.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Pierre-Louis Bossart <pierre-louis.bossart@linux.intel.com>,
        Darren Hart <dvhart@infradead.org>,
        Enric Balletbo i Serra <enric.balletbo@collabora.com>
Subject: S0ix failure due to "clk: x86: Do not gate clocks enabled by the
 firmware"
Message-ID: <20170906204237.24x6fzlfmq7jmuce@sig21.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Sender: linux-pm-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Hi,

I'm poking around on Asus E200HA, based on Atom x5-Z8300 (Cherrytrail),
trying to get S0ix working, atm with gross hacks that are recorded in
https://bugzilla.kernel.org/show_bug.cgi?id=193891


I found commit d31fd43c0f9a4 "clk: x86: Do not gate clocks enabled by the firmware"
prevents S0i3 entry.  Unfortunately the commit message doesn't explain
the problem it fixes, nor does it mention the platform.

How can we fix d31fd43c0f9a4 to not break S0i3?


Johannes
