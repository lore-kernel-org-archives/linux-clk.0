Return-Path: <SRS0=sSu3=DY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02AC0C433E7
	for <linux-clk@archiver.kernel.org>; Sat, 17 Oct 2020 05:37:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C1E6A206E5
	for <linux-clk@archiver.kernel.org>; Sat, 17 Oct 2020 05:37:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602913048;
	bh=d7EFEjjiKLB+QQW+J2bNQ9y7o//QoL+XQws3HgblEQU=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:List-ID:From;
	b=hpPPFzQsl+Aae8XdoWh9jJX88cdwz0/kIlKEbXPq/75eC3/QaQjA6Cv/GlFGy7vcd
	 jXWYnoNlEcnY5v2uxLvAyN463a6TOztauMMQE9Vw/Lt8hMlafllByvjCXBbGGwK+Up
	 1kQSmbttBfJDZuvZIGjUs+GTz6tdQkcqRCgvcVHs=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2411494AbgJQFhY (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 17 Oct 2020 01:37:24 -0400
Received: from mail.kernel.org ([198.145.29.99]:43044 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2411478AbgJQFhW (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Sat, 17 Oct 2020 01:37:22 -0400
Received: from kernel.org (unknown [104.132.1.79])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 732CF20714;
        Sat, 17 Oct 2020 02:01:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602900096;
        bh=d7EFEjjiKLB+QQW+J2bNQ9y7o//QoL+XQws3HgblEQU=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=z+ZU3SrDwOJOC+B6oe70jp+xIdSPfci7uQdmzP3dbYiRqI3a5dLVnxM3v/1Jv+/GX
         EIJLDbJYA7XSXgK9s5vkRSV9YHiAQcqRNs9p6q84pdttZy3zABC0RoOLH2cW4nscke
         mdqmKqL0mXd2VrUJO45hVj/SPodHAAhfXiAyvius=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <160281818774.884498.11509417433655580732@swboyd.mtv.corp.google.com>
References: <20201014171259.v4.1.I4567b5e7e17bbb15ef063d447cb83fd43746cb18@changeid> <20201014171259.v4.3.Id0cc5d859e2422082a29a7909658932c857f5a81@changeid> <160281818774.884498.11509417433655580732@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH v4 3/3] clk: qcom: lpasscc-sc7180: Re-configure the PLL in case lost
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     David Brown <david.brown@linaro.org>, linux-soc@vger.kernel.org,
        Rajendra Nayak <rnayak@codeaurora.org>,
        Douglas Anderson <dianders@chromium.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
To:     Douglas Anderson <dianders@chromium.org>,
        Taniya Das <tdas@codeaurora.org>
Date:   Fri, 16 Oct 2020 19:01:35 -0700
Message-ID: <160290009516.884498.11234055455838582432@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Stephen Boyd (2020-10-15 20:16:27)
> Quoting Douglas Anderson (2020-10-14 17:13:29)
> > From: Taniya Das <tdas@codeaurora.org>
> >=20
> > In the case where the PLL configuration is lost, then the pm runtime
> > resume will reconfigure before usage.
>=20
> Taniya, this commit needs a lot more describing than one sentence. I see
> that the PLL's L value is reset at boot, but only once. That seems to be
> because the bootloader I have doesn't set bit 11 for the RETAIN_FF bit
> on the lpass_core_hm_gdsc. Once the gdsc is turned off the first time,
> the PLL settings are lost and the L val is reset to 0. That makes sense
> because RETAIN_FF isn't set. This also means the other register writes
> during probe are lost during the first suspend of the lpass core clk
> controller. Then when the GDSC is turned on the next time for this clk
> controller  being runtime resumed we will set the retain bit and then
> configure the PLL again. BTW, I see that runtime PM is called for this
> clk controller for all the clk operations. Maybe there should be some
> auto suspend timeout so that we're not toggling the gdsc constantly?
>=20
> I hacked up the GDSC code to set the bit at gdsc registration time and
> it seems to fix the problem I'm seeing (i.e. that the PLL is stuck,
> which should also be in the commit text here). When I try to set the bit
> in the bootloader though my kernel won't boot. I guess something is
> hanging the system if I enable the retain bit in the GDSC?
>=20

After hacking on this for some time it looks like we can apply this
patch instead and things are good. The first two patches in this series
look mostly good to me minus some nitpicks so please resend.

---8<---
diff --git a/drivers/clk/qcom/gdsc.c b/drivers/clk/qcom/gdsc.c
index 99834564bcc2..508c2901abfa 100644
--- a/drivers/clk/qcom/gdsc.c
+++ b/drivers/clk/qcom/gdsc.c
@@ -343,6 +343,14 @@ static int gdsc_init(struct gdsc *sc)
 	if ((sc->flags & VOTABLE) && on)
 		gdsc_enable(&sc->pd);
=20
+	/*
+	 * Make sure the retain bit is set if the GDSC is already on, otherwise
+	 * we end up turning off the GDSC and destroying all the register
+	 * contents that we thought we were saving.
+	 */
+	if ((sc->flags & RETAIN_FF_ENABLE) && on)
+		gdsc_retain_ff_on(sc);
+
 	/* If ALWAYS_ON GDSCs are not ON, turn them ON */
 	if (sc->flags & ALWAYS_ON) {
 		if (!on)
