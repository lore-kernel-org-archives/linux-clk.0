Return-Path: <SRS0=GqaR=OA=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.3 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82DF8C43441
	for <linux-clk@archiver.kernel.org>; Wed, 21 Nov 2018 15:04:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4AC9F214F1
	for <linux-clk@archiver.kernel.org>; Wed, 21 Nov 2018 15:04:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="ROQNSrZ2";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="ROQNSrZ2"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 4AC9F214F1
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731078AbeKVBjf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 21 Nov 2018 20:39:35 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:49354 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730072AbeKVBje (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 21 Nov 2018 20:39:34 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id CA2886053B; Wed, 21 Nov 2018 15:04:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1542812686;
        bh=j4nZZmv4Geo6daN6FXfC9i4W+3vg5CaFElFH4GYUxpM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ROQNSrZ2alZ/ctiSfolOdHPlsM6kLG/GVCmk5yIB21kO1FBNEA32QihRfPMUPn4Z8
         rSOCulQt6L0AIGn1JQP5+/PiKnbWWUP9dgDXKDhQ13GMb5y4cCO/HPVT8EbYAp8ofa
         GDEwhjjZjKJXIXr0fLP9hqhg1Rr3g2qsBlIiSQ40=
Received: from jcrouse-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher DHE-RSA-AES128-SHA (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 44A676053B;
        Wed, 21 Nov 2018 15:04:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1542812686;
        bh=j4nZZmv4Geo6daN6FXfC9i4W+3vg5CaFElFH4GYUxpM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ROQNSrZ2alZ/ctiSfolOdHPlsM6kLG/GVCmk5yIB21kO1FBNEA32QihRfPMUPn4Z8
         rSOCulQt6L0AIGn1JQP5+/PiKnbWWUP9dgDXKDhQ13GMb5y4cCO/HPVT8EbYAp8ofa
         GDEwhjjZjKJXIXr0fLP9hqhg1Rr3g2qsBlIiSQ40=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 44A676053B
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
Date:   Wed, 21 Nov 2018 08:04:43 -0700
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     mturquette@baylibre.com, andy.gross@linaro.org,
        david.brown@linaro.org, rnayak@codeaurora.org,
        okukatla@codeaurora.org, tdas@codeaurora.org,
        linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        robdclark@gmail.com, freedreno@lists.freedesktop.org
Subject: Re: [RFC 0/4] msm: clk: Define a special power domain for SDM845 GX
Message-ID: <20181121150442.GI31792@jcrouse-lnx.qualcomm.com>
Mail-Followup-To: Stephen Boyd <sboyd@kernel.org>, mturquette@baylibre.com,
        andy.gross@linaro.org, david.brown@linaro.org,
        rnayak@codeaurora.org, okukatla@codeaurora.org, tdas@codeaurora.org,
        linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        robdclark@gmail.com, freedreno@lists.freedesktop.org
References: <20181119234706.5821-1-jcrouse@codeaurora.org>
 <154278725155.88331.15446251904707712061@swboyd.mtv.corp.google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <154278725155.88331.15446251904707712061@swboyd.mtv.corp.google.com>
User-Agent: Mutt/1.5.21 (2010-09-15)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Nov 21, 2018 at 12:00:51AM -0800, Stephen Boyd wrote:
> Quoting Jordan Crouse (2018-11-19 15:47:02)
> > The GPU GX domain on SDM845 is nominally managed by the GMU microcontroller
> > but there are certain circumstances when the CPU needs to be sure that the
> > GX headswitch is off.
> > 
> > This RFC series adds a special modification for the GX power domain
> > that always returns success for domain power on and uses the default
> > gdsc functions for power down.
> > 
> > With this, we should be able to remove most of GX clocks from the gpucc
> > and have a relatively clean way of handling the hardware workaround.
> > 
> > This is based on the series from [1] with some slight changes for the
> > current for-next from Andy.
> > 
> > [1] https://patchwork.kernel.org/patch/10563887/
> > 
> > Jordan Crouse (4):
> >   drm/msm/a6xx: Remove unwanted regulator code
> >   clk: qcom: gdsc: Don't override existing gdsc pd functions
> >   clk: qcom: Add a dummy enable function for GX gdsc
> >   drm/msm/gpu: Attach to the GPU GX power domain
> 
> The clk bits look good to me, and would simplify the gpucc patches
> sitting on the list. Can we roll those into or on top of the GPU clk
> driver patches and split them from the GPU driver parts? I think the DTS
> will be blocked on everything coming together, so it should be OK to let
> the DTS bits come in and meet up with drm bits and clk bits all from
> different trees.

AFAIK Taniya is working on a new rev of the clock patches. We can either take
the two clk patches and roll/add on to that and I'll send the GPU patches
along with Rob (and possibly squash them as well).

Jordan
-- 
The Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project
