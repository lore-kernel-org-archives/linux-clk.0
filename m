Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 60CEE2C1593;
	Wed, 11 Mar 2026 18:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773254751; cv=none; b=e858ngl6e/847C1jfndCjT6yeijTzAz8C25gGaz965abYOy0wtCAZ8+h7rgu8rkExyR5whu/66pLksQzfRK1+GK0RpS6KD1KxMrMoOxqWTcjTe7V+KPgGGRszxv0GnwGcsRXDZThm/EbjtNktgu27VpQ/T2jfAiyoWFi9sNQK2g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773254751; c=relaxed/simple;
	bh=PP+gKeZHj6awJu60TEqCWO+NV5OBJhAGWJEkQ4k3h7M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=f3RMtoYp1np6PSg+gtVo1ekWx2JOYHKzYEYoEDDH4cF36zlDh5CPg3W6LcG9O/5ITgbBihG2MNIOaJMQvpQp7KONRoBN/YPVM7lr7KwkvlZiE5AyLbO2tbuK/g29FZezvhVvtqY6YFDU1lE8VPzTX/QtyQaxzVKMG+iBMFTK3E8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 62FF61682;
	Wed, 11 Mar 2026 11:45:42 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CA51B3F73B;
	Wed, 11 Mar 2026 11:45:44 -0700 (PDT)
Date: Wed, 11 Mar 2026 18:45:41 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Cristian Marussi <cristian.marussi@arm.com>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	arm-scmi@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org, sudeep.holla@arm.com,
	philip.radford@arm.com, james.quinlan@broadcom.com,
	f.fainelli@gmail.com, vincent.guittot@linaro.org,
	etienne.carriere@foss.st.com, peng.fan@oss.nxp.com,
	michal.simek@amd.com, dan.carpenter@linaro.org,
	geert+renesas@glider.be, kuninori.morimoto.gx@renesas.com,
	marek.vasut+renesas@gmail.com
Subject: Re: [PATCH v2 08/13] firmware: arm_scmi: Harden clock protocol
 initialization
Message-ID: <abG4VfyB2C-gBa5Q@pluto>
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
 <20260310184030.3669330-9-cristian.marussi@arm.com>
 <CAMuHMdUdqrA9kYeDpjwj-y6-4aALkAi2g2Od81Kxh-EVW2e2Nw@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUdqrA9kYeDpjwj-y6-4aALkAi2g2Od81Kxh-EVW2e2Nw@mail.gmail.com>

On Wed, Mar 11, 2026 at 05:59:43PM +0100, Geert Uytterhoeven wrote:
> Hi Cristian,
> 
> On Tue, 10 Mar 2026 at 19:56, Cristian Marussi <cristian.marussi@arm.com> wrote:
> > Add proper error handling on failure to enumerate clocks features or
> > rates.
> >
> > Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>

Hi,

> 
> Thanks for your patch!
> 
> > --- a/drivers/firmware/arm_scmi/clock.c
> > +++ b/drivers/firmware/arm_scmi/clock.c
> 
> > @@ -1143,8 +1149,12 @@ static int scmi_clock_protocol_init(const struct scmi_protocol_handle *ph)
> >         for (clkid = 0; clkid < cinfo->num_clocks; clkid++) {
> >                 cinfo->clkds[clkid].id = clkid;
> >                 ret = scmi_clock_attributes_get(ph, clkid, cinfo);
> > -               if (!ret)
> > -                       scmi_clock_describe_rates_get(ph, clkid, cinfo);
> > +               if (ret)
> > +                       return ret;
> 
> This change breaks R-Car X5H with SCP FW SDKv4.28.0, as some clocks
> do not support the SCMI CLOCK_ATTRIBUTES command.
> Before, these clocks were still instantiated, but were further unusable.
> After, the whole clock driver fails to initialize, and no SCMI clocks
> are available at all.

...and this is exactly what I feared while doing this sort of hardening :P

So there are a few possible solutions (beside reverting this straight away)

The easy fix would be instead change the above in a

	if (ret)
		continue;

...with a bit of annoying accompanying FW_BUG logs, of course, to cause future
FW releases to fix this :D

Another option could be leave it as it is, since indeed it is the correct enforced
behaviour, being CLOCK_ATTRIBUTES a mandatory command, BUT add on top an ad-hoc SCMI
quirk targeting the affected FW releases...

This latter option, though, while enforcing the correct behaviour AND
fixing your R-Car issue, leaves open the door for a number of possible
failures of other unknowingly buggy Vendors similarly deployed firmwares...

...that could be solved with more quirks of course...but...worth it ?

Thoughts ?

Let's see also what @Sudeep thinks about this...

Thanks for testing !

Cristian

