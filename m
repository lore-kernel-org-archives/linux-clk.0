Return-Path: <mazziesaccount@gmail.com>
Return-Path: <mazziesaccount@gmail.com>
Date: Fri, 31 Aug 2018 13:21:23 +0300
From: Matti Vaittinen <matti.vaittinen@fi.rohmeurope.com>
To: kbuild test robot <lkp@intel.com>
Cc: kbuild-all@01.org, corbet@lwn.net, mturquette@baylibre.com,
	sboyd@kernel.org, linux@armlinux.org.uk, andrew.smirnov@gmail.com,
	robh@kernel.org, sre@kernel.org, linux@roeck-us.net,
	sjhuang@iluvatar.ai, mazziesaccount@gmail.com,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	heikki.haikola@fi.rohmeurope.com, mikko.mutanen@fi.rohmeurope.com
Subject: Re: [PATCH 2/2] clk: bd718x7: Initial support for ROHM
 bd71837/bd71847 PMIC clock
Message-ID: <20180831102123.GA2472@localhost.localdomain>
References: <0e6f19f99a4321d37472635c9210f6c13ac53147.1535630942.git.matti.vaittinen@fi.rohmeurope.com>
 <201808310820.GfPfChXp%fengguang.wu@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <201808310820.GfPfChXp%fengguang.wu@intel.com>
List-ID: <linux-clk.vger.kernel.org>

Hello All,

Just wanted to point out for the reviewers that this patch depends on
not yet accepted MFD/regulator patch. (struct/defines in
include/linux/mfd/rohm-bd718x7.h were changed)
https://lore.kernel.org/lkml/cover.1535545377.git.matti.vaittinen@fi.rohmeurope.com/

On Fri, Aug 31, 2018 at 09:18:19AM +0800, kbuild test robot wrote:
> Hi Matti,
> 
> Thank you for the patch! Yet something to improve:
> 
> [auto build test ERROR on clk/clk-next]
> [also build test ERROR on v4.19-rc1 next-20180830]
> [if your patch is applied to the wrong git tree, please drop us a note to help improve the system]

Thus this error was expected. What is the generally best way to work
when there is changes to more than one subsystem? With this approach
the patch set here won't compile until MFD part gets applied. But if
I use old definitions/structs here, then clk tree gets broken when
MFD/regulator part changes defines. I see only bad and worse options =)
Anyways, I guess sending this patch with new defines (and applying it
only after MFD) is still better than applying this with old defines and
breaking it when MFD changes. (Assuming all of the patches get applied
at some point).

Br,
	Matti Vaittinen
> 
