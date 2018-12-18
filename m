Return-Path: <SRS0=G9W/=O3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5025C43387
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 15:44:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id ABEEB21873
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 15:44:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1545147894;
	bh=AzJpGlALTHbMtVpOAk6Azs/gOCZu0l4op8PTAvQ9eDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=InY8jYHQkRVq1qHAynvPMCnVD46KG4xT5lj1uHaRgRYK4Nbqplgd1dzsfAqaAh8ia
	 qen6ag7MAZPzFmXFo0+vUoX0kIqIUEyr4rGZMEr6bACVXYyoR5Y5BbMBjrdmzO2uQv
	 s8DPJoLDTQTzP2u2S545Pq5J3ft4EzP2481/zhls=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726807AbeLRPoy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Dec 2018 10:44:54 -0500
Received: from mail-oi1-f193.google.com ([209.85.167.193]:44418 "EHLO
        mail-oi1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726611AbeLRPoy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Dec 2018 10:44:54 -0500
Received: by mail-oi1-f193.google.com with SMTP id m6so2260858oig.11;
        Tue, 18 Dec 2018 07:44:53 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=NcWVkWKG6oRU/4m7cHZ3YmJci15Y/kvJSx5k2vvnUtM=;
        b=SU5+3zNOntygNtGiXMikA1o9PdCjrfTdRO2jp6uR+5EHK2F7W0qfRMkr1DbPEfIYhl
         dgJKFdaAJI3A8K53b57d4GG5coNNPlHpRW8M6nDN7mOCj+c/ifyS51N8KOt33ftrXjby
         41QOpIzT9fNWGG6sOtcArESREq8JzJTZe8hABXamWymwTqmz8r9/5MXvUiA2aE6RlWLz
         QdyXwMgdDveeiPFOf4mjpV/p6A1he8p/aVNLZza6mm2nOb1wPZNGbkCj2JeNXHkHqwHH
         cs+cpYPGpfa2Hfn/X8eNRJKYBmy8E/ijhwN9ynVgl9VEOazyTO7l1zMFJSPYnTo67wqS
         GIog==
X-Gm-Message-State: AA+aEWbWm3LGSxg3bOIokYqlvdC5XM1ZlUi86nckG7gzqU1r7GQLaOk2
        BIXu0rDwy0HpYQsncGfMiA==
X-Google-Smtp-Source: AFSGD/VTpA+q4J/0L1oahdvDemcj8GbLv8Vy+fn0wDCVLrnL3U0A3haKdTlmYNQEmQfa1nbKNalVfg==
X-Received: by 2002:aca:b184:: with SMTP id a126mr1661186oif.187.1545147892881;
        Tue, 18 Dec 2018 07:44:52 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id w5sm7097461oif.48.2018.12.18.07.44.51
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Dec 2018 07:44:52 -0800 (PST)
Date:   Tue, 18 Dec 2018 09:44:51 -0600
From:   Rob Herring <robh@kernel.org>
To:     Joseph Lo <josephl@nvidia.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org, Joseph Lo <josephl@nvidia.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH V3 02/20] dt-bindings: clock: tegra124-dfll: add Tegra210
 support
Message-ID: <20181218154451.GA23737@bogus>
References: <20181218091232.23532-1-josephl@nvidia.com>
 <20181218091232.23532-3-josephl@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181218091232.23532-3-josephl@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 18 Dec 2018 17:12:14 +0800, Joseph Lo wrote:
> Add Tegra210 support for DFLL clock.
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
>  .../devicetree/bindings/clock/nvidia,tegra124-dfll.txt        | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
