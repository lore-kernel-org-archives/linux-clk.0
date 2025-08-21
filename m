Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C53F518C933;
	Thu, 21 Aug 2025 10:17:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755771462; cv=none; b=bMxm85CAyewMd+6G3L7TyJYYqCfF46EfC4HYdW8EeLLZc8XE/lpgum6TL7xLw1CK3l663VgB1sa+J2cCP7XEsKAAjWT75Eo93mlAf7tD0ex99yzNNMomfSfEGL71bmMCSGi3bot6MPsZIEO9E8wLj4cXc8vjzkEK10FgX8oNntM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755771462; c=relaxed/simple;
	bh=PWiWc3LtueeY6gvUwOzbvGNxtp5WuxxIFYIX6ArplCY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Djm9MabAePVXAji8D6aCA2juH2S0jTdIRyZX/6ywvH5QjL9EV5kveeCKlKSxmx2VCgePIVUdlXGidjDDmwR0C2cFCVLqiuo7tte0h2XJ61xhje7x48DTGiGopHfH3/3H2X0TTReAXko3rsJ7FEE8vKtu28czjPcAceHE4LKbxwI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com; spf=none smtp.mailfrom=foss.arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=fail (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=foss.arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1CE41152B;
	Thu, 21 Aug 2025 03:17:32 -0700 (PDT)
Received: from bogus (e133711.arm.com [10.1.196.55])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ABDC63F63F;
	Thu, 21 Aug 2025 03:17:37 -0700 (PDT)
Date: Thu, 21 Aug 2025 11:17:34 +0100
From: Sudeep Holla <sudeep.holla@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: Naresh Kamboju <naresh.kamboju@linaro.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	open list <linux-kernel@vger.kernel.org>,
	linux-clk <linux-clk@vger.kernel.org>, lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Lorenzo Pieralisi <lpieralisi@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>,
	Anders Roxell <anders.roxell@linaro.org>
Subject: Re: Juno-r2 WARNING kernel time clockevents.c cev_delta2ns
 clockevents_config.part
Message-ID: <20250821-thundering-skylark-of-proficiency-a17ddd@sudeepholla>
References: <CA+G9fYsYVuEpL5KnYdq4ciRmpnUMQqkNQHmy7y5XvUm48kjxyA@mail.gmail.com>
 <aKXajiHqhhkFeV4a@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aKXajiHqhhkFeV4a@stanley.mountain>

On Wed, Aug 20, 2025 at 05:24:14PM +0300, Dan Carpenter wrote:
> Hi Sudeep,
> 
> Could we revert commit 1fa3ed04ac55 ("arm64: dts: arm: Drop the
> clock-frequency property from timer nodes")?  We're still getting this
> warning on our Juno systems (with admittedly ancient firmware).
> 

It was dropped to avoid further copy-paste into newer platforms that
need to get these right in the firmware. I am afraid keep it would just
not help and any strong reasons for not moving to newer firmware. It should
be really ancient one with no security fixes I guess. I strong prefer to
move to slightly newer firmware version if not the latest.

-- 
Regards,
Sudeep
