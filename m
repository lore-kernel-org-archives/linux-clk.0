Return-Path: <Julia.Lawall@lip6.fr>
From: Julia Lawall <Julia.Lawall@lip6.fr>
To: Michael Turquette <mturquette@baylibre.com>
Cc: kernel-janitors@vger.kernel.org,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	"Luis R . Rodriguez" <mcgrof@kernel.org>,
	Josh Triplett <josh@joshtriplett.org>
Subject: [PATCH 1/5] clk: qoriq: add __init attribute
Date: Mon, 18 Apr 2016 16:55:34 +0200
Message-Id: <1460991338-9845-2-git-send-email-Julia.Lawall@lip6.fr>
In-Reply-To: <1460991338-9845-1-git-send-email-Julia.Lawall@lip6.fr>
References: <1460991338-9845-1-git-send-email-Julia.Lawall@lip6.fr>
List-ID: <linux-clk.vger.kernel.org>

Add __init attribute on a function that is only called from other __init
functions and that is not inlined, at least with gcc version 4.8.4 on an
x86 machine with allyesconfig.  Currently, the function is put in the
.text.unlikely segment.  Declaring it as __init will cause it to be put in
the .init.text and to disappear after initialization.

The result of objdump -x on the function before the change is as follows:

0000000000000000 l     F .text.unlikely 0000000000000071 sysclk_from_fixed.constprop.5

And after the change it is as follows:

0000000000000480 l     F .init.text	000000000000006c sysclk_from_fixed.constprop.5

Done with the help of Coccinelle.  The semantic patch checks for local
static non-init functions that are called from an __init function and are
not called from any other function.

Signed-off-by: Julia Lawall <Julia.Lawall@lip6.fr>

---
 drivers/clk/clk-qoriq.c |    3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-qoriq.c b/drivers/clk/clk-qoriq.c
index 7bc1c45..5c11b58 100644
--- a/drivers/clk/clk-qoriq.c
+++ b/drivers/clk/clk-qoriq.c
@@ -869,7 +869,8 @@ static void __init core_mux_init(struct device_node *np)
 	}
 }
 
-static struct clk *sysclk_from_fixed(struct device_node *node, const char *name)
+static struct clk __init
+*sysclk_from_fixed(struct device_node *node, const char *name)
 {
 	u32 rate;
 
