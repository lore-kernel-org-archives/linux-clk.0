Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9611B78F26;
	Tue, 24 Mar 2026 00:38:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774312689; cv=none; b=uO2SN0MiSSLkFWRdulMSu0BNCWyqvZW9cTtwr2LmQ6Fu6B7MSgblKYVgHRBsdgIFWaugszQzzd12TzBZ83aljjKJFnn61RrehvR//s8O1WsYUQwea3Wv5rOjybDN8cO0kynCUXgnUMqyNK/10neZc4MgvVY3CunDIv4MRr5ybVw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774312689; c=relaxed/simple;
	bh=b57pKLm7yugh5thJ+wTcgduPJVooziPx23RU5AvPusw=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=Xp5y2S8rm7HcWk5QLWUaEqgQT2cc3pVYiuGfnx71gmR3ivVLsc4Byi/wmcgMRcge7jXAtlJIlugWGbeafl4oDe2x/Nho0HcNHqUi75gQ7lKUVRB0g2H3xzADWCyQsRJfmfig8Yv7IhVeHiymn625ImkMXAj4aKAybUWm11GTI6s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NBzq9HS3; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NBzq9HS3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1DA89C4CEF7;
	Tue, 24 Mar 2026 00:38:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774312689;
	bh=b57pKLm7yugh5thJ+wTcgduPJVooziPx23RU5AvPusw=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=NBzq9HS3Tb7UH4uHwNBJgdtAJbQZNzvf2EYEuttR2ocZLI2seG5dzsEwrm9Eu2vhJ
	 GF+o3riis28tr1qjEczmf+ShPLcFDrm4s1hlT+0IdLBviQ94ZPLXySkcEYj9nfwByI
	 ad4twx/EV3s+FW0PBfOoNpPPjuXfH8OJM5RqPnoOmdNHGproikCgD47FwLcZpRS4d+
	 Jxstl0WB4NXXfYTAKzDPuzQqdOxJuAWp0mU/OEUbpY1r+LzSwsKbYo/5SEcUJ1IzXw
	 aKcpXfBb+3XV5nk5WeWzez+9CxScI1/7atOfMSt7L/j6DaNNfOt1L4lpJCOptRPy1v
	 Fa6de13OsIywA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260317-clk-eyeq7-v5-0-6f6daa2c2367@bootlin.com>
References: <20260317-clk-eyeq7-v5-0-6f6daa2c2367@bootlin.com>
Subject: Re: [PATCH v5 00/10] Add clock and reset support for Mobileye EyeQ7H
From: Stephen Boyd <sboyd@kernel.org>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Tawfik Bayouk <tawfik.bayouk@mobileye.com>, linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-mips@vger.kernel.org, =?utf-8?q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Sari Khoury <sari.khoury@mobileye.com>, Brian Masney <bmasney@redhat.com>
To: Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, =?utf-8?q?Beno=C3=AEt?= Monin <benoit.monin@bootlin.com>, Conor Dooley <conor+dt@kernel.org>, Gregory CLEMENT <gregory.clement@bootlin.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Palmer Dabbelt <palmer@dabbelt.com>, Paul Walmsley <pjw@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, =?utf-8?q?Th=C3=A9o?= Lebrun <theo.lebrun@bootlin.com>, Vladimir Kondratiev <vladimir.kondratiev@mobileye.com>
Date: Mon, 23 Mar 2026 17:38:07 -0700
Message-ID: <177431268711.5403.12519723172593766522@lazor>
User-Agent: alot/0.12

Quoting Beno=C3=AEt Monin (2026-03-17 06:33:02)
> This patchset brings the support of the Other Logic Blocks (OLB)
> found in the first Mobileye SoC based on the RISC-V architecture, the
> EyeQ7H. Despite the change from MIPS to RISC-V, the Other Logic Blocks
> provide similar clock and reset functions to the controllers of the
> chip. This series introduces the device tree bindings of the SoC and
> the necessary changes to the clock and reset eyeq drivers.
>
[...]
>=20
> This series depends on the EyeQ6Lplus support patchset posted
> previously[1], which in turn depends on Th=C3=A9o's series[2]. In particu=
lar,
> the changes made to the clk-eyeq driver in this patchset depend on the
> changes done in these two series.

Is it a build time dependency or a run time dependency? Are you
expecting me to apply all three series to the clk tree?
