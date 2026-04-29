Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E759D1482E8;
	Wed, 29 Apr 2026 03:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777434964; cv=none; b=XZh4/sVkczuz4uHHJ+qr1Q7rmWCPwxDl4shjDAUz1zQVmUIKCzZdrkKXHGHk8c2rwHLQ8Ika908AVO5pGKIZJwaKw8UpzbS96B0i3h9XAufeHmz9u7QSHKtty0fdah/n+iT/agCF189EHRjJUBEuYX2cFx141RPrff3UvDMVAVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777434964; c=relaxed/simple;
	bh=Jrfdd4yDdOOFCkCWFH5jlNXN6a29Na2bHTv7VSRjVKk=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=t/Kb3wt1Zl0lXr8LztRyrVo9EjwF5XYgCjhfoUM9q96ZkRZs0GszwRSBXJ+tedx9N+2zZMMSYV4pvM3rW+a5a94/iUhTlEVlIs/CDffRk5GE3X4dncm3YXFhNpqd2hVAQcJF+25QDxRrigxiEPMtALEyuFAstwTUpfa4l2EF8tg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=iwoc4hn7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="iwoc4hn7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AE115C2BCB4;
	Wed, 29 Apr 2026 03:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777434963;
	bh=Jrfdd4yDdOOFCkCWFH5jlNXN6a29Na2bHTv7VSRjVKk=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=iwoc4hn7VcbfOsobopVdc80tpyHydUsrvbM9D9tXbIO3paB5tT7CkdyPQ2mT0OPP1
	 JEJsedEUMAF5LX5uvTiiL44kcYW1Px+w7ze0Vwqq1CD2vSvqGr6+7jTMJB7Rs6DCc1
	 n4nr/rmI5IzS4uvnJfkD5rg9C7PiZZpdntcCjSSa1dChP4ckMQl4CysfPy1BfVzTvu
	 GbKjoB6yW2uEUJQ+MElJiTkRrUhNI62FtnH9cexPh0RyCgcYyMjSft7KA7XqxqTkz5
	 Fel1QG+48WV1bMpc/mohQ6vgTtehJQe4a7WnLwlR+9xUXXTakdJolNKyoyl33zt87k
	 mxVb5GNjkZ/uA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260407095027.2625516-1-johan@kernel.org>
References: <20260407095027.2625516-1-johan@kernel.org>
Subject: Re: [PATCH] clk: rk808: fix OF node reference imbalance
From: Stephen Boyd <sboyd@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>, stable@vger.kernel.org, Sebastian Reichel <sebastian.reichel@collabora.com>
To: Johan Hovold <johan@kernel.org>
Date: Tue, 28 Apr 2026 20:56:01 -0700
Message-ID: <177743496193.5403.16042641406791146582@lazor>
User-Agent: alot/0.12

Quoting Johan Hovold (2026-04-07 02:50:27)
> The driver reuses the OF node of the parent multi-function device but
> fails to take another reference to balance the one dropped by the
> platform bus code when unbinding the MFD and deregistering the child
> devices.
>=20
> Fix this by using the intended helper for reusing OF nodes.
>=20
> Fixes: 2dc51ca822e4 ("clk: RK808: Reduce 'struct rk808' usage")
> Cc: stable@vger.kernel.org      # 6.5
> Cc: Sebastian Reichel <sebastian.reichel@collabora.com>
> Signed-off-by: Johan Hovold <johan@kernel.org>
> ---

Applied to clk-fixes
