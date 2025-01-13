Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 881401F866F;
	Mon, 13 Jan 2025 23:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736812509; cv=none; b=V78CIv78RGGbb8ybKW9CMJtmvlGYcovr7lX8Wh8KMXBv72MSLD69UE+NuYYp90Bqu53Y5yEfE+jCwX6nSGRp5veQf1SEVuoqjLBaWFBcAe7YrwqL6hbzhQLBdX763KMFBT/t6cJ0MOEcVj3NCpelEoEBgrKnI8HXOOte/rS0wxs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736812509; c=relaxed/simple;
	bh=EdY3d5KSHaBptXLiE5C/1Xeomq30zXXQW5XyHtAt+iE=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=mJTZeaBH+jW0WHUt1X0Zni+4rKGMogVTTY5mbFVN7TknYHxgguQerb++UYKFOeaEh7O/y2LjeOFyk5QUV6i8s8l+lKwZ0J8WY4Ax/6lGO8VaXYgfeQtMMuQ0HaSwcK1s3zIKAw1KNLGPClh1MfDLH32+1zKAcnKF2vrQ/riLBYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WCyZWvnk; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WCyZWvnk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1603C4CED6;
	Mon, 13 Jan 2025 23:55:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736812509;
	bh=EdY3d5KSHaBptXLiE5C/1Xeomq30zXXQW5XyHtAt+iE=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=WCyZWvnka/W7ijbN3rEioUCi/KDHONafNmOnYYuGUGzt1mIgdQE8U+3UQLQj2itff
	 Vy4R0tBMOX3C/nRu2kU51GUUVUvgmUkP9OUqHeyNGUMbV42J6mMEBIVzQj/C8hcRvr
	 L3yLymrteTU+t8j25/CkqgyOfQNK6T9S8vvnqa4FsHBhfZF647SWzfvsWASQxzBsIO
	 Q9ANQl2PgnPQRWkY4WrjxzX276wZcdR6vILxcz2AN9wIOQxy1vW6uwHi0mM1RX+5Tu
	 /JuhyQE8HWpwOyT0jYJ3NYObVl4QIujCUn9t5jDlXtr1YuTk7QDMEe4GseR1sNa+XP
	 28dsp8PA65Rag==
Message-ID: <a3055670c72f9f4e22a1165f132c08ad.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250113231030.6735-3-ansuelsmth@gmail.com>
References: <20250113231030.6735-1-ansuelsmth@gmail.com> <20250113231030.6735-3-ansuelsmth@gmail.com>
Subject: Re: [PATCH v6 2/4] dt-bindings: clock: drop NUM_CLOCKS define for EN7581
From: Stephen Boyd <sboyd@kernel.org>
Cc: Christian Marangi <ansuelsmth@gmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To: Christian Marangi <ansuelsmth@gmail.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, upstream@airoha.com
Date: Mon, 13 Jan 2025 15:55:05 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Christian Marangi (2025-01-13 15:10:03)
> Drop NUM_CLOCKS define for EN7581 include. This is not a binding and
> should not be placed here. Value is derived internally in the user
> driver.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---

Applied to clk-next
