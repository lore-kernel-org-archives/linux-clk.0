Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E08C3DFC93;
	Wed, 25 Mar 2026 14:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774448537; cv=none; b=arKCygOEmdvzHdxszeLCL9RtnYONGlXu9bmXbbW7y7LtsxVw0HCYeXtoLnJj9NCGNadfOwebBGnKluI51qv33Bht5fWO/5Pmf4KZc2+JpeAIxXhO0hflaLY5vyq9KeQ+BsmLXKoZVH6J/MZXQGrRlXfvblNpCiVX9dPoPlxbHpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774448537; c=relaxed/simple;
	bh=5sKBnCBH1mXPdfsVm4pJ5QoA/brxrLj4KB1RxIgerRA=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=GcDA4r/ocyXZLATL4A9+E+I5Y34MhqbcQotZ5QLkH9sFlXLMOsrnRZaw/B6eQFP1AiL/kCVvNIa1GIuULV1auoMiNeF9DVqKL9j0/0sd+LTJO2ZDbr4CBkTuc8J1RgSb4zPJGJ1O8HzLsQJVsRAoXLfQANJhQ0KrSJSu4J4FI0g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aHopmXcy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aHopmXcy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EBFCC19423;
	Wed, 25 Mar 2026 14:22:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774448536;
	bh=5sKBnCBH1mXPdfsVm4pJ5QoA/brxrLj4KB1RxIgerRA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=aHopmXcy32rOiiBLzB1S3plll4U2pqPUigrmeWrjOfqnmH4YIYFosOWe9xrYN9jpn
	 ics43ihwtSwy5Y1PKJHHquXVH+56irWkbRj22eedl/MkSmAqqjG0Of7E3hEEfAyqIe
	 D73MsV3a3hqzJ+6/KBq6b2Ii/+9VVL9IVkgwyVU9XG37318SNoUuYIm21HyO1lhdIh
	 TNNUzlz3CuqrecLe8kQ5OoX0Bl8M3RHLuQbPsXmzIi6yGTmkjcVCWTDu8zoBDWzr3O
	 CNGUW65YQki/TmLFAinI268iGAesR3mABVCLWBeDz1c/cScDCwre91+AjWYvyjIPPU
	 0b9tivHAXGPnw==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260312162449.569359-2-cjd@cjdns.fr>
References: <20260312162449.569359-1-cjd@cjdns.fr> <20260312162449.569359-2-cjd@cjdns.fr>
Subject: Re: [PATCH 1/2] dt-bindings: clock, reset: Add econet EN751221
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-mips@vger.kernel.org, naseefkm@gmail.com, bmasney@redhat.com, mturquette@baylibre.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org, p.zabel@pengutronix.de, nbd@nbd.name, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, Caleb James DeLisle <cjd@cjdns.fr>
To: Caleb James DeLisle <cjd@cjdns.fr>, linux-clk@vger.kernel.org
Date: Wed, 25 Mar 2026 07:22:14 -0700
Message-ID: <177444853453.5403.2724933941862660072@lazor>
User-Agent: alot/0.12

Quoting Caleb James DeLisle (2026-03-12 09:24:48)
> Add clock and reset bindings for EN751221 as well as a "chip-scu" which is
> an additional regmap that is used by the clock driver as well as others.
> This split of the SCU across two register areas is the same as the Airoha
> AN758x family.
>=20
> Signed-off-by: Caleb James DeLisle <cjd@cjdns.fr>
> ---

Applied to clk-next
