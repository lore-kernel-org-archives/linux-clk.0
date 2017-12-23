Return-Path: <sean.wang@mediatek.com>
Message-ID: <1514044041.30687.16.camel@mtkswgap22>
Subject: Re: [PATCH] clk: mediatek: Fix all warnings for missing struct
 clk_onecell_data
From: Sean Wang <sean.wang@mediatek.com>
To: Jean Delvare <jdelvare@suse.de>
CC: <sboyd@codeaurora.org>, <mturquette@baylibre.com>,
	<matthias.bgg@gmail.com>, <jamesjj.liao@mediatek.com>,
	<weiyi.lu@mediatek.com>, <arnd@arndb.de>,
	<linux-mediatek@lists.infradead.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <kbuild-all@01.org>
Date: Sat, 23 Dec 2017 23:47:21 +0800
In-Reply-To: <20171223122002.2cb629d1@endymion>
References: <a7e0a625fb6a71b7fab810f1cc8ec196b1732305.1514015506.git.sean.wang@mediatek.com>
	 <20171223122002.2cb629d1@endymion>
Content-Type: text/plain; charset="UTF-8"
MIME-Version: 1.0
Return-Path: sean.wang@mediatek.com
List-ID: <linux-clk.vger.kernel.org>

On Sat, 2017-12-23 at 12:20 +0100, Jean Delvare wrote:
> Hi Sean,
> 
> On Sat, 23 Dec 2017 15:56:36 +0800, sean.wang@mediatek.com wrote:
> > From: Sean Wang <sean.wang@mediatek.com>
> > 
> > In fact, the clk-mtk.h header is unnecessary for reset.c and thus it's
> > safe to remove it from the file to get rid of below build warnings.
> > 
> > All warnings (new ones prefixed by >>):
> > 
> >    In file included from drivers/clk/mediatek/reset.c:22:0:
> > >>drivers/clk/mediatek/clk-mtk.h:44:19: warning: 'struct clk_onecell_data'  
> > declared inside parameter list will not be visible outside of
> > this definition or declaration
> >       int num, struct clk_onecell_data *clk_data);
> >                       ^~~~~~~~~~~~~~~~
> > drivers/clk/mediatek/clk-mtk.h:63:19: warning: 'struct clk_onecell_data'
> > declared inside parameter list will not be visible outside of
> > this definition or declaration
> >       int num, struct clk_onecell_data *clk_data);
> >                       ^~~~~~~~~~~~~~~~
> > drivers/clk/mediatek/clk-mtk.h:145:10: warning: 'struct clk_onecell_data'
> > declared inside parameter list will not be visible outside of
> > this definition or declaration
> >       struct clk_onecell_data *clk_data);
> >              ^~~~~~~~~~~~~~~~
> > drivers/clk/mediatek/clk-mtk.h:164:11: warning: 'struct clk_onecell_data'
> > declared inside parameter list will not be visible outside of
> > this definition or declaration
> >        struct clk_onecell_data *clk_data);
> >               ^~~~~~~~~~~~~~~~
> > drivers/clk/mediatek/clk-mtk.h:190:12: warning: 'struct clk_onecell_data'
> > declared inside parameter list will not be visible outside of this
> > definition or declaration
> >         struct clk_onecell_data *clk_data);
> >                ^~~~~~~~~~~~~~~~
> 
> That's not the proper fix. The actual problem here is in clk-mtk.h,
> which declares functions which need struct clk_onecell_data without
> declaring that structure first. This can be fixed in 2 ways:
> 
> 1* #Include whatever header file provides the definition of struct
>    clk_onecell_data (I think <linux/clk-provider.h>) in clk-mtk.h
>    itself.
> 
> 2* As you only manipulate pointers and not the structure itself, you
>    could simply declare that this struct exists, without defining it,
>    prior to referencing it in clk-mtk.h. As easy as:
> 
>    struct clk_onecell_data;
> 
> In this case option 1 seems preferable.
> 
> The reason why the problem is only visible in reset.c is because other
> source files under drivers/clk/mediatek #include <linux/clk-provider.h>
> explicitly before #including clk-mtk.h. But it only works "by
> accident". Ideally header files should be self-sufficient, so you don't
> depend on #include order.
> 

agreed on above. I also prefer using option 1 to solve original issue.

> > Reported-by: kbuild test robot <fengguang.wu@intel.com>
> > Signed-off-by: Sean Wang <sean.wang@mediatek.com>
> > Cc: kbuild-all@01.org
> > Cc: Stephen Boyd <sboyd@codeaurora.org>
> > Cc: linux-clk@vger.kernel.org
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
> >  struct mtk_reset {
> >  	struct regmap *regmap;
> >  	int regofs;
> 
> If the header file is indeed not needed then that's still a good
> change, even if it doesn't fix the problem, so:
> 
> Reviewed-by: Jean Delvare <jdelvare@suse.de>

> However the patch description should be adjusted accordingly.


I will use another patch to remove the indeed not needed header 

thanks a lot for your detailed explanation and help

	Sean
