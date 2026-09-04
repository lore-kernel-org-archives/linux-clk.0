Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF4EC443E5E;
	Fri,  4 Sep 2026 13:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788528909; cv=none; b=LpvIiSflQQbi8lhxOCgYDFNUC2hgddZLXP0P4OhtCtKNahsnGc28Zl2uPn9x/8QU3L1F6UK7TzJqElJhI72/BHUB18N3wedg46zJATswYvvDrzIBu1vd+KMLZ82kZwYOYP+ykiRxfdnwsAvl52fbeYgACYkPjuNN+NeHaYIe804=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788528909; c=relaxed/simple;
	bh=xZDnBFqGRmu7MNRHm9xcaUkAO73n1JavlUCvmScAIPE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Vjzbgo/V9BkJdOanEGRFBXDvhui//ouCkbUdHpfiLSf/rk2Ma7LM7WBXVSJXy3TPb+5mUI44Tvq+oZD2hUjQlzntPuWL3nq0IVeE0w0S67rbL4Kkz7NogsZJq/L5mBiVIczWnyYaTX+yq+Rz613GuycTnrHzbhFqmnC/Z6tfA1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Ymk12fQx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Ymk12fQx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 372801F00A3D;
	Fri,  4 Sep 2026 13:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788528908;
	bh=mZKjmtsE3tzdE9+pHIwlJUk3Qt+6fz8Ww6jrCUSt+X4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=Ymk12fQxbY03vo1t2Nt9xp4fUI2HH4+OaDVrSfOXmVoPt0xMoEuFDu6Tk9UnuWPbv
	 iCbc/I8MVG2pa7E57gdTJubTaNkbb3mGpcy308auCmykK3S29HUABmdlzPt9qp74+/
	 Bm3s6CSjkEkBq6+tj7PAoRf/jVQtbaitkEuX1qM++bczBwssu2Cle7sJ+WIL+pGf05
	 zHz+7QAqSJ4Y16mmYDMK/fyMoKHGZUPcb3DFCZiFx4Yujyumc6ZaI0UEhGaKgNaIJh
	 OPs2P45AwQYw1SNxzNasjCqX1roSB6rfaigF8xVdetV0i074C2rmyymZ7xa7XJ4FH3
	 8zaD5hyv/uPHQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 02/19] dt-bindings: display: bridge: Add
 starfive,jh7110-inno-hdmi-controller
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Wilczynski" <m.wilczynski@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org, olteanv@gmail.com, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org
In-Reply-To: <20260904-jh7110-clean-send-v3-2-484f9ae72715@samsung.com>
References: <20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
 <CGME20260904132712eucas1p167f9527c4728af56f811d06832b43c36@eucas1p1.samsung.com>
 <20260904-jh7110-clean-send-v3-2-484f9ae72715@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 13:35:07 +0000
Message-Id: <20260904133508.372801F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] The clock names described in the commit message contradict the c=
lock names defined in the schema.
--

commit d8a94c9a1ba333a313d74a23f9f5fb6dcc401472
Author: Michal Wilczynski <m.wilczynski@samsung.com>

dt-bindings: display: bridge: Add starfive,jh7110-inno-hdmi-controller

This commit adds the device tree binding schema for the StarFive JH7110
Innosilicon HDMI controller.

> It consumes register access clocks (sys, mclk, bclk) from the voutcrg and
> both the pixel clock (pclk) and the PHY from its hdmi_phy sibling.

[ ... ]

> diff --git a/Documentation/devicetree/bindings/display/bridge/starfive,jh=
7110-inno-hdmi-controller.yaml b/Documentation/devicetree/bindings/display/=
bridge/starfive,jh7110-inno-hdmi-controller.yaml
> new file mode 100644
> index 0000000000000..ea489a7722d02
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/bridge/starfive,jh7110-in=
no-hdmi-controller.yaml

[ ... ]

> +  clock-names:
> +    items:
> +      - const: pclk
> +      - const: mclk
> +      - const: bclk
> +      - const: pixel

[Severity: Medium]
The clock names described in the commit message contradict the clock names
defined in the schema.

The commit message states that the device consumes register access clocks
"(sys, mclk, bclk)" and the pixel clock "(pclk)". However, the schema defin=
es
the expected clock names as "pclk" for the main clock and "pixel" for the
pixel clock.

Is the commit message inaccurate, or should the schema use "sys" and "pclk"
instead of "pclk" and "pixel" for these respective clocks?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-jh7110-cle=
an-send-v3-0-484f9ae72715@samsung.com?part=3D2
