Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 83FD33D1707;
	Mon, 27 Jul 2026 19:50:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785181805; cv=none; b=BgUaIbFoCjZCYFI8/26biHR+sgNeM6hK+oVnMspy12UYdXflgO5QV3kNg8XVtgdKn9LAsu1QeTiVdQ1hT8MoFBUBkW3U1sMK5FpOO9mmCkflHuIquwf96DC/s03cR1wYD6Dt3Ns5L9ileWdJftRImPOy+E96EP6JpRpk+YQF3Vw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785181805; c=relaxed/simple;
	bh=t7YKyhQFATemdX4PDQkr3ajzjiKgO7tVQZCzPQ7/YDA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MxUF6Q/Z9lPJb3wQKVPv3LXt+ta3v3dkjjvMGdtaRD/3jItiDLg0JAPWevj6yzLthuVlADRGYzAdn9eP13xzp0GGiyGkBcOHeCImHE3Fp/QfABQr1K/Y6/JbZfB9cseNgw+UgxM0ry1DHZxY9MdDtdphoUtB+lMnlne+ogNJl2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HnBe1dVi; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HnBe1dVi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 256F21F000E9;
	Mon, 27 Jul 2026 19:50:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785181804;
	bh=ba+XUfHk5sTBHTvrJqU/mJvlFZUAaiNKTUr3mPtMRJQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HnBe1dViytCFVEUrnW+7nwx7XMOEmJ0Vb74Bp6lZaodHqE4JGO0+z465c6w1mxU9a
	 ppATO/iHChrg9RpT3MHIFPGG2QFGoUGIRIFLSQVaEqFiJTH5lKdJW1sSPKyW/+zgpn
	 pOsdFHnx4BAfvbXqCoJWRJfAF2qd4X8sNnsSERL1ij8Nn8gdTVwV0v3BEdTC0VFgQ+
	 rgeoi9juEBRHOhpV4IsQ/xFBi37U+ZtvR/iJHX1Bs6ukEdLc1OAipRIG74Ee/JWvlJ
	 D2N+tf5jXyxkOsKJ9jBmlXj0ONPdwFpmNAQYlcaBd+g7ru+dksxrQsFW5S8rqM+26l
	 hwDzQbVT40apw==
Date: Mon, 27 Jul 2026 20:49:59 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Xixin Liu <liuxixin@kylinos.cn>
Cc: arm-scmi@vger.kernel.org, cristian.marussi@arm.com,
	Sudeep Holla <sudeep.holla@kernel.org>, mturquette@baylibre.com,
	sboyd@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/4] firmware: arm_scpi: reject DVFS OPP count above
 MAX_DVFS_OPPS
Message-ID: <20260727-practical-chachalaca-of-perfection-7bcf42@sudeepholla>
References: <cover.1785118770.git.liuxixin@kylinos.cn>
 <bfebdb68118c.1785118770.git.liuxixin@kylinos.cn>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bfebdb68118c.1785118770.git.liuxixin@kylinos.cn>

On Mon, Jul 27, 2026 at 10:19:15AM +0800, Xixin Liu wrote:
> scpi_dvfs_get_info() already rejected a zero opp_count, but still trusted
> any larger value from the SCP firmware. The shared-memory reply only holds
> MAX_DVFS_OPPS entries in buf.opps[]; a bigger count over-reads that array
> and then sizes the allocated OPP table incorrectly (garbage OPPs / OOB).
> 
> Reject zero and out-of-range counts in one check and return -EINVAL.
> 

This fails to apply, you need to rebase to the latest.

-- 
Regards,
Sudeep
