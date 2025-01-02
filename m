Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C44514293;
	Thu,  2 Jan 2025 08:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735806348; cv=none; b=b13PbyV2j818ILkbshV2OQO0n5amVrlMnSER+SCPLZ34xJZD5ybNZu4YlszoJb+vw+vAZM0uJzpBuNsshA0czxLmNCWti3tIRPvIGTBivIxk6vCcom96VgFj364IHKf8gLeH8r5X7YNZAxbelmTCATtw6StEluQh0EVfKN64Jjc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735806348; c=relaxed/simple;
	bh=zqtih7F5QTw8cdGtFnNIYjYSoyZ5b/s0GMAq8CTYW9k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=EIIHM8oL8KLnqHJDCIHaSvfD3F8UjWUFf7q2WyloFnPiWOsOMjEmfJNuo0BsUkPP7H8ibdEzZDCWCo390+uic9dgG0zWm+9wSVKNNTHXoQwTMn96M+HR88T+s6PXNZ5Fcn3XjlZ7iJdv5n5ufVNlBoscdrIlnPCDfNE5d57awio=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rvdVGpTh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rvdVGpTh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B1A1C4CED0;
	Thu,  2 Jan 2025 08:25:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1735806348;
	bh=zqtih7F5QTw8cdGtFnNIYjYSoyZ5b/s0GMAq8CTYW9k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rvdVGpThiWus2lbx6a4iHGNPtvkye3FNK4O2wf3cIB3+QXJUVtpBYAal+9h8CM92K
	 7Y72IjDFsnBJkJ6iArmhdE7TAC/meveP97aIr0BP9T8GPwXmHjOOQKmwNrScHijLWn
	 1H6sDnFQfy3kwNsmUREiSp+Rmd8Cc06pU9/1u0sqooo2yWlb2CqpPJL8A75XY8oIt5
	 oDJW2TE8v9PsDqF3/cJI8CO6HcUNlyndaGLh+4r8B0M10Wn8WK2wo6gHqz6DmA3kmd
	 PkfHPCwZLsMSnuy1+/ebxNxFX164HG3z0jTZfXIfgsBgZ1eH/fSsqRHvMsxIFk/qt1
	 WA6npbXDYN0kg==
Date: Thu, 2 Jan 2025 09:25:44 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Conor Dooley <conor+dt@kernel.org>, 
	Gabriel Fernandez <gabriel.fernandez@foss.st.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Rob Herring <robh@kernel.org>, Stephen Boyd <sboyd@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH 1/2] dt-bindings: clock: st,stm32mp1-rcc: fix reference
 paths
Message-ID: <dphltmk47oticmxe6cd2ozcnmhdq6m4mgjybc3dyyqiyiemaxd@q63eeuu7rwnn>
References: <20241231150144.4035938-1-dario.binacchi@amarulasolutions.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241231150144.4035938-1-dario.binacchi@amarulasolutions.com>

On Tue, Dec 31, 2024 at 04:01:40PM +0100, Dario Binacchi wrote:
> The path of the two files was wrong even at the time they were added.
> Let's fix them so they can be correctly referenced.
> 
> Fixes: 722dc8a1d5c8 ("dt-bindings: rcc: stm32: add new compatible for STM32MP13 SoC")
> Fixes: 20107d7328cc ("dt-bindings: rcc: Convert stm32mp1 rcc bindings to json-schema")
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>  Documentation/devicetree/bindings/clock/st,stm32mp1-rcc.yaml | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)

Acked-by: Krzysztof Kozlowski <krzk@kernel.org>

Best regards,
Krzysztof

