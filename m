Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46DFC32D45C;
	Tue,  3 Mar 2026 12:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772542088; cv=none; b=QHS9EAJ07YcGM6uTPHQmpkpEKRCAMpyNHVzCuXO3SqOpAGKnaobpgkSKtYE+dZ0iIvb8QeQ8ZwDiAZPH1okiOZjTYQqpb/rxj+qSE6ZMvcJcNNz3lMQ8CA8lzukma/Pv52QyVavVNH/SM+6HEPDGv4JwHfUuzMSlH2ZAM0WOEtE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772542088; c=relaxed/simple;
	bh=5NgeH5OoINRp8crMWTINcSNzZJt9T+xHhKJlmRvfwSI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zm8yMMq9LvtJa+Dh8i00ottklJBi98vm4hCwZhnVT9sLlBcT1KWTDyU+naPX8I61g43tOwW3ylQ6chtOQxuxkjVMovC92U45uFOpdmahQ4TTziHqVIzNSofB+lz1CU1AqXgAp05oCXw4tZwz4VxAMmD6csJKqdUncFbSv+7ZlXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 33056497;
	Tue,  3 Mar 2026 04:48:00 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 004193F7BD;
	Tue,  3 Mar 2026 04:48:01 -0800 (PST)
Date: Tue, 3 Mar 2026 12:47:58 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Brian Masney <bmasney@redhat.com>
Cc: Peng Fan <peng.fan@oss.nxp.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com, michal.simek@amd.com,
	dan.carpenter@linaro.org, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>
Subject: Re: [PATCH 02/11] clk: scmi: Use new determine_rate clock operation
Message-ID: <aabYfgvXh2QtPDWR@pluto>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-3-cristian.marussi@arm.com>
 <aaI9JBwWaMmfBbd/@shlinux89>
 <aaXEtNilpRYhwmYc@redhat.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaXEtNilpRYhwmYc@redhat.com>

On Mon, Mar 02, 2026 at 12:11:16PM -0500, Brian Masney wrote:
> On Sat, Feb 28, 2026 at 08:56:04AM +0800, Peng Fan wrote:
> > On Fri, Feb 27, 2026 at 03:32:16PM +0000, Cristian Marussi wrote:
> > >Use the Clock protocol layer determine_rate logic to calculate the closest
> > >rate that can be supported by a specific clock.
> > >
> > >No functional change.
> > >
> > >Cc: Brian Masney <bmasney@redhat.com>
> > >Cc: Michael Turquette <mturquette@baylibre.com>
> > >Cc: Stephen Boyd <sboyd@kernel.org>
> > >Cc: linux-clk@vger.kernel.org
> > >Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > >---
> > >Note that the calculation logic in the protocol layer is exactly the same
> > >as it wes here.
> > >
> > >@Brian I suppose once your CLK_ROUNDING_FW_MANAGED sereis is merged I can flag
> > >such SCMI clocks.
> > 
> > Per my reading of Brain's thread, if ->determine_rate exists,
> > ->determine_rate() will be used.
> > 
> >  	} else if (core->ops->determine_rate) {
> >  		return core->ops->determine_rate(core->hw, req);
> > +	} else if (clk_is_rounding_fw_managed(core)) {
> > +		return 0;
> > 
> > So unless update scmi_clk_determine_rate() to something:
> > --------
> > if (clk & CLK_ROUNDING_FW_MANAGED)
> > 	return 0;
> > 
> > return scmi_proto_clk_ops->determine_rate(clk->ph, clk->id, &req->rate);
> > --------
> > 
> > It maybe better to update Brain's patch to move clk_is_rounding_fw_managed()
> > above the check of core->ops->determine_rate().
> 
> The clk framework has some basic sanity checks in place that are called
> during device probe to ensure that various ops are configured properly. I
> could add a check that if CLK_ROUNDING_FW_MANAGED [*] is set, and a
> determine_rate() op is set, then it gives an error.
> 
> [*] Note: I am tentatively planning to rename that to CLK_ROUNDING_NOOP
> in v2 in about a week.

Ok, I will track yor series to decide how to better handle this on my
side.

Thanks,
Cristian
