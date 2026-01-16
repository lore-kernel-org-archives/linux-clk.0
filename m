Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F60627F195;
	Fri, 16 Jan 2026 02:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768531811; cv=none; b=HajdUPWUsAE7akAb/HLtXY8zlmd434bmfWJA45cgHzWjvWDh2jnpJp0vodC7X/HHuIsk0rYzSaSDQjzr8qAhxrPFUiTgcEnQlzdTCv/u4qp0vx3PhH4MFB3aUsoajNFd4RYZ5E5rSg5pb3KJ+W5VeWvSWCQLpv7trEUOw/ZSBis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768531811; c=relaxed/simple;
	bh=9plVu6awmElwcj43jJWhFcDPnkRrV2uQo++mo+YHKp4=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=L1ks9PLYyKWSAi3OBCvzEaHRwI5XdNvDcHeClMzYT9Jmf6uXmgbs4bfz5KmuFru4pOg76Q0pY3mvEsDP8IpSj9ZWJQGeckqCbUyTNdoiM9KNrPSJ8YdPFT5fdb6MtYgkBmXP8UAjSZJGqN4OCIJmpDKUil1j/hFhVzMdfcEVxwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=i+LSQMZy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="i+LSQMZy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9FC22C19421;
	Fri, 16 Jan 2026 02:50:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768531810;
	bh=9plVu6awmElwcj43jJWhFcDPnkRrV2uQo++mo+YHKp4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=i+LSQMZyRjO6xFTOhFH7DiQPavwQdNcWY6pQllyzHyH2QCl+ZB5nSVgrurf2wno0o
	 U8oyCyegAJmvzNeEnfzuFRYYDy2mxPSy/OUqurKq4JSjfIk5X3mvxabJfTNR6A9Fy4
	 qtZ5XkoCmpUcLR7/uFCGTaciyp9NVJNLTKnuIjUHZtEuI7qCnuXpwlL8ejDyRP23JR
	 pNAjlY/UrhM/d1iC2nQSu9EaTthsNL1GznrCsXVoHLY46wbNcZQqeNXE36u0pkUTE8
	 6CIwdgPzeN02iFyFhY6QIx8g1x+5do+QywMcfm1/6EfvcBORNMIndJHGYqNfboxeC0
	 +Cx45gsv2e9fA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251224112239.83735-4-krzysztof.kozlowski@oss.qualcomm.com>
References: <20251224112239.83735-4-krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH 1/3] clk: lmk04832: Simplify with scoped for each OF child loop
From: Stephen Boyd <sboyd@kernel.org>
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Cristian Marussi <cristian.marussi@arm.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, Linus Walleij <linusw@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Sudeep Holla <sudeep.holla@arm.com>, arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Thu, 15 Jan 2026 19:50:08 -0700
Message-ID: <176853180892.4027.3113144416442406501@lazor>
User-Agent: alot/0.11

Quoting Krzysztof Kozlowski (2025-12-24 04:22:40)
> Use scoped for-each loop when iterating over device nodes to make code a
> bit simpler.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> ---

Applied to clk-next
