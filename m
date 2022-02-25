Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90460C433FE
	for <linux-clk@archiver.kernel.org>; Fri, 25 Feb 2022 14:35:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241816AbiBYOgQ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Feb 2022 09:36:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58746 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241818AbiBYOgL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Feb 2022 09:36:11 -0500
Received: from out5-smtp.messagingengine.com (out5-smtp.messagingengine.com [66.111.4.29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4AD7C1AE64E
        for <linux-clk@vger.kernel.org>; Fri, 25 Feb 2022 06:35:38 -0800 (PST)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 480C25C015A;
        Fri, 25 Feb 2022 09:35:38 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 25 Feb 2022 09:35:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm2; bh=DD5Ix+IEk47ry3gfmjU/T7/9gYnF9Y
        y1lDEaoDCp7LE=; b=qXsmSUP2pA+nXJK+5gkI4Z/DS81CsPExlPFmX7BDro373y
        6iOIaMZpqUzdoCij5pjRyk54Pk50lQRfIYHiGrvD/OpSWymLYxZW6gJlJ6/M73g/
        7f/Nn1HtfdduA504RijpbuL8dxD6VVLk2krqBnNzAndJjoVqtKlZ6SQH0dO+iwpD
        qimFMr3nlk15mPMfidgkwp6GMlAxplwbsXjtPFLpwnVXUtlDpyUw9i2mHBIZh3Nx
        yKQOpNp/2xdiPkiAFqwYDfH9cz3D5kAUjo1B8ZPWv8rE1wHyXGWZhPOcKPQIuxPV
        krq89gsHnpCc20DOeMYok6JpCkY2gRQTT3eKITTw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; bh=DD5Ix+
        IEk47ry3gfmjU/T7/9gYnF9Yy1lDEaoDCp7LE=; b=lD7ED90xdTYYNlrDLHTd+S
        uX9fQMveZCGXiZR06fX8BT17sejSiaK+AmKPBCMv6VsxEfza2HOieMJFoYs8dQ69
        1PdDKxvhgtdUm+GK+vvznBO0iJzHvPgbi9o87q3YzRhD0Ww5gnp1rc3olJ4znL9n
        SdBRZVLkrKy5C3rDLBDAI8d/+xvIeUo/rgddx24Eg7CL0kVtaHzKbk/+j6ymmvAf
        VmFT6f2GIQhCDVnfSpaxxEcV7Dw7AbgTJICSAtETO5+1d8gmgfc2Nw7hmHTZvuag
        yO1F4AHekEqto/jlbw9/wzzUQv4V33gw3nLFQFn9G1hNIVFwktidng2cY05Q+pJQ
        ==
X-ME-Sender: <xms:OukYYsDVPi3Yxm7lUAU1yD1pbYiFP7A5RNi7M9cgNXjFh4DJqUhJ4A>
    <xme:OukYYuiewYyf-nzy1WAyti99clJSh1UuA7uE6yGk0qG2oGW-kSPNHdMJPRuZ_wdus
    SXYmVjs-dve0FyW0pU>
X-ME-Received: <xmr:OukYYvlwdYikDNo_pSXHFsO0og0SWC3Stz5L1JxBJztM4SFjr_mIBOXoruj6x9Ro2cfoO5MbgVBwbjJKZkkCQT2o8Nzk1UqMmBsNEj8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrleeggdeijecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefhvffufffkofgjfhgggfestdekredtredttdenucfhrhhomhepofgrgihimhgv
    ucftihhprghrugcuoehmrgigihhmvgestggvrhhnohdrthgvtghhqeenucggtffrrghtth
    gvrhhnpedvkeelveefffekjefhffeuleetleefudeifeehuddugffghffhffehveevheeh
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehmrg
    igihhmvgestggvrhhnohdrthgvtghh
X-ME-Proxy: <xmx:OukYYiw88PW1LQwMhhmp_Hhoc7a_Omn0ZlwyTmu3qGvB_AcKN09fbA>
    <xmx:OukYYhTrLGoCIvupspplCxVTXTZ5f-EgWgvCrMovQEZ-5b8QuXNa3g>
    <xmx:OukYYtarqh8rHQFfjrlEOpy_EWljXb6VVeA4d-m0kC3FnUqXDqCFZw>
    <xmx:OukYYiSz8DNrpjWcA0YRKEo0p-mvYgu0zkf-IcWEqGlp3NJAMl_Vug>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Feb 2022 09:35:37 -0500 (EST)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Dave Stevenson <dave.stevenson@raspberrypi.com>,
        Phil Elwell <phil@raspberrypi.com>,
        Tim Gover <tim.gover@raspberrypi.com>,
        Dom Cobley <dom@raspberrypi.com>,
        dri-devel@lists.freedesktop.org, linux-clk@vger.kernel.org,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v7 01/12] clk: Fix clk_hw_get_clk() when dev is NULL
Date:   Fri, 25 Feb 2022 15:35:23 +0100
Message-Id: <20220225143534.405820-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220225143534.405820-1-maxime@cerno.tech>
References: <20220225143534.405820-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Any registered clk_core structure can have a NULL pointer in its dev
field. While never actually documented, this is evidenced by the wide
usage of clk_register and clk_hw_register with a NULL device pointer,
and the fact that the core of_clk_hw_register() function also passes a
NULL device pointer.

A call to clk_hw_get_clk() on a clk_hw struct whose clk_core is in that
case will result in a NULL pointer derefence when it calls dev_name() on
that NULL device pointer.

Add a test for this case and use NULL as the dev_id if the device
pointer is NULL.

Fixes: 30d6f8c15d2c ("clk: add api to get clk consumer from clk_hw")
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 8de6a22498e7..fff5edb89d6d 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3773,8 +3773,9 @@ struct clk *clk_hw_create_clk(struct device *dev, struct clk_hw *hw,
 struct clk *clk_hw_get_clk(struct clk_hw *hw, const char *con_id)
 {
 	struct device *dev = hw->core->dev;
+	const char *name = dev ? dev_name(dev) : NULL;
 
-	return clk_hw_create_clk(dev, hw, dev_name(dev), con_id);
+	return clk_hw_create_clk(dev, hw, name, con_id);
 }
 EXPORT_SYMBOL(clk_hw_get_clk);
 
-- 
2.35.1

