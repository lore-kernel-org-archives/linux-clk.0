Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E844189F39;
	Thu, 14 Nov 2024 21:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731618164; cv=none; b=iQZ9hF6MwsPMICiZUPJwlCfb0Ttwj+Z22qYMawegtgPqB/RonIwq2alF7BSi6zK7L76PSty1iE42CVmdJB1izE/G1oIZdl0IXPdWCetZlCz3Nr87NNbKWE23eybIBeUD0ydyLHI899XP2S8+57gRlSpdcrNDY7FFNwFPRQ987kk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731618164; c=relaxed/simple;
	bh=x9tlQ6UIV80cZmXaqxhISxlCRaJ5DdpbEU69bjf7t98=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=tnzDYY24sNrjd6IwgLuxVZfvEFbQFCA9ccu2CdEROFLLL3dfNzmYTyWg7SpkKZWfLQ3RUdH0ZflMa1tGlZFSiCVa3w0PDfccIXjLT5J+FKEK1utds8vffjHit6EWEJacgW/clALArEA3ytKb5x87Knt1zrwm/qTm7r6BbeoYN/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tNv3hNkl; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tNv3hNkl"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E56ECC4CECD;
	Thu, 14 Nov 2024 21:02:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731618164;
	bh=x9tlQ6UIV80cZmXaqxhISxlCRaJ5DdpbEU69bjf7t98=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=tNv3hNkleQ+UI2yJpVF7OzzSWX1l6tzUvXfSYXQrTj/lqBFiSCH6l44UQrSIqUPzz
	 VJ52YNHQCD1QYZCINueM3Hj6YqUmTgvcia2TfZHpBF8SHfl2kOBU8FEPhRu5HDMyn8
	 JIlcisH0iJMniZ+C2h3zd+9HQwMKmhlCCxshdeedLms635oxJR6marfHiSziz63Ikr
	 dWp6tri+dH+YMfqmVDsp6ZQOrK2bBSKiWoEaGdxjoYJUHv6oH0BURysoTR9QhcMjEb
	 pqFA4wcgf6MORFRUM/DtyXtt+gWWewoxVrMAbVXIxwdSj2gcZh/IOPDB8IS/IlrU0M
	 BRBk1W/dPB44Q==
Message-ID: <b59b3c8bd47e09a29da3b1f65eb949a2.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241112-clk-en7581-syscon-v2-7-8ada5e394ae4@kernel.org>
References: <20241112-clk-en7581-syscon-v2-0-8ada5e394ae4@kernel.org> <20241112-clk-en7581-syscon-v2-7-8ada5e394ae4@kernel.org>
Subject: Re: [PATCH RESEND v2 7/7] clk: en7523: map io region in a single block
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, upstream@airoha.com, angelogioacchino.delregno@collabora.com, linux-arm-kernel@lists.infradead.org, lorenzo.bianconi83@gmail.com, ansuelsmth@gmail.com, Lorenzo Bianconi <lorenzo@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Lorenzo Bianconi <lorenzo@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>
Date: Thu, 14 Nov 2024 13:02:42 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Lorenzo Bianconi (2024-11-11 16:08:54)
> Map all clock-controller memory region in a single block.
> This patch does not introduce any backward incompatibility since the dts
> for EN7581 SoC is not upstream yet.
>=20
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---

Applied to clk-next
