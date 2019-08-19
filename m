Return-Path: <SRS0=w22C=WP=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AD903C3A5A0
	for <linux-clk@archiver.kernel.org>; Mon, 19 Aug 2019 13:02:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7F8222086C
	for <linux-clk@archiver.kernel.org>; Mon, 19 Aug 2019 13:02:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dySa7ATx"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727671AbfHSNCH (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Aug 2019 09:02:07 -0400
Received: from mail-pl1-f196.google.com ([209.85.214.196]:44543 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727668AbfHSNCG (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 19 Aug 2019 09:02:06 -0400
Received: by mail-pl1-f196.google.com with SMTP id t14so936728plr.11
        for <linux-clk@vger.kernel.org>; Mon, 19 Aug 2019 06:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=a/DBFL5pnFxmW7r8pfJ654oUFkPKTYmOJJb8EXbuSt0=;
        b=dySa7ATxoTasTk05EATgNFRHNdWVLW6HZbVnRpJiMJgFbp1vdwTgL8L915UDlkqLUL
         RJx55z77meqhw4zi2L6edCi5tvTlDU/1T37Pma4SawsNezG5zR4aH0jCw8QO0h/1Gyb9
         AZHdkiYXBxRxul1+lONCQw8sYFvcb+e8eq6uUVdCb0msdXlx+biD8xMQ/5R7n8vwHtDg
         rB2yI0MM3m17q/uhCjS5dVl8O5ZZh98AhElapo4Cu0+QfLx7hWyFZZW9exoMrAuTeRhF
         s+r7uH0cvYdxdwtcYgsX1+WneDulTI4mDOWCJ5QiK+zTubLeaiB7AHun6Ogpbk0DYW53
         +xTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=a/DBFL5pnFxmW7r8pfJ654oUFkPKTYmOJJb8EXbuSt0=;
        b=hy2Ez+S5E6hlHniMPiNLfAaH8fKLVSCMtu6adQEAx40s4BOtmeW5ixuiut1V068T3X
         AcCjnibttCXtO7DKFisStwDrAyWqhgi+cFcjT1UxAakzMMBwiWdiYrCaw12Guxw9gGpA
         1Fc21nrbIa+x1i6w5ORfHhSNE/XMucdngYEc+JH0uKURoTTHEVjqsnVcTvnLhciATLxJ
         xXihk6E7kgCcpXblnBpXY0BWLRMTYMp0FCDG7coZB2cPaYqI1LEPKngalZeouYA4UHyj
         RGutaWfDQiaE00LwbMb0REr6DO/g9O/e5Hu9l6E5YrsX94SnBQGLA17Y6BkbeVFlfxuY
         l0UQ==
X-Gm-Message-State: APjAAAUuavlQ/x+Nc8JTQvca7BdpOHasFXQzVcjKjE6I/kalx8+bqyJP
        +6u7Cx4xtTonZ27pC/Ko9QV6
X-Google-Smtp-Source: APXvYqwfeUSVY+I+BE91ywKdosPDIWZNOPP+2KWQYwaDjVu4qL2UF2abRKSgkBQ77/hFHxq1DzSvDg==
X-Received: by 2002:a17:902:860b:: with SMTP id f11mr2458432plo.48.1566219726008;
        Mon, 19 Aug 2019 06:02:06 -0700 (PDT)
Received: from localhost.localdomain ([103.59.133.81])
        by smtp.googlemail.com with ESMTPSA id l123sm20626464pfl.9.2019.08.19.06.02.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Aug 2019 06:02:05 -0700 (PDT)
From:   Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
To:     sboyd@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        haitao.suo@bitmain.com, darren.tsao@bitmain.com,
        fisher.cheng@bitmain.com, alec.lin@bitmain.com,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Subject: [PATCH v3 2/8] clk: Warn if clk_init_data is not zero initialized
Date:   Mon, 19 Aug 2019 18:31:37 +0530
Message-Id: <20190819130143.18778-3-manivannan.sadhasivam@linaro.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20190819130143.18778-1-manivannan.sadhasivam@linaro.org>
References: <20190819130143.18778-1-manivannan.sadhasivam@linaro.org>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The new implementation for determining parent map uses multiple ways
to pass parent info. The order in which it gets processed depends on
the first available member. Hence, it is necessary to zero init the
clk_init_data struct so that the expected member gets processed correctly.
So, add a warning if multiple clk_init_data members are available during
clk registration.

Signed-off-by: Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
---
 drivers/clk/clk.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c
index c0990703ce54..7d6d6984c979 100644
--- a/drivers/clk/clk.c
+++ b/drivers/clk/clk.c
@@ -3497,6 +3497,14 @@ static int clk_core_populate_parent_map(struct clk_core *core)
 	if (!num_parents)
 		return 0;
 
+	/*
+	 * Check for non-zero initialized clk_init_data struct. This is
+	 * required because, we only require one of the (parent_names/
+	 * parent_data/parent_hws) to be set at a time. Otherwise, the
+	 * current code would use first available member.
+	 */
+	WARN_ON((parent_names && parent_data) || (parent_names && parent_hws));
+
 	/*
 	 * Avoid unnecessary string look-ups of clk_core's possible parents by
 	 * having a cache of names/clk_hw pointers to clk_core pointers.
-- 
2.17.1

