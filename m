Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7983F49363E;
	Fri, 21 Aug 2026 17:56:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787335012; cv=none; b=qXUfECotTtLxZPo4HMtDDEg14NMZaCU+mnC1MwlFavX31pyw5F1ZRIqjiqz56d6UdVRY2z5nj+fwjeCGnxYehZOB+oubiVYsEoymS/bZFDSEP0oIFknCLjFAWZ6FL/ezcdqu9Sz7XIk4f/X7V5ZQBivOWxRC+UjbmH10IIf3JMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787335012; c=relaxed/simple;
	bh=DTm+vDPv1k8qSXOK7ZhpU3VBb6E0LutRexbQzhnAEk0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=QAARvJMgZQ83n5xNR23HmqVxMECWzqZb7e4nCY624lb+AEH2G/EMnUmTiglzecRE9MZkrNDl/O79niobV/hEf393OEu8eqLJtCeY6Rj43aTqxURr/CDcOlrMcpXT3EmhUodtpXG0pgLVCBrvMVyu9SZWPaBSx2DZBouu418VEw4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ScRRrUX5; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ScRRrUX5"
Received: by smtp.kernel.org (Postfix) with ESMTPS id E5593C19425;
	Fri, 21 Aug 2026 17:56:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787335012;
	bh=DTm+vDPv1k8qSXOK7ZhpU3VBb6E0LutRexbQzhnAEk0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=ScRRrUX5rCtGXxBnyr8BLv7N7OXn1AgmqYnfjqFhSvfsIgwk2skQKAZ2LWE3UkYoE
	 9cIGcYr1wDFzjL1Boc9F2bHbIWw2djCNZphFas6kuT1gpP8u/ruxOBuLJJHqJVbKM8
	 wh3lih/+ySjvhIYkPnM3/bDaGI7J7fdlggQ1ZcU5HbYwrMeiGHglCngpeevmMZH3sw
	 d1MQj/1ubWuMTa4WfYcvHO8XyaN7hETRuAG91WCrTxf2bkWixkmu/3kmg2BgDXybw/
	 heaI3y7Ts+Ke581dk16mLYVzlx6LjLHsHIFR1C18x07heixVH99wxkP8immQyZHdsX
	 PBKknCAUiMrtA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BBCC4C5DF8C;
	Fri, 21 Aug 2026 17:56:51 +0000 (UTC)
From: Sarath Ganapathiraju via B4 Relay <devnull+sarath.ganapathiraju.oss.qualcomm.com@kernel.org>
Subject: [PATCH v6 0/2] Add LPASS VA CSR HeartBeat pulse clock support
Date: Fri, 21 Aug 2026 23:26:49 +0530
Message-Id: <20260821-heartbeat-v6-next-20260821-send-v6-0-62c5df84ce21@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGGRiGoC/z3NwQrCQAyE4VcpORvYphrEVxEP23a08bDKZi2F0
 nd3VfD4MfDPSo5scDo1K2XM5vZIFbpraJhiuoFtrCYJouEoLU+IufSIhWflhKXwf3KkkQ9BpWu
 lU8Q91coz42rL9+F8+dlf/R1D+WRp295JFfTvgwAAAA==
X-Change-ID: 20260821-heartbeat-v6-next-20260821-send-506231236ea4
To: Bjorn Andersson <andersson@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
 Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>, 
 prasad.kumpatla@oss.qualcomm.com, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787335010; l=3479;
 i=sarath.ganapathiraju@oss.qualcomm.com; s=default;
 h=from:subject:message-id;
 bh=DTm+vDPv1k8qSXOK7ZhpU3VBb6E0LutRexbQzhnAEk0=;
 b=Tp5dGc3Y9qTybkTKzf8ub3OUHTCqnDdwOEtwDUw9HorAOyQkDfN8x7VivOncEKGqc+ECOC46c
 Yt4GdMvoBupCIrxrCk6xAfFesmoC9BLs6yrdrL3jbvMrYu/jTamevHN
X-Developer-Key: i=sarath.ganapathiraju@oss.qualcomm.com; a=ed25519;
 pk=4p2FWGXM+F2sir13Lu5stw5aKX5trUymK/ttESvgxQg=
X-Endpoint-Received: by B4 Relay for
 sarath.ganapathiraju@oss.qualcomm.com/default with auth_id=870
X-Original-From: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
Reply-To: sarath.ganapathiraju@oss.qualcomm.com

The LPASS VA CSR block contains rate generator hardware that produces
a HeartBeat Pulse (also known as RateGen Pulse). This pulse
synchronizes the start of the DMAs and Codec Interfaces for the audio
usecases and can serve as a periodic wakeup source for the DSP.

This series adds the DT binding and driver support to model this
rate generator as a clock provider.

Patch 1 adds the YAML binding for the new qcom,hawi-lpass-va-csr
clock provider node under Documentation/devicetree/bindings/clock/.

Patch 2 adds the lpass-va-csr driver under drivers/clk/qcom that
registers the lpass_heartbeat_pulse clock and enables/disables the
rate generator via regmap when the clock consumer requests it.

Changes in v6:
- Rebase the series on linux-next next-20260821.
- Capitalize Hawi in binding text (Bjorn).
- Simplify the binding example by removing the soc wrapper and
  two-cell address/size setup (Bjorn).
- Keep the full VA CSR register window in the binding and describe it
  as the VA CSR register block after Konrad clarified the earlier
  register-range concern (Bjorn, Konrad).
- Link to v5: https://patch.msgid.link/20260806-master-20260805-sync-v5-0-0ff42e9b6431@oss.qualcomm.com

Changes in v5:
- Add explicit ARM64 Kconfig gating and Qualcomm default-module policy
  for QCOM_CLK_LPASS_HEARTBEAT_PULSE to align with nearby qcom clock
  entries.
- Link to v4: https://patch.msgid.link/20260805-master-20260805-sync-v4-0-dfbcbf427c2c@oss.qualcomm.com

Changes in v4:
- Rename the binding filename and schema ID to hawi-specific naming:
  qcom,lpass-va-csr.yaml -> qcom,hawi-lpass-va-csr.yaml (Krzysztof).
- Rename Kconfig symbol QCOM_CLK_LPASS_VA_CSR to
  QCOM_CLK_LPASS_HEARTBEAT_PULSE (Konrad).
- Add devm_pm_runtime_enable() in the lpass-va-csr probe path.
- Drop the qcom,lpass-va-macro binding extension patch; it will be
  resubmitted with the Hawi DTSI changes.
- Drop sound/soc/codecs/Kconfig select wiring to keep this series
  clock-only (Konrad).
- Link to v3: https://lore.kernel.org/all/20260723-master-v3-0-3d67b79b0515@oss.qualcomm.com/

Changes in v3:
- Move the qcom,lpass-va-csr binding under
  Documentation/devicetree/bindings/clock/ (Krzysztof).
- Move the driver under drivers/clk/qcom/ (Krzysztof).
- Improve the schema description and use generic clock-controller node
  naming (Krzysztof).
- Use additionalProperties: false and keep compatibles sorted.

Changes in v2:
- Split the qcom,lpass-va-csr and qcom,lpass-va-macro bindings into
  separate patches.
- Fix the qcom,lpass-va-csr example to use a 2-cell reg property.
- Switch heartbeatpulse clk_ops from atomic to sleepable callbacks.

Changes in v1:
- Initial version.

Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
---
Sarath Ganapathiraju (2):
      dt-bindings: clock: qcom: Add LPASS VA CSR HeartBeat pulse clock
      clk: qcom: Add LPASS VA CSR heartbeat pulse clock

 .../bindings/clock/qcom,hawi-lpass-va-csr.yaml     |  45 +++++++
 drivers/clk/qcom/Kconfig                           |  14 ++
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/lpass-va-csr.c                    | 148 +++++++++++++++++++++
 4 files changed, 208 insertions(+)
---
base-commit: 903c1cf6dff9964e71eda98a39e2e5d442050472
change-id: 20260821-heartbeat-v6-next-20260821-send-506231236ea4

Best regards,
--  
Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>


