Return-Path: <pdeschrijver@nvidia.com>
From: Peter De Schrijver <pdeschrijver@nvidia.com>
To: Peter De Schrijver <pdeschrijver@nvidia.com>, Michael Turquette
	<mturquette@baylibre.com>, Stephen Boyd <sboyd@codeaurora.org>,
	<linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>
Subject: [PATCH] clk: aggregate return codes of notify chains
Date: Tue, 21 Mar 2017 12:16:26 +0200
Message-ID: <1490091386-4014-1-git-send-email-pdeschrijver@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain
Return-Path: pdeschrijver@nvidia.com
List-ID: <linux-clk.vger.kernel.org>

In case there are multiple notify chains for the same clocks (because they
were registered by different users), we need to propagate potential failure
of any single one of them to the caller. Otherwise we eg risk violating the
V/f curve when a notifier is used for DVFS.

Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
---
 drivers/clk/clk.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 67201f6..f5f2bcd 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -966,6 +966,8 @@ static int __clk_notify(struct clk_core *core, unsigned long msg,
 			cnd.clk = cn->clk;
 			ret = srcu_notifier_call_chain(&cn->notifier_head, msg,
 					&cnd);
+			if (ret & NOTIFY_STOP_MASK)
+				return ret;
 		}
 	}
 
-- 
1.9.1
