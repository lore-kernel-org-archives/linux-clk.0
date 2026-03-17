Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D0A7A35A395;
	Tue, 17 Mar 2026 09:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773739369; cv=none; b=ZFB/ocqf5zI0WAJ6TwFKMiuqICimbbL1zMWMIUT7kchOYSRLigIuQWfZ1pisxkWit0eIpR7P3p5xZzbl2r62Az/HDDOSO+tF7e7Lx/pgiEtYx7PhPFXeCcF7DlRozg2Ei1dYVfmBlkq+p8dk86CXt3biWfAZ335OivUzbAQ+Y2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773739369; c=relaxed/simple;
	bh=Xz17b+5X6ynEJKTd5JMVAR9verb1Jmtr4CsAB7EE3jE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cop8GFARmAaEWp/OUb4qhPPugUm2IRcZAPHYhmLxtD+7hYEdfCNO3NP6UpoT5EZfaWGOh00ds69CfOHXRjgWZjejchsVZjTVn7b43vdJlDWGpHLsAm9UECvC6bREzPqoSn0x1zejIFpoo1n4w0+BXrElH4a7c+PloV7h7Gt+ahw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0ED331476;
	Tue, 17 Mar 2026 02:22:41 -0700 (PDT)
Received: from pluto (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 01E5A3F778;
	Tue, 17 Mar 2026 02:22:44 -0700 (PDT)
Date: Tue, 17 Mar 2026 09:22:38 +0000
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
Subject: Re: [PATCH v2 11/13] firmware: arm_scmi: Add bound iterators support
Message-ID: <abkdXkA4iyJ5HKH7@pluto>
References: <20260310184030.3669330-1-cristian.marussi@arm.com>
 <20260310184030.3669330-12-cristian.marussi@arm.com>
 <abkGQn9ODanEVns5@shlinux89>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abkGQn9ODanEVns5@shlinux89>

On Tue, Mar 17, 2026 at 03:44:02PM +0800, Peng Fan wrote:
> On Tue, Mar 10, 2026 at 06:40:28PM +0000, Cristian Marussi wrote:
> >SCMI core stack provides some common helpers to handle in a unified way
> >multipart message replies: such iterator-helpers, when run, currently
> >process by default the whole set of discovered resources.
> >
> >Introduce an alternative way to run the initialized iterator on a limited
> >range of resources.
> >
> >Note that the subset of resources that can be chosen is anyway limited by
> >the SCMI protocol specification, since you are only allowed to choose the
> >startindex on a multi-part enumeration NOT the end index, so that the
> >effective number of returned items by a bound iterators depends really
> >on platform side decisions.
> >
> >Suggested-by: Etienne Carriere <etienne.carriere@foss.st.com>
> >Signed-off-by: Cristian Marussi <cristian.marussi@arm.com>
> >---
> >+static void scmi_iterator_cleanup(void *iter)
> >+{
> >+	struct scmi_iterator *i = iter;
> 
> I see you use no_free_ptr for allocation,
> Do we need to use __free for i or drop the __free usage in allocation? 

Neither I think...iter is allocated by iterator_init() which do use
__free cleanups to simplify error paths, BUT if everything goes fine
iter is returned with no_free_ptr() as a normal pointer and all the
compiler-attached cleanup helpers are removed...

Then you can use in an iterator_run() or iterator_run_bound() and in
borth case it HAS to be manually cleanup by calling this scmi_iterator_cleanup
helper where...

> 
> Regards
> Peng
> 
> >+
> >+	i->ph->xops->xfer_put(i->ph, i->t);
> >+	kfree(i);

..it is finally freed explicitly...

...or I am getting something else wrong around the cleanup helpers :P ?

Thanks,
Cristian
