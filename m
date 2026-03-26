Received: from bg5.exmail.qq.com (bg5.exmail.qq.com [43.154.197.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30F553B9D8F;
	Thu, 26 Mar 2026 08:19:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=43.154.197.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774513180; cv=none; b=AK+70TqRaN8H374Xf5WTSSP8UateVrNjtLVbfb23Wdnpxyc6hKBcxHRRokqkvzGukvP2uK0z8kZJZmEolGUKMK1ZWhGrpUuha5aLp3z2zzeQ2NOq1jUlaits043h6OCS0/QmNSGEpXWOqaPdxkGCXwFH3RrVqH40XXaYS47rgR0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774513180; c=relaxed/simple;
	bh=mv7b6gV7xcbyvtla4k2qyYdge7fji5fF/G64h63zMqU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=TwYZ4zl9CeFby9PjMinMfGqDkGN9d4nZz/ZxCoPOpY15zOj6hXHI7Q8ZC6Asb39ZVMBaRevXa218pu3kIQwM9DiMVZk+x5sOLJ29f7pHTuAXumVn/RjsIdThPTzhIL1QMOcuxPgOy87RQcmASpqXzJ5L67SCr/V8txMFTlU9Q5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=kqg/px8U; arc=none smtp.client-ip=43.154.197.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="kqg/px8U"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1774513107;
	bh=Studu0k/n9z14zDJV1h1L4Kn9GEQMK1n1wHuQJFah/Q=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=kqg/px8UYGFPmkLHRUUpCwSfAxigmicLLRHoFKJbjDNL7fAupcvpU8FfflN8nWL40
	 loWPixfTSKZs2dUgEd8lZBbxOwn1ux8xlw3K6dJ4JkrDPpc+bhznbh09/vJtFkMNr8
	 3KXpsDlshwnPmgy9Wk8AfZwsQjXrwxZb7APUA9Tk=
X-QQ-mid: zesmtpgz7t1774513105t6cf23f4d
X-QQ-Originating-IP: rhkr4OIM8wOQVb3/TfoSlxRrCFVj2YHp4XOnKSG7UTo=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Thu, 26 Mar 2026 16:18:22 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 15177264318608331693
EX-QQ-RecipientCnt: 20
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Thu, 26 Mar 2026 16:17:21 +0800
Subject: [PATCH v2 6/7] clk: spacemit: k3: mark top_dclk as CLK_IS_CRITICAL
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260326-k3-pdma-v2-6-ca94ca7bb595@linux.spacemit.com>
References: <20260326-k3-pdma-v2-0-ca94ca7bb595@linux.spacemit.com>
In-Reply-To: <20260326-k3-pdma-v2-0-ca94ca7bb595@linux.spacemit.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Alexandre Ghiti <alex@ghiti.fr>, Yixun Lan <dlan@kernel.org>, 
 Vinod Koul <vkoul@kernel.org>, Frank Li <Frank.Li@kernel.org>, 
 Guodong Xu <guodong@riscstar.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-clk@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774513072; l=1061;
 i=troy.mitchell@linux.spacemit.com; s=20250710; h=from:subject:message-id;
 bh=mv7b6gV7xcbyvtla4k2qyYdge7fji5fF/G64h63zMqU=;
 b=AOZZbqkbKXvFEXN8Ag51jUtNqfdKDsTUTnUdwSv5MzkOfejmRsTFHaeaDzqMP9iF7BGm5GZHK
 e9IQCiLlgqpDP/0lAuZ9ONcn+xlmOpjVoG9KAYrYXa+daCVUvsWCADP
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=ed25519;
 pk=lQa7BzLrq8DfZnChqmwJ5qQk8fP2USmY/4xZ2/MSsXc=
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NoILeipjSpyOq0pzlqeFLWPuhc04CdLhScFKY+cNFlWnwwkukElxRKan
	bvi4rjsbQ3ILCiIEb+qHqxB3DTWiRj75innV+I4F3O/B6cIQGmKFBCsGpxXDrzFIb351h0p
	ZwiCJzeY9ufLdTTLFUV+CI3OOnSyVPFo2oA9U27hq4zkBQv1EJBEHZYTl1WmjM55CEJ+Nuw
	7VT2QEnA71mOsTu2dAa+LylL5woEUxTPYD4lZWdWqAsLGURGCtoUkbjtVFPHiVIzZSStKcL
	wxAg8ew9Y9kRy53k/d5qg+nfiY6VfZGikO7hHH5KoJZRdxcesvj07Ifbx9YNZ/+PKa/mbtc
	JfCdx8jCnNrR07I/3w0cboco14ZGHOKRbYXq0cvQMQ5/HeoMCWqXDZalVa5Ic30v373Kyrb
	u27JZtwQLD7bcXNGUbu9B/araWTcGPuBbWmQv/53Tz4Tmn349bDaXKuiOoiKKUFRsJFHZrH
	G03zRhar/DtRGw9rGJpsl/TiQUdnlQn+Yky1sQK0XvxG1BinH8elxQ8bEgTcP6PzKkWj7WF
	Dfn+WzeQj2VhAE3X8w4gd/DHl04E2zsoFCktYiPqJwBbnFWmBjwngC0XtIjZpzI+d4eWmE8
	dRFjuvOvwtwYRvI1cBw2OVJ3rWeq3kG3Oe0JqAe5a79OFHsyWGBj6MhBBWfNuK0I+YmhGXq
	k9eRw5DXNCw8GTFk0gQamrprIYC2JdAX7YdqDWJBjkYKFy+Spx9nLHdkcUsKX/wSFoq8ExY
	PDEWnZlPqmQnc8uxj2QjrmvpyIhgOqXRTZ93SMnFRJFRi+eFyu7FXsEiaG0pdp55M5Dofr8
	IIYgoNHGMHWiODEeBCtPMU7818wgMsQdxtBk1V25HxzrkRyJCdWEdP+CTvi0vlM///AAx99
	YIx+nORHiImvMgdt3R1XP3TbrNGDJTAm0ollJ+LFxyyrGSYI356+AkKKsRyL70janHuSMcP
	0xweNOImRX4oFJ5hXnl4u2RddrIL1H8sGVkcssc2aQKmLE78uIp2vXGs3jY9QfZrq5CsSoy
	JyCdeuEWpQFoQU2HmNJ8jWmJSRY/0grD5kGBdjcok6WDlOkqqhjbkBkbexxZeu0cseibccu
	ImlKcLSqzcuFi+USD5TZU99JqaiMmXXM0johuhdyqsLLHU77QHIEnE=
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
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

