Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E46D3C4332F
	for <linux-clk@archiver.kernel.org>; Mon, 16 May 2022 13:26:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243768AbiEPN0Y (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 May 2022 09:26:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243615AbiEPNZz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 May 2022 09:25:55 -0400
Received: from wout2-smtp.messagingengine.com (wout2-smtp.messagingengine.com [64.147.123.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 149BC20C
        for <linux-clk@vger.kernel.org>; Mon, 16 May 2022 06:25:52 -0700 (PDT)
Received: from compute3.internal (compute3.nyi.internal [10.202.2.43])
        by mailout.west.internal (Postfix) with ESMTP id 66FAF320097F;
        Mon, 16 May 2022 09:25:50 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute3.internal (MEProxy); Mon, 16 May 2022 09:25:51 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1652707549; x=1652793949; bh=ja
        BTRgDVXHPrIehW7S2urwJixXuyalII1rgt7AU1Pu4=; b=tcgj4ocGbXAiI30QGD
        Gn8P+dFfWqlKGKpcVUpkV4bxuxHXaNVMUDD95WlhcUC0fDw1z9LlWBOXBAdEsksb
        yLfeQcIanz7hd+s3yZ+ky36+zyDC0u62LLbGcA/W7YxvjZgWVkuCJ+4+z5I4JNE7
        urzJaY4hJDWWTNJtwcT4fMoQX+oiZCW6hWJvIkeGyqnNakszTyGIPNHmma3LZmsM
        bgS67xGRxE2qJMFcU32eVST3yLLNWlh2Qx3mMUuVewYq//L0oelvnHr1VTIbrsVi
        OiWx6hqvaCWPNQgZL+AwyokMpLc54dzGF4lm9uoFE55KjXoBpi7dNm+rU9K+dXpo
        hRYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm1; t=
        1652707549; x=1652793949; bh=jaBTRgDVXHPrIehW7S2urwJixXuyalII1rg
        t7AU1Pu4=; b=KdR5HDztJhUEzuX5/7FuSTvLrmKKAK6i3k0FkjxD1AhUWEZVK0Y
        fPcmqB0jUYpWYByF/NhFfF0ohiXZ/8267C1bfV1r9EfMIn7abLe7w2uP+m9ey7Lx
        sAVe/qCYkQG2fbrq+2e3x7hGHZcA3m6URflew/1VqejFduHaASlPyCWSt8sqBB7S
        xP/WuJvO/OS/GF+ICOOgENSN01tS1Z0yqs3dQ/7WMjumDDQpRnpKvbVM/vIGVgXw
        pKClu5XX+aABrv0vDhdGFEWSEIL+jeS0Vuh6Tkwg1afdNe5IoZZrCUmEe521tK7r
        EgnylG6osH3aqH59b79fKj5UwQxUN3MBXlg==
X-ME-Sender: <xms:3VCCYpWkcky5QRxyiV320KMwWGNN5x950XLFjIBGS03TIOMeQkCYLg>
    <xme:3VCCYpkNAMTxcdGB4SmfixYbd2ofrQwjeBCNVywZjpNPfJmAP4L9Or97UP4vv0cEy
    bdbUCurVDebOVJ9d-o>
X-ME-Received: <xmr:3VCCYlaYqa42JfpWoy_HufQnRnyJAQ_MbQacqPhp4xHZ0UlZIFdaK7ybCzbro1moadKtsIqbMo49ypFWn18sJ27B3H67B_Y6X0E6qEo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrheehgdeivdcutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepleekfeetudfhkeejiefhtedugfeuvdevkeekteetkefhkefhtdelgfefuddv
    jefhnecuvehluhhsthgvrhfuihiivgepudenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:3VCCYsWMPgVmaQ-ZcKvM1A4lWkmDJRnrlEO4xj_uFFe09po8Ee6JhA>
    <xmx:3VCCYjmy-kVpXUXvi7KT6LwgPQC55JkHDXxFE5NWMyFTKXYav92N6g>
    <xmx:3VCCYpe0T0NwN7cap7UdBjIFpHiXGrduWBgxVXes7Em2Yh8nuRqCUQ>
    <xmx:3VCCYsdERmwC5db8Z8KoZN1BgWBYffBJwdRtOBFJwlv6Dkljpqt04A>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 16 May 2022 09:25:49 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     linux-clk@vger.kernel.org,
        Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Yassine Oudjana <y.oudjana@protonmail.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Tony Lindgren <tony@atomide.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Jerome Brunet <jbrunet@baylibre.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v5 05/28] clk: Mention that .recalc_rate can return 0 on error
Date:   Mon, 16 May 2022 15:25:04 +0200
Message-Id: <20220516132527.328190-6-maxime@cerno.tech>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220516132527.328190-1-maxime@cerno.tech>
References: <20220516132527.328190-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Multiple platforms (amlogic, imx8) return 0 when the clock rate cannot
be determined properly by the recalc_rate hook. Mention in the
documentation that the framework is ok with that.

Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 include/linux/clk-provider.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/include/linux/clk-provider.h b/include/linux/clk-provider.h
index c10dc4c659e2..58e5baa49db0 100644
--- a/include/linux/clk-provider.h
+++ b/include/linux/clk-provider.h
@@ -118,8 +118,9 @@ struct clk_duty {
  *
  * @recalc_rate	Recalculate the rate of this clock, by querying hardware. The
  *		parent rate is an input parameter.  It is up to the caller to
- *		ensure that the prepare_mutex is held across this call.
- *		Returns the calculated rate.  Optional, but recommended - if
+ *		ensure that the prepare_mutex is held across this call. If the
+ *		driver cannot figure out a rate for this clock, it must return
+ *		0. Returns the calculated rate. Optional, but recommended - if
  *		this op is not set then clock rate will be initialized to 0.
  *
  * @round_rate:	Given a target rate as input, returns the closest rate actually
-- 
2.36.1

