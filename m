Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0415E21255A
	for <linux-clk@vger.kernel.org>; Tue, 24 Mar 2026 00:17:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774311454; cv=none; b=X5ca7HLY6Kp/c10QIc4Xz0/r4igBsDnjmZhFREYzheAX5QSUDRZIantczbfdrRnrEAulmU7N2tUFUdpJsAG83p+MTGYYjQn/eYLvPD1TV0AC2FPrGN5cWAtWaJEBu0/+1hnfLriOALxljfTjWcVQoG+DWWfD0sTAfWdp0ekaz0g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774311454; c=relaxed/simple;
	bh=VhVQB7c8G+UK8CTRphdG768deVynhbMmReZLxs81FRE=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=VySm5Wa9AwGTrZv627t1nDOYimtUydGAbq6cYLuMNX2mfgj/TJ6DCvbICvczPPOh20hOvKWnNN7dyhF6B+PTzAhCRDg47wviIfxvTohLG7G789f+kUGKVqmuUuCLunrroFxN7GIow6JTHlwcHg6/wjj2oBKQFstgoaiLWUtcUYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GbqupRz1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GbqupRz1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ADFD9C2BC9E;
	Tue, 24 Mar 2026 00:17:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774311453;
	bh=VhVQB7c8G+UK8CTRphdG768deVynhbMmReZLxs81FRE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=GbqupRz1lMXaRDl8yBT4oV6RTL82bksM1y0VVudER5K5CKlzM/kFhQx5E5B5qs/N5
	 NIERh4tAOsju0SI5byf2pOXqL62kF822F5Qtbg3w2wyb+bpev4y4npHlb28lKcRwIU
	 akbe6j0WuWCqLf65QQ8zXCrhbwkaUt29L17MUV7YYMPtiLI3N8nIz1RbongpwAT/pe
	 MGRG+f0MJe/tu1nztnG9/cV4wPRHQxHEQjNJ5EaiTeyvtyPPIq9H5palQxlPy6im7C
	 mj2DiYY8zuA5XTEM+CeYqPKpcZTS516yOAEbR4Ii7ht2T3QR69RPmBYyuhCEJCr8aT
	 gdS8l/ZqPJvTA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260310123625.163846-1-ben.dooks@codethink.co.uk>
References: <20260310123625.163846-1-ben.dooks@codethink.co.uk>
Subject: Re: [PATCH] clk: mvebu: armada-37xx-periph: fix __iomem casts in structure init
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, Ben Dooks <ben.dooks@codethink.co.uk>
To: Ben Dooks <ben.dooks@codethink.co.uk>, andrew@lunn.c, gregory.clement@bootlin.co, linux-clk@vger.kernel.org, mturquette@baylibre.com, sebastian.hesselbarth@gmail.com
Date: Mon, 23 Mar 2026 17:17:24 -0700
Message-ID: <177431144473.5403.9307921610502647121@lazor>
User-Agent: alot/0.12

Quoting Ben Dooks (2026-03-10 05:36:25)
> There are a number of casts to "void __iomem *" in the initialsation
> of the driver's clk information. Fix this by adding a helper macro
> for the cast.
>=20
> Silences a number of sparse warnings:
>=20
> drivers/clk/mvebu/armada-37xx-periph.c:254:1: warning: incorrect type in =
initializer (different address spaces)
> drivers/clk/mvebu/armada-37xx-periph.c:254:1:    expected void [noderef] =
__iomem *reg
> drivers/clk/mvebu/armada-37xx-periph.c:254:1:    got void *
> drivers/clk/mvebu/armada-37xx-periph.c:254:1: warning: incorrect type in =
initializer (different address spaces)
> drivers/clk/mvebu/armada-37xx-periph.c:254:1:    expected void [noderef] =
__iomem *reg1
> drivers/clk/mvebu/armada-37xx-periph.c:254:1:    got void *
> drivers/clk/mvebu/armada-37xx-periph.c:254:1: warning: incorrect type in =
initializer (different address spaces)
> drivers/clk/mvebu/armada-37xx-periph.c:254:1:    expected void [noderef] =
__iomem *reg2
> drivers/clk/mvebu/armada-37xx-periph.c:254:1:    got void *
> drivers/clk/mvebu/armada-37xx-periph.c:255:1: warning: incorrect type in =
initializer (different address spaces)
> drivers/clk/mvebu/armada-37xx-periph.c:255:1:    expected void [noderef] =
__iomem *reg
> drivers/clk/mvebu/armada-37xx-periph.c:255:1:    got void *
> ...
>=20
> Signed-off-by: Ben Dooks <ben.dooks@codethink.co.uk>
> ---

Applied to clk-next
