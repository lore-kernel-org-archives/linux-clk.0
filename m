Return-Path: <sudipm.mukherjee@gmail.com>
Return-Path: <sudipm.mukherjee@gmail.com>
From: Sudip Mukherjee <sudipm.mukherjee@gmail.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>
Cc: linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-clk@vger.kernel.org,
	Sudip Mukherjee <sudipm.mukherjee@gmail.com>
Subject: [PATCH 1/2] devm: add helper devm_add_action_or_reset()
Date: Wed, 23 Dec 2015 17:57:19 +0530
Message-Id: <1450873640-12489-1-git-send-email-sudipm.mukherjee@gmail.com>
List-ID: <linux-clk.vger.kernel.org>

Add a helper function devm_add_action_or_reset() which will internally
call devm_add_action(). But if devm_add_action() fails then it will
execute the action mentioned and return the error code.

Signed-off-by: Sudip Mukherjee <sudip@vectorindia.org>
---

Next patch of the series will use this helper. And from a first glance
more use of this helper will be there.

 include/linux/device.h | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/include/linux/device.h b/include/linux/device.h
index f627ba2..f2455d0 100644
--- a/include/linux/device.h
+++ b/include/linux/device.h
@@ -682,6 +682,18 @@ void __iomem *devm_ioremap_resource(struct device *dev, struct resource *res);
 int devm_add_action(struct device *dev, void (*action)(void *), void *data);
 void devm_remove_action(struct device *dev, void (*action)(void *), void *data);
 
+static inline int devm_add_action_or_reset(struct device *dev,
+					   void (*action)(void *), void *data)
+{
+	int ret;
+
+	ret = devm_add_action(dev, action, data);
+	if (ret)
+		action(data);
+
+	return ret;
+}
+
 struct device_dma_parameters {
 	/*
 	 * a low level driver may set these to teach IOMMU code about
-- 
1.9.1
