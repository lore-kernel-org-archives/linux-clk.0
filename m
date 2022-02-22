Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC6A5C43217
	for <linux-clk@archiver.kernel.org>; Tue, 22 Feb 2022 13:28:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232439AbiBVN3L (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Feb 2022 08:29:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56054 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232430AbiBVN3K (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Feb 2022 08:29:10 -0500
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D2EC97B96
        for <linux-clk@vger.kernel.org>; Tue, 22 Feb 2022 05:28:44 -0800 (PST)
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com [209.85.218.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id B83E73FCAC
        for <linux-clk@vger.kernel.org>; Tue, 22 Feb 2022 13:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1645536522;
        bh=syQJnDJvIk7oDut501097JANOAQimJJ8XX+nOUPJjUo=;
        h=From:To:Cc:Subject:Date:Message-Id:MIME-Version;
        b=SpwWIDK079KsZengzmEv7Z0tWqAsfgDccqZg/evf9Aep7QIQA6kKGZJ9qo9IMKUyL
         ceIhsXdXVYbxsIvN28bBnyZQXkvvIYOmRSYWVZEwYWHQ5ipWWv2Tjpx1ecsjQHu2mi
         VYexBbTwFXCi0Lz07FCHf3Ad2dHa/GjqWPOfODFikl7DHKj3y4OPkOQpFNxsdg2vqE
         98wf7OMaNV26+zIxuFIzlICNTdIK0SW1ko7zuseztlVf2l265XqAOOYM/x5nu+gtkk
         sFjnZBZdDw9OkkF2izQCFkTRRd4RnuzfC9MS/01Mmz1GgCfP0mGxo8xqZDnBDHnp25
         dUHc22fReuncA==
Received: by mail-ej1-f72.google.com with SMTP id h22-20020a1709060f5600b006b11a2d3dcfso5781808ejj.4
        for <linux-clk@vger.kernel.org>; Tue, 22 Feb 2022 05:28:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=syQJnDJvIk7oDut501097JANOAQimJJ8XX+nOUPJjUo=;
        b=MLzqLZQ0cfXDIOrfvCDLVDRq2QRmNwJy+8/nIXGa6zGHlYLRL4gjlmT/GjqVgZhUGW
         XmO/T9/FV7VQOdlk9SbPVoa5ZmV1j2ptYxARKbDN0RlhoN2UqwbSmsKWjBRiVRqRUy78
         V9acw7RNaW5VDCW5Oig1wi6LRkk4SZaI7yP0B8OFvQwfFnrZizGgP0Ll2vKRGy3r/msT
         g9KyTFd5IC3hPYLSXQzO+5sSA/b9W6i0FSzXXorGrVLSycYgoU1JWDIK5lfatLufGdTa
         wU+LjulmNfkWfvnPDFmn2DiMXed0us1EHGni/jeldSvLrSoOH4TeX+jf01zySG5VDSma
         PDUw==
X-Gm-Message-State: AOAM532Q6hGGoojzpkVSoTWgX7g/GAg3HjXWrD0nZ/3zrS7LznW4OkoD
        au1ywAVTPGkahAjEHUCWpZh6d2mul/KXUF6C/JNAsIYlQXmytC8YbhJYrE2BvgpZTclfzVoCpX9
        DZk/pmwzid9XaMY6VAQsQgfx30tUu/zxaz8i80Q==
X-Received: by 2002:a17:906:d935:b0:6cc:fcfc:c286 with SMTP id rn21-20020a170906d93500b006ccfcfcc286mr19267959ejb.423.1645536520190;
        Tue, 22 Feb 2022 05:28:40 -0800 (PST)
X-Google-Smtp-Source: ABdhPJzyrFfwlMx3wyhaWOiWMYUuCZ2Sd0V6lJlo9wHP9II92B5eFvZo3+bHsg4+GgnT5+leTtK+fA==
X-Received: by 2002:a17:906:d935:b0:6cc:fcfc:c286 with SMTP id rn21-20020a170906d93500b006ccfcfcc286mr19267945ejb.423.1645536520030;
        Tue, 22 Feb 2022 05:28:40 -0800 (PST)
Received: from localhost.localdomain (xdsl-188-155-181-108.adslplus.ch. [188.155.181.108])
        by smtp.gmail.com with ESMTPSA id c5sm10029875edk.43.2022.02.22.05.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Feb 2022 05:28:39 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
To:     Abel Vesa <abel.vesa@nxp.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Srinivas Kandagatla <srinivas.kandagatla@linaro.org>,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, alsa-devel@alsa-project.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
Subject: [RFT PATCH 0/3] Fix kfree() of const memory on setting driver_override
Date:   Tue, 22 Feb 2022 14:27:04 +0100
Message-Id: <20220222132707.266883-1-krzysztof.kozlowski@canonical.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

Drivers still seem to use driver_override incorrectly. Perhaps my old
patch makes sense now?
https://lore.kernel.org/all/1550484960-2392-3-git-send-email-krzk@kernel.org/

Not tested - please review and test (e.g. by writing to dirver_override
sysfs entry with KASAN enabled).

Dependencies
============
Patches are independent.

Best regards,
Krzysztof

Krzysztof Kozlowski (3):
  clk: imx: scu: fix kfree() of const memory on setting driver_override
  slimbus: qcom-ngd: fix kfree() of const memory on setting
    driver_override
  rpmsg: fix kfree() of const memory on setting driver_override

 drivers/clk/imx/clk-scu.c       |  6 +++++-
 drivers/rpmsg/rpmsg_internal.h  | 12 ++++++++++--
 drivers/rpmsg/rpmsg_ns.c        | 13 +++++++++++--
 drivers/slimbus/qcom-ngd-ctrl.c |  9 ++++++++-
 4 files changed, 34 insertions(+), 6 deletions(-)

-- 
2.32.0

