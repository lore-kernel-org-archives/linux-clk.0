Return-Path: <festevam@gmail.com>
MIME-Version: 1.0
In-Reply-To: <20180111211948.GL28313@codeaurora.org>
References: <CAOMZO5AspF1OmJkAFRtiPWr68xe42_kY90_3JXygt+Jr4A=PWQ@mail.gmail.com>
 <20180111211948.GL28313@codeaurora.org>
From: Fabio Estevam <festevam@gmail.com>
Date: Mon, 15 Jan 2018 14:48:58 -0200
Message-ID: <CAOMZO5BfDRsO=gn_SjkDa_09KEf_EjZcfM5VQawaR1-dQE0o0g@mail.gmail.com>
Subject: Re: Warnings from drivers/clk/clk.c
To: Stephen Boyd <sboyd@codeaurora.org>
Cc: Sascha Hauer <kernel@pengutronix.de>, Dong Aisheng <aisheng.dong@nxp.com>,
	linux-clk@vger.kernel.org, Michael Turquette <mturquette@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
List-ID: <linux-clk.vger.kernel.org>

Hi Stephen,

On Thu, Jan 11, 2018 at 7:19 PM, Stephen Boyd <sboyd@codeaurora.org> wrote:

> We have two WARN_ON in this function. Do you know which one hit
> (makes me think we should put a printk in here now and also
> include the clk name).

Yes, having the clk name that causes the warning really helps debugging.

Do you mean like this?

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 0f686a9..6fed292 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -681,8 +681,12 @@ static void clk_core_unprepare(struct clk_core *core)
        if (!core)
                return;

-       if (WARN_ON(core->prepare_count == 0))
+       if (core->prepare_count == 0) {
+               pr_err("%s: %s called with enable_count not zero\n",
+                      __func__, core->name);
+               WARN_ON(1);
                return;
+       }

        if (WARN_ON(core->prepare_count == 1 && core->flags & CLK_IS_CRITICAL))
                return;
@@ -808,9 +812,14 @@ static void clk_core_disable(struct clk_core *core)
        if (!core)
                return;

-       if (WARN_ON(core->enable_count == 0))
+       if (core->enable_count == 0) {
+               pr_err("%s: %s called with enable_count not zero\n",
+                      __func__, core->name);
+               WARN_ON(1);
                return;

+       }
+
        if (WARN_ON(core->enable_count == 1 && core->flags & CLK_IS_CRITICAL))
                return;
