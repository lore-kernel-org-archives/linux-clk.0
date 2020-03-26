Return-Path: <SRS0=aVCd=5L=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C25FC43331
	for <linux-clk@archiver.kernel.org>; Thu, 26 Mar 2020 11:56:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6E08C20748
	for <linux-clk@archiver.kernel.org>; Thu, 26 Mar 2020 11:56:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="CupBzcKu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728140AbgCZL4I (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 26 Mar 2020 07:56:08 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:44535 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727994AbgCZL4H (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 26 Mar 2020 07:56:07 -0400
Received: by mail-wr1-f68.google.com with SMTP id m17so7356403wrw.11
        for <linux-clk@vger.kernel.org>; Thu, 26 Mar 2020 04:56:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id;
        bh=6pDiC/vNUo0tQoGoVlyED4Dbo76GUrSdI4+9ml1GCKQ=;
        b=CupBzcKujMGWQGuYbWiVqop7oguuJLHKK68MGV+qTjKU7ypi1UAYry0YkFUNsTJrSC
         TDzsWem57n/zvp8vchaxu7fVG9fisKm0LNTA24/IJ9lWb02HO3D31ynPtSo+cFhnlsCm
         PO1FtP47MQRygZQJ6U61rCUwDwxEBu9kB1Dizta8chanHJ7LhTv0HsZ9o2jD8UTmxYxZ
         Ma2KQ4TQnGsMKrbqmelEtyyWxExwVt04qpfOPMsfhkoknOnd7K5Vrl2HEkap3RQ3ek39
         0r/y+F3ELaJ6QlxOvvXPy/uJYvuxjke7pZ+zFhnDP4ozS9BMSDP0RfnTsvFDud3YIslj
         D6Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=6pDiC/vNUo0tQoGoVlyED4Dbo76GUrSdI4+9ml1GCKQ=;
        b=OLX6/mblCjVCsKFfHqDnU3k7HWj8v/mAra3LGg3z1Rd6xNfJDigoICqu/vwm7GC6W4
         erg9RBNYcR3I8Agc8uIeU3NurK1toAhKL4WVDDrnDpx/Ye5cpyHkYDJ3NUb6cNHEHyQ+
         QGxXBndFVeLap+TSoZyiwoJbj5UgCbttf/FABCqlPeF6qqCJchWs3CiZKQYPiwsH9sR7
         TDzhzzfweP7UjMJgstpEqQt5aSvZzoozYeocDVakMfYjUbVKHEjFdYEHVwyv5bvdamQ7
         zZgctUz+0emspZho/m/1n1fmfe5JOgT8ZrS2bHt74rfyw0dXbikSYq1zaY9hz2QcNyrr
         Us5w==
X-Gm-Message-State: ANhLgQ2Xuwd0ZWvIokcFAXnf+TsetIc88n3ioE0mL5HosgTKJF/Ki9tP
        MzuegSAfEUdEx6lBF/8ofHkJMw==
X-Google-Smtp-Source: ADFU+vtI/ib9bvRjMW+0DMRFleI5gbWLIN6eLSR6kG4W1B/aAWAlNKIGdvXRgtS+MDo4n5lfIxVShQ==
X-Received: by 2002:a5d:4687:: with SMTP id u7mr8939916wrq.62.1585223765720;
        Thu, 26 Mar 2020 04:56:05 -0700 (PDT)
Received: from localhost.localdomain ([88.122.66.28])
        by smtp.gmail.com with ESMTPSA id o14sm3103270wmh.22.2020.03.26.04.56.04
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Thu, 26 Mar 2020 04:56:05 -0700 (PDT)
From:   Loic Poulain <loic.poulain@linaro.org>
To:     bjorn.andersson@linaro.org, mturquette@baylibre.com
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        Loic Poulain <loic.poulain@linaro.org>
Subject: [PATCH 0/4] msm8996 CPU scaling support
Date:   Thu, 26 Mar 2020 13:00:04 +0100
Message-Id: <1585224008-15730-1-git-send-email-loic.poulain@linaro.org>
X-Mailer: git-send-email 2.7.4
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This series is a new tentative for adding MSM8996 CPU scaling support
based on the previous Ilia's series, with some of the latest comments
addressed.

This series has been tested with dragonboard-820c and cpufreq-bench.
The CPU opps are limited to maximum nominal frequencies (no turbo).

Ilia Lin (2):
  soc: qcom: Separate kryo l2 accessors from PMU driver
  dt-bindings: clk: qcom: Add bindings for CPU clock for msm8996

Loic Poulain (2):
  clk: qcom: Add CPU clock driver for msm8996
  arch: arm64: dts: msm8996: Add opp and thermal

 .../devicetree/bindings/clock/qcom,kryocc.txt      |  17 +
 arch/arm64/boot/dts/qcom/msm8996.dtsi              | 338 ++++++++++++-
 drivers/clk/qcom/Kconfig                           |  10 +
 drivers/clk/qcom/Makefile                          |   1 +
 drivers/clk/qcom/clk-alpha-pll.h                   |   6 +
 drivers/clk/qcom/clk-cpu-8996.c                    | 547 +++++++++++++++++++++
 drivers/perf/Kconfig                               |   1 +
 drivers/perf/qcom_l2_pmu.c                         |  90 +---
 drivers/soc/qcom/Kconfig                           |   3 +
 drivers/soc/qcom/Makefile                          |   1 +
 drivers/soc/qcom/kryo-l2-accessors.c               |  56 +++
 include/soc/qcom/kryo-l2-accessors.h               |  12 +
 12 files changed, 1001 insertions(+), 81 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/clock/qcom,kryocc.txt
 create mode 100644 drivers/clk/qcom/clk-cpu-8996.c
 create mode 100644 drivers/soc/qcom/kryo-l2-accessors.c
 create mode 100644 include/soc/qcom/kryo-l2-accessors.h

-- 
2.7.4

