Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 612A42EAB64;
	Fri, 16 Jan 2026 02:50:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768531801; cv=none; b=ZgpCbY5Ys7/MgGoy3pjDSAx0iSItqRz1/h13lziFTJCTvHbLgjMvLFjtqE20+ptThgUlOPAKW0JU4Q8BvbkcBGjJjRuhheJ9DSHEBNK+7idErGDxcUTlQARVJxkGsuTtsISLusZna9ckjFYijCXyPBbswDcaQYMHDxpwTmMnttU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768531801; c=relaxed/simple;
	bh=r3Jva90IEIEzzjSj6QCrxX8cTuh1SiHfpusgkKjtJRM=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=nGTj+wTmHhPzatpVGH9T9wLy3G2Omus94SsriIxlNRac7Dg4JPRJdBZS/+y+3tkoR85/6fo5uGshtPlB+bKgCe7EF+4clknJeeELI9DgrEfFEPHfcw1WWwO9MsbonQj2rP/UVyeIaqMbULQJT6MtCUYEJd5lr7iMdhyEwFcmvSg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=O4Goxoen; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="O4Goxoen"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E3F02C116D0;
	Fri, 16 Jan 2026 02:50:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768531801;
	bh=r3Jva90IEIEzzjSj6QCrxX8cTuh1SiHfpusgkKjtJRM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=O4GoxoenZ0jdMpTJh6n7/FYxPjAWOmLfrcGOFYBneqioD8A+W4sLKprtKEQchq7K7
	 CiZVtlGIZsN8Z5DX637gogpbP/s0xnw/lnt+qR04WBwPuMiI7vfV1tNGFtIKZu4mj5
	 i99m4DTHozGgGbApSJDX4RUrwRBAzVM16T1ZZWHNpdTnp8BXa/8CYMZrDMcXEe3hdY
	 thTNxLDKSTb79DqUVKPJxyUrWfohHjYfow5RFnIAHqg3nT3/1fwxWX/ieTwXP2NFBi
	 b0aYrTafBR7hhsZulnrODUi6E1lhwdTc0kZQNq31/TbiQRvgggwKP9wf3trJMfO6nz
	 KuaoypT/zu6TA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251224112239.83735-6-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251224112239.83735-4-krzysztof.kozlowski@oss.qualcomm.com> <20251224112239.83735-6-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 3/3] clk: versatile: impd1: Simplify with scoped for each OF child loop
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Sudeep Holla <sudeep.holla@arm.com>, arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 15 Jan 2026 19:49:59 -0700
Message-ID: <176853179908.4027.13756853598348225764@lazor>
User-Agent: alot/0.11

Quoting Krzysztof Kozlowski (2025-12-24 04:22:42)
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Applied to clk-next
