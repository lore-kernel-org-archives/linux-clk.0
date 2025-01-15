Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D9D61DDA31;
	Wed, 15 Jan 2025 23:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736983383; cv=none; b=qtWGIS6ZppyZKB68oaPzXIMo9vM+tVGJ2n/GJkCcSxcGYIQjmpEXiremw1ks68YHKLmqaccZD8Fa/HiGAXrLc0j2AsRtuL0qPrLBISMYekV7tChzZXnxVZCoyFFHBciwN6orjH77isW0JAUzuQ4SMaK1S0cQlQKtC7f/dyYVV+g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736983383; c=relaxed/simple;
	bh=ntnUUEYRWUl/PgEoKPF65jVBJ8fvSk7zrQV2c99N08g=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=CEqT4PUvNSjuAkvKV/aJeC3t+29IJ5L3eMt53GZ0tsbzkXhgTTw98boYZbj2xwVH1L7FPdo8AhVsaa3vOWJY5LOI8vuDeVSg+V+8QJbjG66NI4MauV8oveZJtm/CePrk7/sYZza7EWDMVsv5RbV4NAluIRg+S75UyNsRmb0oGQk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UMSKqnyN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UMSKqnyN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C834CC4CED1;
	Wed, 15 Jan 2025 23:23:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736983382;
	bh=ntnUUEYRWUl/PgEoKPF65jVBJ8fvSk7zrQV2c99N08g=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=UMSKqnyNzlFOwc5UoulfKPqHVtNn8tslfQmIsKWtb66RLPyor/5n4vWyQTByOT7XQ
	 i1zai1MPiyStb5PwNcEwlcNMtdMF6w8CyD5o3jLoge99Ob4D+ANQUsZuQyQNJ5V+g4
	 hKX8Jy2GrJ1Ck6688jVfiFLNFObbFag9SkSs92coTc2tZVaNbRJExaPLVBWK8+iiC4
	 J4KU2ihW69+Iokn+CC4GrAlDI7YBZWaFKQSYIKXpsm2ORYVzeuHVsSF2xQEZgCB2iE
	 uITdxPoWedmFeX0XnqyUIB27nd3q6Fa6ZdMHMqljhn+yu3c0dcZXaCF4vauGtHS2+v
	 gPUx2nkKe2dnA==
Message-ID: <54dc2e52123267e1885be09fbb91d39a.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250114182021.670435-4-dario.binacchi@amarulasolutions.com>
References: <20250114182021.670435-1-dario.binacchi@amarulasolutions.com> <20250114182021.670435-4-dario.binacchi@amarulasolutions.com>
Subject: Re: [PATCH v4 3/4] clk: stm32f4: use FIELD helpers to access the PLLCFGR fields
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-amarula@amarulasolutions.com, Dario Binacchi <dario.binacchi@amarulasolutions.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, Michael Turquette <mturquette@baylibre.com>, linux-arm-kernel@lists.infradead.org, linux-clk@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>, linux-kernel@vger.kernel.org
Date: Wed, 15 Jan 2025 15:23:00 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Dario Binacchi (2025-01-14 10:19:48)
> Use GENMASK() along with FIELD_GET() and FIELD_PREP() helpers to access
> the PLLCFGR fields instead of manually masking and shifting.
>=20
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---

Applied to clk-next
