Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9ACF33F59A;
	Fri, 11 Sep 2026 06:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789106958; cv=none; b=cwTX9Foo+zqAlD4M3DmX2sUPRkbwgqZfGOAOAmJpvtxCnRs+VHBMwnsfX4mdaCX2/1JaSl6H7ets2buz6sGRjmlwmEPJ/k7xdK9ehZ76XDvSDZsga5dt2QlD/g9iMGo2nzSOQlNTkpp+z4xNTF0gGvMBjLcA1MEXj4XE/jT2qig=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789106958; c=relaxed/simple;
	bh=rSZALlgLplgRQJfNYM5NT/CdvQThVI2z28mI4OTN9EA=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=Ih10RTe+q7AokWGPvv1nJPUIEBzcTLdX+tZZBDIcbcSwZPhSBMzPCfUELzXHP+aWlavj9Zm2vhIaF9eFzjSudwVkyY1UTCn6Twjvn1WAYjrnteeBYauf9HgZuSa5lWipO4+UAbgVpOs84L85O+ZQK5lNJD2DCrCWsGLf9brvMgw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=iVJsP1PN; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="iVJsP1PN"
Received: from seu.edu.cn (unknown [221.228.238.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d62c4fa9;
	Fri, 11 Sep 2026 14:09:07 +0800 (GMT+08:00)
From: Slavin Liu <bolin.liu@seu.edu.cn>
To: nm@ti.com,
	kristo@kernel.org,
	ssantosh@kernel.org,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	bolin.liu@seu.edu.cn
Subject: [PATCH RFC] clk: keystone: sci-clk: check the growing discovery array
Date: Fri, 11 Sep 2026 14:09:06 +0800
Message-Id: <20260911060906.94179-1-bolin.liu@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa08f15851603a1kunmfe5ea5821c731d
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDSk4eVhgeGE1LThgeThpOSlYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUpVSUlDVUlIQ1VDSVlXWRYaDxIVHRRZQVlPS0hVSktJQk
	NDTFVKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=iVJsP1PNhpcmDx+yMPKAJ8RKo1XG9ERhO5PtNGi/SEjVwpSt6eN4ejPStpoYBpxe3QR14FMJhCX6Lpyhtt7EBzwSi4wW6at9YhO+oimyG9c5l5XhC7A+MSUs2MY526UnWzoH48DcvuZ3LdQsXoRMD3GiyiYsYAr2QQjtIENcoGk=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=LxpP+BAuFB7ao6BgdJGgtCQvqBcFt+C4zSixfoKRt9M=;
	h=date:mime-version:subject:message-id:from;

Check each newly allocated discovery array before copying existing
entries or publishing its first element. Devres releases prior storage
when the probe fails.

Detected by static analysis and reviewed with AI-assisted source auditing.

Fixes: 3c13933c6033 ("clk: keystone: sci-clk: add support for dynamically probing clocks")
Assisted-by: LLM
Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
---
 drivers/clk/keystone/sci-clk.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
index 9d2094bd48e3..dad2fb67c405 100644
--- a/drivers/clk/keystone/sci-clk.c
+++ b/drivers/clk/keystone/sci-clk.c
@@ -496,6 +496,8 @@ static int ti_sci_scan_clocks_from_fw(struct sci_clk_provider *provider)
 			tmp_clks = devm_kmalloc_array(dev, max_clks + 64,
 						      sizeof(sci_clk),
 						      GFP_KERNEL);
+			if (!tmp_clks)
+				return -ENOMEM;
 			memcpy(tmp_clks, clks, max_clks * sizeof(sci_clk));
 			if (max_clks)
 				devm_kfree(dev, clks);
