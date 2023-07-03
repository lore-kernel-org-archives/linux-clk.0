Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBC9BC0015E
	for <linux-clk@archiver.kernel.org>; Mon,  3 Jul 2023 04:39:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230004AbjGCEjN (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Jul 2023 00:39:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229950AbjGCEjI (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Jul 2023 00:39:08 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C7CDE41
        for <linux-clk@vger.kernel.org>; Sun,  2 Jul 2023 21:39:05 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id 98e67ed59e1d1-263036d4bc3so2952494a91.2
        for <linux-clk@vger.kernel.org>; Sun, 02 Jul 2023 21:39:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1688359144; x=1690951144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JQa+D3bKZ4O4X9M+/GDbUXDgSQgWey4zHBVp12A/tyI=;
        b=m+GgiZJMY2GS44/BQkwyMYFYMP51zz2ucUazeKUJ3BSo9w69Q2tXsgqxvb1neJ985S
         amGPFnsHQcwozrLn4ghLN4POCUVgLCA1DGJZeJOODZsIdEjaaKA5VvJ/gV2PmqNgbK3Q
         ed5D/YJQImyRQjc9tzIUA6ZyvPup8uEQjfrhE6n9ELnemPmwGiWdx1zY4bNx5m2Ediux
         J5uemWTK4i9hx3pD7zleltHrluZgpWVLkZ7pvjskPZeHqqj8brCQkjlMIbc1pKQVwe3y
         NKyW4IH+8ka/S9lG2ULnI8SiNlO3YU5GO1DDrr2iKVt64nnQxb+1+CLDwGVnOoyW8W0X
         Cc2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688359144; x=1690951144;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JQa+D3bKZ4O4X9M+/GDbUXDgSQgWey4zHBVp12A/tyI=;
        b=Cw+m1jCqjGuR8u+9efembuDyIYe8JiUZwuPjuNGAyCPLOBVcYO+k3x/VhzGjUsp59B
         lzlbx3BS9LiXexOnKsDlSjJpSi28/ZdkdzzHFlCvVtTDhjLYQWWZ23iVynJkkiG9dtk9
         GhiZwVlR7BHMb1BKbJBejequgUy10VMSnpT/4ITgogI2U+x0xnpLzRbG+nVGTmyXu/HX
         VuLFJK5uPslj/9NrvUtRn0h3wXF/G+IAcuLtQ+BorV8L8wDsM7DNIiJUKhTZF2nnOQAc
         Aszjl4t9ynWUwMBuI1VPIxvusdoNNeC0iIKqnoHYDebNMRwDayVjUSbmyzJGbJBSOCON
         IdZQ==
X-Gm-Message-State: ABy/qLYDhtilYJfmig88IBqdFtZvyrQmZpxGawpZ4mrpdKGcX4A6v9ZT
        KVEkE1s+HWtepj7+Hf3H5pZX1w==
X-Google-Smtp-Source: APBJJlGJAqDtdAlIcLY6/PXL/R2IWqlVaFJAmvBSHXphW5VbL7iECzu9LLaRZeY67AgChYrKFKR7OQ==
X-Received: by 2002:a17:90a:3d0d:b0:25b:ea12:a2f5 with SMTP id h13-20020a17090a3d0d00b0025bea12a2f5mr8671488pjc.35.1688359144365;
        Sun, 02 Jul 2023 21:39:04 -0700 (PDT)
Received: from localhost ([122.172.87.195])
        by smtp.gmail.com with ESMTPSA id lp15-20020a17090b4a8f00b00263d3448141sm118842pjb.8.2023.07.02.21.39.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Jul 2023 21:39:03 -0700 (PDT)
Date:   Mon, 3 Jul 2023 10:09:01 +0530
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
Subject: Re: [PATCH v3 00/28] ARM: qcom: apq8064: support CPU frequency
 scaling
Message-ID: <20230703043901.b4wvxgq3r2a6yijv@vireshk-i7>
References: <20230702174246.121656-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230702174246.121656-1-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 02-07-23, 20:42, Dmitry Baryshkov wrote:
> Implement CPUFreq support for one of the oldest supported Qualcomm
> platforms, APQ8064. Each core has independent power and frequency
> control. Additionally the L2 cache is scaled to follow the CPU
> frequencies (failure to do so results in strange semi-random crashes).
> 
> Core voltage is controlled through the SAW2 devices, one for each core.
> The L2 has two regulators, vdd-mem and vdd-dig.

Is it possible to send the cpufreq/opp patches separately so I can apply
directly ?

-- 
viresh
