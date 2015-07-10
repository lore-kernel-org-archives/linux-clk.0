Return-Path: <linux-kernel-owner@vger.kernel.org>
From: Stephen Boyd <sboyd@codeaurora.org>
To: Mike Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Ken Xue <Ken.Xue@amd.com>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
Subject: [PATCH 5/7] ACPI: Remove clk.h include
Date: Fri, 10 Jul 2015 16:03:27 -0700
Message-Id: <1436569409-27964-6-git-send-email-sboyd@codeaurora.org>
In-Reply-To: <1436569409-27964-1-git-send-email-sboyd@codeaurora.org>
References: <1436569409-27964-1-git-send-email-sboyd@codeaurora.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Clock provider drivers generally shouldn't include clk.h because
it's the consumer API. Remove the includes here because these are
provider drivers.

Cc: Ken Xue <Ken.Xue@amd.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Signed-off-by: Stephen Boyd <sboyd@codeaurora.org>
---

Please ack so this can go through clk-tree. Otherwise it's ok
to go through the acpi tree.

 drivers/acpi/acpi_apd.c  | 1 -
 drivers/acpi/acpi_lpss.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/drivers/acpi/acpi_apd.c b/drivers/acpi/acpi_apd.c
index 3984ea96e5f7..a450e7af877c 100644
--- a/drivers/acpi/acpi_apd.c
+++ b/drivers/acpi/acpi_apd.c
@@ -16,7 +16,6 @@
 #include <linux/clkdev.h>
 #include <linux/acpi.h>
 #include <linux/err.h>
-#include <linux/clk.h>
 #include <linux/pm.h>
 
 #include "internal.h"
diff --git a/drivers/acpi/acpi_lpss.c b/drivers/acpi/acpi_lpss.c
index 569ee090343f..6817b18ed722 100644
--- a/drivers/acpi/acpi_lpss.c
+++ b/drivers/acpi/acpi_lpss.c
@@ -11,7 +11,6 @@
  */
 
 #include <linux/acpi.h>
-#include <linux/clk.h>
 #include <linux/clkdev.h>
 #include <linux/clk-provider.h>
 #include <linux/err.h>
-- 
The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

