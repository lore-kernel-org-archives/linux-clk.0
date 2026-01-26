Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DA90237180;
	Mon, 26 Jan 2026 06:02:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769407329; cv=none; b=Mrv/J0A8qelbAC0FuSnvz7lw8F1RvcNVkppgG88TJnuaXNTfJTkmebZEx6PW1VtU/Kqz9eM1SUCJkWhwKg+f6W0UBoEr13KmNyeuQ6HgbeBCmUEnGcwtnWk5x6laxUOx2AXvPh1ZXiFXQ617F1Lw61HeNeYKQav7DLA4bcf5Gsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769407329; c=relaxed/simple;
	bh=qEtF9Tw4fx/2Jty79ppvIz7CP62SnXqAy+iNLSUBip4=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=NPkhwXSgpzIPOj9wUxsIgQPHlhvjR+oVYtnPdoHy0PHXqs0vKrhcHSImZTPgyNDXy8wQ905TE/Dk/g/gLwMqdlkXlDX4BobCUw93M6FbpnUP6xuUhGKuchZiNpiG61sKNkIJtuBtxMtpK+ZqlINP/j7fFNDFV0NAQPyfFMhIa9Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dqC+rMt7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dqC+rMt7"
Received: by smtp.kernel.org (Postfix) with ESMTPS id 9C68DC116C6;
	Mon, 26 Jan 2026 06:02:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769407328;
	bh=qEtF9Tw4fx/2Jty79ppvIz7CP62SnXqAy+iNLSUBip4=;
	h=From:Subject:Date:To:Cc:Reply-To:From;
	b=dqC+rMt70hkiO7cMwssaVcGPwlarLzrW+Pade5196nNdTWaegPeAUmdyJW8w+2/YD
	 BoNbNGA7fUbKfGFniam/AvJ7PbV15CMrbmWHtdntCQUeRvHeN6YNCoQQ4KpRHUo8f1
	 zAsfkaMJNSCdZROswlrjCYKBnRzWPpWnvLH4cexDtGWAnqwzqmHXT2qAFY0bjwbUMl
	 DnWi0aNv8A4XP767HIk2zmL98nQlmNvjw8nlGPkMyLYxn45KzLkdRbqdzDiFHBj8PB
	 VUIZPeYR0TW2zrnCVFlRJhxjeeDTsW32Yl8qHJW8ji0Hrak46UwDocSaP4BNYu2irM
	 oQjYvjz8Yy5SA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87BC0C88E48;
	Mon, 26 Jan 2026 06:02:08 +0000 (UTC)
From: Jiebing Chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Subject: [PATCH v6 0/5] Add support for S4 audio
Date: Mon, 26 Jan 2026 06:01:41 +0000
Message-Id: <20260126-audio_drvier-v6-0-99e350855bc2@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEUDd2kC/2XQ32rDIBTH8VcpXs/h0WOO2dXeo5Rh/dMKax1ml
 Y6Sd58plLQJXv2Ez1fwxoZQUhjYx+bGSqhpSPncRve2Ye5oz4fAk2+bSSG1ABDcXnzKX77UFAo
 XZLUy4LDHPWvkp4SYrvfcdtf2MQ2/ufzd6xWm20dIvYYqcMGNAyQSURkrPu3pOx+Se3f5xKZUl
 TOXgAsuG1dkDESryPVhzdUTl2bBVeN+H70SWlBAt+Y4cwX9gmPjnWmHovUE/ZrrmdPyE6ueXkf
 QOkIg7PCVj+P4D20+qnamAQAA
X-Change-ID: 20250110-audio_drvier-07a5381c494b
To: Jerome Brunet <jbrunet@baylibre.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jaroslav Kysela <perex@perex.cz>, 
 Takashi Iwai <tiwai@suse.com>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>
Cc: linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
 jian.xu@amlogic.com, shuai.li@amlogic.com, zhe.wang@amlogic.com, 
 jiebing chen <jiebing.chen@amlogic.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1769407326; l=2929;
 i=jiebing.chen@amlogic.com; s=20250110; h=from:subject:message-id;
 bh=qEtF9Tw4fx/2Jty79ppvIz7CP62SnXqAy+iNLSUBip4=;
 b=WCDI9XkY2n9SqNdLfweZHucE91kO1Vkl16ikZivtzdied/xBtb0KevVqUxXxDRvqnnOPud5/b
 uR1LzpOKTLkDAAGHjO+d81vpRcobgj77DdbglTNv4hSkyDNnVdv4gXF
X-Developer-Key: i=jiebing.chen@amlogic.com; a=ed25519;
 pk=6rFvvF45A84pLNRy03hfUHeROxHCnZ+1KAGw/DoqKic=
X-Endpoint-Received: by B4 Relay for jiebing.chen@amlogic.com/20250110 with
 auth_id=316
X-Original-From: Jiebing Chen <jiebing.chen@amlogic.com>
Reply-To: jiebing.chen@amlogic.com

This series completes the end-to-end audio support
for S4 SoC from hardware bindings to driver implementation
and system integration.

1 Device Tree Bindings Updates 
Added audio power domain and S4 audio clock support for S4 SoC.
Added S4 audio tocodec binding support.

2 Driver Implementation
Implemented S4 tocodec driver for G12A architecture.
Added S4 audio clock support in AXG audio clock 

3 Device Tree Integration
Add Amlogic S4 audio subsystem support in arm64 DTS.

Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
---
Changes in v6:
- Fix the problem of string for Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
- Remove clock pad register, and it will be submitted as an independent patch.
- Redescribe sound/soc/meson/g12a-toacodec.c
- Link to v5: https://lore.kernel.org/r/20250710-audio_drvier-v5-0-d4155f1e7464@amlogic.com

Changes in v5:
- Fix warning Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yam when make dt_binding_check
- The audio reg is mounted below the APB bus in dts file.
- Deal with pad clock in a distinct controller.
- Fix warning for sound/soc/meson/g12a-toacodec.c
- Link to v4: https://lore.kernel.org/r/20250319-audio_drvier-v4-0-686867fad719@amlogic.com

Changes in v4:
- fix dtb check warning 
- add maxItems of power domain for dt-bindings
- fixed audio clock pads regmap base and reg offset 
- use dapm widget to control tocodec bclk and mclk enable
- Link to v3: https://lore.kernel.org/r/20250228-audio_drvier-v3-0-dbfd30507e4c@amlogic.com

Changes in v3:
- remove g12a tocodec switch event
- Modify the incorrect title for dt-bindings
- Link to v2: https://lore.kernel.org/r/20250214-audio_drvier-v2-0-37881fa37c9e@amlogic.com

Changes in v2:
- remove tdm pad control and change tocodec base on g12a
- change hifipll rate to support 24bit
- add s4 audio clock
- Link to v1: https://lore.kernel.org/r/20250113-audio_drvier-v1-0-8c14770f38a0@amlogic.com

---
Jiebing Chen (5):
      dt-bindings: clock: meson: Add audio power domain for S4 soc
      dt-bindings: Asoc: axg-audio: Add S4 audio tocodec
      ASoC: meson: g12a-toacodec: Add S4 tocodec driver
      clk: meson: axg_audio: add S4 support
      arm64: dts: amlogic: Add Amlogic S4 Audio

 .../bindings/clock/amlogic,axg-audio-clkc.yaml     |  18 +-
 .../bindings/sound/amlogic,g12a-toacodec.yaml      |   1 +
 .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     | 222 +++++++++++++
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi          | 361 +++++++++++++++++++++
 drivers/clk/meson/axg-audio.c                      | 165 ++++++++++
 sound/soc/meson/g12a-toacodec.c                    |  36 ++
 6 files changed, 801 insertions(+), 2 deletions(-)
---
base-commit: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
change-id: 20250110-audio_drvier-07a5381c494b

Best regards,
-- 
jiebing chen <jiebing.chen@amlogic.com>


