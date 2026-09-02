Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5519259C80;
	Wed,  2 Sep 2026 06:14:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788329691; cv=none; b=EtTaQLp02zpF6a47h+shOihASxD6I338RVYJmHp+V6urnmUU0J2E8msZVXqCwaYtWubh2YPxxRfxSkgPqNywB7fJvL0kAgHtEujnOGzg8KEk0PKUlSK1Sd/rSxIKSTnBGZaneLJgH4qDu7kHfhrh74lFXnioApXEQHSjohFD0vo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788329691; c=relaxed/simple;
	bh=W6lCnDcYh4MouWKfwnyUMC1XovFPt8CXhaCRKhfe2AI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=msZremRHrn+4w2g5PbfhL4oXwRqwKPTUORAf3RYSd22wgBkBrm5IOHow+zid2VmdqJ12BaEGHZxFLRYdIePAXUGQJAUowGKPkkFx09mIIDdzYzzxe1LNQJLKkqNI7DsEbM7dhXdN2ESsPkT1otuCmdKVH3CZjvq0dLhPfYQJQlc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=K3oALGCu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="K3oALGCu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C7A81F000E9;
	Wed,  2 Sep 2026 06:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788329690;
	bh=90mMDivmYLVIhr+/B44twx1FX2pVghFNM7BHpRHGf1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=K3oALGCueE9NBlx2SKSN0VucF44Mm7ljVbXvTVDEZUOUOyOJU2GE/yBOMNRNBzh07
	 kEgzSsWyRLs0TI78Ofun4nHMROXzDhyAzcSMkD54PHd3G/JZYjvu/tFUmZ5EFSE+Bc
	 LzhiDDM6+M7daSZc++dHU8ikKCpBB6Q0yUzKDKm7fd8OwgMYrd2/L3YB/mrqUfe3ly
	 Wi4MwITnir7pPF0kJFmKB2lGo28bKl+SX7npxhmVt08BOCgnQfqafu1GIyJcN0Oj5M
	 oLua04+sYbUIlrNkY3JoqQt+aawM12jdfUvp4lEqMYoelUH8vBviYCdQ9fdJdJ7eUr
	 XPs1x3MzQ9sDA==
Date: Wed, 2 Sep 2026 08:14:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank.Li@oss.nxp.com
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, "open list:NXP i.MX CLOCK DRIVERS" <linux-clk@vger.kernel.org>, 
	"open list:NXP i.MX CLOCK DRIVERS" <imx@lists.linux.dev>, 
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>, 
	"moderated list:ARM/FREESCALE IMX / MXC / LAYERSCAPE ARM ARCHIT..." <linux-arm-kernel@lists.infradead.org>, open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: clock: imx5: add assigned-clock*
 properties
Message-ID: <20260902-wonderful-tangible-warthog-d927f3@quoll>
References: <20260901193720.1066686-1-Frank.Li@oss.nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260901193720.1066686-1-Frank.Li@oss.nxp.com>

On Tue, Sep 01, 2026 at 03:37:19PM -0400, Frank.Li@oss.nxp.com wrote:
> From: Frank Li <Frank.Li@nxp.com>
> 
> The i.MX5 CCM is a pure clock provider with no 'clocks' consumer
> property in its binding. The dtschema framework only merges the
> clocks.yaml meta-schema properties (which include assigned-clocks,
> assigned-clock-parents, and assigned-clock-rates) into a binding
> when the binding itself declares 'clocks:'.
> 
> For example, imx53-m53menlo.dts configures the CKO1 output clock
> by setting assigned-clocks on the &clks node:
> 
>   &clks {
>     assigned-clocks = <&clks IMX5_CLK_CKO1_SEL>, ...;
>     assigned-clock-parents = <&clks IMX5_CLK_AHB>;
>     assigned-clock-rates = <133333334>, <33333334>, <33333334>;
>   };
> 
> Without explicit declarations this triggers a dtbs_check error:
>   arch/arm/boot/dts/nxp/imx/imx53-m53menlo.dtb: ccm@53fd4000 (fsl,imx53-ccm): 'assigned-clock-parents', 'assigned-clock-rates', 'assigned-clocks' do not match any of the regexes: '^pinctrl-[0-9]+$'
> 
> Assisted-by: Claude:claude-sonnet-4.6
> Signed-off-by: Frank Li <Frank.Li@nxp.com>

Then the DTS is wrong. If this device does not have a parent clock
input, then assigning clock parents is wrong because it is either
contradictory (you said no parents) or misplaced (clock consumer should
set it).

Best regards,
Krzysztof

