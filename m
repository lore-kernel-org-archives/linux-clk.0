Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C82E134F24A;
	Tue, 28 Jul 2026 06:31:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785220279; cv=none; b=Edl5RP3ek34z6L/lq4X/zD8bCUJN9fxXjuEXZA7oOj8zpsGTYqwXjaUtNVwzbrzoDKxB2R3pwS3HRikrtC/R6DQgT93JOSbMypyHNCmJWo8Uwxv9Whk1nHUPKlxFH/WaR7R6kiwgxccMPl4KpT7v25Q5jn4DpUltv+4nd8j5hpI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785220279; c=relaxed/simple;
	bh=lz3PR9OcYlfCk4wufRdu6End12F1+kNjFYW/Bo2K5NA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YFhp8g/PLXtEMIZ/V5Gfef3/WfPnjP/tjo7h8hk/xyheGgWCjx19ELe8WUEgDRLJs1f0n/02IjlsyBE3YFXAxrz7WEDQQO8XtXW6U9sGNXUTC/Gf4vrzvV5Jd40JguyXMG+uMEQDt6PgLJw6I4B9hSgkBqDCCCxm57ckF9RqwEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=epOvkjoI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="epOvkjoI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C8461F000E9;
	Tue, 28 Jul 2026 06:31:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785220278;
	bh=lz3PR9OcYlfCk4wufRdu6End12F1+kNjFYW/Bo2K5NA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=epOvkjoI39bU5dVaYF3juBfYrce8bDlMCDRW1i4/Md+FEqQDazDLDGioiFYuV6u7/
	 CPB+wKqyxPCTti2nMXwLBiFnr6TOuiPz5a7vDO5tipOKFvhlH/Bk4rtuMMuh8yRLKM
	 8oGFpEOK+3AflIwKbliRCBkNJGjSIPYtA9m5LALQ/9kLZ39+2sflTNV97HB1Gm6zMU
	 oPAd57sitVOiptbs7NlzqWfpEpZuK14bzauV1Sis/g5HrdK/zOMWwXrHLNPFkVHDgs
	 ubFSjwpSOMRztYMsBNtkpIkJhuZbqaeXI/vqJU+VvO3MG3c3KJD8r6FxVf+4wbjkny
	 Pjv49DrGtOiRg==
Date: Tue, 28 Jul 2026 08:31:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Stefan =?utf-8?B?RMO2c2luZ2Vy?= <stefandoesinger@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Brian Masney <bmasney@redhat.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Russell King <linux@armlinux.org.uk>, Lee Jones <lee@kernel.org>, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org, mfd@lists.linux.dev
Subject: Re: [PATCH v8 02/12] dt-bindings: clk: zte: Add zx297520v3 matrix
 clock and reset controller
Message-ID: <20260728-wealthy-raspberry-lobster-bcfc8f@quoll>
References: <20260727-zx29clk-v8-0-7a107b00f1dd@gmail.com>
 <20260727-zx29clk-v8-2-7a107b00f1dd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260727-zx29clk-v8-2-7a107b00f1dd@gmail.com>

On Mon, Jul 27, 2026 at 09:24:17PM +0300, Stefan D=C3=B6singer wrote:
> This controller contains clocks and resets for high speed devices on the
> zx297520v3 board and hardware spinlocks that I expect will be necessary
> to communicate correctly with the LTE DSP firmware blob.
>=20
> I don't know much about the hwlocks yet other than that they exist, so
> there is no header yet adding meaning to their indices. Presumably that
> meaning doesn't exist in hardware and is de facto defined by ZTE's
> firmware blobs running on the rprocs.
>=20
> The zte-zx297520v3-crm driver will instantiate separate MFD children for
> clocks and resets, which are handled by separate clock and reset
> drivers.
>=20
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>
>=20
> ---

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

