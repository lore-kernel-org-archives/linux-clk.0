Return-Path: <SRS0=Q+FU=6H=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.2 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7EA4C5518C
	for <linux-clk@archiver.kernel.org>; Thu, 23 Apr 2020 02:06:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 99B512080D
	for <linux-clk@archiver.kernel.org>; Thu, 23 Apr 2020 02:06:10 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=nexus-software-ie.20150623.gappssmtp.com header.i=@nexus-software-ie.20150623.gappssmtp.com header.b="os394JnE"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726513AbgDWCGI (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 22 Apr 2020 22:06:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726398AbgDWCGH (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 22 Apr 2020 22:06:07 -0400
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5871FC03C1AE
        for <linux-clk@vger.kernel.org>; Wed, 22 Apr 2020 19:06:07 -0700 (PDT)
Received: by mail-wr1-x435.google.com with SMTP id d15so3323538wrx.3
        for <linux-clk@vger.kernel.org>; Wed, 22 Apr 2020 19:06:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexus-software-ie.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=A/9Q0gDEQk7SNMN/b68r58ICpmz+7X03N2hr6NiaoH8=;
        b=os394JnEZiB7hZzjCkNFjqIx1gf9N5AYKFKocDI3OSFTkfodOiJXYFYsfKLKpmaf4S
         JY6Lput0qZK8yke6lcP8CulzTaxZ6njBHxf6bbfXmwGDVjtmkLy4kABeMzrcIwTlyJH6
         Vf5RRHfJb1/uBnLE/jbKajIikW3ncK70q+zpBO8nzVPZTu3aVc33D1CGr6A+rGcV4YG1
         z1T/Xo6jKmkhmmXhBmz6UDm2dQYOZtLwI6YgQCZQrZiZzbb+92Q/H1Zg1Z+nb1ntJFaE
         A7KwHZCRz8UWwc63yPK9Qh9kiA1fMIfPNCltQiCmzFWPq9PdYf1iCJe6otPkPNbnCkK5
         OCKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=A/9Q0gDEQk7SNMN/b68r58ICpmz+7X03N2hr6NiaoH8=;
        b=NzSdBReqa8xC9LRqPjp89mCz8p/paPxR1v1Ww/h4Ok2b0bBCD8tggAK/Dlvy115jtZ
         5j3gwD0T9nLvJHDFQb58OC2jRm6Ff0Mb1XO7CpIC4QHhSUWkdMspKMBjT4n6HPT5heBG
         grL2nFBccwpQQcSg5DrpRdCxB5ChnVijLtAqffmyomYGz1SwyEBsAAtmEojOIHocZnkp
         wTmUIfOU2vY59AS/AxjVE1LGVsgmGWwcHbOz7SH7MzBurVWcdQZTFSpaeJ015skLI44X
         2xbTtY/+ervIjn7l0kos+Ai95GYWp1bsnSsHPk/JBWFYipMxDFqNjrhUS8kRtue+9YMi
         ydwQ==
X-Gm-Message-State: AGi0PuYFFCxrVC37JQe7DYF54WRPGRXKhT2DX+VEY17nROOapUUBbwDV
        Av8CKUWEpnlWQY71uj8gFH0Wuw==
X-Google-Smtp-Source: APiQypLAiRsG0qCINhLGe1EpQJ0HHWcgW2S1wxioVrDAsZWOl/hXi+QT6wmWP4U2nP4U4P4Nmx6KeQ==
X-Received: by 2002:a5d:690a:: with SMTP id t10mr2096175wru.225.1587607566043;
        Wed, 22 Apr 2020 19:06:06 -0700 (PDT)
Received: from [192.168.0.38] ([176.61.57.127])
        by smtp.gmail.com with ESMTPSA id c10sm1340584wru.48.2020.04.22.19.06.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Apr 2020 19:06:05 -0700 (PDT)
Subject: Re: [PATCH 3/3] clk: qcom: gcc-msm8939: Make silicon specific updates
 for msm8939
To:     Stephen Boyd <sboyd@kernel.org>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        agross@kernel.org, bjorn.andersson@linaro.org,
        mturquette@baylibre.com, robh+dt@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        shawn.guo@linaro.org, p.zabel@pengutronix.de
References: <20200419121808.440780-1-bryan.odonoghue@linaro.org>
 <20200419121808.440780-4-bryan.odonoghue@linaro.org>
 <158752417863.132238.13958544237045504884@swboyd.mtv.corp.google.com>
From:   Bryan O'Donoghue <pure.logic@nexus-software.ie>
Message-ID: <11c762c5-0dea-2696-a063-335387e25d1f@nexus-software.ie>
Date:   Thu, 23 Apr 2020 03:06:36 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <158752417863.132238.13958544237045504884@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Thanks for the review.

I think I've captured and implemented, all of what you said.

---
bod
