Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FA89223DCE;
	Tue, 25 Aug 2026 21:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787693559; cv=none; b=ItnZ8VebGND4quleZR7XqixUfMFmqdxJvIoSiveOJQ2VNGkyFUjWBd9Z8LBLp1WHs/fCOfa+2BR3Nn3X45geMurtcP/jFxkhR+SRK+xfnlGW5TfvLPjBU2deDIiNMR3Y069WcIVE/6B+ujdILRpR2qFkFY9uXkiFn05uSWsSwek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787693559; c=relaxed/simple;
	bh=SUC54+43F1hf0qzQIv3VS47F/8oZat89ZOQQO5SprqU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=ohUpv6et+8teh3O6+KKRXIMfJiwLNBC8ZzFHELIUxxi3FCjoqi4y3B7ekOfsrmPtSDNaQO3CgL2OupPskcmd4oa+tfprqzG8sxnDMxFYwYmg94LK0HA8K8s/JsjKB4TrdSVYvBOQgxtljiqcFDSjiFlalwxgpvmKvJTTNTIhR7U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HBoj23J7; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HBoj23J7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CCBE1F000E9;
	Tue, 25 Aug 2026 21:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787693557;
	bh=SUC54+43F1hf0qzQIv3VS47F/8oZat89ZOQQO5SprqU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HBoj23J7bfZ+45ahGYU96uX7yhOiReC65m+QUDgSh/8jjp1kzY/xKa9P9WCUDMOAw
	 ZreDPnCJIElCKT0v/rsHfdaHYLePKpt7ZB4CegIwjv6J8icfLiUPGNPfFn9Hb2SzIm
	 BE0Jcc+Hki0U+z9IczN9WzEffunATTOTvTgXLyQbJNs5Z/tynqwzh0Svu5CzqDZNrD
	 cvbxGZ2wiry6JghkfwezT1jjpVOEgF7F4rivss63R/doVd8SUyWaKudvGlRl8htuD6
	 PjNHJZWm9OsLW8oPB5/m6FGM8/k8qTGCCKiT1aCIdiIAuLdwyWR8kmZFRhw4bHjGk0
	 iOdFwUuNiADaA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v11 06/12] clk: zte: Add Clock registration
 infrastructure
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?U3RlZmFuIETDtnNpbmdlcg==?= <stefandoesinger@gmail.com>
Cc: robh@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org, lee@kernel.org, linux-phy@lists.infradead.org, neil.armstrong@linaro.org, vkoul@kernel.org, olteanv@gmail.com
In-Reply-To: <20260826-zx29clk-v11-6-f8ad59c6426c@gmail.com>
References: <20260826-zx29clk-v11-0-f8ad59c6426c@gmail.com>
 <20260826-zx29clk-v11-6-f8ad59c6426c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 25 Aug 2026 21:32:36 +0000
Message-Id: <20260825213237.0CCBE1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

> The next patches will implement the regmap clocks and PLL driver. The
> actual hardware specific clock listing will live in a separate module.
>=20
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Stefan D=C3=B6singer <stefandoesinger@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260826-zx29clk-v1=
1-0-f8ad59c6426c@gmail.com?part=3D6

