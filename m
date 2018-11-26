Return-Path: <SRS0=+J6A=OF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFFB1C43441
	for <linux-clk@archiver.kernel.org>; Mon, 26 Nov 2018 17:20:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9A32320672
	for <linux-clk@archiver.kernel.org>; Mon, 26 Nov 2018 17:20:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="kknfH4+Q";
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=codeaurora.org header.i=@codeaurora.org header.b="GM6adDwo"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 9A32320672
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726639AbeK0EPW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 26 Nov 2018 23:15:22 -0500
Received: from smtp.codeaurora.org ([198.145.29.96]:57208 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbeK0EPV (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 26 Nov 2018 23:15:21 -0500
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 430B660B0D; Mon, 26 Nov 2018 17:20:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1543252836;
        bh=kHpTPCKi8DFMImxboC+vK+QPA+HRz4I7in+ceZLvddU=;
        h=From:To:Cc:Subject:Date:From;
        b=kknfH4+Qd52YbaC5yuhJ1s9piYLcHAviHcHG2z0bI9IX/xoZqeHGldP4B/zG/Za00
         td9iJYfSJ9/L6sOq81oeHYwl3UqLvrVlRlOfFXQv0niY6XtKozy3U07EfiqTnGmzg5
         UwurrlFljK3tGgIY1U0NSkr9fug4iZ1VjTE/zAtM=
Received: from jcrouse-lnx.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: jcrouse@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id ABF7960392;
        Mon, 26 Nov 2018 17:20:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1543252835;
        bh=kHpTPCKi8DFMImxboC+vK+QPA+HRz4I7in+ceZLvddU=;
        h=From:To:Cc:Subject:Date:From;
        b=GM6adDwoG0w0+nbiecN8EnVhfbeghZBY7J8cR7S/cbGFa057Q+KY6a+o7z++qB+rU
         opzf2I07vi0xLCd/om2/NvcI/JG/SS/dhFeX4rpt0x3J3jAwnnkwwRZKpoDdAeDMzf
         UK6Cxh7dsyIgi/sl0qSaZDqtMSwz3k0RPxYxuIL0=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org ABF7960392
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=jcrouse@codeaurora.org
From:   Jordan Crouse <jcrouse@codeaurora.org>
To:     sboyd@kernel.org, mturquette@baylibre.com
Cc:     andy.gross@linaro.org, david.brown@linaro.org,
        rnayak@codeaurora.org, okukatla@codeaurora.org,
        tdas@codeaurora.org, linux-arm-msm@vger.kernel.org,
        linux-soc@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH v2 0/2] clk: qcom: Support special behavior for SDM845 gpucc 
Date:   Mon, 26 Nov 2018 10:20:30 -0700
Message-Id: <20181126172032.11567-1-jcrouse@codeaurora.org>
X-Mailer: git-send-email 2.18.0
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

(Resend with a proper email subject)

The GPU GX domain on SDM845 is nominally managed by the GMU microcontroller
but there are certain circumstances when the CPU needs to be sure that the
GX headswitch is off.

This series modifies the GPU GX domain on SDM845 to use a dummy enable
function (leaving the GMU hardware to handle the power on) and the
default disable function to allow the CPU to ensure that the power is off.

With these changes we can attach the domain to the GMU device and control
it from the start up and shut down functions as implemented by [2].

This patchset is based on the core GPU clock support from [1].

[1] https://patchwork.kernel.org/patch/10696671/
[2] https://patchwork.freedesktop.org/patch/262765/

v2: Rebase on the latest from Taniya and remove the GPU functions to make
it easier to apply to the clock tree.

Jordan Crouse (2):
  clk: qcom: gdsc: Don't override existing gdsc pd functions
  clk: qcom: Add a dummy enable function for GX gdsc

 drivers/clk/qcom/gdsc.c         |  6 ++++--
 drivers/clk/qcom/gpucc-sdm845.c | 26 ++++++++++++++++++++++++++
 2 files changed, 30 insertions(+), 2 deletions(-)

-- 
2.18.0

