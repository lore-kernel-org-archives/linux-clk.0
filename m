Received: from gloria.sntech.de (gloria.sntech.de [185.11.138.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2234749DD
	for <linux-clk@vger.kernel.org>; Thu, 27 Aug 2026 13:33:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.11.138.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787837616; cv=none; b=cbIi2R0r9S5tweDVNaIoE5DNHumllmW/AFPDxP4g4WaIUvUyXJDpQLmgOrShIzUeKX19lw4EEiDLATdKz1S0N+6ijWlkKtym/P9f2LAtSe3qeGP9Piq8Yh3JBLVuUM+6F4Jc2X/T06X1MN0vvGPpAObmqNjFKOaWwAlqkCPkA7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787837616; c=relaxed/simple;
	bh=jzDdrANsjQwIruG4TFWrOXJRxurx8zurwau3dW/jM68=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=rITlrDAY52h67b1sKZTtlBGzpIYJFHZDNBMtZ3i4cdnXUhlZr4cWMhVI0hoi3hZAMcVyOq0jFduQ/Fn7Z3MY4s0AEI4m+a4wAlz4GThSUUWmBA6CnJL8yMnT8KTnpdqlpKm8JTA9hY3aNU8L+Edd95csGp9tbaxuhJqfFX8L43o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de; spf=pass smtp.mailfrom=sntech.de; dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b=rB74hpKj; arc=none smtp.client-ip=185.11.138.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=sntech.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sntech.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sntech.de header.i=@sntech.de header.b="rB74hpKj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To;
	bh=HI1REH23XVWiYYS5WUaJv/I0DtwaxBfUHe8yR5QlNpU=; b=rB74hpKjBvmLYM4d0hMaHp97lO
	ayX3p4+tvbS5YtfZLvz+5qZcztElPRkCKnLvdrC0DZE1nGbZh8FZVICpk0mmL8hkuJMznNE+KZ9PY
	c+lXICC2trG/aatvbdgIkZuoPnUVZSIcYKTs3fnqSKEQT7gGt7RteKMlBMOvhfePTAZBjPd51zZLK
	2hQTyv+87Y6tVUwWSNviQSNR7BIyGcfp6UARuE+RFT7zmphDyqzNgpsl9ZDTgGMAxw5d6pEPUnmEB
	4Bh8uBGL1DaZnPw2kHjMLWpyvt9T7XlAasDBNy169BpfKkDEmWSUYdvuwiQlssz9SLtQcWFQcrtjJ
	prAtSEzQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>,
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-clk@vger.kernel.org,
 Geert Uytterhoeven <geert+renesas@glider.be>
Subject:
 Re: [PATCH 2/2] phy: rockchip: Make sure clk_init_data is fully initialized
Date: Thu, 27 Aug 2026 15:33:16 +0200
Message-ID: <3434874.44csPzL39Z@phil>
In-Reply-To:
 <adb5bd47343dd31661748d5de14cb28a2bae2d17.1787240165.git.geert+renesas@glider.be>
References:
 <cover.1787240165.git.geert+renesas@glider.be>
 <adb5bd47343dd31661748d5de14cb28a2bae2d17.1787240165.git.geert+renesas@glider.be>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"

Am Freitag, 21. August 2026, 12:08:40 Mitteleurop=C3=A4ische Sommerzeit sch=
rieb Geert Uytterhoeven:
> The clk_init_data structure contains several mutually-exclusive members
> for different methods to specify the possible parents of a clock,
> prompting drivers to initialize only the members they need.  However,
> not initializing all members may cause subtle issues, which are only
> exposed when CONFIG_INIT_STACK_ALL_PATTERN or CONFIG_INIT_STACK_NONE is
> enabled.
>=20
> Make sure all members are fully initialized, to avoid such bugs, and to
> prevent future breakage when converting drivers to a different method
> for specifying the parents.
>=20
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>


