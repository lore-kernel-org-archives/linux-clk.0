Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 942DF7FBA2;
	Fri, 23 Aug 2024 06:41:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724395285; cv=none; b=trilMAEYjN8NmikI3914alO9KvvivYyV93rUyDkx3uJeeCcyjPm9Cc85/xddVUHxAk3CqpnL0iiAe1sBzWkqzVvkr9WGUpHQ67O7TityToSajVetoB9X71tDMFEJIGRIrTGOeC5V1//clfOJrXkJZn/7cIRSRZuXVzxYfYJbkxA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724395285; c=relaxed/simple;
	bh=+G4UWcZ+rFXzcdTpfTj594hqIonRj/8dfrcMjb5dDAA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=aQRf4eYbtYnnSHd9Ao1+wMaJ0+WVeY92uYM5ZWLImgxq4fnLJM+V7WnbLgjDQLEzEpLFapUdFcfb1awQokdSioASXk+ELwtihJIGKwWUrHUXL+5feCoo9f7BZgSQftFnQWp6hxMrf8tuVYYccZQ3bo5zBphG35wbBrUc35vjFwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1595BC4AF09;
	Fri, 23 Aug 2024 06:41:19 +0000 (UTC)
Date: Fri, 23 Aug 2024 08:41:16 +0200
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, 
	Jerome Brunet <jbrunet@baylibre.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chuan Liu <chuan.liu@amlogic.com>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/3] dt-bindings: clock: fix C3 PLL input parameter
Message-ID: <5hghvuv2hy4l2ofve4ghb3nhvg76pwpilulznzja25hurxxwcp@2idkyyomv5w5>
References: <20240823-c3_add_node-v3-0-3648376037f4@amlogic.com>
 <20240823-c3_add_node-v3-1-3648376037f4@amlogic.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20240823-c3_add_node-v3-1-3648376037f4@amlogic.com>

On Fri, Aug 23, 2024 at 10:29:17AM +0800, Xianwei Zhao wrote:
> Add C3 PLL controller input clock parameters "fix".
> 
> The clock named "fix" was initially implemented in PLL clock controller driver.
> However, some registers required secure zone access, so we moved it to
> the secure zone (BL31) and accessed it through SCMI. Since the PLL clock
> driver needs to use this clock, the "fix" clock is used as an input source.
> We updated the driver but forgot to modify the binding accordingly,

Please wrap commit message according to Linux coding style / submission
process (neither too early nor over the limit):
https://elixir.bootlin.com/linux/v6.4-rc1/source/Documentation/process/submitting-patches.rst#L597

Best regards,
Krzysztof

