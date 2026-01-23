Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4B243597B;
	Fri, 23 Jan 2026 02:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769133700; cv=none; b=guBewEcPu9BpBdB+PoGZUokRScfEcLP1tINfdgA8FrjFsFbPyCrVn37w7qCWPbGvnrC34tXkNpAVNTDFfvCkNq8AdxW705v2suwj34FyWpqD5xjGnn8dfzICpQLU7zDzd6yvVxq8VPPkYUhK57T6js37E2prnDyEck71x9KNnRw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769133700; c=relaxed/simple;
	bh=/E5DTWZnXCDE1FYVYSAQqh9Gufd08N7XVOdTpYlrDBU=;
	h=Content-Type:MIME-Version:In-Reply-To:References:Subject:From:To:
	 Date:Message-ID; b=ANyy3nfinprZ7wln/eRDiM6HqBJWNpALsnVN98jolRi5sG71KezVZbrXl5Rm9DUTEMcqBhxHLKHIYuWSyScUe/SYkIWi5m67phHSW3Cwn7a7LLGYcQsAl16mgt6T7qTvZ2QAMG767hyVRiu0g9kIS6CRpSZN1siiSsGAM7wrPwQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IXOAGy93; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IXOAGy93"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3018BC116C6;
	Fri, 23 Jan 2026 02:01:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769133700;
	bh=/E5DTWZnXCDE1FYVYSAQqh9Gufd08N7XVOdTpYlrDBU=;
	h=In-Reply-To:References:Subject:From:To:Date:From;
	b=IXOAGy93vv6P22QjQ0xjzZdXUQ5TnrWjog99E5c9+czcW5DI0m4TUpGuzUnCUYo0M
	 iKBuDdzamaNM2xxghwxJJsDXIdRrCgUbBr31i9rhZfUdWhr28jkGxTYs/9nULTthsO
	 BKU0C8OI41LRlD52rBmrpLB6o89AXkpPRpJpUmthaNndXCz4dyGubCZ1hyeoz38FFK
	 bSmM+MH8p0ZFttUGz7Qk7M1gPKrV70hn79Ix9OocWK0X4UBvF6MNXFcaJORuOb7q2O
	 jfCUM+0A/dD3vBAs8PdpymyBCY/YfTvZ3CFxdw8/JXpb7sPVGQfeyQDdhT0iVK8nAs
	 uzjRi0Lg3W6kA==
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260123013358.3801467-1-ping.gao@samsung.com>
References: <CGME20260123012937epcas5p4c317addca001b564606324ea1a88e393@epcas5p4.samsung.com> <20260123013358.3801467-1-ping.gao@samsung.com>
Subject: Re: [PATCH] drivers: clk:Fix parameter judgment in clk_prepare
From: Stephen Boyd <sboyd@kernel.org>
To: hy50.seo@samsung.com, kwangwon.min@samsung.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, mturquette@baylibre.com, ping.gao@samsung.com
Date: Thu, 22 Jan 2026 19:01:38 -0700
Message-ID: <176913369842.4027.14623449585157677216@lazor>
User-Agent: alot/0.11

Quoting ping.gao (2026-01-22 18:33:58)
> The clk may return NULL or an ERR_PTR. Don't
> treat an ERR_PTR as valid.
>=20
> for example: biu_clk in dwmmc driver request fail, but it's ERR_PTR,
> not null,it will panic when call clk_prepare

[...]

>=20
> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
> index 85d2f2481acf..6d62f69323b5 100644
> --- a/drivers/clk/clk.c
> +++ b/drivers/clk/clk.c
> @@ -1171,7 +1171,7 @@ static int clk_core_prepare_lock(struct clk_core *c=
ore)
>   */
>  int clk_prepare(struct clk *clk)
>  {
> -       if (!clk)
> +       if (IS_ERR_OR_NULL(clk))

Don't pass an error pointer to this function. You should have checked
that when getting the clk with something like clk_get().
