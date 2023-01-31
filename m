Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39B69C38142
	for <linux-clk@archiver.kernel.org>; Tue, 31 Jan 2023 16:08:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230091AbjAaQIk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 31 Jan 2023 11:08:40 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230060AbjAaQIj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 31 Jan 2023 11:08:39 -0500
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 501A74A224;
        Tue, 31 Jan 2023 08:08:38 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id j32-20020a05600c1c2000b003dc4fd6e61dso5978374wms.5;
        Tue, 31 Jan 2023 08:08:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VDJhzXE+EpJpWLKyPjwl5rb02w6NGxOvd6kEb5Nte8w=;
        b=ZjWU9vis4X8/Qrhodr1WlT2K9ZnNsLVgva3UtZhvNvGRHWrQnFGO/2W6fxRA36F7pe
         dwXAEFEGWN/qpVcv0E9L/2w0WOwrrgD3oEsIYhurtEKkO7Wh5goB22S+QtW0BhGWTkf3
         i48IWtlvHzz9XJanlA3i/J9hjKjqcC0RVrF0Y69OAayeOY0X1g93s0JbSFWRbL0I3BJq
         g5VEMQiFCG10EU2PN79NktWsONIKWcqm28er8CwDU36EbbMlc7PU3zfjhNTd9WXWttVS
         rsnjAxIbqsCDUjj3hgWRKZsvCNYMEdW65DaVB9BfEaxGOd8ya7KdGA22gRp5UpdOot6F
         LmJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VDJhzXE+EpJpWLKyPjwl5rb02w6NGxOvd6kEb5Nte8w=;
        b=kzFFWDY9y3T351maNwtXCUaglT5mVB/YiepLRxiwPJDzkSJbhmR/s3oD7kvUUEAfTm
         +kh1EW4O0BtOflrQGGdikloCJKFhQIiu/FuF+nJcrZW9WlaCCRSN51PeVPD3CxK8BXAu
         G3gAKwEjIwOGFNmuIimJMnDeIr2efbA/RAHRZ+2034yr60GYg35UwMwJUSNAiuzboAv0
         vgiXPMAjRePnlUaguUs3gW6L8TNKIkAQSX8iGzEyOvf6HSZPgSECjznGyezzM5rOa/qA
         l5CK/N3nAWUQ/qWXjaNxn85HUr46CjAnsM4aIgOy5hk9G6H5pvmelZD/N0efu4QUUW/4
         6TFQ==
X-Gm-Message-State: AO0yUKXD9tUMmyWUzeUOfG0EpV7KxrxqrsBuJJ1tuSks04ulhJUhFL6q
        tt/sj0Jsm/Ugmvw+ihQ4EbbbuoEk2MY=
X-Google-Smtp-Source: AK7set+HDATEHtlLLSSjOnHh4emq4Xj5eFoTt+vy+6OWvqepHR0Jqk7Zhob7jNYsqKq39PJ/+Y10UA==
X-Received: by 2002:a7b:c3d3:0:b0:3de:1d31:1042 with SMTP id t19-20020a7bc3d3000000b003de1d311042mr594561wmj.23.1675181316729;
        Tue, 31 Jan 2023 08:08:36 -0800 (PST)
Received: from localhost.localdomain (93-34-88-241.ip49.fastwebnet.it. [93.34.88.241])
        by smtp.googlemail.com with ESMTPSA id ip7-20020a05600ca68700b003dc433bb5e1sm12622794wmb.9.2023.01.31.08.08.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Jan 2023 08:08:36 -0800 (PST)
From:   Christian Marangi <ansuelsmth@gmail.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Cc:     Christian Marangi <ansuelsmth@gmail.com>
Subject: [PATCH v2 1/2] clk: Warn and add workaround on misuse of .parent_data with .name only
Date:   Tue, 31 Jan 2023 17:08:28 +0100
Message-Id: <20230131160829.23369-1-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

By a simple mistake in a .parent_names to .parent_data conversion it was
found that clk core assume fw_name is always provided with a parent_data
struct for each parent and never fallback to .name to get parent name even
if declared.

This is caused by clk_core_get that only checks for parent .fw_name and
doesn't handle .name.

While it's sane to request the dev to correctly do the conversion and
add both .fw_name and .name in a parent_data struct, it's not sane to
silently drop parents without a warning.

Fix this in 2 ways. Add a kernel warning when a wrong implementation is
used and copy .name in .fw_name in parent map populate function to
handle clk problems and malfunctions.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/clk/clk.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index 57b83665e5c3..dccd4ea6f692 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -4015,10 +4015,21 @@ static int clk_core_populate_parent_map(struct clk_core *core,
 			ret = clk_cpy_name(&parent->name, parent_names[i],
 					   true);
 		} else if (parent_data) {
+			const char *parent_name;
+
 			parent->hw = parent_data[i].hw;
 			parent->index = parent_data[i].index;
+			parent_name = parent_data[i].fw_name;
+
+			if (!parent_name && parent_data[i].name) {
+				WARN(1, "Empty .fw_name with .name in %s's .parent_data. Using .name for .fw_name declaration.\n",
+				     core->name);
+				parent_name = parent_data[i].name;
+			}
+
 			ret = clk_cpy_name(&parent->fw_name,
-					   parent_data[i].fw_name, false);
+					   parent_name, false);
+
 			if (!ret)
 				ret = clk_cpy_name(&parent->name,
 						   parent_data[i].name,
-- 
2.38.1

