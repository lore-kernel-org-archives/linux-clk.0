Return-Path: <andriy.shevchenko@linux.intel.com>
From: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	linux-clk@vger.kernel.org
Cc: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Subject: [PATCH v1] HACK: earlyprintk: Allow nocfg and keep together
Date: Fri, 19 Jan 2018 19:35:17 +0200
Message-Id: <20180119173517.22474-1-andriy.shevchenko@linux.intel.com>
List-ID: <linux-clk.vger.kernel.org>

Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
---
 arch/x86/kernel/early_printk.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/arch/x86/kernel/early_printk.c b/arch/x86/kernel/early_printk.c
index 7e07427df3f4..9606e45da124 100644
--- a/arch/x86/kernel/early_printk.c
+++ b/arch/x86/kernel/early_printk.c
@@ -204,7 +204,7 @@ static __init void early_serial_init(char *s)
 	 * Lastly, initialize the hardware
 	 */
 	if (*s) {
-		if (strcmp(s, "nocfg") == 0)
+		if (strncmp(s, "nocfg", 5) == 0)
 			/* Sometimes, we want to leave the UART alone
 			 * and assume the BIOS has set it up correctly.
 			 * "nocfg" tells us this is the case, and we
@@ -320,7 +320,7 @@ static __init void early_pci_serial_init(char *s)
 	 * Lastly, initialize the hardware
 	 */
 	if (*s) {
-		if (strcmp(s, "nocfg") == 0)
+		if (strncmp(s, "nocfg", 5) == 0)
 			/* Sometimes, we want to leave the UART alone
 			 * and assume the BIOS has set it up correctly.
 			 * "nocfg" tells us this is the case, and we
-- 
2.15.1
