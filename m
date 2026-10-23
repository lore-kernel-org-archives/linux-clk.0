Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792750216;
	b=2CONnMjVijTcq47RXppdwk7Arn11snbfvWv/MXUGiAJ6MbAVxAJTkntTWgMHoy81K0Pn
	 59pa+RWfOsdoJQPgFkc0S3u7UwKPpLz+xPoGZYWoeMk0yKbzcjmJYv6stD+dwHApv8eUJ
	 tgp77dKuAwSSjb+X2htZC0Ckp/jdsgC4E1FX6vczjBIfwazEh3qCYRmp2YTuB+MW5Dw+P
	 yuv9C3jIUrVuKekFfaSKLGr5KeU7OtLTT7XqD+qsZgEomVX86yYVuU2vwAzIjUHzzXvNP
	 SGdX576+QUWaIgY70PLutKYQ8Bl0McF2Frd8vUUcjLJksMuXeboFife/GRE++yHUV2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750216;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=S8GJ9siej7w1DyCBSgHDDIiUMVmRnOoZd6O/X+GOfS0=;
	b=KyxnpW14IeSQr4C8MvV0TwZZSRyy+y/9mrWpUyTQsd2VpXyCOWlozyYmqXvBt3tF52dy
	 B239KMonhpjl6bLkjf7ShhJCh/A01z43qGRLIqdaA9ukMQbJx6HwthXsxJuhwW2evtGCE
	 HhdAQqGWZnncTiS+1H/ahFrFklT1Gl+CPf+8zLNNxo6QDA+hZBVxndBOqIhNL4pAshQ0z
	 ToajYIQvAd5fmrqm9iohJ41vihihi0Ow94elFH/p2/86LT+WNXSwdCBnidXplfJ3EpU7D
	 FD5kQ6mornm75RnyefWE7zIy2AzL5pmIiCDsE0Knbz5u/W6cKLkuA9kTKgY/ivkcVPQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X+BcUnAL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B76E606A31D;
	Fri, 23 Oct 2026 10:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=X+BcUnAL
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792750214;
	b=CMnDV+sLrNPO11t5gBVWqZzKc4UB0EhLFpX/fyoUKr+IrMy/2XjtE5Hv8qf1wyaIYFa/
	 tNwOCZ2kUe3aHXq0F1foPHDdPEryn9t/7c2lBQc8W8nCtj4jLwmPvk0G+7s9SfZFgQtkg
	 obh4GQErHKXsrLY5OTGuggDhGtR/gyLAxZOVMdX1/R1R3Cf0JLSiVnXwPRa9glMXrZh/5
	 2SOalP8RqEdLeVgg5eKwHa9tBKTFJA0ZDNmHM8vOpxLhAP+JecuEN9tMA4IjTmui5XViv
	 vz9qPFHtCUOZW6dviqdfGmSZr7oMY7mllWDX5o6iXBlPfDGc9c5Qg1fFnVRv2EL9hcQ==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792750214;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=S8GJ9siej7w1DyCBSgHDDIiUMVmRnOoZd6O/X+GOfS0=;
	b=S9oSoFEf8VWktbNuabL+Mc9pp2/uPEs6/MhgNfZI1EyorzSzg1anr2SKlO8XEEVIUStQ
	 6/9IHeg42f67VkhkjoRVyZ6l1g/gDnLdClWzwf9i1KY4QMOodrhdbs8zt6+akOaQLyOK9
	 zw0kZvYI5ZTUGfNSZJPaf0mSeIDGyWiVVTJbV+nnUA/ra1w9GqHN8NZ6mJwvJWH/8vGLo
	 Or5ySTP8pIoOdNvGxvgSDzrVfSBgkmcVvAW0B79YHJGPKqVKnkYjQ/HDBHP4RbhTwNF7p
	 7ylakYLQX2sxJWyyXCGeyHgeEA9JjJb+kgA+RgTOLz0wNSfZEo4hhNYrINYUJsK55kw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 562771F01828;
	Fri, 23 Oct 2026 10:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792750214;
	bh=S8GJ9siej7w1DyCBSgHDDIiUMVmRnOoZd6O/X+GOfS0=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=X+BcUnAL1a0FF02lCVRMgyrDNVspV4TgknPaaHd2HL+DEpa7maZiEQ9R/z3czOH1F
	 4e1xyOtU8dvmWnxDH48heHKS2TX8g7LB8gn0mTNAIJOvLkIwU6Voj+sWcz9uTu4L3n
	 pkKtT7JUdyCcZsmdk0E44Gno/wFXjBZ1qFq4KZmAHv8ZnyuCfc62c0YZ+SqXNTEKHb
	 3wgS89EgVVbthuSpdsHJdDFEaN02wIpGO4UdhJaUcLXI+jCdQUq4nHqSVNkstrorgs
	 LQvaLt1JOYLkUAkqUnVrTy92I16i2sn5uVeMGDKbiZtCqCvtgFShEbmH+00YWZjrIQ
	 doC/LzzvzfBGw==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id CA63D4449A;
	Fri, 23 Oct 2026 10:10:13 +0000 (UTC)
From: Ishu Brar via B4 Relay <devnull+patches.brar.si@kernel.org>
Subject: [PATCH 0/2] clk: qcom: Add SM7250 graphics clock controller
Date: Fri, 23 Oct 2026 15:40:07 +0530
Message-Id: <20261023-gpucc-sm7250-v1-0-d9149cece8be@brar.si>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2O2W7CMBBFfyXyc43siRcSVRX/UfHgZRzc1iyep
 EJC/DuG8HikO+fMjRHWjMTG7sYq/mfKp2MD+dGxcHDHCXmOjRkIMFJAz6fzEgKnYkELbiS4qHs
 jbELWTs4VU76+dN/7lWnxPxjmp+O9qHhZWmdeZ6wgkXt1xu5zzUgjFKgeNltQXHKqiNSe+XVVD
 FLspuLy3yacytfT6B0hb1DyPHZJGwuujykJGGQ0Tmn0IoDe+iGCd+hVDNpatr/fHyBHHdz8AAA
 A
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792750212; l=2244;
 i=patches@brar.si; h=from:subject:message-id;
 bh=csQC91w2xnFUlZjbWTApHmZ5Uas0bD/vSn5E/fO39W4=;
 b=eoO5HEEjzPQcGmT63wRlGxDPu6REpgOtQxbetg3n/SEXmy874oxqpn3A+/SAmh1TCsEuINkpy
 19GMUOwlu6XCEQkc5wQ7/tT37XoQ6N0a4Ab0cVj90VkRljn55+wmc0d
X-Developer-Key: i=patches@brar.si; a=ed25519;
 pk=Ds+E23E3ntzjPzuBDyVRkOouclcNI5k75R+N42yJtCk=
X-Endpoint-Received: by B4 Relay for patches@brar.si/default with
 auth_id=1189
X-Original-From: Ishu Brar <patches@brar.si>
Reply-To: patches@brar.si

Add the graphics clock controller (GPU_CC) of the Qualcomm SM7250 SoC
(Snapdragon 765/765G/768G): a binding patch with the header, and the
driver. It provides the GMU clock with its Lucid PLL, the GPU CX and GX
power domains and the GPU SMMU vote clock. The driver follows gpucc-sm8250;
the PLL settings, frequency table, register offsets and GDSC data come from
the downstream driver of the platform.

This series depends on the SM7250 GCC series from Shreeshankar [1] (the
Kconfig symbol SM_GCC_7250 and the parent clocks come from it). The
Adreno 620 series [2] needs this controller for the GMU clock and the GPU
power domains. The SoC devicetree nodes are not part of this series.

Tested on a OnePlus Nord (a 7.3-rc7 based tree with the GCC series
applied): the controller probes and provides the clocks and power domains
for the Adreno 620 GPU. I have not tested the GPU at full load on this
combination, and have no other SM7250 hardware.

[1] https://lore.kernel.org/r/20261016042432.824-1-sreeshankar0910@gmail.com
[2] https://lore.kernel.org/r/20261023-adreno-a620-v3-0-2d1d566e5e13@brar.si

Signed-off-by: Ishu Brar <patches@brar.si>
---
Ishu Brar (2):
      dt-bindings: clock: qcom: Add SM7250 graphics clock controller
      clk: qcom: Add SM7250 graphics clock controller driver

 .../devicetree/bindings/clock/qcom,gpucc.yaml      |   2 +
 drivers/clk/qcom/Kconfig                           |  10 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/gpucc-sm7250.c                    | 366 +++++++++++++++++++++
 include/dt-bindings/clock/qcom,gpucc-sm7250.h      |  36 ++
 5 files changed, 415 insertions(+)
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


