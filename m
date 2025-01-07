Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EC8D4879B;
	Tue,  7 Jan 2025 06:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736232762; cv=none; b=Oo9MXwMiWpu7dc2e3RLi/v4otxUaCmjpZVCzDmK+5V45F0bfLnsR2nIwFfI87vbEvnnofz5tMHmaq7oGH5tLcse9y7gMbkKP7sTkyXAnI8MHvKEyCtq4NrYJqk+WmLpCvHWlbm5tJT7w2CKBUd8+/97m1/dnx2luaRaD41B5MNw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736232762; c=relaxed/simple;
	bh=P+4Vdcv2PTSFgQ5JtdbNFF89reAzUITv5xfcuQZtnXA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f4vTyeBlPXcoDoffWuhrUjFbMGadRdVfvA+w3ioGJW3UZqgloBs4WA+pclqGKHy0gvqwOT1PvQAcEzv8LU+bVSXLsvpWaDEVptzuu9hve6ike+rROWB5J4GjjrdId1L82boD+A/87r0niFb7OcRDBeTzuFZdF6Pu1oZCVlXmc9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WrBw8Ygo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WrBw8Ygo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 147DCC4CED6;
	Tue,  7 Jan 2025 06:52:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736232761;
	bh=P+4Vdcv2PTSFgQ5JtdbNFF89reAzUITv5xfcuQZtnXA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WrBw8Ygo1I8dAK8B9Ulvr8UYUeMvCTWIdIXHWfNwAQmyS+WeDqWdJk5dYfqoM6QXj
	 /nHViJl3IdofYKz08GIZQP/sZXpe3OrUS4rFrNbphL72QfS/1S3QlV2PdAdDaEIMJR
	 3uPo5NjOlvCSIbu8Ap62Wb46LCEXEad96PdL48XxLR597WImLMhHjwEaGsRX6bcWMe
	 DvB2TydOf/cJUv65ieAmyXawf71zo1yBBdY1a+t5eYGx6UsgziytoBqh++74J2Ol6Q
	 mYynyehIKNypNgA7IOrEK2aW0q8HzhpbaeG5ZtLS3ZHjjYjzzy9bsTUVtMUB27ohlK
	 YrQOPh+PR0NzQ==
Date: Tue, 7 Jan 2025 07:52:38 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ahmad Fatoum <a.fatoum@pengutronix.de>
Cc: Frank Li <Frank.li@nxp.com>, Conor Dooley <conor+dt@kernel.org>, 
	Abel Vesa <abelvesa@kernel.org>, Peng Fan <peng.fan@nxp.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Abel Vesa <abel.vesa@linaro.org>, Marek Vasut <marex@denx.de>, 
	linux-clk@vger.kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: clock: imx8m: document
 nominal/overdrive properties
Message-ID: <ismbe2ne65ew2jkcoa2tmbjz2eajvuz5bxuwef3wptj7tkvqhn@norm5p52aygr>
References: <20250106-imx8m-clk-v2-0-6aaeadac65fe@pengutronix.de>
 <20250106-imx8m-clk-v2-1-6aaeadac65fe@pengutronix.de>
 <Z3wHp6eLQuV9GGvh@lizhi-Precision-Tower-5810>
 <957ad153-17f3-4cb8-8878-73093a9a2724@pengutronix.de>
 <Z3wyG61QEzgCJFh+@lizhi-Precision-Tower-5810>
 <6fddfd9a-8a8c-4dae-9f74-e8019b7ed404@pengutronix.de>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6fddfd9a-8a8c-4dae-9f74-e8019b7ed404@pengutronix.de>

On Mon, Jan 06, 2025 at 08:55:08PM +0100, Ahmad Fatoum wrote:
> >>> why need two flags? suppose "not set fsl,overdrive-mode" is equal to
> >>> fsl,nominal-mode
> >>
> >> Conor had the same question on v1[1] and I have addressed this in the commit
> >> message of v2, see above.
> >>
> >> In short, there is unfortunately no universally applicable default.
> >>
> >> [1]: https://lore.kernel.org/all/4e2250b3-5170-4e88-aa0a-dd796b81e78b@pengutronix.de/
> >>
> > 
> > But there are problem if use dts overlay because dts overlay can't support
> > delete property.
> > 
> > If one dts file use "fsl,overdrive-mode", dts overlay file can't delete
> > this property. "mutually exclusive optional properties" was not preferred.
> > 
> > mode = ["normal" | "overdrive"]
> 
> I don't see myself setting this via overlay, but if you say it's useful, we can
> adjust the binding.
> 
> I am not sure what's the preference is though, should we have
> 
>   fsl,operating-mode = "normal" / "overdrive"
> 
> or 
> 
>   fsl,operating-mode = <IMX_OPMODE_NORMAL> / <IMX_OPMODE_OVERDRIVE>
> 
> 
> Any idea? Conor?

If these are two exclusive modes (plus default), then as Frank
suggested: use enum of strings. Imagine encoding enum of 10 values with
bools as you did: that would be enourmous oneOf condition or if:then:.

Preferred is strings, but numerical values are also accepted.

Best regards,
Krzysztof

