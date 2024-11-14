Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5C4F189F39;
	Thu, 14 Nov 2024 21:01:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731618080; cv=none; b=LuK+np2PRBGOODUsA1SnsWuehID4QpIuk9PYbzl2usiildOxCsWNWfPEE1xw+YEGJY4uEN0uup7BzNvLo4Ui11PPHeWrvUzqn5eW3B4fiyB25eeIqb79GplICpTJAspKr72DJoBeUOwJNtk2m9duHrAv4ARN0/k+WKmjcpQL7IQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731618080; c=relaxed/simple;
	bh=RG1GHuMKWcuonmjsC+qi8OfZV4+4HUh57bb4KUZX6QY=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=nEKYQ2V8yyBodAI1zrDNgfQmPglOxGf6i0p3dtuCbpEvqIVsjWddEQu2GdrGJHOyvQKrR2zgjbEP8Zo8jGQuzVie6Zv+a7NtIHcHgzV+Plae80AWLP8mpQaERzQfNJ9QbHLHspVOYpytBEVBUwNmILXA2gDvO0AMPzvgmglLqiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nf1c8pyx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nf1c8pyx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37B0FC4CECD;
	Thu, 14 Nov 2024 21:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731618080;
	bh=RG1GHuMKWcuonmjsC+qi8OfZV4+4HUh57bb4KUZX6QY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=nf1c8pyxATuPT4X46VFsO4vdktspzDfSWFvirSPUhMWto+qEi5J1JAF70zfiwd8RJ
	 uW+1HASKf1GZXGaFJqUA/P5X3xjZKhCCzaMkj1ftqnkcItHE8nQ42GkMlxpXo4LeVp
	 whUNqVmK0IbPUbiPkvPj/EMT+ogLR++XGPQ3PADSBduy2UsjNCYBvTcc9TV+TybiK9
	 MQwMeq5lAxkEdjXKS16SWh4q8Jv1KMst9DCIbz1dxZHpjz9DkjKXEZuR5fkV8ocnLH
	 EKOKYhG2sOM4+pLKpYJcRLSvqSF8sJNaH1NUMH8pmYX0gsqpzWMZr53Gc3DQC4YJTR
	 FZRm8HN5UDZgg==
Message-ID: <47b2b9acfc19f3d4801e5cdd0e1c040b.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241112-clk-en7581-syscon-v2-2-8ada5e394ae4@kernel.org>
References: <20241112-clk-en7581-syscon-v2-0-8ada5e394ae4@kernel.org> <20241112-clk-en7581-syscon-v2-2-8ada5e394ae4@kernel.org>
Subject: Re: [PATCH RESEND v2 2/7] clk: en7523: remove REG_PCIE*_{MEM,MEM_MASK} configuration
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, upstream@airoha.com, angelogioacchino.delregno@collabora.com, linux-arm-kernel@lists.infradead.org, lorenzo.bianconi83@gmail.com, ansuelsmth@gmail.com, Lorenzo Bianconi <lorenzo@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>
Date: Thu, 14 Nov 2024 13:01:18 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Lorenzo Bianconi (2024-11-11 16:08:49)
> REG_PCIE*_MEM and REG_PCIE*_MEM_MASK regs (PBUS_CSR memory region) are not
> part of the scu block on the EN7581 SoC and they are used to select the
> PCIE ports on the PBUS, so remove this configuration from the clock driver
> and set these registers in the PCIE host driver instead.
> This patch does not introduce any backward incompatibility since the dts
> for EN7581 SoC is not upstream yet.
>=20
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---

Applied to clk-next
