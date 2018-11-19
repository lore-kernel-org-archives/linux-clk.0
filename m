Return-Path: <SRS0=X/us=N6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D0EFC43441
	for <linux-clk@archiver.kernel.org>; Mon, 19 Nov 2018 23:47:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6381A2086A
	for <linux-clk@archiver.kernel.org>; Mon, 19 Nov 2018 23:47:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="Sfy42o83";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="muGL2LZO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 6381A2086A
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732111AbeKTKNU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 20 Nov 2018 05:13:20 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:54938 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726431AbeKTKNU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 20 Nov 2018 05:13:20 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 17A3160714; Mon, 19 Nov 2018 23:47:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1542671232;
        bh=lZyYkcaanvyJYqZ/5m1Fx0bQ2xjeHhLuT8D97jAQWXw=;
        h=From:To:Cc:Subject:Date:From;
        b=Sfy42o836Cyajegj8fLXzyUBkh/KqxyWMk653RrejVHoc2d1JcTrPT1aIHRNFsOL+
         cEY0bMrS5bHVi7ZcHZZSB5+WfNaPlQWG6n6r4RRdWvyFhHYXGri1xsXgFM6XaA7L7G
         HPvtavRixTZzApKzFWL+TA/+WkHlPXyQUDRyO7dg=
Received: from jcrouse-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 7529160714;
        Mon, 19 Nov 2018 23:47:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1542671231;
        bh=lZyYkcaanvyJYqZ/5m1Fx0bQ2xjeHhLuT8D97jAQWXw=;
        h=From:To:Cc:Subject:Date:From;
        b=muGL2LZOju4uvv5PX4L/kfxwD2gAXGSGqfD3mHnMf/MjiBAnEuYPSxsbX7bQo3CQ9
         WPtw8arnTvRL2mZi9NnUy9pJBhvgfMxeSus+sctwP2HTBcqKyZwobhvranqybPnTBr
         noXEe1BgpFnyLyj0PhUOKW4ZitacpLRXcyYB55bo=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 7529160714
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     sboyd@kernel.org, mturquette@baylibre.com
Cc:     andy.gross@linaro.org, david.brown@linaro.org,
        rnayak@codeaurora.org, okukatla@codeaurora.org,
        tdas@codeaurora.org, linux-arm-msm@vger.kernel.orgi,
        linux-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        robdclark@gmail.com, freedreno@lists.freedesktop.org
Subject: [RFC 0/4] msm: clk: Define a special power domain for SDM845 GX
Date:   Mon, 19 Nov 2018 16:47:02 -0700
Message-Id: <20181119234706.5821-1-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.18.0
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The GPU GX domain on SDM845 is nominally managed by the GMU microcontroller
but there are certain circumstances when the CPU needs to be sure that the
GX headswitch is off.

This RFC series adds a special modification for the GX power domain
that always returns success for domain power on and uses the default
gdsc functions for power down.

With this, we should be able to remove most of GX clocks from the gpucc
and have a relatively clean way of handling the hardware workaround.

This is based on the series from [1] with some slight changes for the
current for-next from Andy.

[1] https://patchwork.kernel.org/patch/10563887/

Jordan Crouse (4):
  drm/msm/a6xx: Remove unwanted regulator code
  clk: qcom: gdsc: Don't override existing gdsc pd functions
  clk: qcom: Add a dummy enable function for GX gdsc
  drm/msm/gpu: Attach to the GPU GX power domain

 drivers/clk/qcom/gdsc.c               |  6 ++--
 drivers/clk/qcom/gpucc-sdm845.c       | 30 ++++++++++++++++---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 43 ++++++++++++++++++++++++---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h |  4 +--
 4 files changed, 71 insertions(+), 12 deletions(-)

-- 
2.18.0

