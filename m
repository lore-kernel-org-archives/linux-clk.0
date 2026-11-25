Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=103.47.186.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795611602;
	b=WmkIIlN7WaHpmNG/gSHkwAA+XO+ymQLw5pDJn8wgWMny2BIcO9+13Qk2/uSIXxFjSbNw
	 33fhfVgkqa6F0DJ044jLrO/iy1nfnKdNsIHQc/Li1PUxa1tVlnJQXrzi1T7ii/oPXZzzG
	 MwZhwykT4m9JafZvL0yWYFK9i/9ZmB5pD8v3zAP8e2JXU7e3ye13cjG8Z0DmT0eaQoUK4
	 GJw3+/1lpdzrVW9stBmJrTF/RrElhdMUAOCMktmSXk5hvvBqmDe/1Zm6GPxqaFgFiz6rf
	 rkHjt7ad4i6BwjovAFocQmoepQKR6Ni/yLWbyhvm6w6dLnAz9Oujx8XaSBN4Z8fXgQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795611602;
	h=DMARC-Filter:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=Icj+ygSSy/KS1tH/oG9bxGmPcNdqoucff231QIOHJoE=;
	b=mhVZizd4xXSUgxtmwp0/iyqBQRrl42H7vC8RaWyn3CzjFO3S1frANqvc4bO2vXfMPkuy
	 mrG+1HJlgWv0Jhe2ImXt6yD8olWptGIXl/5VLSdYSZuPkr40+14n5Mj+GomwSNxM/HOT5
	 TL2PU57hRB6EDe1arpmk7x7KnIq0k9PW4paatcGaD5H66k1rp+dDGM4v/6zmphLNJSM17
	 yYp+KpuCLcElQ5hu99RE6k9qR8dTUmOyIY0ubAw2r/WeHM8ErlHkAqbA8ekdQtxfPzMdE
	 IvJjoWVasRLXjLN6je1ohmy4h0aebw1Kz+V7WsYFiVxOURLjQZB0Cv4I4ZOgPdSBvaw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=krgm.moe;
	spf=pass smtp.mailfrom=krgm.moe;
	arc=none smtp.remote-ip=103.47.186.116
Received: from krgm.moe (krgm.moe [103.47.186.116])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 098E7606A331;
	Wed, 25 Nov 2026 13:00:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 098E7606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=krgm.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=krgm.moe
Received: from yuno-laptop.local (unknown [103.47.186.116])
	by krgm.moe (Postfix) with ESMTPSA id 6701983B;
	Wed, 25 Nov 2026 18:29:45 +0530 (IST)
From: SignKirigami <prcups@krgm.moe>
Subject: [PATCH v3 0/4] Add Qualcomm Netrani clock support
Date: Wed, 25 Nov 2026 20:59:06 +0800
Message-Id: <20261125-netrani-clock-v3-v3-0-9b19d320f422@krgm.moe>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/yXMTQ5AMBBA4avIrE1CG79XEYuqwSAlLSIRd1csv
 8V7FziyTA7K4AJLBztejIcMA9CDMj0ht94gIpHGsUjQ0GaVYdTzoic8JGaiUTIt2izvCHy2Wur
 4/JZV/dvtzUh6ez9w3w8q5KmUdAAAAA==
X-Change-ID: 20261125-netrani-clock-v3-72ba369d78fe
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, SignKirigami <prcups@krgm.moe>, 
 Taniya Das <taniya.das@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=2646; i=prcups@krgm.moe;
 h=from:subject:message-id; bh=8tzBImKrGGMxVw/mYHdQQuEW3WMai1ntWopv9SyZFZc=;
 b=owEBCQL2/ZANAwAIAUNLJdlxtMKiAcsmYgBrBtvCy8E0kelBOFCqieWSD51brrCKhsWJAeZTL
 K8Z7TF3iWSJAc8EAAEIADkWIQQKI/ZJLAWGn9r1JLZDSyXZcbTCogUCawbbwhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQQ0sl2XG0wqI3XgwAs+LWKnbm29By2eyqfxTY1+7ziBq4OV3
 LNtjo4FnfSLKrQfU23LWsqdPTq/YMKL21JsZ61nElVEBtFXHnei/o6m5yrH+FdrPDfV6YCPZpcI
 e2v5BxURDNzgTw2MWMqWP++YIRxXNuDr1Zvos5pCMp38t3fyzdZ//7bm5bpcG7Ui/k8o8Lvp0Pk
 sez2qR3SForFj4R2WCU+a0EQ1UjALsDF0PmAADUDoUsU0vh4XzeHGyZgpcf1vDgvEkDjF/miT1m
 pSeAiLlGZddMQ40CDFeuM7uU80wSp3CugTt5u5qoz3y6NwEyrCvqllGtxxtaTvU/FmlOR10geaQ
 I839AIYfiJSEwRXJYjy9K5cdtNGN9W5STZ3Qzh9zaiRFneVDUN8mJFrdVPstbcfQ+8v7V5rFbgK
 8nvto9E+HYAQmUbazU4QnA5oIioT112TbnzbCib6rFJnqwEeoNhs9bxVetc2zClcP2YP7B0AILV
 yn9LsXYFJEL2lUXSFYOrSTUmHR49Z6w
X-Developer-Key: i=prcups@krgm.moe; a=openpgp;
 fpr=0A23F6492C05869FDAF524B6434B25D971B4C2A2

Add the RPMh clock data, GCC binding, and GCC driver for Qualcomm
Netrani (SM7435). The implementation follows the existing Qualcomm clock
controller infrastructure.

---
Changes in v3:
- Correct the GCC binding description of its differences from SM4450.
- Use PHY mux operations for the PCIe, UFS symbol, and USB3 pipe clocks.
- Use shared RCG operations for the USB master, mock UTMI, and PHY aux clocks.
- Add the missing GPLL1 parent to the UFS PHY ICE core parent map.
- Keep the camera sleep clock enabled through the critical CBCR list without
  registering a duplicate critical CCF clock.
- Enable runtime PM for the GCC controller.
- Use DT input indices for external clock parents.
- Require the XO input for all RPMh clock controllers.
- Reuse the QUPV3 SE5 frequency table between both wrappers.
- Drop the Reviewed-by tag from the GCC binding because its description
  changed.

The QUPV3 SE5/QSPI0 register offsets remain wrapper-asymmetric. They match
the downstream gcc-parrot register definitions and are not a mirrored layout.

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

v2: https://lore.kernel.org/all/20261125-netrani-clock-v1-v2-0-9ef014e71737@krgm.moe

---
SignKirigami (4):
      dt-bindings: clock: Add Qualcomm Netrani GCC
      clk: qcom: Add the Netrani global clock controller
      dt-bindings: clock: Add Netrani RPMh clocks
      clk: qcom: rpmh: Add Netrani clock resources

 .../bindings/clock/qcom,netrani-gcc.yaml           |   85 +
 .../devicetree/bindings/clock/qcom,rpmhcc.yaml     |    1 +
 drivers/clk/qcom/Kconfig                           |   11 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/clk-rpmh.c                        |   22 +
 drivers/clk/qcom/gcc-netrani.c                     | 2726 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,netrani-gcc.h       |  185 ++
 7 files changed, 3031 insertions(+)
---
base-commit: ef922b721a5e99348fc1f5801fdeb427ee14ee9f
change-id: 20261125-netrani-clock-v3-72ba369d78fe

Best regards,
--  
SignKirigami <prcups@krgm.moe>

