Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B67235D60B;
	Tue, 27 Jan 2026 15:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769529400; cv=none; b=R0SjHteoKWKwg6ZvIVQakRTL5nvEoH7eJimvKlwnZiqg+depU3m2iylfY8sGsBbxyARjtx+3zBBoypMQ0RMjmQe8XPrrOw7eLNC3iXrUdhgndG+1qIO+GdSUGoMPg4kk5FOrEBkgA/wodYCK2Cz3p3HUqVy/FeYySPknvEdnyDA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769529400; c=relaxed/simple;
	bh=pyesTGZkOMY1CDLH595pytnp+a/HTRbOucVfk8mO0ZE=;
	h=From:Date:Content-Type:MIME-Version:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=mqNrqxxcLv7WZn4QbIZZmFWFJ6xAFPFjH6HrttcSK8nFA8Opv8Q6TjyorwNoFXPID1hSm1zG9QGFkSxdI7ApJBsVl3WxoSDrthGn0BFaoBmmhJpsI3jcW1zUqEKHnzEeNByMhd2G2xvzHvxE//4taJVrBbvV1QFJFypwqVKdMk4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ljxMjaQU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ljxMjaQU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CED1C116C6;
	Tue, 27 Jan 2026 15:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769529400;
	bh=pyesTGZkOMY1CDLH595pytnp+a/HTRbOucVfk8mO0ZE=;
	h=From:Date:Cc:To:In-Reply-To:References:Subject:From;
	b=ljxMjaQUO+xIXWR2kM5tAeDfxymnyk4/q4shrBM0f5GeTIT0DmYoM63aLv7+lQcCy
	 Rk7IYQtD1bOoEL0oQEWsZBhaCCEXDj4NLcqQYJQxNV1sXXqEs/2rRpnRnRMR6KyYRo
	 buTfxs1BbBY+zuVAYwZD0matwCs7Looq6cbtnepQqI7Eq0owiAxLkgGkHmulB4I+GP
	 1ti7KFgGBbQspUdPV6iBN6kp/6PFtkyA3D252xhb5n0H5rVunUEgP++7niqXUr2eAd
	 K60jcWQ3eZZbSf6vQT4KkJdCCletNodCaJzokJuwQN97yc0spPtBp6VjXxUASch5Tm
	 sgmxNsvhOULWw==
From: Rob Herring <robh@kernel.org>
Date: Tue, 27 Jan 2026 09:56:39 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
 Kevin Hilman <khilman@baylibre.com>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, linux-amlogic@lists.infradead.org, 
 Conor Dooley <conor+dt@kernel.org>, Jerome Brunet <jbrunet@baylibre.com>, 
 linux-clk@vger.kernel.org, shuai.li@amlogic.com, 
 linux-arm-kernel@lists.infradead.org, 
 Michael Turquette <mturquette@baylibre.com>, jian.xu@amlogic.com, 
 linux-sound@vger.kernel.org, zhe.wang@amlogic.com, 
 Takashi Iwai <tiwai@suse.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jaroslav Kysela <perex@perex.cz>, Mark Brown <broonie@kernel.org>
To: Jiebing Chen <jiebing.chen@amlogic.com>
In-Reply-To: <20260126-audio_drvier-v6-0-99e350855bc2@amlogic.com>
References: <20260126-audio_drvier-v6-0-99e350855bc2@amlogic.com>
Message-Id: <176952925847.1904460.11456869237043173749.robh@kernel.org>
Subject: Re: [PATCH v6 0/5] Add support for S4 audio


On Mon, 26 Jan 2026 06:01:41 +0000, Jiebing Chen wrote:
> This series completes the end-to-end audio support
> for S4 SoC from hardware bindings to driver implementation
> and system integration.
> 
> 1 Device Tree Bindings Updates
> Added audio power domain and S4 audio clock support for S4 SoC.
> Added S4 audio tocodec binding support.
> 
> 2 Driver Implementation
> Implemented S4 tocodec driver for G12A architecture.
> Added S4 audio clock support in AXG audio clock
> 
> 3 Device Tree Integration
> Add Amlogic S4 audio subsystem support in arm64 DTS.
> 
> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
> ---
> Changes in v6:
> - Fix the problem of string for Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> - Remove clock pad register, and it will be submitted as an independent patch.
> - Redescribe sound/soc/meson/g12a-toacodec.c
> - Link to v5: https://lore.kernel.org/r/20250710-audio_drvier-v5-0-d4155f1e7464@amlogic.com
> 
> Changes in v5:
> - Fix warning Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yam when make dt_binding_check
> - The audio reg is mounted below the APB bus in dts file.
> - Deal with pad clock in a distinct controller.
> - Fix warning for sound/soc/meson/g12a-toacodec.c
> - Link to v4: https://lore.kernel.org/r/20250319-audio_drvier-v4-0-686867fad719@amlogic.com
> 
> Changes in v4:
> - fix dtb check warning
> - add maxItems of power domain for dt-bindings
> - fixed audio clock pads regmap base and reg offset
> - use dapm widget to control tocodec bclk and mclk enable
> - Link to v3: https://lore.kernel.org/r/20250228-audio_drvier-v3-0-dbfd30507e4c@amlogic.com
> 
> Changes in v3:
> - remove g12a tocodec switch event
> - Modify the incorrect title for dt-bindings
> - Link to v2: https://lore.kernel.org/r/20250214-audio_drvier-v2-0-37881fa37c9e@amlogic.com
> 
> Changes in v2:
> - remove tdm pad control and change tocodec base on g12a
> - change hifipll rate to support 24bit
> - add s4 audio clock
> - Link to v1: https://lore.kernel.org/r/20250113-audio_drvier-v1-0-8c14770f38a0@amlogic.com
> 
> ---
> Jiebing Chen (5):
>       dt-bindings: clock: meson: Add audio power domain for S4 soc
>       dt-bindings: Asoc: axg-audio: Add S4 audio tocodec
>       ASoC: meson: g12a-toacodec: Add S4 tocodec driver
>       clk: meson: axg_audio: add S4 support
>       arm64: dts: amlogic: Add Amlogic S4 Audio
> 
>  .../bindings/clock/amlogic,axg-audio-clkc.yaml     |  18 +-
>  .../bindings/sound/amlogic,g12a-toacodec.yaml      |   1 +
>  .../boot/dts/amlogic/meson-s4-s805x2-aq222.dts     | 222 +++++++++++++
>  arch/arm64/boot/dts/amlogic/meson-s4.dtsi          | 361 +++++++++++++++++++++
>  drivers/clk/meson/axg-audio.c                      | 165 ++++++++++
>  sound/soc/meson/g12a-toacodec.c                    |  36 ++
>  6 files changed, 801 insertions(+), 2 deletions(-)
> ---
> base-commit: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
> change-id: 20250110-audio_drvier-07a5381c494b
> 
> Best regards,
> --
> jiebing chen <jiebing.chen@amlogic.com>
> 
> 
> 


My bot found new DTB warnings on the .dts files added or changed in this
series.

Some warnings may be from an existing SoC .dtsi. Or perhaps the warnings
are fixed by another series. Ultimately, it is up to the platform
maintainer whether these warnings are acceptable or not. No need to reply
unless the platform maintainer has comments.

If you already ran DT checks and didn't see these error(s), then
make sure dt-schema is up to date:

  pip3 install dtschema --upgrade


This patch series was applied (using b4) to base:
 Base: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d (use --merge-base to override)

If this is not the correct base, please add 'base-commit' tag
(or use b4 which does this automatically)


New warnings running 'make CHECK_DTBS=y for arch/arm64/boot/dts/amlogic/' for 20260126-audio_drvier-v6-0-99e350855bc2@amlogic.com:

arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dtb: clock-controller@330000 (amlogic,s4-audio-clkc): reg: [[0, 3342336, 0, 216], [0, 3346048, 0, 16]] is too long
	from schema $id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml
arch/arm64/boot/dts/amlogic/meson-s4-s805x2-aq222.dtb: clock-controller@330000 (amlogic,s4-audio-clkc): reg: [[0, 3342336, 0, 216], [0, 3346048, 0, 16]] is too long
	from schema $id: http://devicetree.org/schemas/clock/amlogic,axg-audio-clkc.yaml





