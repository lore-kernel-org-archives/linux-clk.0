Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.139
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794450700;
	b=v4s5PJSglGg3X5nI17uGHSV2u0VYAVsAD+G4hEbpyc1nD0xNoaUkb/DVMPyRqFBGp2QH
	 nki9It+754f5IygNeMluExPxFzmbLEmuAmHL931BUdiHonAphx348QfSjUz14K14L9Pij
	 BZ58ajyZbCwG0nKXkv3ZUCigT6c6Da4WD7YzXNTG1gA7m6D1+p4l/Ux3wSfGdE4As3bE2
	 JGjiOe7SkbXvySuTgIP9mCL3OLeVnhX0FQ8/4xGhkLaWXiLdcaWRrL4nQqA4/SforRWr+
	 xqZHDYS9ZI0biyk70poei0r8KCYHkVtnHDx5UfB40n/rs9t2EwqCu/z83vguBOjLqWw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794450700;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2L0+ubWBrqKmaPNuUbxc1vTo20sNFqwPHMxboVWuy6c=;
	b=dIjbeYnxE8QnPD9cy3XEiZFg6G5QQi1FDw20opNTQXcYWLUEaScQD+5xQm09Ph6ew05B
	 R78/6+ds6fWKV5YDqkFjL9eT/6+u5WrJsc64oSZ4sCG7MQCJrdzFK1R0pI941gE5ofUUj
	 Iy5fPYq+tEJfBX0ABEqdRFpQDrNgKtt5Cm9cNw8NgUFb5jDruuB743QQEcPBE5VvM6ZVa
	 wywoR9Qsr9b9WkD5zuY8fV+d+w6IS83hJGD751NSGm5km4C+CbHPxUjj4VHst99WCxuGt
	 uV7mClweo/k/NrT7h2LbZiZL5MUvcsgrbggUUsLpHn0qZEn7Q6ZxCqTL4i/bpbN8/cQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=H9xN3dtX;
	arc=none smtp.remote-ip=111.22.67.139
Received: from cmccmta6.chinamobile.com (cmccmta6.chinamobile.com [111.22.67.139])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A2C97606A31C;
	Thu, 12 Nov 2026 02:31:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A2C97606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=H9xN3dtX
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=H9xN3dtXJJRHHKdNQvS2be1qZyuAEIJkephSl/KCYFR84wrzBlEi7jad8fapVvjGxE5RPZu1fmh/A
	 cdqwvyALpWiTbtBSjIj44F5nZEasxwllHCDN6GQJV6g17s7vKT3oUle/WzUY99oOXUt8hOUxVTRpQo
	 pMKfrFaHOdX7IcI8=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app05-12005 (RichMail) with SMTP id 2ee56af52509a40-da14a;
	Thu, 12 Nov 2026 10:31:38 +0800 (CST)
X-RM-TRANSID:2ee56af52509a40-da14a
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from devin-VMware-Virtual-Platform (unknown[10.55.1.72])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76af52507ec2-ef219;
	Thu, 12 Nov 2026 10:31:38 +0800 (CST)
X-RM-TRANSID:2ee76af52507ec2-ef219
From: Zhu Jun <zhujun2@cmss.chinamobile.com>
To: kristo@kernel.org
Cc: nm@ti.com,
	ssantosh@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Zhu Jun <zhujun2@cmss.chinamobile.com>
Subject: [PATCH] clk: keystone: sci-clk: Release nodes while scanning DT clocks
Date: Thu, 12 Nov 2026 10:31:37 +0800
Message-ID: <20261112023137.118241-1-zhujun2@cmss.chinamobile.com>
X-Mailer: git-send-email 2.51.0
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

ti_sci_scan_clocks_from_dt() parses clock phandles without releasing the
provider node references. Allocation failures also leave the current
consumer node referenced by the outer device tree walk.

Give each parsed provider node scoped cleanup, and release the consumer
node when returning early from the scan.

OpenAI Codex assisted with analysis and patch preparation.

Fixes: 8e48b33f9def ("clk: keystone: sci-clk: probe clocks from DT instead of firmware")
Signed-off-by: Zhu Jun <zhujun2@cmss.chinamobile.com>
---
 drivers/clk/keystone/sci-clk.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
index 967f77900358..433bdca8ac83 100644
--- a/drivers/clk/keystone/sci-clk.c
+++ b/drivers/clk/keystone/sci-clk.c
@@ -541,7 +541,7 @@ static int _cmp_sci_clk_list(void *priv, const struct list_head *a,
 static int ti_sci_scan_clocks_from_dt(struct sci_clk_provider *provider)
 {
 	struct device *dev = provider->dev;
-	struct device_node *np = NULL;
+	struct device_node *np __free(device_node) = NULL;
 	int ret;
 	int index;
 	struct of_phandle_args args;
@@ -573,13 +573,16 @@ static int ti_sci_scan_clocks_from_dt(struct sci_clk_provider *provider)
 		index = 0;
 
 		do {
+			struct device_node *clk_node __free(device_node) = NULL;
+
 			ret = of_parse_phandle_with_args(np, *clk_name,
 							 "#clock-cells", index,
 							 &args);
 			if (ret)
 				break;
 
-			if (args.args_count == 2 && args.np == dev->of_node) {
+			clk_node = args.np;
+			if (args.args_count == 2 && clk_node == dev->of_node) {
 				sci_clk = devm_kzalloc_obj(dev, *sci_clk);
 				if (!sci_clk)
 					return -ENOMEM;
-- 
2.51.0



