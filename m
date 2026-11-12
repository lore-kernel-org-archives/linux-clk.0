Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794503715;
	b=WuQPk5fcPdKZ/FTwRgxVa9Msg9i3QKSN3mSoYbDawI7NG3ObVjk0DLRkh/AQUdHdV1cN
	 nY/Uh+prG0OA8morO0f4dwXvlBfL+TIDm0enSlDpuo/t+AWCq8Onay63VKnWa9kIFPAFw
	 X2fxdPNTUH3XZBy5JyRDXI4EkBebVjTWgtTAv0nk6GF3F3X67Fu/QZ5QVnAwCX/bMGbSG
	 Xi4RU25movU5mlh58eQPdArla56vpO6J/qm2GaVeZjc7iq4ADnmZzL3DCedOy+nEQgGWi
	 VwSWuZlZ9C0Oy2pI83zg47J+4MBwoKApnHcpA48/DRxQxCJUR6ytTUPppLPz979R9Iw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794503715;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=S3veBLBno/qaKONVSMDnquULTZHPngC+n6B05xna35c=;
	b=mBk+qyFPW3fEKutfqpCwR0L8uzL/IOsZXdnTKTFoUR3Jy4C2as4Dnar3N+Lf8QawPfOx
	 VtzjXXAObpfBmlcOh++hceqPct5mehQ9q5pFIM85Pj7IUjVqqA5afbyg4x0RUviHEe5cr
	 u2GmX6Z4FkPXeyLSKAuXiWe2PwwnMn0jw60qxNixNnNIga/GzKDktQuzu2JrZCVJGZ+N4
	 0Z8tGUT4zit8oYpuj00WApQ/urOOjSnwcHnNJQhOGhKVqEUuAToVTgRxY6LB1I9phKjdO
	 flNU5He1FgnMo/ABOVRKeSLvy7RStf7dItD2yI5XDhAXSlF3RwLTES4nQ7ok9hf2F7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WGZEOUbc;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CBC260A382D;
	Thu, 12 Nov 2026 17:15:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=WGZEOUbc
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54F8A1F000CA;
	Thu, 12 Nov 2026 17:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794503715;
	bh=S3veBLBno/qaKONVSMDnquULTZHPngC+n6B05xna35c=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=WGZEOUbc6oHSdheS4iS6DOmilz2vYDUqMY+bX6bKaf53qAAFSzSfB5u2UaXQggNWK
	 zj/Ya32X8G2QFSgIqKhWqQmy2RAyC+0n8c3rWudYrSj0m7gar1FCtTZxpCZzF/9U1B
	 pQQw6OVK6kfvVsXQtLD8iQMEeTXj9L6sIFH0OXSNeqCgRPCSm3LDMB54oh/WEyuINl
	 S1Uw3SiexcndgKKexnSGMX8d/dwTYMSlG5ZYhs6yAUTDJSF1OPnt/eA/fyzsEVVF/g
	 yLtWfY1gf+QXj5fxTlnaPNRRD/dYBn7ycF7BXmNqxkK/d26ls4RdZLxRbaNYcb7ax6
	 WvwCN8oZpeFIg==
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v16 7/9] clk: realtek: Add RTD1625-CRT clock controller
 driver
From: Brian Masney <masneyb@kernel.org>
To: Yu-Chun Lin <eleanor.lin@realtek.com>
Cc: sboyd@kernel.org, bmasney+clk@redhat.com, jbrunet+clk@baylibre.com, 
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
 cylee12@realtek.com, afaerber@suse.com, jyanchou@realtek.com, 
 linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-realtek-soc@lists.infradead.org, james.tai@realtek.com, 
 cy.huang@realtek.com, stanley_chang@realtek.com, 
 Brian Masney <masneyb@kernel.org>
In-Reply-To: <20261112052544.555563-8-eleanor.lin@realtek.com>
References: <20261112052544.555563-1-eleanor.lin@realtek.com>
 <20261112052544.555563-8-eleanor.lin@realtek.com>
Date: Thu, 12 Nov 2026 12:14:56 -0500
Message-Id: <179450369605.1227210.17543763091331889668.b4-review@b4>
X-Mailer: b4 0.17-dev-7ca47
X-Developer-Signature: v=1; a=openpgp-sha256; l=1923; i=masneyb@kernel.org;
 s=20250903; h=from:subject:message-id;
 bh=QsgdZRhFndjUtDKfDm9gVMN3ANGxsGLTgcQaeMyrApg=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGLK+fhH7cr/O62pDNFeyzpXTPJVtVQGnD91pu/K8NUbR6
 nGUrrdORykLgxgXg6yYIsuSXKOCiNRVtvfuaLLAzGFlAhnCwMUpABOp+sjwT731xFntJlsN5gl1
 Z3g0X/mbrZ8p73FVpffxBgf5D9uSjjL8j9aa9E9sYuOXn/fVVLdcE5JectX1zP0nPss0b06ONFS
 tZAcA
X-Developer-Key: i=masneyb@kernel.org; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087

> Add support for the CRT (Clock, Reset, and Test) domain clock controller
> on the Realtek RTD1625 SoC. This driver provides essential clock sources
> (including PLLs), gating, and multiplexing functionalities for the
> platform's peripherals.
> 
> Because the reset controller shares the same register space with this
> CRT clock controller, this driver also acts as the parent device and
> registers the reset controller as an auxiliary device on the auxiliary
> bus.
> 
> Signed-off-by: Cheng-Yu Lee <cylee12@realtek.com>
> Co-developed-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
> Changes in v16:
> - Remove Brian's reviewed-by tag.
> - Replace 'const char *' parent arrays with 'struct clk_hw *' arrays.
> - Switch all gate, mux, and fixed-factor clock initializations to use '_HW' macros.
> - Use 'CLK_HW_INIT_FW_NAME' for regmap_pll initialization when referencing external
>   clocks, and add 'expected_parent_rate' to ensure a safe input rate.
> - Refactor eMMC PLL initialization (decoupling phases and appending rate tables).
> ---
> +static int rtd1625_crt_probe(struct platform_device *pdev)
> +{
> +	const struct rtk_clk_desc *desc;
> +
> +	desc = device_get_match_data(&pdev->dev);
> +	if (!desc)
> +		return -EINVAL;
> +
> +	return rtk_clk_probe(pdev, desc);
> +}
> +
> +static const struct of_device_id rtd1625_crt_match[] = {
> +	{ .compatible = "realtek,rtd1625-crt-clk", .data = &rtd1625_crt_desc, },
> +	{ /* sentinel */ }
> +};
> +MODULE_DEVICE_TABLE(of, rtd1625_crt_match);
> +
> +static struct platform_driver rtd1625_crt_driver = {
> +	.probe  = rtd1625_crt_probe,
> +	.driver = {
> +		.name = "rtk-rtd1625-crt-clk",
> +		.of_match_table = rtd1625_crt_match,
> +	},

Should .suppress_bind_attrs = true similar to what you have in patch 8?

Brian

-- 
Brian Masney <masneyb@kernel.org>
