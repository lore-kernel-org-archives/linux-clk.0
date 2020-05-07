Return-Path: <SRS0=pUc3=6V=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3AE1EC38A24
	for <linux-clk@archiver.kernel.org>; Thu,  7 May 2020 05:18:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1A8082075E
	for <linux-clk@archiver.kernel.org>; Thu,  7 May 2020 05:18:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="slcpKIce"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726408AbgEGFSX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 7 May 2020 01:18:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-FAIL-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726393AbgEGFSW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 May 2020 01:18:22 -0400
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A70D9C061A10
        for <linux-clk@vger.kernel.org>; Wed,  6 May 2020 22:18:22 -0700 (PDT)
Received: by mail-pg1-x544.google.com with SMTP id n11so1984178pgl.9
        for <linux-clk@vger.kernel.org>; Wed, 06 May 2020 22:18:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=EjwpJVR1oS9DdS7pegxHcKxChjnzSaTIkyZTVhILaoo=;
        b=slcpKIceAq3cfjYgNr8Zhq1cKoLAoXXqoHotEAb2xiQ35kfA512G47MwpKhZXuM/7e
         CPnlmatcZzVIRfNzpy00KH25stfePubouqjpWYnEmzYbZ4ABGq0cZy3Nmuh7tvH2wUGL
         a5veNcqHV2kXAgW7D+G/lGfw7VAQcdJhiOQnGPFvP3w7C1vRRwMk7rCHjG23Uw3Q0w1u
         jBhgWVFKipZ/m5hr6AzK9WoqH9NgDiX0dGl4AWiRoCTXvB4aa07ZvnHrV99m3lGg3wsh
         //8wutcZlOEfr0/AnEAjs7Cc4yZV4yYPA2Db4R7sXaVoPjV+1d9BSXEk4soUalWD6wMI
         L1ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=EjwpJVR1oS9DdS7pegxHcKxChjnzSaTIkyZTVhILaoo=;
        b=d2an3laWSzRNQ07HSGGz3ghmbjBYckS75BTOqNKQ+JaCVIL4ctl6m1HI6hVi1jisdx
         AurREKllE6VvgRXG34ygW0cnvHdnNd0wD0QOPr9MJJhIy1SkIjKna7OQf5tkUk4URoKn
         YyxiMxDrVPDjR6pZ4DGgh+ygieHkOEN8jFkeEbUeOQrFB916zieuairnwqNzKP6k8FMs
         iKI4/pQGBW8OtUTEuRK5Lzg+9ZbHtYNPLN8grvoF3DFT2EP7jzGtTUii2bJ48g16bSp8
         6YXDdSXXZGqjVNUnFonw4Y/evwzlDm0WPKBPBBxx8FdZMX9EmHW068H43ZPv2/HCPtEj
         M0+w==
X-Gm-Message-State: AGi0Puae67+GCliRflOUNJUhkFtS/H+0UsFW68Ji9D+crrDKcSLmxfse
        hAOpAEtFQRvuGbfUOsWSl/Ua2A==
X-Google-Smtp-Source: APiQypIEmsP8B+EwGLQga6A4T0mFxXwfh7oJIQ8PZk2O+MdkKuUNTJ0xX+z5cnzD4HZ+G174irQzXg==
X-Received: by 2002:a62:3181:: with SMTP id x123mr11697759pfx.109.1588828701997;
        Wed, 06 May 2020 22:18:21 -0700 (PDT)
Received: from localhost ([122.171.118.46])
        by smtp.gmail.com with ESMTPSA id v127sm3499629pfv.77.2020.05.06.22.18.20
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 May 2020 22:18:21 -0700 (PDT)
Date:   Thu, 7 May 2020 10:48:18 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     rjw@rjwysocki.net, Mian Yousaf Kaukab <ykaukab@suse.de>
Cc:     linux-pm@vger.kernel.org, andy.tang@nxp.com, sboyd@kernel.org,
        linux-clk@vger.kernel.org, shawnguo@kernel.org, leoyang.li@nxp.com,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linuxppc-dev@lists.ozlabs.org
Subject: Re: [PATCH v2 1/2] cpufreq: qoriq: convert to a platform driver
Message-ID: <20200507051818.xi43yfusjktemd5r@vireshk-i7>
References: <20200421083000.16740-1-ykaukab@suse.de>
 <20200428110125.lobyrsbma6astfmq@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200428110125.lobyrsbma6astfmq@vireshk-i7>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 28-04-20, 16:31, Viresh Kumar wrote:
> On 21-04-20, 10:29, Mian Yousaf Kaukab wrote:
> > The driver has to be manually loaded if it is built as a module. It
> > is neither exporting MODULE_DEVICE_TABLE nor MODULE_ALIAS. Moreover,
> > no platform-device is created (and thus no uevent is sent) for the
> > clockgen nodes it depends on.
> > 
> > Convert the module to a platform driver with its own alias. Moreover,
> > drop whitelisted SOCs. Platform device will be created only for the
> > compatible platforms.
> > 
> > Reviewed-by: Yuantian Tang <andy.tang@nxp.com>
> > Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
> > Signed-off-by: Mian Yousaf Kaukab <ykaukab@suse.de>
> > ---
> > v2:
> >  +Rafael, Stephen, linux-clk
> >  Add Reviewed-by and Acked-by tags
> > 
> >  drivers/cpufreq/qoriq-cpufreq.c | 76 ++++++++++++++++-------------------------
> >  1 file changed, 29 insertions(+), 47 deletions(-)
> 
> @Rafael,
> 
> Though this looks to be PPC stuff, but it is used on both ARM and PPC. Do you
> want to pick them up or should I do that ?

Applied now. Thanks.

-- 
viresh
