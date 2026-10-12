Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69C154A4410
	for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 17:43:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791827039; cv=pass; b=dlcB+XUcpBjZ0mCh+23NUtGLIcdIDhb4n7LADDyGjGdvBt4SeVvNvbhANpqM6thBEpaUrXm4IDbaE88/hcIsdwNHOLKgoT4jxV9pINb46P9l0pJYhmBJSiWVDO3rM5EL+2ML/DRHSS9F6pHOSfpbZp1T7sw3it70z1Ttw68Ixzw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791827039; c=relaxed/simple;
	bh=aQmNTGROGdvgxfWPGJ1OogqSDxU0dKMs1Ijyj+pgCT8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lHLAhdlLuYxQZ0w8LNLwMm4uJilCTiqgasrQb+y/o2UVicbQ4rvTIj95xUth2ijWdPEjLUZT1a7KlohvfioP7GKLqExbAVFZajd8A/1J8Sw0U4CK/imL1aXw0pufjiytZl8hADAVcDWtrwmXXiXHTilUkuWtGUGVDMlCYdhxC3w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LcUJw6yw; arc=pass smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LcUJw6yw"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-6acbdbc1725so2627628a12.3
        for <linux-clk@vger.kernel.org>; Mon, 12 Oct 2026 10:43:56 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791827035; cv=none;
        d=google.com; s=arc-20260327;
        b=kahiz/aGMSFGVvHR9UXRyozMb7h4l/hT4WWOdOcGh1wI6wFXLi4sVd1skKyFE/SI2l
         0EYwfJsWLc1ieEkSwKx3uU89pcS2BsszjsZIE/ob5WAzAvYSTJGXixLrvRd74KRrMXD4
         ajchWE4PGUpSlPQnbVzqSSw31pCEuu9OloQplA3LU2nVWRANiQIC+tdIrHmsVGYiztl8
         kzAGh5LQ7WSr7x5YFj4kK7CN2yEvkgGa21WDdrCRAZARRjo68Uv6lLS3S16sdXpkX2H5
         KGhPHExbnNH3NCR43anIKKL7xWgpQgD+PNY5KLUnESLqxxAn4f7i2BQxp+n1QGPDAd+K
         3JmA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=aQmNTGROGdvgxfWPGJ1OogqSDxU0dKMs1Ijyj+pgCT8=;
        fh=3YQ6ODkGo2fnDs5UVNKcwLqt9FSRP4tPWksMz65c1RE=;
        b=sdMgNixBAOzZEHTFfJjQ1nMy6xSujs0dtVyordPTkeuZ/wrIBHPa5W2zT7p9qZAFrn
         sfwYBIuQ0l7KiyA6wsf4im0ww+yg4t06Uk2ONYtXYUVdytwWyL2cW33iA4d9Bh9wnc5K
         Nh/npEaDAulYkvD5xVX6J7mhVQuttWOS6GIuDmqPsp7iWDaSufIPlydsBEhhToM8JcJN
         z9ox/Q1yMlPhDALKolXSalE/1g6KU5IJHVjF7kqbdF/payWZl6xkZJ088GcAy4Zow1Pd
         Q7x+/T+cQqkbqNTRnMoT4f14Ysyof+u8r1IwzBy5/6dOTrv9655Nzmo/Q+5mrowZdPef
         O9+w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791827035; x=1792431835; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aQmNTGROGdvgxfWPGJ1OogqSDxU0dKMs1Ijyj+pgCT8=;
        b=LcUJw6ywaXUWSFgVNr+iY2X2x4fSEganZoXN8lnsLbPnDIfcrnq8RssjOOLYNl6inQ
         NL8TQ8trVRYn16xSZxIdiMBSmsVF1jLCYujuN50LBbYbr8JYBEBai2WC/RbrFE9f8kid
         Q24bNAXe83QZExOOpuBgJh4U0TKqWLYZ2tUB0ccJ26yU9h37dzut/Nk631b0lK/a4gNf
         Y/5E6O6/zBFvtgUN2n/cqFXpgAe4cGvox4MrCuHKQK+lgnajjRzuiBpaL5M2A2GAYJZg
         hgW8kzSkBS805Ns/b8YBJLLllzKzUSvOdsmmyoGHyjZSgAteDy3TwCM8Sb+EDJ1YUwea
         arlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791827035; x=1792431835;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=aQmNTGROGdvgxfWPGJ1OogqSDxU0dKMs1Ijyj+pgCT8=;
        b=MsCfXM+Z/w5sTb8Zxxwcn5AYeArTCGUdeg3640oyS77o9VpRg0bQYS9hZcS2qF0ZA7
         VTEpWM2QiW53Kh8CKMhggzRbhNHPB4RsR5A2y0lOrynPMbhvhB2BVdnCJW7yfQ4m9TN8
         VeEsUmXXNicidKHwsp3hfvUQ+D8tETSJgesOepmpUhFzSkufX6Y0VKAouXOHIa1M3Z8H
         sqdlnIuM1/YhQBh6xRpv0+yLkEqcGu9apy6d5yBl9n7yv+ldTNk9nlFxJLHBB1R42Ojy
         aZw7IuVkqI0aazrWWMta0hx1FWXIQGfFSIjEZYyx+xB/U/1nROgC0Ao2kJ2+sEz+bewG
         8jTQ==
X-Forwarded-Encrypted: i=1; AKwUvBzxgFc1Row6tucHsjGBsK3skb2ltG05rNKboLBPz2jJOsEzGx+tyxtkVAN5RLod/Bt0J8t77Ej0DvE=@vger.kernel.org
X-Gm-Message-State: AFq9FYInEd0VphHWM8SKGLnAo6riJsgZqjHIqgyXzADYn3ScM5RnxEZ1
	0dbsmWRSSSDy0Bv/8wAoN3iGF5+9uc87ypMQ5MbdKqyt4tuLKs6oP1vfOE61wefVPw6Eo8fxM8o
	s27xnYifbo3qSkbXTaFCYR4yTmhTxblY=
X-Gm-Gg: AYBFou16Inzz912DLz8IqsBIpKzy6zb228RhT8CNsfgJRmfcrQKQKBihRPN3S/Xeqhl
	/0EnubBz5NfaLlZB9aLuKLblK9h43kC7P+5NgTU+U+jvMnQugLR48m0jRDOoM6NXImx4jEO51gh
	RiTeTr2VtcsK4KE1VSZAQj/NAlKlpS9OSnyEoJQylakrtxN3+GSjP3h/SOntECA/ToqIO+y5fKW
	rrwMD6KztYvGSAq9R5B95keerEBzjJmB/WVnYw8j539kg37704JhFSz+eaLjsNbaR88y+iOCucH
	6TQ4qwTpcwUUJNuiZeoRVsV5k8Q6CHSelHSWNvWkcxFgJj0ayqRC6Q==
X-Received: by 2002:a05:6402:4341:b0:6ac:8761:17a1 with SMTP id
 4fb4d7f45d1cf-6b17c27a7famr8072014a12.36.1791827034421; Mon, 12 Oct 2026
 10:43:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261010115539.9237-1-l.scorcia@gmail.com> <20261010115539.9237-2-l.scorcia@gmail.com>
 <20261012-quirky-emu-of-renovation-c217dc@quoll>
In-Reply-To: <20261012-quirky-emu-of-renovation-c217dc@quoll>
From: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Date: Mon, 12 Oct 2026 19:43:42 +0200
X-Gm-Features: AclHuK-aSGZTx-4HZF0vtpTq6BBo_BN-ay9Tv6iz0b611lBgirjVShAwSUrYMCA
Message-ID: <CAORyz2KgX-7=gfax06+Pb5SFq4dVTtcTY2pbH+FDCRNZ+AVXOA@mail.gmail.com>
Subject: Re: [PATCH 1/7] dt-bindings: mediatek: hdmi-phy: Add compatible for mt8167
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: linux-mediatek@lists.infradead.org, 
	Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Manivannan Sadhasivam <mani@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney+clk@redhat.com>, Jerome Brunet <jbrunet+clk@baylibre.com>, 
	Chun-Kuang Hu <chunkuang.hu@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, Chen-Yu Tsai <wenst@chromium.org>, 
	Fabien Parent <fparent@baylibre.com>, CK Hu <ck.hu@mediatek.com>, 
	chunhui dai <chunhui.dai@mediatek.com>, linux-arm-kernel@lists.infradead.org, 
	linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
	dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"

> Why do you have flexible clocks?

Hi, I'm sorry but I need a little help in understanding your comment.
If you meant "Why isn't there a constraint on the clocks' names", it
is already provided by the existing conditional block [1].

If you meant "Why does clock-output-names have only the maxItems
number and does not specify the clock name", it was there before [2].
It could probably be added back with another conditional expression.
If you meant something else entirely I apologize and would appreciate
some additional guidance.

Thank you,
Luca

[1] https://github.com/torvalds/linux/blob/master/Documentation/devicetree/bindings/phy/mediatek%2Chdmi-phy.yaml#L90-L102
[2] https://lore.kernel.org/all/20251217-mtk-genio-evk-hdmi-support-v2-1-a994976bb39a@collabora.com/
