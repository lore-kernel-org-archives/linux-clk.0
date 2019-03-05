Return-Path: <SRS0=s9Xv=RI=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B54A5C43381
	for <linux-clk@archiver.kernel.org>; Tue,  5 Mar 2019 04:50:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8765F2082C
	for <linux-clk@archiver.kernel.org>; Tue,  5 Mar 2019 04:50:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Jq19CoHM"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727119AbfCEEtt (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 4 Mar 2019 23:49:49 -0500
Received: from mail-pf1-f193.google.com ([209.85.210.193]:42790 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727099AbfCEEtt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 4 Mar 2019 23:49:49 -0500
Received: by mail-pf1-f193.google.com with SMTP id n74so4701807pfi.9
        for <linux-clk@vger.kernel.org>; Mon, 04 Mar 2019 20:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WrWa1I1KlS8O2M5oWvlBrE0dGk9UBUElSbe4mXouqcQ=;
        b=Jq19CoHMlSEmGOgfXTJSaz1flGHi6N50sqGo7PIDHDRoGZ68zEJfMhw9nYvM6RWcRX
         VRy+4rAjQXlHd63YnL18K5KvqCSAILA2ae0Exe6q4dA+WRqego50j/8h0LqoW3CFwluX
         9Prt7O19nyKUjf7ofAUR4Hqb9wbxV5PtYm4PA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WrWa1I1KlS8O2M5oWvlBrE0dGk9UBUElSbe4mXouqcQ=;
        b=H6dvJCXXASN1+57R72nxR/W5P43p2A4XgB8wdATIowKub3hD8NrRAtZ9vuYrPMrjys
         kkMnwSrWexsnFizrxbdFw7Tk2N+h/IVdaNRhup1bD+TJMUdKXJsHNmaRwCX955T2zaw4
         LsTm2yR1znZlh168gmlSj6ERFF3eeS9Y3PbCQcBhWRYhgUfn7QxIXKCUD9bPY3vni1Bs
         zherOvGt2h1si+LR8OM19FoDSSTRfLpcLFsXkZn3QU5PrXW2YDdBJQBdQvcj0fNQOUjI
         ReRbH8s9JTtb04hsGzmEI0mdAssdhzG5ZeB4B5/FMOKp0dop4CrBbiT1lTuKVPXJLMgr
         ERSw==
X-Gm-Message-State: APjAAAU8gO/utnF50MP9dr2GEHPkxuIM7FHXO7TJ/tSXGMX3mIgyDrNw
        L68zo1wPIRISN4+PFoprYJcWNA==
X-Google-Smtp-Source: APXvYqxDX14Cia3IBVPkEaxEtMWwSwJovoamIP4HvycxEA3628n/4HnTYgRe/72ey0QB8nrmzdrjcw==
X-Received: by 2002:a62:2b88:: with SMTP id r130mr23596219pfr.93.1551761388046;
        Mon, 04 Mar 2019 20:49:48 -0800 (PST)
Received: from exogeni.mtv.corp.google.com ([2620:15c:202:1:db8d:8e3f:2514:5db8])
        by smtp.gmail.com with ESMTPSA id z15sm15893883pgc.25.2019.03.04.20.49.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Mar 2019 20:49:47 -0800 (PST)
From:   Derek Basehore <dbasehore@chromium.org>
To:     linux-kernel@vger.kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org, linux-doc@vger.kernel.org,
        sboyd@kernel.org, mturquette@baylibre.com, heiko@sntech.de,
        aisheng.dong@nxp.com, mchehab+samsung@kernel.org, corbet@lwn.net,
        jbrunet@baylibre.com, Derek Basehore <dbasehore@chromium.org>
Subject: [PATCH v2 5/6] docs: driver-api: add pre_rate_req to clk documentation
Date:   Mon,  4 Mar 2019 20:49:35 -0800
Message-Id: <20190305044936.22267-6-dbasehore@chromium.org>
X-Mailer: git-send-email 2.21.0.352.gf09ad66450-goog
In-Reply-To: <20190305044936.22267-1-dbasehore@chromium.org>
References: <20190305044936.22267-1-dbasehore@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This adds documentation for the new clk op pre_rate_req.

Signed-off-by: Derek Basehore <dbasehore@chromium.org>
---
 Documentation/driver-api/clk.rst | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/driver-api/clk.rst b/Documentation/driver-api/clk.rst
index 593cca5058b1..917f6ac29645 100644
--- a/Documentation/driver-api/clk.rst
+++ b/Documentation/driver-api/clk.rst
@@ -82,6 +82,9 @@ the operations defined in clk-provider.h::
 						unsigned long *parent_rate);
 		int		(*determine_rate)(struct clk_hw *hw,
 						  struct clk_rate_request *req);
+		int		(*pre_rate_req)(struct clk_hw *hw,
+						const struct clk_rate_request *next,
+						struct clk_rate_request *pre);
 		int		(*set_parent)(struct clk_hw *hw, u8 index);
 		u8		(*get_parent)(struct clk_hw *hw);
 		int		(*set_rate)(struct clk_hw *hw,
@@ -224,6 +227,8 @@ optional or must be evaluated on a case-by-case basis.
    +----------------+------+-------------+---------------+-------------+------+
    |.determine_rate |      | y [1]_      |               |             |      |
    +----------------+------+-------------+---------------+-------------+------+
+   |.pre_rate_req   |      | y [1]_      |               |             |      |
+   +----------------+------+-------------+---------------+-------------+------+
    |.set_rate       |      | y           |               |             |      |
    +----------------+------+-------------+---------------+-------------+------+
    +----------------+------+-------------+---------------+-------------+------+
@@ -238,7 +243,7 @@ optional or must be evaluated on a case-by-case basis.
    |.init           |      |             |               |             |      |
    +----------------+------+-------------+---------------+-------------+------+
 
-.. [1] either one of round_rate or determine_rate is required.
+.. [1] one of round_rate, determine_rate, or pre_rate_req is required.
 
 Finally, register your clock at run-time with a hardware-specific
 registration function.  This function simply populates struct clk_foo's
-- 
2.21.0.352.gf09ad66450-goog

