Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3324396B8C;
	Fri, 17 Jul 2026 07:26:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784273193; cv=none; b=gkJd/O1r7Ducu+bXbO7B38YaE3Rl0BrNJwfpn7IEhhRqMDQr2rr5d+yKtsuyjbmlrwsO26ghQjxQWhnkRP84j6LFfFNVbYaHsvYYXN7tP7rPM6Zos65XB6xz8wJDKbv+8Q56eBdnVLu8LGPkVsm/c3lFI95+lHByruRfroLqMIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784273193; c=relaxed/simple;
	bh=pmDemkdZ9ingitjiHnQJPHF6cz5rSUrFawXebGp5onc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DeoJ1fovjqA3p+5DrtfECyx0ijOEHqZT2HaRFJD9Hnlx/5MIxqinfaDyqC5jXaVTySJS3l2h1hzoDfeY8zwp3lQpO5NW2G/i1ORyNKd8xd9b4ptKF5yi02VKcD+QQlfii7ar1wWdVGJyBw8J7SqAC8ABXG+K3HTJGa5f/PjsyeE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=JGUhyO+A; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="JGUhyO+A"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1784273181;
	bh=fymj27WXKJG2RMZe+ljkSj5ptI3AG/Qlm4jztXs9Ax0=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=JGUhyO+A4L2jXlGkKFxGWbfifiqiN/iCCGLnYNrDufcRuurzUjv30kt0tJEz6eUoA
	 Q5CrFSSxX9FFZHTg+N068G2fTRlftzkx2SYXN6ozycDGV8pUeW2NouPp6HPg1Nxeth
	 xsJ927qlGd4nEqC6d0hb2lZXtioCDqqxzR1tPAr0=
X-QQ-mid: esmtpsz19t1784273177tf811608e
X-QQ-Originating-IP: i5+anhGPQj0cZfDYZeOkgyTzjxq1pAkh6BJR4p17JNI=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 17 Jul 2026 15:26:14 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 9954810506696884270
EX-QQ-RecipientCnt: 14
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Fri, 17 Jul 2026 00:26:01 -0700
Subject: [PATCH 1/3] dt-bindings: soc: spacemit: k3: add i2s_sysclk,
 i2s_bclk_factor and i2s1_sysclk_src IDs
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260717-k3-clk-fix-i2s-v1-1-e95001a692ee@linux.spacemit.com>
References: <20260717-k3-clk-fix-i2s-v1-0-e95001a692ee@linux.spacemit.com>
In-Reply-To: <20260717-k3-clk-fix-i2s-v1-0-e95001a692ee@linux.spacemit.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Yixun Lan <dlan@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 devicetree@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1318;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=pmDemkdZ9ingitjiHnQJPHF6cz5rSUrFawXebGp5onc=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFmRN/m8Wz11pnE8dDmXuOxFvGnZqXJxY47AnWELXaoae
 xuXinR3lLIwiHExyIopsnQ/4NlW4BNlWyBQ6Aszh5UJZAgDF6cATORxCSPDyQaFznrTkE1vxI4d
 dOhqtL/jMWOJl+fUBrEeNo2z1VVTGBmaWLXr/Do436zPLV74siyqT6Fmisva851lp+a9jps0pYY
 TAA==
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MpO6L0LObisWp8Fdvp153dHmO9+qilm6Avis1mUkR1ohV3NHecQDptag
	x8w7HNK19y8kPUNoRkd0FveAXBeUZ0jhJFnBbdEoi8F+1nAWSSGULxpvLfhgreVnzJscziT
	tQqLccwSCfNlqP67nvh8L4eidajXSJ9Idcfai6OmKuskSsqxyESbQyZBM6e7JzDO2RCsEGm
	rxG1mJcPyC/87zJYR0tsH32SOac5GzsQTbRyLqs4Xx5LuDj40q9jp+qipgwyGxTOeIqVUMj
	8w66rR2fOdQLu33ZFIBwfE2zs1eFP38UuBuDxPer6f/+LB3yJI3mRw66crqJTrZbUtN7Bo8
	3ByoYhRISWhUsUaBIY+ktICWTzFwuqqacwKP7qAkTsgEMIW0AHPUreXhHu0xWSFUzM5MIKV
	mM9KrOj5IpxZUFWABkXVe700WTQ63Pz3BOxD4Uwvnl8s9UF0LYoG2SykAud4kzhMi1+v2i9
	kHvXzPWPnk2eazdZ8PIbU2FvS6l8AD2l/8o/kJgsKTMYssKmAuIuNUrmH5ri/GxMEiBOSRU
	wLxV/GoJcvh0ERUQOYcLu/q4UpJc8uoOfq7ePfSSgouYb8sBHF1/Jeh/e0JArdGI/ktcBwQ
	pxXnAT6PvBYFOwQ1phA370feM4voL2ZyuTsZ0ofjDLsWbXif4UWkA3kyGDQ9E2g+ubqJN70
	+sPwfXyg9sfAG2F9oDeDXv7Pk50jyFaxCDo7dBsu9tR08yPKfy5LOkWkwgdLFthKRUiWA4+
	P6oAetXMuxled/KhtydSbhF6pFIvs/KcktuND86WiSo4xgHsvhy3WIu5LKfy/NQhDFQHmMa
	nVu3zQT6WATpFoLHUdKRZ3Xi1Z7tmD0c3amc5i+JVy7iBgwkOMrlLk4rNVR9snfRb1LZo2M
	QT8YM+tV0wjnrBeAFFmdDmgx+rJLNWqUaL/4+ZjKYQ6eZd1WesCXC36HMdYGUUST8UgcHS5
	Q2tZCYpOBTz/I6l0LzckF7FCYM123IeKLLMXBu07P7yVHKROIDAG/2Z1rtpVbysKprIqmrv
	SqrjnYSjGJ7U0kGZ1DSmY8MtcxknIb2JXEz3bLa+yjAAOJk6rYNO5/XarpbB0=
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

Add three new clock IDs to expose clocks introduced by the topology fix:
- CLK_MPMU_I2S_SYSCLK (51): the common i2s sysclk DDN at MPMU_ISCCR1
- CLK_MPMU_I2S_BCLK_FACTOR (52): the implicit /2 factor feeding i2s_bclk
- CLK_MPMU_I2S1_SYSCLK_SRC (53): the dedicated i2s1 sysclk source mux

CLK_MPMU_I2S1_SYSCLK keeps its existing ID (47) but will be repointed to
the real per-instance i2s1 clock in a subsequent patch. No in-tree user
references this ID so the semantic change is contained.

Fixes: efe897b557e2 ("dt-bindings: soc: spacemit: k3: add clock support")
Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 include/dt-bindings/clock/spacemit,k3-clocks.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/dt-bindings/clock/spacemit,k3-clocks.h b/include/dt-bindings/clock/spacemit,k3-clocks.h
index dfae52547cda..df0b9fe43b76 100644
--- a/include/dt-bindings/clock/spacemit,k3-clocks.h
+++ b/include/dt-bindings/clock/spacemit,k3-clocks.h
@@ -145,6 +145,9 @@
 #define CLK_MPMU_I2S3_SYSCLK     48
 #define CLK_MPMU_I2S4_SYSCLK     49
 #define CLK_MPMU_I2S5_SYSCLK     50
+#define CLK_MPMU_I2S_SYSCLK      51
+#define CLK_MPMU_I2S_BCLK_FACTOR 52
+#define CLK_MPMU_I2S1_SYSCLK_SRC 53
 
 /* APBC clocks */
 #define CLK_APBC_UART0           0

-- 
2.55.0

