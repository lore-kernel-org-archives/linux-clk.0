Return-Path: <SRS0=ceW6=AO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88AB8C433E1
	for <linux-clk@archiver.kernel.org>; Fri,  3 Jul 2020 19:32:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6BB3D2220D
	for <linux-clk@archiver.kernel.org>; Fri,  3 Jul 2020 19:32:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="uFw1mLwW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726368AbgGCTcy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 3 Jul 2020 15:32:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33310 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726236AbgGCTcy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 3 Jul 2020 15:32:54 -0400
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com [IPv6:2607:f8b0:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 431D6C061794
        for <linux-clk@vger.kernel.org>; Fri,  3 Jul 2020 12:32:53 -0700 (PDT)
Received: by mail-pg1-x542.google.com with SMTP id l63so15477185pge.12
        for <linux-clk@vger.kernel.org>; Fri, 03 Jul 2020 12:32:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=2taLmWWNNjj1mF92yMtzHSO+xe9tCS4WQEX49XNlnAQ=;
        b=uFw1mLwWI+Hit6Ill/sZEkMgERAvDmrlTfePPnC1yhEI2ZnLqkd1Pmee7503lbhib4
         sDiy8xSEYXDQne14emRREbgX1vbABPY/gK6DCe2PfIPeESBsRnCzcHu4+XsmSsjrky+N
         330hxUg2sYUYu1wBQg2a95RjD/1RkoSwhsVpl6rTISvBYWHGVpw7TxsDDgucMVlLeTRo
         bQJQv4RYsi6u2zoWMK015MsWbzL0f72Si4NR7V+R2dG2mp7IdrpjiIQ0MNJe/uFB1syc
         eReVruxShJOJsiVNoNtGjco79XVtXaThqUmy8wue2H46sHBWU1VznWV4UA8P8sXn97iz
         ooSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2taLmWWNNjj1mF92yMtzHSO+xe9tCS4WQEX49XNlnAQ=;
        b=nUBm1X5h9ZdoGTDPRgwpnpHlD+5d4FD8s01ZPoTrP8OUtLh3ppWO2MErTwPoIdmP3t
         is9jAG25xosLarPCvub6TfHy10+OgjXacUMSccPOEQMBElk7IrlxEOH8IcUzv3o8x5yG
         hsRbIHGmJWFsc4wf52lFzoaM0HCpTrCDXFr4F/QQlJkOvn15oqUIlJ1H6HqB7CzQrlVX
         bmaCmRSMjKzonXZYq8a82Z8hfLupSVduC00kbdU3839GY+f5sqhMsIX0I0Uuz8cHAXTx
         v6whplWw/sJLyw72gLUkT0MSCEoGZj0hbVbxq0jI9o5y1XR/KwfznC5Zu+n1qVFZJisF
         bJDA==
X-Gm-Message-State: AOAM530zOL9fYUzd18f3hRkPBjFZca20ypEJbABNLaxNTHaX7efqKhFS
        A+XDBQopZpCCQtxj1nFJImAb6Q==
X-Google-Smtp-Source: ABdhPJzqc1gcG1hcPKieH42pS4FKNj8RV8uRSUAQSYXaCYYsfmZWgC56rrNMBrJlWiR5K/gSkv0atw==
X-Received: by 2002:a65:64c5:: with SMTP id t5mr25451253pgv.28.1593804772720;
        Fri, 03 Jul 2020 12:32:52 -0700 (PDT)
Received: from ripper (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id o14sm5529494pjw.3.2020.07.03.12.32.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2020 12:32:51 -0700 (PDT)
Date:   Fri, 3 Jul 2020 12:33:24 -0700
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Loic Poulain <loic.poulain@linaro.org>
Cc:     sboyd@kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, amit.kucheria@linaro.org
Subject: Re: [PATCH v5 0/5] msm8996 CPU scaling support
Message-ID: <20200703193324.GA1814397@ripper>
References: <1593766185-16346-1-git-send-email-loic.poulain@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1593766185-16346-1-git-send-email-loic.poulain@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri 03 Jul 01:49 PDT 2020, Loic Poulain wrote:

> This series is a new tentative for adding MSM8996 CPU scaling support
> based on the previous Ilia's series, with some of the latest comments
> addressed.
> 
> This series has been tested with dragonboard-820c and cpufreq-bench.
> The CPU opps are limited to maximum nominal frequencies (no turbo).
> 

On the board where I usually see issues when we test CPUfreq I see a
sudden reboot right before getting a login prompt.

I did however conclude that disabling CPU2 and CPU3, so presumably
I'm running low on juice when we drive them to highest frequency.

I will do some more digging into this and see what's going on. With just
CPU0 and 1 enabled this seems to work really well though.

Regards,
Bjorn

> v2:
>     - Converted dt bindings to YAML
>     - Various fixes from Stephen inputs
>     - Removed useless wmb barrier, MODULE_ALIAS
>     - Use helpers like struct_size() and devm_platform_ioremap_resource()
>     - Coding style fixes + comments
>     - Kconfig: remove useless depends
>     - Added Co-developed-by tag
> 
> v3:
>     - Added Ilia and Rajendra s-o-b and contribution description
> 
> v4:
>     - Rebasing on master
>     - Removing obsolete cooling-min-level and cooling-max-level props
>     - Align cpu trip nodes names with other boards
>     - Fix trip types to passive for cpufreq
> 
> v5:
>     - Fix reported 0-DAY CI issues, read_cpuid_mpidr usage requires ARM64 conf
>     - Fix cpu_crit node labels
>     - Dedicated patch for speedbin node name change
>     - Added patch description for dtsi patch
> 
> Ilia Lin (2):
>   soc: qcom: Separate kryo l2 accessors from PMU driver
>   dt-bindings: clk: qcom: Add bindings for CPU clock for msm8996
> 
> Loic Poulain (3):
>   clk: qcom: Add CPU clock driver for msm8996
>   arch: arm64: dts: msm8996: Rename speedbin node
>   arch: arm64: dts: msm8996: Add CPU opps and thermal
> 
>  .../bindings/clock/qcom,msm8996-apcc.yaml          |  56 +++
>  arch/arm64/boot/dts/qcom/msm8996.dtsi              | 310 +++++++++++-
>  drivers/clk/qcom/Kconfig                           |   9 +
>  drivers/clk/qcom/Makefile                          |   1 +
>  drivers/clk/qcom/clk-alpha-pll.h                   |   6 +
>  drivers/clk/qcom/clk-cpu-8996.c                    | 538 +++++++++++++++++++++
>  drivers/perf/Kconfig                               |   1 +
>  drivers/perf/qcom_l2_pmu.c                         |  90 +---
>  drivers/soc/qcom/Kconfig                           |   4 +
>  drivers/soc/qcom/Makefile                          |   1 +
>  drivers/soc/qcom/kryo-l2-accessors.c               |  57 +++
>  include/soc/qcom/kryo-l2-accessors.h               |  12 +
>  12 files changed, 1012 insertions(+), 73 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/clock/qcom,msm8996-apcc.yaml
>  create mode 100644 drivers/clk/qcom/clk-cpu-8996.c
>  create mode 100644 drivers/soc/qcom/kryo-l2-accessors.c
>  create mode 100644 include/soc/qcom/kryo-l2-accessors.h
> 
> --
> 2.7.4
