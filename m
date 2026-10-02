Received: from vtj.irix.systems (vtj.irix.systems [82.76.27.144])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405901F1513;
	Fri,  2 Oct 2026 12:19:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=82.76.27.144
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790943570; cv=none; b=i73S/5DR9jJyGwaXXkuq6S+9/95g7bxVJSR3BXomgfd8rao+WWZUePkcbDkbq9s3OyhjhsLPwFnITyHLL93y0pfiD7CDG60Van1Nu/Dlrci6IudI3OB32DAmefEfsoz7jAYQTJL/fwC03HrLeMuufkN7bcmRTAA/ooMA5/unoc8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790943570; c=relaxed/simple;
	bh=cPyrqmna75iREtPF319mu4GzIlWqwALqRpZEQWUizPA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qWGEt/KMQxZMbQ7t33ZmiGcz3lsdqaraRSjdQBQWFDUOlEOxSwjmIb8jDl+t5HNlJuTsOjSBQOQV5xVC9NqQg0oQBJPTR2VvJLFXaLJ0E4JGRoAFObP7Vuvcas6qWzRMwKvm5B4WRo4gyMh1J1rOCc+kYeIpHruKIbQZ3jWnNzQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andrei-z.com; spf=pass smtp.mailfrom=andrei-z.com; dkim=pass (2048-bit key) header.d=andrei-z.com header.i=@andrei-z.com header.b=NNmZxbXI; arc=none smtp.client-ip=82.76.27.144
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=andrei-z.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=andrei-z.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=andrei-z.com header.i=@andrei-z.com header.b="NNmZxbXI"
Received: from MAILGW-DELL.dell.vtj.corp.irix.systems (localhost [127.0.0.1])
	by vtj.irix.systems (Proxmox) with ESMTP id 003C92D8CF;
	Fri, 02 Oct 2026 15:19:27 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=andrei-z.com; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=sig1; bh=ZCqlst6tlY/09lnCd13g
	ayorj4iqwFaUK8GZTJKwFQM=; b=NNmZxbXIDBCy5AC7+i5hszTCg9AIkl2JiUbI
	r6P+6q0JED3etFpJhzer/Tt6lrfuf6CJqYURMPHASo+gyYuQDqosm5b3u0/cJk4x
	T+POYp4qqHYOSrqigV/ZActFb6+vgzXRFtnLEg4gp7vFVv89Yq4mxfeG8FyQocCt
	ADC0o8KJmLsl0SRgzh0zuUCZkj/3g2KBfvF7LDvBVw694bBREzUuWTJI3C8IVJQZ
	nhHww8UzKqnay7gyGI37XCojHyIAzC0vtS9guCIB4s54/pP55GPFWDpmBfYcFpuk
	5X59qSiMMMiTBaQkaclIfZqub1l14nNKeQEjlt3JWFs4yDzUWg==
Received: from VTJ-MX.corp.irix.systems (unknown [IPv6:2a02:2f04:1:9c24::6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by vtj.irix.systems (Proxmox) with ESMTPS id 4C4E12DA67;
	Fri, 02 Oct 2026 15:19:26 +0300 (EEST)
Received: from workspace.corp.irix.systems (2a02:2f04:1:9c23::c) by
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Fri, 2 Oct 2026 15:19:26 +0300
From: Andrei-Alexandru Bleortu <me@andrei-z.com>
To: Abel Vesa <abelvesa@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet
	<jbrunet+clk@baylibre.com>, Stephen Boyd <sboyd@kernel.org>
CC: <linux-arm-msm@vger.kernel.org>, <linux-clk@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
Subject: [PATCH 2/2] clk: qcom: gcc-ipq5018: drop CLK_SET_RATE_PARENT from UBI0 NoC branches
Date: Fri, 2 Oct 2026 15:19:20 +0300
Message-ID: <20261002121920.994608-3-me@andrei-z.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261002121920.994608-1-me@andrei-z.com>
References: <20261002121920.994608-1-me@andrei-z.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6) To
 VTJ-MX.corp.irix.systems (2a02:2f04:1:9c24::6)

gcc_ubi0_cfg_clk is a child of pcnoc_clk_src, and gcc_ubi0_utcm_clk and
gcc_ubi0_nc_axi_clk are children of system_noc_clk_src. All three have
CLK_SET_RATE_PARENT, so a rate request on one of these leaf gates
reprograms the live NoC clock sources that every other peripheral on
the bus runs from.

Each NoC has a single rate anyway, so drop the flag and let these gates
follow the bus instead of setting it.

Fixes: e3fdbef1bab8 ("clk: qcom: Add Global Clock controller (GCC) driver for IPQ5018")

Assisted-by: LLM
Signed-off-by: Andrei-Alexandru Bleortu <me@andrei-z.com>
---
 drivers/clk/qcom/gcc-ipq5018.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/clk/qcom/gcc-ipq5018.c b/drivers/clk/qcom/gcc-ipq5018.c
index 620b9ed72138..37ccdc44a8d4 100644
--- a/drivers/clk/qcom/gcc-ipq5018.c
+++ b/drivers/clk/qcom/gcc-ipq5018.c
@@ -2853,7 +2853,6 @@ static struct clk_branch gcc_ubi0_cfg_clk = {
 				&pcnoc_clk_src.hw,
 			},
 			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2907,7 +2906,6 @@ static struct clk_branch gcc_ubi0_nc_axi_clk = {
 				&system_noc_clk_src.hw,
 			},
 			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
@@ -2925,7 +2923,6 @@ static struct clk_branch gcc_ubi0_utcm_clk = {
 				&system_noc_clk_src.hw,
 			},
 			.num_parents = 1,
-			.flags = CLK_SET_RATE_PARENT,
 			.ops = &clk_branch2_ops,
 		},
 	},
-- 
2.47.3


