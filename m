Received: from smtpbg150.qq.com (smtpbg150.qq.com [18.132.163.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD612388E46;
	Fri, 17 Jul 2026 07:26:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=18.132.163.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784273192; cv=none; b=bUk2PWvxGFHEyyKNT4V2gb4d3wWAnmFJDR4df+603GfbXe1YAumiu86FOvE1Hct9kE1X8V60koeO03wKPz1dpX4pJcJIF9xLvot6hQUrjZPbjJO3zg3ztLWV4EovMEidprgjVR/KZM+/wVGk9SxOcApeI9yYeKKheiTFnUHXSHQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784273192; c=relaxed/simple;
	bh=FUEnUCyCQt8oabfZeZlckH5YssHKTRkpCvLvgorY36Y=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Pf9fSNi1qBMZEXOC0LCDPI+3Od0nuD3O5FYIaqm9nkPoUP19PKVjp8ERsAIKEeMUrY4Wsq8Zc0mxswg8zkj8img4HwUTXHVFLgVciBnq2LYdpOqoh8ckJidbtDGi9wAdxSnXBIqUjMwK9TdVac3LY4b+Pf/c8Z3zB8F6j2KhJvg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com; spf=none smtp.mailfrom=linux.spacemit.com; dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b=y/VJDyP0; arc=none smtp.client-ip=18.132.163.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.b="y/VJDyP0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1784273178;
	bh=jEptvT1X09De8R5/A6uLESasfKVE1BpRXqYYNEEYFJw=;
	h=From:Subject:Date:Message-Id:MIME-Version:To;
	b=y/VJDyP0iSHY4+8RYfQWy8DzZy4az//pMVvBvDoK8YEX6ggqOnzcjRp8kisCjpeUA
	 e03KTS92+h6hNfFu09NNnLUn3q0CYuh+Q5iJiPUIq1QnPk4gxQJo4bg4Wi8iKGICwP
	 tahVh0CTa1ixKGOAoPf6q7s8wHHL/iLV3Odey4b4=
X-QQ-mid: esmtpsz11t1784273172t86be77f2
X-QQ-Originating-IP: Bw9tCNH376+ZtWl5C6e6i58YBeeAjXoMSEuf/COzNQY=
Received: from = ( [120.237.158.181])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 17 Jul 2026 15:26:10 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7455975292204269396
EX-QQ-RecipientCnt: 14
From: Troy Mitchell <troy.mitchell@linux.spacemit.com>
Subject: [PATCH 0/3] clk: spacemit: k3: fix i2s clock topology and divider
 rates
Date: Fri, 17 Jul 2026 00:26:00 -0700
Message-Id: <20260717-k3-clk-fix-i2s-v1-0-e95001a692ee@linux.spacemit.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yWMSwqDUAwAryJZG9D4K15FutBn1FSx5aWKIN7dq
 MthmNlB2QsrlMEOnldR+c4GcRiAG+q5Z5TWGCiiPMrjDMcE3TRiJxsKKWZMxatOCzIJFv08m7q
 H1fthXZoPu/91geM4ASF9h2ByAAAA
X-Change-ID: 20260615-k3-clk-fix-i2s-5e278a472061
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1867;
 i=troy.mitchell@linux.spacemit.com; h=from:subject:message-id;
 bh=FUEnUCyCQt8oabfZeZlckH5YssHKTRkpCvLvgorY36Y=;
 b=owGbwMvMwCU2g/N9w09jE33G02pJDFmRN3m5TV4lvbAMKDFa7Tl9styp+r7sLs+wbon1Rn/ZH
 07d58rbUcrCIMbFICumyNL9gGdbgU+UbYFAoS/MHFYmkCEMXJwCMJFDpYwMm/UFp/5NnNVamblJ
 cvHN4rtZvJOZHl45xf1JYGbenyv6igz/02bw7zI1DfzXKv1C/tS1P7KFb5++nWrYdP/RDOnM25F
 n2AA=
X-Developer-Key: i=troy.mitchell@linux.spacemit.com; a=openpgp;
 fpr=3FE5535CF1B0E658E57DB59BAE1C2FBEA7DB42E1
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpsz:linux.spacemit.com:qybglogicsvrgz:qybglogicsvrgz3a-0
X-QQ-XMAILINFO: M3vv73qU6a4u+rRSM+MbsqBGeX+B0fRv59XnXl+bmTSz8bWwQrLWsOYw
	bnlcEsHBWaVH9vFPasq73PHqMXG1XSkwp6W/lPGuLHXIkRfqQYUU1qysL6SrYDbGIOIglgD
	wrQWeOuQIUBW9I6hVW+ows5/UojNwGbbGI3L+pfQ6xKpyAeP4bU6QU5GeMIZlebpDXEc/RB
	KY7bfm/p9BJ1clODc0jWDW4P0dxwLIO0tzR2v+/QWR7oiO/EZP0MxKvyPbzyjkIjN5Hn6Nu
	d0XVTvnuihFZcREbcKHy2G3FGvapxFLcDU4iOfvCvQ5hb+VBEjHQxKhJQjadCtEIOmpZOEI
	72o7xU6H9gi/oLTspgCNcFfcKygiK4MioeqI7smhc8UTINiIxd1iq2Nc0ced3qpaY5D0rZ5
	4Ow7uIpVOF+LkT5XKPFUmQ5Cn44gOVvEzK/Urr653UrlRl6F7vtX19hQbi6zq5J3VDuGyOu
	gVkggQ2RcaUyI+HbBom0K/yv+MtqQYwyfSsTGadDS8r0ESgdR9qKirNc0evEGOOrtygZVnr
	mrBUC9KoZ+2TTxLr9RyNVIhDpRVS2PbTxFih/LSiZEC1JC1TZG/jcbvNqYX87Nkycvt2Hfx
	eOGuVW3bxH9WhYWMw7BRvqxqyhqrorRcz7nJ9lym0CZFcadjmb11k+YmTGwr+Zls3dgmp1L
	P1AimoMjdfmiZL1Zh+iw4pE4kuxflGXuHA4nvAmnGVkUbATyBeIzfyf5/8mHZBy8Zc44kxu
	8X04RkMv5CpizW2jVFmOqeRJ3tcR9sNvE3xGR7Xk7zGj2DThwV8PwpNlZA6kRVKMx5M/Rhp
	aLH+yGX/UE8GPqVCZnpYyKMhBPaVFu/YnONsAue+qDFuI6goGSJGeDVCaVRjVcGLIq6gpeD
	k+b55FumKv91iw6LgZDYDLgB5fWauw9z5/r/tPe7W9ymfgdex+bhiaIyomi+r9dMVcxhU4m
	Hsc80vDQtU+awjlu5YYjFY16XmYombs61dBUkcLeSpNxLMsT/lQQ87yOtJL+YYrWlk+Lzhs
	nEhqtoNjJylABOK9IFZvje+lSvxqamdAgJrwxArvoL9ljGId9RxMH8s3dxFCoX0je5oKhCq
	w==
X-QQ-XMRINFO: NS+P29fieYNwqS3WCnRCOn9D1NpZuCnCRA==
X-QQ-RECHKSPAM: 0

The K3 i2s clock tree was modelled on the K1 layout but does not match
the actual K3 hardware topology, leading to incorrect clock rates being
reported and programmed.

Three fixes are provided in dependency order:

First, the MPMU_ISCCR syscon register is renamed to MPMU_ISCCR1 to
match the hardware register name, and MPMU_ISCCR0 (offset 0x0040) is
added. This prepares the header for the clock topology corrections that
follow.

Second, the clock topology is reworked to reflect the real hardware:
the common i2s_sysclk DDN at MPMU_ISCCR1 is renamed from "i2s1_sysclk",
an implicit 1/2 factor (i2s_bclk_factor) is introduced before i2s_bclk,
and the dedicated i2s1 clock path (i2s1_sysclk_src MUX + i2s1_sysclk
DDN backed by MPMU_ISCCR0) is added. CLK_MPMU_I2S1_SYSCLK keeps its
existing ID but now refers to the real per-instance i2s1 clock; no
in-tree user references this ID so the semantic change is contained.

Third, the per-instance i2s sysclk DDNs (i2s{0,2,3,4,5}_sysclk_div)
are corrected to account for the hardware-internal 1/2 factor by setting
pre_div to 2 instead of 1, so clk_get_rate() and clk_set_rate() report
and program the real hardware rate.

---
Troy Mitchell (3):
      dt-bindings: soc: spacemit: k3: add i2s_sysclk, i2s_bclk_factor and i2s1_sysclk_src IDs
      clk: spacemit: k3: fix i2s clock topology
      clk: spacemit: k3: fix missing /2 factor in i2s sysclk dividers

 drivers/clk/spacemit/ccu-k3.c                  | 31 +++++++++++++++++---------
 include/dt-bindings/clock/spacemit,k3-clocks.h |  3 +++
 include/soc/spacemit/k3-syscon.h               |  3 ++-
 3 files changed, 26 insertions(+), 11 deletions(-)
---
base-commit: c425609d6ac4012c8bbf01ec2e10e801b1923a7b
change-id: 20260615-k3-clk-fix-i2s-5e278a472061

Best regards,
--  
Troy Mitchell <troy.mitchell@linux.spacemit.com>

