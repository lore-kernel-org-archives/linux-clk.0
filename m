Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 904A8C433F5
	for <linux-clk@archiver.kernel.org>; Fri, 25 Mar 2022 16:11:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237175AbiCYQN1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 25 Mar 2022 12:13:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55842 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1359778AbiCYQNZ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 25 Mar 2022 12:13:25 -0400
Received: from out1-smtp.messagingengine.com (out1-smtp.messagingengine.com [66.111.4.25])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29160BB0A2
        for <linux-clk@vger.kernel.org>; Fri, 25 Mar 2022 09:11:50 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.nyi.internal (Postfix) with ESMTP id 8F8575C0126;
        Fri, 25 Mar 2022 12:11:49 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute2.internal (MEProxy); Fri, 25 Mar 2022 12:11:49 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:date:date:from:from:in-reply-to
        :in-reply-to:message-id:mime-version:references:reply-to:sender
        :subject:subject:to:to; s=fm3; bh=dg8syyqhxJbaBkZFBbyZepMurtjTn3
        l4/9qNBy6pFCk=; b=j1h/6XkVhDRdFzvNPrnuRbLOLRlN4ULozvspTGouwVt/IZ
        6GbGQZrlkuUyqScnTdUGPeu/VTMBnooUUY2ZgaoRMQSpyZRedcBru8iGaSDiLoq3
        wRZCbI+FeBtb2+HwBFCgsq7UEeR+ZtlSzFVaLCvKP7RGeVwSgMQrXE3UFKquKVMZ
        9xrPqPu4/GAIFzCm4mC7EoPgRVGP/6+lbj5Gv7yPAS+KGGNHjpn95Hawww6F4ejt
        uXZ5aWovXbXFaKshRRRGLuEac7C6wcbf7H3qCZV6OaM2nxHmSdes6hc9QgD/9F80
        Z/POYAeD+aDNDj5Jr57ovScy+EVbuPFzdrk3LENA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; bh=dg8syy
        qhxJbaBkZFBbyZepMurtjTn3l4/9qNBy6pFCk=; b=mN4LdNwiiLbzj0RJJTLz9v
        AtRD6PehEKXLqHykNY40132gWMapYfhZQQRSaiuh3dQI5fgil2EhZ6zseP6BdKre
        yIK9Wx8vhJ3VFwLFlEsw5/fFFGrTze9hCymWxREsmG1Qu4KOk5KYyFZxIACyZpHr
        vCB2vdzDlRLz26/QYUA1bJOfwxUKm4tv6kCLKDnYnX00/CmPnadjVZ67pBWXx+kR
        6fWB29myzjEY1rEt7RMqPL5rcGwxOzliEZ9PzE0qkTl38AIWK1TVZAO3oxIJ97VR
        3AbxhJFxJr7RGOfvsm+BfAqdjUbzhVUeelu2ZOisBN0zVV+bYs9fozEyoloYqFDQ
        ==
X-ME-Sender: <xms:xek9YoX_ELDl9H2jOUrh3TzaXMAYHVYXGJYcVsGD00zzS3Yfwkbw5g>
    <xme:xek9YsllYGl-tkNukLRWM_EuY9G5kVwQeFVqxZn04NEDajvZvVuhChEKJVc8JbYYi
    guNmfKn7d_wlZHCFng>
X-ME-Received: <xmr:xek9YsZEKpQlgyPB1R60fxiSqbaQdjQl-XFVvAY-UWgaCyrgj9tVBsG2hNCWJVUIEf_lzcdSsFnbHfQ0mQXtPQZkEbXSES6Zhw8DStQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvvddrudehuddgkeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephffvufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpeforgigihhm
    vgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrfgrth
    htvghrnhepvdekleevfeffkeejhfffueelteelfeduieefheduudfggffhhfffheevveeh
    hedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmh
    grgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:xek9YnWYNG_v78HbjsBS2dS_AxviTY6IXTm8spLcMziW34FsOnhUKw>
    <xmx:xek9YinMfdj7alxGUTxjeb8FJ4jYLHiDw2VLQA65o1BwemEWNuN3JA>
    <xmx:xek9Ysdfr3eLSzXn_d9V-NPjRYjTxHqiPD5sDlObd1egPe7Jrbulow>
    <xmx:xek9YkhXg7DKMEyZ2RPqsouudlw6URHLz5esZWXkaFGuzS4fD2Q4zQ>
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 25 Mar 2022 12:11:48 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
To:     Mike Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc:     Dmitry Osipenko <dmitry.osipenko@collabora.com>,
        Maxime Ripard <maxime@cerno.tech>
Subject: [PATCH v2 1/3] clk: Initialize orphan req_rate
Date:   Fri, 25 Mar 2022 17:11:42 +0100
Message-Id: <20220325161144.1901695-2-maxime@cerno.tech>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220325161144.1901695-1-maxime@cerno.tech>
References: <20220325161144.1901695-1-maxime@cerno.tech>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

When registering a clock that doesn't have a recalc_rate implementation,
and doesn't have its parent registered yet, we initialize the clk_core
rate and req_rate fields to 0.

The rate field is later updated when the parent is registered in
clk_core_reparent_orphans_nolock() using __clk_recalc_rates(), but the
req_rate field is never updated.

This leads to an issue in clk_set_rate_range() and clk_put(), since
those functions will call clk_set_rate with the content of req_rate to
provide drivers with the opportunity to change the rate based on the new
boundaries. In this case, we would call clk_set_rate() with a rate of 0,
effectively enforcing the minimum allowed for this clock whenever we
would call one of those two functions, even though the actual rate might
be within range.

Let's fix this by setting req_rate in clk_core_reparent_orphans_nolock()
with the rate field content just updated by the call to
__clk_recalc_rates().

Fixes: 1c8e600440c7 ("clk: Add rate constraints to clocks")
Reported-by: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Tested-by: Dmitry Osipenko <dmitry.osipenko@collabora.com> # T30 Nexus7
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 9bc8bf434b94..915a2fa363b1 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3479,6 +3479,19 @@ static void clk_core_reparent_orphans_nolock(void)
 			__clk_set_parent_after(orphan, parent, NULL);
 			__clk_recalc_accuracies(orphan);
 			__clk_recalc_rates(orphan, 0);
+
+			/*
+			 * If the clock doesn't have .recalc_rate (so
+			 * wouldn't affect the parent rate) and is
+			 * orphan when it's registered, the
+			 * __clk_init_parent will set the initial
+			 * req_rate to 0.
+			 *
+			 * req_rate is then used by clk_set_rate_range
+			 * and clk_put to trigger a clk_set_rate call
+			 * whenever the boundaries are modified.
+			 */
+			orphan->req_rate = orphan->rate;
 		}
 	}
 }
-- 
2.35.1

