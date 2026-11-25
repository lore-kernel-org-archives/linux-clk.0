Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.47.186.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795579572;
	b=SViYDBnxmQJ+/N8xVVWJRABrfiD+/9QjoV692NTEHqRlPh3oxJAozgD6YGboV5Bw6WWN
	 b3VFwi8bqLilAB1RiUz5+8O7TgK86xMASqFb11lgUNhzZuTPBtPLO9zqxHdgV2gPVmV0/
	 +ujcpUoHx52j7C0FkPlttQPJtP4X6dUVI0vSA5HOpCGe792ixVXEJqUQFWKlr9IyR+p0r
	 cYCI50l8G2K7EVX171Dreh3etSWCjxpViC4GjF0Gx2jAj2CDNMU0vKdRShlC4QAYvXclf
	 84tGQhK5gPODLHhwFg3tIAVENRYjHacYHYDISA4zz5+WnIfryYrBPyHQLmX8NwSh11g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795579572;
	h=DMARC-Filter:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=kd4zOchEtxn9n6UTrbdYdposlzABlx2gkKLMJTM7qgg=;
	b=G9IqNILO/QyTGf9uJjhEMl/tgEnOyfq8lqc2pfhaEeq263/DFyy6LHNLk7Ldv07EFYo5
	 nOtmj6bZda/sgklZuZXXBE+NX0dPoDbAJVBJUlYJ99E8P2V6HXdwTGYEMRmoup/T+mzK8
	 ZRiPR2exYwYq9H4vgDGrAeC0EwwfOWIPP8OdV05caEiQbaRzYYN/JWYeY3JWnGSjUPUjF
	 TIeArllzKeZnXG9vdTsU8jjPyPHUq1IRDPEpFG+Xdszq4/7i/EsuBBCgUYSACGxa2l95W
	 51lBOYs25vpegAyIaEaTcOm1HkgAM/F0Q9CD8VX/KAWZ7LI3Wq3r90va+7NPQQGs35g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=krgm.moe;
	spf=pass smtp.mailfrom=krgm.moe;
	arc=none smtp.remote-ip=103.47.186.116
Received: from krgm.moe (krgm.moe [103.47.186.116])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 82E4C606A31E;
	Wed, 25 Nov 2026 04:06:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82E4C606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=krgm.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=krgm.moe
Received: from [10.42.0.96] (unknown [114.242.206.180])
	by krgm.moe (Postfix) with ESMTPSA id 497DD83B;
	Wed, 25 Nov 2026 09:36:07 +0530 (IST)
From: SignKirigami <prcups@krgm.moe>
Subject: [PATCH v2 0/4] Add Qualcomm Netrani clock support
Date: Wed, 25 Nov 2026 12:05:17 +0800
Message-Id: <20261125-netrani-clock-v1-v2-0-9ef014e71737@krgm.moe>
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
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/32NwQrCMBBEf6Xs2Ug2BFFP/of0kKTbdq1NShKLU
 vrvpvUuzOXBzJsFEkWmBNdqgUgzJw6+gDpU4HrjOxLcFAYl1QlRaeEpR+NZuGdwg5hRaLwYrZQ
 8W7RQZlOklt+78l7/OL3sg1zePFuj55RD/OyfM269P/oSKRyhdNTY1mh7G2I3HsdAUK/r+gVlD
 /VwwQAAAA==
X-Change-ID: 20261124-netrani-clock-v1-419a42208b1b
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1664; i=prcups@krgm.moe;
 h=from:subject:message-id; bh=YGkKj/TSztmhrfGq8fsRBKEEahXO6NPOnXaKJrOpq10=;
 b=owEBCQL2/ZANAwAIAV0dOJt2umJjAcsmYgBrBl6GN85Dl+qwpcgkgIjFkNKU2JK8MBjddPUyd
 k8GCn0oGfyJAc8EAAEIADkWIQRSClJ2zjncUdNU0FFdHTibdrpiYwUCawZehhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwwLDIACgkQXR04m3a6YmPGYgwAlOiRuklL+uOEjPBWuwBS2PZR7jsn9eJ
 gZYV8fYZsrNXiadi3CGTo+Kf0dtpnmPoVBO4pfoN26P1BYPLSquHNJvWJu093BvPJZ/afG1kuUl
 cBpy93cSimOWnFvTSqS1GJ5OiYrKoL0b4e2lhxf2sqft0qDCiAkSfF5tb6SFyKJhpEAzUTbHgNh
 CkD5pbzCRM0k3xQ8rLPyOs8lnjw2RLx7IQDRs4vQjtL5BWY2XWuCSittYsp+Ba58QneA4A725s7
 NnPfDUXwNNQYyb7Odaax0dckYxgkUx4kdcSw8duoEBegEyqYVypgZgN6/YYg4dYxocq6oejvlT9
 4CxVoHZ4i3kKcOoyOthlOdaJPThpb6chUOBIekUrbSdmqbm9TuG/0fJ6Ie8BGOLGFV9ckd3tKWy
 SVno/lbjdDy4RWYM+zpMZrClCpFYktTnFEYQukrCH/oVUK3vyazVM6hpBFdvLZ5qU+kro0mHvef
 WSXUC4A8CW9PUuaXktESi3Hup4Kwrhz
X-Developer-Key: i=prcups@krgm.moe; a=openpgp;
 fpr=520A5276CE39DC51D354D0515D1D389B76BA6263

Add the RPMh clock data, GCC binding and GCC driver for Qualcomm
Netrani (SM7435). The implementation follows the existing Qualcomm clock
controller infrastructure.

---
Changes in v2:
- Define and require the GCC parent CX power domain.
- Number all three GCC GDSCs from zero and add the PCIe GDSC.
- Correct the six RCG parent maps, data tables, and parent counts.
- Fill the previously sparse EMMC and video AXI reset entries.
- Add both QUPV3 SE5 roots to the DFS clock list.
- Keep the registered camera sleep clock enabled as critical.
- Write the video AXI PMU-disable configuration to its actual register.
- Use the common Qualcomm clock controller probe and configuration helpers.
- Retain the Reviewed-by tag on the unchanged RPMh binding.

---
SignKirigami (4):
      dt-bindings: clock: Add Qualcomm Netrani GCC
      clk: qcom: Add the Netrani global clock controller
      dt-bindings: clock: Add Netrani RPMh clocks
      clk: qcom: rpmh: Add Netrani clock resources

 .../bindings/clock/qcom,netrani-gcc.yaml           |   84 +
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |   11 +
 drivers/clk/qcom/Kconfig                           |   11 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-rpmh.c                        |   22 +
 drivers/clk/qcom/gcc-netrani.c                     | 2816 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,netrani-gcc.h       |  185 ++
 7 files changed, 3130 insertions(+)
---
base-commit: ef922b721a5e99348fc1f5801fdeb427ee14ee9f
change-id: 20261124-netrani-clock-v1-419a42208b1b

Best regards,
--  
SignKirigami <prcups@krgm.moe>

