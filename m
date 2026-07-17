Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37BF8BA3D;
	Fri, 17 Jul 2026 00:05:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784246731; cv=none; b=kJKbD+ddQSdtFoC/vkQTljHlfuzhCli9yiRR2yVKj0RA/1vTbyYwEuy6Q31VrskqZuGMjAO7i/yNKXFSP0lVcy5WrvEt5rUzOWH/3jMdNd24Cy20PKvBRVl/wki90/AIYp2GvtIQJUbxhhNcZeWyEKU0+aAlQtCcA8J8Ms1lF6A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784246731; c=relaxed/simple;
	bh=0b7Ef1o2uFzK8rIM18eEMI0w8nTQIpvgk9cpICo2lGw=;
	h=Date:Content-Type:MIME-Version:From:Cc:To:In-Reply-To:References:
	 Message-Id:Subject; b=SvlvR5Fpj637i9W6PN+XZmGoCQYOzVveeOysioh9n1WyLl02fAefcaNwKbO3E5whrMD1yH7pHdruJS719m6+q3AbHK5eqAeD4F73Yu5e7eKVVySWZ25hUZeAi715vWJYFLzP6IkQvay0p96x+d+SIraBJPD0wehGOlvEET6HnJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=S2BBny1z; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="S2BBny1z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE2FF1F00A3A;
	Fri, 17 Jul 2026 00:05:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784246729;
	bh=zeYcmDAhR8mywlpb3AsXpEdGhrnmI2OfwnbW1aLTUCk=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=S2BBny1zPu79IxN5GVqyWZV8s5bxNvEx9OTnv1BOluW8a0ERODOz46Hiu7AEbj2zq
	 9EXLGKK6SlCu1tMCxSo6UwlDm929Kd2HJtZ1YTXflb28rnb9zv2sMOXrWJ/rmBeyp6
	 qc91Dk8M3fEJ89511akW0gB/mZ2nGuksGx6m7Of1a6mT7vT9Ps8IOF4HrcSpl4oYlU
	 kR2NjMAIeMMt3MgfNgXsKybe5xO4SlgS9oZVGKlA10IEzEBKrffVbBwzUiHi6EBSgJ
	 pdvHqxgmPsQa/RTLyPBbpNZv5/QmOsU3JY5ObuKBK1nLh9U1/evuGFdlPq/jfTocQn
	 U+GKt4Y3GaFqQ==
Date: Thu, 16 Jul 2026 19:05:29 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-phy@lists.infradead.org, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
 Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 linux-arm-kernel@lists.infradead.org, Stephen Boyd <sboyd@kernel.org>
To: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
In-Reply-To: <20260717-zx29clk-v7-2-408411cfcf36@gmail.com>
References: <20260717-zx29clk-v7-0-408411cfcf36@gmail.com>
 <20260717-zx29clk-v7-2-408411cfcf36@gmail.com>
Message-Id: <178424672826.2081877.18233525928867886605.robh@kernel.org>
Subject: Re: [PATCH v7 02/13] dt-bindings: clk: zte: Add zx297520v3 top
 clock and reset controller


On Fri, 17 Jul 2026 00:35:38 +0300, Stefan Dösinger wrote:
> These SoCs have 3 clock and reset controllers: Top, Matrix and LSP.
> Clocks go from oscillator -> top -> matrix -> LSP, with a register in
> top controlling most clocks that get passed to matrix and a register in
> matrix controlling all the clocks that get passed to LSP.
> 
> Generally every device has two clocks (one work clock, and one that
> connects it to the bus, I call it PCLK), two reset bits (I don't know
> what the difference is - sometimes asserting one is enough to reset the
> device, sometimes both need to be asserted). PCLK and WCLK are
> controlled by individual gates. Some devices have a mux and/or a
> divider for their work clock. Some devices, like the GPIO controller,
> only have reset bits and no clocks.
> 
> The top clock controller is fed by a 26mhz external oscillator and has 4
> PLLs to generate other clock rates. ZTE's kernel mostly relies on the
> boot ROM to set up PLLs, but one LTE-Related PLL is not configured
> on some boards. Therefore my driver contains code to program PLLs. It
> produces identical settings as the boot ROM for the pre-programmed
> frequencies.
> 
> Not all clocks will have an explicit user in the end. I am defining a
> lot of them simply to shut them off. The boot loader sets up a few of
> the proprietary timers, which will send regular IRQs (although the
> kernel of course doesn't need to listen to them). I don't plan to add a
> driver for the proprietary timer as I see no use for them - the ARM arch
> timer works just fine. I will add a driver for the very similar
> proprietary watchdog though.
> 
> The clock list in this patch is pretty complete but not exhaustive.
> There are other bits that are enabled, but I couldn't deduce what they
> are controlling by trial and error. Some of them seem to do nothing.
> Others cause an instant hang of the board when disabled. It is quite
> likely that a handful more clocks will be added in the future, but not a
> large number.
> 
> Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
> 
> ---
> 
> Changes v6->v7:
> *) Moved the bingings back into clock/ (Krzysztof). use clock-controller@
> in example and in the later DTSI patch.
> 
> *) With as lucky find in strings in LTE's cpko.ko blob I could make sense
> of the register that controls which clocks get passed from PLLs into
> the clock distribution inside topcrm. Importantly that also narrows
> which clocks can possibly be passed to Matrix, so I could slim down the
> bindings considerably.
> 
> *) Add a usb phy child node with the phy schema added in the previous
> patch. I don't expect the USB status register to ever be in another
> place, so the binding expresses the @84 expectation.
> 
> Changes v5->v6:
> Set value for syscon-reboot example (Sashiko). It was my intention to
> set only the lowest bit, and I think Sashiko is right that without
> 'value' being set, all other bits are actively set to 0. It shouldn't
> matter given my understanding of the hardware (afaics all other bits are
> ignored), but actively clearing bits was not my intention.
> 
> I haven't changed the name match for "syscon-reboot". I see plenty of
> examples of hardcoding this string as opposed to having a regex for
> syscon-reboot@12345678 in other bindings.
> 
> Changes v4->v5:
> 
> Rename from zte,zx297520v3-topclk to zte,zx297520v3-topcrm and move to
> soc/zte
> Fix path in MAINTAINERS
> Add syscon-reboot node to the binding
> Give the USB and HSIC PHY resets their own reset control
> ---
>  .../bindings/clock/zte,zx297520v3-topcrm.yaml      | 123 +++++++++++++++++++++
>  MAINTAINERS                                        |   3 +
>  include/dt-bindings/clock/zte,zx297520v3-clk.h     |  66 +++++++++++
>  include/dt-bindings/reset/zte,zx297520v3-reset.h   |  32 ++++++
>  4 files changed, 224 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/zte,zx297520v3-usb-phy.example.dtb: clock-controller (zte,zx297520v3-topcrm): 'clocks' is a required property
	from schema $id: http://devicetree.org/schemas/clock/zte,zx297520v3-topcrm.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/zte,zx297520v3-usb-phy.example.dtb: clock-controller (zte,zx297520v3-topcrm): 'clock-names' is a required property
	from schema $id: http://devicetree.org/schemas/clock/zte,zx297520v3-topcrm.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/zte,zx297520v3-usb-phy.example.dtb: clock-controller (zte,zx297520v3-topcrm): 'syscon-reboot' is a required property
	from schema $id: http://devicetree.org/schemas/clock/zte,zx297520v3-topcrm.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/zte,zx297520v3-usb-phy.example.dtb: clock-controller (zte,zx297520v3-topcrm): '#clock-cells' is a required property
	from schema $id: http://devicetree.org/schemas/clock/zte,zx297520v3-topcrm.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260717-zx29clk-v7-2-408411cfcf36@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.

