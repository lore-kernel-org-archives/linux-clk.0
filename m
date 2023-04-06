Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 961D4C7618D
	for <linux-clk@archiver.kernel.org>; Thu,  6 Apr 2023 01:11:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229623AbjDFBLC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 5 Apr 2023 21:11:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46488 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232832AbjDFBK2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 5 Apr 2023 21:10:28 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A309C6E89
        for <linux-clk@vger.kernel.org>; Wed,  5 Apr 2023 18:09:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1680743380;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding;
        bh=gHoyjTxQNsIixkHB5UoenspL4I5fGKVvNYeLFs2CchU=;
        b=GgfimKgv/spC3Tz8NwS4NAjT5VWiBiToKF1w0gFZV1Ohk6lDhZmCJXDVsm2PidMqmO2hnU
        F6jPW46klkAVsllJOiVoRBv3cwfZRol7MYA5i4YFhieVGhUv9h8x2oF1ZlXcqS4wnYKV/M
        Eo1q5CcLpKHtQ4rSo5JhQaDLg588WgU=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-171-afZiv1IlPGuggTcD4cVjsw-1; Wed, 05 Apr 2023 21:09:39 -0400
X-MC-Unique: afZiv1IlPGuggTcD4cVjsw-1
Received: by mail-qv1-f70.google.com with SMTP id v8-20020a0ccd88000000b005c1927d1609so17081680qvm.12
        for <linux-clk@vger.kernel.org>; Wed, 05 Apr 2023 18:09:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680743379;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gHoyjTxQNsIixkHB5UoenspL4I5fGKVvNYeLFs2CchU=;
        b=bqqYCdfD8f0yZS8JYxfEuLFsywFC2FLDjck1EA9ePfxgCUifMWtY6r+oUU71J7lfxR
         P4mBxJe5R1JABJqeaQi1ycILKHs7bjqXvlufcDbjDZSh73rRNHownYPfv7GI4RI2mdng
         2FurJS8a0EUSazB3p+YpSpY7y7ZOP1O0Ja2dM9jyhRCiXB49SUCGHZ/+prHMEICX+jQS
         +B7wEspOz536rn2By94JuoFp9/ChTAQUmR1Acxkk3aDqLNtfLx+3hp685IekFtWLmw0d
         h37uRwcIQi9YC1JXzOrRhgT/g9yNfkmae/ln4jHal0NSiz/bj65yNV67D7Okda6rVSJ4
         y1xw==
X-Gm-Message-State: AAQBX9ewAFD0KkH4y/WH6JUsyxQtZE0Xxw7LUErON+XXTsQQuhJQjaen
        51cgvrokCIwtF7UHTH0oqa3QR/NXdbdhKeDsss2WgDkypdieTv/nfHlydctY20r2fk1pxBrHiTk
        Hir22PBMIxVC+XXEMfs2K
X-Received: by 2002:ac8:5f10:0:b0:3db:7f42:ab0f with SMTP id x16-20020ac85f10000000b003db7f42ab0fmr8396458qta.67.1680743379362;
        Wed, 05 Apr 2023 18:09:39 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZIbqKuhrrAyaCl1AzzFxLvOp0zEgA8xN+j2J99j+/2qw3uGQfHd57fnQTzqA2s828Rsp3zMQ==
X-Received: by 2002:ac8:5f10:0:b0:3db:7f42:ab0f with SMTP id x16-20020ac85f10000000b003db7f42ab0fmr8396435qta.67.1680743379073;
        Wed, 05 Apr 2023 18:09:39 -0700 (PDT)
Received: from dell-per740-01.7a2m.lab.eng.bos.redhat.com (nat-pool-bos-t.redhat.com. [66.187.233.206])
        by smtp.gmail.com with ESMTPSA id f9-20020ac84989000000b003defe5ab4aesm56174qtq.94.2023.04.05.18.09.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Apr 2023 18:09:38 -0700 (PDT)
From:   Tom Rix <trix@redhat.com>
To:     mturquette@baylibre.com, sboyd@kernel.org, matthias.bgg@gmail.com,
        angelogioacchino.delregno@collabora.com, wenst@chromium.org,
        edward-jw.yang@mediatek.com, johnson.wang@mediatek.com
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mediatek@lists.infradead.org, Tom Rix <trix@redhat.com>
Subject: [PATCH] clk: mediatek: fhctl: set varaiables fhctl_offset_v1,2 storage-class-specifier to static
Date:   Wed,  5 Apr 2023 21:09:35 -0400
Message-Id: <20230406010935.1944976-1-trix@redhat.com>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

smatch reports
drivers/clk/mediatek/clk-fhctl.c:17:27: warning: symbol
  'fhctl_offset_v1' was not declared. Should it be static?
drivers/clk/mediatek/clk-fhctl.c:30:27: warning: symbol
  'fhctl_offset_v2' was not declared. Should it be static?

These variables are only used in one file so should be static.

Signed-off-by: Tom Rix <trix@redhat.com>
---
 drivers/clk/mediatek/clk-fhctl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/clk/mediatek/clk-fhctl.c b/drivers/clk/mediatek/clk-fhctl.c
index 45e4842cbf04..33b6ad8fdc2e 100644
--- a/drivers/clk/mediatek/clk-fhctl.c
+++ b/drivers/clk/mediatek/clk-fhctl.c
@@ -14,7 +14,7 @@
 #define PERCENT_TO_DDSLMT(dds, percent_m10) \
 	((((dds) * (percent_m10)) >> 5) / 100)
 
-const struct fhctl_offset fhctl_offset_v1 = {
+static const struct fhctl_offset fhctl_offset_v1 = {
 	.offset_hp_en = 0x0,
 	.offset_clk_con = 0x4,
 	.offset_rst_con = 0x8,
@@ -27,7 +27,7 @@ const struct fhctl_offset fhctl_offset_v1 = {
 	.offset_mon = 0x10,
 };
 
-const struct fhctl_offset fhctl_offset_v2 = {
+static const struct fhctl_offset fhctl_offset_v2 = {
 	.offset_hp_en = 0x0,
 	.offset_clk_con = 0x8,
 	.offset_rst_con = 0xc,
-- 
2.27.0

