Return-Path: <sean.wang@mediatek.com>
Message-ID: <1514345580.30687.27.camel@mtkswgap22>
Subject: Re: [PATCH] clk: mediatek: remove unnecessary include header from
 reset.c
From: Sean Wang <sean.wang@mediatek.com>
To: Stephen Boyd <sboyd@codeaurora.org>
CC: <mturquette@baylibre.com>, <matthias.bgg@gmail.com>, <jdelvare@suse.de>,
	<jamesjj.liao@mediatek.com>, <weiyi.lu@mediatek.com>, <arnd@arndb.de>,
	<linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Date: Wed, 27 Dec 2017 11:33:00 +0800
In-Reply-To: <20171227011021.GQ7997@codeaurora.org>
References: <b5937ad5c068eeec19005d40dbddb97e09c1b3d0.1514190227.git.sean.wang@mediatek.com>
	 <20171227011021.GQ7997@codeaurora.org>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Return-Path: sean.wang@mediatek.com
List-ID: <linux-clk.vger.kernel.org>

On Tue, 2017-12-26 at 17:10 -0800, Stephen Boyd wrote:
> On 12/25, sean.wang@mediatek.com wrote:
> > From: Sean Wang <sean.wang@mediatek.com>
> > 
> > In fact, the clk-mtk.h header is indeed not needed for reset.c and thus
> > it's safe and good change to remove it from the file.
> > 
> > Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> > Reviewed-by: Jean Delvare <jdelvare@suse.de>
> > Cc: Jean Delvare <jdelvare@suse.de>
> > ---
> >  drivers/clk/mediatek/reset.c | 2 --
> >  1 file changed, 2 deletions(-)
> > 
> > diff --git a/drivers/clk/mediatek/reset.c b/drivers/clk/mediatek/reset.c
> > index d3551d5..70ebb2e 100644
> > --- a/drivers/clk/mediatek/reset.c
> > +++ b/drivers/clk/mediatek/reset.c
> > @@ -19,8 +19,6 @@
> >  #include <linux/reset-controller.h>
> >  #include <linux/slab.h>
> >  
> > -#include "clk-mtk.h"
> > -
> 
> drivers/clk/mediatek/reset.c:64:6: warning: symbol 'mtk_register_reset_controller' was not declared. Should it be static?
> 

It cannot be static since the function would be referenced in other
files under the same folder


One point I felt confused which is I didn't see the warning complains
when I did these build test, even I also added -Werror and -Wall to
build all files under driver/clk/mediatek. My toolchain is based on gcc
version 5.2.0 (GCC).


If the warning still is, the include "clk-mtk.h" should be good to stay
there because the declaration it needs is in the clk-mtk.h
