Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2704C1DF98E;
	Tue,  7 Jan 2025 21:28:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736285333; cv=none; b=TGo9xhLV+fzZRRFHDzQvhb56YxMD0o8S0OdgkPFQ2X4fUJVm2svFG+o4BX3SIPngenq8InuhxP0PQLNkM4m0/r8odC7UyRR80GyFLv4P3p2q/LA0Kmg/Nbl58TMZkZulFWWwHjgLtceIxtRp3wkJtLW8X+ekQO232oHvP1XubqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736285333; c=relaxed/simple;
	bh=9JTWtxmIKmotgWm0DEXNnjWv3paAnOY9Sh2u7jIshgg=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=gEHb57vrSMs4DSvfZ58rUoPEUNDX+mDjxEJUWL472rIuyMwOMvJT/npZdtHDyWLZRli7bbFAaS59tozrLWZh9edCSQcJBHharz0cGJXpHc5LomWhqfOaSeKRtNXEgqCe9RLv/UZA6tpOFVSfPLERXmWugN9R5SGlh0A7HFEUwSI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lNOREiXx; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lNOREiXx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 91D23C4CED6;
	Tue,  7 Jan 2025 21:28:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736285332;
	bh=9JTWtxmIKmotgWm0DEXNnjWv3paAnOY9Sh2u7jIshgg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=lNOREiXxKbHK4i+vCPPcnVixfcgh1t/e5X3+76pI1hEGUuHKnUv/Xino4G6LS7Gua
	 ViW2rEigU8+WOYTgxqI9q6qGUHKQ1voneHucW1nn3vmqFVQ2BckxffK0sbdaD+1V1M
	 1Kj19IsplJWa/LX8+HUGff6OemdkRypvZbRWC+TXY/D4mFRYcAfe/P1a4yOE4tdGFu
	 NWURHNO9Cl6OLMgdfP/sGfWDaUBR5D/t7Uh6pBP5o3bn8RleMDmfx6j5z/r7egtA52
	 KXsu6dEBSE7thmkN/ZPNvPQPvz6HeBleyV+YAagr8Qg6LvcYxTj/nKHyFyJxR59uK1
	 5hl2Fc8y5p9tw==
Message-ID: <697b634770d789ef8ff0e05cec9465f5.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1jmsg2adgu.fsf@starbuckisacylon.baylibre.com>
References: <20241220-amlogic-clk-drop-clk-regmap-tables-v1-0-96dd657cbfbd@baylibre.com> <20241220-amlogic-clk-drop-clk-regmap-tables-v1-2-96dd657cbfbd@baylibre.com> <9f1d69ebe1ddce5dfc170e986c9213f2.sboyd@kernel.org> <1ja5cp8f87.fsf@starbuckisacylon.baylibre.com> <88fe909ab182d1f17f6ef18161c7f064.sboyd@kernel.org> <1jfrlwb69r.fsf@starbuckisacylon.baylibre.com> <ed20c67e7d1a91d7fd8b921f156f56fb.sboyd@kernel.org> <1jmsg2adgu.fsf@starbuckisacylon.baylibre.com>
Subject: Re: [PATCH 2/3] clk: amlogic: drop clk_regmap tables
From: Stephen Boyd <sboyd@kernel.org>
Cc: Kevin Hilman <khilman@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Michael Turquette <mturquette@baylibre.com>, Neil Armstrong <neil.armstrong@linaro.org>, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
To: Jerome Brunet <jbrunet@baylibre.com>
Date: Tue, 07 Jan 2025 13:28:50 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Jerome Brunet (2025-01-07 06:46:41)
>=20
> So, if it's OK, I'll resend this series with a temporary solution to
> remove tables. Removing the table simplify the other clean-up I have
> already line-up and avoid some unnecessary diffs. I'll circle back to
> reworking the init_data afterward.
>=20

Ok, sure. Let's see how it goes.
