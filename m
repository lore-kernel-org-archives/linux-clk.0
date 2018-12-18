Return-Path: <SRS0=G9W/=O3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4CC2C43387
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 15:45:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9ACD321873
	for <linux-clk@archiver.kernel.org>; Tue, 18 Dec 2018 15:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1545147929;
	bh=qe142LSa/+k2BZt4owmG9OU7jDdzkmz8PLGGosoKhlY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=gIF7Asnq941F6K5w/4Ajt5KnEe2c32d+fwjaqwzgzikklZLgHQ7kXIa5MWs0G27jh
	 LtPS1401uX/zsQfHK+4sNwSr36wKVmjGJQeOMFKYygNKmTSdabLjOukNg8pMoWMtsQ
	 MDlPRW8TED6fT+t3pMV+C7d5D4u5jv1V+szqCgVY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726826AbeLRPp3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Dec 2018 10:45:29 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:44471 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726611AbeLRPp3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Dec 2018 10:45:29 -0500
Received: by mail-oi1-f196.google.com with SMTP id m6so2262546oig.11;
        Tue, 18 Dec 2018 07:45:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=P1c3HYx5ykitYj5HFQVqTnZeodY+IhYr/IHNwbcVvAs=;
        b=Yt1H9wiXSv08blHzCIrEP4CwS1OIW3X4OBfRyVZrniWZUTJB4mS3EfAQRVbB7AtpR9
         1mz+xBpCRMUZlbiBAIU7QpgWbRnYhRC0JMYzOQX4zUn6LHST7N4xStKirn6Ic4wUio31
         YECcNDRSzg6My9TwjzqvkB67iie4qL893DmghUd/VoXB1vY6mWYzGHqfeP3UHWwckf3B
         TzM0Y2aCvebTypGLNPJR1On/q9REAIu43VjcVfk5TChKOxEll9W05vy+MnwKgbVkmYJr
         3rNb1Uu2wNFoCh6fEokYrzT4GO1bGP5S7khXTTyzdU0zAwx2CGQQDDfEw7HwoSUq0w8S
         LN6g==
X-Gm-Message-State: AA+aEWZPHitQHyQV1H2sldnij7YvJh+9zcB7KlftkeVFTSsnJ5HamHYr
        5JZcoqstHQXdhSsU7bJj7A==
X-Google-Smtp-Source: AFSGD/XfEiAQoMQ2RY62jQwDtM3eZMPZhjjQAqQG+Z8O5AqwN7e36ZN8FYy3bHw+E8QCcG1Hz3+aZw==
X-Received: by 2002:aca:4155:: with SMTP id o82mr8441157oia.172.1545147928415;
        Tue, 18 Dec 2018 07:45:28 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id q25sm9070525otg.70.2018.12.18.07.45.27
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 18 Dec 2018 07:45:27 -0800 (PST)
Date:   Tue, 18 Dec 2018 09:45:27 -0600
From:   Rob Herring <robh@kernel.org>
To:     Joseph Lo <josephl@nvidia.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org,
        linux-clk@vger.kernel.org, Joseph Lo <josephl@nvidia.com>,
        devicetree@vger.kernel.org
Subject: Re: [PATCH V3 03/20] dt-bindings: cpufreq: tegra124: remove
 vdd-cpu-supply from required properties
Message-ID: <20181218154527.GA24811@bogus>
References: <20181218091232.23532-1-josephl@nvidia.com>
 <20181218091232.23532-4-josephl@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181218091232.23532-4-josephl@nvidia.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, 18 Dec 2018 17:12:15 +0800, Joseph Lo wrote:
> The Tegra124 cpufreq driver works only with DFLL clock, which is a
> hardware-based frequency/voltage controller. The driver doesn't need to
> control the regulator itself. Hence remove that.
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
>  .../devicetree/bindings/cpufreq/nvidia,tegra124-cpufreq.txt     | 2 --
>  1 file changed, 2 deletions(-)
> 

Reviewed-by: Rob Herring <robh@kernel.org>
