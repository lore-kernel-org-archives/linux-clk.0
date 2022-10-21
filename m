Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1BCE0C4332F
	for <linux-clk@archiver.kernel.org>; Fri, 21 Oct 2022 14:05:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231317AbiJUOFa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 21 Oct 2022 10:05:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38890 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231325AbiJUOFQ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 21 Oct 2022 10:05:16 -0400
Received: from new2-smtp.messagingengine.com (new2-smtp.messagingengine.com [66.111.4.224])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F5BDDEF09
        for <linux-clk@vger.kernel.org>; Fri, 21 Oct 2022 07:05:10 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailnew.nyi.internal (Postfix) with ESMTP id 7F08858069E;
        Fri, 21 Oct 2022 10:05:08 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 21 Oct 2022 10:05:08 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-type:date:date:from:from:in-reply-to:message-id
        :mime-version:reply-to:sender:subject:subject:to:to; s=fm3; t=
        1666361108; x=1666368308; bh=bQtXpkItrCTIfbcLeF85nyweBxDeD5mVZji
        0QAriNm4=; b=bXPK6Z10FrHP/OVRKfYmMLZb9GlPO1px9o5bbwItnp6ymYPIYIm
        IlbrfoAKCUXVh7KX1dCjWEylk3nxzjjcOr9zJGHc7p3GbbeoJcOi13iJdsOg0OBo
        aJCPKJOCqjDRoEC4u1TlK7wcAHdOa4fwgdA7PCMuKVr70q9INN0aYJFPNIiNs16E
        C7VDyoqDQVHFidY/QYgIDLKD1MgQEu5salL8usNdrPLvizk9b6tosBrkm37R3XGt
        mQpgpC5gkODmb2Qai09ZLuIA6YSzqP8+5vNzurWuebStuk65Hf/eGZQpxQ2OEtL5
        SjFccpGL2JkxBOwGz5KhRr8DBmepmj+gsJw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-type:date:date:feedback-id
        :feedback-id:from:from:in-reply-to:message-id:mime-version
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1666361108; x=
        1666368308; bh=bQtXpkItrCTIfbcLeF85nyweBxDeD5mVZji0QAriNm4=; b=g
        3siw2fnRVo7y6d52g1sX2QeFL8HkhGuC+NOzJa3seFNHTiK6GCcDbAHDdMu/VkY1
        Zhxf1osfEYCm5PMLNr8xNBljqhISom7BcBoZY/P7t/TnHGIpczFO4dAQ/yUXkqJq
        4jHpBVzRxXr3Pnlc4+s/Qi+5Gn/2UYl6/94odVO+jfwedMz2D0mTY34HqOxH42/e
        uuiws96MWa6VLZaGv8rMAnb7WGHbCYFdqsngF6nlPxAMGprcf4HuIX1NKuW927Hn
        EyLYUFyZbdAcH88VXoXnPcM1Gcx+fei9sJOz64c8u87KJHx5MGsoByFMnarOegQ4
        JRxfDZ344M7Wz0etV9v8Q==
X-ME-Sender: <xms:FKdSYztQz6kziZgMON081XJIzjedZmrZ9_fMZj3hIcMX-YGLRbQlSg>
    <xme:FKdSY0dHtPefi78KN_zF7T5AHhIKmEMkGIQmOaN8Xuxu92xDD5eYI64aac85aG-QT
    cZjSBIER5Yx-NVylt8>
X-ME-Received: <xmr:FKdSY2x7oK6chpni6vLjQmwjeJiYAvgUFO_1ohTGqeQqDYzQFgPU61O7Tz-5aO7VlbtxBKzawpOVKLnh49_kh60UAy5Qn0zYAfhp92fgAvKyJw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrfeelkedgjeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffvfevuffkgggtugesghdtreertddtvdenucfhrhhomhepmhgrgihimhgv
    segtvghrnhhordhtvggthhenucggtffrrghtthgvrhhnpeeuleetvdduffeuffdufeeihf
    dttdeludekfeejtdehtdekjeeiudffvdfgieejgfenucffohhmrghinhepkhgvrhhnvghl
    rdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:FKdSYyMBqz1xUaj0o01SiU13TCKo--GagvYixfPPCcUysyREvhnuXw>
    <xmx:FKdSYz-yXIfjG7IITEdNt_8DtUhZa8rENt2U6wf5QHvCdPRh6Q4-kw>
    <xmx:FKdSYyUbl1_xL8jBfe5sdZEwowhnVwkuwbCa4oNjFVUgAL50GGW32w>
    <xmx:FKdSY-eYIYoVyrkogPoPAWUM3nS3TBqjZqpSiN6jm12RRuaThyQu9w>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 21 Oct 2022 10:05:07 -0400 (EDT)
From:   maxime@cerno.tech
Date:   Fri, 21 Oct 2022 16:05:05 +0200
To:     Stefan Wahren <stefan.wahren@i2se.com>,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>, linux-clk@vger.kernel.org,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>
Subject: BCM2835 clock driver, power domains and CLK_SET_RATE_GATE
Message-ID: <20221021140505.kjmw5x4s6qhnrfif@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="ihghh7n2kocdeqfp"
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


--ihghh7n2kocdeqfp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

I had to fix a regression today that was mostly due to the fact that
clk-bcm2835 and clk-raspberrypi have fairly diverging behaviour.

https://lore.kernel.org/dri-devel/20221021131339.2203291-1-maxime@cerno.tech/

The "fix" is rather suboptimal and I'd like to address it properly.

Even though the commit message tries to explain everything and why other
solutions wouldn't work, the underlying cause is that clk-bcm2835 has a
bunch of restrictions that I don't really get and we have to work
around. I'm not sure I have the full picture either, so please take the
following with a grain of salt.

The first one is that the HSM clock discussed in that patch is part of
the HDMI power domain, so it has to be powered for the clock to retain
its configuration.

The side effect is that we need to initialize the clock at boot time so
that it has some rate. This is pretty important since that clock feeds
the register and thus a failure to initialize would lock the CPU on a
register access.

The second one is that since clk-bcm2835 has CLK_SET_RATE_GATE, we have
to call clk_set_min_rate() before clk_prepare_enable(), or
clk_set_min_rate() is likely to fail.

So we need in runtime_resume to call clk_set_min_rate with an absolute
minimum for the HDMI controller to be functional and then enable the
clock.

But then, since we have enabled the HSM clock by the time
pm_runtime_resume_and_get in vc4_hdmi_encoder_pre_crtc_configure()
returns, the clock is enabled so we can't adjust its rate based on the
resolution after the runtime_resume.

But if we do it before runtime_resume, then the clk_set_min_rate() call
in runtime_resume will override the "resolution rate" with the "absolute
minimum" rate.

Removing CLK_SET_RATE_GATE would solve this entirely, since we could
move the pre_crtc_configure clk_set_min_rate() call after
runtime_resume, and it would work just fine.

But the interaction with the power domain is weird to me. I'm not even
sure how it's even supposed to work if one has to disable the clock (and
its power domain?) to change the rate, but the configuration won't stick?

So I guess my question is how can we untangle this a bit so that we can
simplify the users of that driver?

Thanks!
Maxime

--ihghh7n2kocdeqfp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRcEzekXsqa64kGDp7j7w1vZxhRxQUCY1KnEQAKCRDj7w1vZxhR
xawsAP9iNQdKowVepzxWlYxBdfEIBIMczY7HWrgJJuWThlhMBQEA1N5uLfcVR3I5
enz802cxD7hTT4QiPOGAsuKQRuNQlA4=
=CDpp
-----END PGP SIGNATURE-----

--ihghh7n2kocdeqfp--
