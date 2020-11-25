Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6991FC56202
	for <linux-clk@archiver.kernel.org>; Wed, 25 Nov 2020 15:18:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0580820872
	for <linux-clk@archiver.kernel.org>; Wed, 25 Nov 2020 15:18:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wnaXLjuA";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="BHR3LFiq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730059AbgKYPSs (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 25 Nov 2020 10:18:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47414 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729482AbgKYPSs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 25 Nov 2020 10:18:48 -0500
Received: from galois.linutronix.de (Galois.linutronix.de [IPv6:2a0a:51c0:0:12e:550::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6654DC0613D4
        for <linux-clk@vger.kernel.org>; Wed, 25 Nov 2020 07:18:48 -0800 (PST)
Date:   Wed, 25 Nov 2020 16:18:44 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020; t=1606317526;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ibXsPtN+t5QQYf2LnjcT66AADui7CCUZD4U93wE9y90=;
        b=wnaXLjuArnASBXBI311FKXykInoikyqBp4sTklbOKbgzaSh03NqXd3S/3FAnEzEoezntR4
        VcqimYwFFisf01AajkOsrEikwIcUle4WNa6rVHDgu1dLfQtI7cZb20fjOs0t3H1XcuEnk4
        S7CW4GB9Khhz75jFcnyr7m7h4c9G1RSLwHRFV4vwSmleUj0+f3b52V0DZ88/YQ7LsU/Ict
        rQnSTA6ahDCpuvqS2CmzLji+FRRNaichjv52YOxPCXrP5JjWAeJk5BIKbGdw3VJY171+Y5
        bk60EKzQEo5bohQNLvQ+kSQWOxo+hi+Quh1ayWoCMCBIniCyHSDsS9PGXSxFVw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
        s=2020e; t=1606317526;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=ibXsPtN+t5QQYf2LnjcT66AADui7CCUZD4U93wE9y90=;
        b=BHR3LFiqIxg381lTfXENvp3SDQQQ8eiJC6euSTGDPuiORkYgFleJPi63ONn8zUeMCG49Ul
        l0vyWdaaVSAitGBA==
From:   Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To:     Dong Aisheng <aisheng.dong@nxp.com>
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-imx@nxp.com, sudipm.mukherjee@gmail.com, sboyd@kernel.org,
        shawnguo@kernel.org, dongas86@gmail.com
Subject: Re: [PATCH 1/1] clk: imx: scu: fix MXC_CLK_SCU module build break
Message-ID: <20201125151844.7vtr5curlhnnxiwg@linutronix.de>
References: <20201125105037.22079-1-aisheng.dong@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20201125105037.22079-1-aisheng.dong@nxp.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2020-11-25 18:50:37 [+0800], Dong Aisheng wrote:
> This issue can be reproduced by CONFIG_IMX_MBOX=m and CONFIG_MXC_CLK_SCU=m.
> It's caused by current Makefile can't support build clk-scu.o and
> clk-imx8qxp.o separately.
> "obj-$(CONFIG_MXC_CLK_SCU) += clk-imx-scu.o clk-imx-lpcg-scu.o
> clk-imx-scu-$(CONFIG_CLK_IMX8QXP) += clk-scu.o clk-imx8qxp.o"
> Only enable MXC_CLK_SCU while CLK_IMX8QXP not is meaningless and buggy.
> 
> This patch makes MXC_CLK_SCU to be invisible to users and can only be
> selected by CLK_IMX8QXP option to ensure they're built together.
> 
> Fixes: e0d0d4d86c766 ("clk: imx8qxp: Support building i.MX8QXP clock driver as module")
> Reported-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Dong Aisheng <aisheng.dong@nxp.com>

This works, thanks.

Acked-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Sebastian
