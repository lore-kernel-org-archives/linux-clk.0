Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04A4D4DF3D6;
	Thu,  8 Jan 2026 13:40:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767879621; cv=none; b=OzZOssdsXenGSTjcyslSLZ+xm77/rE8uQYMBIKV15C28jGCq+gvHF5/EBWfWDIVZjxfsEjpfb5Y8MI7qp7uc3noJjpiZkAe5SVVQmQfgUJxqwXUonR9ToXuTZ2ou4Wc7ATgSUQn3sQtDVOxALbJS40qDi91UhEYxYOfV5zj01SA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767879621; c=relaxed/simple;
	bh=y46B++74XJZhaiqzj4f4dZZT9CJ1nDQjfA9Aref6lV0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pc13r8e/Mv1hupn1RVnsi/rk9MxjaY+DpwR6iBMmIsV3H1cmLnBeIaTzoV8SW/UBc0GMhljw1xUQqPCoLQvsIhhCXUUdlb0kOt3S9kq7XeZmkSMhg2CU9Ydr+uBbyYTQL2uvLEJW8jjM1hqV6TfInRNL54iN97arpZBaMmwnVTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 0B0F0341EC9;
	Thu, 08 Jan 2026 13:40:15 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Thu, 08 Jan 2026 21:39:24 +0800
Subject: [PATCH v4 3/4] clk: spacemit: add platform SoC prefix to reset
 name
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260108-06-k1-clk-common-v4-3-badf635993d3@gentoo.org>
References: <20260108-06-k1-clk-common-v4-0-badf635993d3@gentoo.org>
In-Reply-To: <20260108-06-k1-clk-common-v4-0-badf635993d3@gentoo.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alex Elder <elder@riscstar.com>, Guodong Xu <guodong@riscstar.com>, 
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2313; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=y46B++74XJZhaiqzj4f4dZZT9CJ1nDQjfA9Aref6lV0=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpX7Or4znHv7fFH5P5hyMKb2zjYhnFCIqLSMEvh
 faRGE9IBweJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaV+zqxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+1OPQ/8CHyUffWJfqCg1OOScglpE4LG83/kQZSon3DGctzZFwfcuq6i737W3
 2/dmdFjwuhTQ4okGLYtRfy+fU7XgRCW+5sVQ6ZeuzdNv5gXSRUpYNtgcCQeIEjynn7k4n5LnSs6
 lLQNMGhlKYANZvOskjYmo0PiKgaSLzVPIKuQOQloFOkVLwYwGavoGKhL4e949y83AGJCh4WNKd8
 4U7OXPlX5ANDK3KjksTC5njjUzql602fpnd/E7RisU965iXwMbKMOBSCyrSTIe8Jj2nC16wpRu2
 /GPHYVS/9rfzqBnwIcINMvuU9/9bgI6VN8wTMMXyLoGKFJH/hS0KakIXzpKiVT3bmvdKNe/bhSm
 JKS+uBQqG6Q4aZ013e9R+O495ZyQ3i+Sk+8qX15oCPU6eyTSdWBIBRRVub/GF7p+kQ9lRw8QCYl
 69XzAQ1FUzveHbJqcef0U+YdN/w4t30H5Qm9uk/XIZsc/bpOsX2SVi25Ru097KUwgWHQMjTwgAU
 pB79ZnytvLRKHAq62qlube0QaxYTSjlWY9mt/azV7vgouw8dkpUs618tUxeq9nveSxLPK8CMMGb
 vCI/QQz6YoCDcgo13QhxWfoZQLrlS+harz73a9MUfcnzmjyRwxaXOEY1T4Pmv3P3dA72gV4wnwF
 7VGg06nF9ptH/XwzFWVOrOV3YLvchE=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

This change is needed for adding future new SpacemiT K3 reset driver.

Since both K1 and K3 reset code register via the same module which its
name changed to spacemit_ccu, it's necessary to encode the platform/SoC
in the reset auxiliary device name to distinguish them, otherwise two
reset drivers will claim to support same "compatible" auxiliary device
even in the case of only one CCU clock driver got registered, which in
the end lead to a broken reset driver.

This change will introduce a runtime break to reset driver, and will be
fixed in follow-up commit:
("reset: spacemit: fix auxiliary device id")

Reviewed-by: Alex Elder <elder@riscstar.com>
Signed-off-by: Yixun Lan <dlan@gentoo.org>
---
 drivers/clk/spacemit/ccu-k1.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.c
index 02c792a73759..dee14d25f75d 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -789,7 +789,7 @@ static struct clk_hw *k1_ccu_mpmu_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_mpmu_data = {
-	.reset_name	= "mpmu-reset",
+	.reset_name	= "k1-mpmu-reset",
 	.hws		= k1_ccu_mpmu_hws,
 	.num		= ARRAY_SIZE(k1_ccu_mpmu_hws),
 };
@@ -900,7 +900,7 @@ static struct clk_hw *k1_ccu_apbc_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_apbc_data = {
-	.reset_name	= "apbc-reset",
+	.reset_name	= "k1-apbc-reset",
 	.hws		= k1_ccu_apbc_hws,
 	.num		= ARRAY_SIZE(k1_ccu_apbc_hws),
 };
@@ -971,21 +971,21 @@ static struct clk_hw *k1_ccu_apmu_hws[] = {
 };
 
 static const struct spacemit_ccu_data k1_ccu_apmu_data = {
-	.reset_name	= "apmu-reset",
+	.reset_name	= "k1-apmu-reset",
 	.hws		= k1_ccu_apmu_hws,
 	.num		= ARRAY_SIZE(k1_ccu_apmu_hws),
 };
 
 static const struct spacemit_ccu_data k1_ccu_rcpu_data = {
-	.reset_name	= "rcpu-reset",
+	.reset_name	= "k1-rcpu-reset",
 };
 
 static const struct spacemit_ccu_data k1_ccu_rcpu2_data = {
-	.reset_name	= "rcpu2-reset",
+	.reset_name	= "k1-rcpu2-reset",
 };
 
 static const struct spacemit_ccu_data k1_ccu_apbc2_data = {
-	.reset_name	= "apbc2-reset",
+	.reset_name	= "k1-apbc2-reset",
 };
 
 static const struct of_device_id of_k1_ccu_match[] = {

-- 
2.52.0

