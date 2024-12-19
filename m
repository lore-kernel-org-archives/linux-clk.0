Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 767E7C147;
	Thu, 19 Dec 2024 08:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734598090; cv=none; b=eH9rZwpYMAihldqUkfXVr1Z/2Upgc1R5TlKnYoNWtACgleWqG3OHYwpiedKgaFuucZiYkBYDwS9zHTOumrqKX1a33yl27/oHw2yHyrVa1FJ2GXxT+RsD8ZC6n7+HbAEsOtJ7gc5LiHjx2Sp8ZiCffpdzbSPDTG91nGh4a40N824=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734598090; c=relaxed/simple;
	bh=r1xppXFvQwdW0HOar5JXZ2e7E+t01nW1qHbBfbJKEOA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oN29RQsQMXQQfKBF2vFAydyp7c2KRnYUGXEHwfTzNarfuUbVxNtRnFsZbwrFGoM7EmXrOx1nLkDku/hTVz+Pdkhe078/PjHrlzJUizLXtfjEuG0ifNNOkMGBVogTKxZIUi0mQcsJ4BR+E6QDzxAhvR+Ob08CSEFNFGWRMm4Y3GM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RXUh8GU/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RXUh8GU/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 548DCC4CECE;
	Thu, 19 Dec 2024 08:48:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734598089;
	bh=r1xppXFvQwdW0HOar5JXZ2e7E+t01nW1qHbBfbJKEOA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RXUh8GU/rrIAe0R9iIaDRkeuzfyvp/TGlzubvvSZ6F8tUOyC/nJ/Dlm0yF3aalgeH
	 ppu8fWdH3D/TlGL10m8olUXNSM0rHLniitf480fllo4PaKJ8IYDbYNK+xmqxrNEaHQ
	 Yb6SHirVRuGmHw2jUP6JbfM62e04BtD/chiAzB5DC7qDxTeLzEJkU+pR7Eg2O7/Uw6
	 tfK9kQvLzcuZKsOJibxlS4m+4QerCHb9r3F2+qOi3oZuZ3IXhrHfbD0wYn1jWWnvKo
	 7TEUPdQ5VSK2GxcCU1CbwT7cpMRT8aYzXQGXZPa7ZX1akT7777ynIvpxeZmSnGsJci
	 CicK2MvCjAtuw==
Date: Thu, 19 Dec 2024 09:48:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Paul Handrigan <paulha@opensource.cirrus.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, linux-clk@vger.kernel.org, 
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	devicetree@vger.kernel.org, patches@opensource.cirrus.com
Subject: Re: [PATCH v2 2/2] clk: cs2600: Add Fractional-N clock driver
Message-ID: <wv5od7uzup275onlvq36w4gvyh2j5oxepqkxiptanm5udidq5u@mbr64dxodkwd>
References: <20241219024631.3145377-1-paulha@opensource.cirrus.com>
 <20241219024631.3145377-3-paulha@opensource.cirrus.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241219024631.3145377-3-paulha@opensource.cirrus.com>

On Wed, Dec 18, 2024 at 08:46:31PM -0600, Paul Handrigan wrote:
> +/* DEVICE_ID2 */
> +#define CS2600_AREVID_MASK		GENMASK(7, 4)
> +#define CS2600_MTLRVID_MASK		GENMASK(3, 0)
> +
> +/* UNLOCK_INDICATORS */
> +#define CS2600_P_UNLOCK_STICKY		BIT(3)
> +#define CS2600_P_UNLOCK			BIT(2)
> +#define CS2600_F_UNLOCK_STICKY		BIT(1)
> +#define CS2600_F_UNLOCK			BIT(0)
> +
> +/* ERROR_STS */
> +#define CS2600_ERR_DEV_DEFECT		BIT(7) /* Device defective */
> +#define CS2600_ERR_OTP_CORRUPT		BIT(6)
> +#define CS2600_ERR_REG_CFG		BIT(5) /* Invalid register config */
> +#define CS2600_ERR_PLL_DISABLED		BIT(4)
> +#define CS2600_ERR_HW_CFG		BIT(3) /* Invalid HW Config */
> +#define CS2600_ERR_REFCLK_MISSING	BIT(2)
> +#define CS2600_ERR_CLKIN_UNSTABLE	BIT(1)
> +#define CS2600_ERR_CLKIN_MISSING	BIT(0)
> +
> +#define CS2600_PLL_OUT			0
> +#define CS2600_CLK_OUT			1
> +#define CS2600_BCLK_OUT			2
> +#define CS2600_FSYNC_OUT		3

No, the entire point of the binding header is to bind. Drop all four
above and use properly your header.

Otherwise I claim your binding header is not used or not really a
binding.

Best regards,
Krzysztof

