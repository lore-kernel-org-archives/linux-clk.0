Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=43.163.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795394332;
	b=jStq3OolcOC4w7UcddeXPysHleJqo7lmbA5A3Qki/qltwEjfahe1ohH/zeJYY2oPCGod
	 /4IvHA/NPNgUz4+OiSfw0MHHehlgCJGa4GrRcVBwRaYNH75Kny6PzxdMWMoWA03Xa5BTx
	 ndKqxXyZMpi0XXloZkNi+nlnqCrzTbpRKhtKN7amc/hLy7+FleZxHR2hzvA6L0uNFM2Y/
	 0Lu1PdgM5hs5op9qVwfOg4KupHUyoGJqveRk2Mj5kQB6OfHxXiiOSDXTsAvzTYMAnaAdO
	 FFH0yBmVD1GH1rTXbxnGHCTGBUhjy21q1ebZW3AYUZrHcHyiEeLXv5CundudLKfx7WQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795394332;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Quk+i+RLhvm+ITRHRSHRS993N/vU6wVhQmtQekP7shc=;
	b=RvTYbZxYIsnvdeJihPRCm5mtLZPbq6YRYQP0ZIbDfKFr9KAgWhmwre5OixSD5+zDgAT/
	 ktIgrQs/as5fJnfg3LYytAv4Vnpu1hfOPHj3Okckc/6XYXoFX/p0ZfHG8+xLYLAiTFKfV
	 AfJchq2i6rqnrePkfmuMA3bpjVxMCJN/pfinm7nhyFNAo7h7szMoA8dy1XU96rfL8Y/6T
	 4gmJ1bnfM5A9xEk2pwfTV1XZzAr2QuHze41ANdOTaxgzPtjcWuwupVmWkgzorwrveNRLA
	 1VCsPOfq3qO9bufBpEihjvsMY28MREQWaqZwF3qEcYz1BMJLfUJPzquyUNYY9gad1YA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=gwQRCdz5;
	arc=none smtp.remote-ip=43.163.128.52
Received: from xmbghk7.mail.qq.com (xmbghk7.mail.qq.com [43.163.128.52])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97E9606A333;
	Mon, 23 Nov 2026 00:38:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A97E9606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=gwQRCdz5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795394324; bh=Quk+i+RLhvm+ITRHRSHRS993N/vU6wVhQmtQekP7shc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=gwQRCdz5TLOlZvOs1+mTn0EQGSKJ71FPPa4BO6q0OR1JcxgFaIAczMN6jbnheEl4L
	 L4udtxrTuKwX1nG7HTKmL+evfKTyfwIc8JWNZCJQbnOGfuk5WpzRXjR2ejH6Nf5jM9
	 LNkbcjU4y9ObkmujXUPs8553x9hBQA50ozRscox8=
Received: from jerry-PC.lan ([2408:8249:5f:7101:71a:8713:56b4:5043])
	by newxmesmtplogicsvrszb51-0.qq.com (NewEsmtp) with SMTP
	id 9A63524B; Mon, 23 Nov 2026 08:38:38 +0800
X-QQ-mid: xmsmtpt1795394321tibpj7gpb
Message-ID: <tencent_6A1DF318251B1F7D01E6E6B8AB9A45E3EA07@qq.com>
X-QQ-XMAILINFO: NM1flO+R30QG4TXeUNfdyw7rjdk2yIB6EJ7b8AMe5egQjr2bORbeQ8x2zjIIia
	 5J1XD6joABVL4+vdbW2sZE6WV/tf8b5ecZYkORPUslR9ESaCxZdmVmm1tKVQdHWrflRvoA+yec6B
	 tf/yosJwDMKAMwlurLlNlZhg8+uur2cVHF5D1juqOm/adSBRg6Y5xC6soj8FY5O8aufKUrLoETsV
	 i4XhB4pwt6vf5LaQiiFdZOxLI7kQzBW6i/JZUmQqzzYVeKcr8nW8IRoTTsIntoZ2YIdvmVtIwdA+
	 Y9ms3aa8cXi60tYAkmFvKMQWS3sZIy3KmOLWeTtqnrzl7OHOElr/NFl8ExOZAB3c7xCtvUOph8aZ
	 zla1/ZJdffc17UA00LQq1xo/zpfj4re0VayHNQdM0fxpzl5ZB/q0+bU9X7CGMzEXabNIFcBhfWX9
	 w4WxbWsD2mRnjHy61zzgVrlTErdLwW6wSipS1hwsjSvBFTez5I1jXyl1/bRormo+XlTt0rQLxRA+
	 MbZCXHRrJ0/mKxzVZAEBNke7yCddSuXKItRhZjJNN8NeO3XOqgmYDiX0EFu3QgKvQlql36fia+nm
	 AtzEQVRf8jIzpk0EnInqdq52kIkvpHP58UZ1EslGuRthqXxxE464S5gOGTILtMZ39yKmZ365gRcI
	 WqkReuNFG/J/2erwQUoPajbs6WsJQSsECR6X4JIiFOPRmB6hUUlWvRR8S9347rDEYTFAcGwr7jUE
	 llfcEyO0okqXdpzkBgipoWDzDh89UW5YXXbZWIg8SoAY8e2Rg/JPvRSLz6W0gbW591EBMyMatwOM
	 HxzfYVH0mqV1UaNVp9KcM/JI0SOmYSpVnPmdBB2g0YpzTdEF1NwR5HF1seLALfOsCcTG26r8yocY
	 qadZiVhcYwRbBvMKuBoIxnjM67Srx6g/yxzMGtq0QNxRHomGmJGnGMKJ9N7acM0YP/gqBtlKoqED
	 Kih5JEs1kboOkk6He1ZAtAiqB4agv7iIXiLcMx0ke297spHuiBPb9hvPhfclQCIj2HSHiLaLarKb
	 CJEATIhGS2E4zWPxBNg0GakQZ9yoEo5jBFeKFJWScvMuhzQ590bxBVsrikKITeo5CyRth23mj1+P
	 fkLz7Q5xbs71Et7GwSr2B7S4I5HMfIe9Fsa08C3UEiSDruAziQqSYAgnWAGSJXyh9OaeJ8b8NGbl
	 bbBrQFW/RBLwMpWWUq0Z/+lbjmzfp30UiYFXPrj7chPW7AW7FcO7Z7JlG3yyXYmICYA2IFP/0E8G
	 VmkA==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
From: Xiangyu Zhu <1194781887@qq.com>
To: Heiko Stuebner <heiko@sntech.de>,
	Stephen Boyd <sboyd@kernel.org>
Cc: Xiangyu Zhu <1194781887@qq.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/3] dt-bindings: clock: rockchip,rk3506-cru: Add SAI MCLK output gate IDs
Date: Mon, 23 Nov 2026 08:38:35 +0800
X-OQ-MSGID: <1d48a3116456de6a3f236aa852fa99a515a4b7e3.1795394137.git.1194781887@qq.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795394137.git.1194781887@qq.com>
References: <cover.1795394137.git.1194781887@qq.com>
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

Add clock IDs for the four SAI MCLK output-to-IO gates of the RK3506.
SAI0 and SAI1 are controlled by bits in the PMU GRF, SAI2 and SAI3 by
bits in the system GRF.

Signed-off-by: Xiangyu Zhu <1194781887@qq.com>
---
 include/dt-bindings/clock/rockchip,rk3506-cru.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/include/dt-bindings/clock/rockchip,rk3506-cru.h b/include/dt-bindings/clock/rockchip,rk3506-cru.h
index 71d7dda2..708502db 100644
--- a/include/dt-bindings/clock/rockchip,rk3506-cru.h
+++ b/include/dt-bindings/clock/rockchip,rk3506-cru.h
@@ -281,5 +281,9 @@
 #define CLK_V0PLL_REF			268
 #define CLK_V1PLL_REF			269
 #define CLK_32K_FRAC_MUX		270
+#define MCLK_OUT_SAI0_TO_IO		271
+#define MCLK_OUT_SAI1_TO_IO		272
+#define MCLK_OUT_SAI2_TO_IO		273
+#define MCLK_OUT_SAI3_TO_IO		274
 
 #endif
-- 
2.47.3

