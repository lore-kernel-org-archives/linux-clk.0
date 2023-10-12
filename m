Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C885FCDB47E
	for <linux-clk@archiver.kernel.org>; Thu, 12 Oct 2023 03:42:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234100AbjJLDms (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Oct 2023 23:42:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234050AbjJLDmr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Oct 2023 23:42:47 -0400
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 52F90B8
        for <linux-clk@vger.kernel.org>; Wed, 11 Oct 2023 20:42:45 -0700 (PDT)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1c9b7c234a7so4780905ad.3
        for <linux-clk@vger.kernel.org>; Wed, 11 Oct 2023 20:42:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1697082165; x=1697686965; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7nADTi8p/TYCcFoqwy7wIdRGyUAvcVuWu1MGhn66nEA=;
        b=Qe8o0U3g4ZajNWQpqJrfqnjeVRhtgFz6SqZYXAmyUP4UibufYVfyoIK9ilgZwlhD9C
         /ivgEKBq/VazLMpAhhHa+Ev5i0JNpM1/nJzerAN/59/lOxEju7bP8k3J69RvO5g2yOfO
         ads1hoMxg2yMiL8+qUCalIizd3iH5LhTrGdU4il+F9UcCcC0eRXgkbXGiBX6eaVOY27A
         AI8iB2Bxb7XyTIjDgAvUaxVLw8eoFsmGD0YkT4cU7AZGQ4JMdL6ictFitGZIvpZbYzEE
         6eClqQ7XggtjlsHVwGNIqLYLhBq95Dbh6Z2dff6XX4FmsEBu/rNEOdz5LNI7uTZT/4CU
         4Asw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697082165; x=1697686965;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7nADTi8p/TYCcFoqwy7wIdRGyUAvcVuWu1MGhn66nEA=;
        b=nx2l9TVsStP/WEx0zCi8n+HtxsqaV9Tl9dCyujY7nkDXUnxkljeDEWP0k+DN27XQ+n
         lniwstK1s7hzkHiJKGl8J+r5NJUzabHnuXYxCb8PARkWaKDlVWxz3nFw5yxy6bVbN/rU
         tK04qyzlLtTTqqIIJrDB3dlWqrepAFGatALC0AvvAN1GuNxY7majf/kOUAkoO4F0hH61
         vZHs+Zn+bww5jLmdzX7ZKjTTLF4k5w/hNcz8jWdUwZPqy/MSzvM9vlAIBDoIfqjkMbL7
         Nn2gf/WBdR2THly/muhzOkpCs1HHFzkkpsjLlwME0GcvqGdr7tEK6NENfXdirkNL+m21
         EVAQ==
X-Gm-Message-State: AOJu0Yzxv5MvKRkxtO4mXFM5mJgGLNLsql3m3eKDbfSpJjceCGKnkJ7j
        kTccA/iTEUHfmJgLtci9WiLBBw==
X-Google-Smtp-Source: AGHT+IH5vhqHicRELepcn9OOPQFFmVMWymakQt2rn9zy2Upu2MiP4JWmXB4wVeUfWQoNqfdb5giMlw==
X-Received: by 2002:a17:903:810:b0:1c9:e257:f88 with SMTP id kr16-20020a170903081000b001c9e2570f88mr108445plb.10.1697082164766;
        Wed, 11 Oct 2023 20:42:44 -0700 (PDT)
Received: from localhost ([122.172.80.14])
        by smtp.gmail.com with ESMTPSA id p6-20020a170902e74600b001c9c5a1b477sm685950plf.169.2023.10.11.20.42.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Oct 2023 20:42:44 -0700 (PDT)
Date:   Thu, 12 Oct 2023 09:12:41 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Ilia Lin <ilia.lin@kernel.org>,
        Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Georgi Djakov <djakov@kernel.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-clk@vger.kernel.org,
        Christian Marangi <ansuelsmth@gmail.com>,
        Stephan Gerhold <stephan@gerhold.net>
Subject: Re: [PATCH v5 0/6] cpufreq: qcom-nvmem: support apq8064 cpufreq
 scaling
Message-ID: <20231012034241.jwtsq22w2lwzfbvn@vireshk-i7>
References: <20231002185940.1271800-1-dmitry.baryshkov@linaro.org>
 <20231010063235.rj2ehxugtjr5x2xr@vireshk-i7>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20231010063235.rj2ehxugtjr5x2xr@vireshk-i7>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 10-10-23, 12:02, Viresh Kumar wrote:
> On 02-10-23, 21:59, Dmitry Baryshkov wrote:
> > This is a split of APQ8064 cpufreq series, as requested by Viresh. This
> > series includes only opp and cpufreq parts, with the DT and soc parts
> > being split to a separate patchset.
> > 
> > Each core has independent power and frequency control. Additionally the
> > L2 cache is scaled to follow the CPU frequencies (failure to do so
> > results in strange semi-random crashes).
> > 
> > Core voltage is controlled through the SAW2 devices, one for each core.
> > The L2 has two regulators, vdd-mem and vdd-dig.
> > 
> > Changes since v4:
> > - Reordered variables in qcom_cpufreq_init() (Konrad)
> > - Fixed of_platform_device_create() error check (Konrad)
> > - Dropped unused ret variable in qcom_cpufreq_apq8064_name_version() (Konrad)
> 
> Applied. Thanks.

Since these are causing build issues, and it isn't entirely clear what's the
right approach for now, I have dropped the changes from my branch to avoid any
further issues. You don't need to resend these, lets finalize a solution and
then I can apply them again.

-- 
viresh
