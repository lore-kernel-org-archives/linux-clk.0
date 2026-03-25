Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3524629E113;
	Wed, 25 Mar 2026 02:49:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774406951; cv=none; b=dPFwq1sL0LIgDCtdUG9U3wqMWWrAIktPZ5HLXt99kqVy1ziz62DbhFnwKCXJZhsU5jyJYPzh6fFOqr/em6tn8PJdNf/c/8AXmAbOnj6C4GJbqvDZKi8hp0lGi2C8bTmi6BhLehCaFz9BMmxgd2MDkn4/3YMs904ts4dTX9c14LA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774406951; c=relaxed/simple;
	bh=yPlB2dBK4RnOX5qSupC5onz3naEYsNbAu1+hESVWme0=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:Cc:
	 To:Date:Message-ID; b=ZNHaUFARsoZQyUWjEzbJRCMgWw+cjD4ksfvoCNVFR1vEtf04xfe8VFXXhNqS4NRq2j22RcpOeS5rtMdgeePZBpAbyX6rWqEbwOax4vBnZwSaqTN4+F+h3i50Sw1qQK/XIkTPg+b4PU5SzYyYPOkAGITatnaHCEA/Sx2mz6v049g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EVkY8mjI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EVkY8mjI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D58A7C2BCB2;
	Wed, 25 Mar 2026 02:49:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774406950;
	bh=yPlB2dBK4RnOX5qSupC5onz3naEYsNbAu1+hESVWme0=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=EVkY8mjIic97Gt9qwatn8YwICeylgR8ytDNd4K0grL5YkpryoWiw8pwS5ZMENk9Li
	 7CDrmIilKxiXPy2ALwot+qB8dRIjuA5g0yYnO7XhUT2hbYv1AJeREB+YCbLFKC+soZ
	 CxOSSKpmt1Efax3yVQcakf04+c1YcUfgn9CjQyD4gvisb79UEd1NOPrIv5HQ+2ZpkE
	 ZzeW5ULHOLZDmEfckeTk3DSGtmvT+4YrbgkdOl4aZjnDzEOsqgfZTiUUvLrXenVpW/
	 xFWQeJKWd0oBfIFYLf+r+TwYrPaCLR87Ap5xQf6G17Wm9tmJVHuDOvT3VcGqSeW7NR
	 r7uO1bUYxyEHA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260303080712.2210-1-dongxuyang@eswincomputing.com>
References: <20260303080513.2042-1-dongxuyang@eswincomputing.com> <20260303080712.2210-1-dongxuyang@eswincomputing.com>
Subject: Re: [PATCH v15 3/4] clk: eswin: Add eic7700 clock driver
From: Stephen Boyd <sboyd@kernel.org>
Cc: ningyu@eswincomputing.com, linmin@eswincomputing.com, huangyifeng@eswincomputing.com, pinkesh.vaghela@einfochips.com, ganboing@gmail.com, marcel@ziswiler.com, Xuyang Dong <dongxuyang@eswincomputing.com>
To: bmasney@redhat.com, conor+dt@kernel.org, devicetree@vger.kernel.org, dongxuyang@eswincomputing.com, krzk+dt@kernel.org, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, mturquette@baylibre.com, robh@kernel.org, troy.mitchell@linux.dev
Date: Tue, 24 Mar 2026 19:12:51 -0700
Message-ID: <177440477152.5403.17215194434716031574@localhost.localdomain>
User-Agent: alot/0.12

Quoting dongxuyang@eswincomputing.com (2026-03-03 00:07:12)
> From: Xuyang Dong <dongxuyang@eswincomputing.com>
>=20
> Add clock drivers for the EIC7700 SoC. The clock controller on the ESWIN
> EIC7700 provides various clocks to different IP blocks within the SoC.
>=20
> Signed-off-by: Yifeng Huang <huangyifeng@eswincomputing.com>
> Tested-by: Marcel Ziswiler <marcel@ziswiler.com> # ebc77
> Reviewed-by: Brian Masney <bmasney@redhat.com>
> Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>
> ---

Applied to clk-next
