Return-Path: <SRS0=WJPE=YK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A5C0FA3728
	for <linux-clk@archiver.kernel.org>; Thu, 17 Oct 2019 02:33:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0E83221925
	for <linux-clk@archiver.kernel.org>; Thu, 17 Oct 2019 02:33:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RB6eP77b"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392030AbfJQCdM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 16 Oct 2019 22:33:12 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:40551 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390240AbfJQCdM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 16 Oct 2019 22:33:12 -0400
Received: by mail-pf1-f196.google.com with SMTP id x127so598347pfb.7
        for <linux-clk@vger.kernel.org>; Wed, 16 Oct 2019 19:33:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=4bXHZivjXNK83YyR7o8F04xtApnhmtFO8YTPizBGIv0=;
        b=RB6eP77bcKvMpl4jlon+UoQHLyGkd7FE6lazP/PctVFclQtYZrpbQKrwaVGxUE1gcJ
         rSVT7+eiZQhILoAzSN66jRjEtOJ4W2wvhDAnfX2ntjDZi8pIEz+HalbDfulJsTOaKHBB
         w7iLuQV8S0OnF6DBnV8JE2TRqvDTjbya6FWXyF6M+taD1UmkxBDHgq4iySOXCpCyL5/m
         e7rWHBiF8qGAiytQlphKHQeDXZhi6qKYmguhf8d4vT7U9a2Qh0z7+1I8SnNaxHTTrXc8
         5ZWdy5JGXSDbTh3HWDH6oDwRgzBJaHRvNX+96He0N7oKaMUA9MWBpFRazrt+RctIeFAJ
         v/Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=4bXHZivjXNK83YyR7o8F04xtApnhmtFO8YTPizBGIv0=;
        b=CAsP8ktO3JrpBFwVcsdMyEwr5DH79QJDqgo4IQDQufTPA1c582VpcJAsIp+bzhARuz
         vEwt/MP5UiZvKGUKcLKInRtx0LxXiXAcPIaR5kaEWzfvlS7Wryz/Cs6rcVTbmqtKjPir
         8VLMenhFPUX5T9C8aFm8XpioLX/2HIYdRNQGJLGzSigPHZw5L/Qc6iOrEA/FQgV1K73O
         DdQ8EAVavAm7xL0RTHjBBLX1865kdLKEpYccsxDwpsasZzqRnHZeb79OvlphROqZCtZM
         Lw2ZpVREdlBTjzohY+4roA4eiqJz5PzEOo64KcyOu9ChF2fnixkIMga/8UGW3qnAHyln
         3r7A==
X-Gm-Message-State: APjAAAW73I1twV9/xEKLqzy0GLxuugLgAgyC0g7RnlqijFzjDcx7f6ON
        Fq304eDROfBE9YecYOe2w5Ee3g==
X-Google-Smtp-Source: APXvYqwOiOjdMpZ9PniBll51OsUaQTGs9EQrfZvMw/G810VOXNE+j54FHqXnu60/BSBiobzjVpt1gQ==
X-Received: by 2002:aa7:970b:: with SMTP id a11mr949497pfg.37.1571279591767;
        Wed, 16 Oct 2019 19:33:11 -0700 (PDT)
Received: from localhost ([122.172.151.112])
        by smtp.gmail.com with ESMTPSA id s18sm462898pji.30.2019.10.16.19.33.10
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 16 Oct 2019 19:33:10 -0700 (PDT)
Date:   Thu, 17 Oct 2019 08:03:08 +0530
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
Subject: Re: [PATCH v1 12/17] ARM: dts: tegra30: Add CPU Operating
 Performance Points
Message-ID: <20191017023308.se5odhmg2hru4vji@vireshk-i7>
References: <20191015211618.20758-1-digetx@gmail.com>
 <20191015211618.20758-13-digetx@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20191015211618.20758-13-digetx@gmail.com>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 16-10-19, 00:16, Dmitry Osipenko wrote:
> Operating Point are specified per HW version. The OPP voltages are kept
> in a separate DTSI file because some boards may not define CPU regulator
> in their device-tree if voltage scaling isn't necessary for them.
> 
> Signed-off-by: Dmitry Osipenko <digetx@gmail.com>
> ---
>  .../boot/dts/tegra30-cpu-opp-microvolt.dtsi   |  801 +++++++++++
>  arch/arm/boot/dts/tegra30-cpu-opp.dtsi        | 1202 +++++++++++++++++
>  2 files changed, 2003 insertions(+)
>  create mode 100644 arch/arm/boot/dts/tegra30-cpu-opp-microvolt.dtsi
>  create mode 100644 arch/arm/boot/dts/tegra30-cpu-opp.dtsi

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
