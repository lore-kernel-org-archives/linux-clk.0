Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795470671;
	b=wBnUKgT2poQNmZM2wX3bTOF7lAhk318dRxsYA0C35ORK48TU782eM9EzwWsxk2m5uNVv
	 YZ63lrffvXB2xMzeEXybQEvWMc8UanV+SN8bvCwQ3k/kQQWO+TnjEQRJRJsOmwoAfaYax
	 q/+jcak5YVp6mehHeaHW2XVqUyeO6dijq3cR3FbpOzs9ryFeB/g9go5nJV93YFq2+7SQ9
	 FxXH2otMgSL8Qy1MCe+0VTz6yhDJcQkS/vztRYuC72YLnJnjPZr/Hg9VnkdFIzbvdJ4AB
	 Imkc36Np6Q7Bo+MJJBJVdncFqUcaU3sPSMNm8Cc3Bk7UMh8I78bYysML6nCiGksgTMw==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795470671;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=7813uZek7BRVS+ISfMJaAuWv7jdAMW/9RxospAn+b/Y=;
	b=LzOS+zRJdMnFFtmmtjVGRtvPae12Nnr97E4PYB5KwnXmoSKqNYIUBNrjXEfEogct2eoZ
	 v8c5iZzIuz0hVMiuWL8F+3fYsOVrpZKNU/c4vB8DA89mASM18V7pcOvvCbURLK3f47U/d
	 wXK2upKaaaqyTMaEnp5T0IANaENAL5yM6D1UpvTKGDJD8TJCUbZh6BL1L+2c0F+3PGVuz
	 R1nXL1LKeAglPrC8GjSITKn6a0TcYdsiPCh0eLALDw2x1/1wajegDhaj1h8z+8sIl2jN0
	 WVsyeOU4tauA64viavOseI52yEDWIE4JDdLrWdMokRYFR8ge10PoHwMPvJCNHNE0KkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GDfSPxfF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC78B606A326;
	Mon, 23 Nov 2026 21:51:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=GDfSPxfF
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795470670;
	b=CF4MTTXFTZY0kPY+e2Nv907rEhta8Mr3t2vBXP/NcVKLNQEs14AEGT0xoYopwuBJwRLd
	 F347EkUgS/k3YKTmiSUpm7Q9tsgrvtTpLtaM35jwPJVJZbBKgn3TqsIs/ND5B+/Iynjx4
	 lCda8pXaFfPhZ3k+e0r7rtI4oNukkF5LFWx6d+6v7kM/LLq9pR3sSA0IgVohLLLgBwNJz
	 QttLUJv4tmp63RZS5sLtlmqhVVU7YzDwygvCWsDVeBa/i3tl7gYM3c1auQnAJQqcPzUSS
	 krXAx8keRfu57DubG5N5AOexOtFRKuJgSBQ8H4sDcg0bFF2YOFvt0MCCnYcv79O5IIQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795470670;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=7813uZek7BRVS+ISfMJaAuWv7jdAMW/9RxospAn+b/Y=;
	b=cFCBhM3janK0x1WGEV2IWSdbodGUVzC3yDVSsC25bbiPszEPbpsy6PCUaHBH8mTb2TUH
	 5PGy0x6y6RnSlPvmjrKA6y1octd8RAu6EBn/Zpw0Z3X6D7ocrjwjY2ZcACj5Xoq5wvtVg
	 eS0bJ+Bm2oBZuSeVHH9p/37D3rmIpuDrkdNTocuGgnAlZZ8Riu+1f1ds1NGIjAWdHgviv
	 djhiveiMC55WsCXwymVAUBYBIjnnjlmhvrYsJjNYGYs2zBdUXIPseujFck3lsIJ8IZmDL
	 2glV8Bd1wS60UnLk80veI/ti/Af8Y5oZT6XPk8GEzDyvYoXZ6JylLCX1cs+RlZT/F5Q==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 71DB11F000E0;
	Mon, 23 Nov 2026 21:50:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795470670;
	bh=7813uZek7BRVS+ISfMJaAuWv7jdAMW/9RxospAn+b/Y=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=GDfSPxfFND5RctDCBY7kfrRdOz621E7DefX1PPcmMzwiQtIoDqqItJZoSNM7WX1zD
	 HK9AbUpQu+vxKbcQAMzsg2hDWpPrBTTufI7Jq4MQFMHGcnRi8zpJYfBvk8C2+FV0ys
	 QQrmx3mRwz8VEqM/9FDBElJ4f5BBEVbwoFUbKX7G64wXClOs9paqLJqfF3MX015MOW
	 wRtm5DArCNxJ2nxcvS9l1qPrWBi84WxNL7gzc9BTzdgP7VFEzaCUnRTFqvTHxbUATp
	 rnHI16ZIc3iitV3CYs/bvp2RblVwlf7NTD9cL/NOlPzggmeVcPtVv8aB7KrALy37Do
	 OboqYE8eWTWVg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 0253E4C788;
	Mon, 23 Nov 2026 21:50:59 +0000 (UTC)
From: Fil Dunsky via B4 Relay <devnull+filipp.dunsky.gmail.com@kernel.org>
Date: Tue, 24 Nov 2026 00:51:00 +0300
Subject: [PATCH 3/3] MAINTAINERS: Track CS7542 global reset specifiers
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261124-b4-cs7542-global-controls-v1-3-12548785df2c@gmail.com>
References: <20261124-b4-cs7542-global-controls-v1-0-12548785df2c@gmail.com>
In-Reply-To: <20261124-b4-cs7542-global-controls-v1-0-12548785df2c@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795470657; l=805;
 i=filipp.dunsky@gmail.com; s=20260930; h=from:subject:message-id;
 bh=jZiseWlg2CtTRviMIS/xUtTqGqfyqbUonSFVhgEfXD8=;
 b=XgrqNi9Rk0GtZ2qbN18FPMvfN9NFeP8t7VKAcEwv74gpusXsM0eOBZ5QrS9+QsjrqWuGqnCKw
 a+hgjrA4zQZAFgDY7PKhB2YkyrxqW+9h96fDxJPDkk1vhb95Sv39jv1
X-Developer-Key: i=filipp.dunsky@gmail.com; a=ed25519;
 pk=JAYP8e2rJ54DHOmhNtXud8rl1igAaAXoOHxtJmVXI1g=
X-Endpoint-Received: by B4 Relay for filipp.dunsky@gmail.com/20260930 with
 auth_id=1085
X-Original-From: Fil Dunsky <filipp.dunsky@gmail.com>
Reply-To: filipp.dunsky@gmail.com
Content-Transfer-Encoding: 7bit

From: Fil Dunsky <filipp.dunsky@gmail.com>

Cover the shared reset identifiers under the existing global control
entry. PCIe host/PHY and network datapath ownership remain separate.

AI assistance: Codex prepared this draft from the posted CS7542 series.

Signed-off-by: Fil Dunsky <filipp.dunsky@gmail.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index d8835aeca..3c51d13e7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2958,6 +2958,7 @@ F:	Documentation/devicetree/bindings/soc/cortina/
 F:	drivers/clk/clk-cs7542.c
 F:	drivers/pinctrl/pinctrl-cs7542.c
 F:	include/dt-bindings/clock/cortina,cs7542-clock.h
+F:	include/dt-bindings/reset/cortina,cs7542-reset.h
 
 ARM/CORTINA SYSTEMS GEMINI ARM ARCHITECTURE
 M:	Hans Ulli Kroll <ulli.kroll@googlemail.com>

-- 
2.53.0


