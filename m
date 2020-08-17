Return-Path: <SRS0=dRGr=B3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.5 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 62DF7C433E1
	for <linux-clk@archiver.kernel.org>; Mon, 17 Aug 2020 19:36:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1824F20674
	for <linux-clk@archiver.kernel.org>; Mon, 17 Aug 2020 19:36:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="rRms8V5V"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392239AbgHQTf4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 17 Aug 2020 15:35:56 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.166]:32665 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730046AbgHQP3A (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 17 Aug 2020 11:29:00 -0400
X-Greylist: delayed 4770 seconds by postgrey-1.27 at vger.kernel.org; Mon, 17 Aug 2020 11:28:59 EDT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1597678136;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=rmU0cqhGNgttnoqa8dHivXxzkC4Lsq2IDnfo3KgUPZs=;
        b=rRms8V5VCp3JnALVaPDXeOx/k4PJcAg/9zIc66ky7UfXgn9kHOWAtsFPlYkoyoExo2
        BN2xJmMbeyrcJtMcMx63Ee2Bg2IH419ppbss3eeyqEwwRZnIckTGd4gGCuL2KX6wEnPr
        c+qPj46oNLkxeCMOozYTj2b0Vw/qbXGq5oO2ycksTePTRuceGMDj4/vVYJSamDEjAIev
        TvOZtlkH1OrYMGVngtWTc/u/TptunFuoKEcxY5a5Gb17Em7xhWuBEfsT+A+xyXmVSREA
        Pbfw4iA0qbuB+HJvqWQXeVfXodzSeAw7sd8eL2XJjVPgLQMPIU3IM03TtS8tGiiql2Qk
        ddjg==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j9IczHboo="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
        with ESMTPSA id Y0939ew7HFSsIfG
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Mon, 17 Aug 2020 17:28:54 +0200 (CEST)
Date:   Mon, 17 Aug 2020 17:28:48 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        MSM <linux-arm-msm@vger.kernel.org>, linux-clk@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH] clk: qcom: smd: Disable unused clocks
Message-ID: <20200817152848.GA836@gerhold.net>
References: <20200817140908.185976-1-stephan@gerhold.net>
 <CAOCk7Nq6CT5q_aXG2jZ2t5=3YKVKM4r=gSnJLJkVccpwyc3XnQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAOCk7Nq6CT5q_aXG2jZ2t5=3YKVKM4r=gSnJLJkVccpwyc3XnQ@mail.gmail.com>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, Aug 17, 2020 at 08:52:46AM -0600, Jeffrey Hugo wrote:
> > Overall I'm not entirely sure why we need to force all these clocks
> > on at all... But the downstream driver also seems to do it and the RPM
> > interface is barely documented, so I didn't feel comfortable changing it...
> 
> So essentially, when the clk framework goes through late init, and
> decides to turn off clocks that are not being used, it will also turn
> off these clocks?
> 

With this patch: yes.

> I think this is going to break other targets where other subsystems
> happen to rely on these sorts of votes from Linux inorder to run/boot
> (not saying it's a good thing, just that is how it is and since we
> can't change the FW on those....).
> 

As far as I can tell the behavior implemented in this patch (= force
clocks on during boot but disable them when unused) is the same on that
is used on the downstream kernel. Most FW is probably written with the
downstream kernel in mind, so I don't think this is going to cause trouble.

The only situation this patch could break something is if we forgot to
manage the clocks for one of the devices in mainline
(and implicitly relied on clk-smd-rpm to keep them always-on).

For example, one situation I checked is for WCNSS on MSM8916.
It seems to require RF_CLK2 to boot. However, this is already handled in
qcom_wcnss_iris.c where the clock is forced on until WCNSS is ready.

> I think this needs to be validated on every single qcom platform using
> this driver.
> 
> Also, out of curiosity, how are you validating that BB_CLK2 is
> actually off after this change?
> 

Since BB_CLK1/2 and RF_CLK1/2 are part of the PMIC (at least on MSM8916)
I used the regmap debugfs interface to read the clock registers
through SPMI from Linux.

From the "PM8916 Hardware Register Description" [1] I got the registers
mentioned in the table, e.g. for BB_CLK2:

0x5208: BB_CLK2_STATUS1
	BIT(7): CLK_OK (Indicates Hardware or Software enable and
			includes warmup delay)
		0x0: BBCLK_OFF
		0x1: BBCLK_ON

I read the registers from /sys/kernel/debug/regmap/0-00/registers:

Without this patch:
	5108: 80
	5208: 80
	5408: 80
	5508: 80

With this patch (and with clk-smd-rpm entirely disabled):
	5108: 80
	5208: 00
	5408: 00
	5508: 00

Stephan

[1]: https://developer.qualcomm.com/download/sd410/pm8916-hardware-register-description.pdf
