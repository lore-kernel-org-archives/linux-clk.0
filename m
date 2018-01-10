Return-Path: <sboyd@codeaurora.org>
Date: Tue, 9 Jan 2018 18:02:25 -0800
From: Stephen Boyd <sboyd@codeaurora.org>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/4] clk: Show symbolic clock flags in debugfs
Message-ID: <20180110020225.GE21040@codeaurora.org>
References: <1514977577-11854-1-git-send-email-geert+renesas@glider.be>
 <1514977577-11854-4-git-send-email-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1514977577-11854-4-git-send-email-geert+renesas@glider.be>
List-ID: <linux-clk.vger.kernel.org>

On 01/03, Geert Uytterhoeven wrote:
> Currently the virtual "clk_flags" file in debugfs shows the numeric
> value of the top-level framework flags for the specified clock.
> Hence the user must manually interpret these values.
> 
> Moreover, on big-endian 64-bit systems, the wrong half of the value is
> shown, due to the cast from "unsigned long *" to "u32 *".
> 
> Fix both issues by showing the symbolic flag names instead.
> Any non-standard flags are shown as a hex number.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> v2:
>   - New.
> ---
>  drivers/clk/clk.c            | 54 ++++++++++++++++++++++++++++++++++++++++++--
>  include/linux/clk-provider.h |  2 ++
>  2 files changed, 54 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 240b1d427fadab66..7cb5143c654cd78f 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -2559,6 +2559,56 @@ static const struct file_operations clk_dump_fops = {
>  	.release	= single_release,
>  };
>  
> +static const struct {
> +	unsigned long flag;
> +	const char *name;
> +} clk_flags[] = {
> +	{ CLK_SET_RATE_GATE,		"CLK_SET_RATE_GATE",		},
> +	{ CLK_SET_PARENT_GATE,		"CLK_SET_PARENT_GATE",		},
> +	{ CLK_SET_RATE_PARENT,		"CLK_SET_RATE_PARENT",		},
> +	{ CLK_IGNORE_UNUSED,		"CLK_IGNORE_UNUSED",		},
> +	{ CLK_IS_BASIC,			"CLK_IS_BASIC",			},
> +	{ CLK_GET_RATE_NOCACHE,		"CLK_GET_RATE_NOCACHE",		},
> +	{ CLK_SET_RATE_NO_REPARENT,	"CLK_SET_RATE_NO_REPARENT",	},
> +	{ CLK_GET_ACCURACY_NOCACHE,	"CLK_GET_ACCURACY_NOCACHE",	},
> +	{ CLK_RECALC_NEW_RATES,		"CLK_RECALC_NEW_RATES",		},
> +	{ CLK_SET_RATE_UNGATE,		"CLK_SET_RATE_UNGATE",		},
> +	{ CLK_IS_CRITICAL,		"CLK_IS_CRITICAL",		},
> +	{ CLK_OPS_PARENT_ENABLE,	"CLK_OPS_PARENT_ENABLE",	},
> +};

Thanks!

I wonder if it can be a little simpler with something like the
below patch squashed in? It would also be nice to detect if we
fail to add another flag, but that may mean we need to make the
flags into some sort of enum that we also set equal to BIT(x) and
then have a case statement in the for loop instead of an array
lookup. Not sure that's a big win.

---8<---
diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index e1fcef8614d5..c8ea2dd32251 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -24,6 +24,7 @@
 #include <linux/pm_runtime.h>
 #include <linux/sched.h>
 #include <linux/clkdev.h>
+#include <linux/stringify.h>
 
 #include "clk.h"
 
@@ -2558,18 +2559,20 @@ static const struct {
 	unsigned long flag;
 	const char *name;
 } clk_flags[] = {
-	{ CLK_SET_RATE_GATE,		"CLK_SET_RATE_GATE",		},
-	{ CLK_SET_PARENT_GATE,		"CLK_SET_PARENT_GATE",		},
-	{ CLK_SET_RATE_PARENT,		"CLK_SET_RATE_PARENT",		},
-	{ CLK_IGNORE_UNUSED,		"CLK_IGNORE_UNUSED",		},
-	{ CLK_IS_BASIC,			"CLK_IS_BASIC",			},
-	{ CLK_GET_RATE_NOCACHE,		"CLK_GET_RATE_NOCACHE",		},
-	{ CLK_SET_RATE_NO_REPARENT,	"CLK_SET_RATE_NO_REPARENT",	},
-	{ CLK_GET_ACCURACY_NOCACHE,	"CLK_GET_ACCURACY_NOCACHE",	},
-	{ CLK_RECALC_NEW_RATES,		"CLK_RECALC_NEW_RATES",		},
-	{ CLK_SET_RATE_UNGATE,		"CLK_SET_RATE_UNGATE",		},
-	{ CLK_IS_CRITICAL,		"CLK_IS_CRITICAL",		},
-	{ CLK_OPS_PARENT_ENABLE,	"CLK_OPS_PARENT_ENABLE",	},
+#define ENTRY(f) { f, __stringify(f) }
+	ENTRY(CLK_SET_RATE_GATE),
+	ENTRY(CLK_SET_PARENT_GATE),
+	ENTRY(CLK_SET_RATE_PARENT),
+	ENTRY(CLK_IGNORE_UNUSED),
+	ENTRY(CLK_IS_BASIC),
+	ENTRY(CLK_GET_RATE_NOCACHE),
+	ENTRY(CLK_SET_RATE_NO_REPARENT),
+	ENTRY(CLK_GET_ACCURACY_NOCACHE),
+	ENTRY(CLK_RECALC_NEW_RATES),
+	ENTRY(CLK_SET_RATE_UNGATE),
+	ENTRY(CLK_IS_CRITICAL),
+	ENTRY(CLK_OPS_PARENT_ENABLE),
+#undef ENTRY
 };
 
 static int clk_flags_dump(struct seq_file *s, void *data)


-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
