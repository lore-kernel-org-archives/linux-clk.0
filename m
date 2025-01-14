Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D9B1917ED;
	Tue, 14 Jan 2025 19:09:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736881798; cv=none; b=k3t4m3BrJ5jkzNRcWTJHZ/kZWBlUhB953h3NrQVE3uwygcuFB0xqG4ksTgJ1yAAUgj9zbwPaOao8WRA9hRby7n/ZnKk+lpfnP6r5XMcmTZ0BrEyj5PQG61/lIcIjBJ3Ume6U9nmbB9isVRc3V1wuiC3Jtah27JHmyn2UAK308Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736881798; c=relaxed/simple;
	bh=KFeqmuy+haRtZu79i2hiuYQL0aWwKpjO5mkfC3ZJQjY=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=niu0u2zkhZzA9t5KjDsVe2+lB3wYIcZc7eYAvJNVB6USRV0Il/qwJ8RekJ1JNzXW971OOKz4aXBA0M4e35VFkN/HI+NSTzKQYBkymyjerFN9Z02Ly/GP9ybhBnDC2Sske0V49IvjyTXGsT85honijQfeO4Y/VjQHUFTq58TaYCA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d6F9lIuX; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d6F9lIuX"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09535C4CEDD;
	Tue, 14 Jan 2025 19:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736881798;
	bh=KFeqmuy+haRtZu79i2hiuYQL0aWwKpjO5mkfC3ZJQjY=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=d6F9lIuXosrhA8nPZ/ZP+Qk27+4ZZZ18Z9P6z5ui9OWNmoe4qbxLu4tPXHpjF9Lu5
	 tpGj43CoFBxVK/gKpkUWjCHxy22Yl5PYZZAciFjKxeyGM6Nch5OPrUaqXrSaq6UiDm
	 WmqaTQtRCgYqK3zzHJp29DBAxa8zV4ZkPpa2sbpTFUA5JUPrz0ZH30kl3ID6BMPkJH
	 tcRl7/gVpRK1TLIZVQfmWeov5X9TnbWT3laKDCMZTpg4Dk7nZNVGT3hd62oNIbKNu2
	 IBya8fLJSDRw/blfJ8Sz8Nj/6RRCrBFIph2XhWpCgjcf8N3A70rNxzhFpRV2TtQlmx
	 7Pc3z+MkcabCw==
Message-ID: <9e816ff680a7e52e609bb40d10ac5bf8.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250114081300.36600-1-changhuang.liang@starfivetech.com>
References: <20250114081300.36600-1-changhuang.liang@starfivetech.com>
Subject: Re: [PATCH v2] clk: starfive: Make _clk_get become a common helper function
From: Stephen Boyd <sboyd@kernel.org>
Cc: Changhuang Liang <changhuang.liang@starfivetech.com>, linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org
To: Changhuang Liang <changhuang.liang@starfivetech.com>, Emil Renner Berthing <kernel@esmil.dk>, Hal Feng <hal.feng@starfivetech.com>, Michael Turquette <mturquette@baylibre.com>
Date: Tue, 14 Jan 2025 11:09:54 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Changhuang Liang (2025-01-14 00:13:00)
> Introduce num_reg to store the number of clocks, this helps to make
> _clk_get become a common helper function which called jh71x0_clk_get().
> With this, it helps to simplify the code and extend the code in the
> future.
>=20
> Signed-off-by: Changhuang Liang <changhuang.liang@starfivetech.com>
> ---

Applied to clk-next
