Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02D513F6C39
	for <linux-clk@vger.kernel.org>; Tue,  4 Aug 2026 07:04:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785827079; cv=none; b=DxBve937GX7eRZk5TFJnXEgL+ef4bWcVEHQkNiqNr6sIuuhH0d9gV/GLGsvfOdeeB47Iw15hPIf8kfd4AeCKacIy2zCwiyDDDrXUz3cp+5EcMYauFdAhM2a1KQFCbsz6PJynTvPbnljy1pXDHI4ncjma2vMC5+vkjsLMBo2Arkk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785827079; c=relaxed/simple;
	bh=PlQBymtMAAqNDUPQRPsL7JnHYRZ7ZWqu5bfX531CCtc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=UU/ezqFDMcGgyFcW0y/8WohsmI7ZWXYD28uVVuNIOj614ce62pbaVp9tLlADjggPBEQTQBQIs3BlQZGLBaNFWAlhNSy7lbklVXsYaDC5TT+zPEujF87UqJzel5E474Utff1JT+qbHFJkfRWGJ4RqrAGZSUpBtIZDsl9Sru2RvRU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=VRciBhIF; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="VRciBhIF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1785826991;
	bh=rpJs/Hdp1HVbk4XvKcceprK5M09yNTlwySvCQvGJnBc=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=VRciBhIF7o5E1k2alCl4yA4RYM+dReb8gqhRVsL0TaIcjPpHMzLXybN8eZa8LXROU
	 Wyji7wgiLGiEaXa++2T25mne0oeQBFwygV/NO1HjEjIJH1gwaLhhpkHUwQgxUgiWnR
	 H5G0hfAUDfLPixg85yjjYyvPkknsOQz8gptHR2Do=
X-QQ-mid: zesmtpsz3t1785826989t5c85e0da
X-QQ-Originating-IP: Ii9wABQ3Nyx14c//0/sSvM0K+v1BhIofh9n8So9D91c=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 04 Aug 2026 15:03:06 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3563694009911167884
EX-QQ-RecipientCnt: 12
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 04 Aug 2026 00:02:55 -0700
Subject: [PATCH 1/2] clk: spacemit: re-enable PLLs after init
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-k3-pll5-pll8-1800mhz-v1-1-a3a75866ce32@linux.spacemit.com>
References: <20260804-k3-pll5-pll8-1800mhz-v1-0-a3a75866ce32@linux.spacemit.com>
In-Reply-To: <20260804-k3-pll5-pll8-1800mhz-v1-0-a3a75866ce32@linux.spacemit.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Yixun Lan <dlan@kernel.org>, Inochi Amaoto <inochiama@outlook.com>, 
 Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1356;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=PlQBymtMAAqNDUPQRPsL7JnHYRZ7ZWqu5bfX531CCtc=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFmFfYs3ymer2IRen/u2bIebidyKsntNFi/P/lB5mb9wy
 9E3/CcqOkpZGMS4GGTFFFm6H/BsK/CJsi0QKPSFmcPKBDKEgYtTACaS85rhn/VypcZJ/FNj4//Y
 nXpgusAg+lPgvh+zJG0ePW/ePKlD0YDhf93CZUvN09tPf33LrZIiznYzV5jhGWfZnNPXbjPyHpR
 byQYA
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MQdTMy9oLvVBYiRUFBZfYN0WXPHnYkzlMw5i70YvqjgiFEVWrHiIrK1A
	x/HiXE7AqWtUuTuLmLvsUlJ+i/NUkRNXTrr6YmY95ATCERWb/KJ4TeARKfz6CAis+0pkW8X
	sHjenGIbMx0nscF4GOAIB4vHEZi9OjVdHfZ29Ke6VUWRANyyyBt3pD7PNiEPyrPKzvenSFF
	JPINtQMe3B4p4HqsTsbz/FrrIj6sm9ffk9RhR6wojO6K2l8hmpEf996Z3klngREkW6B3CFD
	s5NNylzrDrWdP/3+3OoxLOGdmcRCss2fy5GtTitqMXXscm+D9iI5GfOcWu8vd6jNZ8bcPEN
	MRCJpxQCVNa9JsVsXXCKpo4SO7ONrlf/59IXewoBrwDQ3fU6If+AxtT3ZZQP4xePbHwWTYF
	9mSHfBjdONm3KI1/zU3uruA8RpW71DkEDj1rDhuILG4puvpejpLBDjYORpkJBSRYCUHCUi2
	cgWNTGUj9Lc2Q7u4LYNn0ygmhXTnyWx5gUglViE+/QMQP/AwL4qLrI5nN2hYjB5rHuCbzdB
	kMaugVh3/7F/4fpDSUuEs/JPgvWxLNeeEv6uT0+bBzjQ1kE9CaMWudENAUq4aeHx6J01M/m
	FUWgqrfNh7iSvNaEg3q69FWJEBbNElBNxOFyT0GKojcXTu25yQSiCJ3hztaLhJjp9k9ogPm
	fJG6uUE269eZZVblwP8IZhboJciym7a3NGen3XJfQkme48CfqrcTupZIlirIQdNtdK8lAu0
	0QoehUGsdoZBfxIimqyH80bt+YXqVxVDGnmpAuIuAwNHRAhVH5GRYwJnRsTOo6dFQYbacCk
	YzY6HhJ1XZ6QNTGS4NJwep5Eh9IRdf7NXcLV1My2VGs51AiTeFGnVg6LhPld1Ekbkv79/63
	Y2pqsLnUpicEmpQfJHJnxcbOFEOPcLmLGqradvqVyghTqIefnmv1d9AeflLBCGGU2AuafZc
	sfvWkW52t5zMZ3NZc/Pkd5WzcVaR2P8Ru24TS0ni2EYDoO7YcIZkdEYHDY31qKA8ad6GQnw
	91FJnEi38hLM1NI7IUTCUCjQV9/OOCsmdr3IMvhBAZYZ/isTXsBAAsDt2La+nyvhjtnxSlF
	htO57JzjCUPlpF2zqPFrhIH4erXIt8ouqvwD9YZt9yQ
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

The PLL and PLLA init callbacks gate off and reprogram a PLL when its
firmware configuration is absent from the rate table. However, they
leave the PLL gated off after updating the registers.

Re-enable the PLL to complete the sequence and propagate any lock
timeout to clock registration.

Fixes: 1b72c59db0ad ("clk: spacemit: Add clock support for SpacemiT K1 SoC")
Fixes: 3a086236c600 ("clk: spacemit: ccu_pll: add plla type clock")
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/clk/spacemit/ccu_pll.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/spacemit/ccu_pll.c b/drivers/clk/spacemit/ccu_pll.c
index d4066a0ed452..f9627da0af37 100644
--- a/drivers/clk/spacemit/ccu_pll.c
+++ b/drivers/clk/spacemit/ccu_pll.c
@@ -148,7 +148,7 @@ static int ccu_pll_init(struct clk_hw *hw)
 	ccu_pll_disable(hw);
 	ccu_pll_update_param(pll, &pll->config.rate_tbl[0]);
 
-	return 0;
+	return ccu_pll_enable(hw);
 }
 
 static const struct ccu_pll_rate_tbl *ccu_plla_lookup_matched_entry(struct ccu_pll *pll)
@@ -252,7 +252,7 @@ static int ccu_plla_init(struct clk_hw *hw)
 	ccu_plla_disable(hw);
 	ccu_plla_update_param(pll, &pll->config.rate_tbl[0]);
 
-	return 0;
+	return ccu_plla_enable(hw);
 }
 
 const struct clk_ops spacemit_ccu_pll_ops = {

-- 
2.55.0

