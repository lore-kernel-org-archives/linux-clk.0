Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=194.199.235.221
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794949255;
	b=ZHULfrhpsbzVkc7PEJIdGJiJcVZKqhSAerT+VhN94HYS3luzxnX1WY5RLpuNGGAz1k44
	 tQcZv/7ciLJ3OOxTSq+z8jNoHn+zcHOCC0y8PqWRxaFxYNtM1V1aNFGnTc5MEcpE8PswP
	 a0jZ1W0ZGjjmNqNvV3bZyajPcHnjCfyzhqvq5zwcGRnSRlALRer3d/WjDb37q/eNVwX7A
	 xWuIg1jm4SqbUA3BqWFFnRzt1iBitZhc7GqHJpnbS3WLGVI3xywG6BBbZzVZxlT3Xy4P5
	 niQHJbTH8zri+lroq2lEHivj1ZDsenxSpxL7zzQgCI8TuyRsloNVyGLG/9O9X2YOakQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794949255;
	h=DMARC-Filter:Received:Received:DKIM-Filter:DKIM-Signature:
	 X-Virus-Scanned:Received:Received:From:To:Cc:Subject:Date:Message-ID:
	 X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=zKE7LOjuE8R61pXnC7DCd6CJseLuy7O1djF3vybCZY4=;
	b=x5p0vyUhlk2Bx9oTMtUj9Cfda0dAhIA5v6nNn19l+gROGbGg1HcvpaV7ZKYM+Z71Yyjg
	 Hi9G6yGHCbgs/1I4xG2DAPV1879k11u2csZjEzAOz+6PyUgMZ44WvV1Y06dWZRm152gmm
	 KVbAFW3e+Ai0WhV23EeTpE7Cm2GaeOv035EcvOAIATS0VJcR6VLYokpKvjUC7VFjfbytQ
	 CX4Iaef9xdQMxJUGGtzOYks/yUQiTwjVL70ApC504VQBP5nipaIwx70HFBc1G3vXldgOO
	 14Wr/gRKmCjyH7QqFJRh5aSaYfDMMK50E7+WEAuT/63fqrB5ESaB6zsJmX0Bzqk9nlg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cirad.fr;
	spf=pass smtp.mailfrom=cirad.fr;
	dkim=pass header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=Q2UhN0Bq;
	arc=none smtp.remote-ip=194.199.235.221
Received: from retz.cirad.fr (retz.cirad.fr [194.199.235.221])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCFD2606A338;
	Tue, 17 Nov 2026 21:00:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCFD2606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cirad.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cirad.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cirad.fr header.i=@cirad.fr header.a=rsa-sha256 header.s=573E3878-7916-11F1-BF4B-F68474317960 header.b=Q2UhN0Bq
Received: from retz.cirad.fr (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTPS id 8625820D4EBC;
	Tue, 17 Nov 2026 22:00:53 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by retz.cirad.fr (Postfix) with ESMTP id 61AC420D531A;
	Tue, 17 Nov 2026 22:00:53 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 retz.cirad.fr 61AC420D531A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cirad.fr;
	s=573E3878-7916-11F1-BF4B-F68474317960; t=1794949253;
	bh=zKE7LOjuE8R61pXnC7DCd6CJseLuy7O1djF3vybCZY4=;
	h=From:To:Date:Message-ID:MIME-Version;
	b=Q2UhN0BqMcskmlPAPwUW+MBaw+AzXNVySTnUvQ6oBTmeMf+VmYOmzxb0XJMICz2rK
	 rjFthN+4l4sfENBkOB68QY3x9t7dkKrcjh31UF0A6vV73Ah8gDOLmeGxkfLVnDzQvB
	 nqlYDgTd00YTs8i39JN1Nbg3R7kPkdQXDBhgZtQw8cgiyNZiJhgysckjfwBmxzvMFt
	 KvrKLkgDhxhSVR2zKsVqadwSct859IhhQzhF/phsRPdrY0lAKYw/0qb6qrgmv7g/kG
	 jaH/qz4shX0a2nvntmAb0QH6bMvGyauTCSRj4KVEk6wdy+MFg6OaMgE6QdCrgI3YdH
	 F9zSCvK6AWzPg==
X-Virus-Scanned: amavis at retz.cirad.fr
Received: from retz.cirad.fr ([127.0.0.1])
 by localhost (retz.cirad.fr [127.0.0.1]) (amavis, port 10026) with ESMTP
 id NVrKEnwF_wLb; Tue, 17 Nov 2026 22:00:53 +0100 (CET)
Received: from localhost.localdomain (78-196-243-100.subs.proxad.net [78.196.243.100])
	by retz.cirad.fr (Postfix) with ESMTPSA id 3FD6A20D5578;
	Tue, 17 Nov 2026 22:00:52 +0100 (CET)
From: =?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
To: Stephen Boyd <sboyd@kernel.org>,
	Yixun Lan <dlan@kernel.org>
Cc: Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Troy Mitchell <troy.mitchell@linux.spacemit.co>,
	Haylen Chu <heylenay@4d2.org>,
	Hung-Chun Tseng <alan.tseng.cs@gmail.com>,
	Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	spacemit@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	=?UTF-8?q?Fr=C3=A9d=C3=A9ric=20Mah=C3=A9?= <frederic.mahe@cirad.fr>
Subject: [PATCH 2/6] clk: spacemit: k1: Keep pll1_aud_245p7 enabled
Date: Tue, 17 Nov 2026 21:59:47 +0100
Message-ID: <20261117205951.140146-3-frederic.mahe@cirad.fr>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20261117205951.140146-1-frederic.mahe@cirad.fr>
References: <20261117205951.140146-1-frederic.mahe@cirad.fr>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Accesses to the RCPU2 block (0xc0888000) hang once pll1_aud_245p7 is
gated: the CPU stops responding, even to NMIs. Nothing claims this
clock in mainline, so clk_disable_unused() turns it off at boot, and
probing an RCPU2 PWM afterwards hangs the board. The RCPU2 clock and
reset registers live in the same block.

Mark it critical, as was done for the K3 RCPU clock.

Tested on a BPI-F3: without this, probing an RCPU2 PWM hangs the
board; with it, no hang, also with no PWM in use.

Written with help from Claude (Anthropic); reviewed and tested on hardwar=
e.

Signed-off-by: Fr=C3=A9d=C3=A9ric Mah=C3=A9 <frederic.mahe@cirad.fr>
---
 drivers/clk/spacemit/ccu-k1.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/spacemit/ccu-k1.c b/drivers/clk/spacemit/ccu-k1.=
c
index dee14d25f..364388ff8 100644
--- a/drivers/clk/spacemit/ccu-k1.c
+++ b/drivers/clk/spacemit/ccu-k1.c
@@ -60,7 +60,8 @@ CCU_FACTOR_GATE_DEFINE(pll1_d11_223p4, CCU_PARENT_HW(pl=
l1), APBS_PLL1_SWCR2, BIT
 CCU_FACTOR_GATE_DEFINE(pll1_d13_189, CCU_PARENT_HW(pll1), APBS_PLL1_SWCR=
2, BIT(16), 13, 1);
 CCU_FACTOR_GATE_DEFINE(pll1_d23_106p8, CCU_PARENT_HW(pll1), APBS_PLL1_SW=
CR2, BIT(20), 23, 1);
 CCU_FACTOR_GATE_DEFINE(pll1_d64_38p4, CCU_PARENT_HW(pll1), APBS_PLL1_SWC=
R2, BIT(0), 64, 1);
-CCU_FACTOR_GATE_DEFINE(pll1_aud_245p7, CCU_PARENT_HW(pll1), APBS_PLL1_SW=
CR2, BIT(10), 10, 1);
+CCU_FACTOR_GATE_FLAGS_DEFINE(pll1_aud_245p7, CCU_PARENT_HW(pll1), APBS_P=
LL1_SWCR2, BIT(10), 10, 1,
+			     CLK_IS_CRITICAL);
 CCU_FACTOR_GATE_DEFINE(pll1_aud_24p5, CCU_PARENT_HW(pll1), APBS_PLL1_SWC=
R2, BIT(11), 100, 1);
=20
 CCU_FACTOR_GATE_DEFINE(pll2_d1, CCU_PARENT_HW(pll2), APBS_PLL2_SWCR2, BI=
T(0), 1, 1);
--=20
2.47.3

