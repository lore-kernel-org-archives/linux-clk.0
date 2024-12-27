Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A67A42070;
	Fri, 27 Dec 2024 08:25:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735287957; cv=none; b=FlC6efRmJ4HS8vOyKEJLNb8YPcxyqm4D/7Ku/Xqd32aZR62LPIyzySZQ5y4iOEzE/lfacLKEugRx8KZqE7p6G1GpMvC+ltuR4HPSJeuKxD0LZbdDj7eilnYDZjxhjXYcAYEVx+7zJMn2UDZvJPM7Or3EWIXWGJTsNYByQA+BNFg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735287957; c=relaxed/simple;
	bh=kkic30YQ5TOo/SlO6pr1SQR1B+qz6Q+mjSYY2kIShSc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=s1/Gt1HqYSe12bKxPcIQpF8hJ4nelzc15w54RtN0v8CnkKXKk5GI1/nFJuj5YxbImuw/L/Y9tZmYQGXkC3j/FdngruqQXyZ/uYslXNmkuG9LYrHM4Q6xLpphIWLy7eorXPLk86+7Xr2HiB9g2UH4DCSWt5Ss7UiG7a5/2YvIL80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SBUIrJGg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SBUIrJGg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5452BC4CED0;
	Fri, 27 Dec 2024 08:25:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735287957;
	bh=kkic30YQ5TOo/SlO6pr1SQR1B+qz6Q+mjSYY2kIShSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SBUIrJGgQbqqjn53lLUdo4Aacmg8K7pDiYaUlnE4TlAVywF6qPIRd+p2PfXu+HCXO
	 qeLSULeJUxuqum/mCiKLzfCCO9Abwtrlbgcer1t+Eq52WUmVh7FBc7B9GJQWSE3kfz
	 p9sZ6Ds1/tS6QVZU6vJJ3bWzARF7AbcdJugflc6cTXh/2CsM+vBqd8e4jhLj7OBp67
	 7BXyfLa5Cg6ILP3Kz5DSb83cR9XnPiXurrLXZnnEPpEkIY7m70Bi2x+uO4LtPVMJki
	 iu+1fHTUGBIF4bNf4+/0W/LKO0bP01LP+EjUMX2yYLKDp8dsdRI9WYgj7Co5OX92OX
	 rvDDckw//yiMQ==
Date: Fri, 27 Dec 2024 09:25:53 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Kever Yang <kever.yang@rock-chips.com>
Cc: heiko@sntech.de, linux-rockchip@lists.infradead.org, 
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Elaine Zhang <zhangqing@rock-chips.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] dt-bindings: clock: add rk3562 cru bindings
Message-ID: <krrqtjllx6akrurefbtuhgxw6bwmkiro5rtvdexoevjyufm2uz@r5biw7kbttyr>
References: <20241224092310.3814460-1-kever.yang@rock-chips.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241224092310.3814460-1-kever.yang@rock-chips.com>

On Tue, Dec 24, 2024 at 05:23:08PM +0800, Kever Yang wrote:
> Document the device tree bindings of the rockchip rk3562 SoC
> clock and reset unit.
> 
> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
> ---

A nit, subject: drop second/last, redundant "bindings". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v6.7-rc8/source/Documentation/devicetree/bindings/submitting-patches.rst#L18


s/rk3562/Rocchip RK3562/
or whatever your proper name is (and use proper capitalized parts of
products)

> +properties:
> +  compatible:
> +    const: rockchip,rk3562-cru
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#clock-cells":
> +    const: 1
> +
> +  "#reset-cells":
> +    const: 1
> +
> +  clocks:
> +    maxItems: 2


Why clocks are not required?

> +
> +  clock-names:
> +    items:
> +      - const: xin24m
> +      - const: xin32k
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#clock-cells"
> +  - "#reset-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller@ff100000 {
> +      compatible = "rockchip,rk3562-cru";
> +      reg = <0xff100000 0x40000>;
> +      #clock-cells = <1>;
> +      #reset-cells = <1>;

Why clocks are not here?

Best regards,
Krzysztof

