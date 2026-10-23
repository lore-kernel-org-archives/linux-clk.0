Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792750710;
	b=hkrS6q0et2O5dpYZ7OMlh2oQ1+4GOwaCGXcbg7fV5A4C+EBsLyAkeKYyPihGVaKI5IuO
	 s9Y7PZyGV+5H5oA6B5uJgkLzVork+m2fkpUbJXngjEMjYmCmWGKZqiBBedY8qcpECtriS
	 Mz0q3WE7Z7E0lA1xM/HjIloLHqVBbX7ZgTNQ0irI9qeIIcb64tZmhK3ysPg910ZBPVte0
	 DQjCns6+Cawg0p8onrZLloNeQh1nBQNdkGUfMiFCLnVZgGdiS9EjLcgqNbrdKM3fkUhJ9
	 ZLEeZQKeafmXldt3eQPAxltLunQwUOYmUvYh6iTXgmjaqmZN60U6rOYsZICOdGHwi2g==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792750710;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=ktrgInNQp8Ax0163w+c9EpK/7ktLWavg0zsGGvpYhZs=;
	b=jTHsG2QvBm7zteeTCvVcPqlMKiv1SU3BJMGdvOtRG7oTtfk3LrYRsJmn+k/oGX7SKoUV
	 MYJX2kg05btzCYY09wGY2k+BIvyqrZLIasCggeLR4eh7zNW2v+JhvybRL+BZeqFw2CNd/
	 NEtOBKuWIKycelFy1lLiaNBiPJr0H7ycvNPjSxY3YkEcP/r6rwCv43p3GvxwmgFq6/aBP
	 URlwOzLOq3TvWIVfZOyhVx/Y6SU/RBwNbdXj8n4kpc2zxcoQIqtM4CP0b0rP4YalmF4q8
	 2+vHXMyHvqOEu3AyoKxGRaoGKYJx2azm4S2Q1Qh7LcEkNBS2fULtISQkepEnmSXubMQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F7LThlb5;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB867606A31A;
	Fri, 23 Oct 2026 10:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=F7LThlb5
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1792750709;
	b=XyftOOmZInl54Msxk2/r/bnApVCXWLwrA3UQQg/4c8PxbydPqEoBGeFisJmGRBP58dO4
	 Jv8NgQ7OJBovQDE8REMvkYTdEPc9n6vTDiNMTLg5LJUYihvz0QcDDeIoMD71P0E8zXs+6
	 iCoRelLcv0H73+hk5E3wwqW1JO5JxOh2v/DYXWHsaV2DUXGASYabmdqTB3bXinK1JJ5ik
	 4cxhbSZF8OJtXM4IO2hH/krclrD0QhwSCU2DjqtDxDkYPKMeu+kDTYmcAVE0Wu3v9iqnh
	 PRsmSkWNJy8cgMSUg9Xqnlp1En50lj1Wbd1n4tfGL/j2U9q0htGR3s0t5YR1UWQdibg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1792750709;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=ktrgInNQp8Ax0163w+c9EpK/7ktLWavg0zsGGvpYhZs=;
	b=z97lOvUj1lPdEQpQpzTuXDXeNXNQBsbrAhzJWeIGPSqJzrbLuU4Ch1QXYqmcBW1cwPFR
	 0XeHD0EfR3OU9Seb9BuaJUd/WHDWyvP29TjT4tqDXlko/1NX68XDrkgp9k1YcIf03D4aF
	 I6KXmGt0yKoytsy7DRT7qSWMQG0dQprZ7aA9279lVbA3uFuSuMbwNeQUvZcyKY76xpa8j
	 M75KYg7xfqRr+Rt7JM/yo0O0GQCZKoFQ5nLxrgeNIYfjW/h2siNjBn4lrdPqonRBdE6WR
	 em1V5QTsqfPyCetI39XucoJJ9pK/CxcaicFoue7neehK5DB/b0JCIS2rsnoeeAwR+uw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C05CB1F01825;
	Fri, 23 Oct 2026 10:18:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792750709;
	bh=ktrgInNQp8Ax0163w+c9EpK/7ktLWavg0zsGGvpYhZs=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=F7LThlb5KzlEKXzS4stAggvjLtKN/1+VaIFflZ5Vg4WRz4eC0N7JbbE46Uso5VFxo
	 FkbxhGTtV2lO3nQnNXjaDE9NbUdDuHsldlmY39/UDQSUS/fj30kPYllORUEvwAARMZ
	 ub8L0pjrc2zx9UbKKnNyTKURb+u6C2zZbxyQjDpaxtA1q5uYLvMB7I74qMQuUhRN9k
	 RkbwwaVVLa9bboDVh1+JBmbZbqBwt/fdC18bgTiinL+/PNB5HWn2D2kn8kAO9hJ1uG
	 Ms52caMVPva/6zLtyAmKGzNC66n9AIsI+dzi+k3ZckZV1fvEVEKKarzjUY65OUUy9g
	 ihwx/spgNIATg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 5547F4449E;
	Fri, 23 Oct 2026 10:18:28 +0000 (UTC)
From: Ishu Brar via B4 Relay <devnull+patches.brar.si@kernel.org>
Subject: [PATCH 0/2] clk: qcom: Add SM7250 display clock controller
Date: Fri, 23 Oct 2026 15:48:23 +0530
Message-Id: <20261023-dispcc-sm7250-v1-0-07bdefb99801@brar.si>
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
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/y2O227CMBAFfyXyc43WGzsmUVXxHxUPvqzBbc3FG
 yokxL9jCI8jnZ3Zm2CqmVhM3U1U+s+cj4cG6qMTYe8OO5I5NhYIOCjAXsbMpxAkF4sGZKJekdL
 WaEii3ZwqpXx9+b63C/PF/1CYn5L3otL50kLzMhOFmN0rNHWfS0cNoFH3uFqjlkpyJeL2za+rM
 CrY7IrLf6twLF9Po3dMskHJ89QlM1h0fUwJcFRxcNqQh4Bm7ceI3pHXMRhrxfZ+fwCRzaYu/QA
 AAA==
X-Change-ID: 20261023-dispcc-sm7250-fe31e147540f
To: Bjorn Andersson <andersson@kernel.org>, Abel Vesa <abelvesa@kernel.org>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Ishu Brar <patches@brar.si>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792750706; l=2319;
 i=patches@brar.si; h=from:subject:message-id;
 bh=L42gwoB4IDYurR/qmI07tVWXUEgQ5w5RBtv6+zFe72U=;
 b=tYd7THEuqUZTOOWgDmSDL4eT9QMjuypIbKDrp8Jd4xyY05lmLtGf9+mWuBBOeQsRcE+/E5EqA
 r5L15OO1LfRDh5L2ECpje4kLbypWEa2FSgScoezE+K2EcjwnqduR/vh
X-Developer-Key: i=patches@brar.si; a=ed25519;
 pk=Ds+E23E3ntzjPzuBDyVRkOouclcNI5k75R+N42yJtCk=
X-Endpoint-Received: by B4 Relay for patches@brar.si/default with
 auth_id=1189
X-Original-From: Ishu Brar <patches@brar.si>
Reply-To: patches@brar.si

Add the display clock controller (DISPCC) of the Qualcomm SM7250 SoC
(Snapdragon 765/765G/768G): a binding patch with the header, and the
driver. It provides the MDSS clocks, the MDSS GDSC and the core reset.
Both patches are derived from the SM7150 ones, since the register layout
is the same. The differences are the Lucid PLL and the AHB, MDP and
rotator clocks, which take GPLL0 from the GCC. The PLL settings and the
frequency tables were checked against the downstream driver of the platform.

This series depends on the SM7250 GCC series from Shreeshankar [1] (the
Kconfig symbol SM_GCC_7250 and the GPLL0 parent come from it). The DPU
and MDSS series that follows will use this controller. The SoC devicetree
nodes are not part of this series.

Tested on a OnePlus Nord (a 7.3-rc7 based tree with the GCC series
applied): the controller probes and its clocks and power domain drive the
DSI panel. The DisplayPort clocks and the second DSI link are untested,
because the board has neither. I could not run dt_binding_check on the
binding; I will do that before a next version.

[1] https://lore.kernel.org/r/20261016042432.824-1-sreeshankar0910@gmail.com

Signed-off-by: Ishu Brar <patches@brar.si>
---
Ishu Brar (2):
      dt-bindings: clock: qcom: Document the SM7250 display clock controller
      clk: qcom: Add SM7250 display clock controller driver

 .../bindings/clock/qcom,sm7250-dispcc.yaml         |   73 ++
 drivers/clk/qcom/Kconfig                           |   11 +
 drivers/clk/qcom/Makefile                          |    1 +
 drivers/clk/qcom/dispcc-sm7250.c                   | 1009 ++++++++++++++++++++
 include/dt-bindings/clock/qcom,sm7250-dispcc.h     |   62 ++
 5 files changed, 1156 insertions(+)
---
base-commit: f5672a3dff0291d6a45eb0c258b9d2baeb4dc577
change-id: 20261023-dispcc-sm7250-fe31e147540f
prerequisite-message-id: <20261016042432.824-1-sreeshankar0910@gmail.com>
prerequisite-patch-id: 73b48e3c0861782784c45684336c1cb2c8b37852
prerequisite-patch-id: fb97b00b62996e3d3634185a803a33eb545522dd
prerequisite-patch-id: 8190bf61e50dbe2e09859505e8e4d8cb4ab02ddb
prerequisite-patch-id: 8c34692012f724a93c58e1df02338acec497344d
prerequisite-patch-id: 983ca91f160cca12047d9b0829c8cbbf4cc32e98

Best regards,
--  
Ishu Brar <patches@brar.si>


