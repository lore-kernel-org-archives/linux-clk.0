Received: from smtpbgeu1.qq.com (smtpbgeu1.qq.com [52.59.177.22])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C25C939A060;
	Mon, 10 Aug 2026 08:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.59.177.22
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786351623; cv=none; b=qIUXhyqZNFx+n8pcpemYq8PrtvcKvPHc4HxBV34UmdaT00QGcx0jBnMq5ib8e8CHQDCcFUT7uwQhp43PCdyFiC/451a38xU5bAJbdz0EiRHOMfdbehVZhAk1ZA5U0Ghy4SB7yeN9UGVuqQVcigFFlppgDwMPf4i0TbglHmbTcks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786351623; c=relaxed/simple;
	bh=PS4d3vonY5cnWvEJCbFrwS8DUvEWQjBP1Nlfw0ZPQwA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=oZ5j+qEQ3pDOjklTFdhEQNvwXJ7MyMoBxt2c5qB6soN5pH44LRTIuQUC0JH0sjXYP9YKCVb8dRGkzgGEABdPhGEDCUYTtVKzMsOW2FDeQJTNJtvFGv7EWSy9kz/oS9gX6TSn7JD3vN0W9iqbpLCiFBH10aeiCKS5Xa7zT3v5ULs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=Wx+qXCPm; arc=none smtp.client-ip=52.59.177.22
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="Wx+qXCPm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1786351595;
	bh=M29CFWqH2OirKKpE7HnEh81ikMXn50dgrCAc8pjdIf4=;
	h=From:Date:Subject:MIME-Version:Message-Id:To;
	b=Wx+qXCPmMAmZcGzFloBTTZsnehkl/n2GGsR+t5cIkrgua/Ykwaq1Oke7L/Ib2xqLO
	 jLDbNBtMCHmMgkItzAWbmFI6vYKvNTuuWTEcIRgB/QAc4yf6Kgt2yIvU9Wzpyp9KG+
	 +zAPIFV+pUd0c7yETbkOnwSsL0+aeecer7GYgn1Q=
X-QQ-mid: zesmtpgz4t1786351589t253fc5a6
X-QQ-Originating-IP: 5bw4/46W/vAFFmQLjlD9b2QFb7W2rG/uBYflbHBWBgo=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Mon, 10 Aug 2026 16:46:26 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 10674885904044503331
EX-QQ-RecipientCnt: 16
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Date: Mon, 10 Aug 2026 16:46:24 +0800
Subject: [PATCH v2] clk: spacemit: k3: add 1.8 GHz PLL5 and PLL8 rates
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-k3-pll5-pll8-1800mhz-v2-1-aabff510a797@linux.spacemit.com>
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22Nyw6CMBBFf8XM2iFteVVX/odhUesoo7zSAkEJ/
 y7FuHNzk5Pce88MnhyTh+NuBkcje26bFdR+B7Y0zZ2QryuDEioTWih8xthVVRpCo9RC1OUbrZY
 6T40whySBddo5uvG03Z6LL/vh8iDbh6/QKNn3rXtt3lGG3k+R/FeMEgWa2OSpzjJLsTpV3AxT5
 DtjqeY+sm0NxbIsH03CIcvTAAAA
X-Change-ID: 20260802-k3-pll5-pll8-1800mhz-c81875a0a944
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Yixun Lan <dlan@kernel.org>, Inochi Amaoto <inochiama@outlook.com>, 
 Alex Elder <elder@riscstar.com>, Haylen Chu <heylenay@4d2.org>
Cc: linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org, 
 spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, 
 Troy Mitchell <troy.mitchell@linux.spacemit.com>, 
 Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
 Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2487;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=PS4d3vonY5cnWvEJCbFrwS8DUvEWQjBP1Nlfw0ZPQwA=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFmV/Q85y7xOz+g7eSPiS8DlyZ5Nd5dWKvDzNTmdujw1X
 6Z+648rHaUsDGJcDLJiiizdD3i2FfhE2RYIFPrCzGFlAhnCwMUpABNJ82VkeMTFomN41t6I9+Pl
 +ElMS+xvNKg9izw7u4H/yPVTzx6sDGNk+PA3niP5h6LiAq6qLXFTqp8+113q3bwx5dhHOdOb69Z
 WMAEA
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpgz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: NrVFYwNEzNVbuRkGZ3vaGUFPY9RZey4pXxI/rZ+PtGw5xPbzxxl9XdDM
	w8mgghWz98W4JoJN+eZyYn9ZmXEvgbtXkguOKAEAaMrMi8Np/Swdfl5WL8apgP7MaNtadn/
	6WIsBgIb4gMGp9lr5zevaZN3yth/oD22IzaYgGKo85+/DNf7Nbtk/82v0BtLtaaRv0MHBgL
	9aAyC78coocHY7jwGxCRml/PwBqYv+JulZCljoIaHsQ9BoJvZSDLZ9gws3iUbj2JC0C5mn5
	s6nn3Qwhv+k/xJexYVCZGj8pFBUYM+cWlyIOHomnyQEWwBgJCxtwubsdgvdMDbcRgYjTuIO
	Hs4OcPs9qP3tBC2HbCHqSEK/EUtCZIZlrITBowK/M3DIo+hliNm14DvLF6z3iIcXXfxL2ow
	7XTFxo27ED3xruA8w+svq3qPlvzSHc/waacbv6G6cuZgtIhXgtEiD7tI0DuSCfYl8C+tC3l
	OyWgFrOp9tthTmz+ecq06c77tyFhpET8on+rK7KZ6iT35eXsjY1dJY7+AcVTw3XhkRcqnPV
	MzvuBDabClqwFzy8MJeCNTvhIHLpCjAF2hG5AwOb9wop77BPvDI8yOevLqCO2d1Z9HVhbcU
	th8d723PtJfal59elVHguab+8ux7VoPM0Ut/ZdSJO1OUn1ddBGvaffjoP7SCvkVOWqZ5T62
	RSCDXBSvA1EHm8VUtDn+ScwgqxhmJQbtfzQ4HaRQ/ZtCDxWFmLCCHWpCSCfVjQZ25i0Bme2
	IU1B+IN9jomuZZ/WiUm8RnXdCh4OVHI/azjIEYk6uwEX/4i50lHLX8edLJ6B3coBoeOQnIH
	W4tiOwLHbDWrntpNpVoW01Q/d1U9jHfqKNJiudrnd0DfJJuSBKadX2gjNWrc4qv+XAz6UYC
	U/elNwddWt/mqJp5cGhpYpdpxc8iyUsweTtLJ2GIob9xZxxy4QrCpwSXAQyDFjTOuXVjYMw
	25Rl9D2I2+c6oCoTmZUP2scVYQKbEmW6glKjw2nXYX85DiaEl0AnUNl/xJ3Yu9hKM/2kUKI
	yodYUgFrUuwtyEHX4mlFn275b6YDah6USJYbi5x6v2mGoLo61PDXq+q4WnOyGK0OCME871J
	1EVzAABfGylKUIHB2U1Mx9TPQAcl2p+3E+ZbPNeMsO9YW5eSi+IpJbozBSq7X/1diZORA69
	6oWWIjDgB0TPM7w=
X-QQ-XMRINFO: Mp0Kj//9VHAxzExpfF+O8yhSrljjwrznVg==
X-QQ-RECHKSPAM: 0

K3 boot firmware configures the C2 and C3 CPU clock domains at
1.8 GHz. PLL5 feeds C2 and PLL8 feeds C3, but their rate tables
currently contain only the 2 GHz overclocking operating point.

Add the nominal 1.8 GHz configuration as the first entry in both
tables. This lets determine_rate() and set_rate() select the firmware
operating point while retaining 2 GHz as a supported overclocking rate.

Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
---
The related U-Boot change is available at:
https://github.com/spacemit-com/uboot-2022.10/commit/fb95cf3d848b771c61b5a1b3e5cbbee223faf352
---
Changes in v2:
- Drop "clk: spacemit: re-enable PLLs after init"; the PLL init issue
  will be handled in a separate series.
- Send the K3 PLL5 and PLL8 1.8 GHz rate-table update as a standalone
  patch.
- Clarify that 1.8 GHz is nominal and 2 GHz is an overclocking rate.
- Link to v1: https://patch.msgid.link/20260804-k3-pll5-pll8-1800mhz-v1-0-a3a75866ce32@linux.spacemit.com

To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney@redhat.com>
To: Yixun Lan <dlan@kernel.org>
To: Paul Walmsley <pjw@kernel.org>
To: Palmer Dabbelt <palmer@dabbelt.com>
To: Albert Ou <aou@eecs.berkeley.edu>
To: Alexandre Ghiti <alex@ghiti.fr>
Cc: linux-clk@vger.kernel.org
Cc: linux-riscv@lists.infradead.org
Cc: spacemit@lists.linux.dev
Cc: linux-kernel@vger.kernel.org
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
 

---
base-commit: 1590cf0329716306e948a8fc29f1d3ee87d3989f
change-id: 20260802-k3-pll5-pll8-1800mhz-c81875a0a944

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.spacemit.com>

