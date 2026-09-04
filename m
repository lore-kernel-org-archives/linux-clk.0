Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E95B62550D5;
	Fri,  4 Sep 2026 13:30:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788528657; cv=none; b=TAkYzmGym12aPcZ8ytthKXyCXmzhp0syal2jkxrWjjowUmiiUG8n66Rgl2MplhGW++PFZ/bgQyIDO4hpxuLqeStzjFwft96QIG982EfCStu3kEv4pdiMoPeNNDxvgkKSKUtw0wHBOK/RS8EFpa+7M2fctl7CKtO2Dle4gjxzklM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788528657; c=relaxed/simple;
	bh=B60l+04pVEJwF9CCsix0ruYdcieZB/hTmAshk7wFSYI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=gpOqPx9oEaR0nNZy8RvApt9PNjvd2ffEfYfSdO8WwIgR1ih9IX3HSQ3m/xWly86iL/kuOaJdMQzWWfk1l/aVNDTl52DYjYvQv5TA2OCHOhQIBFO094jXhuH2spq4yHVc+UXGym8yWS2tf30l7GTBewdkQ7cvNuAk390Y6d4V8jY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MaaFaaz4; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MaaFaaz4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1A4D1F00A3E;
	Fri,  4 Sep 2026 13:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788528655;
	bh=B60l+04pVEJwF9CCsix0ruYdcieZB/hTmAshk7wFSYI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=MaaFaaz4nSYAq8MkFJX8WlwMDKregF1jJ38pil8/kUZLbAnCG8TxTZe8d+NDnpGeu
	 x4kBSbvM4JxDwNm/mtdEPpwV0sCMmnWoEjugG2l7+4egWhj2fHm5wxq1Oxd7zZsogU
	 6FaHckjIpcfdp5168g3boalKXjoa7oxU5fna/9dn22Awhn2OCDfIJhFpawBbfxwCsT
	 AkeHThzC7CSQHS7TfwbQt0VO1n1s+7iUEqdF0lD+43azAjeTaSR29fBcV9UXwPhDYB
	 7Gw2TnQvHIfg4g8+4DmMwBR0vuT77VTQzPibvMNip1FIKljzNHQDs7iFiYKDu7x/mx
	 ch5Tc12JdiN6Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 01/19] dt-bindings: phy: Add
 starfive,jh7110-inno-hdmi-phy
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Wilczynski" <m.wilczynski@samsung.com>
Cc: devicetree@vger.kernel.org, linux-clk@vger.kernel.org, robh@kernel.org, linux-phy@lists.infradead.org, mfd@lists.linux.dev, vkoul@kernel.org, conor+dt@kernel.org, lee@kernel.org, neil.armstrong@linaro.org, olteanv@gmail.com, dri-devel@lists.freedesktop.org
In-Reply-To: <20260904-jh7110-clean-send-v3-1-484f9ae72715@samsung.com>
References: <20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
 <CGME20260904132710eucas1p276bacb1cda0a62d7f29066bd66660fea@eucas1p2.samsung.com>
 <20260904-jh7110-clean-send-v3-1-484f9ae72715@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 04 Sep 2026 13:30:54 +0000
Message-Id: <20260904133054.E1A4D1F00A3E@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

> Add the dt-binding for the StarFive JH7110 Innosilicon HDMI PHY.
>=20
> This device is a child of the starfive,jh7110-hdmi-subsystem node. It
> functions as both a PHY provider for the controller and as a clock
> provider for the variable pixel clock (hdmi_pclk), which it generates
> from its refoclk.
>=20
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260904-jh7110-cle=
an-send-v3-0-484f9ae72715@samsung.com?part=3D1

