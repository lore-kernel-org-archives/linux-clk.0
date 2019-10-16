Return-Path: <SRS0=uqeP=YJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.4 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D47DBECE58E
	for <linux-clk@archiver.kernel.org>; Wed, 16 Oct 2019 05:27:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AE1E62067D
	for <linux-clk@archiver.kernel.org>; Wed, 16 Oct 2019 05:27:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="YwMFAoU0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728270AbfJPF1T (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Oct 2019 01:27:19 -0400
Received: from mail-pg1-f193.google.com ([209.85.215.193]:45944 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727684AbfJPF1T (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Oct 2019 01:27:19 -0400
Received: by mail-pg1-f193.google.com with SMTP id r1so12369193pgj.12
        for <linux-clk@vger.kernel.org>; Tue, 15 Oct 2019 22:27:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=c+hURjTVo/aYLCfa/Hz0445uoq4DnBCPweYQaNg80RE=;
        b=YwMFAoU0heHyDD3IBl2x1cf1ZtcwEVCpkffQekoavrEeeW4lA1h7ksu5E+baEG875m
         /NQrOSXT5b6WEePqqi5KsA2ojc3RGJDXXkFUqDv9QW+u2IyGhO7DpJqzls4jo8vOztPn
         wFLEIdRAB9XNWMneT1KITqtxNPhB4hg7K2L2QLdA1TU/R58JNVLMeWyUz2Xg6BfhVK1B
         V2JoUByRubqBAg/2Q1oBbeFLTAPA4jyc6BXISrwjDmSxZ+fgUK8hJgIK0bSMjROSAgct
         qJ2c2Jk6LRa9rzSy1R+gQuKACuJOnHRUjAyifzTQJvo9dwZpYYbN8SVYPIH78QT7LjvX
         C72w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=c+hURjTVo/aYLCfa/Hz0445uoq4DnBCPweYQaNg80RE=;
        b=LcVAZtPGjAlCYNmwVd+WWGkstn19t09dWmDj24idOLlGURZoeoFXhOGNgTPHzmlmRi
         yPAcySww4mwZkvPqgMVHYBZslDbCHlXnblkQzWvhmypFKDc6PLThf11f2Sdw+0vJ6bXe
         0Yuui9kyjVh0W5g1qqPpLqFHjJlIUQjV+AZ8cPlkz2q5GDEGnePoK8BuwdaqnA82L9sC
         3v4Oz9IPbozBCRpOLeofClxsIwhdWiRohvy17bmXYunVGDtAkUpt0LyfpqLUb0n6Qsjb
         AG33on1dK0bDB9MXI26PyKpXAu12BuJbYeuqj87WGEdX1X3po4UgiwD6Kks3VN3s7YPZ
         ZKvA==
X-Gm-Message-State: APjAAAV8sRyAwiJMBbVtKkQMOW7n6lgBCHrvxsCQCQgf+7kB6T+ZYcVD
        ZItjNNbVvb6OcNLuzWkQ2ezc9w==
X-Google-Smtp-Source: APXvYqwrC2hWVKfaRMlzUy8HycPTVMe+xH1vrIClOSut973FStL2ZIohmrOuxo+UhtZHAyb3vUdqTg==
X-Received: by 2002:a63:4d61:: with SMTP id n33mr41993243pgl.158.1571203638688;
        Tue, 15 Oct 2019 22:27:18 -0700 (PDT)
Received: from localhost ([122.172.151.112])
        by smtp.gmail.com with ESMTPSA id x65sm18642216pgb.75.2019.10.15.22.27.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 15 Oct 2019 22:27:18 -0700 (PDT)
Date:   Wed, 16 Oct 2019 10:57:16 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Dmitry Osipenko <digetx@gmail.com>
Cc:     Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Prashant Gaikwad <pgaikwad@nvidia.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        Rob Herring <robh+dt@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Peter Geis <pgwipeout@gmail.com>,
        Nicolas Chauvet <kwizart@gmail.com>,
        Marcel Ziswiler <marcel.ziswiler@toradex.com>,
        linux-pm@vger.kernel.org, linux-tegra@vger.kernel.org,
        devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 00/17] NVIDIA Tegra20 CPUFreq driver major update
Message-ID: <20191016052716.yipztnpg7bcuzhfn@vireshk-i7>
References: <20191015211618.20758-1-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191015211618.20758-1-digetx@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16-10-19, 00:16, Dmitry Osipenko wrote:
> Hello,
> 
> This series moves intermediate-clk handling from tegra20-cpufreq into
> tegra-clk driver, this allows us to switch to generic cpufreq-dt driver
> which brings voltage scaling, per-hardware OPPs and Tegra30 support out
> of the box. All boards need to adopt CPU OPPs in their device-trees in
> order to get cpufreq support. This series adds OPPs only to selective
> boards because there is assumption in a current device-trees that CPU
> voltage is set for 1GHz freq and this won't work for those CPUs that
> can go over 1GHz and thus require voltage regulators to be set up for
> voltage scaling support (CC'ed Marcel for Toradex boards). We could
> probably add delete-node for OPPs over 1GHz if there are not actively
> maintained boards.

How do you want to get these patches merged ? Can I just pick the cpufreq bits
alone ?

-- 
viresh
