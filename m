Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 580E28BEC;
	Thu, 11 Apr 2024 03:35:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712806546; cv=none; b=J2xi/PEFuCEWkxqISWLf+THOWeeFS4yy32c44wFEzXsaFKzslomng80/xwBEJt4JUYwd0pzItDrGWATJUB7YhKLduIJ83JFllc7V5sps2+9QoO6qY8B10Cq5TpVv31Lb9adBLTZOB3o/WaLJEsW3PCR+uZWM4JOyaIu/sZPkCkE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712806546; c=relaxed/simple;
	bh=lu6dKt2t3nxQ8sSS/ReBvw4+JPMSpNb3sUrJBcIvCa0=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=pFIx8KKU+Pbl9D+rcfiwVKcD2bFY8Zjv5s8jcpyisDIXOABFUGeXGbh7AwheKk9V6e6gE3AuNcc1cdAKbalDi9YGisRCMLDQE/0QSRUG6XvICW3P81/kVBuyBlGDDun+WJ1bLmFipr9R7d2/fTLxFnwa/vb0Nuc3Dg9nsI9Dncs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YhrCIoIy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YhrCIoIy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB1A4C433F1;
	Thu, 11 Apr 2024 03:35:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712806545;
	bh=lu6dKt2t3nxQ8sSS/ReBvw4+JPMSpNb3sUrJBcIvCa0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=YhrCIoIyB31ZJlJEzZS2g+bySieDHKXjvtQkZLav/GAL2XM7DDDGYlnr3jsKsao8z
	 L8+e5GTnmxB/dsiDTK//4NJ6bBwB1GH41UrZU93r+Wmy1ELeD+CQlzJ37rn2X7onD5
	 WYu9IJYBI2WpYgU0GVz1k4/O3Kp6ZbYYF6eYh22Fi9K7nRhEyJ4iA+yGlwQecPOfpA
	 hbz8rHJHYVB2e4eWc1wQw3PqMb4vGPkk6BnCWTzt9QZWY6o/TYFb71mbfx1agUuUvf
	 FaOA49zpkqonXERrMdxaXsgJyVR+ig4CFaQLvTXSSOU2ZE1JTP7oIyDFZ52gh2Yliu
	 1qP2LM659rUvA==
Message-ID: <1f4d01d840badaf8c1fe4aad048c5038.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <99734deb28889e685a764da94418f68b55ee3bdc.1712399981.git.lorenzo@kernel.org>
References: <cover.1712399980.git.lorenzo@kernel.org> <99734deb28889e685a764da94418f68b55ee3bdc.1712399981.git.lorenzo@kernel.org>
Subject: Re: [PATCH v2 1/4] dt-bindings: clock: airoha: add EN7581 binding
From: Stephen Boyd <sboyd@kernel.org>
Cc: mturquette@baylibre.com, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, nbd@nbd.name, john@phrozen.org, devicetree@vger.kernel.org, dd@embedd.com, catalin.marinas@arm.com, will@kernel.org, upstream@airoha.com, lorenzo.bianconi83@gmail.com, angelogioacchino.delregno@collabora.com
To: Lorenzo Bianconi <lorenzo@kernel.org>, linux-clk@vger.kernel.org
Date: Wed, 10 Apr 2024 20:35:43 -0700
User-Agent: alot/0.10

Quoting Lorenzo Bianconi (2024-04-06 03:43:41)
> Introduce Airoha EN7581 entry in Airoha EN7523 clock binding
>=20
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---

Applied to clk-next
