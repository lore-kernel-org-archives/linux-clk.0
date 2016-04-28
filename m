Return-Path: <vaishali.thakkar@oracle.com>
From: Vaishali Thakkar <vaishali.thakkar@oracle.com>
To: mturquette@baylibre.com
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        sboyd@codeaurora.org, Vaishali Thakkar <vaishali.thakkar@oracle.com>
Subject: [PATCH] clk: bcm/kona: Do not use sizeof on pointer type
Date: Thu, 28 Apr 2016 19:20:33 +0530
Message-Id: <1461851433-19365-1-git-send-email-vaishali.thakkar@oracle.com>
List-ID: <linux-clk.vger.kernel.org>

When sizeof is applied to a pointer typed expression, it gives
the size of the pointer. So, here do not use sizeof on pointer
type. Also, silent checkpatch.pl by using kmalloc_array over
kmalloc.

Note that this has no effect on runtime because 'parent_names'
is a pointer to a pointer.

Problem found using Coccinelle.

Signed-off-by: Vaishali Thakkar <vaishali.thakkar@oracle.com>
---
 drivers/clk/bcm/clk-kona-setup.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/bcm/clk-kona-setup.c b/drivers/clk/bcm/clk-kona-setup.c
index deaa7f9..526b0b0 100644
--- a/drivers/clk/bcm/clk-kona-setup.c
+++ b/drivers/clk/bcm/clk-kona-setup.c
@@ -577,7 +577,8 @@ static u32 *parent_process(const char *clocks[],
 	 * selector is not required, but we allocate space for the
 	 * array anyway to keep things simple.
 	 */
-	parent_names = kmalloc(parent_count * sizeof(parent_names), GFP_KERNEL);
+	parent_names = kmalloc_array(parent_count, sizeof(*parent_names),
+			       GFP_KERNEL);
 	if (!parent_names) {
 		pr_err("%s: error allocating %u parent names\n", __func__,
 				parent_count);
-- 
2.1.4
