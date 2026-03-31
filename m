Received: from smtpbguseast3.qq.com (smtpbguseast3.qq.com [54.243.244.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 601723E023C;
	Tue, 31 Mar 2026 08:28:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.243.244.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774945706; cv=none; b=Nz7aL1d2do3JQhU7n3uUglEfSX946nI37N45PKMkms4chpQFo06c52R6ft00VdNClaPrvP7k7/dM1i5fH5WY22hFYcJWx+e1D7G9VZhn6VkoUELZOAJyszKSPeurR3ia1LPccqPuRZKuF6FveGknAnQmRzEeHA6DwmT+r9nwKfc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774945706; c=relaxed/simple;
	bh=mv7b6gV7xcbyvtla4k2qyYdge7fji5fF/G64h63zMqU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ax0LGV//8mD/tblpBWR1KgfGEx9V1TKCu/mLIwmhrdnn1nOXiJ4cn2U2sEKdRo06+I9Z8kuCWw6A4LNro9Bg1EQZELcjBU+Ek1evBy5U82pveNxgn5DB40J1+in3cWeWrFS/UMCrKCrftf54vQ4qM5CrkmNAlL202zhrpiNN3v8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=lNpnK1as; arc=none smtp.client-ip=54.243.244.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="lNpnK1as"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1774945656;
	bh=Studu0k/n9z14zDJV1h1L4Kn9GEQMK1n1wHuQJFah/Q=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=lNpnK1asHpWgYcFYBviHrmJ3weyxxzn+1HaS0pQWL0Q3ymyVUSUuC3G/wrNJEYTRH
	 0gj/hJqXGzOfAYyVFTf/hMqcjW54A7Sfq6vcprtj/ABkKVaEOVfUGFMoSvqfF1XS1A
	 CKnEfLYDD2nAtNH1nk1/QMCc7+pcppNB1CAQotgE=
X-QQ-mid: zesmtpsz7t1774945654td8ab8023
X-QQ-Originating-IP: TQhp/ZrVHPtl+vBXLGoCKFgoAIP7WeyphVUXqGQwDic=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 31 Mar 2026 16:27:30 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9390468519669649579
EX-QQ-RecipientCnt: 20
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 31 Mar 2026 16:27:07 +0800
Subject: [PATCH v3 4/5] clk: spacemit: k3: mark top_dclk as CLK_IS_CRITICAL
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-k3-pdma-v3-4-a4e60dd8b4b3@linux.spacemit.com>
References: <20260331-k3-pdma-v3-0-a4e60dd8b4b3@linux.spacemit.com>
In-Reply-To: <20260331-k3-pdma-v3-0-a4e60dd8b4b3@linux.spacemit.com>
To: Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Yixun Lan <dlan@kernel.org>, 
 Guodong Xu <guodong@riscstar.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>
Cc: dmaengine@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774945629; l=1061;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=mv7b6gV7xcbyvtla4k2qyYdge7fji5fF/G64h63zMqU=;
 b=AJE30IyHx1It2xMUW82/N9fT6bWetRXlmFgLKmw8Qq2CA36y4QcDv+Kg3aitBRBArZkC7n+vW
 M7oN34zm1lnBuDWKmXAGjwRhqvkvhjVlFBXZaYca5YuFLzxZ7drcvnc
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NpQK2HsutDKlISHv1CQePnnWSvlxEVyIWC3wVkDVF2viGUok+bRH48iz
	LRl1u6pGksO34sQPPobRmlTsKUkWSJuCvjl53Z7jW9vSqMcbOGM2dDN7LgEyM3p0y7/QUXy
	fX5S05s7YrUan0L1txsvLcGNOyKVRVPBBztnXLHQucy7LRasAhGIOfO6wxPPl+rOP1eB7MD
	MXO9akVwH7z17v+8Trc8jB7fvjbnKbIZNuNBSytzAS+YmHV0wHFpDfC1Hhw4NW1LoKRDPEU
	KWfakw3B1XHYGFsWD3RCJK32sJB9hePy/0AcPR3NGaS8gxISTcvvzypUGinIoywvZrMlkY6
	6lfdHQgmRrmza4XoVZloKopWH/wzmmIOH2byzvKvkFcnrxWMmnWUzJQoDbanlscKp4OlEmI
	Ci8YflbNnmsvM2ow6i9jyFrIxK7huWIL7J8ZjJzyMKidLoQTxvxMK3dJYUPiJAS4NXorx08
	9CNxkbj8dElKwyqAWU30um9v+Hg1TMMX7y/EPd5d0OaT1Cw+2uB1rerJxavQmujSR8kdj4N
	f57QJIpskK3ae0wxAExJWnl0LrKEYxxVX8a1QN9gDfD6gM+EQo39TZ+M8GgTTmGlIPp6r5K
	zUhYMXwXhb7NC1AztNFyplsH4YDM/elhDB8t17IZOAjfqzcnLcvxuNciZF02cGNSTKt+dBt
	0zcpqvgDCPWgS8o0Z4vYh5crp2QMYaPZc1S1V4wpPxshDqB6oLfM/o7atv+ZgcedXYwsNod
	ynQPAvDbW6GE42Ntd4zI6ZH2h3h7VrM6q6WsBtp90kOgQ9SsgYk1ksZacB9uWXk7V5bAiPs
	qFKNZsYZSQ508X+JC/HH4EBaV3FIdzmuqFdD8z9cC5sqgIg+E03NI3Q7nipFsEC0ZS3AZGQ
	4zFd2bZ2tWsE+oEibmow2rfOKokTt51TC8qSNRQQDtlfurbiky9v/Z1NrEFiOBJZe3vH5Jx
	RogKANw31fBYtCYQCJiNXfRxn7r4l/3dhmqYZ+YzOfyzo/C8I5Cgvhm0scqKtTIw4Yt9JvF
	XlETNg4oA1/m6YENFqnrdCZn0gJBUgc6qD7Fev+ufxRZ+6XzoQY62LCYPOmPPT2MCzuKntI
	bWP/hhJ58+qBJiIV/o7mkCp5T+UPWUhQv3WJP8vGmZhmzhKRdnywetILup3bT1HFqnWreUT
	JAVxajvkQXi1cMT+iKU7hXb6rA==
X-QQ-XMRINFO: MSVp+SPm3vtSI1QTLgDHQqIV1w2oNKDqfg==
X-QQ-RECHKSPAM: 0

top_dclk is the DDR bus clock. If it is gated by clk_disable_unused,
all memory-mapped bus transactions cease to function, causing DMA
engines to hang and general system instability.

Mark it CLK_IS_CRITICAL so the CCF never gates it during the
unused clock sweep.

Fixes: e371a77255b8 ("clk: spacemit: k3: add the clock tree")
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/clk/spacemit/ccu-k3.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/spacemit/ccu-k3.c b/drivers/clk/spacemit/ccu-k3.c
index e98afd59f05c..bb8b75bdbdb3 100644
--- a/drivers/clk/spacemit/ccu-k3.c
+++ b/drivers/clk/spacemit/ccu-k3.c
@@ -846,7 +846,7 @@ static const struct clk_parent_data top_parents[] = {
 	CCU_PARENT_HW(pll6_d3),
 };
 CCU_MUX_DIV_GATE_FC_DEFINE(top_dclk, top_parents, APMU_TOP_DCLK_CTRL, 5, 3,
-			   BIT(8), 2, 3, BIT(1), 0);
+			   BIT(8), 2, 3, BIT(1), CLK_IS_CRITICAL);
 
 static const struct clk_parent_data ucie_parents[] = {
 	CCU_PARENT_HW(pll1_d8_307p2),

-- 
2.53.0

