Return-Path: <SRS0=cp6a=B4=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.6 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D1FDFC433E1
	for <linux-clk@archiver.kernel.org>; Tue, 18 Aug 2020 08:07:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7E0642075E
	for <linux-clk@archiver.kernel.org>; Tue, 18 Aug 2020 08:07:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=gerhold.net header.i=@gerhold.net header.b="mpjSzDdR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726273AbgHRIHt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 18 Aug 2020 04:07:49 -0400
Received: from mo4-p01-ob.smtp.rzone.de ([81.169.146.164]:27443 "EHLO
        mo4-p01-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbgHRIHs (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 18 Aug 2020 04:07:48 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; t=1597738066;
        s=strato-dkim-0002; d=gerhold.net;
        h=In-Reply-To:References:Message-ID:Subject:Cc:To:From:Date:
        X-RZG-CLASS-ID:X-RZG-AUTH:From:Subject:Sender;
        bh=Sa6jvtdPVGZ4UY44hxrbez3dnraoZ3qAJx2JS97LFqc=;
        b=mpjSzDdRvH0k1/laSfHU3+bjC/WNdEAPJxOd3cT921CpWZn83GKMIQOk21R0Yv+VML
        C9K5mxTqjbViVJONjcx6hJUfpL4FJk8TZJaC6cbn9uhb4RGwA9YaGbqTrrOz4Fp0e+CF
        9QU+St4aNtJApY2Llj5ezpdyB7DHuwcpW26w4mOq6BajNlZ66YZYuJQ7LlPhqzliOOUE
        AO0QS69wUc/Ju38ZgaZEihOTRtSoZh542IcAICzPGdCfFv0PwlAkGHG6YuYQnLjBq9+Y
        BUXTJGFBTvJbG7A6q9wU+WApEjdgRVkMj0VEDmo0DlI0CFg8o5XB9FYq+Em7k7I/PTgs
        szbw==
X-RZG-AUTH: ":P3gBZUipdd93FF5ZZvYFPugejmSTVR2nRPhVOQ/OcYgojyw4j34+u26zEodhPgRDZ8j7Ic/CaIo="
X-RZG-CLASS-ID: mo00
Received: from gerhold.net
        by smtp.strato.de (RZmta 46.10.5 DYNA|AUTH)
        with ESMTPSA id Y0939ew7I87iLnK
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256 bits))
        (Client did not present a certificate);
        Tue, 18 Aug 2020 10:07:44 +0200 (CEST)
Date:   Tue, 18 Aug 2020 10:07:38 +0200
From:   Stephan Gerhold <stephan@gerhold.net>
To:     Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Cc:     Stephen Boyd <sboyd@kernel.org>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        MSM <linux-arm-msm@vger.kernel.org>, linux-clk@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht,
        Georgi Djakov <georgi.djakov@linaro.org>
Subject: Re: [PATCH] clk: qcom: smd: Disable unused clocks
Message-ID: <20200818080738.GA46574@gerhold.net>
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

Hi Jeffrey,

On Mon, Aug 17, 2020 at 08:52:46AM -0600, Jeffrey Hugo wrote:
> So essentially, when the clk framework goes through late init, and
> decides to turn off clocks that are not being used, it will also turn
> off these clocks?
> 
> I think this is going to break other targets where other subsystems
> happen to rely on these sorts of votes from Linux inorder to run/boot
> (not saying it's a good thing, just that is how it is and since we
> can't change the FW on those....).
> 

After thinking about it some more I realized there are definitely some
of the clocks we shouldn't disable even when unused, for example the
interconnect clocks. With interconnect drivers disabled the system
basically locked up entirely once the clock core disabled the clocks.

For now I fixed this by marking all of DEFINE_CLK_SMD_RPM() as
CLK_IGNORE_UNUSED (essentially restoring the current behavior of the
driver). For MSM8916 these are exactly the interconnect clocks, but on
other platforms there are further clocks that might not need
CLK_IGNORE_UNUSED. This could be still optimized later.

> I think this needs to be validated on every single qcom platform using
> this driver.
> 

After running into the issue above I kind of agree with you. While
problems should be limited by marking the "rate" clocks as
CLK_IGNORE_UNUSED, it's also possible that one of the platforms requires
one of the branch clocks to stay on to boot successfully.

I know for sure that this works properly on MSM8916, so maybe I should
make it opt-in and then we add it for each platform after validating it?

Stephan
