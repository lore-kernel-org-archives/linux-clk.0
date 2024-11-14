Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A36C1CABA;
	Thu, 14 Nov 2024 22:46:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731624360; cv=none; b=cLu+6MpP9/7lnUabBKek1pU7s8Rk/XA0sZ+0NkcYPjKMpsejOUWNPRWkfPmp8dIQCTilJuKx0D27lXCmTyR4N6RDXKcVrsdbHBYlzgsTLXsALlDXJy1A7nx7P9KeGjpmL4ikGjOjNmijurcngSeBnQaWSF1IRPK77/pUNLhizK8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731624360; c=relaxed/simple;
	bh=SXe/fcijWAWUads6BsOxxUlh3AbX88sFeq6Lx4+9bGk=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=mirMhPMSs6M2Jthuxo0J7yCP2GI5Opc779yC8clOH48erHat0nTsKW3oOvjvZmM4yiBbubg66V8W+NK5UE/xYnblxprtzL/kWMbGAuXUv6UqHm7Zkc66cIPa0O685F95Nf4FBVMicNTReBqedotNc0oRh415aFIcqNQ4GZ2RTFI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WPps6Hkx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WPps6Hkx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B568C4CECD;
	Thu, 14 Nov 2024 22:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731624360;
	bh=SXe/fcijWAWUads6BsOxxUlh3AbX88sFeq6Lx4+9bGk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=WPps6Hkx3cBYz+0sOm9PP4hRIGsOV6tgB5+nsaidE3Ksi4z0Pu5CE3uIA1LAHyOfx
	 2EpBAZC/Ohly7alLhQ4vfnPHToWrOpnxDRIkZjXRUxg/NiMoqiz6ZpaQqSMlgpWm2W
	 +KHWLo8NxUp5HCAl7bzZDw+gESysNORiScGDHPYWoUWzPcV2Mome55qE/mhxbTNmBN
	 m66NzZNAT3Z4fhsWg8dA9ZuFkdRpNatM/aXozTxdW2Tdj4Xg/wKbOUupCn4rRuwCFD
	 4AgFSMLIFN4okhEdYosRQStN8wpQEXz3nZug69fQ/P4mkldwh24WVecpfIAt178zpK
	 U+RdTyAEIFqtA==
Message-ID: <c44cd4a76bd7100587e96d5e979ed8f8.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241029-axi-clkgen-fix-axiclk-v2-2-bc5e0733ad76@analog.com>
References: <20241029-axi-clkgen-fix-axiclk-v2-0-bc5e0733ad76@analog.com> <20241029-axi-clkgen-fix-axiclk-v2-2-bc5e0733ad76@analog.com>
Subject: Re: [PATCH v2 2/2] clk: clk-axi-clkgen: make sure to enable the AXI bus clock
From: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Lars-Peter Clausen <lars@metafoo.de>
To: Nuno Sa <nuno.sa@analog.com>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Date: Thu, 14 Nov 2024 14:45:58 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Nuno Sa (2024-10-29 06:59:42)
> In order to access the registers of the HW, we need to make sure that
> the AXI bus clock is enabled. Hence let's increase the number of clocks
> by one.
>=20
> In order to keep backward compatibility and make sure old DTs still work
> we check if clock-names is available or not. If it is, then we can
> disambiguate between really having the AXI clock or a parent clock and
> so we can enable the bus clock. If not, we fallback to what was done
> before and don't explicitly enable the AXI bus clock.
>=20
> Note that if clock-names is given, the axi clock must be the last one in
> the phandle array (also enforced in the DT bindings) so that we can reuse
> as much code as possible.
>=20
> Fixes: 0e646c52cf0e ("clk: Add axi-clkgen driver")
> Signed-off-by: Nuno Sa <nuno.sa@analog.com>
> ---

Applied to clk-next
