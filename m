Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5C7E1F9F5B;
	Mon, 13 Jan 2025 23:55:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736812538; cv=none; b=nTaOl8V6b3pznHaV/DIvyKUqlBWgRPP/K9txq9zjVTtN7yrKaRzonRd4b1sNCveyOjTj/tNh7gXfhCHB5Fv62iqkzjaozj5LdgHaoNdHPxCf3vDZzQAsGU9jqjLL9xbboVjbe75/aKxZadmPD7MX7dMRi0jJ9TJD9JOzEg3U4A8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736812538; c=relaxed/simple;
	bh=vJ2bG1drkXXn9fntaj3EwZfrWNAknw640XGGFFJhblg=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=A/JH8aM31kMVLjEEKTnPiVmQS9sBpdE4INO9nbhy1JfMJdjcUMie66gXaDgkEzQZ2GeBPbdmLUXu6e59LOvl11E2T2Tb9CeIJApn/BleUS4ms3+JZM7g8m4LJEtmaxtLJsavoolMnI9vanAQjIfoNAkmwh3Ys7bRzmxLszR4Bnc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Y9G+aond; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Y9G+aond"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92B1AC4CED6;
	Mon, 13 Jan 2025 23:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736812538;
	bh=vJ2bG1drkXXn9fntaj3EwZfrWNAknw640XGGFFJhblg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Y9G+aondbzT4XWEJcZuLcbiTM0FGCcOPZqCU8knhLEbLZqte6O8+s0n60H7VFUaZp
	 1hCZpOSNesW2Q/YhU5Sj/YnmkMHzrw6uaYOX44Iiu7OEl/4sqcnSjc5HhQV+aCTArT
	 5TzHX5cmvvgAtNNNDUsNujDGnCwJl9isBh/Vwe4QC/PZ5ZXcV8yM2oFN7mRj3yWxk3
	 4UthNb6TVo18ehGLGlRGSu/Mqu57z+ONHtePEJVlKAkHFPZ3x7KzCxOoxKhcbUx6fv
	 8CnU6XwJJWE8P4N7LarRcGkFdlTPQpPhheJ8ZMapgWoD2psoJydOpU8NPqTghdXZGB
	 doOZaEATgbDig==
Message-ID: <422ee3f09935e7365a9cfc633df780ba.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250113231030.6735-5-ansuelsmth@gmail.com>
References: <20250113231030.6735-1-ansuelsmth@gmail.com> <20250113231030.6735-5-ansuelsmth@gmail.com>
Subject: Re: [PATCH v6 4/4] clk: en7523: Add clock for eMMC for EN7581
From: Stephen Boyd <sboyd@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, upstream@airoha.com
Date: Mon, 13 Jan 2025 15:55:35 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Christian Marangi (2025-01-13 15:10:05)
> Add clock for eMMC for EN7581. This is used to give info of the current
> eMMC source clock and to switch it from 200MHz or 150MHz.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---

Applied to clk-next
