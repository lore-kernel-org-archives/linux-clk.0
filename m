Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABBED2F2915;
	Mon, 24 Nov 2025 22:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764022457; cv=none; b=qm6XOXbIp4YRbmDaFcjWoi38uA3M+dhKN4PdAZHclurNhcVZR7ha5rN1L+URJ0ijFdGpcAH6MOHzFnarbepHcM7l8kJSGQd6IfAzRP7qTA3crgxbV4gG3mhlDgPY9IlGiAMi681cuFVbaKpZEJ/MflxxHc0MyRBmhfIKW98WeCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764022457; c=relaxed/simple;
	bh=X5rTnBSBrVgTkVzp28RbqSqmTe/kFqDgUr/E2r+hfVs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hbGgjddVdMZkTbU53PjItbKyUM0rSYoYDA4vecDjTz7J2WbPJ72oCwoKzm4226GErVXN7e3bX9Yk2fMP7egCoj76VR/Egeq1TK4TJwtv1IK/bCNQix190DZN6yPYv87jpcxHkHi02tzORNL3w2cCKeHwH8ZhQR4npg3ALy3Vr1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=mwAGam3o; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="mwAGam3o"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 438F8C4CEF1;
	Mon, 24 Nov 2025 22:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764022457;
	bh=X5rTnBSBrVgTkVzp28RbqSqmTe/kFqDgUr/E2r+hfVs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mwAGam3oa7VeJpzni0NHbgXIU0YCP3OlbDkDHxRhfvjCeDKMLtMUmeYfMXRqiOP67
	 MrNXONg5LMA9h00ZLewitRoBiGMLDk60hP/6nVqS+Vd1kwWzh7KFWW6UYVzKLmUysh
	 XqHQ5UWGssDCvO5efPcOYxHHQu2OTAIRYThzPZEEtOes16BFmPh7DdKlE5wBly1pM0
	 mPaC+c5MVUukAYoOzI+JaWv97qK0j5SSvsCHX/Swd9wqegDWPEkyPc01fSXi5mHemq
	 nP2FpH/0tFelPvxKL4efp5BAgwQgLE3J+VrpLZ2m5qxQrFZrGFjlo0/FRJQq3UJTOf
	 jfBJ5/MY46rGw==
Date: Mon, 24 Nov 2025 14:14:15 -0800
From: Drew Fustini <fustini@kernel.org>
To: Yao Zi <ziyao@disroot.org>
Cc: Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Icenowy Zheng <uwu@icenowy.me>,
	linux-riscv@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	Han Gao <rabenda.cn@gmail.com>, Han Gao <gaohan@iscas.ac.cn>
Subject: Re: [PATCH 5/7] clk: thead: th1520-ap: Add macro to define
 multiplexers with flags
Message-ID: <aSTYt3mlJCC0f5TG@x1>
References: <20251120131416.26236-1-ziyao@disroot.org>
 <20251120131416.26236-6-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120131416.26236-6-ziyao@disroot.org>

On Thu, Nov 20, 2025 at 01:14:14PM +0000, Yao Zi wrote:
> The new macro, TH_CCU_MUX_FLAGS, extends TH_CCU_MUX macro by adding two
> parameters to specify clock flags and multiplexer flags.
> 
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  drivers/clk/thead/clk-th1520-ap.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
> index bf8e80c39a9e..79f001a047b2 100644
> --- a/drivers/clk/thead/clk-th1520-ap.c
> +++ b/drivers/clk/thead/clk-th1520-ap.c
> @@ -101,17 +101,22 @@ struct ccu_pll {
>  		.flags	= _flags,					\
>  	}
>  
> -#define TH_CCU_MUX(_name, _parents, _shift, _width)			\
> +#define TH_CCU_MUX_FLAGS(_name, _parents, _shift, _width, _flags,	\
> +			 _mux_flags)					\
>  	{								\
>  		.mask		= GENMASK(_width - 1, 0),		\

checkpatch warns [1] about this line:

CHECK: Macro argument '_width' may be better as '(_width)' to avoid precedence issues

I noticed it in the patchwork CI results [2] but I think we can ignore
that as this patch is not actually changing that line.

Thanks,
Drew

[1] https://gist.github.com/linux-riscv-bot/a335020c99ef628bb38e0a4ea85e0c45
[2] https://patchwork.kernel.org/project/linux-riscv/patch/20251120131416.26236-6-ziyao@disroot.org/
