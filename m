Return-Path: <SRS0=Lhyk=2Y=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C76BFC2D0C2
	for <linux-clk@archiver.kernel.org>; Fri,  3 Jan 2020 19:16:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 99B9F222C4
	for <linux-clk@archiver.kernel.org>; Fri,  3 Jan 2020 19:16:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VmUoJ7cu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728452AbgACTQD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 3 Jan 2020 14:16:03 -0500
Received: from mail-pf1-f194.google.com ([209.85.210.194]:35309 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728380AbgACTQD (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 3 Jan 2020 14:16:03 -0500
Received: by mail-pf1-f194.google.com with SMTP id i23so18503609pfo.2
        for <linux-clk@vger.kernel.org>; Fri, 03 Jan 2020 11:16:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=vZomX7k0gRVpj14/WdJAyZSo4OdRTfm/ogrPyU/9NuM=;
        b=VmUoJ7cuQOj8yvosIWRMEu6d5NSTnv4p0HCrFcIu9fQ4l81Ey6q939zzYUJeJaZ64a
         ZH8V3w/Bxs4NPF/ciAa/Idlx5QoLWz7IlUOexJ2fdFdHBiONrwSU/VYL5byEW+44CLfQ
         SMfc1uIBdlW6N7rHmwH63GYVPdqwbGIdXyBTt5ll2vlVFjZw6dO7LIYME8drzz9PvEUf
         Cr4DqbBrGxUqrRXNQYMHmTDa8yTAWLx+XW05Xb12ejiGIgLOCQ1KDNTsEubkkZQ4vg0n
         HDrz4DuaHQxjGrYKBtm18XZDIWGtMELTBthS32VS8DHo3BsMjSYp/gr1AWuQYKhJ/JGx
         7hcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=vZomX7k0gRVpj14/WdJAyZSo4OdRTfm/ogrPyU/9NuM=;
        b=hBNi+87qGyI+/LRgRaMHpk88/0DjfifdgvO3jIWkysb+XRa/0cK8TsF9RyX9PVX6oV
         wojEvRaTSH3d4rL76VrscgU/W/daFYBsAygIajwHCZgEs3SKSxLlVoJGFLv5GCArE1pT
         Wz6TKx9JvUMy6yn7lg5CIJ+QUzZ9pPyRcoIgvm5MfPjkssSqbhGIyWjIpawIZa+ElhQM
         wtI7p4wQc1NVxAXHX2vuWRsP6fHjhcFx8W7HvRoo8kR8UdD1RWjeDYvD3hCa0pi6oSwd
         OQ2Ty5ArrquqnZVYpYbM432MgvBj8gn9ZnzWCbhjzQHPhVgJDRfn1mPxvbk8lyX5n4DJ
         rgkg==
X-Gm-Message-State: APjAAAW8cPTW20uxLyXoa5hXy4v9oCEqc/C25nPtO8pjgroz319GAQdD
        s7Pelu9xeZHTCCYtxcyG7fx4UMsTs/k=
X-Google-Smtp-Source: APXvYqwbWrzgOHLfBKPcJOel52aFz7gJfvMHupIec6iWxtw+mfGglLXvkI30VeaYCSjb/tycYQe4Sg==
X-Received: by 2002:a63:6c82:: with SMTP id h124mr97258222pgc.328.1578078962175;
        Fri, 03 Jan 2020 11:16:02 -0800 (PST)
Received: from yoga (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id 13sm67210755pfi.78.2020.01.03.11.16.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jan 2020 11:16:01 -0800 (PST)
Date:   Fri, 3 Jan 2020 11:15:59 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Niklas Cassel <nks@flawful.org>
Cc:     sboyd@kernel.org, mturquette@baylibre.com,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: Re: [PATCH v4] clk: qcom: apcs-msm8916: use clk_parent_data to
 specify the parent
Message-ID: <20200103191559.GV549437@yoga>
References: <20200103111429.1347-1-nks@flawful.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200103111429.1347-1-nks@flawful.org>
User-Agent: Mutt/1.12.2 (2019-09-21)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri 03 Jan 03:14 PST 2020, Niklas Cassel wrote:

> From: Niklas Cassel <niklas.cassel@linaro.org>
> 
> Allow accessing the parent clock names required for the driver operation
> by using the device tree 'clock-names' property, while falling back to
> the previous method of using names in the global name space.
> 
> This permits extending the driver to other platforms without having to
> modify its source code.
> 
> Co-developed-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Signed-off-by: Jorge Ramirez-Ortiz <jorge.ramirez-ortiz@linaro.org>
> Signed-off-by: Niklas Cassel <niklas.cassel@linaro.org>

Tested-by: Bjorn Andersson <bjorn.andersson@linaro.org>
Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn

> ---
> Changes since v3:
> -Don't set dev->of_node explicitly, since the clock framework will now
> automatically use the parent node pointer when needed.
> 
> Requires the following patch to the clock framework to land first:
> https://patchwork.kernel.org/patch/11313639/
> 
>  drivers/clk/qcom/apcs-msm8916.c | 10 +++++-----
>  1 file changed, 5 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/qcom/apcs-msm8916.c b/drivers/clk/qcom/apcs-msm8916.c
> index 46061b3d230e..cf69a97d0439 100644
> --- a/drivers/clk/qcom/apcs-msm8916.c
> +++ b/drivers/clk/qcom/apcs-msm8916.c
> @@ -19,9 +19,9 @@
>  
>  static const u32 gpll0_a53cc_map[] = { 4, 5 };
>  
> -static const char * const gpll0_a53cc[] = {
> -	"gpll0_vote",
> -	"a53pll",
> +static const struct clk_parent_data pdata[] = {
> +	{ .fw_name = "aux", .name = "gpll0_vote", },
> +	{ .fw_name = "pll", .name = "a53pll", },
>  };
>  
>  /*
> @@ -62,8 +62,8 @@ static int qcom_apcs_msm8916_clk_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	init.name = "a53mux";
> -	init.parent_names = gpll0_a53cc;
> -	init.num_parents = ARRAY_SIZE(gpll0_a53cc);
> +	init.parent_data = pdata;
> +	init.num_parents = ARRAY_SIZE(pdata);
>  	init.ops = &clk_regmap_mux_div_ops;
>  	init.flags = CLK_SET_RATE_PARENT;
>  
> -- 
> 2.24.1
> 
