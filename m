Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88E99304BCA;
	Wed, 26 Nov 2025 14:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764168729; cv=none; b=AGHwpVAy50BgtU/R7FBvoLp3VOSyoxDCcHOzJnAb7qliPhrXDn9DcDsdSak3wlznZ5B73MIMCrd9YLrRbOhS225nw9k2tXX0nceWlxJqb7sJ2F2bwH43kDJ7tLa9dkbUgqBkTJsaRKIKJ1yZ1PSWQsl8jc2reSCYF7d25EELUEg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764168729; c=relaxed/simple;
	bh=/74vt1wLn3+rm0dgzz3/LNuVx0j7rjTd7baJ/SYk8AM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iPlrn535GHboOkme2a28yM88Qje6daDjrwiXRdjvi+Co985olay0hsy1aIjaEZ/Wfda8y8CeCQlWoKbW6IOZtWB0mZu7tY1d3saHkLzXmuKmflibZH+qcP6+9SnCxFjkNu0gGG++/QgrB7HFz07pqaI2TzHtFmMj/zW2tM8RnzA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nyw+WcUQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nyw+WcUQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EAA5EC4CEF8;
	Wed, 26 Nov 2025 14:52:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764168728;
	bh=/74vt1wLn3+rm0dgzz3/LNuVx0j7rjTd7baJ/SYk8AM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Nyw+WcUQ7QSYKvf6wezEamKmiyBYM04xUfnv5bwOL0E5nqP2N0ztvewCWm52Zxp9y
	 o94JbfSlu8BLWmtJqHyFbqJiEZvNB/hcSpLKZhe6OOn6q/ZHRcKoe0ddJ9w7TbMgA+
	 1O+FKE+jx1kUpKz/PU7pLhzQ/m2WipEQsYI6S8Ey1GUu6egcjJBXlfE1L9lrF/U5XV
	 k/OKe17lvW5yLelWzsaap78f55rwQy84r9v8wHtkzUPXJoxB+a7IPENviSNUxPdd6f
	 Qidov0tRgNKAywqD57PVZiLxeHHC7tqU3imEQQV1A+sWFrhcrQX+xpjqTo7UFYAweh
	 eMB3J2zoViyRw==
Date: Wed, 26 Nov 2025 08:52:00 -0600
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
Subject: Re: [PATCH 2/7] clk: thead: th1520-ap: Poll for PLL lock and wait
 for stability
Message-ID: <aScUELnY-TC8kVzV@gen8>
References: <20251120131416.26236-1-ziyao@disroot.org>
 <20251120131416.26236-3-ziyao@disroot.org>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251120131416.26236-3-ziyao@disroot.org>

On Thu, Nov 20, 2025 at 01:14:11PM +0000, Yao Zi wrote:
> All PLLs found on TH1520 SoC take 21250ns at maximum to lock, and their
> lock status is indicated by register PLL_STS (offset 0x80 inside AP
> clock controller). We should poll the register to ensure the PLL
> actually locks after enabling it.
> 
> Furthermore, a 30us delay is added after enabling the PLL, after which
> the PLL could be considered stable as stated by vendor clock code.
> 
> Fixes: 56a48c1833aa ("clk: thead: add support for enabling/disabling PLLs")
> Signed-off-by: Yao Zi <ziyao@disroot.org>
> ---
>  drivers/clk/thead/clk-th1520-ap.c | 34 +++++++++++++++++++++++++++++--
>  1 file changed, 32 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/clk/thead/clk-th1520-ap.c b/drivers/clk/thead/clk-th1520-ap.c
[...]
> +/*
> + * All PLLs in TH1520 take 21250ns at maximum to lock, let's take its double
> + * for safety.
> + */
> +#define TH1520_PLL_LOCK_TIMEOUT_US	44
> +#define TH1520_PLL_STABLE_DELAY_US	30

I'm taking a second look at this and I think it might be best to add a
define for the polling loop delay of 5. It could be helpful when other
people read the code later.

[...]
> +	ret = regmap_read_poll_timeout_atomic(pll->common.map, TH1520_PLL_STS,
> +					      reg, reg & pll->lock_sts_mask,
> +					      5, TH1520_PLL_LOCK_TIMEOUT_US);

The loop delay is only used here but I think using a #define would make
it more readable.

Other than that:
Reviewed-by: Drew Fustini <fustini@kernel.org>

If no other changes are needed I could fix this up on apply. Let's see
what other comments there may be. It's too late for me to send a 6.19
clk pull request so this will have to target the next merge window. I
can put it into linux-next once 6.19-rc1 is released.

Thanks,
Drew
