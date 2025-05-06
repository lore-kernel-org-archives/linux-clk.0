Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11CD2215F63;
	Tue,  6 May 2025 21:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746566074; cv=none; b=IIgkg1e2m6L3aP+cDSX4iVjnf7ARk1YqVbZxXr+caPpPKsT9Wg5NAeu6wV6yClcZ5PLtdH+xlq8dpzZiHK97ODCr48fs9q08IjX15+h1Kex6NulxXEJ6zt+songXG728sjt8jItqr+aPZuDkuLl3gJTe1GXWUEYnxM2Scd6sr3E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746566074; c=relaxed/simple;
	bh=p2gBbpdh0MU9XUpo9IR2GfSrQFpk/4KHCIH0J7/qXS4=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=EJc6WRZ0ALMnNFTAtv/sMTUc/HeBsTJ/sPxtBw6ONOY8WrsypzZSIg8ia0nXsDVUZovhIlEjTvqNvOJbDWWg7NDX67PJ733kqkPPCXfGWf+uqMY2D4N+fpbQVxfWoTpKNWaYyklydcsG3yO18dS7mkFGNeKJO2NchXzO43gaSuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ANoedxDe; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ANoedxDe"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 66D3CC4CEE4;
	Tue,  6 May 2025 21:14:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746566073;
	bh=p2gBbpdh0MU9XUpo9IR2GfSrQFpk/4KHCIH0J7/qXS4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ANoedxDePhtZvl/6IQfyofQo7GLHiGR/KaIr7LrvkCemRtnMhlSEyT2QBHL+xfHVx
	 j3TlgGwDCt82lTPWeSzokMYT435bmV14bm7suZ3sA2SJDQu7ITsb/5YcH4hWvq+S39
	 Jr0LC++E0JvUVgBxRmiAySdjk/+ondjBshHMmZewy/l+Fpgj37M52sE3n4inzRCgvl
	 s1NvI4hhYHLBUVoxZp111sSJLYWoE95VScl96+IcJeUXLWslRvR+MSXa2cLr/H3w4c
	 cfc7uqYDlsGCF+qvNQJVSz9F54jf4iNBBzCAnFHQ+hAhTomOD35oZxMLTkrj+ms8ga
	 YvdGQenSZA2EQ==
Message-ID: <66f58453c245b08aa709cce3482ac4c0@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250503080949.3945-1-wahrenst@gmx.net>
References: <20250503080949.3945-1-wahrenst@gmx.net>
Subject: Re: [PATCH] dt-bindings: clock: convert bcm2835-aux-clock to yaml
From: Stephen Boyd <sboyd@kernel.org>
Cc: Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org, bcm-kernel-feedback-list@broadcom.com, kernel-list@raspberrypi.com, devicetree@vger.kernel.org, Stefan Wahren <wahrenst@gmx.net>
To: Conor Dooley <conor+dt@kernel.org>, Florian Fainelli <florian.fainelli@broadcom.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Stefan Wahren <wahrenst@gmx.net>
Date: Tue, 06 May 2025 14:14:31 -0700
User-Agent: alot/0.12.dev8+g17a99a841c4b

Quoting Stefan Wahren (2025-05-03 01:09:49)
> Convert the DT binding document for BCM2835 auxiliary peripheral clock
> from .txt to YAML.
>=20
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>
> ---

Applied to clk-next (and dropped the label)
