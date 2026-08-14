Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 818A823ABBF;
	Fri, 14 Aug 2026 05:39:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786685960; cv=none; b=aSuGDZ0VfKGxqUqsz8RszB8Ksc4unbXAsR9wkAuoPC6vkjKV2bf0VM4FToscaxumbe1R8vLBRKHrjI/0XGMvvgvMkLca55fZeMgNLmsjNyz4qvk+xbZvSRIS/wQ0GLdqwPqEqkfWTcC/u8NOkm1BjClPiR1wXAY0/0CmtCS9K4I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786685960; c=relaxed/simple;
	bh=xNzIFmv7R9IBL4x3B2qUuitirgfmuC5WxdpofopR5DI=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Wo8L2t7K5ChzUHvlk6F+PmhmEcpQih5dpMwE7dSb9xNycGe6ua4EHllyb5kqPfb/M/NM2kFGMCx9e1TnQo8hBHuUd+hGxgVfIvPGgYtjKJEMFfwabe7Gra0TFUvoUV58P+ril3GD6qzkKJNSpUED0FqPUuIgxBdd6hQzsat9Ua8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Es/0mOro; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Es/0mOro"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F22491F000E9;
	Fri, 14 Aug 2026 05:39:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786685959;
	bh=xNzIFmv7R9IBL4x3B2qUuitirgfmuC5WxdpofopR5DI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date;
	b=Es/0mOrojt8HUiYQH/SXUjFhII9w0FQSuF1NUICJmgRp58OitpASBX98IhXMw5sNq
	 S+TVDRrKZ2Fqc9pzVlG1IbB9j5vY0FJvgKeorpVMyj9BP4gxXFdRWBGMxID4m6QQiR
	 7mOYXuAUSXin/afnj2WACHdM/NV0gMp7btLW6zll96bzrp4yb3XyVfJtmGGQ/CZaVv
	 Ug53/DERDSZ++ObzhHU6j+Ibkhrpbbm0I7vdxJ02WYJACMIBI8Nx4/VKfYCY9mWN5O
	 kxM1E1NDfEi07CiJtfC3gEHY83iLLuu062MBMJCfJt7GiImD19z5hGZyGhikXo9H4g
	 7r+3AiDpPJuvw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260730083019.29998-1-egbostina@gmail.com>
References: <20260730083019.29998-1-egbostina@gmail.com>
Subject: Re: [PATCH] dt-bindings: clock: ti: Convert APLL clock to DT schema
From: Stephen Boyd <sboyd@kernel.org>
Cc: daniel.baluta@nxp.com, simona.toaca@nxp.com, goledhruva@gmail.com, m-chawdhry@ti.com
To: Brian Masney <bmasney@redhat.com>, Conor Dooley <conor+dt@kernel.org>, Eduard Bostina <egbostina@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Mark Brown <broonie@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 13 Aug 2026 22:39:17 -0700
Message-ID: <178668595730.5897.14063081980943486176@lazor>
User-Agent: alot/0.12

Quoting Eduard Bostina (2026-07-30 01:30:19)
> Convert the Texas Instruments APLL clock bindings to DT schema.
>=20
> Signed-off-by: Eduard Bostina <egbostina@gmail.com>
> ---

Applied to clk-next
