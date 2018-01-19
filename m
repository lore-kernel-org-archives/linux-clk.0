Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-bn3nam01on0084.outbound.protection.outlook.com ([104.47.33.84]:10176
        "EHLO NAM01-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753841AbeASNh2 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Fri, 19 Jan 2018 08:37:28 -0500
From: Dong Aisheng <aisheng.dong@nxp.com>
To: <linux-doc@vger.kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <linux-imx@nxp.com>,
        Dong Aisheng <aisheng.dong@nxp.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Stephen Boyd <sboyd@codeaurora.org>
Subject: [PATCH 1/1] Documentation: clk: enable lock is not held for clk_is_enabled API
Date: Fri, 19 Jan 2018 21:37:15 +0800
Message-ID: <1516369035-24740-1-git-send-email-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

The core does not need to hold enable lock for clk_is_enabled API.
Update the doc to reflect it.

Cc: Jonathan Corbet <corbet@lwn.net>
Cc: Stephen Boyd <sboyd@codeaurora.org>
Suggested-by: Stephen Boyd <sboyd@codeaurora.org>
Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>
---
 Documentation/clk.txt | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/Documentation/clk.txt b/Documentation/clk.txt
index be909ed..f286ff5 100644
--- a/Documentation/clk.txt
+++ b/Documentation/clk.txt
@@ -268,9 +268,17 @@ The common clock framework uses two global locks, the prepare lock and the
 enable lock.
 
 The enable lock is a spinlock and is held across calls to the .enable,
-.disable and .is_enabled operations. Those operations are thus not allowed to
-sleep, and calls to the clk_enable(), clk_disable() and clk_is_enabled() API
-functions are allowed in atomic context.
+.disable operations. Those operations are thus not allowed to sleep,
+and calls to the clk_enable(), clk_disable() API functions are allowed in
+atomic context.
+
+For clk_is_enabled() API, it is also designed to be allowed to be used in
+atomic context. However, it doesn't really make any sense to hold the enable
+lock in core, unless you want to do something else with the information of
+the enable state with that lock held. Otherwise, seeing if a clk is enabled is
+a one-shot read of the enabled state, which could just as easily change after
+the function returns because the lock is released. Thus driver onwer needs
+judge and take care of it in their driver if it needs lock.
 
 The prepare lock is a mutex and is held across calls to all other operations.
 All those operations are allowed to sleep, and calls to the corresponding API
-- 
2.7.4

