Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 970C7223DCE;
	Tue, 25 Aug 2026 21:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787693756; cv=none; b=I3aqXn2vnuS/oT8iEIICnS0whSrbdci6O9QkqYO6bCrvXknv5sbL0xTN8iHZPSdTjqroeVd6YNzesW5SQsfk3mUz4cSI3Cm6dkOa0w5U7vC5CI5PwIe8yIp7VBGeF33FcaViFzr3B76/7ybRPbnbSdT6deJy3dCJsUzdySyYgS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787693756; c=relaxed/simple;
	bh=PiuyAAnXTD/FBHz2Q4sESKePsIDGYD5uWtmcS3Qb9C8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=YorAKmFbUYnyTQYJdxP+82OdyQ8zg7zF9VoT4giEEZdg6um+UJVve836k+B9mm1DcoHfrf1BlNuFpunPoC/JFhVDBpxfNXf4YMsvLq8DCk7T0dnbDYMHVi9Y4ZtblOmHgZLUiHnIU1Mvuf8ii76OT4fRRl8bKn7uENnITCxy+9A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YEG+cxRu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YEG+cxRu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C20161F000E9;
	Tue, 25 Aug 2026 21:35:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787693755;
	bh=PiuyAAnXTD/FBHz2Q4sESKePsIDGYD5uWtmcS3Qb9C8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=YEG+cxRu/gZezdrrROsY1yDw2/CBLeZBckjfWwYOfctkVwTLPpvNA6YXyn4uoN64h
	 nT/0bWbUBsLeps68OD487q4cwteBTVANpk10jt5Pmi9In12O9f5w7HuQHv/l7DAEL3
	 Nv94kTFQvbDpHmZDv4loHjPDLc0sOXnjE83YwkMMm1m3GaSV9DtQSTeRdixhNDBJG4
	 wOCIKMgH3wSXbFOkvf9VlN7TYf8v/s4jU+OG3300zk2zqGrorcscLwgPwp/Eo2vp7q
	 y6s6rI3pxWlOpxnPsuAIE90tlGWJw/OIkkA3v5dFjvROXzbjmmxTKYZD/jXFltb5GT
	 pWIzZFKauTy2A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 08/12] clk: zte: Add zx PLL support infrastructure
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: conor+dt@kernel.org, linux-phy@lists.infradead.org, lee@kernel.org, mfd@lists.linux.dev, vkoul@kernel.org, olteanv@gmail.com, devicetree@vger.kernel.org, robh@kernel.org, linux-clk@vger.kernel.org, neil.armstrong@linaro.org
In-Reply-To: <20260826-zx29clk-v11-8-f8ad59c6426c@gmail.com>
References: <20260826-zx29clk-v11-0-f8ad59c6426c@gmail.com>
 <20260826-zx29clk-v11-8-f8ad59c6426c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 21:35:54 +0000
Message-Id: <20260825213554.C20161F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

> This patch adds code to decode and program PLL settings on ZTE's
> zx297520v3 SoC. The PLLs on this SoC are usually programmed to static
> values by the boot loader. The only situation where .set_rate matters is
> dpll, which is not programmed in some cases. The bootloader always sets
> fixed rates though: 624 MHz for mpll, 200 for gpll, 480 for upll.
>=20
> Parsing the bootloader-programmed values allows the clock driver to fill
> the clock tree with appropriately clocked parent clocks instead of
> registering fixed clocks with hardcoded rates.
>=20
> I only tested the code on zx297520v3. From looking at the hardcoded PLL
> values in the old zx296702 / zx296718 code I believe that these PLLs use
> the same encoding, so the code added by this patch should be reusable
> and the file has a relatively generic name pll-zx.c.
>=20
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826-zx29clk-v1=
1-0-f8ad59c6426c@gmail.com?part=3D8

