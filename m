Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D219C7EE26
	for <linux-clk@archiver.kernel.org>; Fri,  5 May 2023 11:27:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231709AbjEEL15 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 5 May 2023 07:27:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38484 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231686AbjEEL1z (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 5 May 2023 07:27:55 -0400
Received: from wout1-smtp.messagingengine.com (wout1-smtp.messagingengine.com [64.147.123.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E01B1A4B8
        for <linux-clk@vger.kernel.org>; Fri,  5 May 2023 04:27:37 -0700 (PDT)
Received: from compute2.internal (compute2.nyi.internal [10.202.2.46])
        by mailout.west.internal (Postfix) with ESMTP id 4CA273200A56;
        Fri,  5 May 2023 07:26:32 -0400 (EDT)
Received: from mailfrontend1 ([10.202.2.162])
  by compute2.internal (MEProxy); Fri, 05 May 2023 07:26:32 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cerno.tech; h=cc
        :cc:content-transfer-encoding:content-type:content-type:date
        :date:from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm2; t=
        1683285991; x=1683372391; bh=mrAU+bLqMsfpxLQJKc38HcpTjITPvWvf2Ok
        /31Y/y8s=; b=gCVDa7Y8ltoIFwoMyKPdSn0N3VzkJpZr7hGF1mYQqNgpkkRVAO7
        c62PrmDSFhiBuT7VRB/kL8T8uPtVxBtHj13UcCOKCinYc6q6OQCWd6POoD6caaQu
        /Gma+SyLRHuNVRVv8G7G0dy7Z/IxcREju2TuOEBRWa+MlpLoB/K5pGdbkrt25VeN
        lltnKiIixFRhm9yKh61ZDh1jLdq5FtJQYDnWFeBzNQRExcCfQLHSPaG6eX/d0LYd
        ewY1v0ePiZ07+O1o/cIrpeM8Ulcm0rhlRuCi6kHp4dLLf+f5foyC7X96GnkzHg1f
        T7DNBAjlCVgD/9KXcolmn/ay3s5JoKFOVaA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1683285991; x=1683372391; bh=mrAU+bLqMsfpxLQJKc38HcpTjITPvWvf2Ok
        /31Y/y8s=; b=jgfNO8EpKz/+6jv8euycWyZtb8DCJY4IAZS8cW7zFawr+F70VTF
        Cgpipat/pbrQNY1ow3lLDkBCNacKVU2vnMwiEsh7wv3mMYiXeaW0nlcrOfeHqPgC
        Fmmk2y1p5bP+SgYHBgCicv1+hkxudV/CgXZYXVU5bEE42YmejrbPe+5CmCunb3xF
        qRyrp0irJ+Fqzy91f2p46ri3oOViEGdCpj5dYtF1x9FEpsSGTLJ/RElTSjeJTG9U
        xv3ELoBpLm3pBtbIloUo/JUJA3jOcfhiMSHO/z5vOsqWcbcVAOzlk9vxdvaI2Sum
        Rc3zbgHAN5P+e4uiprXjtl6kDaupcbzT5wA==
X-ME-Sender: <xms:5-dUZDUrR5XtFAoy0zbjmtY0rchD_P9Ubwi5ir_9OZMLXYmNlJzang>
    <xme:5-dUZLkf8ZJ4pDpCbK9TTwaw5HdhhfXRg0cI06F6Oy64OwQOihChOyi8COw21p1AU
    2IrkWYDkO3TPZSrmZY>
X-ME-Received: <xmr:5-dUZPYPF9drEAQmJcoMBP6J_svT88Opl-ta3tOeDt6TsIgCTlqUgwvQIRwAvQTnY1SIKCvmlv2QGQmBq44vgk2uJR77c8U>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvhedrfeefvddggedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhephfffufggtgfgkfhfjgfvvefosehtjeertdertdejnecuhfhrohhmpeforgig
    ihhmvgcutfhiphgrrhguuceomhgrgihimhgvsegtvghrnhhordhtvggthheqnecuggftrf
    grthhtvghrnhepvedvleeijeegvdekffehkeehieelhfeggfffheetkeeuledvtdeuffeh
    teeltdffnecuvehluhhsthgvrhfuihiivgepvdenucfrrghrrghmpehmrghilhhfrhhomh
    epmhgrgihimhgvsegtvghrnhhordhtvggthh
X-ME-Proxy: <xmx:5-dUZOU71JwMQvL3EnZZZH5COa8YihDTyB1ZIg9iCrxeC24LnRxOvQ>
    <xmx:5-dUZNkCjX1pGwJxAYXAkv9Rj2HZv12KJmLB95TELMk1Ljxe24KUIg>
    <xmx:5-dUZLfIi3Q21Dt0VmkMK-2yuL93VrKXTiGOizezKxbfxiNql4OOqg>
    <xmx:5-dUZDjuyWiqT9-YaiyrchCcTd0CYC1Qaz0LjcPQ5w2EEin5yXcNog>
Feedback-ID: i8771445c:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 May 2023 07:26:31 -0400 (EDT)
From:   Maxime Ripard <maxime@cerno.tech>
Date:   Fri, 05 May 2023 13:25:18 +0200
Subject: [PATCH v4 16/68] clk: lmk04832: clkout: Add a determine_rate hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20221018-clk-range-checks-fixes-v4-16-971d5077e7d2@cerno.tech>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, Maxime Ripard <maxime@cerno.tech>,
        Liam Beguin <liambeguin@gmail.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2113; i=maxime@cerno.tech;
 h=from:subject:message-id; bh=mu7yCC2IWszGqRQyvTGFuufG9qQ9YdHxJt5tU6jeTEc=;
 b=owGbwMvMwCX2+D1vfrpE4FHG02pJDCkhzxefvXBHoDNH48Vjqdb9H5YUtGoe5LSU376v7sP+m2W7
 47ofd5SyMIhxMciKKbLECJsviTs163UnG988mDmsTCBDGLg4BWAingyMDKdmzhCKbPacnlP+Tff95l
 P7Zj8TO/k+0tpVkO0t22rzvjhGhvceG1yYKo6x36qyDubdauvIovxsxX/+bC65Ve+mzX3Eyw4A
X-Developer-Key: i=maxime@cerno.tech; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The LKM04832 "CLKOUT" clock implements a mux with a set_parent hook, but
doesn't provide a determine_rate implementation.

This is a bit odd, since set_parent() is there to, as its name implies,
change the parent of a clock. However, the most likely candidate to
trigger that parent change is a call to clk_set_rate(), with
determine_rate() figuring out which parent is the best suited for a
given rate.

The other trigger would be a call to clk_set_parent(), but it's far less
used, and it doesn't look like there's any obvious user for that clock.

So, the set_parent hook is effectively unused, possibly because of an
oversight. However, it could also be an explicit decision by the
original author to avoid any reparenting but through an explicit call to
clk_set_parent().

The latter case would be equivalent to setting the flag
CLK_SET_RATE_NO_REPARENT, together with setting our determine_rate hook
to __clk_mux_determine_rate(). Indeed, if no determine_rate
implementation is provided, clk_round_rate() (through
clk_core_round_rate_nolock()) will call itself on the parent if
CLK_SET_RATE_PARENT is set, and will not change the clock rate
otherwise.

And if it was an oversight, then we are at least explicit about our
behavior now and it can be further refined down the line.

Since the CLK_SET_RATE_NO_REPARENT flag was already set though, it seems
unlikely.

Reviewed-by: Liam Beguin <liambeguin@gmail.com>
Signed-off-by: Maxime Ripard <maxime@cerno.tech>
---
 drivers/clk/clk-lmk04832.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/clk-lmk04832.c b/drivers/clk/clk-lmk04832.c
index afdfee3b365f..e22ac93e0c2f 100644
--- a/drivers/clk/clk-lmk04832.c
+++ b/drivers/clk/clk-lmk04832.c
@@ -1279,6 +1279,7 @@ static const struct clk_ops lmk04832_clkout_ops = {
 	.is_enabled = lmk04832_clkout_is_enabled,
 	.prepare = lmk04832_clkout_prepare,
 	.unprepare = lmk04832_clkout_unprepare,
+	.determine_rate = __clk_mux_determine_rate,
 	.set_parent = lmk04832_clkout_set_parent,
 	.get_parent = lmk04832_clkout_get_parent,
 };

-- 
2.40.0

