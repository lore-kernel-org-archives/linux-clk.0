Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([212.227.17.10]:61618 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750919AbbKYV0h (ORCPT
	<rfc822;linux-clk@vger.kernel.org>); Wed, 25 Nov 2015 16:26:37 -0500
From: Arnd Bergmann <arnd@arndb.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Stephen Boyd <sboyd@codeaurora.org>,
	Eric Miao <eric.y.miao@gmail.com>,
	Michael Turquette <mturquette@baylibre.com>,
	linux-kernel@vger.kernel.org,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Chao Xie <chao.xie@marvell.com>,
	Mike Turquette <mturquette@linaro.org>,
	linux-clk@vger.kernel.org
Subject: Re: [PATCH 1/7] clk: mmp: stop using platform headers
Date: Wed, 25 Nov 2015 22:26:01 +0100
Message-ID: <3508030.Q62gfHvXvx@wuerfel>
In-Reply-To: <20151125192114.GB11298@codeaurora.org>
References: <1448465875-435039-1-git-send-email-arnd@arndb.de> <1448465875-435039-2-git-send-email-arnd@arndb.de> <20151125192114.GB11298@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

On Wednesday 25 November 2015 11:21:14 Stephen Boyd wrote:
> On 11/25, Arnd Bergmann wrote:
> > diff --git a/drivers/clk/mmp/clk-mmp2.c b/drivers/clk/mmp/clk-mmp2.c
> > index 09d2832fbd78..38931dbd1eff 100644
> > --- a/drivers/clk/mmp/clk-mmp2.c
> > +++ b/drivers/clk/mmp/clk-mmp2.c
> > @@ -9,6 +9,7 @@
> >   * warranty of any kind, whether express or implied.
> >   */
> >  
> > +#include <linux/clk.h>
> 
> Why are we adding this include? I don't see any clk consumer API
> usage being added.

Without these #includes, I get a build error:

drivers/clk/mmp/clk-mmp2.c: In function 'mmp2_clk_init':
drivers/clk/mmp/clk-mmp2.c:192:2: error: implicit declaration of function 'clk_set_rate' [-Werror=implicit-function-declaration]
  clk_set_rate(clk, 14745600);
  ^
drivers/clk/mmp/clk-mmp2.c:251:2: error: implicit declaration of function 'clk_set_parent' [-Werror=implicit-function-declaration]
  clk_set_parent(clk, vctcxo);
  ^
drivers/clk/mmp/clk-pxa168.c: In function 'pxa168_clk_init':
drivers/clk/mmp/clk-pxa168.c:161:2: error: implicit declaration of function 'clk_set_rate' [-Werror=implicit-function-declaration]
  clk_set_rate(uart_pll, 14745600);
  ^
drivers/clk/mmp/clk-pxa168.c:204:2: error: implicit declaration of function 'clk_set_parent' [-Werror=implicit-function-declaration]
  clk_set_parent(clk, uart_pll);
  ^
drivers/clk/mmp/clk-pxa910.c: In function 'pxa910_clk_init':
drivers/clk/mmp/clk-pxa910.c:166:2: error: implicit declaration of function 'clk_set_rate' [-Werror=implicit-function-declaration]
  clk_set_rate(uart_pll, 14745600);
  ^
drivers/clk/mmp/clk-pxa910.c:209:2: error: implicit declaration of function 'clk_set_parent' [-Werror=implicit-function-declaration]
  clk_set_parent(clk, uart_pll);
  ^

Is there anything I need to change here?

	Arnd
