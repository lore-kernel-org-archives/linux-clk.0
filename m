Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795607902;
	b=jDzws9d2GJ9cLijiABuoV01CRa19WA1n/+2OerxxFG38asu7/QMhNjG0Az5eg+Vkx+Zm
	 ZefvQKq+VFoWC3eXmBAnu0qH3c4OPOSbbIhRv1Dsq7Ylldn+Kb733joEoFCCcFfdmtxJV
	 ifc+kSCQbwGqO0uSA95lR+zN2o8ycOvcC+JMVM05VD4vY4JGaFtV3iiibjX8fNnKMyks8
	 YI6h+mm7guRVcs+hAr8Ap5gXHmdWvTOizBc8easKYwRExxN4AXdk0/icpaoPuJGTOyOBt
	 3g9owDskLa52X6tH0d1//GjKkftJy35mXVN9rirSTrWVxQASXuaBUHgDQa+UJub1bBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795607902;
	h=Received:DKIM-Signature:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Subject:From:To:Cc:In-Reply-To:References:
	 Date:Message-Id:X-Mailer;
	bh=iegJmaLrxjuEXYo/kXVTXMNsmKwZ8sV4FxYf+lyrVHk=;
	b=VaAOYdaeLkEW11YT4Yy4qKck/i1nW0PQ6yn5lmnVF43qYlIt2cTmqc08omOzEpLnIUkP
	 8S+YAap4qzBRfAVG2X+h5S2xfAw+a5ASwT0gnDuP3CHzDGysvPKFhZIQEovcI5+UVVg4t
	 zyehEVh3NRL/fL4CXoijxPWQlIV3A4UnI77UvlRk7ruOJwnop0fYYZPf3kW8+kcGO4v5p
	 KloA8+DWZfxpR8dlrtgh5PShIjLSATRvGykVein+gkgnoQpAA6o/wfV3xiYp9vdbjP56p
	 qh/INYy0PwKsDr0CONUCv7lTVeg/ayQduAqW0IAs1M6tNU1bGyMBvjoacxpBc9wdJhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b4L6X72q;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBDC1606A31E;
	Wed, 25 Nov 2026 11:58:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=b4L6X72q
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A92621F000C0;
	Wed, 25 Nov 2026 11:58:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795607901;
	bh=iegJmaLrxjuEXYo/kXVTXMNsmKwZ8sV4FxYf+lyrVHk=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=b4L6X72qTKMicsxqXokbel7lNBuYiYsZhzr4Bfyq0wcYC6jjDBFz6DbHMjY29zYDj
	 HNh77Io+aw65qtmIfXMBJ+cLcirYxrFEM/H1XkfJ2OcWU/VOp+vyrMr+bGhDQw4Jui
	 hVOU2AdQgfCYvfQWFZ6LtoXnPloHNv6w+KAKE7Oeue3Ijiog5V5Qy8GhLhhI1a/QhC
	 uMip3dbWMUkGyoOw2occOBaZYGVJC29rf0eNftztZNNCvIUzzHYIXd4Qa4ZlEoEHY4
	 IYrDMj0SSeOFcyfNZMyXaTuO9lBLX3fSa6/WydbRK0FHbl24Kk0PumOUTRbjxI5vGb
	 tzGRahh5iVPhQ==
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 2/7] dt-bindings: soc: mediatek: add MMDVFS binding
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Echo Zhang <echo.zhang@mediatek.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
 Jerome Brunet <jbrunet+clk@baylibre.com>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
 MMDVFS Team <linux-mediatek@lists.infradead.org>, kyrie.wu@mediatek.com, 
 ming-fan.chen@mediatek.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-clk@vger.kernel.org, llvm@lists.linux.dev, 
 Krzysztof Kozlowski <krzk@kernel.org>
In-Reply-To: <20261125060037.649659-3-echo.zhang@mediatek.com>
References: <20261125060037.649659-1-echo.zhang@mediatek.com>
 <20261125060037.649659-3-echo.zhang@mediatek.com>
Date: Wed, 25 Nov 2026 12:58:18 +0100
Message-Id: <179560789852.84329.1942681652314978942.b4-reply@b4>
X-Mailer: b4 0.17-dev

On 2026-11-25 14:00 +0800, Echo Zhang wrote:
> Describe the MMDVFS clock provider and its connection to VCP firmware
> in a common binding. Document the optional MMUP shared memory and IPI
> settings used by the firmware backend.
> 
> Add an MT8196 binding for the HWCCF syscon and seven mux OPP tables so
> the driver can map clock rate requests to hardware votes.
> 
> Signed-off-by: Echo Zhang <echo.zhang@mediatek.com>
> ---
>  .../soc/mediatek/mediatek,mmdvfs.yaml         | 60 +++++++++++++
>  .../soc/mediatek/mediatek,mt8196-mmdvfs.yaml  | 87 +++++++++++++++++++

.... and this has build check failures :/

Best regards,
Krzysztof

-- 
Krzysztof Kozlowski <krzk@kernel.org>
