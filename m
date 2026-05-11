Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F52536CE1C;
	Mon, 11 May 2026 02:59:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778468377; cv=none; b=pa5cMIdj7OzLoitq0/40eBUoCuJmeyNZW6umZy/8a9qlBiibY0Z6x15dbhxudwQO4nqllBq+W26Qnl1lvi6Z3TS1DEEZ6xqJ5oGM2txxBOe1Y1HLvmLcKGtG/TjC0O/phxSkgsLNVYq4mfoWHGhax6n7qtF0oAemGMG9NSnDewY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778468377; c=relaxed/simple;
	bh=9gPF9mfRxQfv5LrILU4PhVKjworVQdsc+SJeTbRrSJk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dEWliVXyAEoa4GHDEcgIyfVakMG/AU47+0Vjhl34MvVs2saQwOx9HVOiHq+MLi/GI0nc/wcs7jES0ZHEAPa2k2W9OdOYDftwx8OagpReVKhdEN7O4ZAMsPfZ0NODJGjluvi76wUvXdMNjL13rk2OjIuhAHs1Jd3DqtAgZ+8VueE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qYc+6SI9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qYc+6SI9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 298CBC2BCB8;
	Mon, 11 May 2026 02:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778468376;
	bh=9gPF9mfRxQfv5LrILU4PhVKjworVQdsc+SJeTbRrSJk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=qYc+6SI9NUuXdgLdUAg9lBKCRnn9PkL16bLLM+2xWhtI6HUPIbww1n/RkkXY3Jt4j
	 8MekyRApnZYXxCmWV6rVcNewufXpmcVi8B9q6NTcDqq1Vl6V6ReEVhuf9H3gbocx1w
	 ifY01sAvn8WTwzo6r6WKIDRXGSAIYRYgzeO0i4cTZUC45Yr9PIvmFV6XV8I++MMmjN
	 WDiI2RdL9KpY5V+g6Cs72H2cqNXi2uekzZmADTc6ZdjYpr7/gz/vQWJomVqNZ8jhH1
	 I1m5/FzKL7rAc+X2A1pI9blRT06g+wN0I5ZRjg82rcIZ4bjzHMgaVBJYsWr2nW9XJt
	 yijnel3J/r5IA==
From: Yixun Lan <dlan@kernel.org>
Date: Mon, 11 May 2026 02:59:10 +0000
Subject: [PATCH v2 2/4] clk: spacemit: k3: Fix PCIe clock register offset
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260511-06-pci-clk-fix-v2-2-c9a5e563bab3@kernel.org>
References: <20260511-06-pci-clk-fix-v2-0-c9a5e563bab3@kernel.org>
In-Reply-To: <20260511-06-pci-clk-fix-v2-0-c9a5e563bab3@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Inochi Amaoto <inochiama@gmail.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, spacemit@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Yixun Lan <dlan@kernel.org>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=963; i=dlan@kernel.org;
 h=from:subject:message-id; bh=9gPF9mfRxQfv5LrILU4PhVKjworVQdsc+SJeTbRrSJk=;
 b=owEB6QIW/ZANAwAKATGq6kdZTbvtAcsmYgBqAUYGc8kUkeptiFWtyUXVVi01nwKqsp2A76xKx
 12/w41K2T6JAq8EAAEKAJkWIQS1urjJwxtxFWcCI9wxqupHWU277QUCagFGBhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDJfFIAAAAAALgAoaXNzdWVyLWZwckBub3RhdGlvbnMub3BlbnBncC5
 maWZ0aGhvcnNlbWFuLm5ldEI1QkFCOEM5QzMxQjcxMTU2NzAyMjNEQzMxQUFFQTQ3NTk0REJCRU
 QACgkQMarqR1lNu+3WVg/+LNvaoKuUq0to/+3q04KPjwmcdMBrDjTs6+Jb1Km9y0VG4OuvsIv6i
 F7JDpVghwP7ruv0XW05EW5SdY7OWQi3TAYjxdCb4rMqs6cuajSYkLI4F/wJai2uNKoR04UcCHiC
 ShdiL711MFsemL6gAuQY7Bvqy7k4XnnW3UviHZ/MqUX9vf32uGbsNJDOT0slAjh94oJXeSlw77y
 HGS++Bj6Zr5nyR00neX0T3X6sxRxvjmKiFtERaiSp3DErDsEtjWesk4rPKk4UYcVGhpzcSjqdGX
 3XqODLmJbnq5lw6WJbvzqFsDAKETI39VsCIheDhrcdQISislRVpCf3uhW/2kaV5bz+imtPch6EX
 wGOVqIutX1p0m0SN92t/+pA753TLDYnn/2DkQhwVzY7uiQ7vW5XmG/ADFpFjuHyrFnBGtLjjwdj
 XHTN/oTg67FOpNqDDdVaM/rfvcDFBApW6q5oTo6BwYHueQ4Ey+kRTkcg8u5QTfFrBaj373LR0EU
 aHb9ddIpBUYYbykYpWWYpwht5AU5IY/T4GechEGS/hXhniDCWds8ba+5TVAsdUtCbOh79Ftaypg
 3atg8VildwL+vmoK71aKtGUyt8C8cR3TCvJqvZwxj5g+PmtoxapfHV8Y1sE3LdcSkUUC4uCWjN3
 /7Bqf6s6W8aU+8DnaIhMM2fG7tAEnQ=
X-Developer-Key: i=dlan@kernel.org; a=openpgp;
 fpr=50B03A1A5CBCD33576EF8CD7920C0DBCAABEFD55

The offset of PCIe Clock CTRL register for port B and C controller was
wrongly swapped, correct it here.

Fixes: 091d19cc2401 ("clk: spacemit: k3: extract common header")
Signed-off-by: Yixun Lan <dlan@kernel.org>
---
 include/soc/spacemit/k3-syscon.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/include/soc/spacemit/k3-syscon.h b/include/soc/spacemit/k3-syscon.h
index 0299bea065a0..a68255dd641f 100644
--- a/include/soc/spacemit/k3-syscon.h
+++ b/include/soc/spacemit/k3-syscon.h
@@ -168,8 +168,8 @@
 #define APMU_CPU_C2_CLK_CTRL		0x394
 #define APMU_CPU_C3_CLK_CTRL		0x208
 #define APMU_PCIE_CLK_RES_CTRL_A	0x1f0
-#define APMU_PCIE_CLK_RES_CTRL_B	0x1c8
-#define APMU_PCIE_CLK_RES_CTRL_C	0x1d0
+#define APMU_PCIE_CLK_RES_CTRL_B	0x1d0
+#define APMU_PCIE_CLK_RES_CTRL_C	0x1c8
 #define APMU_PCIE_CLK_RES_CTRL_D	0x1e0
 #define APMU_PCIE_CLK_RES_CTRL_E	0x1e8
 #define APMU_EMAC0_CLK_RES_CTRL		0x3e4

-- 
2.54.0

