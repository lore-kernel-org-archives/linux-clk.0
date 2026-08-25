Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C8824749C2;
	Tue, 25 Aug 2026 21:39:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787693941; cv=none; b=Q+esbNOqn8MfGMqFjhr6ztjtt3If6T+Tl2oX9dN/e+PfETRlVkIbqkq5+YgdH1Ygn7ltOxJSD+oy0xHNrM/9r2gw0bYLATHV7xOWgejCxQs3TfhoUz8Bd6k/9u6uhKy2X75IhZTXywfAQxcnEsC/F+eK/TcLs+lDmuSE0cRSzg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787693941; c=relaxed/simple;
	bh=aqmkmT7wtFvyC5BegtZqMt+78mk7sHfKD7OyrIkx6FU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=oJL1aJK6NbAcB+lYzMb/ajmzHMlOrtz8z0tDOkuA7+PxWE3DugXFd1591OiZgS+JGEiBW0m1Zl/eKxLrDFYOsS46rexYdrZujGpMoL523NhKHpBdCPF2Tc8wqy1IcG/HZqI79RcstNYoSNQnM5Yr7JLeObU6f/WqFz20ykFw8B8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iRcLPxnj; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iRcLPxnj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 625271F000E9;
	Tue, 25 Aug 2026 21:38:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787693940;
	bh=aqmkmT7wtFvyC5BegtZqMt+78mk7sHfKD7OyrIkx6FU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=iRcLPxnj/PDGemmUmP1DlRGsuu8Vhb+cjGsaL6muz3DNeV/0D6Sw9q2ZBme8Dwejp
	 OF9pEcfxkSxg9vEzRSukQoG9tiqQfPhbM9UHGlAScRnNKDvRXmroD9Vff6Y3aqAY9s
	 ZEZ59cIpCIIDWRtUKt5FsxszMNdfmipxVKmSMeUoBQoVzhYY41La5UCghXLG6eflwJ
	 lAeRjCntH/sqHFyxfkX73DVUxI6qeIfM5ld6RQlesiRHfypo4TkiGKwi4rqAXwIbO2
	 eJJQzS9yo9zwbMFIokGB5FyQ+VlkULNmwhBofDc0DFGVBO+EGQwenVsBXAEyskPDXk
	 G5GREy20yLdDA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 07/12] clk: zte: Add regmap-based clocks
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: linux-clk@vger.kernel.org, lee@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, vkoul@kernel.org, olteanv@gmail.com, robh@kernel.org, neil.armstrong@linaro.org, mfd@lists.linux.dev, linux-phy@lists.infradead.org
In-Reply-To: <20260826-zx29clk-v11-7-f8ad59c6426c@gmail.com>
References: <20260826-zx29clk-v11-0-f8ad59c6426c@gmail.com>
 <20260826-zx29clk-v11-7-f8ad59c6426c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 21:38:59 +0000
Message-Id: <20260825213859.625271F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

> This is based on meson/clk-regmap.c, although slightly simplified. I
> have kept the copyright lines at the top of the file to indicate its
> origin.
>=20
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826-zx29clk-v1=
1-0-f8ad59c6426c@gmail.com?part=3D7

