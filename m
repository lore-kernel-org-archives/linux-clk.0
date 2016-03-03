Return-Path: <sboyd@codeaurora.org>
Date: Thu, 3 Mar 2016 11:16:04 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
	linux-kernel <linux-kernel@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>,
	Maxime Ripard <maxime.ripard@free-electrons.com>
Subject: Re: [PATCH] clk: sunxi: Remove use of VLAIS
Message-ID: <20160303191604.GW24999@codeaurora.org>
References: <20160226194830.GA21652@lukather>
 <1456878048-23393-1-git-send-email-sboyd@codeaurora.org>
 <CAGb2v65TZh0uBD-WEURP6znxx0t427UBk4gLDpMMPUJ3vbc99Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <CAGb2v65TZh0uBD-WEURP6znxx0t427UBk4gLDpMMPUJ3vbc99Q@mail.gmail.com>
List-ID: <linux-clk.vger.kernel.org>

On 03/03, Chen-Yu Tsai wrote:
> On Tue, Mar 1, 2016 at 4:20 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:
> >         div = kzalloc(sizeof(*div), GFP_KERNEL);
> > @@ -107,6 +111,8 @@ err_free_div:
> >         kfree(div);
> >  err_unmap:
> >         iounmap(reg);
> > +err_free_parents:
> > +       kfree(parents);
> 
> AFAIK the CCF makes a deep copy of parents, so you should
> always free it? I specifically checked it before using
> VLAIS here.
> 

Yes. Good catch. Here's the update.

--8<---
From: Stephen Boyd <sboyd@codeaurora.org>
Subject: [PATCH] clk: sunxi: Remove use of VLAIS

Using an array allocated on the stack may lead to stack overflows
and other problems. Furthermore, VLAIS doesn't work well with
LLVM compilers, so move the allocation to the heap and avoid the
use of VLAIS here.

Cc: Chen-Yu Tsai <wens@csie.org>
Cc: Maxime Ripard <maxime.ripard@free-electrons.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---
 drivers/clk/sunxi/clk-sun8i-mbus.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/sunxi/clk-sun8i-mbus.c b/drivers/clk/sunxi/clk-sun8i-mbus.c
index 3aaa9cbef791..90acc8549d60 100644
--- a/drivers/clk/sunxi/clk-sun8i-mbus.c
+++ b/drivers/clk/sunxi/clk-sun8i-mbus.c
@@ -33,7 +33,7 @@ static DEFINE_SPINLOCK(sun8i_a23_mbus_lock);
 static void __init sun8i_a23_mbus_setup(struct device_node *node)
 {
 	int num_parents = of_clk_get_parent_count(node);
-	const char *parents[num_parents];
+	const char **parents;
 	const char *clk_name = node->name;
 	struct resource res;
 	struct clk_divider *div;
@@ -43,10 +43,14 @@ static void __init sun8i_a23_mbus_setup(struct device_node *node)
 	void __iomem *reg;
 	int err;
 
+	parents = kcalloc(num_parents, sizeof(*parents), GFP_KERNEL);
+	if (!parents)
+		return;
+
 	reg = of_io_request_and_map(node, 0, of_node_full_name(node));
 	if (!reg) {
 		pr_err("Could not get registers for sun8i-mbus-clk\n");
-		return;
+		goto err_free_parents;
 	}
 
 	div = kzalloc(sizeof(*div), GFP_KERNEL);
@@ -90,6 +94,7 @@ static void __init sun8i_a23_mbus_setup(struct device_node *node)
 	if (err)
 		goto err_unregister_clk;
 
+	kfree(parents); /* parents is deep copied */
 	/* The MBUS clocks needs to be always enabled */
 	__clk_get(clk);
 	clk_prepare_enable(clk);
@@ -107,6 +112,8 @@ err_free_div:
 	kfree(div);
 err_unmap:
 	iounmap(reg);
+err_free_parents:
+	kfree(parents);
 	of_address_to_resource(node, 0, &res);
 	release_mem_region(res.start, resource_size(&res));
 }
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project
