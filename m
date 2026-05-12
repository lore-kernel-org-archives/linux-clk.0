Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F1F14ADDB7;
	Tue, 12 May 2026 08:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778575404; cv=none; b=tWAdgEMQcAE9+tToyBJVEpDBUN6rE0sFTxWDZnwrlzwm1q8k29aG4+QFbh1MGz2iqY5+Y0Y6n25rUI5gNHBByt8I0fDjlOOj42Y3eVzOdtFhkymU818xythI2+XyeQ6aYivlamuLpFU6Nqt4f5K9yVyC6UJB1S0zmNvgdXmkYwc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778575404; c=relaxed/simple;
	bh=AzX8yXSa8mZeuYVkhSfLL/djnjt3bTbaiv5tUdNNaGQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eY/ErqJZDSYKZBURzAmB8u2tP+AYjTuKl1er5tw0wIoQOxakgxfxUx5XrKSLNMxdQkO8aIVCnCa1gSXl5buVYjDpJNlenL/OYwYOOJoXUGr05c6mYPY4GC9msHvS+O9tVAYIoTjwelaPsX/Ao7GCjPayk8CnH9NWFnSrHv9ym3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jXzozDCJ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jXzozDCJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49133C2BCB8;
	Tue, 12 May 2026 08:43:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778575401;
	bh=AzX8yXSa8mZeuYVkhSfLL/djnjt3bTbaiv5tUdNNaGQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jXzozDCJbIXl7wFaJs7MuQDiQyfJkOPbR+omuNgM5mXfNdpDGaRgbxGyirBInMJ54
	 0ZSAdHYB3+4KtQLo7kQe1POLStXKQuI57EjOWQZ4HTIEjP1f+HC1j9GvFf1nn+ySh6
	 FdKnjUVNq0EjU4JY7lvApI3ZCuLhYQh5hYQuJVOj4PJbA3LDeFXm7PllKawyX85+LP
	 Zp+TY3O4WBoVCsgaVjiSoyjf/2/GUFYEk7HUpEm2Tgx4TZpLFRKshL8y1oNLmA/YSc
	 UQwt7FPYdpiQ6pqzadHTtBZyshrKemYcKDaRTs7e7IuvC4M4mXyV9gGXmAU9tFitDi
	 lGJrgmS30Lk7w==
Date: Tue, 12 May 2026 09:43:16 +0100
From: Sudeep Holla <sudeep.holla@kernel.org>
To: Cristian Marussi <cristian.marussi@arm.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, philip.radford@arm.com,
	james.quinlan@broadcom.com, f.fainelli@gmail.com,
	vincent.guittot@linaro.org, etienne.carriere@foss.st.com,
	peng.fan@oss.nxp.com, michal.simek@amd.com, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com,
	Brian Masney <bmasney@redhat.com>
Subject: Re: [PATCH v4 03/15] clk: scmi: Use new determine_rate clock
 operation
Message-ID: <20260512-logical-tidy-pronghorn-5da394@sudeepholla>
References: <20260508153300.2224715-1-cristian.marussi@arm.com>
 <20260508153300.2224715-4-cristian.marussi@arm.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260508153300.2224715-4-cristian.marussi@arm.com>

On Fri, May 08, 2026 at 04:32:48PM +0100, Cristian Marussi wrote:
> Use the Clock protocol layer determine_rate logic to calculate the closest
> rate that can be supported by a specific clock.
> 
> No functional change.
> 

Hi Stephen/Mike,

I have potentially queued this and 5/15 to take it via Arm SoC unless you
have any objections. It is mainly simplifying the SCMI clock driver.

-- 
Regards,
Sudeep
