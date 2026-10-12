Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED181282F2C;
	Mon, 12 Oct 2026 09:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798047; cv=none; b=Hav5dZQ0j7CV9vI8OIz3XYIln66YTQsVvprrX8nnHsJyU7iX64TbLVVDcq3ujv8DZktnpSy4FJJrmtf1A6vKs2HSCgqbSvU4oL4yW65+l7A8LOEFovcJ+UdI++pQ7yhyipmb0NXxopN5uSFsv0zh0qJGmuh/Fe9/sVwzi3RWYVg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798047; c=relaxed/simple;
	bh=hY+Mj7O0V59Z4/tU00VcMwAiAvBfVIXWGHPCjPfi7Kw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fTB7RWc73HnBnmr1Y3Iv6hCZMu/b9R1sd5SD6R0yO4LgIWPgJsJp3iEAWwxJIZkr29rk6wBwtBubXkjGameGPAwQ1dwNisqOxZ2O+y8jX0tFD63udvJMATcYggPuIPp1i6CezyA3FHx4YhOlYXlRccKH56u7jeodVDq/oxEeXlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oxVwfPbW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oxVwfPbW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 134BB1F0089B;
	Mon, 12 Oct 2026 09:40:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791798039;
	bh=Y+Qck0BDv7ZTXpJFYzm1NMiEfYWaCwEFZbxAeqU+Zn8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oxVwfPbWW4HWqQB5eVsRz66oS7TA8PnUW7DjBCTes+29KFtPu+5FV1FwCi8r/HFCC
	 RlO7d21TMxrPgATkXx6NCKSjuD+SrPTPezp79mVkElKwrBwZg81xjMrZnFab7qZ0en
	 OTiyg3LwKl0lZcEsnECif53YPojVmqyFT+IqtdyB4vcZ1SjKgSraWnjrvdwNbWtqU/
	 Hrhrlu21BuOHSCQPWfbvZWveeowof5xaGGyGvJJuHGXOLx7SEvCjp3r+hEgi6RUDX7
	 a5OfO47wpTRC7xULaUMODxkyO8+RvIEHBboXaQJNodZ+Unmmpwx1qjjGkHtoLiC9A3
	 dWYA9f9XvPxeA==
Date: Mon, 12 Oct 2026 11:40:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Fabien Parent <fparent@baylibre.com>, CK Hu <ck.hu@mediatek.com>, 
	chunhui dai <chunhui.dai@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/7] dt-bindings: mediatek: hdmi-phy: Add compatible for
 mt8167
Message-ID: <20261012-quirky-emu-of-renovation-c217dc@quoll>
References: <20261010115539.9237-1-l.scorcia@gmail.com>
 <20261010115539.9237-2-l.scorcia@gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261010115539.9237-2-l.scorcia@gmail.com>

On Sat, Oct 10, 2026 at 01:54:01PM +0200, Luca Leonardo Scorcia wrote:
> The hdmi-phy for the MediaTek mt8167 SoC is not compatible with any of
> the existing hdmi-phy. Add a separate compatible to describe it.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
> index ac93069f4801..f0c8ea2c72b1 100644
> --- a/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
> @@ -31,6 +31,7 @@ properties:
>                - mediatek,mt8188-hdmi-phy
>            - const: mediatek,mt8195-hdmi-phy
>        - const: mediatek,mt2701-hdmi-phy
> +      - const: mediatek,mt8167-hdmi-phy

Why do you have flexible clocks?

Best regards,
Krzysztof

