Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B29D283CAF;
	Tue, 21 Apr 2026 08:02:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776758569; cv=none; b=ifnQ2Lmr/UvkEWhddQHbAQIobrika4cFnKShOHRvzS8FhhEVi2s/MgdUEY4fb7322S8gHmub43QsO7bh/rY9cPuH4aBAY6G3BKuIIluB5Li+Jqe+Qdtw4NIKGVHM68CY7cqv6GgWuKE5rbDzWV234aMo2pW1/5ZB4GieIkBohC8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776758569; c=relaxed/simple;
	bh=MQ0U64TDsK6alrkDhbgHgLn1qQ1ZkRwtQIWdPthswAU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LBxG4HwSJb7Y5An3zhcpJ2A3+1AVoOOppB2LjuCgwFYPMJqXY/Lt6gVKxJDhn1jJcCZKn8m+J6xYFizd6Klbav0AgLAjnDnejRBH+ZFv7krYeqaRxqmqxEEz25Cqw8S+vD8h4ER6BVMY5GWadVKr4viisRwxYa3b0kpsPzLArO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e+gg2Cbd; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e+gg2Cbd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8EA89C2BCB0;
	Tue, 21 Apr 2026 08:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776758569;
	bh=MQ0U64TDsK6alrkDhbgHgLn1qQ1ZkRwtQIWdPthswAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e+gg2Cbd1haul0eQWTsWxDtkeavAQp3FOX/Mjjg+xuwmc8r/VOZgVKFEtUIwG1DV2
	 o8rLztNt/XYzS3qCwM9H0lOlDvLCbylHUoVstwGPVJ0pYNV6DQfRO1ntRNcSmu9iYl
	 jBH+qUMNrDfKKuCK8aEK5gd+KF7XxhuzMy4tObvzfSzZrehdV79TIWenii8KNvpQ/m
	 f/osnI8xOzAUtRDCjUmMP+8lXVn81+NCBGvDPlpHDg7oIRP2yxYb9lKnYClYfYNk6D
	 mC1Vip6GkLF/A+WEI+dA3ip4R5xLk8BvN6w3aK65RSiJvW3AO+Ge1JcpQihNO+iram
	 o0puqKESaGvwA==
Date: Tue, 21 Apr 2026 10:02:46 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Conor Dooley <conor+dt@kernel.org>, Geert Uytterhoeven <geert+renesas@glider.be>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Magnus Damm <magnus.damm@gmail.com>, 
	Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 3/4] ARM: dts: renesas: r8a7740: Add ZT/ZTR trace
 clock on R-Mobile A1
Message-ID: <20260421-cherubic-urban-beluga-49ee00@quoll>
References: <20260415233300.457892-1-marek.vasut+renesas@mailbox.org>
 <20260415233300.457892-4-marek.vasut+renesas@mailbox.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260415233300.457892-4-marek.vasut+renesas@mailbox.org>

On Thu, Apr 16, 2026 at 01:31:40AM +0200, Marek Vasut wrote:
> Add ZT trace bus and ZTR trace clock on the R-Mobile A1.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Michael Turquette <mturquette@baylibre.com>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Stephen Boyd <sboyd@kernel.org>
> Cc: devicetree@vger.kernel.org
> Cc: linux-clk@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> V2: Add ztr/zt clock at the end of the list to match bindings
> ---
>  arch/arm/boot/dts/renesas/r8a7740.dtsi    | 2 +-

>  include/dt-bindings/clock/r8a7740-clock.h | 2 ++

This goes to the binding patch.

Didn't you have also a checkpatch warning?

Best regards,
Krzysztof

