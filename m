Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CFA8C76196
	for <linux-clk@archiver.kernel.org>; Tue, 11 Apr 2023 19:23:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229482AbjDKTX5 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 11 Apr 2023 15:23:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229531AbjDKTXz (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 11 Apr 2023 15:23:55 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC8DD4EDC
        for <linux-clk@vger.kernel.org>; Tue, 11 Apr 2023 12:22:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1681240927;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding;
        bh=qhq9dpmn2VnCwqB0zz5VnZkW7xe5Ahb4i2F79uPfYtI=;
        b=PrOSqhiV03g/OZOIIprxB9OTBb4XQCXVMj7oLEn3GRPu/WRRpaV7bsLv/O6xoZbkGj6CXA
        zYBb313CUIw1xWyB8RxmoRViB+6HWkujrtyorQqv5I86I61cPCScZFwAdM2NvYX5x65Qg6
        Ha6jYCoE57nwwmbbHO2wQvBgxSwvgMU=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-er07vm-bOLS4we7QNHXHsA-1; Tue, 11 Apr 2023 15:22:06 -0400
X-MC-Unique: er07vm-bOLS4we7QNHXHsA-1
Received: by mail-yb1-f200.google.com with SMTP id j6-20020a255506000000b00b8ef3da4acfso7074654ybb.8
        for <linux-clk@vger.kernel.org>; Tue, 11 Apr 2023 12:22:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1681240925;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qhq9dpmn2VnCwqB0zz5VnZkW7xe5Ahb4i2F79uPfYtI=;
        b=aVQcPraadoc1QRrpHoHwrjgKueC9jX9T9GjuxAODGIK1/jYOY17lKxD+Q1OhI77E5a
         xVwjit6CWcu/5+N2XMuuI35mJkCFlrmx9PQlDhSLGAU9xpcr+ka3ITGMisYfbYH8+2X5
         wpBUh3TLBr7NU/McFzGBTDEvdWyw+8tbKQJ4t8aq4e/7/DdsD5b6iWHErzxlWgkNLXLS
         BIlwpKozju1y5qh/IcIIJduB2JUca4QINjQXc6gd0kWGB88Jpwd2wO86zr3pAmc2UOWG
         x0rhbNVl1My8ZK7S/vhzWPCkHOQS8AGe1RlY/Zj5mRDLGAnCkCRcbalDweCcWDFMo+x9
         aohA==
X-Gm-Message-State: AAQBX9fd6nb12bLG5vxIRwbUuMLRPNGfeoBAjL77SRwAFeEiKiNDZEgs
        lNBITDyoOfFrb2rsNuHtU8JBmWC/bF1C1AE8NNCeZDgv3MtpXEkhHHqdWfJqcKXUb0sdLIqb9dG
        PIsiOUq0ITmjJM9CeLbyHqfPu3OA6
X-Received: by 2002:a81:4fc1:0:b0:54e:a6e3:4f28 with SMTP id d184-20020a814fc1000000b0054ea6e34f28mr11197580ywb.20.1681240924943;
        Tue, 11 Apr 2023 12:22:04 -0700 (PDT)
X-Google-Smtp-Source: AKy350bAvGxiyboI6lM0HhwWpo/+tevQ7im6CkFWSvHGl5+7rsYinPvTzZuQW64FTQLBwLf4ZWk5xg==
X-Received: by 2002:a81:4fc1:0:b0:54e:a6e3:4f28 with SMTP id d184-20020a814fc1000000b0054ea6e34f28mr11197566ywb.20.1681240924699;
        Tue, 11 Apr 2023 12:22:04 -0700 (PDT)
Received: from x1.redhat.com (c-73-214-169-22.hsd1.pa.comcast.net. [73.214.169.22])
        by smtp.gmail.com with ESMTPSA id f10-20020a81414a000000b00545a08184desm3687792ywk.110.2023.04.11.12.22.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Apr 2023 12:22:03 -0700 (PDT)
From:   Brian Masney <bmasney@redhat.com>
To:     corbet@lwn.net, sboyd@kernel.org
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        mturquette@baylibre.com, linux-doc@vger.kernel.org
Subject: [PATCH] docs: clk: add documentation to log which clocks have been disabled
Date:   Tue, 11 Apr 2023 15:21:53 -0400
Message-Id: <20230411192153.289688-1-bmasney@redhat.com>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-type: text/plain
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The existing clk documentation has a section that talks about the
clk_ignore_unused kernel parameter. Add additional documentation that
describes how to log which clocks the kernel disables on bootup. This
will log messages like the following to the console on bootup:

    [    1.268115] clk: Disabling unused clocks
    [    1.272167] clk_disable: gcc_usb_clkref_en
    [    1.276389] clk_disable: gcc_usb30_sec_sleep_clk
    [    1.281131] clk_disable: gcc_usb30_prim_sleep_clk
    ...

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 Documentation/driver-api/clk.rst | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/driver-api/clk.rst b/Documentation/driver-api/clk.rst
index 3cad45d14187..2199c0042e75 100644
--- a/Documentation/driver-api/clk.rst
+++ b/Documentation/driver-api/clk.rst
@@ -258,6 +258,11 @@ clocks properly but rely on them being on from the bootloader, bypassing
 the disabling means that the driver will remain functional while the issues
 are sorted out.
 
+You can see which clocks have been disabled by booting your kernel with these
+parameters:
+
+ tp_printk trace_event=clk:clk_disable
+
 To bypass this disabling, include "clk_ignore_unused" in the bootargs to the
 kernel.
 
-- 
2.39.2

