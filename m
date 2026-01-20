Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7BEEC3A9007;
	Tue, 20 Jan 2026 07:44:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768895049; cv=none; b=I22LtUlzZMRhh8/raJvsuNPNBll8BJ/9UoRj3HoC4BYi/LP/OMf3I5tuN6k+YRDuVLwHZjYRyi2L4odk4j76GCudfqq8cC5LqOcwfzExGClmv00Sdsp+8Si1e1fhUtqpGcEFt6DPTiIIDIteJdCm9npwnhN2h98VPFLWpKsfNJY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768895049; c=relaxed/simple;
	bh=3FdCWbpHGnOa9d474ekESwths/fgerczsQGnYoqyesM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=C7TT3Nbgi8sPN9ConO5M/UQC3MZo6TF9Ey+oc85lcs6fEtbzUhRry+lGu3g6Ad9nYl/us8gy0yCPsRJpaVDAktS771Dcyq1Xt/2q+HBF3lgIKiKNw6XPeRdrROKWQTsQkloXm8/jlIJPliZ4fhNGKICS3sRVjbjmbIkHnwS12D4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SOsmDkXg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SOsmDkXg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5B2DEC16AAE;
	Tue, 20 Jan 2026 07:44:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768895048;
	bh=3FdCWbpHGnOa9d474ekESwths/fgerczsQGnYoqyesM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SOsmDkXg1+q2jVa149rD1QxMzFPXxJDhlycxyjlDGzlIVg09opT36ZhK1orSZKcWw
	 6BtsROT/oPv/jHQgMVyMB62TCnt2eBjSSnfJpFTABS7gae4NHIoCJar1+IWfiC2B34
	 vq91xwppDmuRJ6wbVrzlhjQ2rhEpWrnppTCEUgttKsE0caI5bEnzboqvK+S7KwIUkG
	 Ry8uMV1zAdLLiBmS79Qro1GMoXe23no/tgRs1orn1Y0oxjcXHwPcJ/cV4FbnXMjJ5O
	 9Cd3iYYWxWRRejl2C2ihDNZLPyx8v40SqCgCtwVKwWL4/vQWwLTIg1XDpv7A1sZHsi
	 kJ4pQbKlJRoGA==
Date: Tue, 20 Jan 2026 08:44:06 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-clk@vger.kernel.org, 
	imx@lists.linux.dev, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH RESEND v2 1/3] dt-bindings: clock: imx6q[ul]-clock: add
 optional clock enet[1]_ref_pad
Message-ID: <20260120-enlightened-tungsten-orca-d4613a@quoll>
References: <20260119-ccm_dts-v2-0-efcf9155941a@nxp.com>
 <20260119-ccm_dts-v2-1-efcf9155941a@nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260119-ccm_dts-v2-1-efcf9155941a@nxp.com>

On Mon, Jan 19, 2026 at 02:22:56PM -0500, Frank Li wrote:
> Add optional clock source enet_ref_pad for imx6q, enet1_ref_pad for imx6ul,
> which input from ENET ref pad.

This commit is doing much more - making anaclk2 also optional - without
any reason/explanation.


Best regards,
Krzysztof

