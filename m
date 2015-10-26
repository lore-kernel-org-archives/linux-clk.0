Return-Path: <sboyd@codeaurora.org>
Date: Mon, 26 Oct 2015 11:51:42 -0700
From: Stephen Boyd <sboyd@codeaurora.org>
To: Javier Martinez Canillas <javier@osg.samsung.com>
Cc: linux-kernel@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Scott Branden <sbranden@broadcom.com>, linux-clk@vger.kernel.org
Subject: Re: [PATCH] clk: versatile: Make depend on OF when COMPILE_TEST
Message-ID: <20151026185142.GF19782@codeaurora.org>
References: <1445812888-8170-1-git-send-email-javier@osg.samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
In-Reply-To: <1445812888-8170-1-git-send-email-javier@osg.samsung.com>
List-ID: <linux-clk.vger.kernel.org>

On 10/26, Javier Martinez Canillas wrote:
> Commit 4a7748c3d641 ("clk: Allow drivers to build if COMPILE_TEST is
> enabled") allowed clk drives to be compile tested on other archs but

s/drives/drivers/

> the COMMON_CLK_VERSATILE was only enabled on platforms that already
> selected OF support so the drivers assume it will always be enabled.
> 
> So, restrict compile test for these drivers only if OF is enabled.

No compiler error message?

> 
> Fixes: 4a7748c3d641 ("clk: Allow drivers to build if COMPILE_TEST is enabled")
> Signed-off-by: Javier Martinez Canillas <javier@osg.samsung.com>
> 

No Reported-by?

I'd prefer we add stubs instead, so I've applied the patch below.

---8<---
diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index bbb8fed11e44..dbedee565ad7 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -691,6 +691,15 @@ static inline struct clk *of_clk_src_onecell_get(
 {
 	return ERR_PTR(-ENOENT);
 }
+static inline int of_clk_get_parent_count(struct device_node *np)
+{
+	return 0;
+}
+static inline int of_clk_parent_fill(struct device_node *np,
+				     const char **parents, unsigned int size)
+{
+	return 0;
+}
 static inline const char *of_clk_get_parent_name(struct device_node *np,
 						 int index)
 {

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
