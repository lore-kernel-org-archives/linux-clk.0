Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EB993A4F33;
	Thu,  8 Oct 2026 02:58:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791428298; cv=none; b=TDWsu+S3r2kK+L35Q6qZUP/2PmFAgxqu11gl4/NGjRfdlaUX7LlerX9mzjAP54m2NXB4Zn/fPPMBcrcQYbS234tjpvrDY+zLMFSu52Jh183XvTIpq9FH0OvG6evmbQAMgywGR1PDjgJRWrFUFXpNM6QvGjIbyz6uwvchz0dpoQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791428298; c=relaxed/simple;
	bh=XPLMkYyFjbfl4WMMQWRlozz/d0XZ9OyspH0P7A/Spbs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=f+yiqqFPrGivHiUKCDC5DAGITHWoqgTURdk3qx+VsY9ABzNma8wSBkPHVASpMkmgD0s/i++KL0Ll0TopfL60YhoyM3AsCWmmVpaq84uFWs+3PEfncH1UC7u4ik2VRvqC8Jx1r9EY8umkhS7yiWsc+KsOe8KFhswux66CNTCeTM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=W+fwH4Cr; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="W+fwH4Cr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD87B1F00893;
	Thu,  8 Oct 2026 02:58:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791428296;
	bh=PyN3EcISv+5EZ8wNP0QHAEF2GFgb5uDn9zjA9bRxqkM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=W+fwH4CrC1V8tYGc7ggluunt+0GzQYEFWGyPwOnnS2cmUDLvcZckEFLkBRgYVfegj
	 K/c+FZdiIHyIIEVmHwTI+RdF33W6HWEjRBN/RRgxkUZ4+tjrREyjWZTSBzIbjxrFRf
	 M1uWOtPtGpIyBvpI5AAwa7S9H8s+wNDWNg5BtzgIxGHlO7klTyHTbyWPwDZw8iE2AZ
	 pC3dl3DQTecXHCuiUz3MbeIgK+LsMIOcolJm55IB0od056kbcmIxVpYVpsuDZanM43
	 C+7cxRms8gRbbuyw2TYXqzWbwu7mUB3SFT2jRHd4JvFl+W3t3mnM/ke7jSgiQu5wbM
	 ZGVCQ6GHHMRiw==
From: Yixun Lan <dlan@kernel.org>
Date: Thu, 08 Oct 2026 02:57:55 +0000
Subject: [PATCH 1/2] clk: spacemit: rename to generic ccu aux register
 function
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261008-04-k3-clk-pm-aux-v1-1-8372d7307694@kernel.org>
References: <20261008-04-k3-clk-pm-aux-v1-0-8372d7307694@kernel.org>
In-Reply-To: <20261008-04-k3-clk-pm-aux-v1-0-8372d7307694@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>
Cc: Alex Elder <elder@riscstar.com>, Icenowy Zheng <uwu@icenowy.me>, 
 Iker Pedrosa <ikerpedrosam@gmail.com>, linux-clk@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2085; i=dlan@kernel.org;
 h=from:subject:message-id; bh=XPLMkYyFjbfl4WMMQWRlozz/d0XZ9OyspH0P7A/Spbs=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqxwa7pCimB89wBMDeNEVdV/hspyLL3eswrNWad
 R4mPIrUtrSJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCascGuxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+2dqw//YJfRv0lGSBSjIQD7XCJoCkaP7f9iJOMNS+JwrYN0RY5mUwWikpxzE
 g7fo4RJ9cZpjZuOnF3orohRir53VA5VrY3vhK9bQ7fZspnOON0Ubof9tDhW3keBFP+dbSns7LXD
 b1RjahMWUMlkRi/R2kQle/vw/7r0a9173U8YYBbOneZJxQDqemUXL8r6bCdrInSXGusrUJnEomX
 6N7m/wW+OjQ7EmJ5RhADPz3rOyAG5p4bNZFIM4lxzu0g5ApKFG80Q1wpbfW2sOCoK0zueWkNeQ7
 tAvtyiq7AnUxMd0xu2b1Q3vzrPyf7xw6sOZcBvH1nLn4NPDfwSIGUWmnFWGzklYLarYKmeVHKKl
 PnQGosumahJFhejZfRqtLshN99KP3jUeXO6+KbrDSxTZ9w+VoY2IdNkzHC/9PcXYWo5umlSqZZq
 JEBJ9PwgwgUF8CIy5aQridXJr4DejjueUDyW9XhG1bItGMssE4go3S9qmpGoasFoyBHq02ACMvk
 /QL+LAA5bIcQsUJqiTBQ/CZR26dN7IABnAywyPpnWQWvqSv2AOBGKikwe5djaHfiZJDENhYifxU
 DJP/J3tAiARi784dCY4hS1vQ9TtDGYndt98a+pQaGizTfeGwIAY8T0/AwZJNLgAwy9eciYWz7kv
 5+vGWCNKUQ99YNE9I+E1dxF5aWf5cs=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

The APMU (Application Subsystem Power Management Unit) register region
block not only provides clock and reset support, but also the pm domain
management capabilities, so function of aux registration is being renamed
to a more generic one, in order to prepare for future addition of pm
domain driver.

No functional change is introduced therefore.

Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 drivers/clk/spacemit/ccu_common.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/spacemit/ccu_common.c b/drivers/clk/spacemit/ccu_common.c
index 8696bb9cba2d..56f3d081857e 100644
--- a/drivers/clk/spacemit/ccu_common.c
+++ b/drivers/clk/spacemit/ccu_common.c
@@ -79,16 +79,16 @@ static void spacemit_adev_unregister(void *data)
 	auxiliary_device_uninit(adev);
 }
 
-static int spacemit_ccu_reset_register(struct device *dev,
+static int spacemit_ccu_aux_register(struct device *dev,
 				       struct regmap *regmap,
-				       const char *reset_name)
+				       const char *name)
 {
 	struct spacemit_ccu_adev *cadev;
 	struct auxiliary_device *adev;
 	int ret;
 
-	/* Nothing to do if the CCU does not implement a reset controller */
-	if (!reset_name)
+	/* Nothing to do if the CCU does not implement a reset/pm controller */
+	if (!name)
 		return 0;
 
 	cadev = kzalloc_obj(*cadev);
@@ -98,7 +98,7 @@ static int spacemit_ccu_reset_register(struct device *dev,
 	cadev->regmap = regmap;
 
 	adev = &cadev->adev;
-	adev->name = reset_name;
+	adev->name = name;
 	adev->dev.parent = dev;
 	adev->dev.release = spacemit_cadev_release;
 	adev->dev.of_node = dev->of_node;
@@ -165,7 +165,7 @@ int spacemit_ccu_probe(struct platform_device *pdev, const char *compat)
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to register clocks\n");
 
-	ret = spacemit_ccu_reset_register(dev, base_regmap, data->reset_name);
+	ret = spacemit_ccu_aux_register(dev, base_regmap, data->reset_name);
 	if (ret)
 		return dev_err_probe(dev, ret, "failed to register resets\n");
 

-- 
2.56.0

