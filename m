Return-Path: <SRS0=eZMu=MX=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.4 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96EA8C677FC
	for <linux-clk@archiver.kernel.org>; Thu, 11 Oct 2018 16:28:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5C00421476
	for <linux-clk@archiver.kernel.org>; Thu, 11 Oct 2018 16:28:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="exA2ePL6"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 5C00421476
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=kernel.org
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730045AbeJKX4H (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Oct 2018 19:56:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:34920 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729368AbeJKX4G (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 11 Oct 2018 19:56:06 -0400
Received: from localhost (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id BB5A720658;
        Thu, 11 Oct 2018 16:28:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1539275288;
        bh=FOo2/jY9ndN3A33+tu7t3iWgYIxzfLQy0FZ/U4VmeBo=;
        h=To:From:In-Reply-To:Cc:References:Subject:Date:From;
        b=exA2ePL6kp7FEi15z8rWcNid+9jrI4ZCLzoK4n++1meypcXoq+ZG6E3+ny/+Jyq5r
         8lc0OOURDbedAzdCCvU9+frHmcWQNSyMY2umgwlmOC+VTnndFA7vfAxwbg68Ur+e4P
         Pxm1Q1iYczH06WhkGAF+0ntNRcQxBRmjefeP5Wt8=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Tero Kristo <t-kristo@ti.com>
From:   Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <ee107173-b39c-5dc0-4aef-9848639b1b38@ti.com>
Cc:     linux-clk <linux-clk@vger.kernel.org>,
        "linux-omap@vger.kernel.org" <linux-omap@vger.kernel.org>,
        "tony@atomide.com" <tony@atomide.com>,
        "J, Keerthy" <j-keerthy@ti.com>
References: <ee107173-b39c-5dc0-4aef-9848639b1b38@ti.com>
Message-ID: <153927528808.5275.15861958277033864892@swboyd.mtv.corp.google.com>
User-Agent: alot/0.7
Subject: Re: [GIT PULL] clk: ti: updates for v4.20
Date:   Thu, 11 Oct 2018 09:28:08 -0700
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Quoting Tero Kristo (2018-10-03 06:12:39)
> Hi Mike, Stephen,
> =

> Here are the late changes for TI clock driver for 4.20 merge window. =

> Sorry about the late pull request, but this was waiting for resolution =

> on one of the dependencies (patch "clk: ti: fix OF child-node =

> lookup..."). Thanks for setting up the immutable branch for it.
> =

> Please especially note the core clock changes in this series for adding =

> support of clk save/restore mechanism (two patches from Russ Dill.) I =

> decided to go ahead by adding them to this pull as there has been no =

> comments on the patches and they have been pending on the lists already =

> for a while. They aren't touching anything existing either, so they =

> should be safe to apply also.

Thanks for calling it out and pushing me to react. I have been avoiding
the suspend/resume patches unsuccessfully and now after looking at them
I see a few nitpicks that I can resolve after merging this PR. It's also
a sort of one-off solution for TI where all clks need to run through
save/restore in a depth-first tree order and just blast in
enable/disable bits, so we'll need to improve on it in the future. But
I'm fine to go with it for now and do _something_ instead of just sit
around and do nothing.

----8<----

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index dd775771a7cc..af011974d4ec 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -935,39 +935,41 @@ static int clk_core_enable_lock(struct clk_core *core)
  */
 void clk_gate_restore_context(struct clk_hw *hw)
 {
-	if (hw->clk->core->enable_count)
-		hw->clk->core->ops->enable(hw);
+	struct clk_core *core =3D hw->core;
+
+	if (core->enable_count)
+		core->ops->enable(hw);
 	else
-		hw->clk->core->ops->disable(hw);
+		core->ops->disable(hw);
 }
 EXPORT_SYMBOL_GPL(clk_gate_restore_context);
 =

-static int _clk_save_context(struct clk_core *clk)
+static int clk_core_save_context(struct clk_core *core)
 {
 	struct clk_core *child;
 	int ret =3D 0;
 =

-	hlist_for_each_entry(child, &clk->children, child_node) {
-		ret =3D _clk_save_context(child);
+	hlist_for_each_entry(child, &core->children, child_node) {
+		ret =3D clk_core_save_context(child);
 		if (ret < 0)
 			return ret;
 	}
 =

-	if (clk->ops && clk->ops->save_context)
-		ret =3D clk->ops->save_context(clk->hw);
+	if (core->ops && core->ops->save_context)
+		ret =3D core->ops->save_context(core->hw);
 =

 	return ret;
 }
 =

-static void _clk_restore_context(struct clk_core *clk)
+static void clk_core_restore_context(struct clk_core *core)
 {
 	struct clk_core *child;
 =

-	if (clk->ops && clk->ops->restore_context)
-		clk->ops->restore_context(clk->hw);
+	if (core->ops && core->ops->restore_context)
+		core->ops->restore_context(core->hw);
 =

-	hlist_for_each_entry(child, &clk->children, child_node)
-		_clk_restore_context(child);
+	hlist_for_each_entry(child, &core->children, child_node)
+		clk_core_restore_context(child);
 }
 =

 /**
@@ -983,13 +985,13 @@ int clk_save_context(void)
 	int ret;
 =

 	hlist_for_each_entry(clk, &clk_root_list, child_node) {
-		ret =3D _clk_save_context(clk);
+		ret =3D clk_core_save_context(clk);
 		if (ret < 0)
 			return ret;
 	}
 =

 	hlist_for_each_entry(clk, &clk_orphan_list, child_node) {
-		ret =3D _clk_save_context(clk);
+		ret =3D clk_core_save_context(clk);
 		if (ret < 0)
 			return ret;
 	}
@@ -1006,13 +1008,13 @@ EXPORT_SYMBOL_GPL(clk_save_context);
  */
 void clk_restore_context(void)
 {
-	struct clk_core *clk;
+	struct clk_core *core;
 =

-	hlist_for_each_entry(clk, &clk_root_list, child_node)
-		_clk_restore_context(clk);
+	hlist_for_each_entry(core, &clk_root_list, child_node)
+		clk_core_restore_context(core);
 =

-	hlist_for_each_entry(clk, &clk_orphan_list, child_node)
-		_clk_restore_context(clk);
+	hlist_for_each_entry(core, &clk_orphan_list, child_node)
+		clk_core_restore_context(core);
 }
 EXPORT_SYMBOL_GPL(clk_restore_context);
 =


