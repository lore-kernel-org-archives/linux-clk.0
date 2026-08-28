Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136CB57C9F;
	Fri, 28 Aug 2026 13:54:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787925248; cv=none; b=uQIPaSCK6hG+SxS/Kqxei9KLLMCEd/n2Zw8PmssrSwqDJyyEpnI0o1AIq4X6sHF2CQtXYb1yFO2QTGO6L7Bj/eOQxzvKWKhPxcmYltKBzA3QZ9dMom9/EWpsuTqoP5jZWbj1MjNMcP72lJALeK+B9I0qwx5qO2Ckqyo2L/ERdi8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787925248; c=relaxed/simple;
	bh=maQivNSpVB6XnV3+sMBf45xqEAzNIfoDtkLG4/jfn8c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=M8b3/s4gakKxDyWeedvH0HaXiPmQor/O/5xJblt0Qvguf1Bcl1aoBepA39ulGhYBxkuYI3KEOYo/PPTQMsODca0tO7uzvM1Rp2timorln0+yqmpPzxE5UX432QtFSN3B2fdKpjrzEgn4l+kKxE977CzPOnQJcdn9xOabcbswYts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ca3Y43Ch; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ca3Y43Ch"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFEEE1F00A3A;
	Fri, 28 Aug 2026 13:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787925246;
	bh=maQivNSpVB6XnV3+sMBf45xqEAzNIfoDtkLG4/jfn8c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ca3Y43Chb02BOJL6TOm2FitB7BSMh0O48UZybds5F69yKQ9Zw+q7IHt9xIb7xndDF
	 R4RLcUp5Z2GO4iWA+vsf+XrF3mOA8Yptv+L19DUD3cZHFWBvKeoetGVlEIn+JCO+Zk
	 +Ef1ieO5BJI1jJg3q/P+2FNtQ3G+o1t8F5+yUSK1zLC6CQwgqjC3izyarMb9FbuddK
	 l9TmFrftUE1bQMPhktQybucAr1cIUosw9ECGrr0vLnbhLQal1WjjzB0ZVspApyrIfJ
	 tOhmvwrNtnhxAAR/dddL0E88TOvj+qVRFQ4bVmvWWDxCWBAYnRTJO7z1PZxTDusuv5
	 Wva5yANyblIEA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 01/15] dt-bindings: phy: Add
 starfive,jh7110-inno-hdmi-phy
Reply-To: sashiko-reviews@lists.linux.dev
To: "Michal Wilczynski" <m.wilczynski@samsung.com>
Cc: devicetree@vger.kernel.org, lee@kernel.org, vkoul@kernel.org, conor+dt@kernel.org, linux-clk@vger.kernel.org, linux-phy@lists.infradead.org, mfd@lists.linux.dev, neil.armstrong@linaro.org, robh@kernel.org, dri-devel@lists.freedesktop.org, olteanv@gmail.com
In-Reply-To: <20260828-jh7110-clean-send-v2-1-331680c8b9d1@samsung.com>
References: <20260828-jh7110-clean-send-v2-0-331680c8b9d1@samsung.com>
 <CGME20260828134815eucas1p2b2aabc17e9cc6346e5a93bde5c650958@eucas1p2.samsung.com>
 <20260828-jh7110-clean-send-v2-1-331680c8b9d1@samsung.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 28 Aug 2026 13:54:04 +0000
Message-Id: <20260828135405.CFEEE1F00A3A@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260828-jh7110-cle=
an-send-v2-0-331680c8b9d1@samsung.com?part=3D1

