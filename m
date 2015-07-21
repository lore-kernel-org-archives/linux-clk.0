Return-Path: <dinguyen@opensource.altera.com>
Date: Tue, 21 Jul 2015 10:22:38 -0500
From: Dinh Nguyen <dinguyen@opensource.altera.com>
To: Tyler Baker <tyler.baker@linaro.org>
CC: Stephen Boyd <sboyd@codeaurora.org>, Mike Turquette
	<mturquette@linaro.org>, <dinh.linux@gmail.com>, <linux-clk@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Maxime Ripard
	<maxime.ripard@free-electrons.com>, =?ISO-8859-15?Q?Emilio_L=F3pez?=
	<emilio@elopez.com.ar>
Subject: Re: [PATCHv2 5/6] clk: sunxi: make use of of_clk_parent_fill helper
 function
In-Reply-To: <CANMBJr6q7w4SzB2m4JPgwaAFPmSmQcVFu1Sq3EU0_k_Zx7Sa8A@mail.gmail.com>
Message-ID: <alpine.DEB.2.02.1507211020420.22725@linux-builds1>
References: <1436241546-16731-1-git-send-email-dinguyen@opensource.altera.com> <1436241546-16731-6-git-send-email-dinguyen@opensource.altera.com> <20150718005313.GE30412@codeaurora.org> <CANMBJr6q7w4SzB2m4JPgwaAFPmSmQcVFu1Sq3EU0_k_Zx7Sa8A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/mixed;
	boundary="8323329-1899992832-1437492168=:22725"
Return-Path: dinguyen@opensource.altera.com
List-ID: <linux-clk.vger.kernel.org>

--8323329-1899992832-1437492168=:22725
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT

On Tue, 21 Jul 2015, Tyler Baker wrote:

> Hi,
> 
> On 17 July 2015 at 17:53, Stephen Boyd <sboyd@codeaurora.org> wrote:
> > On 07/06, dinguyen@opensource.altera.com wrote:
> >> From: Dinh Nguyen <dinguyen@opensource.altera.com>
> >>
> >> Use of_clk_parent_fill to fill in the parent clock names' array.
> >>
> >> Signed-off-by: Dinh Nguyen <dinguyen@opensource.altera.com>
> >> Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
> >> Cc: "Emilio López" <emilio@elopez.com.ar>
> >> ---
> >
> > Applied to clk-next with that fix I posted.
> 
> The kernelci.org bot reported sunxi a20 boot failures[1][2] in
> next-20150720 and next-20150721. I have bisected[3] these failures to
> this commit. However, I have not investigated any further but
> reverting this commit on top of next-20150721 gets the boards booting
> again.
>

Can you please try this patch?

-->8-

diff --git a/drivers/clk/sunxi/clk-sunxi.c b/drivers/clk/sunxi/clk-sunxi.c
index e8c5185..958655f 100644
--- a/drivers/clk/sunxi/clk-sunxi.c
+++ b/drivers/clk/sunxi/clk-sunxi.c
@@ -204,7 +204,7 @@ static void __init sun6i_ahb1_clk_setup(struct device_node *node)
                return;
 
        /* we have a mux, we will have >1 parents */
-       of_clk_parent_fill(node, parents, SUN6I_AHB1_MAX_PARENTS);
+       i = of_clk_parent_fill(node, parents, SUN6I_AHB1_MAX_PARENTS);
        of_property_read_string(node, "clock-output-names", &clk_name);
 
        ahb1 = kzalloc(sizeof(struct sun6i_ahb1_clk), GFP_KERNEL);
@@ -789,7 +789,7 @@ static void __init sunxi_mux_clk_setup(struct device_node *node,
 
        reg = of_iomap(node, 0);
 
-       of_clk_parent_fill(node, parents, SUNXI_MAX_PARENTS);
+       i = of_clk_parent_fill(node, parents, SUNXI_MAX_PARENTS);
        of_property_read_string(node, "clock-output-names", &clk_name);
 
        clk = clk_register_mux(NULL, clk_name, parents, i,
--8323329-1899992832-1437492168=:22725--
