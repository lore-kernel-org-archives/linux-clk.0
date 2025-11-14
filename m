Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B1625A2BB;
	Fri, 14 Nov 2025 04:09:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763093356; cv=none; b=J8fDhmn/4XrBEPOlw0HRMw83k6pjitO/9LZpcV9IKHkbdDOVcTNrByxEaKvpQKF1l2fLpbvM5FEDLOVAJPZph7lag6maqdfRlgNqSBnUYw//QYAG9cg4ISoPK8AM9AaOHF+5uQppvdSHDpi2Vo8C7syzPA5FCx5YKPRtdl4wWk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763093356; c=relaxed/simple;
	bh=R9gnqhkC7tG7M3NmKKfkco2hQBQzGue8GrDxF+AAz+c=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=g9gqpTitsiGQs3kYg9oPHVcfX/vlBpuAdZ6F4MmPWP/HiDC+RkgQTkM3LzD1QEDYils8cCWNlpl6UjAenz/G4hLGvHx2qoQAgZ5n7CciLzPSYC9lluHB1z2rsc4nrPfy791hZ57TgBSslqd81OoURAjC4NYdAo73jxuTHZZLlBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nXuWm3zN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nXuWm3zN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AFF69C4CEF1;
	Fri, 14 Nov 2025 04:09:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763093355;
	bh=R9gnqhkC7tG7M3NmKKfkco2hQBQzGue8GrDxF+AAz+c=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=nXuWm3zN7t6C8XMQU25qeHAqyjzsWBObfm22x9p9K9wgNsFlFp72uaxb+g7bNh7Ah
	 QkR/vm8rfu3ltWa8tke6WoyClc0JLmxFNw4Jn59uJK3SVf0TmCL2DT+nzsXJtW2E8o
	 dl8A10Y/h8hZBMwYp/Xn/nEiWIiTh4e7Iqkoo6tH9TFsYjIVYuDt4kktfGEKmCPUSm
	 ylM6R6i+l41Iu56wDbMYHnnEk59/+2RXwHk5hj7EmOAOcZyRfcDnogk3m+eZrPX5wb
	 HSjLvDukuZB8cQ6gGVYl8BwTFsUo6TpWsHgDrGt3DSapNQ6PI2hwmltGaEbqlDDKwQ
	 qKgBMfVqGJfsQ==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251110035645.892431-2-mikhail.kshevetskiy@iopsys.eu>
References: <20251110035645.892431-1-mikhail.kshevetskiy@iopsys.eu> <20251110035645.892431-2-mikhail.kshevetskiy@iopsys.eu>
Subject: Re: [PATCH RESEND v3 1/3] dt-bindings: clock: airoha: Add reset support to EN7523 clock binding
From: Stephen Boyd <sboyd@kernel.org>
Cc: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, Andreas Gnau <andreas.gnau@iopsys.eu>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Conor Dooley <conor+dt@kernel.org>, Felix Fietkau <nbd@nbd.name>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, Michael Turquette <mturquette@baylibre.com>, Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>, Philipp Zabel <p.zabel@pengutronix.de>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org
Date: Thu, 13 Nov 2025 20:09:13 -0800
Message-ID: <176309335369.11952.3651392650337156154@lazor>
User-Agent: alot/0.11

Quoting Mikhail Kshevetskiy (2025-11-09 19:56:43)
> Introduce reset capability to EN7523 device-tree clock binding
> documentation.
>=20
> Signed-off-by: Mikhail Kshevetskiy <mikhail.kshevetskiy@iopsys.eu>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---

Applied to clk-next
