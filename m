Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E06534A0EF3;
	Tue, 15 Sep 2026 15:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789486546; cv=none; b=jogy5LQy/Z6Fj1rrAPfNvloBmDWHj1t65gRU5W0sUCeBXmgXicm3+eHtybz3pNNQgS3an/7Czgpz+9e6ucljN+qS4BwhVyQkdnoDFhGvNVSwri6wJq0UbGDqtq4G9aWmZva/vMMXo5n1PhvG8jVHSoRS5qgmO01C/2prggHKxEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789486546; c=relaxed/simple;
	bh=/8/hW+qxYN77uifUveBYUvPnrFFoDTHqZaAe2GTTgeI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=aHrP9lWHdXOvHXFKKWXibrf/rNug7/vUMyCXiziNlSgf/KznyeO+93Q+g1k++EDigtQQiQ1ewU3k0qe0c09yJGgd4820uvBpWnEhf6t87sYT61/l+6yPo9QUnz0b/A8B3LBcM+wIt9ViLhqRWVW5AOHl25TXULh4aJ7vn2p9/aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dn/ZCzLv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dn/ZCzLv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D85DD1F00893;
	Tue, 15 Sep 2026 15:35:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789486544;
	bh=/8/hW+qxYN77uifUveBYUvPnrFFoDTHqZaAe2GTTgeI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dn/ZCzLvjCO80mdf2cjHQ4RdPpJ3hR/HtnXU/uzEM2BaeAxtkJO05XqL6yOY7lVNN
	 8LhS0X1r5SjuOhBphxE2r90uqcJIUYawoqPmn65oUCkMqC7OD0nr9R3m+Lrg1rFuMq
	 s1JjP0I0qmtpQvYXrBht7tlV47gZiAvp9XQEPcIQU+CfQ8sGdrwAYt5ulm0LuW/Wlf
	 LBfNNZO8HhZignRnzRwAO9bhHnezvmzP8xqvs8W1nY4t7iaJ6Q+ZAnL2lFuaeumFPb
	 qIxhwKssEZ8EbBj47Nw1GmZ/ZoSaawYdYhjEVKVEyLDXMkgSXypbwoi8qpe29tWifK
	 7tbxLc54YUOOg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 01/20] dt-bindings: phy: Add
 starfive,jh7110-inno-hdmi-phy
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Wilczynski" <m.wilczynski@samsung.com>
Cc: vkoul@kernel.org, devicetree@vger.kernel.org, lee@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org, linux-phy@lists.infradead.org, robh@kernel.org, linux-clk@vger.kernel.org, mfd@lists.linux.dev, dri-devel@lists.freedesktop.org, olteanv@gmail.com
In-Reply-To: <20260915-jh7110-clean-send-v4-1-f0e4fd6f2cc8@samsung.com>
References: <20260915-jh7110-clean-send-v4-0-f0e4fd6f2cc8@samsung.com>
 <CGME20260915153214eucas1p2b548f3236ef98fb0cbf320e397420125@eucas1p2.samsung.com>
 <20260915-jh7110-clean-send-v4-1-f0e4fd6f2cc8@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 15 Sep 2026 15:35:43 +0000
Message-Id: <20260915153543.D85DD1F00893@smtp.kernel.org>
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
> Reviewed-by: Joshua Peisach <jpeisach@ubuntu.com>
> Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260915-jh7110-cle=
an-send-v4-0-f0e4fd6f2cc8@samsung.com?part=3D1

