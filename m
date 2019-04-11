Return-Path: <SRS0=5rVA=SN=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2DC73C10F13
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 08:45:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id E3D882082E
	for <linux-clk@archiver.kernel.org>; Thu, 11 Apr 2019 08:45:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="eodPEEfg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726861AbfDKIpl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 11 Apr 2019 04:45:41 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:46244 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726712AbfDKIpl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 11 Apr 2019 04:45:41 -0400
Received: by mail-wr1-f68.google.com with SMTP id t17so6139094wrw.13
        for <linux-clk@vger.kernel.org>; Thu, 11 Apr 2019 01:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:subject:date:message-id;
        bh=+8KV1rYOptyfogTlAgW1rSp2oGnqn2LH/HebVU6g4OY=;
        b=eodPEEfgGiM5Yns5TWxodKnukbFnK+yjnMpL327eI1HCD6REyONMTrmgUGTYoyb5vB
         L0o1khBew4M940ti80SA93Qp3gjMceiQno/8zSOHozcsMX+EbJaqlo7fteOniity29xa
         aelm3q7WE+MgyPW6SKodaONlC450SG3ntWyZV1RYIu3RCidWuFClHHCCf//pLu184aCW
         Ej5Vz31ZbVg6C/AmiLherWXuihf0AmF1DDF67znsMZaVUJK4Ji+oQP0SLk1IOWBZKkeO
         y8y2AzZp8ONvOVAlRgDA9xQcJWsmbQmocgwHWCEamka+oYDOzCKhDv4z542m0/uX+mHs
         P++w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:subject:date:message-id;
        bh=+8KV1rYOptyfogTlAgW1rSp2oGnqn2LH/HebVU6g4OY=;
        b=WaJeNL468geG0iY6V6f/3fWMT0rMlE+2jyXspX1P4BZe2h1dH6P/+XgUd2fv6i+XYN
         QK2WsdeAeO6II5v5WbWG1yfESgT5W8xZ15Qqg4fSuGOcH8E52YFHBnyCMPoyYA6eeIsi
         Ntifm0jo6oXNYMLbLipOaQ6WZb56deQokiIA92Hd1AMDqD6HvlGTrZ/V1hDLSDFdIHTt
         /daxCcZLzelgB12wsD3HPyGtXA+35NNZajN63Ujq/jkAa5kqfZICLGI/7fPbljaY6Uf6
         d91K7B3W9E6B1jphuKMBtkeG5hTu5+JhETuBEbzeKaS4W/wfOCgBUv9+4ZGc7KMT0Io6
         /lHg==
X-Gm-Message-State: APjAAAX76sR0dc3I+a8Ene/gQ14bKopKhkShZV+rhFRh90N7ghx2bB6w
        OIS42Wnhhew39O+QtELSyAc2eA==
X-Google-Smtp-Source: APXvYqwFPnGbM15P/fHGakMx0heW6tW0fam1knMzXhOVTLTlgzFAac4PWrVhbHJAFpKUdEcCGpImaA==
X-Received: by 2002:adf:e288:: with SMTP id v8mr24708101wri.7.1554972339567;
        Thu, 11 Apr 2019 01:45:39 -0700 (PDT)
Received: from glaroque-ThinkPad-T480.baylibre.local (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id 7sm128602876wrc.81.2019.04.11.01.45.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 11 Apr 2019 01:45:38 -0700 (PDT)
From:   Guillaume La Roque <glaroque@baylibre.com>
To:     jbrunet@baylibre.com, narmstrong@baylibre.com,
        khilman@baylibre.com, linux-amlogic@lists.infradead.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
Subject: [PATCH 0/2] Add support of Temperature sensor Clock for G12 SoC
Date:   Thu, 11 Apr 2019 10:45:35 +0200
Message-Id: <20190411084537.30299-1-glaroque@baylibre.com>
X-Mailer: git-send-email 2.17.1
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch series add support of Clock for temperature sensor
on Amlogic G12a SoC.

Guillaume

Guillaume La Roque (2):
  dt-bindings: clk: g12a-clkc: add Temperature Sensor clock ID
  clk: meson-g12a: Add Temperature Sensor clock

 drivers/clk/meson/g12a.c              | 31 +++++++++++++++++++++++++++
 drivers/clk/meson/g12a.h              |  3 ++-
 include/dt-bindings/clock/g12a-clkc.h |  1 +
 3 files changed, 34 insertions(+), 1 deletion(-)

-- 
2.17.1

