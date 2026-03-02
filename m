Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 711AE34575F;
	Mon,  2 Mar 2026 11:26:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772450785; cv=none; b=ULKgC4A6m9N7PxIoDf2iZAnr5x9/StQO8hytxG43YyAp24j0KgVFXnYsdlErg8YCVDSWreZrJ/BG9h/3WG7G9Fu7EnBwgfsd81/vhs2bNKGN4FIKFXlQw1Flc1mjTvoVF04Ia6gdXQUk0+xSOUryQVdv69ROZdb0upnevX0Qstw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772450785; c=relaxed/simple;
	bh=4pP4wEyQK85FCKi5Er3y6pE4/p9k209Wqhmi2goE0to=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hyq7p9lIo6usXMDX5iL75WWsKtt+18gnyEygxniALfKBHMyca9S0kIZIhLSkrhJVxMWuHZKL6JFjzckI4/m8UDeGtbPPDkP+nxjGnZP2Lrq/ouwgIcgYSjoIpZVRfklQt8Lycn+Z6LLFFqXgtkopPOHor0Jo9FbedOcaSblkrSQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LSq+QqNG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LSq+QqNG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71E2AC19423;
	Mon,  2 Mar 2026 11:26:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772450785;
	bh=4pP4wEyQK85FCKi5Er3y6pE4/p9k209Wqhmi2goE0to=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LSq+QqNGrGOlsXTWbrTMZadXTcUAkq2xk+WVCFWcBzP75b8gVo2PiYFdWtg8iWH4w
	 ihFyVIVQP5ZQoNgSTVqF/L1SJGoaX/lZVF9GC2f8wZ26vpqdFQuaLtM43pIEbPaZei
	 iUg7Kj4dbVXCO6ksqBpyHXVRh0gmKVRu7IRzTtq5npNPkozxeKTn1T9Hk1kgwzjr3y
	 5BkTSD8Yk6xOemXPPZFfGC71X8+qd/VKtsmKy8BsCFofRRUU4+Y2CJ4iV0YhnUoXxA
	 DfAMHkFcm9ahYhicDK/5bgAmTOlLFg8h4HcWwRot4Czmn+Dzj5H0OqU/R3CpQvNTp6
	 gCpBlllGJy2rA==
Date: Mon, 2 Mar 2026 11:26:21 +0000
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Brian Masney <bmasney@redhat.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
	Sudeep Holla <sudeep.holla@kernel.org>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Cristian Marussi <cristian.marussi@arm.com>,
	arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 04/13] clk: scpi: drop determine_rate op and use
 CLK_ROUNDING_FW_MANAGED flag
Message-ID: <20260302-godlike-amusing-sawfly-b25af0@sudeepholla>
References: <20260226-clk-det-rate-fw-managed-v1-0-4421dd2f6dc6@redhat.com>
 <20260226-clk-det-rate-fw-managed-v1-4-4421dd2f6dc6@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260226-clk-det-rate-fw-managed-v1-4-4421dd2f6dc6@redhat.com>

On Thu, Feb 26, 2026 at 01:16:48PM -0500, Brian Masney wrote:
> This clk driver has a noop determine_rate clk op. Drop this empty
> function, and enable the CLK_ROUNDING_FW_MANAGED flag.
> 
> Signed-off-by: Brian Masney <bmasney@redhat.com>
> 

Reviewed-by: Sudeep Holla <sudeep.holla@kernel.org>

-- 
Regards,
Sudeep
