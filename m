Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794317185;
	b=2n2I+nyqDX/G6Mw16aE6ypbXW7D2EWeoFNHMioxfJgvCz+465i/C9eGYWAH76X8JKY/b
	 YcM3EKvwAg4oMvzr7vUbOCBMyNrIswGXV67aMxOeamOkk+ZGtP5LmpFr80kQmYp9VnWk0
	 kLgidmSp8T8vD0aFaPfPW7NUuMCfbqkBdFLgv3tcibp+HEE2SBbEuN0vouxBN21WepaAV
	 snQI7Ea3JU5g//txllMmzrXuLwurLCxjtKHXe05kM5JqUEvJxBAeDNItAu8brOHXwMNmz
	 qLYgI9ZGl5TZ/s5IYjYAp7zRJxXn7MWiF98DZuqLWua3DmzQhBU8QTXmBSS4Gft5U+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794317185;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=QYi2FkrOHKAn8jWeQSafUk5fN1h3AA6n95wvazfn3aQ=;
	b=5XjvYEwwh3jgRu0nBDeHJ2gQCGIDGI3p3W1cSXxNzGNP3dK68rc0KT8PLDAL08pbv0D6
	 cLJnuFY56zz2x+c/9B0MQaUgeB1tajvtqTJeeyC/BZR1EcT8wtBoQSlCqoYO5eihQYEru
	 aUcX+MWWoZMS9qV6Hal5inrudWkKwabN2fHvi0I+u+0qcv7tAlpKaUMPcX0hJ1ugdVnos
	 uervMjUelG3OxiqcLlMyi5nwLUJ/wIQLnR1QAnzdDK4D9QFDo5r2tLnYqgO8Oy27q5GO8
	 6xOBiDpeBtVyriHmgGEEFOtRGDymn2rr1bX/0IGpvA4utXCp0ZOVXLYu6F8bvWQtX0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b="AtLp5/RT";
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C62D606A33C;
	Tue, 10 Nov 2026 13:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AtLp5/RT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF2111F0089F;
	Tue, 10 Nov 2026 13:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794317184;
	bh=QYi2FkrOHKAn8jWeQSafUk5fN1h3AA6n95wvazfn3aQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AtLp5/RTpGlqDN34Tri/itWk2Tx4a7UuIZjP2sfUfrULEqMPt8lC+bbJX1Z962ZCC
	 +QAvBgv6F0O3K/VXGAsjY5I1PijgZ+zzSm1v8wWlvb0rME6Ixclc2IdFkuvdZ2qQPt
	 x+L1EPtKeItt66wZj3Cwnz//GO6C8yKteZZ+VEIksKSL8G+ALS8yVacn+Cs6dhubhw
	 /veIjpktWTnt7viEULVVmfJZdbuz4BrUTWfAxhwEQPHd056tAuDo6BryFqPekLx1vq
	 TGuZb+mL+NoKV7xw7thS2J0URaAK0EsR0wPxq3yPxkmMVFMz1Avn8roCPJp+Q9D2mT
	 e5YQ31mqrph6g==
Date: Tue, 10 Nov 2026 14:26:21 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Rosen Penev <rosenp@gmail.com>
Cc: Thomas Bogendoerfer <tsbogend@alpha.franken.de>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Alban Bedel <albeu@free.fr>, 
	Antony Pavlov <antonynpavlov@gmail.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 4/6] dt-bindings: clock: ath79: add the PCIe PLL clock
Message-ID: <20261110-hilarious-attentive-velociraptor-cd55fa@quoll>
References: <20261110013646.1582970-1-rosenp@gmail.com>
 <20261110013646.1582970-5-rosenp@gmail.com>
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261110013646.1582970-5-rosenp@gmail.com>

On Mon, Nov 09, 2026 at 05:36:44PM -0800, Rosen Penev wrote:
> Add an ID for the PCIe PLL, which AR724x, AR934x, QCA953x, QCA955x and
> QCA956x have, so the PCIe host controller nodes can reference it.
> 
> Signed-off-by: Rosen Penev <rosenp@gmail.com>
> ---
>  include/dt-bindings/clock/ath79-clk.h | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/include/dt-bindings/clock/ath79-clk.h b/include/dt-bindings/clock/ath79-clk.h
> index f8a98e4d206d..e4956afd151d 100644
> --- a/include/dt-bindings/clock/ath79-clk.h
> +++ b/include/dt-bindings/clock/ath79-clk.h
> @@ -12,7 +12,8 @@
>  #define ATH79_CLK_REF		3
>  #define ATH79_CLK_MDIO		4
>  #define ATH79_CLK_UART1		5
> +#define ATH79_CLK_PCIE		6

Splitting one define per patch is ridicilous. This is just ONE commit.

>  
> -#define ATH79_CLK_END		6
> +#define ATH79_CLK_END		7

You cannot keep changing the ABI.

Best regards,
Krzysztof

