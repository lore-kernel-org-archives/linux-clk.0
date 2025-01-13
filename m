Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77C2D1D4339;
	Mon, 13 Jan 2025 21:33:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736804018; cv=none; b=sMfVkqFkNeiTgMq5ap/cS7ZojPzWpEphFnazAM2+9DVJ3TEsN5w7JgUgB9D/DcGobBh02uBTdYcF6/mUkOLM6oeD/KaiFSYjEx7G2jHB9UetrbhGhR2++kWL7VZ0/OgZILhWs1AlUPtKISFSp9fLV5knp95VZDNUZP/xrT0a7i4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736804018; c=relaxed/simple;
	bh=3A6HMzxbbE+W1VqjzbNdInpoqY6oQNk0AAJbkwerOo4=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=maCFf8vJNwynCr9T2HX6j+TnBDjCXX95axiJ3cYbYIFO8kRwSLzo9DhCpThyqyxV74s2kanfWLZvwqVJlv6UubYYGLfhQgsI9j5j1ypbhrTS9iRN5mFBCxDhb7VvI0OFqCVDaJ8U+rG/H6Bqt60Xm19v3P77YS+mo7TG88vqKn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UKOqwm7E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UKOqwm7E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB085C4CED6;
	Mon, 13 Jan 2025 21:33:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736804018;
	bh=3A6HMzxbbE+W1VqjzbNdInpoqY6oQNk0AAJbkwerOo4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=UKOqwm7EA9BjM8tgj0hoWmoH7/tAR9JGsp7wcEG4wuLdehrOERyjpVxzagn6sdpn5
	 ahyL/MHrUZrpNZa8hHx5xSqqw5D6QdbF3Qx5TPdxSAGdPIwngYLjXU84SpLXRJstBJ
	 t3a93Wi8ZV/Xvs2Dnm5/OWPWEhyEjzkALfYSFSu0YM1rTgDjRqe1p82YkDAcUk/A/U
	 IsVqS/rfY2LuqyPNOi/RyXf0nx4n5j7JOaQp8rLgdpi7UeYib/0ShkiMGEeDEAwWCo
	 FXrhwk84DIIvXXo0T3zUDKykLU+FRHibWFvP5+yUZLoM1P5cQZsL7UvcROMxEgSzUY
	 MlKibBRcqMkJg==
Message-ID: <15742b3ea7b5ee1cfdeb78657e9dc4c5.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250112133953.10404-2-ansuelsmth@gmail.com>
References: <20250112133953.10404-1-ansuelsmth@gmail.com> <20250112133953.10404-2-ansuelsmth@gmail.com>
Subject: Re: [PATCH v5 2/4] dt-bindings: clock: drop NUM_CLOCKS define for EN7581
From: Stephen Boyd <sboyd@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Christian Marangi <ansuelsmth@gmail.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, upstream@airoha.com
Date: Mon, 13 Jan 2025 13:33:35 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Subject says EN7581....

Quoting Christian Marangi (2025-01-12 05:39:38)
> Drop NUM_CLOCKS define for EN7581 include. This is not a binding and
> should not be placed here. Value is derived internally in the user
> driver.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
> Changes v5:
> - Add ack tag
> Changes v4:
> - Move to patch 2 (improves bisectability)
> Changes v3:
> - Add this patch
>=20
>  include/dt-bindings/clock/en7523-clk.h | 2 --
>  1 file changed, 2 deletions(-)
>=20
> diff --git a/include/dt-bindings/clock/en7523-clk.h b/include/dt-bindings=
/clock/en7523-clk.h
> index 717d23a5e5ae..28e56745ccff 100644
> --- a/include/dt-bindings/clock/en7523-clk.h
> +++ b/include/dt-bindings/clock/en7523-clk.h
> @@ -12,6 +12,4 @@
>  #define EN7523_CLK_CRYPTO      6
>  #define EN7523_CLK_PCIE                7
> =20
> -#define EN7523_NUM_CLOCKS      8

But this is EN7523

drivers/clk/clk-en7523.c:539:25: error: =E2=80=98EN7523_NUM_CLOCKS=E2=80=99=
 undeclared (first use in this function)
  539 |         clk_data->num =3D EN7523_NUM_CLOCKS;
      |                         ^~~~~~~~~~~~~~~~~
