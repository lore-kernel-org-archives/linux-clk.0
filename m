Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4940D2F5A36;
	Tue, 18 Aug 2026 10:39:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787049582; cv=none; b=HLK4+3zEIl6vhlXsms3jtPz9Jor++dCM5N7JuNFrb75l1cMsiNdEGjlxQ+gZGE4tLepUMmPiUtZfZW4RUfQyF8VL34H+6F2keU9TCZBTWeFCzdG+CrlNqjwkKpYLMa4pt+tRoRbAjRP0GK4dbmFMEFQbG6i6IEsf0qKFa+nRtP4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787049582; c=relaxed/simple;
	bh=5KvkHDtFzsvbN4IcUAn5+NgWKmh4AbJXCgPUnkE/tEg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=EED8zmgpoc6cBcXKOvJ38vLnmO/U9Db4dNImfU281ji2ulucuvWaZnXX9dMrm+aO3sc+2bF5I9DVds8NzgNd2+b9Y3tjGdg6HcAstTQOpUKT1QJsGUJxptx2krB+7gx3H/9vEltz3RaK0+3kbBfLY33b7fRdb/JUcN7rWhU/334=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hm1J81Vi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hm1J81Vi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A05F31F00A3A;
	Tue, 18 Aug 2026 10:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787049580;
	bh=5KvkHDtFzsvbN4IcUAn5+NgWKmh4AbJXCgPUnkE/tEg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=hm1J81VixoMfDBkwND2ncVKtPXo7vViWbZDVDXxycBzme0ssFZALlKbiFFLArVjQW
	 I10wfD+v/FZnz4pEXxLGqcDsJ6uiVrvVuJWr4POfOKHRj2KdEXFI8lkY+Ycs74Bs9h
	 PS5vL2pjxI+tVKT3MbwmfCZsIufX+aAR+M3fBbuB1f1CEQWRYBtL8utRHzFHJiTPBb
	 hbFK+MUmh1GqTw1jKetgl2Q0MpfszCOSRyNiNXOQJVZ0M6nq7TFyPPdAeJmKtK/dpQ
	 hrDSS+GfdT3KDJyMrbFmCjCBlFJr5xEjYz++Hf3MyRA6x5itX698liyd3qxef37aO7
	 lgILwhw7s0QYw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 04/12] dt-bindings: pinctrl: add Ambarella CV75
 pinctrl
Reply-To: sashiko-reviews@lists.linux.dev
To: "Long Zhao" <longzhao@ambarella.com>
Cc: lee@kernel.org, conor+dt@kernel.org, mfd@lists.linux.dev, robh@kernel.org, linux-clk@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260818-cv75-v5-v5-4-7bbb12f0360f@ambarella.com>
References: <20260818-cv75-v5-v5-0-7bbb12f0360f@ambarella.com>
 <20260818-cv75-v5-v5-4-7bbb12f0360f@ambarella.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 18 Aug 2026 10:39:40 +0000
Message-Id: <20260818103940.A05F31F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>

> From: Long Zhao <longzhao@ambarella.com>
>=20
> Document the CV75 pin controller binding using generic function and
> groups properties for pinmux configuration.
>=20
> Signed-off-by: Long Zhao <longzhao@ambarella.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260818-cv75-v5-v5=
-0-7bbb12f0360f@ambarella.com?part=3D4

