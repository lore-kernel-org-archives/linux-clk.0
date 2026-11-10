Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794277724;
	b=lhFSSjJOycybVDjc6x3u9uldz60X367dtse3lW+hsKDUdGgM8gim3QqGNk5N/dLdGqpd
	 sICFh8tizCiVE1hqkovAEzVTnkAP2MalcZgRdwuXDe+NykHoKSbtysB/C/+Xu5u3bxY+/
	 dX10sV6fPRecCxWB+2lSBSh3aCaMkU4v3ekm4FfVYu8uh0dA8A3BjiZZsSXrmn0fhkfS8
	 3s7wcjVwyU7JPE49t6HknhJbHv+tJYL4FAfT1KT3deyz0LI0/W2YpEXpEJ6jdPnOCtazn
	 sDG5EFGN4MTE8p9+snV/RzPrYrf0l+6F5/4vbf6WBjlsbJoOsyhupnrtXh57ozXRFCg==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794277724;
	h=Received:DKIM-Signature:Received:From:Subject:Date:Message-Id:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Endpoint-Received:X-Original-From:Reply-To;
	bh=8ecZOHoObiB+kPAF4SpLaHxeA23SUq7WeosA8aG0FT4=;
	b=yQ6C3MdkZVSMhw1blRKdeuzUxME5HQqlYxX8Ch5rb8UnNxkMUV/vKMULLIRFQP0S9V7R
	 msfBm4kNY4mJNR0JeEyGa/uxKYmjAsXWIuS2xRwbxMGWqNzEtSI5r2TKcm3v3VJxJb/4s
	 o8puK/dq6eCQAx/uvbNnovq+AMpAbs50ElxiP6M+ywhEAEOW8ClXseonJLhtu8SVCu3Lz
	 POnPpqbbFqjn2nlQVilMHmGqGGZYLtV47EUjYux1Lg0S2BxhipnzLbqPwRJ0xvpXRpHUJ
	 75dnHqSJ1e++UV3KY2VaFiGYOgjueT1ZyndXlLL25krW4B8FSbqq0ZInLk7xYuJ5EAA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=agJHtwEL;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9470606A330;
	Tue, 10 Nov 2026 02:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=agJHtwEL
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1794277723;
	b=cCaTw4tn51+57BVbgJra1UdGo7fw+ZLbHob14gMv+QCuBW9rj+qKFGZLx/exHB3GbJU5
	 LSLl0z37loPKEJnZ16a7/dX8OwI1JlDYPvPn+SoNYUKnN7OCT0WhPXDrvjQNrJHVBtVsg
	 1Pq6Ji2leyDvmBd5mp95rxDewGYdGuq2YVj/yq58M7TK5zCwvfjTCsNdIAFNOZYIhEwwq
	 9MmxBKAd8/V4FR/Gh15t4Sz2E4HLCZVL/lFEOozgLGIOSKnTgfRKC4FjBWYMknQQhQZe/
	 bKjGI3sfYNKjr0kpKcBX+fr7ZaX7teXcGopaq2Woe6LtGugMExelKEf/ojSsdwQsacw==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1794277723;
	h=DKIM-Signature:Received:From:Subject:Date:Message-Id:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:X-B4-Tracking:X-Change-ID:To:
	 Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To;
	bh=8ecZOHoObiB+kPAF4SpLaHxeA23SUq7WeosA8aG0FT4=;
	b=iOO1RMcXpss64AanoK2fNICBm53tifAoTlur4TloaxAv1Z5vmtfMM4pEFyuH1VlQndZJ
	 P5Ugs5unVRcCw9fj8onUBjRX/voM5HTxyUVGJYBaGTX/A5//Lq7fvEYboyMvx2VvTkLMa
	 Vx8ahptLLFN4Byn++MAGYjOk1ffXh6LEJn520+6+JlMwjDud0x1OuPpRiqtbwqTt85r22
	 B0UJI9htBsH6DyaWEY3cfhcbrNY+Vr0nMIHr5TpfGO54q9+i93E902NC0QWw3DidkQY67
	 zQi6mRYBM5DRdnH+E8/VXno3FrcLoo6+vxaodxxMHGlC6w40nMF7kCc7mBD15xl1zMg==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 37C261F0089F;
	Tue, 10 Nov 2026 02:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794277723;
	bh=8ecZOHoObiB+kPAF4SpLaHxeA23SUq7WeosA8aG0FT4=;
	h=From:Subject:Date:To:Cc:Reply-To;
	b=agJHtwELRQpst+vZ+QDZVUP5wp5hHo4DCjHChOzgNQwiIEQTSDH/xNh3g+/j22ZCl
	 NnO+yL+ijLaSHyB9OZPX4uFRKaH7GUBY3zTsBu3Y14FaozNZdaM/CZKWTS8LSMpceG
	 xVy9ldm5fOhwIrA7hUsMYIuPrObXWZ575nXbcPObdOE3NLFDvi4SrIB/VjOgg5cg26
	 xog8mTADrdSgCJE4d0lqWgVo/Rk4I8YmCob3CN4+X5nuk9/CSy/D0LZ6g9pMn4kJRJ
	 8HJOPCpDBTbHrTzbVIKBFEv+iAaj4VOd67Dk5TLnA+NTOc5YXEX9WYzKmdKINDTPXa
	 nVtvTeykRTPiA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 87A514876C;
	Tue, 10 Nov 2026 02:28:41 +0000 (UTC)
From: Jiebing Chen via B4 Relay <devnull+jiebing.chen.amlogic.com@kernel.org>
Subject: [PATCH v8 0/5] Add support for S4 audio
Date: Tue, 10 Nov 2026 10:28:23 +0800
Message-Id: <20261110-audio_drvier-v8-0-1489241e4c83@amlogic.com>
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
X-B4-Tracking: v=1; b=H4sIAEeB8moC/2XQ3UoDMRAF4FcpuXYlk79JvPI9RCSbTNqA7UpWg
 1L23c0Wam2WuToD3xmYM5upZJrZ0+7MCtU85+nUgn3YsXDwpz0NObbMBBeaA/DBf8U8vcVSM5W
 Bo9fSQlBOjayRj0Ipf1/qXl5bPuT5cyo/l/YK6/ZaJO+LKgx8sAEUIk/Sev7sj+/TPofHMB3ZW
 lXFjQtQHReNS7QWkpcYHG25/MeF7bhsPI4pSq45kgpbrm5cguu4atzYNph8RHBbrm8c+ydWvV5
 XoHUCQmXUlpsrNxyE6bhp3DmSmlutxyC2HP84tN91HBsXo/PkyYXR+nu+LMsv6TZNmyQCAAA=
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
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794277720; l=5902;
 i=jiebing.chen@amlogic.com; s=20250110; h=from:subject:message-id;
 bh=1IdD/x6+9H2DA3RNvBtQLVmSshzcx8N4zmIF2uAhX+Q=;
 b=iAgcOXLuH6BggNRoyiFrLKN+7qA4360Uw+cKC0YrkpK7ifL5t8b+4BK9u9MeJ2i1FW37kLBV5
 weB8Qqjgu+TA/vGIEk0rZEaHWK3C04S2+g/6PUe8Sb/vI6FMi8zGYYR
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
Changes in v8: 
- The S4 clock-enable macros now have an _S4 suffix, and S4 uses its own source mux at the correct bit instead of the SM1 one.
- Align the new CTRL0_BCLK_ENABLE_SHIFT and CTRL0_MCLK_ENABLE_SHIFT macros with the existing style: two spaces after #define, 
  and the values lined up with the other CTRL0_* macros.
- Rename the DAPM supplies from I2S BCLK Gate and I2S MCLK Gate to I2S BCLK EN and I2S MCLK EN.
- Connect both clock supplies directly to OUT EN. They are no longer chained, so the audio path does not pass through them. 
  OUT EN enables BCLK and MCLK when it is powered on. The audio path remains IN -> SRC -> OUT EN -> OUT Capture.
- 5 V regulator. Drop regulator-boot-on and regulator-always-on from vcc5v_reg. It stays the amplifier VCC-supply and is enabled only when the amplifier is in use.
- Unused codec. Remove the dmics node. Nothing referenced it.
- Amplifier name. Change sound-name-prefix from 10U2 to Analog_PA, and update the audio-routing entries to Analog_PA INL, 
  Analog_PA INR, Analog_PA OUTL, and Analog_PA OUTR.
- 64 kHz clocks. Keep CLKID_HIFI_PLL at 1179648000 for the 48 kHz family and CLKID_MPLL0 at 270950400 for the 44.1 kHz family. Add CLKID_MPLL1 at 393216000 for the 64 kHz family.
- Coaxial SPDIF output. Add spdif_out_h_pins in meson-s4.dtsi. GPIOH_4 is muxed as spdif_out_h / spdif_out, with a 3 mA drive and the bias disabled. 
  &spdifout_a uses that pinctrl so the coaxial output can be enabled.
- Disabled by default. Mark the audio controllers, the audio clock controller, and the audio arbiter as status = "disabled" in meson-s4.dtsi. AQ222 enables only the instances it uses.
- Codec supply. Move AVDD-supply = <&vddio_ao1v8> out of the SoC dtsi and onto the board-level &acodec node.
- Add the missing blank lines after the new power-domains property and after the new allOf conditional block.
- Link to v7: https://patch.msgid.link/20261021-audio_drvier-v7-0-2b9aeae9cb8a@amlogic.com

Changes in v7:
- Use the supply widget to manage the tocodec clock enable signal.
- Remove redundant MPLL frequencies.
- Fixed dt_binding warning
- Link to v6: https://lore.kernel.org/r/20260126-audio_drvier-v6-0-99e350855bc2@amlogic.com

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

To: Neil Armstrong <neil.armstrong@linaro.org>
To: Jerome Brunet <jbrunet@baylibre.com>
To: Michael Turquette <mturquette@baylibre.com>
To: Stephen Boyd <sboyd@kernel.org>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Liam Girdwood <lgirdwood@gmail.com>
To: Mark Brown <broonie@kernel.org>
To: Jaroslav Kysela <perex@perex.cz>
To: Takashi Iwai <tiwai@suse.com>
To: Kevin Hilman <khilman@baylibre.com>
To: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: linux-amlogic@lists.infradead.org
Cc: linux-clk@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-sound@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org

---
Jiebing Chen (5):
      dt-bindings: clock: meson: Add audio power domain for S4 soc
      dt-bindings: Asoc: axg-audio: Add S4 audio tocodec
      ASoC: meson: g12a-toacodec: Add S4 tocodec driver
      clk: meson: axg_audio: add S4 support
      arm64: dts: amlogic: Add Amlogic S4 Audio

 .../bindings/clock/amlogic,axg-audio-clkc.yaml     |  17 +
 .../bindings/sound/amlogic,g12a-toacodec.yaml      |   1 +
 .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     | 311 ++++++++++++++++
 arch/arm64/boot/dts/amlogic/meson-s4.dtsi          | 396 +++++++++++++++++++++
 drivers/clk/meson/axg-audio.c                      | 165 +++++++++
 sound/soc/meson/g12a-toacodec.c                    |  64 ++++
 6 files changed, 954 insertions(+)
---
base-commit: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
change-id: 20250110-audio_drvier-07a5381c494b

Best regards,
--  
Jiebing Chen <jiebing.chen@amlogic.com>


