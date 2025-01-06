Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E660522A;
	Mon,  6 Jan 2025 06:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736144572; cv=none; b=pRpw71zrSzcsBoOMT1GReRQdwbPgSQJbsPDD9GlS4ldB8q/FmUhnv1uaTl3+qIvG3wsEkfAz+QKba24M6K8uOOOqO7vtAHt6Ixu4QmyEKKZXpBooXJgipEpnST0bskq/CcWLdJNXpV/8z6RJ2y8O0mDlanXiFFf22ExuF3jC2v0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736144572; c=relaxed/simple;
	bh=U+pUstxTVQ59kY88RmCJHLTeE375kB7AquE4xbpDYqw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G2zD5ff3drAFUS408+DLPWa+BwC1evfCkRNPklmqtBOqqfb3DjaFlrSTg1BOwgWLdmZqYqRI4xgSrISavL03J9eLduME7QXMZZWMuBcRspCcm5fx5m2DCcr89eCTuexyq3NzPFNnEUWPAzq81shxk4zWKaOXeOqPk7fV72+K9IE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ook/z2bU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ook/z2bU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D79F5C4CED2;
	Mon,  6 Jan 2025 06:22:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736144571;
	bh=U+pUstxTVQ59kY88RmCJHLTeE375kB7AquE4xbpDYqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ook/z2bU05fv+de2QeNjb8v2E/C5eT6lzmYDd1bS9C4rDAIdH65Q3RkNX1pHpV3JS
	 5iKzeZPmyOBXNiNVVpsAU8OMLc29TMCuwowhNgRFxml6HuJwUyug5DpxfvbKl4DFus
	 G7pEsqPyT9ioT8se3V4qMal+MbUQHzeN2G7Z1ADX4BUatuBCNZMrtDhb6GFCkpPjcq
	 RMIp2xZJ3MEQKlwr4ddTGdEwqnS2fEADSHuUiLb/SQiXf8KMYfGNa/GCbdaVhmC5mw
	 ylizcLO3tWIIn1KalNYRuh++2AQ0jvL4zWhdvoyqOAdZso9P1TVW3yrXMpCdLhus1f
	 tI+wx1owwrNpQ==
Date: Mon, 6 Jan 2025 07:22:48 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-clk@vger.kernel.org, 
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, upstream@airoha.com
Subject: Re: [PATCH v4 2/4] dt-bindings: clock: drop NUM_CLOCKS define for
 EN7581
Message-ID: <vcbg4f2obrexk3ibagednkkcl4ho4whnhy7c5zdtsvkhqk7sv6@k6hxvm3xjshl>
References: <20250105144219.22663-1-ansuelsmth@gmail.com>
 <20250105144219.22663-2-ansuelsmth@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250105144219.22663-2-ansuelsmth@gmail.com>

On Sun, Jan 05, 2025 at 03:41:59PM +0100, Christian Marangi wrote:
> Drop NUM_CLOCKS define for EN7581 include. This is not a binding and
> should not be placed here. Value is derived internally in the user
> driver.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

