Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 29ECD1D61BF;
	Mon, 13 Jan 2025 21:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736804329; cv=none; b=FS2NdvqXJcLljxwCbYezTsFMQx20HI2LoDyJlnZH3iqto9e3uDdS6CF3AA25ETJCxCeXS/xcExwQvpEu4eQv54kf9KA2hVUWW4znLcrtZVfEHuw5MlhTjV/UBXO05EOv9fSPS0pN6wQRo6/HBAcXjFing8kFYjy+JJ1uIRHHASk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736804329; c=relaxed/simple;
	bh=w6tQer2H9E5lAytTcn54eiBAQkRiDegka1BvhLsS1QA=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=Df2IA3TnhpCtGdxKsD2Bs0oJSyG9/w4cO3sS3hU8oucquBi7oRJTOz7OL95oqAS1Ipf8l25TaCWotcdh54ihbWUIH5cq7HCa9iAEFIsfzE0OWwMVNRb2v/IxstEYI33CCIVvDQeQmIZKzuwZRCUJ5dO2tGKHNexuSyq28mX9bpQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Madu2Ngz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Madu2Ngz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A49BC4CED6;
	Mon, 13 Jan 2025 21:38:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736804328;
	bh=w6tQer2H9E5lAytTcn54eiBAQkRiDegka1BvhLsS1QA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=Madu2NgzwsBgKlCfASeAakm1vHbNb+kPyeEDLv1dGbiobFq78YFAS+SPZ0ZFmfO6l
	 HM9T76Pbg39Okm3uyMkLVjoIBOD8uRnCEGXEIb99HL9eZZQpW9hgyVOI79fBNZLAZ+
	 WUt+wkMUGtvoeA7yjLOQgDRdhHMcTwRoSkeYLpr7wlPWS1p4lKt18/p8foiA9D1nIG
	 PSUSJq0Sl0zlpJkWZpP7cXsS9UXM9Er8KnwalWFv8QX3RYx/XKF+/nhz3HvEyrXijC
	 NH5nhxN109IKUBM6EbFv/rUdwFGqU6MxmYWgTkYGv2ssMHjHnqN8EsrzsKTAOqH9bW
	 ZlwHzyB0D0+Fw==
Message-ID: <e731844816fc1b6b067229189e033b7e.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250113-th1520-clk_ignore_unused-v1-1-0b08fb813438@tenstorrent.com>
References: <20250113-th1520-clk_ignore_unused-v1-0-0b08fb813438@tenstorrent.com> <20250113-th1520-clk_ignore_unused-v1-1-0b08fb813438@tenstorrent.com>
Subject: Re: [PATCH RESEND 1/2] clk: thead: Fix clk gate registration to pass flags
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, Drew Fustini <dfustini@tenstorrent.com>
To: Drew Fustini <dfustini@tenstorrent.com>, Drew Fustini <drew@pdp7.com>, Fu Wei <wefu@redhat.com>, Guo Ren <guoren@kernel.org>, Jisheng Zhang <jszhang@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Yangtao Li <frank.li@vivo.com>
Date: Mon, 13 Jan 2025 13:38:46 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Drew Fustini (2025-01-13 12:31:24)
> Modify the call to devm_clk_hw_register_gate_parent_data() to actually
> pass the clk flags from hw.init instead of just 0. This is necessary to
> allow individual clk gates to specify their own clk flags.
>=20
> Fixes: ae81b69fd2b1 ("clk: thead: Add support for T-Head TH1520 AP_SUBSYS=
 clocks")
> Signed-off-by: Drew Fustini <dfustini@tenstorrent.com>
> ---

Applied to clk-next
