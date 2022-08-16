Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8898BC28B2B
	for <linux-clk@archiver.kernel.org>; Tue, 16 Aug 2022 11:51:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235003AbiHPLvi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 16 Aug 2022 07:51:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41098 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235136AbiHPLu1 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 16 Aug 2022 07:50:27 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B1E9D3E74
        for <linux-clk@vger.kernel.org>; Tue, 16 Aug 2022 04:25:56 -0700 (PDT)
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
        by mailout.west.internal (Postfix) with ESMTP id BF7E832002B6;
        Tue, 16 Aug 2022 07:25:54 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute5.internal (MEProxy); Tue, 16 Aug 2022 07:25:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; t=1660649154; x=1660735554; bh=zb
        2dVZo2WpyG/1yQQi7ww5p21PRXXtVfeTsvD+y8ezc=; b=bfEeKhbrKdlE/29W68
        uGty0krfOotx+zGfuGyn/Zz9NKrPY2R/kNmOZ/xiORGeKCH6z+8MZOihIFXBbQGm
        ILgip6J+CSv5R/7CiUxqmGUA3mFw6VlOxQMQIeNCC95ZAeeb8pLd9aUY00rxjaL+
        O1T+eNt/pA4aB/1B2CMG4bCkSuyyN92psjPFEM81DEdTU3lDCaR+WV4QC4rv6B51
        rClHCyjIfGFJnR0k7briuHIH499R4JpLykQ4CVQRrw32IyDGu6mWKbzIzmKMNYRn
        NHIcd3kr5PLy/k6h+KPAgAsmg6PDBcTwACxdsVU5zNgz1I/GwnqIA6Svq9f3Jrsf
        n+Bg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
        :message-id:mime-version:references:reply-to:sender:subject
        :subject:to:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; t=1660649154; x=1660735554; bh=zb2dVZo2WpyG/
        1yQQi7ww5p21PRXXtVfeTsvD+y8ezc=; b=Od04v0CqUT1t7EraUf2HFlG0YZyXA
        /C3TdHcbeQdFtNa79tZEt7qPsaquwZLTeJrRHYk7S2F+O6sCKoYc0Z1SM+ukUdve
        IfqwhgDPY+76R+vAkJnXAWVdHrfv2EGAyBHMXmamFsOPu84WHubokP0cZ/7kHB4C
        nOavb18wiZq7GM0oedIJn7j+Fb/6qwZTwNVqJmYASmZeeTPqghEy7k3u3P8QgygF
        vQyarwSE38C+JOcvg9QPxm0hdYu3uE2QCKphmMHpTuDpB+t2fnCfRUWiLCGUry6/
        OMHt+Mi65q+StTeuwJydB1ec/7Rz6IZbLf78g4TzMjTf8BprKLx35bXbw==
X-ME-Sender: <xms:wn77YhjwV0LcYu2DmrI-O0P8qXYQN7Fq-KsnruPtQiC1y3VW4jwVjw>
    <xme:wn77YmDmPK9oVmpr8MsQdbm1Y2_kyWG4om4kzoJ-uYz28F-QAi50zQA0bb4WQF_LF
    gjn_IAIUagBM5hXpPs>
X-ME-Received: <xmr:wn77YhGvyOtX7obdDhqg4lYuWDQ2mflXSvcc7w1Aj4UH5SIA8f8y0M4MG5M>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvfedrvdehgedggeduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihi
    mhgvucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrg
    htthgvrhhnpeelkeefteduhfekjeeihfetudfguedvveekkeetteekhfekhfdtlefgfedu
    vdejhfenucevlhhushhtvghrufhiiigvpedunecurfgrrhgrmhepmhgrihhlfhhrohhmpe
    hmrgigihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:wn77YmQ8SxjrBiN9C5L2N1MJ4MEfLmccF6-AJu5fVnrlkzrAMMt1tA>
    <xmx:wn77YuxSvpCtAtkQjr-YqCUX7dFv-itS-xZpDrFgSZoJ2Jj3v1xI6g>
    <xmx:wn77Ys7y_znTrbw5Wdx2pDK51uzamsJePAdUhsiO4bXknQ8eCgR9Nw>
    <xmx:wn77Yjp4T-CYA__iA38vplrmhlVAAqGIBmZcqwdMNMyp7VPyPzRFeQ>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 16 Aug 2022 07:25:53 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        Naresh Kamboju <naresh.kamboju@linaro.org>,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
        Alexander Stein <alexander.stein@ew.tq-group.com>,
        Neil Armstrong <narmstrong@baylibre.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Yassine Oudjana <y.oudjana@protonmail.com>,
        Tony Lindgren <tony@atomide.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v9 04/25] clk: Mention that .recalc_rate can return 0 on error
Date:   Tue, 16 Aug 2022 13:25:09 +0200
Message-Id: <20220816112530.1837489-5-maxime@cerno.tech>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220816112530.1837489-1-maxime@cerno.tech>
References: <20220816112530.1837489-1-maxime@cerno.tech>
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
index 1615010aa0ec..9a14cfa0d201 100644
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
2.37.1

