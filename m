Return-Path: <SRS0=uslk=OM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59FEDC04EB9
	for <linux-clk@archiver.kernel.org>; Mon,  3 Dec 2018 13:19:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 21A192082F
	for <linux-clk@archiver.kernel.org>; Mon,  3 Dec 2018 13:19:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="PojLIeY3"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 21A192082F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726106AbeLCNUS (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 3 Dec 2018 08:20:18 -0500
Received: from mail-wr1-f65.google.com ([209.85.221.65]:37718 "EHLO
        mail-wr1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726052AbeLCNUE (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 3 Dec 2018 08:20:04 -0500
Received: by mail-wr1-f65.google.com with SMTP id j10so12126778wru.4
        for <linux-clk@vger.kernel.org>; Mon, 03 Dec 2018 05:19:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kB5h7/Rv1D1xOyHHlP5vWdrL7/AqkFtz/4BXIM0rK9U=;
        b=PojLIeY3MW0adsgpleN5wGL91ePZiK4bHuEPzWbp8iRQf9aOBjXrjkuJjgj0XlEg/b
         KWVx/quw7zUfLbHi8w53zvLr8asluoOFM38tJU6sE/YojRqOVV3SFa5QDrNR5OaIOjtg
         +g2ADTdPlkRBmbpCCqwdFhgdPtdXwejPIMXYWFsfUqiqX2wWGVFfMqT7SdsBblRGJXYo
         sQOkIq6lo6eg+GZ5T0OOMTZG5BcNIgFbo0/KVp49qmlZxEC+wxLwzFZb/bS4QTT+S/6G
         FAA9c7h5lqqG2znsuCzgCHC+3Ij/Ou9YxjiNh8745npYVHKJf9gBUaDI4lMmWzHuNyZw
         /lPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kB5h7/Rv1D1xOyHHlP5vWdrL7/AqkFtz/4BXIM0rK9U=;
        b=gzSEvtnUCB0ozF5F2UA4n4GAc0ZJt7wX8+lZ71hql0ZazuTEVwaAYBcoRQ7vfr3BKR
         aq6y1wy0HyVWel7ILjXQlZc62x412uSi5lLm8yckW4iCtbTcaguFD3AcoGDklejT5UkT
         TFcpyyf3Z1f7Vo1PshfDCSXJFjA9tORUsiZ3DMbe6UqxGaWY+wcD9An7qUfeO71YZcOw
         AurqxkhAjBR0hM8k7HNlrpe8tQ18MKnvp/g6oIo2wh+tR7JRwwCW5iItaQZqVs8SQiMS
         3rwEakWLqT1K8XhglmEGNH320oQd1hLhXyrc4SVFO86kYuJzmqrihOuINhnQca+RKFIr
         BM4w==
X-Gm-Message-State: AA+aEWYWd6zE2ICo7jUOkK0tSx49lztLVBGvCDmwcjn5JKgAudP1SHd0
        V7VESaQI9g2zKHkf0tTKQS7TFfo0mo4=
X-Google-Smtp-Source: AFSGD/UZF9UuEkYeIdajIAI7B7XhcajFUllHFzFJcGmdcIDTGR5C8gZ9gaClJ87PzrGgYeZqqPdjrw==
X-Received: by 2002:adf:fa05:: with SMTP id m5mr13759344wrr.155.1543843143160;
        Mon, 03 Dec 2018 05:19:03 -0800 (PST)
Received: from boomer.local ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
        by smtp.googlemail.com with ESMTPSA id n19sm6371063wmh.26.2018.12.03.05.19.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 03 Dec 2018 05:19:02 -0800 (PST)
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Neil Armstrong <narmstrong@baylibre.com>,
        Carlo Caione <carlo@caione.org>,
        Kevin Hilman <khilman@baylibre.com>
Cc:     Jerome Brunet <jbrunet@baylibre.com>,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/3] dt-bindings: clk: meson: add main controller clock input
Date:   Mon,  3 Dec 2018 14:18:49 +0100
Message-Id: <20181203131850.31388-3-jbrunet@baylibre.com>
X-Mailer: git-send-email 2.19.1
In-Reply-To: <20181203131850.31388-1-jbrunet@baylibre.com>
References: <20181203131850.31388-1-jbrunet@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Add the clock input of the main clock controller

Signed-off-by: Jerome Brunet <jbrunet@baylibre.com>
---
 .../devicetree/bindings/clock/amlogic,gxbb-clkc.txt          | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
index e950599566a9..a6871953bf04 100644
--- a/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
+++ b/Documentation/devicetree/bindings/clock/amlogic,gxbb-clkc.txt
@@ -9,6 +9,9 @@ Required Properties:
 		"amlogic,gxbb-clkc" for GXBB SoC,
 		"amlogic,gxl-clkc" for GXL and GXM SoC,
 		"amlogic,axg-clkc" for AXG SoC.
+- clocks : list of clock phandle, one for each entry clock-names.
+- clock-names : should contain the following:
+  * "xtal": the platform xtal
 
 - #clock-cells: should be 1.
 
@@ -31,6 +34,8 @@ sysctrl: system-controller@0 {
 	clkc: clock-controller {
 		#clock-cells = <1>;
 		compatible = "amlogic,gxbb-clkc";
+		clocks = <&xtal>;
+		clock-names = "xtal";
 	};
 };
 
-- 
2.19.1

