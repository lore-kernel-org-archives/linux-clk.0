Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 578ADC433FE
	for <linux-clk@archiver.kernel.org>; Fri,  3 Dec 2021 01:38:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377954AbhLCBlh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 2 Dec 2021 20:41:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47486 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377958AbhLCBl2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 2 Dec 2021 20:41:28 -0500
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02CF5C06174A
        for <linux-clk@vger.kernel.org>; Thu,  2 Dec 2021 17:37:30 -0800 (PST)
Received: by mail-ot1-x336.google.com with SMTP id 35-20020a9d08a6000000b00579cd5e605eso2193447otf.0
        for <linux-clk@vger.kernel.org>; Thu, 02 Dec 2021 17:37:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0IX7VBvn7NWi1LknLBHaVLXoYOBoRawJUhOn065lnpw=;
        b=JRJH2qlyWjZbCGhQsj/8MZq6Lwn0fIuLp/Dc1Samp2uQze8qQJtkyMuelJkep6VxAf
         07DonGQBLaXjhnXmP5HDrxEoj95Z2AchZFeLQvFnk22ChVo1NeijWnOr3iHKAddd8NNu
         LiunLfhDqJOW04xaWEtTAM5dSiBHXfOzdZ7PsoSu54qdleqHQDB17OXSzR+RSOrtmoAX
         uwl4McTrMieSNk25VmvwZsDwkDOAp6OpuHz45ZspbhyVmXd0z8iwd0AL0LMIPsmAXAgm
         zH99zOpZnkJPsBTlEFEs1z6GR1m3Bwk0xyg3ViNzmybwqemjcfbtYlfeT+XJqJSpp5HN
         qGUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=0IX7VBvn7NWi1LknLBHaVLXoYOBoRawJUhOn065lnpw=;
        b=Flt9Qw3D6K8MUYIS/9bsrnw9Ak5z+GGZmWqw7TF8bLa8+/I8sbU1zU+sWVruyzWlnT
         1Up9uZ/a4ziGTEbzrqDXmEKEuZlwp9+++ieK3UfKMMwTWc9KvJ1oK92+PVv0nVr3hb+T
         EF0+e4eDbo+QSVHn4SMcxL8IorwpxnA/vQrTzvc76zq0Qn7SK9QhPm738jfNjvu0eluG
         K1SVefDLCOajQGMA50qI+Ro5Jn+lK+2WlRYaxExmg97riRP8KcHuKjaVGhNtfZlQumtm
         X7FvgXTRUZ0ojbIOLSrEDVHg1426gYg0yWv3aiUFF3GIp97G6hHlE+732jYfxnuorhjO
         BPZw==
X-Gm-Message-State: AOAM533hHBCbP8PPXHXT605UX88TKfAmopGQxx4QBnI/LzXq5AGnFekz
        uSFxh6PDOP/eh8nDC21yV5QbZw==
X-Google-Smtp-Source: ABdhPJzb/5EkCMdfjL4J+cmlmwPkC7eXYxem6MJ509mG20Wcev7hszG6NX8Sle8RxgzOOMQ8KUN7SA==
X-Received: by 2002:a9d:5185:: with SMTP id y5mr13898744otg.110.1638495450204;
        Thu, 02 Dec 2021 17:37:30 -0800 (PST)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id e26sm321323oog.46.2021.12.02.17.37.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Dec 2021 17:37:29 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH] MAINTAINERS: Add entry for Qualcomm clock drivers
Date:   Thu,  2 Dec 2021 17:39:01 -0800
Message-Id: <20211203013901.3460496-1-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Most SoC specific clock drivers are picked by respective SoC maintainer
and then sent to the clock maintainers on their way upstream.

This has however not been the case for the Qualcomm clock drivers -
which doesn't actually have a maintainer per MAINTAINERS and where the
framework maintainers have just carried the Qualcomm effort as well,
presumably as a result of Stephen's history.

Move the maintainership of the Qualcomm clock drivers to use the same
model as other SoC vendors and document the ownership by actually
introducing an entry in MAINTAINERS.

Cc: Stephen Boyd <sboyd@kernel.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 88fcc4e7ff37..a644e2a5e79f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15671,6 +15671,15 @@ F:	Documentation/admin-guide/media/qcom_camss.rst
 F:	Documentation/devicetree/bindings/media/*camss*
 F:	drivers/media/platform/qcom/camss/
 
+QUALCOMM CLOCK DRIVERS
+M:	Bjorn Andersson <bjorn.andersson@linaro.org>
+L:	linux-arm-msm@vger.kernel.org
+S:	Supported
+T:	git git://git.kernel.org/pub/scm/linux/kernel/git/qcom/linux.git
+F:	Documentation/devicetree/bindings/clock/qcom,*
+F:	drivers/clk/qcom/
+F:	include/dt-bindings/clock/qcom,*
+
 QUALCOMM CORE POWER REDUCTION (CPR) AVS DRIVER
 M:	Niklas Cassel <nks@flawful.org>
 L:	linux-pm@vger.kernel.org
-- 
2.33.1

