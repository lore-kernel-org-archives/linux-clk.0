Return-Path: <SRS0=FIFX=IG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3995BC433DB
	for <linux-clk@archiver.kernel.org>; Mon,  8 Mar 2021 07:08:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E5ED6651F9
	for <linux-clk@archiver.kernel.org>; Mon,  8 Mar 2021 07:08:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230509AbhCHHHo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Mar 2021 02:07:44 -0500
Received: from mail.kernel.org ([198.145.29.99]:37308 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230250AbhCHHHX (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 8 Mar 2021 02:07:23 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 83F2364F96;
        Mon,  8 Mar 2021 07:07:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1615187243;
        bh=yRnC0M27VDXEb/P8FlGZ1DbXP6RghAiU5oL4zwk+HmE=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=GM9EjTEmA90TrS1y0HMy/FKvQSapah9JMcrVB6aQTHMM59jIfR+qWKS3gVR8egOEp
         d3VsSyKam1FJzpR3CgIB7LrPbqBfzrb25X0v/CxtH2qR/NhLHkiCBgwHPHyPQ+j2Ds
         HleW2E4BkqpB9qWh5FrPPB6LYgX3tYgvaZN31xXM=
Date:   Mon, 8 Mar 2021 08:07:20 +0100
From:   Greg KH <gregkh@linuxfoundation.org>
To:     zhengxunli@mxic.com.tw
Cc:     shubhrajyoti.datta@xilinx.com, devel@driverdev.osuosl.org,
        devicetree@vger.kernel.org, git@xilinx.com,
        linux-clk@vger.kernel.org, miquel.raynal@bootlin.com,
        mturquette@baylibre.com, robh+dt@kernel.org, sboyd@kernel.org,
        shubhrajyoti.datta@gmail.com, juliensu@mxic.com.tw,
        slwu@mxic.com.tw
Subject: Re: [PATCH v10 5/9] staging: clocking-wizard: Add support for
 dynamic reconfiguration
Message-ID: <YEXNKFQ0/rxit/Re@kroah.com>
References: <OF146ABDBB.F4474CC3-ON48258692.000D1A0C-48258692.00266ED2@mxic.com.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <OF146ABDBB.F4474CC3-ON48258692.000D1A0C-48258692.00266ED2@mxic.com.tw>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Mar 08, 2021 at 02:59:47PM +0800, zhengxunli@mxic.com.tw wrote:
> CONFIDENTIALITY NOTE:
> 
> This e-mail and any attachments may contain confidential information 
> and/or personal data, which is protected by applicable laws. Please be 
> reminded that duplication, disclosure, distribution, or use of this e-mail 
> (and/or its attachments) or any part thereof is prohibited. If you receive 
> this e-mail in error, please notify us immediately and delete this mail as 
> well as its attachment(s) from your system. In addition, please be 
> informed that collection, processing, and/or use of personal data is 
> prohibited unless expressly permitted by personal data protection laws. 
> Thank you for your attention and cooperation.

This footer is not compatible with Linux kernel development, sorry.
Message is now deleted.

greg k-h
