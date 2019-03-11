Return-Path: <SRS0=QyO6=RO=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8646CC4360F
	for <linux-clk@archiver.kernel.org>; Mon, 11 Mar 2019 15:42:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5595921900
	for <linux-clk@archiver.kernel.org>; Mon, 11 Mar 2019 15:42:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="key not found in DNS" (0-bit key) header.d=nelint.com header.i=@nelint.com header.b="IwH44vRg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727145AbfCKPmD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 11 Mar 2019 11:42:03 -0400
Received: from mail-pf1-f196.google.com ([209.85.210.196]:37328 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726675AbfCKPmC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 11 Mar 2019 11:42:02 -0400
Received: by mail-pf1-f196.google.com with SMTP id s22so3976862pfh.4
        for <linux-clk@vger.kernel.org>; Mon, 11 Mar 2019 08:42:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nelint.com; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references;
        bh=s9xRnixyHVoINZU2BQB3v+lhu5gym36tZtZUEmGxQn8=;
        b=IwH44vRgMPKuiG9iNmsRyK/Qjd5jSr45uCckQstvG5if5ko6Gjm64O5jMisjaCzPx6
         OCwrHna8cX0c/4LKcqtGrYfvUdK0LlwHNeIEcy1ZU59US0rqu74/JvC2FjaRQ3VkNhTi
         GoQhbPygHgYWIf9TbhWvTyywQ3Tut0rgBH4sY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references;
        bh=s9xRnixyHVoINZU2BQB3v+lhu5gym36tZtZUEmGxQn8=;
        b=YdFQcfMSTytrhMPOg7JrxasLNvIvyIszghibZQaawCJcgQ1Ou1UZmF0ON5AIBIm+rw
         lp+u6VBt1xO4/qEmT+BXnyOdvCrgqgZSrK300CVxDJMDiCv3/+42Kf3HTt7ep27bKfKb
         It4hnIhg3Uzpskwcd4vWPVTPKhtAfSafR4jBHu2RCaG6Yk9AcyOTTFossmE7VAbGEvAB
         r7aPuWOmfZ91s1uuIYQ2agmAqim9OhjXvXLSW3vd4/U2dOBpnCPTI5Ps8fRR4d+Vcr0h
         pfXn+nittMP6mPSrW9TX2GveQz4VHHifLkKsEd8IH/aDFBRdL0/agh0CSN02B4A9cyPZ
         /Vbw==
X-Gm-Message-State: APjAAAWlL6458d15tNx4KvVOda/UKd5f4kXbhugNIWCtg7ySuTcSLQAC
        w095J71bL7F7fmIfEMa0IV5RDQ==
X-Google-Smtp-Source: APXvYqwUKvhIvTrkXmpcshHM0lOrDzYR+PkR6aJhfJuIn53CaJfJiATAZjCKVt5qo78ApIA0bYukIw==
X-Received: by 2002:a63:d502:: with SMTP id c2mr8899921pgg.290.1552318921674;
        Mon, 11 Mar 2019 08:42:01 -0700 (PDT)
Received: from localhost.localdomain ([2600:8800:1301:2190:cc32:ad00:b1c0:818c])
        by smtp.gmail.com with ESMTPSA id z67sm14349347pfi.152.2019.03.11.08.41.59
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 11 Mar 2019 08:42:01 -0700 (PDT)
From:   Eric Nelson <eric@nelint.com>
To:     devicetree@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     anson.huang@nxp.com, colin.didier@devialet.com, festevam@gmail.com,
        kernel@pengutronix.de, l.stach@pengutronix.de,
        linux-arm-kernel@lists.infradead.org, linux-imx@nxp.com,
        linux-kernel@vger.kernel.org, mark.rutland@arm.com,
        mturquette@baylibre.com, robh+dt@kernel.org,
        s.hauer@pengutronix.de, sboyd@kernel.org, shawnguo@kernel.org,
        tiny.windzz@gmail.com, Eric Nelson <eric@nelint.com>
Subject: [V2 0/2] ARM: imx6qdl: remove PLL4_AUDIO_DIV clock
Date:   Mon, 11 Mar 2019 08:39:50 -0700
Message-Id: <1552318792-22565-1-git-send-email-eric@nelint.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1552304271.2453.12.camel@pengutronix.de>
References: <1552304271.2453.12.camel@pengutronix.de>
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This series removes the unsupported PLL4_AUDIO_DIV clock which appeared
in early versions of the i.MX6DQ reference manual, but doesn't function
as described in the current clock driver (i.e., it's a divide-by-1).

Since the clock node is also used to control the topology of the clock
tree, the PLL4_POST_DIV node is used to control parenting of downstream
SSI, CKO1, and ESAI/ASRC/SPDIF peripherals.

The first patch removes the clock, and the second updates several
device tree files to use PLL4_POST_DIV to select proper parents.

Eric Nelson (2):
  clk: imx6q: remove unsupported pll4_audio_div
  ARM: dts: imx6q: remove references to PLL4_AUDIO_DIV

 arch/arm/boot/dts/imx6q-cm-fx6.dts        |  4 ++--
 arch/arm/boot/dts/imx6q-novena.dts        |  2 +-
 arch/arm/boot/dts/imx6qdl-sabreauto.dtsi  |  2 +-
 drivers/clk/imx/clk-imx6q.c               |  7 +++----
 include/dt-bindings/clock/imx6qdl-clock.h | 10 +++++++++-
 5 files changed, 16 insertions(+), 9 deletions(-)

-- 
2.7.4

