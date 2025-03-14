Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 849078837;
	Fri, 14 Mar 2025 01:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741914124; cv=none; b=Yhob7BlQOc3N2TKHAO/AE+HVU96MRx5xzsXHJSinkXxqN7enod6Prx1Xo3dSV9HHQV9cTDrTPw22/S1gC5h1KgTZS/cC2tNTaDdBL8Jsu1hv1oucQlOPdFxmXPhL72OgXxZoN0f2UjcRee0UF0sbdUEjUkWqvC2k8NZQ+T9XuDs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741914124; c=relaxed/simple;
	bh=0ikqSiSlGwOzvec8d70BbsPKNMTnuEBZruFoscFMeGU=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=qMbywQQckJo9dEU5+cIxaS4gJ1qcXl/QsC3YZ34Udh3Adust9I0CYdG+x/YLfZFH5WdsSsRTP24IfpVYd6LrZUh6uNQAnxM0rD9nyrrGWZLH7uh2vHyGrrEfg5NIokOaXOndkCWVoo4BPFkQZddiHJoDT7TGLO2h1rnWJDVGcD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SvOew5P9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SvOew5P9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E72D2C4CEDD;
	Fri, 14 Mar 2025 01:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741914124;
	bh=0ikqSiSlGwOzvec8d70BbsPKNMTnuEBZruFoscFMeGU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=SvOew5P9h5BbxX9vImKhATnabBrm8ydaXSCGPbC6igFiBFS4PNT8fh9iExjljGXV7
	 HN8tr5/PZNINhS1xJXslNzzqdWc9fI78PiDymyFZ8LwGNm2E9iBFP12qh/iEu6eB2O
	 0g8sAS0Dxm8sUzoLt8+fIhqPQpweysNFThto6SdifyU1HUieUk58Vo+YSTZBvIg5vn
	 SUGJQH39jYAOqq/WicXjMa2Djs4cVD/fx1qATklMwLZTRjVc/vTTnO3Q2zha+y0gwG
	 Nx6BqLrxIiRcp2JdwCwMokzQf0NaZkw+GY4gqB05uvuo0kOlSZFDhdWTaKc76Cvexm
	 5QjVi/Qy0K3OQ==
Message-ID: <da70e2f173b056154d906056469e13f9.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250213092728.11659-2-wsa+renesas@sang-engineering.com>
References: <20250213092728.11659-2-wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v2] dt-bindings: clocks: atmel,at91rm9200-pmc: add missing compatibles
From: Stephen Boyd <sboyd@kernel.org>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
To: Wolfram Sang <wsa+renesas@sang-engineering.com>, linux-arm-kernel@lists.infradead.org
Date: Thu, 13 Mar 2025 18:02:01 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Wolfram Sang (2025-02-13 01:26:34)
> The driver support more SoCs. Add the missing ones.
>=20
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---

Applied to clk-next
