Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23CBAC433EF
	for <linux-clk@archiver.kernel.org>; Thu,  7 Oct 2021 13:56:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0870560FD7
	for <linux-clk@archiver.kernel.org>; Thu,  7 Oct 2021 13:56:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232936AbhJGN6g (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 7 Oct 2021 09:58:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48364 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233354AbhJGN6f (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Oct 2021 09:58:35 -0400
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C568C061570
        for <linux-clk@vger.kernel.org>; Thu,  7 Oct 2021 06:56:41 -0700 (PDT)
Received: by mail-lf1-x129.google.com with SMTP id u18so25063099lfd.12
        for <linux-clk@vger.kernel.org>; Thu, 07 Oct 2021 06:56:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4m/QkTKMyjBIG+vcml/nBDmZXoeJ+SJgtqiR6/8Wm88=;
        b=ebHBt2CXWbsPey4804BoUXNSq5lgNKazryE/pH4AYna5xBGc5X5B19l8mBHxk99N/1
         fKFYe7rrCTWd/wE8NyUXhAcF6CWj4Xr2GLUqqzXs+PHsuf/E+9ipHYB2nhhdl3epkJWk
         P36lEwU9pBTbNPRVwDxLvXu6St9IneQJ7TeJJ5UyUP2rKjDuXG2wZS095Wqod2ENtWrk
         z2VlmMR5Qsfykhaf09GI/Adn5mW4SNXmPXZ8xW7iSkQU3LpHpeOwoPQchHISE7HzjwZD
         skyp33+QDiaiFTi6QEivOV1VPQmNhJDrBzYidI7GPwczxREWypPvi2JA2Qu8f9MRlQFD
         OPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4m/QkTKMyjBIG+vcml/nBDmZXoeJ+SJgtqiR6/8Wm88=;
        b=swKLuaPClwRHtce9CQRBtlsgWYI/Zduuxw2T6Gok1KAhbOgTnfI9als95J3L5VFITl
         8kcp932Cy1r2MkQpySI/EV1+SnKNv2V4toaGytP4+v8A8RHkaBYG6TjEiHpnxQ1K86Xe
         puPywwSL2h9sVj+xG0UXIolHkeNNLpoRwwtzXDSfebwEM/WHoEtr6TCM/pi3F54Osfpl
         8nG8PkTRsn6ClbZqyw5JJNTTc9q+MYb5RBUpAA7REHNUGK6mtmlEImjXqM/rUqciGu+j
         p0iCAqHiEBmNKiHHknqtSLA9pke6dggWGtiXh9xVYGgYVGBpHZ8HGy74ta0y6gA32+Kr
         2B+A==
X-Gm-Message-State: AOAM532mc9pFfVcr5W6BUbB1glcawfurAJ5eP2ro1ywgPY2d5kVaPTTX
        wZjCl9b+PZEXPPsO10sBah9Veg==
X-Google-Smtp-Source: ABdhPJwi5WU77cMkLOiS+zG1FLHfIY7fma0J8GJ2CVcd1dpE2WbVt6MjGBYd5y9mfRK+UXcpFEoJbQ==
X-Received: by 2002:ac2:44aa:: with SMTP id c10mr4176181lfm.690.1633614997478;
        Thu, 07 Oct 2021 06:56:37 -0700 (PDT)
Received: from localhost ([31.134.121.151])
        by smtp.gmail.com with ESMTPSA id m3sm2554419lfh.2.2021.10.07.06.56.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 06:56:37 -0700 (PDT)
From:   Sam Protsenko <semen.protsenko@linaro.org>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Russell King <linux@armlinux.org.uk>
Cc:     Chanwoo Choi <cw00.choi@samsung.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Mike Tipton <mdtipton@codeaurora.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Andy Shevchenko <andy@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3] clk: Add clk_set_parent debugfs node
Date:   Thu,  7 Oct 2021 16:56:35 +0300
Message-Id: <20211007135635.2717-1-semen.protsenko@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Useful for testing mux clocks. One can write the index of the parent to
set into clk_parent node, starting from 0. Example

    # cd /sys/kernel/debug/clk/mout_peri_bus
    # cat clk_possible_parrents
      dout_shared0_div4 dout_shared1_div4
    # cat clk_parent
      dout_shared0_div4
    # echo 1 > clk_parent
    # cat clk_parent
      dout_shared1_div4

One needs to define CLOCK_ALLOW_WRITE_DEBUGFS in drivers/clk/clk.c in
order to use this feature.

Signed-off-by: Sam Protsenko <semen.protsenko@linaro.org>
--
Changes in v3:
  - Removed unwanted changes added by mistake

Changes in v2:
  - Merged write() function into existing 'clk_parent' file
  - Removed 'if (val >= core->num_parents)' check
  - Removed incorrect usage of IS_ERR_OR_NULL()

 drivers/clk/clk.c | 53 ++++++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 52 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 806c55f0991b..f57e33efda9b 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3224,6 +3224,46 @@ static int current_parent_show(struct seq_file *s, void *data)
 }
 DEFINE_SHOW_ATTRIBUTE(current_parent);
 
+#ifdef CLOCK_ALLOW_WRITE_DEBUGFS
+static ssize_t current_parent_write(struct file *file, const char __user *ubuf,
+				    size_t count, loff_t *ppos)
+{
+	struct seq_file *s = file->private_data;
+	struct clk_core *core = s->private;
+	struct clk_core *parent;
+	char buf[4] = { 0 };
+	u8 idx;
+	int err;
+
+	if (copy_from_user(&buf, ubuf, min_t(size_t, sizeof(buf) - 1, count)))
+		return -EFAULT;
+
+	err = kstrtou8(buf, 0, &idx);
+	if (err)
+		return err;
+
+	parent = clk_core_get_parent_by_index(core, idx);
+	if (!parent)
+		return -ENOENT;
+
+	clk_prepare_lock();
+	err = clk_core_set_parent_nolock(core, parent);
+	clk_prepare_unlock();
+	if (err)
+		return err;
+
+	return count;
+}
+
+static const struct file_operations current_parent_rw_fops = {
+	.open		= current_parent_open,
+	.write		= current_parent_write,
+	.read		= seq_read,
+	.llseek		= seq_lseek,
+	.release	= single_release,
+};
+#endif
+
 static int clk_duty_cycle_show(struct seq_file *s, void *data)
 {
 	struct clk_core *core = s->private;
@@ -3291,9 +3331,20 @@ static void clk_debug_create_one(struct clk_core *core, struct dentry *pdentry)
 			    &clk_prepare_enable_fops);
 #endif
 
-	if (core->num_parents > 0)
+	if (core->num_parents > 0) {
+#ifdef CLOCK_ALLOW_WRITE_DEBUGFS
+		if (core->num_parents > 1) {
+			debugfs_create_file("clk_parent", 0644, root, core,
+					    &current_parent_rw_fops);
+		} else {
+			debugfs_create_file("clk_parent", 0444, root, core,
+					    &current_parent_fops);
+		}
+#else
 		debugfs_create_file("clk_parent", 0444, root, core,
 				    &current_parent_fops);
+#endif
+	}
 
 	if (core->num_parents > 1)
 		debugfs_create_file("clk_possible_parents", 0444, root, core,
-- 
2.30.2

