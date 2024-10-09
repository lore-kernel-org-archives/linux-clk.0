Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FC621917C0;
	Wed,  9 Oct 2024 23:13:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728515599; cv=none; b=F/xLTyBYG5vtX3Is4avmJK5x835yR7I9TamWsy9pL8jhq5x8WhT4bF8C8+4g5HxBjCbg0wEcoYu/JEUPaP6c5RC4iSTT4oEMyMlzb6vMW4tQAUcx/rbu8uDUIzRfI3b1pJhc7nYDrlcXBflSKfRcuxFfGgH4RNplzTK10GncydM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728515599; c=relaxed/simple;
	bh=DM8RvAw1BvSKsI0QPGU4A3VwxMWTZnvvcgKz4arHqrk=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=C3JUV2koSd4xHVfv9KEINbraPupI5Lt5GCxhJuoJSgb7pb/3oIp1AGrnPrHoN6BNOKlsLfKeEAMOemPtqZTAkfYVMgNUB077sBW/7DQ1xFWQYO9CrOPAlyR8G4ZdCl/89H/Bn2BtP7ZO3C4ZEfn5XbDOD0PpdoyRM7ypfNPPisI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GOs9uj8Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GOs9uj8Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F2261C4CEC3;
	Wed,  9 Oct 2024 23:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1728515599;
	bh=DM8RvAw1BvSKsI0QPGU4A3VwxMWTZnvvcgKz4arHqrk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=GOs9uj8Z0Ye2P7h9gQq9Kag6EnGLzEx1LpwwHlpjqNobdGN2jhEEpCZe3bih+fkgH
	 4xHE6ltc6o1/5lKeX6or5qVpc66I2rnlAFwHuYQRaAxY94Ep6AAE3Oj6CrN4Pq7IWj
	 MVbnJNpS+9H50YLhxOmC8GmkNpaWkO9w8gHIX587hfpsxQ0Dz4/edjsk6eKyZPWoKZ
	 i22xOEV37WCHs9J5JoF+gtboH2dCw4KldiudcT/YHjOqGzl8R5VsrB7CB000nJ8vqe
	 LwRv85jD/TYf0FVvtvG4ugH8Nug14rjwcYb9T1gsEvFCrevfyx7iJKcjATohhv7mC1
	 s2q9SJFlXp1dQ==
Message-ID: <461d3f6d9957426f612a3ad6abbe8b76.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241001-clk-cdce925-regmap_bus-const-v1-1-49fc11555b04@gmail.com>
References: <20241001-clk-cdce925-regmap_bus-const-v1-1-49fc11555b04@gmail.com>
Subject: Re: [PATCH] clk: cdce925: make regmap_cdce925_bus constant
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Javier Carrasco <javier.carrasco.cruz@gmail.com>
To: Javier Carrasco <javier.carrasco.cruz@gmail.com>, Michael Turquette <mturquette@baylibre.com>
Date: Wed, 09 Oct 2024 16:13:15 -0700
User-Agent: alot/0.10

Quoting Javier Carrasco (2024-10-01 02:00:11)
> This struct is only used for the regmap initialization via
> devm_regmap_init() (which expects a pointer to a const struct
> regmap_bus, as it will not modify the struct), and it is not modified
> after its declaration.
>=20
> Move regmap_cdce925_bus to a read-only section.
>=20
> Signed-off-by: Javier Carrasco <javier.carrasco.cruz@gmail.com>
> ---

Applied to clk-next
