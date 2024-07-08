Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B780B22EE5;
	Mon,  8 Jul 2024 20:21:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720470091; cv=none; b=Odn+RPii4V+eM2qraJuLFX5oB/hKrHkHh0px7Ei+YCb3bRjRCkvFhb/1cV0QDvsKbeWN05+wK3gIQLYlg+uU86UhOlD5iuQ0PvK5rVOWtgBYWlOJYw3BvMScpnIM843mx0ngY1z7hlt6mbyEluAMi7AQboLUnAS89sQ/nMLXTVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720470091; c=relaxed/simple;
	bh=gDUm8uxFQBo8Bpfv8WcbwoGhGWnY82eqVzHNTS5pxB8=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=R6qxaOoJSCaXc4qrtbI1Thcop6XkGm8IUoVjFmvDfPRS+es5D+dX3MSruCGW/BnmhxQ1paeV6Wch7yaVtxkAjRPSrT/oQeR98xsGdFbx4y24r2UtfzzIG4FUHNvA8j9YMoMrpW2eFdpHuPQ7dbHBOxWEaU71XuLEG4ytysVQ7Wk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ovWI3R9D; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ovWI3R9D"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09820C116B1;
	Mon,  8 Jul 2024 20:21:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1720470091;
	bh=gDUm8uxFQBo8Bpfv8WcbwoGhGWnY82eqVzHNTS5pxB8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ovWI3R9DHjMdJ1llyiOvbRs/1sGMJiQcdwfvxVYqicl9XQetDd5GqaJxlOPItZWvC
	 hnvOwwIlXbYJHHHIDzYMNSx9+lYIc3GYQwX/o3qyJR7Hi0CmKstFJtLE0hLUL6YrNE
	 9zRWYpeteUqVLYutdGKPJERKvBtvvHGGszsSr6D2BI+B4tBtudpLYwxNpVUsnA1dT/
	 V8XfClkQBMfzwOsfKK5u2FcmnFF5edKiDjd9u70CFxfIctNS5OIXhP0iv9shK1vMNx
	 x/trFV94z+wv6UrV/Q5jUwFkNZrSwiFu0XB8xWFFArH8oeeAP3EQl6KcJYqLtsnjOy
	 YgsYUramJJKog==
Message-ID: <d05699b765c72b8ca2697ccd7c7d7612.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <28fef3e83062d5d71e7b4be4b47583f851a15bf8.1719485847.git.lorenzo@kernel.org>
References: <cover.1719485847.git.lorenzo@kernel.org> <28fef3e83062d5d71e7b4be4b47583f851a15bf8.1719485847.git.lorenzo@kernel.org>
Subject: Re: [PATCH v4 1/4] dt-bindings: clock: airoha: Add reset support to EN7581 clock binding
From: Stephen Boyd <sboyd@kernel.org>
Cc: p.zabel@pengutronix.de, mturquette@baylibre.com, lorenzo.bianconi83@gmail.com, conor@kernel.org, linux-arm-kernel@lists.infradead.org, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, devicetree@vger.kernel.org, nbd@nbd.name, john@phrozen.org, dd@embedd.com, catalin.marinas@arm.com, will@kernel.org, upstream@airoha.com, angelogioacchino.delregno@collabora.com
To: Lorenzo Bianconi <lorenzo@kernel.org>, linux-clk@vger.kernel.org
Date: Mon, 08 Jul 2024 13:21:28 -0700
User-Agent: alot/0.10

Quoting Lorenzo Bianconi (2024-06-27 04:04:22)
> Introduce reset capability to EN7581 device-tree clock binding
> documentation. Add reset register mapping between misc scu and pb scu
> ones in order to follow the memory order. This change is not
> introducing any backward compatibility issue since the EN7581 dts is not
> upstream yet.
>=20
> Fixes: 0a382be005cf ("dt-bindings: clock: airoha: add EN7581 binding")
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
> ---

Applied to clk-next
