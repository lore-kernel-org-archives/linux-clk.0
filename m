Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 601BE413250;
	Sat, 28 Feb 2026 10:13:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772273607; cv=none; b=CHEB7VG5v0ZGwGbhm4TaB0TqgMx3iBL8qlrxX9Xgt0XFvsHZcorLtMDij8bJlz+U6Cu5BF2Fkaz22e06koOyt3tKgWGCR8JB3FkvkBuCVyYU0BBAHI8lfVpUrVqsznCJTfyMH7oA/aDFpZL8MVt3T5V9AEaZ6TROrsB93BIBEC0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772273607; c=relaxed/simple;
	bh=f7BkTF9gSktQZxAQQ+v5eGGrZUWQbxCpjHljwHy/7oo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OwH3ZqDxEsjaTukbw1nF1EnyBEQ11bQ6H/GUIrR00rNLhPTh8WCoE5g612e4NgnMx6Wb6ssJur5cLRIGhR2PQZde/IrTXL+I9IQJMqy2mPRrmqYujSWq+TS0IgLvFz0kEdApdIN5oxog0tiU8Z1bKXLnLXADV0oeof/e7Ata6is=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4095B1516;
	Sat, 28 Feb 2026 02:13:19 -0800 (PST)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 979463F7BD;
	Sat, 28 Feb 2026 02:13:21 -0800 (PST)
Date: Sat, 28 Feb 2026 10:13:18 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Peng Fan <peng.fan@oss.nxp.com>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com, michal.simek@amd.com,
	dan.carpenter@linaro.org, geert+renesas@glider.be,
	kuninori.morimoto.gx@renesas.com, marek.vasut+renesas@gmail.com
Subject: Re: [PATCH 01/11] firmware: arm_scmi: Add clock determine_rate
 operation
Message-ID: <aaK_vgwyH1l8LRJ1@pluto>
References: <20260227153225.2778358-1-cristian.marussi@arm.com>
 <20260227153225.2778358-2-cristian.marussi@arm.com>
 <aaI2X6qnGabtW1t0@shlinux89>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aaI2X6qnGabtW1t0@shlinux89>

On Sat, Feb 28, 2026 at 08:27:11AM +0800, Peng Fan wrote:
> Hi Cristian,
> 
> On Fri, Feb 27, 2026 at 03:32:15PM +0000, Cristian Marussi wrote:
> >Add a clock operation to help determining the effective rate, closest to
> >the required one, that a specific clock can support.
> >
> >Calculation is currently performed kernel side and the logic is taken
> >directly from the SCMI Clock driver: embedding the determinate rate logic
> >in the protocol layer enables semplifications in the SCMI Clock protocol
> >interface and  will more easily accommodate further evolutions where such
> >determine_rate logic into is optionally delegated to the platform SCMI
> >server.
> >
> >Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> >---
> >Spoiler alert next SCMI spec will most probably include a new
> >CLOCK_DETERMINE_RATE command to delegate to the platform such calculations,
> >so this clock proto_ops will be needed anyway sooner or later
> 

Hi Peng, 

thanks for having a look...

> Is there any early reviewing version available?

No I dont think there is anything shareable...just some preliminary
exploratory work following your and other vendor reaquest to have a way
to properly determine upfront what will be the final rate starting from
the requested one, because delegating all to the fw-side round-up leads
to issues in some cases when the final rate is different from teh
requested one...well...you know better than me why, being one of the
guys that pointed out the issues... :D (if I am not mistaken)

It is anyway material for v4.1...which has still to be started...so this
was just a reminder that a dedicated protocol version would be most
probably needed soon-ish..

Thanks,
Cristian
