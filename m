Return-Path: <SRS0=+6Yl=TJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,MAILING_LIST_MULTI,SPF_PASS,T_DKIMWL_WL_HIGH,USER_AGENT_MUTT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 30515C04AB1
	for <linux-clk@archiver.kernel.org>; Thu,  9 May 2019 12:51:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 02AC621744
	for <linux-clk@archiver.kernel.org>; Thu,  9 May 2019 12:51:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1557406306;
	bh=5Vi+tEKkp9VxJRyFwYeZI7OuxsJj4UPpv65iBZIJ/kU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=EBNs6cl0sJGt4pDCV2VwLsPDAWp2uLSVRJrTQ6Jhf5nu+Q72GcuIJfig/mcMTJ8Ep
	 FvVkgV6WJY1Es9vsurNU+0cnoTprtnQ8KFYyiDZMp60bB3Cvplk4jUpzWqwpHeNdhR
	 i7AjRDk0GOLRyDOygku3hx/+jmU38qiF8j/j8aw0=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726583AbfEIMvl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 9 May 2019 08:51:41 -0400
Received: from mail.kernel.org ([198.145.29.99]:50470 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726054AbfEIMvl (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 9 May 2019 08:51:41 -0400
Received: from localhost (unknown [106.200.210.185])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 0EEA421479;
        Thu,  9 May 2019 12:51:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1557406300;
        bh=5Vi+tEKkp9VxJRyFwYeZI7OuxsJj4UPpv65iBZIJ/kU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kbYedNbtek73Ryw7WZTAkNJt5ocKMKYDQTGYb95tyIAircFqXNRLinWK0eKaSnYoI
         XIHtHXjg26aFPx7LlHijIWlNJIfkxuanMYz8iaJ49YiOWZHRKijrHeOp26SLU+1ITH
         2c+/lKZDeLPbccYFdVajGF7Wot0rkwUuUDVdcEds=
Date:   Thu, 9 May 2019 18:21:35 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v4] clk: gcc-qcs404: Add PCIe resets
Message-ID: <20190509125135.GE16052@vkoul-mobl>
References: <20190508223922.5609-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190508223922.5609-1-bjorn.andersson@linaro.org>
User-Agent: Mutt/1.11.3 (2019-02-01)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 08-05-19, 15:39, Bjorn Andersson wrote:
> Enabling PCIe requires several of the PCIe related resets from GCC, so
> add them all.

Reviewed-by: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
