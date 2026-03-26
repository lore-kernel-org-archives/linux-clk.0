Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E71752DF707;
	Thu, 26 Mar 2026 07:34:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774510464; cv=none; b=phY9lmy/0i9Ge6IyMguZJmw+kx67i33xBWVGzzQteiWqRC5yRFAwxWTMj4R8cHsXMQpUYVnNCoyxm1vhJotWsMw/BSK9uyG5GzYNTO5p8ZFU2EJgJNH0Yts7vkc9Bpdsr0tnGmR9rjOdg/q7rYCzYdIdGN2zgefgsk014tXG40o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774510464; c=relaxed/simple;
	bh=FUjuTmSKV61svDs/+cMk35XbtWeZS53lj4nSDv2q/E0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dKXY0NCLlU4TjqiMcmlTju8ej6gAPax0U63kQcb22cNf2ZaaYURaP/oL/ep8CQoU2HUBVEK4CYiJOMrZIQZCeimuCkrDjmG8S44tPoiu+Ym/MppuC0XfDahbssVhbcIJfSykrPll+Z9laYQKS8SEmVhLpy6FjbBaZwXsXokFUJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MbfR01io; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MbfR01io"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 221B7C116C6;
	Thu, 26 Mar 2026 07:34:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774510463;
	bh=FUjuTmSKV61svDs/+cMk35XbtWeZS53lj4nSDv2q/E0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MbfR01ioUAr8XPpPXx1zBIiY/Qr7/f9IOP9dsl8ofNFyzL3DEgSEn+h9AFllGqfWG
	 9m3fsE87Ms3/YktL4MrOWTitC12hAKJkaFOmzhi2cLllx7f02rOZFGiglKF5DE86oV
	 3IcRxUme41q0wUtn77drPiSU5QerEueXsbMp+e0a4iGHxjPcbDRuaozs6DkeGWcOUh
	 wUb9a+lVaXcIZpJvHYhEq/R6EJZJ04JYD/ISDoS3AeZPccLSz9w1qLJQXgIGBXoT6R
	 Tdh8I8SXdcCoIVgxR4d+M/EH7/Z0DjsIWTkvUWM5zdNe1TrL3IreFpW831vpQQE+TD
	 cqFIY5M41xlkQ==
Date: Thu, 26 Mar 2026 08:34:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Robert Foss <rfoss@kernel.org>, Todor Tomov <todor.too@gmail.com>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>, 
	Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, Bryan O'Donoghue <bod@kernel.org>, linux-arm-msm@vger.kernel.org, 
	linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-media@vger.kernel.org
Subject: Re: [PATCH v11 1/7] dt-bindings: media: qcom,x1e80100-camss: Add
 optional PHY handle definitions
Message-ID: <20260326-sly-doberman-of-exercise-bdd93b@quoll>
References: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-0-5b93415be6dd@linaro.org>
 <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-1-5b93415be6dd@linaro.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260326-b4-linux-next-25-03-13-dtsi-x1e80100-camss-v11-1-5b93415be6dd@linaro.org>

On Thu, Mar 26, 2026 at 01:28:29AM +0000, Bryan O'Donoghue wrote:
>  
> +patternProperties:
> +  "^phy@[0-9a-f]+$":
> +    $ref: /schemas/phy/qcom,x1e80100-csi2-phy.yaml

Ah, and this does not pass tests. Use compatible syntax from MSM display
bindings (mdss).

> +    unevaluatedProperties: false

Best regards,
Krzysztof

