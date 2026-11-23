Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=162.62.57.64
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795392649;
	b=R4oMAjDqa3nJFYS3elc/oFc/rnTl22KXLPbHwNwX5/aDmoYFqUWj6VsfvIR0rhGQaG0O
	 ZcHjU7E/hLqY1hpYcL6pxJIJm5PY2rOfDrb7JAuFqXjx3Kmec445M4fUsFMB9PSsxsd5q
	 /jYymC76D92gvv9AveaTYc4us6a5jotkucJRwLF/TyqdJWMWzPtTex9fYVn3jp1Ksz8hL
	 KBDnmkKVJLzGr+m22yO33pb0WCZMcZMSeKFbT3rNeaL7rlcL+YcmvVCMyLoA6aMVJD4wZ
	 ZxjO0kahG6ZRcBel5Uz+G/Px8Un5eMbF7EHsBwwUJsqzAjjvro42Mh57N2v50KJM/Hw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795392649;
	h=DMARC-Filter:DKIM-Signature:Received:X-QQ-mid:Message-ID:
	 X-QQ-XMAILINFO:X-QQ-XMRINFO:From:To:Cc:Subject:Date:X-OQ-MSGID:
	 X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=Quk+i+RLhvm+ITRHRSHRS993N/vU6wVhQmtQekP7shc=;
	b=srBluHlO8FB4ajXOlm4WWxJ/BWP6KMHgezOcMVGMJ6uyw+A5CRCwYR/C/fiG9nd7P+iy
	 cpDhcHL+9iNZGPPe54jg64cJ5Ga9Z7SehaWj+9PDuLqRlsnzK30dxL4X5G2uB6Y9qeqtV
	 Ov/B+oKP/DvaGJopKTvoc5TcgGJgDmpeP1rdEFoEg9EyHx82XuIis3y6e+Oh4utM9el/7
	 RgQu1VClCB/1rXSKlEW/d+2aiBrMLErg+mc0jGWFaSCEmJcnk5HDGqk5jLM3+Lv0LQb5y
	 ILjJL9qVaJRNxWhiGw9cR+KSRDcam1TSa+Rz6VpCaC6d+1xoOV2oo5YP5zlyQPZAoBA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=qq.com;
	spf=pass smtp.mailfrom=qq.com;
	dkim=pass header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=opXAUP98;
	arc=none smtp.remote-ip=162.62.57.64
Received: from out162-62-57-64.mail.qq.com (out162-62-57-64.mail.qq.com [162.62.57.64])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 783CE606A31D;
	Mon, 23 Nov 2026 00:10:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 783CE606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=qq.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=qq.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=qq.com header.i=@qq.com header.a=rsa-sha256 header.s=s201512 header.b=opXAUP98
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qq.com; s=s201512;
	t=1795392637; bh=Quk+i+RLhvm+ITRHRSHRS993N/vU6wVhQmtQekP7shc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=opXAUP98ECNIPzHHTYFhcatQkP88dFwsZ54X0MkK1VSSh7Wi3WY41x5a72qgtgBZO
	 px/X1VIig0djaR4+iWv2hv3TxKKJLfJowaNJoXOHXjCy0cZV4mR2SJykX0pGDGYbO8
	 rnS2MgnWIqawE8/QGBGQhkBOV82/+z5GbBXnTX48=
Received: from jerry-PC.lan ([2408:8249:5f:7101:71a:8713:56b4:5043])
	by newxmesmtplogicsvrszc56-0.qq.com (NewEsmtp) with SMTP
	id 2A1184D1; Mon, 23 Nov 2026 08:10:33 +0800
X-QQ-mid: xmsmtpt1795392634twi6siz7n
Message-ID: <tencent_362F86565B982729D9FAF4092C36DF5C0D0A@qq.com>
X-QQ-XMAILINFO: NAFJfp6T/atIbpMrV/G9srCwmCIGjaHoKLYzKk4QKc757IuZk0lgeclpX8mOY/
	 kDigw3JkmCRVa7d233NPv4QU+G0n1Hqvq7cD+rzA65nFGuZs0D5QBFK9vECRtdgcpeNi5YreUCHs
	 GKolS5WC8x7WkL/otZ2jGo0+mwxyVpz4qgWexvi9MWR2YrudAXpXaS1JaA2A4QsbWrRvf94xXtG4
	 c3n0t2IDsiZnIkAjWQirxMsI074oEru+WtsVXpzYSdkwb/G1znBpZjaUaNrksRWQgQ/zJoyMxa3J
	 1KUX+MQtW0ui/mOo5sT3GBnJ4Rd0t0rnlGjGzA2xqeMc8GNXOCEEnaPW2D8kyC2vo7hcv3xd33f8
	 j03qY4kudsE2HxPQ0uHcte8b1mR4wgSm9iqI/Qian2rzQDxaBtz8VZVz+AluESbtg/c9Q8BAYgAU
	 TzYv9xYl6MG/ZaY+3JUYq5JscFyA6g+hX9OfaGrQB9ZHPwm6Ojr6VSYgjwqkVm+4W4i++vL6yZzV
	 W9Uj8bcTa9lfELbbcpBC7wCWU5fe3+jj0g1ETcyPcSI0twzVld3lmpeAtrZ1iezlaW8hD1Ol6tdf
	 h8XU4KTzmjbnis/KlhBBJgHJLFfZiksCnLVJvjydPPV0BN/WONf/Nwxovtr5y4rvAKkTc4sjTcii
	 YSGxnFAbol98wWycxk/yFJ5tWo9wwQRBlb3FRNdVq+QbhqcF5L5r1I5ymJnZETS87dlbKdnwoPAW
	 /vPHhJA1VIO2GGfJNEEn6MBxQLgSaEimZRnLUcqCMx9LxTbYAPs03jEDWzwPjJeCPaR6mRyDVFvb
	 nKFJhuvwc6afPrp+dlq0RxWRWORd1L1Blb1DPR110UxnUJd3/RtCbR/oaWGzZM6prgMbRNQBYkf8
	 fpjwtKnGG6ZgQbEablmyyf9BOLjof+WUuupcKfOIgGB8oIhV6Vt4l1dcmWV90Rv4xJicks6bzhUW
	 UTXYaEgXtH0heU0UhjXvv2oKKwXf7ZT8aXOqOyMhLj5DNMrxR8uGOuUny1x4BbvWM8r1ubTfd05E
	 4RwMHLi0akmLH2DWkDPCwo6p5ZwcxMPzkrzAYrDxqnSlVcqhdZqoPQaDQ4I2xj8viFV4JARQglEU
	 /2ifPIsVuuVRKROOjqd/0W8ZfgkQ7de0u787W6e58twRe40iUq+nFr6YDBcEX6W0JV1xU7lDPsw7
	 BY6C8eOV8rpbHm4Tv/4LkZ38ZUhbql1bDcTj7ApDDx5zxvFq6MFg9d40Yee5Ck38/xQLk=
X-QQ-XMRINFO: M/715EihBoGS47X28/vv4NpnfpeBLnr4Qg==
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
Subject: [PATCH v3 1/2] dt-bindings: clock: rockchip,rk3506-cru: Add SAI MCLK output gate IDs
Date: Mon, 23 Nov 2026 08:10:28 +0800
X-OQ-MSGID: <7dbf1b4557d7cd9eec7d03838bb169c5db327bd1.1795366993.git.1194781887@qq.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <cover.1795366993.git.1194781887@qq.com>
References: <cover.1795366993.git.1194781887@qq.com>
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

