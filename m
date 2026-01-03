Received: from smtp.gentoo.org (woodpecker.gentoo.org [140.211.166.183])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0225F26A0DD;
	Sat,  3 Jan 2026 07:27:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=140.211.166.183
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767425225; cv=none; b=rEBeX7DU82Rhe4Zsjr5C271Qxds8nzZzbUdBG5TfKFka2xzHam37befsCbeT8giXuPUxHBHg+ySSzxA6R0VvCs/wXjF3f3X3YCLkVO74tZfATQOR7lKj7JJa/Q0jvcuZlJ1elrs+cJI+7Io1eyGqfo7CzwlKhX075L+OLAt4suw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767425225; c=relaxed/simple;
	bh=a0l0Hwtc8AX9/uTm8puy0kd/nzf/RxGqjZIZTzVv96M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=N2TX3pWjNIc6SxSATxfQ7t8jzQ1S1uQ6T+otxBsYFiDM331sZ43L9ojXfmkmJ2F3poW7xiOg/5M1sZ9/D+BMKWgylL+YGdRHnBJZPmOSmb99cLEkEbmU2PYwI9JhvgahYKPTFrKVEtNplF2yMZzRb9XLsn3l9etK6arQ6XuxftY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org; spf=pass smtp.mailfrom=gentoo.org; arc=none smtp.client-ip=140.211.166.183
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gentoo.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gentoo.org
Received: from [127.0.0.1] (unknown [116.232.18.222])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: dlan)
	by smtp.gentoo.org (Postfix) with ESMTPSA id 52C8F3417FE;
	Sat, 03 Jan 2026 07:26:58 +0000 (UTC)
From: Yixun Lan <dlan@gentoo.org>
Date: Sat, 03 Jan 2026 15:26:14 +0800
Subject: [PATCH v3 3/4] clk: spacemit: add platform SoC prefix to reset
 name
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260103-06-k1-clk-common-v3-3-6061d9f69eef@gentoo.org>
References: <20260103-06-k1-clk-common-v3-0-6061d9f69eef@gentoo.org>
In-Reply-To: <20260103-06-k1-clk-common-v3-0-6061d9f69eef@gentoo.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Alex Elder <elder@riscstar.com>, Guodong Xu <guodong@riscstar.com>, 
 Inochi Amaoto <inochiama@gmail.com>, linux-kernel@vger.kernel.org, 
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, Yixun Lan <dlan@gentoo.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2118; i=dlan@gentoo.org;
 h=from:subject:message-id; bh=a0l0Hwtc8AX9/uTm8puy0kd/nzf/RxGqjZIZTzVv96M=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBpWMSqrrh3fUziF5/wgj9P0hv3eufyArdSVEIfu
 G7O5m0rT6qJAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCaVjEqhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+3g4g/9EDeNvG2pbBYxE9jt07jAd5giC77CrVOu5lEvMtA9EQ8mNQtidhnrF
 soK9/0MZ+teAeSweejMVxv+wOHaEoXX1pY8ve4ri7N66ZtCqq6UhbZiB1IG6J1VktWPDpiGzR55
 rynXgGToP3lON2jkmsLDYAHHa4h1chQZpzOF9UHem4SrN31m/mBC9I4xi3/DMeOTwN43eVGoNn+
 wCnNew8AJjTzzMnaLOrNTRDeZR1wcDVdLTLPNOT+TjB20aWAiReduDDfZSJu/xW0RlPnf54inK8
 N+d2kVfVcz9ht3nXRMiupDYr9ytMP1FLJycjtAgRbTTVUjFaKZaun+i+voAkaRKT0iQKZJF8SoU
 aTeSvP1FD8qqapuMLzCDdjIURswx1GbSUBq3JfO6O0JDnkWXp6LuKlMiEpoa0qOXKpfSoeLH2Go
 nJMTJS2ApUEjo6sr34im1QZ28aqD71Jxrfq8aynzGgz9jCbIsV3YqG12rXd3VUhn0EbwsW8/RsZ
 w1Xm2WxxgX21EPkrswAHyTklkC15hbCOPGHbZV+Dli9VmHRc9m8fSZwTFJ2JZJ/zuTj+3ZjvLB7
 GY4IAOYJqseRQrxxluxGobcbwHk/vnsmY0pmQbHVnTvmAznAu+oal/hl/GEauLlsWqWkceDNx/f
 CceQDhCJHv+i9yHWkaRkYdJXJINNsc=
X-Developer-Key: i=dlan@gentoo.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

This change is needed for adding future new SpacemiT K3 reset driver.

Since both K1 and K3 reset code register via the same module which its
name changed to spacemit_ccu, it's necessary to encode the platform/SoC
in the reset auxiliary device name to distinguish them, otherwise two
reset drivers will claim to support same "compatible" auxiliary device
even in the case of only one CCU clock driver got registered, which in
the end lead to a broken reset driver.

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

