Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C22245D5EE;
	Thu, 23 Jul 2026 11:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784805042; cv=none; b=RICUWaGQO6DDDV58tFRr/HyIECAn4wZ4Vfb+PF+sZXei8Mfq7GdPBJjBhJmLC0hAoNco4Bb3aUJYZdsvmunFoecqK3uw+wLWW9+s2Gjk9iOrwq1jilSuvcPI8y/UP+L9TNxRvvNDAZH5c/T42kKjXKvhashxZn9HuyTX6QDCjVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784805042; c=relaxed/simple;
	bh=l3oa2HuoVkp/Srw9vbsk3o2ccBl5T2Eqv6SyF+2OwqU=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=hx1bf29JwMLVGEttZ4Ym03du12Xx1mSZ9dXTTDDnZBdPxveN4Bya8Ul6LX7cqN5XVeKkhqbvHBIjo9urCA5s5CSxjNz3PT5eW8AR6PrGldxx3Nhhcp1mrzBe17S5tfA8rKjAz6ADzoH0i3DHZh7di0UK1feMWnB9ZbzlvzDQvnM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kp6DHDne; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kp6DHDne"
Received: by smtp.kernel.org (Postfix) with ESMTPS id B892CC2BCC7;
	Thu, 23 Jul 2026 11:10:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1784805041;
	bh=l3oa2HuoVkp/Srw9vbsk3o2ccBl5T2Eqv6SyF+2OwqU=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=Kp6DHDne+cHYznWWu3WnFNzVGM50vs0dnXed12g3NegwlyeImWIZPc2q5QMBrVAh8
	 0s9nC6SVvkEh9GnwCwtydydHkksRei1sC3sb/xGEHyXrEwrxw9KKLA1uUF4lxwklmW
	 hmpW5Q4jGey6BlX4iUcTt36Do0kmzJ5k4G5Kn9msw2D/UkeuKq3Xp/Tcl0xCTSmw+v
	 Ec+l1P+OAs+BUjimIfd5Xpn67lRJsonFgFCWQdHjp9vLuGa0ttE3fZk8WW67170qny
	 kyKnM7qhgqSKqrpbS+UcxwV4Fks8pTpule090ohm+J4kapGSp39Yo1/mz/N6/PwHVT
	 EWWr/ItzeDuog==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A14B1C531CB;
	Thu, 23 Jul 2026 11:10:41 +0000 (UTC)
From: Sarath Ganapathiraju via B4 Relay <devnull+sarath.ganapathiraju.oss.qualcomm.com@kernel.org>
Subject: [PATCH v3 0/2] Add LPASS VA CSR HeartBeat pulse clock support
Date: Thu, 23 Jul 2026 16:40:39 +0530
Message-Id: <20260723-master-v3-0-3d67b79b0515@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAK/2YWoC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHUUlJIzE
 vPSU3UzU4B8JSMDIzMDcyMj3dzE4pLUIl1TM1PDtDTT5BSLNEsloOKCotS0zAqwQdGxEH5xaVJ
 WanIJSLdSbS0AdQ+05WoAAAA=
X-Change-ID: 20260722-master-5651ff5cd8f9
To: Bjorn Andersson <andersson@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, prasad.kumpatla@oss.qualcomm.com, 
 konrad.dybcio@oss.qualcomm.com, 
 Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784805040; l=3227;
 i=sarath.ganapathiraju@oss.qualcomm.com; s=default;
 h=from:subject:message-id;
 bh=l3oa2HuoVkp/Srw9vbsk3o2ccBl5T2Eqv6SyF+2OwqU=;
 b=iEzY8De2aHeoWy6q98XC3hNCEw/nOsH6IRa1vojz2agk3llSXCskCIMmrbziRwZ/mUQhFKARQ
 SsQHznwtoz0AltKYpy3Rz77DYAh+xgk40xsZ1ipy0oi6sAhbJ9cxGmr
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

Changes in v3:
- Moved the qcom,lpass-va-csr binding from
  Documentation/devicetree/bindings/sound/ to
  Documentation/devicetree/bindings/clock/ since it is a pure clock
  provider with no ASoC dependency (Krzysztof).
- Moved the driver from sound/soc/codecs/ to drivers/clk/qcom/ for
  the same reason; sound/soc/codecs/Kconfig now selects
  QCOM_CLK_LPASS_VA_CSR instead of carrying the driver (Krzysztof).
- Rewrote the binding description to explain the hardware instead of
  duplicating schema text (Krzysztof).
- Dropped redundant reg and "#clock-cells" descriptions from the
  binding (Krzysztof).
- Switched from unevaluatedProperties to additionalProperties: false
  in the binding (Krzysztof).
- Renamed the example node to the generic clock-controller@7ee0000
  (Krzysztof).
- Dropped the qcom,lpass-va-macro binding extension patch — no
  in-tree user yet; will be resubmitted with the hawi DTSI changes.
- Link to v2: https://lore.kernel.org/linux-arm-msm/20260717-master-v2-0-ae200627ad62@oss.qualcomm.com/

---
To: Bjorn Andersson <andersson@kernel.org>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Brian Masney <bmasney@redhat.com>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
Cc: linux-arm-msm@vger.kernel.org
Cc: linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-sound@vger.kernel.org
Cc: prasad.kumpatla@oss.qualcomm.com
Cc: konrad.dybcio@oss.qualcomm.com

---
Sarath Ganapathiraju (2):
      dt-bindings: clock: qcom: Add LPASS VA CSR HeartBeat pulse clock
      clk: qcom: Add LPASS VA CSR heartbeat pulse clock

 .../bindings/clock/qcom,lpass-va-csr.yaml          |  49 +++++++
 drivers/clk/qcom/Kconfig                           |  12 ++
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/lpass-va-csr.c                    | 143 +++++++++++++++++++++
 sound/soc/codecs/Kconfig                           |   1 +
 5 files changed, 206 insertions(+)
---
base-commit: a6092686b891422f5ba0106b5e0962aecd480b05
change-id: 20260722-master-5651ff5cd8f9

Best regards,
--  
Sarath Ganapathiraju <sarath.ganapathiraju@oss.qualcomm.com>


