Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1841F27004B
	for <linux-clk@vger.kernel.org>; Wed, 26 Feb 2025 23:52:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740613967; cv=none; b=uMLSXTcseRvIdZrQOVkD+8P5Q6Tbs1vjGpQw4BqVySXq3Z1fri5u89pLGP7q4z34zVWNy/qfFWyVaolM/6aIRcmzkfzonsxOw/2fDfc6UYpxk+ceqX6B/Rx/7fS1iFI5PAKwxh74NuAKokowXfkL9UDVwP7X+316F7kDT5HkgFw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740613967; c=relaxed/simple;
	bh=sxZvRqIFDMcB7WjJWe7cPfYK6/yDbKkQrK+cvi14U3Q=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=QIyRdi6W7jv3/ri+TDGcY3BXbar6rawU1dhRZS8UWh7SygAxXqFG5vLXtkdiejMPLEP8NKLpQpEpRk2jT9CvBo3wPzOwVqmhKqtg4vP60B+ha/MZlZqcBe+PlMuP0xV7K3OzIyiOgmaH6O4834uItDTBHXtfRpvnsUzx37cRWRY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=u1KL5F5i; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="u1KL5F5i"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 764E8C4CED6;
	Wed, 26 Feb 2025 23:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740613966;
	bh=sxZvRqIFDMcB7WjJWe7cPfYK6/yDbKkQrK+cvi14U3Q=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=u1KL5F5iz9RXg16fUTgygyer8Hf8XaYnNgpst+h4ehFBzrbOLgMOwSad5vjzdP56G
	 N+C1r2smhfAWDslPIcy1PAhkYCGvkVSdYVdWcDKsdq4I6NB760PY8o/XePrNdJTHMQ
	 hExxUJu0PVJnRisuwRsKsTH1byQh+Gpgz94AAjvkqKlY/EKpAoUPy482QdMr4r5LQ0
	 5KEiIWCw2n+grFmGsbQoy194G8HR4U/wV5p8CtA6XoL9/goCQME1p7e2eTmcAHu93R
	 FgW3SKdYinRN44IABJZt0jSsNoJxOQFRHTeYTXaJNWxSpwoFiV8BVnZF7M9ME4NbW3
	 vpgU68kNyuWFw==
Message-ID: <76e67776d562acfc9e55500d512c4583.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250201161018.41084-1-biju.das.jz@bp.renesas.com>
References: <20250201161018.41084-1-biju.das.jz@bp.renesas.com>
Subject: Re: [PATCH] clk: davinci: Use of_get_available_child_by_name()
From: Stephen Boyd <sboyd@kernel.org>
Cc: Biju Das <biju.das.jz@bp.renesas.com>, linux-clk@vger.kernel.org, Geert Uytterhoeven <geert+renesas@glider.be>, Biju Das <biju.das.au@gmail.com>
To: Biju Das <biju.das.jz@bp.renesas.com>, David Lechner <david@lechnology.com>, Michael Turquette <mturquette@baylibre.com>
Date: Wed, 26 Feb 2025 15:52:44 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Biju Das (2025-02-01 08:10:09)
> Simplify of_davinci_pll_init() by using of_get_available_child_by_name().
>=20
> While at it, move of_node_put(child) inside the if block to avoid
> additional check if of_child is NULL.
>=20
> Signed-off-by: Biju Das <biju.das.jz@bp.renesas.com>
> ---
> This patch is only compile tested and depend upon[1]
> [1] https://lore.kernel.org/all/20250201093126.7322-1-biju.das.jz@bp.rene=
sas.com/
> ---

Please resend this when the dependency is in Linus' tree.
