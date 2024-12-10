Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFBF7211278
	for <linux-clk@vger.kernel.org>; Tue, 10 Dec 2024 22:54:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733871256; cv=none; b=pm64ClO7XOTfPG3hEUrcsKFKJcNG3ryrtlp+kDUSa+8uV1GAoyql6yIf8DzZQAMMfwQGn75OvckcAXEltK1opiVYQJ7/1ptvmtqD1jWJuHJjIE0H4STSnLujd1LSChZ+dIEMeMhjFz4ATFK5esFyLSdV/JUs0py/XdwbNxWkcbc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733871256; c=relaxed/simple;
	bh=LP6ij4oc1NpuRbJXPV6dbu6Qong7TvfSYsYH1k+NVB4=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=SgD9zFqwhtAC6nXl/aF/DKuMth2YNjTIT+1rWxnRULfU5yKWW7HohUXpr9DCEfPg2b1U5PymFEUGZSS/qaMXM3r54aug7yafoHY8QEadyssQIWQz+Py+1FHtYPziLhpIgpaD49uo3mf68y+fI/k816oDGPHWa2mKIaIwifddbJU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uRiIQjgh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uRiIQjgh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55353C4CEDF;
	Tue, 10 Dec 2024 22:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733871255;
	bh=LP6ij4oc1NpuRbJXPV6dbu6Qong7TvfSYsYH1k+NVB4=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=uRiIQjgheYBlOChLNxKIjfGjRE/cT+4Dizl2EoiTYCkJy6H2rY7p1ZXhaT+0GYNRb
	 NuUMNgUTOsHS3b0c7vucA4R3D3+apEgUO9wOZiE6zU9WC9rCYsguowO6BM/jZoyr3S
	 D+rLJqcrMwcY5PXsiBgrNdL17PUUTqLVnApAHhW9xgYR2ssmFSaotrS9OkVJuiSNfn
	 1aHFSrHC24GGU6vRwswI3yxEVAkK2Fej62QiIgAWaemJwW2i5X3P76R+p9M7dWRc5P
	 A+a+FQ9rPaltfOKteY2fbaw2sfFF3EkBcWCzZ67YCbD5flOOJ7WwZSVeC4rsWy20NN
	 UnnTdFwdpy/GA==
Message-ID: <93eead72b24cf69a871e88ba93bc13ef.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241210130913.3615205-1-joe@pf.is.s.u-tokyo.ac.jp>
References: <20241210130913.3615205-1-joe@pf.is.s.u-tokyo.ac.jp>
Subject: Re: [PATCH] clk: fix an OF node reference leak in of_clk_get_parent_name()
From: Stephen Boyd <sboyd@kernel.org>
Cc: linux-clk@vger.kernel.org, Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
To: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>, mturquette@baylibre.com
Date: Tue, 10 Dec 2024 14:54:13 -0800
User-Agent: alot/0.12.dev1+gaa8c22fdeedb

Quoting Joe Hattori (2024-12-10 05:09:12)
> Current implementation of of_clk_get_parent_name() leaks an OF node
> reference on error path. Add a of_node_put() call before returning an
> error.
>=20
> This bug was found by an experimental static analysis tool that I am
> developing.
>=20
> Fixes: 8da411cc1964 ("clk: let of_clk_get_parent_name() fail for invalid =
clock-indices")
> Signed-off-by: Joe Hattori <joe@pf.is.s.u-tokyo.ac.jp>
> ---

Applied to clk-next
