Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E982A4436A;
	Sat, 26 Oct 2024 07:34:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.249.212.191
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729928077; cv=none; b=DG0FrVPyNdE06W0r4hQ1ARwvMYT5Z/tJSbABa0/4zqsa215vvWiYpFgPFdDIGjXoWTULLGGVf04Ji014YdOpUyywdrMk69PQqk2yJf1GGVCq/D4dGwzoMf4Q7xPvNcivfyot27RL1iJnjAvxB4WgvQxBXaPu/ZjsSiu5FgixLPg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729928077; c=relaxed/simple;
	bh=gK6X9hMg+YlJBU0ffnq9HX2/9dW8lyP0eQfyfJiUkwo=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=ezG1ROG7Zs4R7yK2BhmUbwDDbJuqGPUCVVCv/jrkvianaQ1uZXo9fWD+rmg5lpdRtbDWeGjOtIebizarEOl+XRFrGd3RzeUDHYSySC/jWeRpvfERhcHEMjQZKy8ctVg9j4pVcU+H7lfY/xUd2iW22p8OupNEMSrM6vv+UDLDh4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com; spf=pass smtp.mailfrom=huawei.com; arc=none smtp.client-ip=45.249.212.191
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=huawei.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=huawei.com
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4XbBFr3W0qz1jvrm;
	Sat, 26 Oct 2024 15:33:04 +0800 (CST)
Received: from kwepemd200012.china.huawei.com (unknown [7.221.188.145])
	by mail.maildlp.com (Postfix) with ESMTPS id 25CB818001B;
	Sat, 26 Oct 2024 15:34:31 +0800 (CST)
Received: from huawei.com (10.67.175.84) by kwepemd200012.china.huawei.com
 (7.221.188.145) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Sat, 26 Oct
 2024 15:34:30 +0800
From: Zicheng Qu <quzicheng@huawei.com>
To: <mturquette@baylibre.com>, <sboyd@kernel.org>, <lars@metafoo.de>,
	<mturquette@linaro.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
CC: <tanghui20@huawei.com>, <zhangqiao22@huawei.com>,
	<judy.chenhui@huawei.com>, <quzicheng@huawei.com>
Subject: [PATCH] clk: clk-axi-clkgen: fix division by zero in axi_clkgen_calc_params()
Date: Sat, 26 Oct 2024 07:23:44 +0000
Message-ID: <20241026072344.976154-1-quzicheng@huawei.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemd200012.china.huawei.com (7.221.188.145)

In the axi_clkgen_set_rate() function, parameters fin and fout are
checked in advance to ensure they are not equal to zero. However, in the
axi_clkgen_calc_params() function, they might become zero after /= 1000.
This could lead to a division by zero error when calculating
fvco_max_fract * d_max / fin or DIV_ROUND_CLOSEST(fvco, fout). The same
issue occurs in the axi_clkgen_determine_rate() function, where there
is no check to ensure they are non-zero.

Fixes: 0e646c52cf0e ("clk: Add axi-clkgen driver")
Cc: <stable@vger.kernel.org>
Signed-off-by: Zicheng Qu <quzicheng@huawei.com>
---
 drivers/clk/clk-axi-clkgen.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk-axi-clkgen.c b/drivers/clk/clk-axi-clkgen.c
index bf4d8ddc93ae..369b15a2660e 100644
--- a/drivers/clk/clk-axi-clkgen.c
+++ b/drivers/clk/clk-axi-clkgen.c
@@ -344,7 +344,7 @@ static int axi_clkgen_set_rate(struct clk_hw *clk_hw,
 	uint32_t filter;
 	uint32_t lock;
 
-	if (parent_rate == 0 || rate == 0)
+	if (parent_rate < 1000 || rate < 1000)
 		return -EINVAL;
 
 	axi_clkgen_calc_params(limits, parent_rate, rate, &d, &m, &dout);
@@ -392,6 +392,9 @@ static int axi_clkgen_determine_rate(struct clk_hw *hw,
 	unsigned int d, m, dout;
 	unsigned long long tmp;
 
+	if (req->best_parent_rate < 1000 || req->rate < 1000)
+		return -EINVAL;
+
 	axi_clkgen_calc_params(limits, req->best_parent_rate, req->rate,
 			       &d, &m, &dout);
 
-- 
2.34.1

