Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAF922264DC;
	Sat,  7 Feb 2026 21:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770500745; cv=none; b=bW1UDy1cJyiXa5qBOSW2F3AfM2LqIWuV4hAjVTMQf4Jki+kF6tnQhXkbxrD9jmAj4xdBLquV6ZFkZdxq/TmkyfOWBoHfYOa7JDowZXgf1hXhJfuzCGkLRei8VMVoE1s7UCZxDSxS1404Dshw1wv918R5RKE6SOpEJte9P1fHInk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770500745; c=relaxed/simple;
	bh=jhXZ1rCk1S27D4G5e1huyCC+bN3T4hl53lkNYQTOYts=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VrTBhRAAAJ92fitq6bf8roWGTu9Bitt3gWVZedNUfsns4GzOkWMiGYK0Mbm2IF5UU8Tn/0Ls/ZBG07KSqYWCL2Qj+/ClwVJJ5wgGw9MNAL0LToFoP6zuppMJqYoR1M4fWBEsPs84FNcOWXfi1zDuP3ruf4XPZn9Pj/z2iIYep6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Gn+G+bbf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Gn+G+bbf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B83E0C116D0;
	Sat,  7 Feb 2026 21:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770500745;
	bh=jhXZ1rCk1S27D4G5e1huyCC+bN3T4hl53lkNYQTOYts=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gn+G+bbfwmtLySFjjS46LSEYv1wx93erRBAemU2wGNmCoLNWjxkY5Xk7R1qqq21T+
	 ZQt3mJYFSGgZDlCAOi2OBNZHROkDAqFbC5ZKGKGklLMQ5lvlQ9aB0EUwR1DwnzUpQV
	 HuQnBnkmb7bm6EQBJ0+1uo7XstPLUTNbDPZG4OJ3KZ+KKBgsmOFVOGfSDPKcZSNzw3
	 j2rGFbwPps7Ct4GEhgAWqtHRaxUC/JQxpWFs0Q5IIKwu5AB4fuXluGgLXOGKOa3AmZ
	 m3gCTCsDWCt1joKsxkyWf/+mzRvvgjAEFm7u8O8f+VU7PrmuZIVp0uxVu639lL4hsl
	 nzSHvUTB/IB9Q==
Date: Sat, 7 Feb 2026 22:45:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: sboyd@kernel.org, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	jonas@kwiboo.se, linux-rockchip@lists.infradead.org, 
	Fabio Estevam <festevam@nabladev.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: rockchip: Add RV1103B CRU
 support
Message-ID: <20260207-hulking-elegant-ferret-8efcea@quoll>
References: <20260207130256.2832815-1-festevam@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260207130256.2832815-1-festevam@gmail.com>

On Sat, Feb 07, 2026 at 10:02:55AM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@nabladev.com>
> 
> Add support for the Rockchip RV1103B Clock and Reset Unit (CRU).
> 
> The RV1103B CRU is compatible with the existing RV1126B binding.
> Add the compatible string to the schema and introduce the
> corresponding clock ID definitions.
> 
> Signed-off-by: Fabio Estevam <festevam@nabladev.com>
> ---
> Changes since v1:
> - Make it a separate series.
> - Start the clock index from zero and without gaps.
> - Remove the reset definitions as there is no consumer for them yet.
> - Squash yaml and dt-bindings.

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

