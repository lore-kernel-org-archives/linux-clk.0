Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id F4095423141;
	Sat, 28 Feb 2026 10:42:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772275334; cv=none; b=UYbRJOVX8Pxb908YsFjDPRaFiXEFbh8REmpJCGzDb+Hb931Q/2b/e3Vrof4Kz+0T2bK+cCeBG3jAqV5WqS2L5Baxrz82ttpeJhy+F1gZpWM1SpdrW/y8WsFMTC7pztMWfTbm7OD84jFOPXc3vYod2hlIPcutwO8Rp+mcy2uFiTw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772275334; c=relaxed/simple;
	bh=2F2Q56VniC/DOL0u+DwoeBkcoV3Dsg8+PHK6pELdq+A=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uMozyI++gzLVTLeBLnO2nkPxedHxIe8oSqmf7TutU+0CmKeqJTjAZEmb8inEuO7B+0C+EXHf3DF5xSftqVsrTAWs/+AS2PdZs8dYyMLF44t0S5vmp+LCnwLM5hJOoC3FVsi6tMZCAwzC/S6mxC+j7Wgwn1Q2CbA4d2TKy7kr3KA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E13341516;
	Sat, 28 Feb 2026 02:42:05 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B01243F7BD;
	Sat, 28 Feb 2026 02:42:08 -0800 (PST)
Date: Sat, 28 Feb 2026 10:42:05 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"arm-scmi@vger.kernel.org" <arm-scmi@vger.kernel.org>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>,
	"sudeep.holla@arm.com" <sudeep.holla@arm.com>,
	"philip.radford@arm.com" <philip.radford@arm.com>,
	"james.quinlan@broadcom.com" <james.quinlan@broadcom.com>,
	"f.fainelli@gmail.com" <f.fainelli@gmail.com>,
	"vincent.guittot@linaro.org" <vincent.guittot@linaro.org>,
	"etienne.carriere@foss.st.com" <etienne.carriere@foss.st.com>,
	"michal.simek@amd.com" <michal.simek@amd.com>,
	"dan.carpenter@linaro.org" <dan.carpenter@linaro.org>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>,
	"kuninori.morimoto.gx@renesas.com" <kuninori.morimoto.gx@renesas.com>,
	"marek.vasut+renesas@gmail.com" <marek.vasut+renesas@gmail.com>
Subject: Re: [PATCH 09/11] firmware: arm_scmi: Add bound iterators support
Message-ID: <aaLGfXppc7am90us@pluto>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-10-cristian.marussi@arm.com>
 <aaJWfq5HRQHxk61E@shlinux89>
 <PAXPR04MB84594E5C9BCE2B5171D15FEB8870A@PAXPR04MB8459.eurprd04.prod.outlook.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <PAXPR04MB84594E5C9BCE2B5171D15FEB8870A@PAXPR04MB8459.eurprd04.prod.outlook.com>

On Sat, Feb 28, 2026 at 02:43:47AM +0000, Peng Fan (OSS) wrote:
> > Subject: Re: [PATCH 09/11] firmware: arm_scmi: Add bound iterators
> > support
> > 
> > On Fri, Feb 27, 2026 at 03:32:23PM +0000, Cristian Marussi wrote:
> > >SCMI core stack provides some common helpers to handle in a unified
> > way
> > >multipart message replies: such iterator-helpers, when run, currently
> > >process by default the whole set of discovered resources.
> > >
> > >Introduce an alternative way to run the initialized iterator on a
> > >limited range of resources.
> > >
> > >Note that the subset of resources that can be chosen is anyway
> > limited
> > >by the SCMI protocol specification, since you are only allowed to
> > >choose the startindex on a multi-part enumeration NOT the end index,
> > so
> > >that the effective number of returned items by a bound iterators
> > >depends really on platform side decisions.
> > >
> > >Suggested-by: Etienne Carriere <etienne.carriere@foss.st.com>
> > >Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> > >---
> > > drivers/firmware/arm_scmi/clock.c     |  3 +-
> > > drivers/firmware/arm_scmi/driver.c    | 58 +++++++++++++++++++------
> > --
> > > drivers/firmware/arm_scmi/protocols.h | 13 +++++-
> > > 3 files changed, 55 insertions(+), 19 deletions(-)
> > >
> > >diff --git a/drivers/firmware/arm_scmi/clock.c
> > >b/drivers/firmware/arm_scmi/clock.c
> > >index 15faa79abed4..d7df5c45836e 100644
> > >--- a/drivers/firmware/arm_scmi/clock.c
> > >+++ b/drivers/firmware/arm_scmi/clock.c
> > >@@ -505,8 +505,7 @@ iter_clk_describe_process_response(const
> > struct scmi_protocol_handle *ph,
> > > 	struct scmi_clk_ipriv *p = priv;
> > > 	const struct scmi_msg_resp_clock_describe_rates *r =
> > response;
> > >
> > >-	p->clkd->rates[st->desc_index + st->loop_idx] =
> > >-		RATE_TO_U64(r->rate[st->loop_idx]);
> > >+	p->clkd->rates[p->clkd->num_rates] =
> > >+RATE_TO_U64(r->rate[st->loop_idx]);
> > 
> > Seems irrelevant
> > 
> Ignore this. I understand wrong.

Yeah...I will double check BUT the aim is to proper behaving while
filling up the vector when doing only a partial discovery with bound
iterators...in that case you want to fill probably only a subset of the
available slots in order like [0]:min, [1]:max...

Thanks,
Cristian
