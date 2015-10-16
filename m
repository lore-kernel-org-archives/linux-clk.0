Return-Path: <sboyd@codeaurora.org>
Date: Fri, 16 Oct 2015 12:09:36 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org,
	Luis de Bethencourt <luisbg@osg.samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Scott Branden <sbranden@broadcom.com>, Ray Jui <rjui@broadcom.com>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: Allow drivers to build if COMPILE_TEST is enabled
Message-ID: <20151016190936.GH23912@codeaurora.org>
References: <1444745898-11537-1-git-send-email-javier@osg.samsung.com>
 <20151014183831.GH26883@codeaurora.org>
 <561EA831.2070001@osg.samsung.com>
 <561EAF6F.6080901@osg.samsung.com>
 <20151014211351.GC4558@codeaurora.org>
 <5620EB13.7080201@osg.samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <5620EB13.7080201@osg.samsung.com>
List-ID: <linux-clk.vger.kernel.org>

On 10/16, Javier Martinez Canillas wrote:
> I built on all those archs and neither allyesconfig nor allmodconfig
> gives me build error or warnings for the partial build M=drivers/clk
> 
> I only had an issue with h8300 since the arch has hardcoded stuff
> in its Makefile like the toolchain file name, I posted a patch [0]
> to fix that but then got a linker issue. This not related to $SUBJECT
> though but to the h8300 arch Makefile.

Ok, sounds good. Applied to clk-next.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
