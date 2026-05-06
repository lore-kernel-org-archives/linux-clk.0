Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D79223EAC72;
	Wed,  6 May 2026 09:49:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778060973; cv=none; b=SjOp4KZ/3lubGn92zoKEfcs6K1deseTn74S+TDZQb5//curUxJ7UQfllCByT2tJfnc64w2KNyOXMXosr/DXOHiEH4D1lMNwVXEJX7gwy+QfpNCNcnVg5UHA9p9OYlFgKAuQfFgmwSG3+6/qQLlCA4YJQHYTUewdEU9/jiLgaLoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778060973; c=relaxed/simple;
	bh=+RQZ3oBZvyIXgi8UF/A7gRK/+3bLlULYhdC+9Ijd22c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=avaBoEpgHrwj42/vyu8F0ddagUzJp6J3wu9dzkNLPLaYZIQ4RDGJ2C8c5htUPW+FbgFFvyxPJQvxSg/NAJHUgYo8qRcWgzt+xYxqyedphtaN3nv4l3EKPq/BeK0nKSxF3mUECDL5KY7KhkySjbA+eeG4RBqTO1ezEZiWCcO2JHI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Q9MOJmpe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Q9MOJmpe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 218ECC2BCC4;
	Wed,  6 May 2026 09:49:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778060973;
	bh=+RQZ3oBZvyIXgi8UF/A7gRK/+3bLlULYhdC+9Ijd22c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q9MOJmpeCvi3PcFwOwrkcqeWxZl3Q7Mpk2mN0W93NqyDNcr3+OApe/i3FY3MZ9E+k
	 gA1vzaWxVKdLZC24zU12qikaxvPHY5ZJBxIE3bR2jQFJC3AltVxTTClvq/lhB7cZJ1
	 oJFtbkdYs+ST/O2UOoN0IO7e4uJUbPI3oNxaT7/jL49768H8YJQ1j1SrXKiFSHs2kM
	 62UQFsDK9nwtctDI+D6Y1G+S2Fn48XKSJrJ1mWfWbZOntsNhVheaEToYoMrgIkyAUy
	 kjxPfN4gy0QQ1YliS4y3LlOanuhRrYHYcdqUaagKgE1hpcOGeNL29rw3ZANehdphYG
	 sEfmeu/HifFBA==
Date: Wed, 6 May 2026 11:49:31 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: "Catherine A. Frederick" <serenity@floorchan.org>
Cc: andersson@kernel.org, sboyd@kernel.org, krzk+dt@kernel.org, 
	linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: qcom: Add initial support for MSM8920
Message-ID: <20260506-berserk-charming-tody-f9ecc6@quoll>
References: <20260505203845.192140-1-serenity@floorchan.org>
 <20260505203845.192140-3-serenity@floorchan.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260505203845.192140-3-serenity@floorchan.org>

On Tue, May 05, 2026 at 04:38:41PM -0400, Catherine A. Frederick wrote:
> Add initial support for MSM8920, which is essentially MSM8917 with
> an MSM8953 modem glued onto it.
> 
> Signed-off-by: Catherine A. Frederick <serenity@floorchan.org>
> ---
>  arch/arm64/boot/dts/qcom/msm8920.dtsi | 55 +++++++++++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/qcom/msm8920.dtsi
> 
> diff --git a/arch/arm64/boot/dts/qcom/msm8920.dtsi b/arch/arm64/boot/dts/qcom/msm8920.dtsi
> new file mode 100644
> index 000000000000..943cae72227a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/msm8920.dtsi

That's a dead code, unused. No need to add it.

Best regards,
Krzysztof

