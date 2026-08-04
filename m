Received: from smtpbgjp3.qq.com (smtpbgjp3.qq.com [54.92.39.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 836A038B15E
	for <linux-clk@vger.kernel.org>; Tue,  4 Aug 2026 07:04:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=54.92.39.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785827077; cv=none; b=QzBJZpzaBGMxjHcFG0KyjsSL8JggG4m1WVWJwyFGOKOVj7sC1KfJpC2AWix3II7yO/gOw+yQwKdxiUQ8jUkQVdfMP/L3GHm8btvFBUHJDX+cZf0OAnHXTD7PkQYxcUHycJmDPoNl7QOkpIwzpoG+Y0ZJxZ5BQClB5Zmgbwh1TLo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785827077; c=relaxed/simple;
	bh=s8SW+2iT48s0IYV1Q5M+r8l+mfKCLpiBxd0Xenj5kRU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OOLxHFN3B+hkbvZwqkBZcTn3WouZsx09ZpzfbPZ+9Su0H1ZZdqPIl4cotSkiPwb16t78vXAxyWKNJqOiSK6NJdqM9X3pmCCeuwnsAHAUyIPICmtxePdPZP6SfaudS6RQQ2/VFbLiwLLUVFxs/rmDSGQH+3t8hks14oQJPgroVLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=rGpwmOaT; arc=none smtp.client-ip=54.92.39.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="rGpwmOaT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1785826994;
	bh=JxeHR9WR6YbITz8Accvq6oKveJ/YQXL91bc8ukBr7BE=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=rGpwmOaTQ2WSjSWyY4HSb6mUNvYyzvA0Fo7wYX67VDEhDRbJDPdc8KbPwj3473efL
	 twrZnrVkvp78or732ZbLVq+D7KI/d+uyk9W++O8/qzMUYcdZEgCiNe60QdI0jw6u/K
	 qcioEx8FDMHg7rTRakmk86HPnRwSvwYfYjmvpKzY=
X-QQ-mid: esmtpsz10t1785826993te7252ff3
X-QQ-Originating-IP: oPWhoeyklrLrczWg0K86LHDJPUuUkvmNCuHodKu6Nfc=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 04 Aug 2026 15:03:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10466597976480000085
EX-QQ-RecipientCnt: 12
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Tue, 04 Aug 2026 00:02:56 -0700
Subject: [PATCH 2/2] clk: spacemit: k3: add 1.8 GHz PLL5 and PLL8 rates
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260804-k3-pll5-pll8-1800mhz-v1-2-a3a75866ce32@linux.spacemit.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1351;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=s8SW+2iT48s0IYV1Q5M+r8l+mfKCLpiBxd0Xenj5kRU=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFmFfUunZh2qWFuza/KFos78Vv+wRRNrA25480wwPznl2
 aPyWlmtjlIWBjEuBlkxRZbuBzzbCnyibAsECn1h5rAygQxh4OIUgIl8nsXIsDdBMPzK/pJZV5O2
 xb7O8DdbzfUkbL3oC+17xw+1mB6Ifcjwh8/o4KTzTA5i53dqfVMNNa3SeXL0sf71iD0zA79mKr0
 I5wUA
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: MOrL9Q2bZwNSa47uGVjg/tFZ7iyplumvBW41UC6yVDIdr2du8QecfXEG
	+xf/QsiPD4vLlvbKYe1/GpSiU5aZooh6uKtSz3NpHgzU6EZJ1yHvILTf4C0jZfQwm2eaffO
	3c9CoSv0yzIgJbGqc2epDZ+IHVVD8MKv/qzDWRLDeWwvhqqWl6D0BpS7BAafeNydVWV7gFm
	VB25XFs4uInAK6JeRs7C8w4a2oNFRmUeIPLorqOrsN8MUxWNpIz/j3bO8vEtRexz3+PXvIr
	L2kjUL1EY02M6hmstfe3NkMAymxG0O1pFAwMBmeokFuDtyC82bR4WvpuzWMmjPCk68WmWZi
	8feB69ioxA3wANOxCdyU/gAk2QOLeDr8ISqG26x65yCbsqBquK9at4fagwBsIxAwHy12E9k
	FI3EK2bb3Cetcc9UijDoJDloYwCpO4UPCgQmT85q8lQCo13CylFZTnOUpLBSnQG6HEtdDL0
	UJb2f+/LIfYg+Rf0WtOJz5v+OOejXW90tuvbDXaRz4rcs8syvC/cpoGoaM92rtJBwqWqJeI
	zb1FwAwF3CzXm3MvJIJIxi8X2HP96Ycznt5V13cNnSE7R2HoSb0V7lApNa+VTat/MawDUU5
	56Pseb4OQEMQdQoYXq95+LloOEEASGW4rNc25poEbRSyIvW+tqpW7HH/f1YYDXlx+Mwav3d
	6GbNU/g4iJ6pFmNQwGE7CG98sCTQjHIu/4k2wtLPEZkClRv6WOy8lEk+o059bGxNAUuGBRL
	Ir/CdPfHj4YPMik3TmznGrAwfdzm3hW5oRD5iraFEh67mLhU829sp79DNRUJPPV3qFoyKFZ
	13cZqbhgTOzVbZiS9V4EbCZoF2jlPXGpy57cnykk5dRapTn+Z4pfhsmQxrezVyFzPeMfnOh
	7vFwwvnPBGn35OkcebbW4os24Zica50S77YwdEUpmhjOhzOLu3Mrd80st2wSQKC37R9qI9C
	bVUUv8EQqTiGCRAHRp8Kz/M2Rt/V3ipzkv8tFmncfqbcWSAKM8RWa+5F1EJLnrEGDVcO8sE
	Yyy9pNWzp7pQGDn0zMH6aLN2TZtBeTCc2DIOeC8cPHKqGt8/Gl8uNxYqrq+E+bqHHQ19gYS
	egsXdfs55o/2TaehwSEyCO2zPB3sZQ8Qg+WkSYet+wElCQLn4oIHEtwQkELluLAw4WGJprz
	V1jO
X-QQ-XMRINFO: NyFYKkN4Ny6FuXrnB5Ye7Aabb3ujjtK+gg==
X-QQ-RECHKSPAM: 0

The K3 SoC may not remain stable when its A100 CPU clusters operate
persistently at 2 GHz. Updated U-Boot firmware therefore configures
their C2 and C3 clock domains at 1.8 GHz during early initialization.
PLL5 feeds C2 and PLL8 feeds C3, but 2 GHz is currently the only entry
in both rate tables.

Add 1.8 GHz as the first entry in the PLL5 and PLL8 rate tables,
switching the driver default from 2 GHz to 1.8 GHz.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
 drivers/clk/spacemit/ccu-k3.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/clk/spacemit/ccu-k3.c b/drivers/clk/spacemit/ccu-k3.c
index cb0c4277f72a..e8b7ce89c2cb 100644
--- a/drivers/clk/spacemit/ccu-k3.c
+++ b/drivers/clk/spacemit/ccu-k3.c
@@ -38,6 +38,7 @@ static const struct ccu_pll_rate_tbl pll4_rate_tbl[] = {
 };
 
 static const struct ccu_pll_rate_tbl pll5_rate_tbl[] = {
+	CCU_PLLA_RATE(1800000000UL, 0x0b4b0000, 0x00000000, 0xa0458585),
 	CCU_PLLA_RATE(2000000000UL, 0x0b292aaa, 0x0000ab00, 0xa0558686),
 };
 
@@ -50,6 +51,7 @@ static const struct ccu_pll_rate_tbl pll7_rate_tbl[] = {
 };
 
 static const struct ccu_pll_rate_tbl pll8_rate_tbl[] = {
+	CCU_PLLA_RATE(1800000000UL, 0x0b4b0000, 0x00000000, 0xa0458585),
 	CCU_PLLA_RATE(2000000000UL, 0x0b292aaa, 0x0000ab00, 0xa0558686),
 };
 

-- 
2.55.0

