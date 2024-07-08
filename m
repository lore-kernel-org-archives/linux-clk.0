Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAC0222EE5;
	Mon,  8 Jul 2024 20:21:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720470108; cv=none; b=LthZl9V8dS+dI3R9aB/QuFtFsmfr45NZlr0ZtYYofhxgIV35FU3QrRR3O0kphEECunavUFpwcu87N1S7R4nl5IDfKM+bW2I2eh0m+yA2d8wX5yBnb2zX+SSoQGOkrExi0AiQZ71weNPidBp2pXlwyeXKqTbx09344xFaEZlSKGc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720470108; c=relaxed/simple;
	bh=5H67sm2p/hVPA+PlEi+AJKcBLHcU8VNxgvkoCbY/hGs=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=eNM/x8qK9QlI4VHIwYeEEGYCOoB7MbnEydPll0rqXvfVW5Ky83oQbRsGMpka75a45pkrhzuKb/Revdf2pMozmQhN2KjUa6maZLKtI2CqPQfWh+RJiwBidOyyKJ3iOx8rAqrXlGFCFLSnIPaaCAnLZjAsQSnjlqmQIGsYAefxSe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TX47HeFk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TX47HeFk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 171C9C116B1;
	Mon,  8 Jul 2024 20:21:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720470108;
	bh=5H67sm2p/hVPA+PlEi+AJKcBLHcU8VNxgvkoCbY/hGs=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=TX47HeFkOklmAlycO7LKJcm0ykd/AnzT4X1dTnqxm+9Atb5d5pU4lxjasiQ0s6ht/
	 fZ4hiMDOrZg+VOAxoiiR93YiqGutSW+phI0c2D1/vbPAQs14B45nt15jOD15FwYIS9
	 fqzUYF2n+1vFkk9XyYBts43eB+rgkRoql39b+8W/PXXTUgwT9gfNEW7PqeyyGPPKMQ
	 IHa0+dRmhGOWp5UACHmBDC2wF/54qkvgg0NSMpKo1qzwklTjV9XTsHc724lEUQWoF2
	 fCPcfpxhxJl0Avxn2Q7vfFUeYgGXN7KZvoSjP2evS3KDitERNTd9X/CsVURKRdgCvw
	 t0LS0XmmL1yqA==
Message-ID: <875e0fd4b58dd128e9e49ed4831cf106.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <16df149975514d3030499c48fc1c64f090093595.1719485847.git.lorenzo@kernel.org>
References: <cover.1719485847.git.lorenzo@kernel.org> <16df149975514d3030499c48fc1c64f090093595.1719485847.git.lorenzo@kernel.org>
Subject: Re: [PATCH v4 3/4] clk: en7523: Remove pcie prepare/unpreare callbacks for EN7581 SoC
From: Stephen Boyd <sboyd@kernel.org>
Cc: p.zabel@pengutronix.de, mturquette@baylibre.com, lorenzo.bianconi83@gmail.com, conor@kernel.org, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org, nbd@nbd.name, john@phrozen.org, dd@embedd.com, catalin.marinas@arm.com, will@kernel.org, upstream@airoha.com, angelogioacchino.delregno@collabora.com
To: Lorenzo Bianconi <lorenzo@kernel.org>, linux-clk@vger.kernel.org
Date: Mon, 08 Jul 2024 13:21:45 -0700
User-Agent: alot/0.10

Quoting Lorenzo Bianconi (2024-06-27 04:04:24)
> Get rid of prepare and unpreare callbacks for PCIe clock since they can
> be modeled as a reset line cosumed by the PCIe driver
> (pcie-mediatek-gen3)
>=20
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Tested-by: Zhengping Zhang <zhengping.zhang@airoha.com>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---

Applied to clk-next
