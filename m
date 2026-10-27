Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793075711;
	b=oOH8rTii3rTQOI2PWqyvW+eMCiHbDQCu70ZOhpxnI64Ek5+V9nOoc2E3qJHW34QtEOC+
	 HYx5HOIXvZ1swRk5a3thJX19xCIAzYasUdgw4Oi6k8t4H5fQea3Ao5jmd626RI7hjryqx
	 ESl3OXXDBQCIrRwdzg6ce87sCLMAgBFSFeqcmp5u/dKtBiBQldBqIhS7Exv8h4gEbusId
	 RotiJc7lf7u3KdvRzojnYRMAsd+0H49ax58kAEWH6WmtoIJWDC4cwff0JTQU4nj6zfOa7
	 w6uJRjAuuuYTqGp1DCBfd9xqTo6CEqOnofzrRUQEqrsj5gCKdK0E5l8mBCUOvWC7u0g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793075711;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=NebvlGknF7KOh7JwuzQVzcFDSr5+aRDzBFVfiKH8fyI=;
	b=guFhT5Rm7KCXJ4tCrETCjbBldh+3Yca+fjrVa1JW5ZFMuu8hy58W/szn4gmyTZ/VXk4u
	 UOvHMxNpGItzKWXs3AlXv3mjBuoq2U45U71ZV+cOirhs/uIuj9344BvnmKDuCMuGqBR3d
	 pb5jQM5DY0ulekr+3L0qY8hdr7Kgcui5aH0RRkK3xygC3iXcewhX2DYTyLTujgnkWjfnX
	 GrSoKxFDZlPO+YPq0QmD29kv+1Cob5Neca13UorEv4GSXBqP+FKw1r75CLWKxROhEPLqr
	 QK5W51W6iLqE6UCsrnUtQrM0a3i8TlE4kLPd7VvDAcK41Ct3z0TVyKWgkN7xky7Yixg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="bj5ALs//";
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AAB2606A31B;
	Tue, 27 Oct 2026 04:35:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=bj5ALs//
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1793075711;
	b=2RrS7fA0lHNF0lhEBvLMfAjj5WRzF5gRGYeh5xPiDCRuSnwloo+/FX3PV8lAm9VtPmFq
	 GLSDRiE3qFwKaKuXenM8zJp0MzJAi8BMkrYoE1W0cpiDb8LNGqdmt9iwkzA0DLOPrzjae
	 sWSJeiofWCiN+PbBBFhA9F5/nNhEj+rA8Tod6S0Qhs1lgD1W4FPEY5xdcnYbXFqn1AoPB
	 Ejvf1feWpWnUD6EPsSzxvIJqG+F5bbuedOs4J4wY1s9Q1W+1OxJ3q2sfc4jXkeSdaX6iG
	 mpDbi2dkthPAx30sJbjiece0bUAKgt6N6zodZlZDY4YxLBga2P0wP8WGwf899P07kCw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1793075711;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=NebvlGknF7KOh7JwuzQVzcFDSr5+aRDzBFVfiKH8fyI=;
	b=xdlHWUAmsEbABj/povObB594oP1nA1o8JY77beNPeq/wprUbfWYZ87ho5HoE3UanTGeY
	 EEg0a+Gw9v+uWZ90XrIdkOrJr8YXA+542K+npOHdoGMIxOVMjTH/sivKJhgAZpXNJb64S
	 YIs8YGA+PCPt8I+2XOzxBJXMbL96g1TaIaI2jJsdh0hrnJjRHxVa0vLMzT5hfpwnZ//tg
	 x8995uS1MdUokqnKh9zGAQHF29T/tpn+WYhOVLs/INq6YxILNxXYhqMJTTzdXvXOH07lB
	 LC+RHUkJq4Q8fw0XEqM8kzWDhK6WqEnO7rCYuN7+SyVj/IvWGSs0bo2fRq+7Aw7Qvcw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 602B71F01825;
	Tue, 27 Oct 2026 04:35:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793075711;
	bh=NebvlGknF7KOh7JwuzQVzcFDSr5+aRDzBFVfiKH8fyI=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=bj5ALs//KI+fC3sU0jhvXhvl1PJXW1KkhdxyuaH1avEAqsWICuy15YqRELOHiqLI+
	 MzdLR8NOm7f/OHF0CmQqEGt5s8NAWCxHCVyhnlCO0DjIo0ROvX2sGmAkCI7RW7WDN9
	 FWfGGnZ9aTzKFB+XF4yHupNZ8aawuYSc4f+tSxR+mmra+zpnNWze5b6Mj0HaiMxPcK
	 lYVggqEI00pgYNaThy53ZLNjT6riViZYx9+/J8LeyTl/jyPflGTYie74JZrmXqIOHU
	 ig1kSJqA8EG0pIsftBjURw3oGziWGz7rkX13qESLbOIDJhnXIXtrTEwHXj+mf8C/2f
	 y2u/OUmjc04TQ==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id E68DF44F90;
	Tue, 27 Oct 2026 04:35:09 +0000 (UTC)
From: Ishu Brar via B4 Relay <devnull+patches.brar.si@kernel.org>
Subject: [PATCH v2 0/2] clk: qcom: Add SM7250 graphics clock controller
Date: Tue, 27 Oct 2026 10:05:00 +0530
Message-Id: <20261027-gpucc-sm7250-v2-0-773056e4043e@brar.si>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/22PS26DMBCGr4K8rpE92Cagqso9qiz8GIibElIPo
 FYRd6+BLrv8pP/5ZIQpIrG2eLKES6Q43jPAS8H81d575DFkZiDASAEV7x+z95yGGrTgRoINujK
 i7pBlyyNhF7/3uPfLwTS7D/TTlvGnSPg1557pkLEBieze0xavR400QoGqoDyB4pJTQqQ85maTa
 KQ494ONn6Ufh7ct0VlCnmGIU1t02tRgq9B1AhoZjFUanfCgT64J4Cw6Fbyua7atu0aaxvSzf1/
 kPub/m4vkgodGqsajx5PDs0s2lRTZZV3XX1PSRVNEAQAA
X-Change-ID: 20261023-gpucc-sm7250-612ad53607fe
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Taniya Das <taniya.das@oss.qualcomm.com>, 
 Imran Shaik <quic_imrashai@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ishu Brar <patches@brar.si>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1793075708; l=3255;
 i=patches@brar.si; h=from:subject:message-id;
 bh=R1be+MnTsQew3gpJFOPkTf9+kDjyw1rBWskr1MRsEKU=;
 b=7g7k1hrWpWfwYCQXsHjzzdqO9s0D235sdE2x0R/mxxZYyusKlQuKKpE3L/Wr/cy8BOZLqKF8a
 dp1pRP2T681BrSTry5tp2EYasoCZ2iMY/aWJ/D6kqdrXC0OjeXlwRso
X-Developer-Key: i=patches@brar.si; a=ed25519;
 pk=Ds+E23E3ntzjPzuBDyVRkOouclcNI5k75R+N42yJtCk=
X-Endpoint-Received: by B4 Relay for patches@brar.si/default with
 auth_id=1189
X-Original-From: Ishu Brar <patches@brar.si>
Reply-To: patches@brar.si

Add the graphics clock controller (GPU_CC) of the Qualcomm SM7250 SoC
(Snapdragon 765/765G/768G): a binding patch with the header, and the
driver. It provides the GMU clock with its Lucid PLL, the GPU CX and GX
power domains and the GPU SMMU vote clock. The driver is written in the
current style of the qcom gpucc drivers; the PLL settings, frequency table,
register offsets and GDSC data come from the downstream driver of the
platform.

This series depends on the SM7250 GCC series from Shreeshankar [1] (the
Kconfig symbol SM_GCC_7250 and the parent clocks come from it). The
Adreno 620 series [2] needs this controller for the GMU clock and the GPU
power domains. The SoC devicetree nodes are not part of this series.

Tested on a OnePlus Nord (a 7.3 based tree): the controller probes, and
the Adreno 620 powers up its CX and GX domains and runs Vulkan work with
these clocks.

[1] https://lore.kernel.org/r/20261016042432.824-1-sreeshankar0910@gmail.com
[2] https://lore.kernel.org/r/20261023-adreno-a620-v3-0-2d1d566e5e13@brar.si

---
Changes in v2:
- Renamed the header to qcom,sm7250-gpucc.h to match the compatible (Krzysztof)
- Converted the driver to the current qcom_cc_driver_data style: the PLL is
  configured by the common code and the GMU CBCR settings by the
  clk_regs_configure callback, with const clk_init_data and DT parent
  indices (Krzysztof)
- Use BRANCH_HALT_VOTED for the GPU SMMU vote clock, so its status is
  polled on enable, as in the newer GPU clock controller drivers
- Link to v1: https://patch.msgid.link/20261023-gpucc-sm7250-v1-0-d9149cece8be@brar.si

To: Bjorn Andersson <andersson@kernel.org>
To: Abel Vesa <abelvesa@kernel.org>
To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney+clk@redhat.com>
To: Jerome Brunet <jbrunet+clk@baylibre.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Taniya Das <taniya.das@oss.qualcomm.com>
To: Imran Shaik <quic_imrashai@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

---
Ishu Brar (2):
      dt-bindings: clock: qcom: Add SM7250 graphics clock controller
      clk: qcom: Add SM7250 graphics clock controller driver

 .../devicetree/bindings/clock/qcom,gpucc.yaml      |   2 +
 drivers/clk/qcom/Kconfig                           |  10 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/gpucc-sm7250.c                    | 378 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,sm7250-gpucc.h      |  36 ++
 5 files changed, 427 insertions(+)
---
base-commit: f5672a3dff0291d6a45eb0c258b9d2baeb4dc577
change-id: 20261023-gpucc-sm7250-612ad53607fe
prerequisite-message-id: <20261016042432.824-1-sreeshankar0910@gmail.com>
prerequisite-patch-id: 73b48e3c0861782784c45684336c1cb2c8b37852
prerequisite-patch-id: fb97b00b62996e3d3634185a803a33eb545522dd
prerequisite-patch-id: 8190bf61e50dbe2e09859505e8e4d8cb4ab02ddb
prerequisite-patch-id: 8c34692012f724a93c58e1df02338acec497344d
prerequisite-patch-id: 983ca91f160cca12047d9b0829c8cbbf4cc32e98

Best regards,
--  
Ishu Brar <patches@brar.si>


