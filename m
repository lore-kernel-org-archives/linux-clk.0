Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0027B2EB10;
	Wed,  5 Aug 2026 10:33:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785926007; cv=none; b=hrUJAvNtbnIG5U41m8woTiCAox8INHMl5godq3dplp6VHIjcmFfZ1XuqcvUfQL+/15ogLVao8A3c0Xse9sHFLtGyikzxI4Qj1GbKl9QAVVUOgiJyBKvqEoVtr+O65J8WG0XkMhW4WyyXQPDzReJhsT9DDdTShBgaUllpOXCXD24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785926007; c=relaxed/simple;
	bh=KpUclSqc6f6re3FfItiLbO3O5MGeREx/fi6Z2V3ow+M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=BUieCDCISnwm3EKbQyafEdpZzpBqdKMKM8DJWL9fuclDrmJGa0/j8fEFPC/+0ZBCNKTskCcHW8LLC4GazdSG9GqntBvOYPsU2OfQZClidnlljGlxhu13DMXQ25sDB7OkgB1Nj4VgzE2Ztfdg++wqsqQ3TWM+kb7qbOOhMSzjsU8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CnrDHDAw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CnrDHDAw"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9469FC19425;
	Wed,  5 Aug 2026 10:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1785926006;
	bh=KpUclSqc6f6re3FfItiLbO3O5MGeREx/fi6Z2V3ow+M=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=CnrDHDAw1PdonmRrQd1zvAdHd7+1OT3uGaIIyNID1oABqAuwHx2DDnSw6QnTCwP6r
	 914bxKokFTy8e50ARXMZvJPn8ZJa2AupYl5hUePUOeVIpsKf9QNcZzTwLD1DwDhz5C
	 iCg2AHBWbFMpeqyzCrnE883nDj/jNw5ESwkKsetUJq1EyU6qkioiTHHo9YknSnIlQJ
	 dVQpIDa/rr5x57W+0cR3dvZLydD8l/DiRM2rv/gg5XVP19Q6sKBvVIymAJl8mlh/qL
	 IqVI/qa4wj+BdY2axpV8rkD0B0m3vQtH6u7srS5u0sPVhZQhHl8ooQ4ekYnaP5SvXV
	 QTpqx+MkD44iw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EFF8C56201;
	Wed,  5 Aug 2026 10:33:26 +0000 (UTC)
From: Sarath Ganapathiraju via B4 Relay <devnull+sarath.ganapathiraju.oss.qualcomm.com@kernel.org>
Subject: [PATCH v4 0/2] Add LPASS VA CSR HeartBeat pulse clock support
Date: Wed, 05 Aug 2026 16:03:18 +0530
Message-Id: <20260805-master-20260805-sync-v4-0-dfbcbf427c2c@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAG4Rc2oC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyTHQUlJIzE
 vPSU3UzU4B8JSMDIzMDCwNT3dzE4pLUIl04v7gyL1k3xcLSKM0yxTzRKNVACai1oCg1LbMCbGx
 0LIRfXJqUlZpcAjJLqbYWAK/OU3N4AAAA
X-Change-ID: 20260805-master-20260805-sync-d892f9d7a2e0
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 prasad.kumpatla@oss.qualcomm.com, 
 Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785926004; l=2273;
 i=sarath.ganapathiraju@oss.qualcomm.com; s=default;
 h=from:subject:message-id;
 bh=KpUclSqc6f6re3FfItiLbO3O5MGeREx/fi6Z2V3ow+M=;
 b=YMAW/r8QQ29ZYG/yb1pBb8vdoLuv2Qcdis5Mq6yvn+Q+IYZ4J9C5D9vA9/1mMLQ89GKcAfUVX
 nD+dzae7tOnBDSsxX9UnwEdbeOHNdZRz2aZFuNvuQRQkicMZ6g3uxfM
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

Changes in v4:
- Renamed the binding filename and schema ID to hawi-specific naming:
  qcom,lpass-va-csr.yaml -> qcom,hawi-lpass-va-csr.yaml.
- Narrowed the DT example register window to the rate generator
  registers only, and aligned the node name with the base address:
  clock-controller@7eed000 with reg <0x0 0x07eed000 0x0 0x14>.
- Renamed Kconfig symbol QCOM_CLK_LPASS_VA_CSR to
  QCOM_CLK_LPASS_HEARTBEAT_PULSE.
- Added devm_pm_runtime_enable() in lpass-va-csr probe path.
- Dropped the qcom,lpass-va-macro binding extension patch - no in-tree
  user yet; will be resubmitted with the hawi DTSI changes.
- Dropped sound/soc/codecs/Kconfig select wiring from this series to
  keep it clock-only.
- Link to v3: https://lore.kernel.org/all/20260723-master-v3-0-3d67b79b0515@oss.qualcomm.com/

Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
---
Sarath Ganapathiraju (2):
      dt-bindings: clock: qcom: Add LPASS VA CSR HeartBeat pulse clock
      clk: qcom: Add LPASS VA CSR heartbeat pulse clock

 .../bindings/clock/qcom,hawi-lpass-va-csr.yaml     |  51 +++++++
 drivers/clk/qcom/Kconfig                           |  12 ++
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/lpass-va-csr.c                    | 148 +++++++++++++++++++++
 4 files changed, 212 insertions(+)
---
base-commit: 0f6da28aab51b16762ed82e8fdeaa5042da45b08
change-id: 20260805-master-20260805-sync-d892f9d7a2e0

Best regards,
--  
Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>


