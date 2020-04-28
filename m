Return-Path: <SRS0=1QlQ=6M=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F864C83004
	for <linux-clk@archiver.kernel.org>; Tue, 28 Apr 2020 11:01:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C891206F0
	for <linux-clk@archiver.kernel.org>; Tue, 28 Apr 2020 11:01:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Fp6Rdy7X"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726345AbgD1LBc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Apr 2020 07:01:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57810 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726477AbgD1LBa (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Apr 2020 07:01:30 -0400
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com [IPv6:2607:f8b0:4864:20::642])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 918B4C03C1A9
        for <linux-clk@vger.kernel.org>; Tue, 28 Apr 2020 04:01:29 -0700 (PDT)
Received: by mail-pl1-x642.google.com with SMTP id h11so8212008plr.11
        for <linux-clk@vger.kernel.org>; Tue, 28 Apr 2020 04:01:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=ZECYmOh8GHeDtWKEVN9mB2cMfDA4CqdHy3DVPieFtU8=;
        b=Fp6Rdy7X/Au1Bogcm9JL1jp6M4qSLsYbzFhSC9yOg6l+3kkiXKIi8rdJl0lMmjYsMm
         q2eAMBXUdoiBgNdIcVvDdJtwn51TJIBDUoRmMmMRO65okmPBGBQnqa4N2mW34RVNy+NS
         /ExDJhJme0OTu0O+ThAbuwtuOn9QVCqcocS2OAbos64IX7v99N7dXsjYPfR94kImkQdL
         2C4SKfj5IHeZRVtrj9RCGzxPkrzc+ekNRHs9yMP7N2wdx0Z331vPSyXPvI3E7ud8GKzg
         HCR2Mo3MrY6wCTSX+YaHkiccIMPd/cE90wlzZDas+3LNmUPVv3C3TMpQqP+CqlpbyaYl
         Oc3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=ZECYmOh8GHeDtWKEVN9mB2cMfDA4CqdHy3DVPieFtU8=;
        b=CijDUYZ7UEXCpGf/4y37VuQrsna0WVhH45+RPCCNqe9K/SxCLe/q1Bs26J+ZW2DouT
         mCCGzakdNuahZGgxnlsvQZGoVnVqlMJw2v9cuBWoH5TA8LZf1teBhF7cZQ3j5H4sRT6j
         kg8mw8sU9YAbzIBcsEuuzuImYJlAotO391IyBRmKzgwXoTpp8QNz5/fwh/V32HNAyRYR
         +Q/6h+y5CTSLFaOTaDRD084MbKJqt0FgkKke4xGTapVekCH9zIhwoPS4iX2xcjvy+mI3
         o6nvGg3CfuQ+PoviNW5I9EIx+AVjY1ZKkIGMEFR2gt43OoN8edsqpddhJinzKIkIcbqN
         EQBQ==
X-Gm-Message-State: AGi0PuZDDVYTv2NvARIVqTjS+YG5FAGavv/aY7uceCVvY8FTXbyjChMT
        RGt7h5BaJjZcVbDJ2iZ0VaR9bA==
X-Google-Smtp-Source: APiQypKCUoSWq+WSJVcxTjVfaz6aX0BH3kxmg8S6JEc81aCuemoUOA0OgzndCgwVZlV3UAjOtj9NPQ==
X-Received: by 2002:a17:902:7793:: with SMTP id o19mr28241721pll.107.1588071688818;
        Tue, 28 Apr 2020 04:01:28 -0700 (PDT)
Received: from localhost ([122.171.118.46])
        by smtp.gmail.com with ESMTPSA id b24sm14158840pfi.4.2020.04.28.04.01.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 28 Apr 2020 04:01:28 -0700 (PDT)
Date:   Tue, 28 Apr 2020 16:31:25 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     rjw@rjwysocki.net, Mian Yousaf Kaukab <ykaukab@suse.de>
Cc:     linux-pm@vger.kernel.org, andy.tang@nxp.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, shawnguo@kernel.org, leoyang.li@nxp.com,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 1/2] cpufreq: qoriq: convert to a platform driver
Message-ID: <20200428110125.lobyrsbma6astfmq@vireshk-i7>
References: <20200421083000.16740-1-ykaukab@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200421083000.16740-1-ykaukab@suse.de>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21-04-20, 10:29, Mian Yousaf Kaukab wrote:
> The driver has to be manually loaded if it is built as a module. It
> is neither exporting MODULE_DEVICE_TABLE nor MODULE_ALIAS. Moreover,
> no platform-device is created (and thus no uevent is sent) for the
> clockgen nodes it depends on.
> 
> Convert the module to a platform driver with its own alias. Moreover,
> drop whitelisted SOCs. Platform device will be created only for the
> compatible platforms.
> 
> Reviewed-by: Yuantian Tang <andy.tang@nxp.com>
> Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> Signed-off-by: Mian Yousaf Kaukab <ykaukab@suse.de>
> ---
> v2:
>  +Rafael, Stephen, linux-clk
>  Add Reviewed-by and Acked-by tags
> 
>  drivers/cpufreq/qoriq-cpufreq.c | 76 ++++++++++++++++-------------------------
>  1 file changed, 29 insertions(+), 47 deletions(-)

@Rafael,

Though this looks to be PPC stuff, but it is used on both ARM and PPC. Do you
want to pick them up or should I do that ?

-- 
viresh
