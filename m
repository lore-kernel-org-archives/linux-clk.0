Return-Path: <jdelvare@suse.de>
Date: Wed, 27 Dec 2017 13:15:50 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Sean Wang <sean.wang@mediatek.com>
Cc: Stephen Boyd <sboyd@codeaurora.org>, <mturquette@baylibre.com>,
 <matthias.bgg@gmail.com>, <jamesjj.liao@mediatek.com>,
 <weiyi.lu@mediatek.com>, <arnd@arndb.de>,
 <linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] clk: mediatek: remove unnecessary include header from
 reset.c
Message-ID: <20171227131550.2c65c6ff@endymion>
In-Reply-To: <1514345580.30687.27.camel@mtkswgap22>
References: <b5937ad5c068eeec19005d40dbddb97e09c1b3d0.1514190227.git.sean.wang@mediatek.com>
	<20171227011021.GQ7997@codeaurora.org>
	<1514345580.30687.27.camel@mtkswgap22>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
List-ID: <linux-clk.vger.kernel.org>

Hi Sean, Stephen,

On Wed, 27 Dec 2017 11:33:00 +0800, Sean Wang wrote:
> On Tue, 2017-12-26 at 17:10 -0800, Stephen Boyd wrote:
> > drivers/clk/mediatek/reset.c:64:6: warning: symbol 'mtk_register_reset_controller' was not declared. Should it be static?
> 
> It cannot be static since the function would be referenced in other
> files under the same folder
> 
> 
> One point I felt confused which is I didn't see the warning complains
> when I did these build test, even I also added -Werror and -Wall to
> build all files under driver/clk/mediatek. My toolchain is based on gcc
> version 5.2.0 (GCC).

I tested and I get the warning here (gcc 4.8.5 on SUSE) but only after
setting CONFIG_RESET_CONTROLLER=y. Without it,
drivers/clk/mediatek/reset.o is never built, so no warning can be
generated.

> If the warning still is, the include "clk-mtk.h" should be good to stay
> there because the declaration it needs is in the clk-mtk.h

Agreed.

-- 
Jean Delvare
SUSE L3 Support
