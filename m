Return-Path: <SRS0=xK8l=PT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49B12C43387
	for <linux-clk@archiver.kernel.org>; Fri, 11 Jan 2019 19:32:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1E1CB218C3
	for <linux-clk@archiver.kernel.org>; Fri, 11 Jan 2019 19:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1547235125;
	bh=ZYQ8b8bKPvS5FOtRaH2Zp+9Unig4sLwbm7rBlMCJDAE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=I2B2RHOQT3iPfOH5t8AJENJ7FPUY2w2Ep0iU+I9TUWneMXXs6DtIB7jxB1YZ6oJHb
	 6A6EJvyLw59sP3tlcgakAY+Gm4XYFZQePznM0f/WgYnwsvyqZLc3NHLPZmxVQTWMf9
	 AkLCY8rKmOeqxMZt/e6Tc5juzJlGiNl0JI9NUEmQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732451AbfAKTcE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 11 Jan 2019 14:32:04 -0500
Received: from mail-ot1-f67.google.com ([209.85.210.67]:39049 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732371AbfAKTcE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 11 Jan 2019 14:32:04 -0500
Received: by mail-ot1-f67.google.com with SMTP id n8so14120830otl.6;
        Fri, 11 Jan 2019 11:32:03 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=V0W2PjXbgYdTSjRjbwVyVPKyXHLoEjG/vLmUxXHD6X4=;
        b=ZmOEZdzobZ51tMRvfRh7MBOfH2jZ24uJp26KCA+AKlHquWt4yY635JTe6XxNJMt+rS
         lEdiQbRIL0upOihyRMsxnIufjz00yc6pwIY/x//iBlcPYuVwXx/S7Sw+3kyuuEqyiXYA
         v/xtNLmAORBpXtK8nRuxeBnKUcJlCWysuAAe3poSAuU+Je+LxS1pbbjJItLf3Ex/xiS+
         jkcquZ3R12HMARfCNlulDi72uDPyAk0OjrAjiKT14zCv2C0vfd0N/4SnbrGg8snpeeIR
         jlH8sgSpsAOH4plQy9rJxnMSc1u41hX7mMy1O26bKqezFSo5KsIxNE2ZhvQX32ScDqWW
         NaEw==
X-Gm-Message-State: AJcUukc0EgIh2h2j1R/rr+3QBcTwuPMSynmemLviDcPjU8e1EYTXOyMf
        aqIyxAM8YzwmWBvjPBhdoA==
X-Google-Smtp-Source: ALg8bN6WQImHQo+GfG9Jdk6TNTqLFZfvBf6+Bd+tZ3jor0crk9hCgNeWppVXg29Xj929wujzz/v9iQ==
X-Received: by 2002:a9d:2c65:: with SMTP id f92mr10586942otb.18.1547235123480;
        Fri, 11 Jan 2019 11:32:03 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id m131sm34930866oia.6.2019.01.11.11.32.02
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 11 Jan 2019 11:32:02 -0800 (PST)
Date:   Fri, 11 Jan 2019 13:32:02 -0600
From:   Rob Herring <robh@kernel.org>
To:     Joseph Lo <josephl@nvidia.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org,
        Joseph Lo <josephl@nvidia.com>
Subject: Re: [PATCH V4 01/20] dt-bindings: clock: tegra124-dfll: Update DFLL
 binding for PWM regulator
Message-ID: <20190111193202.GA23016@bogus>
References: <20190104030702.8684-1-josephl@nvidia.com>
 <20190104030702.8684-2-josephl@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190104030702.8684-2-josephl@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 4 Jan 2019 11:06:43 +0800, Joseph Lo wrote:
> From: Peter De Schrijver <pdeschrijver@nvidia.com>
> 
> Add new properties to configure the DFLL PWM regulator support.
> 
> Cc: devicetree@vger.kernel.org
> Signed-off-by: Peter De Schrijver <pdeschrijver@nvidia.com>
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> Acked-by: Jon Hunter <jonathanh@nvidia.com>
> ---
> *V4:
>  - s/nvidia,pwm-period/nvidia,pwm-period-nanoseconds/
> *V3:
>  - no change
> *V2:
>  - update the binding strings and descriptions for
>  nvidia,pwm-tristate-microvolts
>  nvidia,pwm-min-microvolts
>  nvidia,pwm-voltage-step-microvolts
> ---
>  .../bindings/clock/nvidia,tegra124-dfll.txt   | 79 ++++++++++++++++++-
>  1 file changed, 77 insertions(+), 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
