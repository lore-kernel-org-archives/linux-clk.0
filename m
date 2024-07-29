Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 633EB288BD;
	Mon, 29 Jul 2024 23:20:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722295202; cv=none; b=rHkiBlYuKHKWCSNbBsGSST80xGlJh3Ob8LCN9IW8dgQgDfFEGqsYx/TrpERlwip2pkZC0hl+atZRE3dARhuLVecTPqUcDzR8pHxfRrRbtyqPs6MCIVmTsyV+96AotAuF5g+Zzh74kfpcXvMBISaTy5vXPfy6ikbyB68NhgD1x80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722295202; c=relaxed/simple;
	bh=uX7VwlDqNgfUpg2s2F8JxYe1gxHFDl4plbquYzcgJng=;
	h=Message-ID:Content-Type:MIME-Version:In-Reply-To:References:
	 Subject:From:Cc:To:Date; b=X0WC6ptibfeBBlhwMyE7EOAZyb2EDF+uAYSoappzfiVqbelVhKxvue15cTVTNe5TPQHi3dhXjsjUBaMklRRG8HDyUoZmi9MYPYy+LkJyYwax3BcD2LB8bVatn2t4zYAaDpWNCBBINb3PZqMfT+WGIlGaJXPzCsmqitzyBqBMmSs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=MhhBmRoC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="MhhBmRoC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC335C32786;
	Mon, 29 Jul 2024 23:20:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1722295202;
	bh=uX7VwlDqNgfUpg2s2F8JxYe1gxHFDl4plbquYzcgJng=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=MhhBmRoC++Q7b4J+bnmsrh8seHolzYY5DFI2Ak7THB8OE8y/hntHwccz2ycYGRZjW
	 uX0tPnIeX7NYAOf5TLpxZ0XKZda0XP6V9j2rKJvY5Cs55uYJOhtzlUPiN8o3BfUUVN
	 QZ5tWeZzo2RnrzyTp0aOVFpwHHPPJN8QYs8qKwrWOi+AwKEq0v0IpfxkIzfNGVsa8N
	 gTaWqTjXNXAdVTysxwhm8/FYZ11nbJCYvo4MD91o5sXDWAqgpivTCKpIFsbuxRFs5b
	 XNERy5sxYNLKlm2Pnfry/RkTFEEVn9Iih4Pwo+lMNVpfvl1a3uLQ75cSFudRn68epG
	 0Yx2O/lt2TYiw==
Message-ID: <befaae6341af835dab1349eb351b0bca.sboyd@kernel.org>
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240720152447.311442-1-david.hunter.linux@gmail.com>
References: <20240720152447.311442-1-david.hunter.linux@gmail.com>
Subject: Re: [PATCH] da8xx-cfgchip.c: replace of_node_put with __free improves cleanup
From: Stephen Boyd <sboyd@kernel.org>
Cc: David Hunter <david.hunter.linux@gmail.com>, julia.lawall@inria.fr, skhan@linuxfoundation.org, javier.carrasco.cruz@gmail.com
To: David Hunter <david.hunter.linux@gmail.com>, david@lechnology.com, linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, mturquette@baylibre.com
Date: Mon, 29 Jul 2024 16:19:59 -0700
User-Agent: alot/0.10

Quoting David Hunter (2024-07-20 08:24:47)
> The use of the __free function allows the cleanup to be based on scope
> instead of on another function called later. This makes the cleanup
> automatic and less susceptible to errors later.
>=20
> This code was compiled without errors or warnings.
>=20
> Signed-off-by: David Hunter <david.hunter.linux@gmail.com>
> ---

Applied to clk-next
