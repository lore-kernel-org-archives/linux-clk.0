Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E11FB33C9;
	Mon, 14 Oct 2024 07:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728889350; cv=none; b=OgL8hDgW/rKAlN/n6EXWXhBJA1C/FPiSvp2viiSIMUVjyWtzv2WZsd7s2gn/i5GT8+dTGYAgCOKndeI0B30wSx+boTdG7+oQMiIdrRnjgv22QZW7hplGdGHDzW4gIxngMePN5ptnlIMvnBo2OUnytyh3O+fHRxs53WJnhhgsruQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728889350; c=relaxed/simple;
	bh=5VWhBnWCal6QUb1NLWoXbWufGzpHjk5kdWCvNQrSLxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=U7cj8FvuPSwDJIJIZP8P8a6ZSYCQitngLj8K7jKEocNngvnDRFxkgkT78S9YAle06CCKIaysUrHB+sLUQybwcnyPHZwcukxy/XNaPIyxgcfxkYp4pMfR6G99jUrfqf9ScuUcI2tLMnwgRv8LN+fqSrcuuuei5cIetYPZ+puoBnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nLNIvjZU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nLNIvjZU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59847C4CEC3;
	Mon, 14 Oct 2024 07:02:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728889349;
	bh=5VWhBnWCal6QUb1NLWoXbWufGzpHjk5kdWCvNQrSLxo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nLNIvjZUfmX9JnPENWX8DFhi+Is9F034/xwkKMfEj90pKxlGVNwB8sBsNA5i9vnyf
	 6e/rDOI6i5JN2MZ6AkGNR6mZbf4S0UBowwoABSiMFbeutEsdUx1mdKCl9M2I3VsrAo
	 JLvLbIo1TSDf0nvGTGwGYMy16QRZWpx47PVdICM+Jie03RZSXZiDqE4EefqEqCvbYP
	 2laarLe/sYCZGu4UR9S+BmiCvuwFUZz6GwTAtrdp7WTE8l5fGv2AuZ3wx50stPWunA
	 t5HISL2lb9/g8hvzOdsQOM4V4ty241a0NKcXObtcxZGElsOk7aFh6Q64LMDaQ7x19W
	 sPejBo2fRd1Pg==
Date: Mon, 14 Oct 2024 09:02:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Pengfei Li <pengfei.li_1@nxp.com>
Cc: krzk+dt@kernel.org, robh@kernel.org, abelvesa@kernel.org, 
	mturquette@baylibre.com, sboyd@kernel.org, conor+dt@kernel.org, shawnguo@kernel.org, 
	s.hauer@pengutronix.de, ping.bai@nxp.com, ye.li@nxp.com, peng.fan@nxp.com, 
	aisheng.dong@nxp.com, frank.li@nxp.com, kernel@pengutronix.de, festevam@gmail.com, 
	linux-clk@vger.kernel.org, imx@lists.linux.dev, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 2/4] dt-bindings: clock: imx93: Drop IMX93_CLK_END
 macro definition
Message-ID: <khhdv2jcynvhvx5lumifgw4e3eedh46kcuix3gbimmtof3opxc@fsnsou3u4o63>
References: <20241014182438.732444-1-pengfei.li_1@nxp.com>
 <20241014182438.732444-3-pengfei.li_1@nxp.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241014182438.732444-3-pengfei.li_1@nxp.com>

On Mon, Oct 14, 2024 at 11:24:36AM -0700, Pengfei Li wrote:
> IMX93_CLK_END should be dropped as it is not part of the ABI.
> 
> Signed-off-by: Pengfei Li <pengfei.li_1@nxp.com>
> ---
>  include/dt-bindings/clock/imx93-clock.h | 1 -
>  1 file changed, 1 deletion(-)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

