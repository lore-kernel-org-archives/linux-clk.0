Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F37A2EDD78;
	Fri, 16 Jan 2026 02:50:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768531806; cv=none; b=d+uGKyYe4Jz2h3BEC+KalqcWnoem6YjroL0Tnblrr2DGeVw2nRthh+LJ4CF1ojqkqdmEq6ZVYIRiTfeMV07TzB+OO+wRQXtRa/S8LWhvGhWNYaTBz+ooU3idHwagSEmUCkAp7S7ckcqGM7/ywoqF3ZRLQ6bvAD46apw/Dj3RmCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768531806; c=relaxed/simple;
	bh=C6nAh9WEhv1qlLYlwYCxGfWKAW8xbg4sxdf3jcwaJzM=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=tDeKiTUV2b79ht5mcI064MKt0CpNXyHl/MRJihwkUHzfPjNttGo8uC3w25yx7tI8DpCSQIjHRbZav1TZE5tBoHycTR5ar8+f2XUUTDpmMp6AjfPN/hK4XlymZF8OZVfc+ZzP+Q6itNt46RWxyHz/FjYROPyMkNN9B+o1uC3gUD0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sW2ZESQ/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sW2ZESQ/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC6E0C19421;
	Fri, 16 Jan 2026 02:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768531805;
	bh=C6nAh9WEhv1qlLYlwYCxGfWKAW8xbg4sxdf3jcwaJzM=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=sW2ZESQ//gOu2/bLdQZ4ley/N1w///Apqjmm5Avw+uXTeq7ksem/4gyTBtX/W7hEi
	 qNvhMfjamV458nTNHtpHAJysXx1B0DPa/MgO/mpAvUggTchmYOk4okRIg1hG0esLsP
	 SWyQ1VpBaF4GqZMi2bxzd7Rt9SNlqCv/ZtaLeL2WjRmQ3P55983Vi3JMdToK2/Dz4j
	 Hvxg0eQ9U60P6OI+O1tTAooKuG1gKs6nUabRa3juh6Uvc4cI9BOeh1BLPy70Mt1rO3
	 hnAS9XokyYokFP1ZlFd5M/k1a3r+TMVxhMnlkTu5c5JDds7qVPGh0he2kuoZiyUFg/
	 6PSZ6YfPeXKRg==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251224112239.83735-5-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251224112239.83735-4-krzysztof.kozlowski@oss.qualcomm.com> <20251224112239.83735-5-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 2/3] clk: scpi: Simplify with scoped for each OF child loop
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Sudeep Holla <sudeep.holla@arm.com>, arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 15 Jan 2026 19:50:04 -0700
Message-ID: <176853180402.4027.9954621949957528699@lazor>
User-Agent: alot/0.11

Quoting Krzysztof Kozlowski (2025-12-24 04:22:41)
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Applied to clk-next
