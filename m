Return-Path: <SRS0=IRPH=3N=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68059C2D0DB
	for <linux-clk@archiver.kernel.org>; Fri, 24 Jan 2020 18:36:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3F56120702
	for <linux-clk@archiver.kernel.org>; Fri, 24 Jan 2020 18:36:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="F4lzXVrg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390067AbgAXSgB (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 24 Jan 2020 13:36:01 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:43968 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388219AbgAXSgA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 24 Jan 2020 13:36:00 -0500
Received: by mail-pf1-f195.google.com with SMTP id s1so918145pfh.10
        for <linux-clk@vger.kernel.org>; Fri, 24 Jan 2020 10:36:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=es1HFNP6d6J1y5y/BvGmobJ434uBsiCpqm6vXNISPn0=;
        b=F4lzXVrgB4GLH0Wx65kAQwaCgiW6sjXdx58Iy++TzFNPCqcEeBHxdTdycsDj96gd2e
         ODtZa+0B7jHpEmmC9rOWzRAmaoYXQUaluaDLPrSYdvRt6twmx+aFANssaYFX8USJ8O1q
         jHqMICwCBm6KrxdpHgmqPb+s4+cW/AKZfN3lpVeb0aQ30fldmbIgRPxAcM8oGc8fUKtc
         5VYhs3fe9TT/lcv4a+1UHWTwPa1tgEURdpsM0Rmnp/37LMuBP4iJ0LXYwOC/8NIR7esZ
         btfiTdB81qwL5SMZ15aB0lOBuNyOw2iw/Mqg4t61s3dY3+1T7rjwpsMD0z+SuE8I0/Zo
         IKHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=es1HFNP6d6J1y5y/BvGmobJ434uBsiCpqm6vXNISPn0=;
        b=fA1kjeTBn31tqB2ooWk1/GrcINbmTYhymQzild7xfBAiF/WRGHz2JDvhaYd5NkpYEK
         /lmUmtrl/IU5BuYCj0/d79jxvp9r1ctXGu7Nof9rg7fKs/AEq0CHSI1SsZ0q+B+Q66jy
         u+Rk6QO8ZD+OVMBBezIyRkujt8UvN3DRBkOxDXwR6pULvzjPoBcdpLOTSSMaxSCRaeZr
         qHvcIdnyNKvx8nxm8GdXMoRF1keSdDKXsLjZClmAuZ4QmQjAflWwf3hVIGQ49Xmtal9U
         VcN3mTFzVCKxzYf+3qP/d+CUv85D5kbOyL5NLxBC0e4FlIfzfm4De5qjXGXJ6KTSHUYH
         TsBg==
X-Gm-Message-State: APjAAAWOqTVAH1ATbPD+pM3aQ0UolTOzHJzD221CN53H8hX5rTkehgNr
        FrsjXB0s96kTzq4hKtVb3ukycg==
X-Google-Smtp-Source: APXvYqzMOQHT09l7caq1Rvn0weEhJy6amGhPNutUjMkBLG23pZB1sA/YLN84wwJicpAW62xfe81APA==
X-Received: by 2002:a63:5924:: with SMTP id n36mr5569946pgb.43.1579890960126;
        Fri, 24 Jan 2020 10:36:00 -0800 (PST)
Received: from ripper (104-188-17-28.lightspeed.sndgca.sbcglobal.net. [104.188.17.28])
        by smtp.gmail.com with ESMTPSA id b1sm7162421pjw.4.2020.01.24.10.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jan 2020 10:35:59 -0800 (PST)
Date:   Fri, 24 Jan 2020 10:35:25 -0800
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Venkata Narendra Kumar Gutta <vnkgutta@codeaurora.org>
Cc:     agross@kernel.org, mturquette@baylibre.com, sboyd@kernel.org,
        robh+dt@kernel.org, mark.rutland@arm.com, vinod.koul@linaro.org,
        psodagud@codeaurora.org, tsoni@codeaurora.org,
        jshriram@codeaurora.org, tdas@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6/7] clk: qcom: gcc: Add global clock controller driver
 for SM8250
Message-ID: <20200124183525.GW1908628@ripper>
References: <1579217994-22219-1-git-send-email-vnkgutta@codeaurora.org>
 <1579217994-22219-7-git-send-email-vnkgutta@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1579217994-22219-7-git-send-email-vnkgutta@codeaurora.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu 16 Jan 15:39 PST 2020, Venkata Narendra Kumar Gutta wrote:

> From: Taniya Das <tdas@codeaurora.org>
> 
> Add the clocks supported in global clock controller, which clock the
> peripherals like BLSPs, SDCC, USB, MDSS etc. Register all the clocks
> to the clock framework for the clients to be able to request for them.
> 

Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>

Regards,
Bjorn
