Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DB355C433F5
	for <linux-clk@archiver.kernel.org>; Thu, 19 May 2022 21:42:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243965AbiESVmF (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 19 May 2022 17:42:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34376 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S245277AbiESVl6 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 19 May 2022 17:41:58 -0400
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com [IPv6:2a00:1450:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A57146669
        for <linux-clk@vger.kernel.org>; Thu, 19 May 2022 14:41:43 -0700 (PDT)
Received: by mail-lf1-x130.google.com with SMTP id h29so11312212lfj.2
        for <linux-clk@vger.kernel.org>; Thu, 19 May 2022 14:41:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uhWv3WU/goe9H6RrJwLR0rTAD91mkctsas9oxeosiUM=;
        b=nyeu2b4E3gZ3IXbMKNXIPrdWezcBSqYuRLJpF1y1WlKymAKjIgBLRVz/iXZjHjDHi6
         M+0RV/heVO4jtBcqcSGZLDz5CMyYgLEGXhlez7iA+ueHzEtvQ7JlcpK+HL8YuvqSiA7u
         j1XMxyFPoYko19tEOSGKR46byC02Gz3ZGxW6Tuk4bRRNedHDrrxfTbrgwEt1WwJCLjwv
         ThI4O4spv6vGRjhXlvbR++kldsVrqNYEx4XCQQpdNL3KgAl1fhHIeKbT6OnS1Hi0SoUH
         tkNqVVJR/71ROyteS0DlsrZxgW9IFndZk8HKXzxe+6aKRErcSgIQCqE1ByIJSMjmG10U
         oTCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=uhWv3WU/goe9H6RrJwLR0rTAD91mkctsas9oxeosiUM=;
        b=1FPJH1HvJo35kSx2y0peRRqyvn3zXa+snP6gopD3Pw5VRAum7J/xDlSc0jgIFMXpSB
         x2x37O80IW5fDjTCAxdOKSo4Zuj/F0qmOLbCR2H2wE8recZlywpmHSi2f0xXo/45cy1q
         HqQrHPqlQ/rpubrifiGcwfON9MfWwluVxhpkaML2VcreoCr9sKnWiit4pYTweGhxcAWQ
         jTDXXf0WPb8vK03k5uStObjtuGsya1SlW/K9zjAjfmsjqLGsuxUiBv8vbcKlfFGh0u8o
         AGC0lQm333QfsyX9GpktYlZ+lXNSDfZe+yR6GFvdWxQQOH+QXyMunQAWns2JHSKUlIOm
         j9zA==
X-Gm-Message-State: AOAM530Rs07ViTXcX9jjeNxrmyfe/WqQtoCs0gtEx1vO9bPOKKUclyO5
        +SSmSZ61RyzduNDWokMuAY7x8w==
X-Google-Smtp-Source: ABdhPJzYtulIEkUhT539jaV9/eLzgB0KNC0oraTnZ7zeaABujW1vbk569+5FteRKm1O2ht9lG/HVwQ==
X-Received: by 2002:ac2:4e14:0:b0:474:1f4d:9b86 with SMTP id e20-20020ac24e14000000b004741f4d9b86mr4712932lfr.257.1652996502848;
        Thu, 19 May 2022 14:41:42 -0700 (PDT)
Received: from localhost.localdomain (mobile-access-b04822-211.dhcp.inet.fi. [176.72.34.211])
        by smtp.gmail.com with ESMTPSA id l12-20020a2e99cc000000b0024f3d1dae9dsm53576ljj.37.2022.05.19.14.41.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 May 2022 14:41:42 -0700 (PDT)
From:   Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Robert Foss <robert.foss@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org
Subject: [PATCH 0/2] clk: qcom: Fix topology around titan_top power domain
Date:   Fri, 20 May 2022 00:41:31 +0300
Message-Id: <20220519214133.1728979-1-vladimir.zapolskiy@linaro.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On SDM845 abd SM8250 platforms two found VFE GDSC power domains shall
not be operated, if titan top is turned off, thus the former power
domains will be set as subdomains by a GDSC registration routine.

The fixes allow to drastically simplify power domain management in CAMSS
driver.

Vladimir Zapolskiy (2):
  clk: qcom: camcc-sdm845: Fix topology around titan_top power domain
  clk: qcom: camcc-sm8250: Fix topology around titan_top power domain

 drivers/clk/qcom/camcc-sdm845.c | 4 ++++
 drivers/clk/qcom/camcc-sm8250.c | 4 ++++
 2 files changed, 8 insertions(+)

-- 
2.33.0

