Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72FAE35B632;
	Fri, 17 Jul 2026 08:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784276589; cv=none; b=PVyKP5yi6JLKFN8DiF0Zp+LC80JvgR8pjrlfCMA7KJO2+7J5D/qRVL7sQtrqTtIszycIbz3Rb/nt5UI70ZnMgqLjlbr2WOWZBkU5sERcM7yM+LI1chBbGqQevF7HFzrXQekyAn9chAXrdk1u5FD5Jmt4cm8STD0fQ/MElt2TpxE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784276589; c=relaxed/simple;
	bh=L3q6Bs9DpMXvs1gF+DVcAOn4KatvsHwZbqhDUz12DHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=udu52KZeNZb9hgbBDQnZyS+q6VBczHJaAqLTFqPLnQdeL+bZt5lC+kEemBcPxpBQRNLe+vzmILewH2Mn2Q8+wRx0c7dEq2h7j6FadA31hkw2Ufgt+XCJgF5DthpY2fRv5SOYd2AtHF0z+pWDRjtpxhs76sK+URIDK1OLBS402Kg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nP7fqNS2; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nP7fqNS2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05F9C1F000E9;
	Fri, 17 Jul 2026 08:23:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784276588;
	bh=L3q6Bs9DpMXvs1gF+DVcAOn4KatvsHwZbqhDUz12DHs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=nP7fqNS2qhdOU9S60jIgFGJvoVxsPKaDtrvVxzTE7vlxhfE9KUh9VwwObmEdoNfF6
	 CsPkdv5dRIEhfHWjZ3VZMwZyJd59O77Oe8Kzdtz54s85wGLmAQv2W06d85ajaxz3xp
	 Q47Yu+FwR3qTlHQkqBIrcB9qB517Q70oko8h9QSu0Jtq/O+WI0HpdXL+uwMmvw94wS
	 zNTgi9xlzY9bK3wfa9PCgASMXkjiy9n/BSfsJrZpQ9ikyu+EtMwQdpbS8a3O/AwsaY
	 2HDZ/A5iGpeyK8M2zr/nWjraSqqw+HAuWggNNznHaRChXaAmI4rzYbeabQOv9dR2t0
	 K0EmR1r6jogkQ==
Date: Fri, 17 Jul 2026 10:23:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stefan =?utf-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Russell King <linux@armlinux.org.uk>, linux-clk@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org
Subject: Re: [PATCH v7 04/13] dt-bindings: clk: zte: Add zx297520v3 LSP clock
 and reset controller
Message-ID: <20260717-brawny-hyrax-of-essence-e5eed5@quoll>
References: <20260717-zx29clk-v7-0-408411cfcf36@gmail.com>
 <20260717-zx29clk-v7-4-408411cfcf36@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260717-zx29clk-v7-4-408411cfcf36@gmail.com>

On Fri, Jul 17, 2026 at 12:35:40AM +0300, Stefan D=C3=B6singer wrote:
> The clock controller of the zx297520v3 Low Speed Peripherals is
> relatively clean. One register per device with gates, muxes and resets
> and for some devices a divider. There are even bits in the matrix
> controller to control propagation of clock lines down to LSP.
>=20
> The clocks are sorted by register address and I am convinced that the
> device list is complete. There are however a few more registers that are
> likely extra dividers for TDM and I2S devices
>=20
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>
>=20
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

