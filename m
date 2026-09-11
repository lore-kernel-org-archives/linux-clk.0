Received: from mail-m49198.qiye.163.com (mail-m49198.qiye.163.com [45.254.49.198])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 297E33EA963;
	Fri, 11 Sep 2026 06:09:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.254.49.198
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789106970; cv=none; b=gOhCSBNoQ61n1xtsHuO3PcagevNxYD++Ou+YDfGmULz9EuDM+wBkulyfGZ9toPp2Ll0tJK7cRgKoFlG668OrL2QpPlWHPS3aZaqcxBHSXwBhUSxeu0Ll4wuSvzAe4jg+V/5PxOKmbzmLY16OY5UtZI/znOOfLYCqNrw6eEe3RKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789106970; c=relaxed/simple;
	bh=/d19UCf96Cjuu9WwPQCjyH7tSj4B2fhjZeME/sK3eLs=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=UqMqPf3a3bVlfAPvFcsCQncOvPEzgRjlkCA7ZSwVjMFY4TsAI05FKbmmXz5CQeoHCzh1GtUFSWjwgq85Bf5cD26zgTg5C0zUNyX7RCcmumjXVlFmJYRAdoxZdKVZVoMXXLF8vBN8o5BGhAi+d/xIE25rvB7ZrC5FTtVg6zyBd08=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn; spf=pass smtp.mailfrom=seu.edu.cn; dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b=a4kXgqe7; arc=none smtp.client-ip=45.254.49.198
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=seu.edu.cn
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=seu.edu.cn header.i=@seu.edu.cn header.b="a4kXgqe7"
Received: from seu.edu.cn (unknown [221.228.238.82])
	by smtp.qiye.163.com (Hmail) with ESMTP id 4d62c4fb5;
	Fri, 11 Sep 2026 14:09:19 +0800 (GMT+08:00)
From: Slavin Liu <bolin.liu@seu.edu.cn>
To: biju.das.jz@bp.renesas.com,
	sboyd@kernel.org,
	bmasney+clk@redhat.com,
	jbrunet+clk@baylibre.com
Cc: linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	bolin.liu@seu.edu.cn
Subject: [PATCH RFC] clk: versaclock7: propagate all xin lookup failures
Date: Fri, 11 Sep 2026 14:09:18 +0800
Message-Id: <20260911060918.94343-1-bolin.liu@seu.edu.cn>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa08f15b4a203a1kunm75fda27f1c7343
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDHUJMVhkeSE1MGUwZHkpPGVYeHw
	5VEwETFhoSFyQUDg9ZV1kYEgtZQVlJSUpVSUlDVUlIQ1VDSVlXWRYaDxIVHRRZQVlPS0hVSktJQk
	NDTFVKS0tVS1kG
DKIM-Signature: a=rsa-sha256;
	b=a4kXgqe7AZYRME7fKqv100IzTMaAxInKFu2YhbRcf59DZr1lG3JL/X2v+GzH2bT1CcHk8xxmlt/gyraC0r9se7BulfMxb2wUJfAdqXCgf0zplcGctCpsCdmcFLYn44ItOvMizwodVfe0bfUrOf6r1WCxqKcpAlV01Ni5NpFjh/U=; c=relaxed/relaxed; s=default; d=seu.edu.cn; v=1;
	bh=cTU7Yfjzu1O6TPbDrXH38ElIx3aHmrJBn1VAPbJi6hY=;
	h=date:mime-version:subject:message-id:from;

The xin clock is used to obtain the APLL reference rate. Handle all
lookup errors, not only probe deferral, before clk_get_rate() can see
an error pointer.

Detected by static analysis and reviewed with AI-assisted source auditing.

Fixes: 48c5e98fedd9 ("clk: Renesas versaclock7 ccf device driver")
Assisted-by: LLM
Signed-off-by: Slavin Liu <bolin.liu@seu.edu.cn>
---
 drivers/clk/clk-versaclock7.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/clk-versaclock7.c b/drivers/clk/clk-versaclock7.c
index 1340d2f512be..5f32d3fb807a 100644
--- a/drivers/clk/clk-versaclock7.c
+++ b/drivers/clk/clk-versaclock7.c
@@ -1117,8 +1117,8 @@ static int vc7_probe(struct i2c_client *client)
 	vc7->chip_info = i2c_get_match_data(client);
 
 	vc7->pin_xin = devm_clk_get(&client->dev, "xin");
-	if (PTR_ERR(vc7->pin_xin) == -EPROBE_DEFER) {
-		return dev_err_probe(&client->dev, -EPROBE_DEFER,
+	if (IS_ERR(vc7->pin_xin)) {
+		return dev_err_probe(&client->dev, PTR_ERR(vc7->pin_xin),
 				     "xin not specified\n");
 	}
 
