Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 587FD60EFB
	for <linux-clk@vger.kernel.org>; Tue, 20 Feb 2024 11:09:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708427381; cv=none; b=u3tmfiNg7FYCPmWW4VkBoUrnt/8ONxaBLZd5b0mi+gACU3hbF9u50xCDnB7i5x+q2+kLGxAA8RVRBVIX6tvDu8F2T3eOqbqkXi2oDJrzGvuxbd5tysi9Bk7zSbezeM+3UW+yDCqdNxqUn7prTm4MbaSPotOIVEFqyFtiq4wUj18=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708427381; c=relaxed/simple;
	bh=Ixt9MkhFCznNAN/rmo8nT3NaNHEu0v0dRnwT8KxdfXk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kSd2ca6gLD+Otens4CNRAp1CyNYhVKD9qaspW42KOPdbsVhXABwKDuDhNDVOOeNT7hAnzD5eWy1yZsVABrFYO+5JwtSASnjhXsu3MEkFS4YA8NpeHrYPkjUviQgY1kPlZZQcExP6qfh9ZJqw7YApDwuOebmBfnbU33q9xS7J7qg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E822EFEC;
	Tue, 20 Feb 2024 03:10:17 -0800 (PST)
Received: from pluto (unknown [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F5C13F762;
	Tue, 20 Feb 2024 03:09:38 -0800 (PST)
Date: Tue, 20 Feb 2024 11:09:35 +0000
From: Cristian Marussi <cristian.marussi@arm.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Cc: linux-clk@vger.kernel.org
Subject: Re: [bug report] clk: scmi: Allocate CLK operations dynamically
Message-ID: <ZdSIb9mcarW9-uBX@pluto>
References: <904dd0c0-cbe4-47e0-a475-9f5352c7eb5c@moroto.mountain>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <904dd0c0-cbe4-47e0-a475-9f5352c7eb5c@moroto.mountain>

On Tue, Feb 20, 2024 at 01:13:21PM +0300, Dan Carpenter wrote:
> Hello Cristian Marussi,
> 
Hi,

> The patch 11f5b1a48a70: "clk: scmi: Allocate CLK operations
> dynamically" from Feb 14, 2024 (linux-next), leads to the following
> Smatch static checker warning:
> 
> 	drivers/clk/clk-scmi.c:362 scmi_clocks_probe()
> 	error: uninitialized symbol 'atomic_threshold'.
> 
> drivers/clk/clk-scmi.c
>     307 static int scmi_clocks_probe(struct scmi_device *sdev)
>     308 {
>     309         int idx, count, err;
>     310         unsigned int atomic_threshold;
>     311         bool is_atomic;
>     312         struct clk_hw **hws;
>     313         struct clk_hw_onecell_data *clk_data;
>     314         struct device *dev = &sdev->dev;
>     315         struct device_node *np = dev->of_node;
>     316         const struct scmi_handle *handle = sdev->handle;
>     317         struct scmi_protocol_handle *ph;
>     318 
>     319         if (!handle)
>     320                 return -ENODEV;
>     321 
>     322         scmi_proto_clk_ops =
>     323                 handle->devm_protocol_get(sdev, SCMI_PROTOCOL_CLOCK, &ph);
>     324         if (IS_ERR(scmi_proto_clk_ops))
>     325                 return PTR_ERR(scmi_proto_clk_ops);
>     326 
>     327         count = scmi_proto_clk_ops->count_get(ph);
>     328         if (count < 0) {
>     329                 dev_err(dev, "%pOFn: invalid clock output count\n", np);
>     330                 return -EINVAL;
>     331         }
>     332 
>     333         clk_data = devm_kzalloc(dev, struct_size(clk_data, hws, count),
>     334                                 GFP_KERNEL);
>     335         if (!clk_data)
>     336                 return -ENOMEM;
>     337 
>     338         clk_data->num = count;
>     339         hws = clk_data->hws;
>     340 
>     341         is_atomic = handle->is_transport_atomic(handle, &atomic_threshold);
> 
> atomic_threshold is not initialized when is_atomic is false.
>

yes

>     342 
>     343         for (idx = 0; idx < count; idx++) {
>     344                 struct scmi_clk *sclk;
>     345                 const struct clk_ops *scmi_ops;
>     346 
>     347                 sclk = devm_kzalloc(dev, sizeof(*sclk), GFP_KERNEL);
>     348                 if (!sclk)
>     349                         return -ENOMEM;
>     350 
>     351                 sclk->info = scmi_proto_clk_ops->info_get(ph, idx);
>     352                 if (!sclk->info) {
>     353                         dev_dbg(dev, "invalid clock info for idx %d\n", idx);
>     354                         devm_kfree(dev, sclk);
>     355                         continue;
>     356                 }
>     357 
>     358                 sclk->id = idx;
>     359                 sclk->ph = ph;
>     360                 sclk->dev = dev;
>     361 
> --> 362                 scmi_ops = scmi_clk_ops_alloc(sclk, is_atomic, atomic_threshold);
>                                                             ^^^^^^^^^^ ^^^^^^^^^^^^^^^^
> Here we're passing uninitialized data, but it's only used when
> is_atomic is true.  This is okay if scmi_clk_ops_alloc() is inlined,
> but it is considered a bug when it's not inlined.
>

Ok, I will add an explicit initialization to mute smatch but why is it
this considered a bug only when not inlined, because it cannot verify
that it is indeed not used when uninitialized ?

Thanks,
Cristian

>     363                 if (!scmi_ops)
>     364                         return -ENOMEM;
>     365 
>     366                 /* Initialize clock parent data. */
>     367                 if (sclk->info->num_parents > 0) {
>     368                         sclk->parent_data = devm_kcalloc(dev, sclk->info->num_parents,
>     369                                                          sizeof(*sclk->parent_data), GFP_KERNEL);
>     370                         if (!sclk->parent_data)
>     371                                 return -ENOMEM;
>     372 
>     373                         for (int i = 0; i < sclk->info->num_parents; i++) {
>     374                                 sclk->parent_data[i].index = sclk->info->parents[i];
>     375                                 sclk->parent_data[i].hw = hws[sclk->info->parents[i]];
>     376                         }
>     377                 }
>     378 
>     379                 err = scmi_clk_ops_init(dev, sclk, scmi_ops);
>     380                 if (err) {
>     381                         dev_err(dev, "failed to register clock %d\n", idx);
>     382                         devm_kfree(dev, sclk->parent_data);
>     383                         devm_kfree(dev, scmi_ops);
>     384                         devm_kfree(dev, sclk);
>     385                         hws[idx] = NULL;
>     386                 } else {
>     387                         dev_dbg(dev, "Registered clock:%s%s\n",
>     388                                 sclk->info->name,
>     389                                 scmi_ops->enable ? " (atomic ops)" : "");
>     390                         hws[idx] = &sclk->hw;
>     391                 }
>     392         }
>     393 
>     394         return devm_of_clk_add_hw_provider(dev, of_clk_hw_onecell_get,
>     395                                            clk_data);
>     396 }
> 
> regards,
> dan carpenter
