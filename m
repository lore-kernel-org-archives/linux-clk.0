Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0CCF01E834E;
	Sun, 12 Apr 2026 00:37:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775954228; cv=none; b=mATPLtFUDCZQwOTtc8pb4POU3DoLnpEXeg0/9/E6IN25ZzI5WQCPm6mhZ+3iNkOsIPXG7v0f6rXeKkMpDEm+NrYtxWAsesotqqkUBJdA7yvo/NfQTvTCe/Mt21zoi/XVyocqiehxBhzgSrMb+loZvie3hyzCbWH5S16ZVq53Ck0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775954228; c=relaxed/simple;
	bh=dvzBqzI3yC8ixbllsTUs8ohe9YV3Md9q1xJFgsT0Lz8=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=MDw2ywuqa3f+xZGtm5R8EwU3v0depU9owNh3C7bDBLftyaJCvM9J8JsbdGfIg0NNTsvoYn7aBouMxOUOaAqcA1nJg+NNyVCSOzJVES2KZVKSGGGNfOzmrL2As33vDC64FBYTP2Wraiplg6Cphq3SGDI8q5g0/Mw0s/risTtPFqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=oz2HYAFP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="oz2HYAFP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF5A1C116C6;
	Sun, 12 Apr 2026 00:37:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775954227;
	bh=dvzBqzI3yC8ixbllsTUs8ohe9YV3Md9q1xJFgsT0Lz8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=oz2HYAFPMRngYKP3o4Y8KekuH0kX0S48VNnjV1az0SDgQgBaz9MguVHhvc9VUVCdx
	 EZ1J3ywvp2xmUX9YGyDpbUpM6l55sDWFzSgHhBmHVdYpxTTecNqhzy5FpTw8GV5eqF
	 Ob/jxr9mMNfCLAGBpJiDB7Hxr3/6EzPzSd3v1Sp7WU19iwPZzFWih3nnGGOsZfGqAS
	 pPLGRLlakUyW4ajPjJW2R4sBdak5TwVe1HwZ1g2UVez4c36ytUPYZUeeRQWpnPmO1B
	 sQxXlD+KaJ21ThJyazvht0Rmp/e3fxCszz/ADqGQYwkLgwI9pZnrRJ/tMa9V0QoSk3
	 v3IoHx/lE3rKw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260409002952.319668-2-marex@nabladev.com>
References: <20260409002952.319668-1-marex@nabladev.com> <20260409002952.319668-2-marex@nabladev.com>
Subject: Re: [PATCH v6 2/6] clk: fsl-sai: Sort the headers
From: Stephen Boyd <sboyd@kernel.org>
Cc: Marek Vasut <marex@nabladev.com>, Brian Masney <bmasney@redhat.com>, Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Michael Walle <michael@walle.cc>, Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
To: Marek Vasut <marex@nabladev.com>, linux-clk@vger.kernel.org
Date: Sat, 11 Apr 2026 17:37:05 -0700
Message-ID: <177595422591.5403.9495044878522581843@lazor>
User-Agent: alot/0.12

Quoting Marek Vasut (2026-04-08 17:29:02)
> Sort the headers. No functional change.
>=20
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Marek Vasut <marex@nabladev.com>
> ---

Applied to clk-next
