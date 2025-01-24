Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77CD54C62E;
	Fri, 24 Jan 2025 19:01:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737745316; cv=none; b=os2DKgkwS/opaN/VI4vM41CDt+ogxov10wgLeFSPEJ7BL0rXz8teNZPzBPLKO2tByTuN7fF5rOrxq2f9pNyU1xZ/N765vmCouXu/LnbgCIXEQbQ+Qp+1SItDVeZoWP26O0HtCGR6j0R1Sav13IYRg8HQe5w78u06HUALFn96FDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737745316; c=relaxed/simple;
	bh=+/pwd5pQwJp6ivKpOEFMbMVmQ+ofVTr4mjflQ5h/nXI=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=sjUgyljdd7ft8uq+0kGRqQx0BKY0maKOI+qZW6U9i37PWg53QfNcUAZ0CVjjvES6769VD1r5hQWGTpGGX6rvLfencKG51mBxHuyGpLMrG8dMi/i/cj45kUa9QCW4qwuEa2IUc+MZSywEKo71SFinA8E1l9KzaklNm1i7kxOvbKo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ifns5Kg2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ifns5Kg2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7EE7C4CED2;
	Fri, 24 Jan 2025 19:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737745316;
	bh=+/pwd5pQwJp6ivKpOEFMbMVmQ+ofVTr4mjflQ5h/nXI=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ifns5Kg2xbCKjiVZopg0VT58Xyn0UK4wqefXEqgU51kLUr8+r7OQp38uTBRjdy+EX
	 K6CJ+0k9XcOpQx1C3zJoCsO12k0Bsx9VtmGFno9aTO4OBIWcReDYA4MIALeQpH6q/W
	 XEvHNL/q73+WP/uFbazs+aeiNlyqKIVnD+YtIZexF+LZrcwtqTgOyZPj5AmKQ3qmIp
	 404pO+1aRrvRWjrvsA9l4WoSudhU00XbERBRaDu7A3tcZskeGT6kBThg5Nvotd9HGj
	 9pmbqWgVovZCS9+rHFwtJI7BYCsa8GOHuumLEN2csfJJHqbpnxIXRkUapA+24XdFDX
	 qWVZ/AChq1HDQ==
Message-ID: <4b93a51bffd5ff7365d3998df92f0554.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250123200209.lqdap6jdzz4ud37f@riveter>
References: <20250123181913.597304-1-afd@ti.com> <20250123200209.lqdap6jdzz4ud37f@riveter>
Subject: Re: [PATCH] clk: keystone: syscon-clk: Do not use syscon helper to build regmap
From: Stephen Boyd <sboyd@kernel.org>
Cc: Vignesh Raghavendra <vigneshr@ti.com>, Santosh Shilimkar <ssantosh@kernel.org>, Michael Turquette <mturquette@baylibre.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, Rob Herring (Arm) <robh@kernel.org>, Lee Jones <lee@kernel.org>
To: Andrew Davis <afd@ti.com>, Nishanth Menon <nm@ti.com>
Date: Fri, 24 Jan 2025 11:01:53 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Nishanth Menon (2025-01-23 12:02:09)
> On 12:19-20250123, Andrew Davis wrote:
> > The syscon helper device_node_to_regmap() is used to fetch a regmap
> > registered to a device node. It also currently creates this regmap
> > if the node did not already have a regmap associated with it. This
> > should only be used on "syscon" nodes. This driver is not such a
> > device and instead uses device_node_to_regmap() on its own node as
> > a hacky way to create a regmap for itself.
> >=20
> > This will not work going forward and so we should create our regmap

Please reference the commit where this won't work anymore. It's hard to
know the urgency without this information.

> > the normal way by defining our regmap_config, fetching our memory
> > resource, then using the normal regmap_init_mmio() function.
> >=20
> > Signed-off-by: Andrew Davis <afd@ti.com>
>=20
> Tested-by: Nishanth Menon <nm@ti.com>
>=20
> Could we get this routed to master as fixes asap please to get a sane 6.1=
4?
>=20

Sure. Can you resend with a Fixes tag?

> This is part of the fixes TI K3 platforms boot issues reported in
> https://lore.kernel.org/all/b2413460-ec8b-4c77-99b8-4c32b262439a@ti.com/
>=20
> on the latest linus master v6.13-5001-gd0d106a2bd21 + linux
> next-20250123
>=20
> Total set of patches tested with:
> https://lore.kernel.org/all/20250119182121.3956546-1-vaishnav.a@ti.com/
> https://lore.kernel.org/r/20250123181726.597144-1-afd@ti.com
> https://lore.kernel.org/r/20250123181913.597304-1-afd@ti.com
> https://lore.kernel.org/r/20250123182059.597491-1-afd@ti.com
> https://lore.kernel.org/r/20250123182234.597665-1-afd@ti.com
>
