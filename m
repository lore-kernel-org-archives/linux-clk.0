Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795437273;
	b=D0d/ksU7UTRt2nHMjquNjMSLLshGTnjnjx7szpG5z9ABLazv6/YZe0VQ3340Ax4zrdWz
	 NI3d9dP1ovCeMSR9+tfLKYDCRYo300/UR1V8PwBxNSN0Sf8gWAhG1VDDpjfQjdbRqoBqX
	 nVnMc6GmddPrpbsUxqfpMnzDdFvan+K5xdwMqUWR0Z742/ZaIYXDbTS9SYovg7XoMprMN
	 dEFpRjITlZWlBUTkPuUHogD2/O16bVHfNsg35p4usaNGq2+8dBTOUx79oNc7O8x1ZIsgM
	 4GYpMNm/GjBgV2NQmj0e3IWYgTeVzzT6tNMNHBG7T+Ut00GHbK/jsS4VTZm5G5QR9XQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795437273;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=FR6wWEGn+t+BtzbC/LIorR/2/RzdWcrbFjRruoMp+fg=;
	b=YsO2xrXUx1aWm+Gj+kax0tUFd6a55NEwhA+rhOGNQ9AAXSbhv29BDWSCA9nG60eyz7HA
	 +yDCBunDg1aRgIGcE4vWWkNzKAUxz/TUPAqTYwal45BSmAomoz9rwCKsCKeIBGPLfY2bi
	 b1xnCa3IRJBVjzLFSVc2m6ZRKvO5uYOy9y+KJSqy/cbyVRKhuRgnVQerlDzvpHP1k6N4f
	 ykp+Xj7VbfsMtihZSi98x9o4pJwgOikX0rvSKac2PYsnwin7w+SB95FRgWbddber490nQ
	 Xu9nj/AStZsXOwqYD762IGNSCslfDCp0xC5p1EBYOiaZXaNol6aBb56FZWtgp2iIZFw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LSgZZF5t;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C60FE606A31A;
	Mon, 23 Nov 2026 12:34:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=LSgZZF5t
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 308181F000CA;
	Mon, 23 Nov 2026 12:34:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795437273;
	bh=FR6wWEGn+t+BtzbC/LIorR/2/RzdWcrbFjRruoMp+fg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LSgZZF5tuZj++6QvvJXJgJmD5X/zU83rYNkS4t0au6BRsx9K9Y7s4CcgPgijo8k+g
	 aUhMlNx65inEh/R1VLcX2Smt1Tn460aTKSLFROhhB1MjqUBo89b4IB8zmmV7H3K4bp
	 LwSZi5oBZErg7SsKvrfPjSjKV4S+T/ABoG02UuUwEA6voMiI9fpuw+4TBIj6evqCrI
	 LXdFc58L6IuJO49fHqjIxrm7JMaHp/+EreQJPvDzOPsWzrP5e4AzHK/n9j3/ZUyJ93
	 X2ezds2Kdo/Bj9aRKeweqQ35mcmPonyC36Ew4KHqD5LdFsnwlg5J7GMebW6TDCV0EJ
	 bfj7FkkfB45IA==
Date: Mon, 23 Nov 2026 13:34:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alexandre Mergnat <amergnat@baylibre.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wenst@chromium.org>, Laura Nao <laura.nao@collabora.com>, 
	Chris Chen <chris-qj.chen@mediatek.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: clock: mediatek: Add MT8196 PWM muxes
Message-ID: <20261123-sassy-tacky-jackdaw-3dbb2f@quoll>
References: <20261117-mt8196-pwm-clk-v1-0-d8725bcea9f4@baylibre.com>
 <20261117-mt8196-pwm-clk-v1-1-d8725bcea9f4@baylibre.com>
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
In-Reply-To: <20261117-mt8196-pwm-clk-v1-1-d8725bcea9f4@baylibre.com>

On Tue, Nov 17, 2026 at 07:16:02PM +0000, Alexandre Mergnat wrote:
> From: Chris Chen <chris-qj.chen@mediatek.com>
> 
> Add clock IDs for the MT8196 PWM source selectors, so that the peri_ao
> clock driver can register them and devicetrees can select a PWM clock
> source with assigned-clock-parents.
> 
> Signed-off-by: Chris Chen <chris-qj.chen@mediatek.com>
> Signed-off-by: Alexandre Mergnat <amergnat@baylibre.com>
> ---
>  include/dt-bindings/clock/mediatek,mt8196-clock.h | 5 +++++
>  1 file changed, 5 insertions(+)

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Best regards,
Krzysztof

