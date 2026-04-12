Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEFD81F5858;
	Sun, 12 Apr 2026 00:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775954260; cv=none; b=d6/nOR3qdMf+K/ei2KUdTJXmPqhZnBM694QHSXiQPY6G52OVns+M3eS8lYPOAx5qgyO1Y1rAegTID0zuh4WyrLkfiiCORqFfxo0r53YaXOE7OrEuXqTZLj+AenSZ1e4umEpGlUCEQOFwKSgjD2OFaEUl1FfW7N3vubss3SVVU/A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775954260; c=relaxed/simple;
	bh=qmkF48sgbIcUYtSt47jHuDqVAItNpZPxaAmk8scjpQ4=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=LNkyVSGkX9ppsCNHycREivf3WR2QoWX8v3K+HtWHiaFqleAkD4u9srEx2Hywg3PpHCUI2mK2JxwXDSTig6J5sAab2heEdUt2GWRwcefzW5gJMrEi1U7bmSmg3Q8ASMv3GB3TnP7yfpwBw3EFmDNLQS1EFcdrAO42+gRy+G4PDkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ost8lknj; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ost8lknj"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8118CC116C6;
	Sun, 12 Apr 2026 00:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775954260;
	bh=qmkF48sgbIcUYtSt47jHuDqVAItNpZPxaAmk8scjpQ4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ost8lknjqU2IEECKSlucHiveGR5XBwsK8y+UAqNIH8wd5EzHQwj/ZEhFvC25NvSqU
	 ce0XQ3W6fBHP00GpL7qFI3pzYTQY1MhP9FcokKvOSrVaDijzeaLZkP3yH/89Ln22kV
	 hhHt5V6t75k27ADiA64GVmKs/4yhRWwvAxmz1CejWo7NHPafR9YT4/BqP4mg7MoEzc
	 aIBLHsBg6brekNucFCxh+gy/wTd7fM1POSvDdpnen8ub5ztYzvsav8a+DA0a2YvM4c
	 2lNwO8HrgF0vmbSoRa2SEs1wcb9hUQ7gLHc5EvZRzObpDqCTNp3nPPGZw0rCG7jDTB
	 MiAWNQQoALi+Q==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260409002952.319668-5-marex@nabladev.com>
References: <20260409002952.319668-1-marex@nabladev.com> <20260409002952.319668-5-marex@nabladev.com>
Subject: Re: [PATCH v6 5/6] clk: fsl-sai: Extract clock setup into fsl_sai_clk_register()
From: Stephen Boyd <sboyd@kernel.org>
Cc: Marek Vasut <marex@nabladev.com>, Brian Masney <bmasney@redhat.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Michael Walle <michael@walle.cc>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Marek Vasut <marex@nabladev.com>, linux-clk@vger.kernel.org
Date: Sat, 11 Apr 2026 17:37:38 -0700
Message-ID: <177595425858.5403.18260710783169961888@lazor>
User-Agent: alot/0.12

Quoting Marek Vasut (2026-04-08 17:29:05)
> Create helper function fsl_sai_clk_register() to set up and register
> SAI clock. Rename BCLK specific struct fsl_sai_clk members with bclk_
> prefix. Use of_node_full_name(dev->of_node) and clock name to register
> uniquely named clock. This is done in preparation for the follow up
> patch, which adds MCLK support.
>=20
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---

Applied to clk-next
