Return-Path: <SRS0=Ex8p=P5=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C7EBC37120
	for <linux-clk@archiver.kernel.org>; Mon, 21 Jan 2019 20:53:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 409C120861
	for <linux-clk@archiver.kernel.org>; Mon, 21 Jan 2019 20:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1548104006;
	bh=X3oo2B/4ByP3OpcHnxBSgQLiOd+CvObBWSPKVdnz9og=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=HHBYXN3sV7XLzGqClNZX+HTrN2qFwaV28YNfvZF/J73e9vl6rm8ME6VoVjphHm2uM
	 vzNMb90xKvAYlHBLcRAmfzvEsivayxiOa9TJuGdiRKoDM+uDXxogsPlNQa5Bv/xMUR
	 gSCf/pyiK3t3MXUUn8uJvKkqb0VB9/Q6RCNVb+Rw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726244AbfAUUx0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 21 Jan 2019 15:53:26 -0500
Received: from mail-ot1-f66.google.com ([209.85.210.66]:40433 "EHLO
        mail-ot1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726004AbfAUUxZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 21 Jan 2019 15:53:25 -0500
Received: by mail-ot1-f66.google.com with SMTP id s5so21707520oth.7;
        Mon, 21 Jan 2019 12:53:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ov5pmAFbz5CryQbLFY689CpqmNQ0pk9SPQ12zumIw28=;
        b=V1C3dfIaebtcOGBPqRJIbjKFT944XtnnLVmP7uLMrAfYL1zgF5AfowzMn/OR+rsCyJ
         01MWYN5YUU2ISC2WMJ1Uz9wX3L0YxBE0L6GsRIYCbeFAcYNe0k/KVDYt9aS5GVne2EhZ
         HddhuhGWbaNCKu5JDQajmvzP0sJ+uWdv4+mQq8omHEznJz8jNn7o+YVjaAZ7WWyCRSJP
         hqopK8eaqy9lRowCScf7v7c01nWpAbhmnU7QW3UMB1ckzFCXkbj/xwK6nC0uIVi1bLI2
         +yCGjNxt2ZeHc2zIDXBI+5YsI3XIPQGSAOidQkoxD8pBlC8ulqS/sPZOddLWTTHTCMjy
         V0hw==
X-Gm-Message-State: AJcUukf6HIcQhUM+iHshS1zfmnzAJ5aciHkUWYuLljxHYNC8JyevJEPS
        wMwbD8UehJU9TF/DI7XcpVqOXcVwVg==
X-Google-Smtp-Source: ALg8bN6J4RK8rZbvMI1FGxQG/MkZMWFSPv/tFYxLdKtK22uk7YqAEXs7lhZabwBTnkc69iV8np1DWw==
X-Received: by 2002:a9d:73d0:: with SMTP id m16mr20701898otk.117.1548104004401;
        Mon, 21 Jan 2019 12:53:24 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q131sm6731677oih.1.2019.01.21.12.53.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 21 Jan 2019 12:53:23 -0800 (PST)
Date:   Mon, 21 Jan 2019 14:53:23 -0600
From:   Rob Herring <robh@kernel.org>
To:     Tero Kristo <t-kristo@ti.com>
Cc:     sboyd@kernel.org, mturquette@baylibre.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        ssantosh@kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/3] clk: keystone: sci-clk: add support from parsing
 clock info from DT
Message-ID: <20190121205323.GA7851@bogus>
References: <1546954223-9738-1-git-send-email-t-kristo@ti.com>
 <1546954223-9738-3-git-send-email-t-kristo@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1546954223-9738-3-git-send-email-t-kristo@ti.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Jan 08, 2019 at 03:30:22PM +0200, Tero Kristo wrote:
> Currently the sci-clk driver queries clock data from the firmware, which
> can be pretty slow operation in certain cases. Add an option for the
> driver to probe the available clocks from DT also, in this case the
> number of clocks probed from firmware gets cut down drastically. To
> enable the feature, a new flag ti,scan-clocks-from-dt can be added
> under the clock provider node.
> 
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> Tested-by: Andreas Dannenberg <dannenberg@ti.com>
> ---
>  drivers/clk/keystone/sci-clk.c | 188 ++++++++++++++++++++++++++++++++++-------
>  1 file changed, 159 insertions(+), 29 deletions(-)


> +static int ti_sci_scan_clocks_from_dt(struct sci_clk_provider *provider)
> +{
> +	struct device *dev = provider->dev;
> +	struct device_node *np = NULL;
> +	int ret;
> +	int index;
> +	struct of_phandle_args args;
> +	struct list_head clks;
> +	struct sci_clk *sci_clk, *prev;
> +	int num_clks = 0;
> +	int num_parents;
> +	int clk_id;
> +
> +	INIT_LIST_HEAD(&clks);
> +
> +	while (1) {
> +		np = of_find_node_with_property(np, "clocks");
> +		if (!np)
> +			break;

for_each_node_with_property

> +
> +		index = 0;
> +
> +		do {
> +			ret = of_parse_phandle_with_args(np, "clocks",
> +							 "#clock-cells", index,
> +							 &args);
> +			if (ret)
> +				break;

of_for_each_phandle can be used here. And then of_phandle_iterator_args 
will get the args.

> +
> +			if (args.args_count == 2 && args.np == dev->of_node) {

dtc will warn if the # of cells are wrong, so that's probably redundant.

Invert the if and save a level of indentation.

> +				sci_clk = devm_kzalloc(dev, sizeof(*sci_clk),
> +						       GFP_KERNEL);
> +				if (!sci_clk)
> +					return -ENOMEM;
> +
> +				sci_clk->dev_id = args.args[0];
> +				sci_clk->clk_id = args.args[1];
> +				sci_clk->provider = provider;
> +				provider->ops->
> +					get_num_parents(provider->sci,
> +							sci_clk->dev_id,
> +							sci_clk->clk_id,
> +							&sci_clk->num_parents);
> +				list_add_tail(&sci_clk->node, &clks);
> +
> +				num_clks++;
> +
> +				num_parents = sci_clk->num_parents;
> +				if (num_parents == 1)
> +					num_parents = 0;
> +
> +				clk_id = args.args[1] + 1;
> +
> +				while (num_parents--) {
> +					sci_clk = devm_kzalloc(dev,
> +							       sizeof(*sci_clk),
> +							       GFP_KERNEL);
> +					if (!sci_clk)
> +						return -ENOMEM;
> +					sci_clk->dev_id = args.args[0];
> +					sci_clk->clk_id = clk_id++;
> +					sci_clk->provider = provider;
> +					list_add_tail(&sci_clk->node, &clks);
> +
> +					num_clks++;
> +				}
> +			}
> +
> +			index++;
> +		} while (args.np);
> +	}
> +
> +	list_sort(NULL, &clks, _cmp_sci_clk_list);
> +
> +	provider->clocks = devm_kmalloc_array(dev, num_clks, sizeof(sci_clk),
> +					      GFP_KERNEL);
> +	if (!provider->clocks)
> +		return -ENOMEM;
> +
> +	num_clks = 0;
> +	prev = NULL;
> +
> +	list_for_each_entry(sci_clk, &clks, node) {
> +		if (prev && prev->dev_id == sci_clk->dev_id &&
> +		    prev->clk_id == sci_clk->clk_id)
> +			continue;
> +
> +		provider->clocks[num_clks++] = sci_clk;
> +		prev = sci_clk;
> +	}
> +
> +	provider->num_clocks = num_clks;
> +
> +	return 0;
> +}
