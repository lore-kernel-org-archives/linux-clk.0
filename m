Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.2])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36C9342B75D;
	Fri, 27 Feb 2026 15:16:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=220.197.31.2
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772205417; cv=none; b=E+Yd5z5dxrpBzEVsPsDoa2fJHl40y8HfnCienK9Vc2EvtyOYiPr5n+ppyBqSm5uM5BvtApG36Du0Lb1XV6o3YiO3KSI3wGkNzz2wK9S15GP8BjLmLi/4hYQh/Ee0mC34vFR6wKM1b5jp8cvq4BKZ2loQAwBBVqrp6P804EQVq/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772205417; c=relaxed/simple;
	bh=X7wBPTeN5Jcarc1LFGnTR9WMnaXfAgR8dPgPJW7oSIg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e66/go7G1CvIyuZUfXtR2O/uDvVwVLor1gNAGoToHaI5FzM/4TO6+WsCPQmEnG+qCaPzafzGIIizv79Oin1Ue94GEU1IpIxbWrn+7Suqt4KegQtQh+zRHQTIB3KXZLkaspw6wc6W6HpGLEbzjkn5F8MExKawWevRadW3swRQ29Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com; spf=pass smtp.mailfrom=163.com; dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b=ovejl7fM; arc=none smtp.client-ip=220.197.31.2
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=163.com header.i=@163.com header.b="ovejl7fM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version; bh=hV
	f/sLLyMfBbOFMouNBS3a/wY4p35CZfpPTEALfC59E=; b=ovejl7fMMWqfiqOUD9
	2OlhRjKmEAnmTTxFaebBWmIEvb+XCUQdhCeS7UeUrSTdFkxcO9wkpETIZFhmLcPA
	7GFLaEiep5dkYMwScwkzYXKL2MGGAQwAIkAsnUTivpbugnKWRDz3QyJ+bBxllM22
	F/P4FXo5s6mtFQPbWNmWFlccw=
Received: from haiyue-pc.localdomain (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgD39_A2taFpCwnpPg--.7205S2;
	Fri, 27 Feb 2026 23:16:09 +0800 (CST)
From: Haiyue Wang <haiyuewa@163.com>
To: linux-aspeed@lists.ozlabs.org
Cc: Haiyue Wang <haiyuewa@163.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil+cisco@kernel.org>,
	Jammy Huang <jammy_huang@aspeedtech.com>,
	linux-clk@vger.kernel.org (open list:COMMON CLK FRAMEWORK),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2 1/2] dt-bindings: clock: ast2600: Add reset definition for video
Date: Fri, 27 Feb 2026 23:13:14 +0800
Message-ID: <20260227151602.829-1-haiyuewa@163.com>
X-Mailer: git-send-email 2.53.0
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgD39_A2taFpCwnpPg--.7205S2
X-Coremail-Antispam: 1Uf129KBjvdXoWrKr4rWr1kur17try3uFykKrg_yoWkGwc_C3
	srZw4DJr1fZrZ5KFs0yF4DJw4rt34UAF9aqr90vrnIkrWYyrn0gFs5XrZIy3W8Gan3AF97
	AasYgw1fZFs7GjkaLaAFLSUrUUUUjb8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUvcSsGvfC2KfnxnUUI43ZEXa7xRpyIUUUUUUU==
X-CM-SenderInfo: 5kdl53xhzdqiywtou0bp/xtbCzRo+qWmhtTo0-QAA3O

Add ASPEED_RESET_VIDEO reset definition to the ast2600-clock binding
header. It is required for proper reset control of the video on the
AST2600 SoC for aspeed-video driver.

Fixes: e83f8dd668ea ("media: aspeed: Fix dram hang at res-change")
Signed-off-by: Haiyue Wang <haiyuewa@163.com>
---
v2:
  - Fix checkpatch.pl warning, and send dt-bindings as single patch as
    the submitting-patches guide.
v1: https://lore.kernel.org/all/20260227123837.70079-1-haiyuewa@163.com/
---
 include/dt-bindings/clock/ast2600-clock.h | 1 +
 1 file changed, 1 insertion(+)

diff --git a/include/dt-bindings/clock/ast2600-clock.h b/include/dt-bindings/clock/ast2600-clock.h
index f60fff261130..7b9b80c38a8b 100644
--- a/include/dt-bindings/clock/ast2600-clock.h
+++ b/include/dt-bindings/clock/ast2600-clock.h
@@ -124,6 +124,7 @@
 #define ASPEED_RESET_PCIE_RC_OEN	18
 #define ASPEED_RESET_MAC2		12
 #define ASPEED_RESET_MAC1		11
+#define ASPEED_RESET_VIDEO		6
 #define ASPEED_RESET_PCI_DP		5
 #define ASPEED_RESET_HACE		4
 #define ASPEED_RESET_AHB		1
-- 
2.53.0

