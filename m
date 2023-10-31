Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A633C00142
	for <linux-clk@archiver.kernel.org>; Tue, 31 Oct 2023 08:44:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233257AbjJaIoS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 31 Oct 2023 04:44:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55590 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235617AbjJaIoP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 31 Oct 2023 04:44:15 -0400
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 486E2DA
        for <linux-clk@vger.kernel.org>; Tue, 31 Oct 2023 01:44:13 -0700 (PDT)
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-1c434c33ec0so41432065ad.3
        for <linux-clk@vger.kernel.org>; Tue, 31 Oct 2023 01:44:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1698741853; x=1699346653; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YZyTDgOu+Mk84MW1y8TY9+DV7jPCPdy2MJyiStmLRmc=;
        b=wteoQUuS/mcbK96HWeBn6VsU3LJA4ZC11ZPSxAQreZjuQcceCTeHStrIq22y1/4+c1
         7hAYNeK3kfNAxIcJBHED1JH+s3z/ECfnvDxHdRH0kCinE298Sv9wJg+/FWL9f13isKzS
         0C264Zy8PULh7zEEdgYeYUQcVE9ToFgqzNZf/1xUYCjc6PT/aB+u60F2z9gI8SFFQqBl
         r+QLTHs+5YFbPXtIIen7CQfJoEhEpVU5/Mgk9du6J+RgiGePrE7nUvioqR0ZCa4JR6Bz
         8Y5TBMsxHNc1XdzkIdS9vFTdDbdeMyuAmqAUAihYXwhlfAETkkeSygkwS8qQevfaSfKB
         mrBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698741853; x=1699346653;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YZyTDgOu+Mk84MW1y8TY9+DV7jPCPdy2MJyiStmLRmc=;
        b=hKkieS/wYAgvF5d2RkthHvsHyZ1nlVqXFumgtrjlYHl3kcM/xWjTE+if/ahwNbgOu8
         S7rtTCs2x5+5wXV30lKnBSQQk1CTm74svAxd7n0bpk/+q/h0Cxqfqr+sP5UQaksik3cU
         COPv1jpHQZo2lBJM994BSLKjbeM8cjl5V6+jdAeQk2ZttxKDPpBARcxc9PGRxrNZuF5Q
         or7axc73dKDnlITyoMwG1TTCOCE2bb5fxt99lHSNGkvjYyOPuAV9FiwsUkn7j/Wun9Yc
         gR6JK/u1UA6XgM6TDHJbrwewsi/h1gl/CvGXKUWxrItO7dZzAwQVn72OO/R72JD9tbPM
         TlaQ==
X-Gm-Message-State: AOJu0Yx0JOsCJab3NBxVQaUkHp3S6Ec9aCQI8Fxly7T47V8WSKD/+Mi7
        sA84Yh6ucwu2PF26+mrIz/tPnQ==
X-Google-Smtp-Source: AGHT+IE46TBsZ8WZ5WIF5n2a0wgB/ZoCaZ+M9uHGlPT7/gAOdKWxWCF6QOdyRyEewyBzqw8yxRCZYA==
X-Received: by 2002:a17:902:ab81:b0:1cc:e66:3732 with SMTP id f1-20020a170902ab8100b001cc0e663732mr8974222plr.19.1698741852707;
        Tue, 31 Oct 2023 01:44:12 -0700 (PDT)
Received: from localhost ([122.172.80.14])
        by smtp.gmail.com with ESMTPSA id 6-20020a170902c10600b001ca4c20003dsm812711pli.69.2023.10.31.01.44.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Oct 2023 01:44:11 -0700 (PDT)
Date:   Tue, 31 Oct 2023 14:14:09 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Varadarajan Narayanan <quic_varada@quicinc.com>
Cc:     agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        conor+dt@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        rafael@kernel.org, ilia.lin@kernel.org, sivaprak@codeaurora.org,
        quic_kathirav@quicinc.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v6 0/2] Enable cpufreq for IPQ5332 & IPQ9574
Message-ID: <20231031084409.x5kqcs4ubmd5jh47@vireshk-i7>
References: <cover.1698735972.git.quic_varada@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1698735972.git.quic_varada@quicinc.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 31-10-23, 12:41, Varadarajan Narayanan wrote:
> This patch series aims to enable cpufreq for IPQ5332 and IPQ9574.
> For IPQ5332, a minor enhancement to Stromer Plus ops and a safe
> source switch is needed before cpu freq can be enabled.
> 
> These are also included in this series. Posting this as a single
> series. Please let me know if this is not correct, will split in
> the subsequent revisions.
> 
> Passed the following DT related validations
> make W=1 ARCH=arm64 -j16 DT_CHECKER_FLAGS='-v -m' dt_binding_check DT_SCHEMA_FILES=qcom
> make W=1 ARCH=arm64 -j16 CHECK_DTBS=y DT_SCHEMA_FILES=qcom dtbs_check
> 
> For IPQ5332:
> ~~~~~~~~~~~
> 	* This patch series introduces stromer plus ops which
> 	  builds on stromer ops and implements a different
> 	  set_rate and determine_rate.
> 
> 	  A different set_rate is needed since stromer plus PLLs
> 	  do not support dynamic frequency scaling. To switch
> 	  between frequencies, we have to shut down the PLL,
> 	  configure the L and ALPHA values and turn on again. So
> 	  introduce the separate set of ops for Stromer Plus PLL.
> 
> 	* Update ipq_pll_stromer_plus to use clk_alpha_pll_stromer_plus_ops
> 	  instead of clk_alpha_pll_stromer_ops.
> 
> 	* Set 'l' value to a value that is supported on all SKUs.
> 
> 	* Provide safe source switch for a53pll
> 
> 	* Include IPQ5332 in cpufreq nvmem framework
> 
> 	* Add OPP details to device tree
> 
> For IPQ9574:
> ~~~~~~~~~~~
> 	* Include IPQ9574 in cpufreq nvmem framework
> 
> 	* Add OPP details to device tree
> 
> Removed 2 patches from V1 as they have been merged
> 	* dt-bindings: cpufreq: qcom-cpufreq-nvmem: document IPQ5332
> 	* dt-bindings: cpufreq: qcom-cpufreq-nvmem: document IPQ9574
> 
> v4:	Included a patch to fix 'kernel test robot' build error --
> 	https://lore.kernel.org/r/202310181650.g8THtfsm-lkp@intel.com/
> 
> v5:	Use devm_clk_notifier_register
> 	Merge IPQ53xx and IPQ95xx cases with APQ8096 for speed bin selection
> 	Add reviewed by tags
> 
> v6:	Except these 2 patches, rest have been merged...
> 	Rebased these to latest top as they don't apply cleanly
> 	(https://lore.kernel.org/linux-arm-msm/20231025062508.vccrmkem45p3fnwe@vireshk-i7/)
> 
> Varadarajan Narayanan (2):
>   cpufreq: qti: Enable cpufreq for ipq53xx
>   cpufreq: qti: Introduce cpufreq for ipq95xx
> 
>  drivers/cpufreq/cpufreq-dt-platdev.c |  2 ++
>  drivers/cpufreq/qcom-cpufreq-nvmem.c | 12 ++++++++++++
>  2 files changed, 14 insertions(+)

Applied. Thanks.

-- 
viresh
