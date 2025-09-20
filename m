Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 19550239E65;
	Sat, 20 Sep 2025 05:55:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758347727; cv=none; b=IY5OJ4cmo4OaqVRGeZJPJ1yeW8A7TDA4WkvqkvzcHNrzTwlJb4JtBg3Ybh8swTNK4qBtNVA/3f6HGY8xvM2wknU4enyw9q4coYx+MkADotkwTEq3W6EfVop/tIJFV6ORx+IXgnO7DoUOZ7MGsNTsbG+AzR5olJUR7k+V+L1DY6w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758347727; c=relaxed/simple;
	bh=DYIeAQ0TLW3TMUkna6JF37DWFsPCSFCNfuE1sZ8Bbc8=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=VzgBxiGzwUvJwLVDVxJDEYxyJcFvFjW8pSS06DfH5Xsmy6zCiJtzTVAe3l5DdF01YwFp1SLVGhgJ1TJ34Ct5WDdlUKhk2V0ueMrZcQJNjLyp2bWz7n/E9kx6e+2KvEaSC8V8Vi6a1IzCp1lVOjYPe28YH44e1qQXYAQdfH+0W64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WruQLqWW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WruQLqWW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7B319C4CEEB;
	Sat, 20 Sep 2025 05:55:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758347726;
	bh=DYIeAQ0TLW3TMUkna6JF37DWFsPCSFCNfuE1sZ8Bbc8=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=WruQLqWWzr5GNtYoVTf08cnZotogSisGJxOP9X/UZrSraSa51hro6Jf/wjjtx0jN9
	 IAX59DO64rZQ2ZDqbEE0wKjY7BtM0taxBlWRS4oRdAfrXAAX0BPkhqk8cYyuHe63qX
	 iDfS459VL3yEitYe/WXWB8xTvcOT0GxCHp4dOwuexQ9fNCNOo8E5mD7xV/QNin9aHQ
	 HqmDA96A6PEyZICA6P+S9EMGJeamJL0WSaM7VFLmfbtauDy/CR9TOe0C43D1wUWqGi
	 j1FpeQmO8OOzlFEdfzNCf9ooorqtyoG6KHxbYIEe5r8XL6+wCPortZT/HusIPXCAQ7
	 cDuas2687yA4A==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250911-k1-clk-i2s-generation-v4-2-cba204a50d48@linux.spacemit.com>
References: <20250911-k1-clk-i2s-generation-v4-0-cba204a50d48@linux.spacemit.com> <20250911-k1-clk-i2s-generation-v4-2-cba204a50d48@linux.spacemit.com>
Subject: Re: [PATCH RESEND v4 2/3] clk: spacemit: introduce pre-div for ddn clock
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-riscv@lists.infradead.org, spacemit@lists.linux.dev, linux-kernel@vger.kernel.org, Jinmei Wei <weijinmei@linux.spacemit.com>, Troy Mitchell <troy.mitchell@linux.spacemit.com>
To: Alex Elder <elder@riscstar.com>, Conor Dooley <conor+dt@kernel.org>, Haylen Chu <heylenay@4d2.org>, Inochi Amaoto <inochiama@outlook.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Michael Turquette <mturquette@baylibre.com>, Rob Herring <robh@kernel.org>, Troy Mitchell <troy.mitchell@linux.spacemit.com>, Yixun Lan <dlan@gentoo.org>
Date: Fri, 19 Sep 2025 22:55:25 -0700
Message-ID: <175834772572.4354.12866225004369548359@lazor>
User-Agent: alot/0.11

Quoting Troy Mitchell (2025-09-10 20:34:04)
> The original DDN operations applied an implicit divide-by-2, which should
> not be a default behavior.
>=20
> This patch removes that assumption, letting each clock define its
> actual behavior explicitly.
>=20
> Reviewed-by: Haylen Chu <heylenay@4d2.org>
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.spacemit.com>
> ---

Applied to clk-next
