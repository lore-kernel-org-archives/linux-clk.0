Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17CDF9460;
	Wed,  4 Feb 2026 05:37:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770183448; cv=none; b=TwLsaaqexBJ9Qkl4LpbU8Kvq9UBbkY/os88zmhrpDCU/N+XborhJC1j3kV2/5fv8on7HyLAImXd+SPa9YaFMwZYR3X3MRQodgVwMbOPLWJiChunUD3t8KePZHaAyusDKfqJujca9wfdRId4Z6EjtQcVyzZhAu6i9id0zDKaoCGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770183448; c=relaxed/simple;
	bh=EFcwzhh7o8K49qee07mTb1ZNamBqMLC0xMDOttqkxoc=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:To:
	 Date:Message-ID; b=PQ3cMUELU5n8omRPp81prC11sHwy4wgld8Kco2DQEqW9ICiJjzif3+1cK+7rwGGs6YEIrHHUHpIJEI7jxBSAH/vrHl8p9awkOL2uvI/FSwIjdBpj7CpUpHtHRBJLPf0SaHoM96JIKfI+oI6dSb3tZCBEte2wXIea2ZaODSyS4HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=rFuEwu/9; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="rFuEwu/9"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9BE6C116C6;
	Wed,  4 Feb 2026 05:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770183447;
	bh=EFcwzhh7o8K49qee07mTb1ZNamBqMLC0xMDOttqkxoc=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=rFuEwu/9kDzzBtD8Ll5QgwLXf5hxKzaNTh8vznwgOmu4RJbvV+oetgIpPD9YV644J
	 BcfpsIVJiZNVsaandhKHKQxL9QatAxDOJKgU8KN1CWB6HaRhxEREez4xr2M7iDZ7bU
	 cJqfKh+ilD1aoICMlqm+tMvXuSDDadPP6BuBvjgCNJii2HW2QeLznHyWPUwmkZ+hTH
	 Ni4yYewr604F2Jwlgv18Al3GlF4zQ+Jz7H4aJtzF687zbmxaX5QxXVQVsJtrXZ9wZT
	 jI6V9LLr6NS4EG/u4jiPZv6uOeer07fyZPoUphi9dxZZKHBfdIdWmdl783vRJbPCch
	 jFwP8a9JdOQ+A==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20251003015845.2715538-2-jammy_huang@aspeedtech.com>
References: <20251003015845.2715538-1-jammy_huang@aspeedtech.com> <20251003015845.2715538-2-jammy_huang@aspeedtech.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: clock: aspeed: Add VIDEO reset definition
From: Stephen Boyd <sboyd@kernel.org>
To: Jammy Huang <jammy_huang@aspeedtech.com>, andrew@codeconstruct.com.au, conor+dt@kernel.org, devicetree@vger.kernel.org, joel@jms.id.au, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, mturquette@baylibre.com, robh@kernel.org
Date: Tue, 03 Feb 2026 21:37:26 -0800
Message-ID: <177018344610.4027.10487603254575363313@lazor>
User-Agent: alot/0.11

Quoting Jammy Huang (2025-10-02 18:58:44)
> ASPEED clock controller provides a couple of resets. Add the define of
> video to allow referring to it.
>=20
> Signed-off-by: Jammy Huang <jammy_huang@aspeedtech.com>
> ---

Applied to clk-next
