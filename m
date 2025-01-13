Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01B921F866F;
	Mon, 13 Jan 2025 23:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736812488; cv=none; b=p32T2wX9CdhVKRxx0uv88PSyOR2dS7i3gKk69vzhJcxaAoI/Gjh4r6isNhTvFm81EHEN2cMWlWCV8B9TeAzXK8upH8UHqFvTb3ZbW5A80tTFXKhGuichiO8mdk/cCigRPVzal9V+w40X+3J0q/yyHVoWQKD/74/mkYn1/O/qT6g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736812488; c=relaxed/simple;
	bh=4h1HzqwZhAw3FyJ5a9f/aK8lS+4zarOFBTILCMY5t6g=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=pn4RG2Zb/2uH5BO/11W0Ngi0cfpnsP/hwlkmkGOkv6NwYe4wHhhTLZtx9qtshIZdoDtk+GOUlRJUwDeNE2MCIZrsvbGmhZIYwlk7NAJwFBK0F9SORkQAIUjbrSbPitw/MlyuZ0GkNoeZB7IAzKd11LxLoHHqN4iW4npmXUdaUzM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=F3MMZOjH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="F3MMZOjH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 585D1C4CED6;
	Mon, 13 Jan 2025 23:54:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736812487;
	bh=4h1HzqwZhAw3FyJ5a9f/aK8lS+4zarOFBTILCMY5t6g=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=F3MMZOjHYapuYoZrt8827pmk73TD1liPNVutlbLKsMPK4Rw/biO1zHeXDu/6K8JQx
	 tOMXUmXDniF0FTrKVMTxcQFkxd+QCyRM+jqw9naonrvAos5iEdyavF/qFnTjTVmxD8
	 xhUFpkLuRSBJBcj5qnwPddOhfqTTz04O7w06K/NjzbriBxMgyGlxvNmfPY/oN6TaWr
	 NlcpT+TLUQG4fW2RQOrkeF308qa0ICgmCa58AKqlplevxbWcqgaH5JGPsaJNoWQA1v
	 YK3VPWH3KkbjoefmnFPYqazMfaajnXPT1tgCAwN2fyuEXui7j4vMrDKpGbknqgC34Z
	 mInyVvmU/F4kA==
Message-ID: <9c40b220d699799b2bfaa75c3ef05f11.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250113231030.6735-2-ansuelsmth@gmail.com>
References: <20250113231030.6735-1-ansuelsmth@gmail.com> <20250113231030.6735-2-ansuelsmth@gmail.com>
Subject: Re: [PATCH v6 1/4] clk: en7523: Rework clock handling for different clock numbers
From: Stephen Boyd <sboyd@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>
To: Christian Marangi <ansuelsmth@gmail.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, upstream@airoha.com
Date: Mon, 13 Jan 2025 15:54:43 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Christian Marangi (2025-01-13 15:10:02)
> Airoha EN7581 SoC have additional clock compared to EN7523 but current
> driver permits to only support up to EN7523 clock numbers.
>=20
> To handle this, rework the clock handling and permit to declare the
> clocks number in match_data and alloca clk_data based on the compatible
> match_data.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---

Applied to clk-next
