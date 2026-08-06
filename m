Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AECE63EF64A;
	Thu,  6 Aug 2026 14:51:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786027909; cv=none; b=YxGQXAdpVlbgR9Klb08nAZhUJ2O0LH4lPwfihEbfZa0a+RG9zKpV4LECSZjZIpn5IDD24+EYcZOs3y4pXv1ZMuI31A38csqLb8xGPPG73LuVSrirWHMl2DR/JwA8kR2oW8Y9zSo4UVqcNig+Xr+7Orup/5P3dSZWgnwCfrbEwXM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786027909; c=relaxed/simple;
	bh=uJNdXIFgQgYW7BJ6rwbHA99ZOQQ5DTapOLjFDhH/nB0=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=HDok2g2RdPyHO3H3Ckcdr87OBFqRJ3XtTurd6402geRfb5boODjkavtg8EEQExTNs87CDQhRV3vLZRwUflybSoktmR35wV5wPLFM6ftfvv/Jt1lAiDLuqMCOxwDyHUN/aglQqTxiZNUvjdXp7KD/Coed20PH6cbHp7K5RpmCVSA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LpVPyCJ0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LpVPyCJ0"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 45A1AC2BCC7;
	Thu,  6 Aug 2026 14:51:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786027909;
	bh=uJNdXIFgQgYW7BJ6rwbHA99ZOQQ5DTapOLjFDhH/nB0=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=LpVPyCJ07j7nsB4RPBhLoXmglMMUNuuzDmfiJo26gnee7u4W0RE8uH55gk13feKcD
	 Duc9lEJwG+4I0MY9DYDcH/KUYKtZojE4YzrvRz3GpGZ5tKB9M7oPOgfDNFZtMYE/Dg
	 5C00tf6QwOEYMUorMU7Z1pHeTH0vg1jMmLvniURQU7dCN7zToUCuMztiI9eJKgpNw2
	 li4uun8+zWY6fZZ6TlMznIBou0FFnVWMb1tIhvPBihNCfibdSaHT0AvjjqgmPzkrdj
	 db2xm10ICGxcDB8apjHq7qe9iRmUUc8Q/boKbiPrN6PU8d8LTIrBYawRq02a/O1eOx
	 anqhXXBkX+SPQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F2FAC56205;
	Thu,  6 Aug 2026 14:51:49 +0000 (UTC)
From: Sarath Ganapathiraju via B4 Relay <devnull+sarath.ganapathiraju.oss.qualcomm.com@kernel.org>
Subject: [PATCH v5 0/2] Add LPASS VA CSR HeartBeat pulse clock support
Date: Thu, 06 Aug 2026 20:21:35 +0530
Message-Id: <20260806-master-20260805-sync-v5-0-0ff42e9b6431@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHefdGoC/4WNwQqDMBBEf0X23EgIWrWn/kfxEDebmlKNzapUx
 H9vtNBrLwMPZuatwBQcMVySFQLNjp3vI+SnBLDV/Z2EM5FBSXWWpcxFp3mkIH7MS4/ClJWylSm
 0IglxOgSy7n3c3uov89Q8CMf9a2+0jkcflsM7Z3vvj2LOhBTGNtjYTBWo8OqZ09ekn+i7Lo0B9
 bZtH6UR4RfRAAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786027907; l=1751;
 i=sarath.ganapathiraju@oss.qualcomm.com; s=default;
 h=from:subject:message-id;
 bh=uJNdXIFgQgYW7BJ6rwbHA99ZOQQ5DTapOLjFDhH/nB0=;
 b=e9Q3J9EBXuJaEsyD2GGPwc4HRbRsJcmp+kH8UN6BktBqIyAFV2pS9AbQVhIR9/D6X357G+KA4
 ogjRD0YJa+bBfSkVH6Ihc+dBIA7UAMIguhbobRZg1ZUtcr90AoiUtlb
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

Changes in v5:
- Add explicit ARM64 Kconfig gating and Qualcomm default-module policy
  for QCOM_CLK_LPASS_HEARTBEAT_PULSE to align with nearby qcom clock
  entries (sashiko-bot).
- Link to v4: https://patch.msgid.link/20260805-master-20260805-sync-v4-0-dfbcbf427c2c@oss.qualcomm.com

Signed-off-by: Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
---
Sarath Ganapathiraju (2):
      dt-bindings: clock: qcom: Add LPASS VA CSR HeartBeat pulse clock
      clk: qcom: Add LPASS VA CSR heartbeat pulse clock

 .../bindings/clock/qcom,hawi-lpass-va-csr.yaml     |  51 +++++++
 drivers/clk/qcom/Kconfig                           |  14 ++
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/lpass-va-csr.c                    | 148 +++++++++++++++++++++
 4 files changed, 214 insertions(+)
---
base-commit: 1701fda2f58e345c050f4309971bdc07cd6146ba
change-id: 20260805-master-20260805-sync-d892f9d7a2e0

Best regards,
--  
Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>


