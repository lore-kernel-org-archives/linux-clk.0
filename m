Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9846A272816;
	Mon, 12 Oct 2026 09:41:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791798073; cv=none; b=iE55ez9NCJh8ohFC3CV91E9S2/q0KanmQuMn/HuQYV7ixm6QLT3j9tWqFleeIBjOTljVrQeOwQf/DinkNtjfvxdB2Yobl9tvDrmi32khniVyj4lpwzxbyIriNq7s0+KMLAfXywiocTL+cw8ok8sdejfBbbwsHmLImV9edfr1Wwo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791798073; c=relaxed/simple;
	bh=onWJ6ONltn94K0nYjjsvbs8zBVxp2RtNkWHz5Qqtqr0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ASUH5B7CYwuNeYzX0Mqghn8ke409fX5k09+V+2q2280/sE01/VmIi/RG4XIjnajdf9uLEOBtQGf2ZHG0cCdXOq6vxZv5/kVu+MvRTRHS7atbZsZPdBaFlZ3gPtUxe+XlaNve9Bqo/Ygl/3sGL4etygdXDUNRsbS+TzggcAMOZ5o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HNvG2Hdz; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HNvG2Hdz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B1091F0089B;
	Mon, 12 Oct 2026 09:41:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791798072;
	bh=onWJ6ONltn94K0nYjjsvbs8zBVxp2RtNkWHz5Qqtqr0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HNvG2Hdz9LqP3HuiblCNkrZDD3gYnj021ugBuK5zLthlyi/HJsV2SvQbppMUxum2Q
	 TaPYv+DPuIqAPnc43QMtP0l1cISjDlIMEomSHV5Zn0J984X2fS+YG+XYCAIXsH1ZTt
	 Ba7bTc+/K01AyMCyoZ0JapPT5SQ1XZJQarXiZcQm6V3lnPTXF9hlesm2eUm8DIaqzl
	 eo/nH/jWCxxKJ2EFoUp5C9zj27jWw+jySu/iZ3+1vtnEo3r4Q27C6MUmuTawuvoK/N
	 T/Fg0Yp5va8TGtdxs6eKzTwbBqZ8Nuy94CPEZwWPdhhrf+Zz2UlbBBvcVc6by/MNpe
	 J/TeqwjLhjHIw==
Date: Mon, 12 Oct 2026 11:41:08 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: CK Hu =?utf-8?B?KOiDoeS/iuWFiSk=?= <ck.hu@mediatek.com>
Cc: "linux-mediatek@lists.infradead.org" <linux-mediatek@lists.infradead.org>, 
	"l.scorcia@gmail.com" <l.scorcia@gmail.com>, "fparent@baylibre.com" <fparent@baylibre.com>, 
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>, "robh@kernel.org" <robh@kernel.org>, 
	Chunfeng Yun =?utf-8?B?KOS6keaYpeWzsCk=?= <Chunfeng.Yun@mediatek.com>, "simona@ffwll.ch" <simona@ffwll.ch>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, 
	"conor+dt@kernel.org" <conor+dt@kernel.org>, "jbrunet+clk@baylibre.com" <jbrunet+clk@baylibre.com>, 
	"bmasney+clk@redhat.com" <bmasney+clk@redhat.com>, "chunkuang.hu@kernel.org" <chunkuang.hu@kernel.org>, 
	"vkoul@kernel.org" <vkoul@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"krzk+dt@kernel.org" <krzk+dt@kernel.org>, "linux-phy@lists.infradead.org" <linux-phy@lists.infradead.org>, 
	"p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, 
	"dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>, "chunhui.dai@mediatek.com" <chunhui.dai@mediatek.com>, 
	"wenst@chromium.org" <wenst@chromium.org>, "airlied@gmail.com" <airlied@gmail.com>, 
	"mani@kernel.org" <mani@kernel.org>, "neil.armstrong@linaro.org" <neil.armstrong@linaro.org>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "sboyd@kernel.org" <sboyd@kernel.org>, 
	"nicolas.frattaroli@collabora.com" <nicolas.frattaroli@collabora.com>, 
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH 1/7] dt-bindings: mediatek: hdmi-phy: Add compatible for
 mt8167
Message-ID: <20261012-eager-agile-pegasus-7aacd2@quoll>
References: <20261010115539.9237-1-l.scorcia@gmail.com>
 <20261010115539.9237-2-l.scorcia@gmail.com>
 <ecdf765641209f3d0f27fe8ae77fe9145884d932.camel@mediatek.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ecdf765641209f3d0f27fe8ae77fe9145884d932.camel@mediatek.com>

On Mon, Oct 12, 2026 at 09:19:59AM +0000, CK Hu (=E8=83=A1=E4=BF=8A=E5=85=
=89) wrote:
> On Sat, 2026-10-10 at 13:54 +0200, Luca Leonardo Scorcia wrote:
> > External email : Please do not click links or open attachments until yo=
u have verified the sender or the content.
> >=20
> >=20
> > The hdmi-phy for the MediaTek mt8167 SoC is not compatible with any of
> > the existing hdmi-phy. Add a separate compatible to describe it.
>=20
> Reviewed-by: CK Hu <ck.hu@mediatek.com>

If you are going to review this, then review entire code, not just piece
visible here while leaving the rest obviously incomplete.

Best regards,
Krzysztof

