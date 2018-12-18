Return-Path: <SRS0=G9W/=O3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E6F0C43387
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 15:47:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4D0A521873
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 15:47:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1545148060;
	bh=qiKiAr9UYrvzSwl8aiWu3EJdKcOIuwqtYVFDFyqEDQY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=URPkbkfd6p72U1iIp6uJFG8yNtqbBNsg0GUvBbetTsKrwoeqjbjqUgdeykSr3BOOO
	 gBbAUfE10LoFLQaBhP4yYg0gjJS2/BQe5Rkv5UFOShKOtvWyeK7ljOY7e4MzmjIQZ7
	 UcxgE0w0121Zs+gOdsYzix445rKOcxcBHGoNsGQw=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726612AbeLRPrj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Dec 2018 10:47:39 -0500
Received: from mail-ot1-f65.google.com ([209.85.210.65]:42660 "EHLO
        mail-ot1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726422AbeLRPrj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Dec 2018 10:47:39 -0500
Received: by mail-ot1-f65.google.com with SMTP id v23so16060628otk.9;
        Tue, 18 Dec 2018 07:47:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=v7R2TFqGmPkmCJBd3YEdG1hBchpAtg9ekUTRbWaoo8Y=;
        b=T6J5oLXDYm7hzumLwvq4cpjlmycLxjz6Yjha/N92ivOt7V6ZR/GMI+f0gJqK426Eiu
         vcg4VIaGL/AtHApExjK2FDN2j+168lACcYA7ExtSM4NFgdeBme7IjjRhL09TQeVXjX2Q
         PIV1rQ16wFaYEsUv2LhlnQHzTP4pUdEFKLA0DTJm4lNoDHzV+TaRj3XwHr5O/GO51ww7
         X2VXQmzr301R0xl57B7ccw7YliW5xS8ql+66kDAqjSpXo1YWEXx3LrPJ1S0YzeVlc/ET
         kc6ANx4ndWPdc5Z51HIyAnxTzEFgHvB6YQwERhNXFWnUoEX6i1mnMjJg/z3/SDmLrCzF
         Yt6A==
X-Gm-Message-State: AA+aEWburrjnP0cN6s1sAmPLK+aLcqwUMixndevveVWd2OgkhryLN1Nm
        /VY1IkJkInTc1Ysr9S77Pg==
X-Google-Smtp-Source: AFSGD/VmRjfgmjW1WxguE34FHAbLNo7DauF08TC3I/BPqVHqSkbKlUyZrGOd/L8l385M2Hjpuua9jA==
X-Received: by 2002:a9d:2015:: with SMTP id n21mr13381454ota.289.1545148057728;
        Tue, 18 Dec 2018 07:47:37 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id s186sm8263512oif.0.2018.12.18.07.47.37
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Dec 2018 07:47:37 -0800 (PST)
Date:   Tue, 18 Dec 2018 09:47:36 -0600
From:   Rob Herring <robh@kernel.org>
To:     Joseph Lo <josephl@nvidia.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org, Joseph Lo <josephl@nvidia.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH V3 04/20] dt-bindings: cpufreq: tegra124: remove cpu_lp
 clock from required properties
Message-ID: <20181218154736.GA28224@bogus>
References: <20181218091232.23532-1-josephl@nvidia.com>
 <20181218091232.23532-5-josephl@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181218091232.23532-5-josephl@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 18 Dec 2018 17:12:16 +0800, Joseph Lo wrote:
> The cpu_lp clock property is only needed when the CPUfreq driver
> supports CPU cluster switching. But it was not a design for this driver
> and it didn't handle that as well. So removing this property.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> Acked-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> *V3:
>  - no change
> *V2:
>  - add ack tag
> ---
>  .../devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq.txt   | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
