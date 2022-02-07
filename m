Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AF9FC4332F
	for <linux-clk@archiver.kernel.org>; Mon,  7 Feb 2022 19:03:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229690AbiBGTCm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 7 Feb 2022 14:02:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237936AbiBGS6a (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 7 Feb 2022 13:58:30 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78CDDC0401E1
        for <linux-clk@vger.kernel.org>; Mon,  7 Feb 2022 10:58:29 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id k13so28737793lfg.9
        for <linux-clk@vger.kernel.org>; Mon, 07 Feb 2022 10:58:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snejp.pl; s=gmail;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3LaHo6rvtgMcP8htqnUDS9n4P7x108y6xlwp9X2USgE=;
        b=D8LO7Cp2X8nXGl9l4bEBN8T8rjc4viTIRYcSoGaXpPafonUU736OG7ppuUjLJNqjhP
         EC2VlIyOuD7Zk0uBYOac7v/iHRr6QKfQFuSNeHBdQiuhmNpUJwnbIKYZDsy19JCfl0gr
         mrco6P1ON+hhUS6ksqzRB7E0odpVgvjzSx5UuzMIgyIAwhACHVTuBCQiUd6Hkqpo2juJ
         iMfZ9h4CK74NiGKF6qficn8pBiKdcS8twcb5smYZ5hvjH+q1MOh0Bh+96hMq1y7bUhtB
         SuSx3DcOgJHKX0A4wLb0Fr9V/xyAw5tOZGLIKYo7RgABRLV1gdSDpqoUbWRUQyNlOvn8
         U8qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=3LaHo6rvtgMcP8htqnUDS9n4P7x108y6xlwp9X2USgE=;
        b=TUlaaz6Z1Fg8GY/bbDU3Q60UwdyDNWygrytY6Us4yTC44cSspTZ1EVSW3Htu95K8SZ
         n6FkCwNDQC8mkcRVg6n4rw+qX6Z3Q57VfJn7taAswrF8j8TIw+x8cXKnZCrJwqk00/fe
         GewaljOXG1qHdDpR4ZOD8qgCwqTW/zDpnAN0GaxlFH4o2EQR3hkcN7HpQiYha+6/2nzq
         OKEfGMhXbqlEtLVQus4kAJVjbxCfOTYDocYJA0CsmUmGbwtzQBgG5GzMJXoaOM3dskth
         w6RHlJiOvKt4oUAnzCf7Ndp1jL7CmNLnlErb7SCkiSc0GXCQZxBIvwYSkmbKo2enVg4N
         A7sQ==
X-Gm-Message-State: AOAM5311bIQIWhIqrD6zOl6q/2eWrd/D5UGtwY0JUmzhUhufvwo0fTrI
        tPwZFOhj1VChCmerbBSU3HxLuFs1dCstQYMxnwY=
X-Google-Smtp-Source: ABdhPJy7hF9qyrjjwqDLWp1ssuOOYsjTj6/kbGKEPEQ5kxUhYNM2m+buO4lTDiqRDRg/eDazjC+PNg==
X-Received: by 2002:ac2:52a8:: with SMTP id r8mr616293lfm.220.1644260307759;
        Mon, 07 Feb 2022 10:58:27 -0800 (PST)
Received: from Lenovo330 ([82.160.139.10])
        by smtp.gmail.com with ESMTPSA id k10sm1599061lfo.187.2022.02.07.10.58.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 10:58:27 -0800 (PST)
Received: from localhost (Lenovo330 [local])
        by Lenovo330 (OpenSMTPD) with ESMTPA id 72d7be41;
        Mon, 7 Feb 2022 18:58:26 +0000 (UTC)
From:   Bartosz Dudziak <bartosz.dudziak@snejp.pl>
To:     Andy Gross <agross@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Jeffrey Hugo <jhugo@codeaurora.org>,
        Taniya Das <tdas@codeaurora.org>,
        linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, Luca Weiss <luca@z3ntu.xyz>
Cc:     Bartosz Dudziak <bartosz.dudziak@snejp.pl>
Subject: [PATCH v2 0/2] MSM8226 Multimedia Clock Controller
Date:   Mon,  7 Feb 2022 19:54:09 +0100
Message-Id: <20220207185411.19118-1-bartosz.dudziak@snejp.pl>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Implement the MSM8226 MMCC on the top of existing MSM8974 driver.

version 2 changes:
-replace `of_match_device()` with `of_device_get_match_data()`

Bartosz Dudziak (2):
  dt-bindings: clock: Add support for the MSM8226 mmcc
  clk: qcom: Add MSM8226 Multimedia Clock Controller support

 .../devicetree/bindings/clock/qcom,mmcc.yaml  |   1 +
 drivers/clk/qcom/mmcc-msm8974.c               | 206 +++++++++++++++++-
 2 files changed, 202 insertions(+), 5 deletions(-)

-- 
2.25.1

