Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C63E2C433EF
	for <linux-clk@archiver.kernel.org>; Mon, 13 Sep 2021 08:52:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B04BB61056
	for <linux-clk@archiver.kernel.org>; Mon, 13 Sep 2021 08:52:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238241AbhIMIxW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 13 Sep 2021 04:53:22 -0400
Received: from mout.kundenserver.de ([212.227.126.134]:44155 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238043AbhIMIxU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 13 Sep 2021 04:53:20 -0400
Received: from stretch.efe.local ([79.233.161.113]) by
 mrelayeu.kundenserver.de (mreue009 [212.227.15.167]) with ESMTPSA (Nemesis)
 id 1MlfCk-1mpj6T3Vsg-00ilSp; Mon, 13 Sep 2021 10:51:59 +0200
From:   Jens Renner <renner@efe-gmbh.de>
To:     linux-clk@vger.kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org, robh+dt@kernel.org,
        devicetree@vger.kernel.org, s.hauer@pengutronix.de,
        sebastian.hesselbarth@gmail.com, renner@efe-gmbh.de
Subject: [PATCH 0/2] clk: si5351: Add phase offset for clock output
Date:   Mon, 13 Sep 2021 10:51:38 +0200
Message-Id: <20210913085138.116653-1-renner@efe-gmbh.de>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Provags-ID: V03:K1:MCz4mSuAceS39e12bG4x0YrsDawKD2+VW3Rwv7KFnvAviNtJefT
 7YXWO3NyN9tS3cfCyHz5h0IpfkDE7SLVMlQige2P1c8vlrmpi24lYikKSWH2HtP7U8P1c9k
 BKT8gZ0EOKsFPWyPtJNyuh+6lXSPUJeYp2d5kOjQNl16df/0KQEjS4b7XL5LMsKHS1YE6u1
 C2/zdLNwcEHVl9D4ZQsyg==
X-UI-Out-Filterresults: notjunk:1;V03:K0:F1Lk2BgRaoQ=:07B5BSxneelK7DgwIRQDHJ
 tPBBLCV+RBbZypAFNUUq2+onX11tucPAvuxLY8O/SWpVvWHnpLU6okcaeiB/ueCuC2zqr0X59
 MW3BD+L9cW476+Ow92TvbdHmI4v3YEqvxdnyxuPEPR1f7/2ITdpOxp4vrwdynHruVMijBGM7H
 R0KEkOcEi2OhwLnYukW71OM4bljCAL4BTnbIOY4+uj7MZDMgcUaWKTH+FfTWEgHG0N0Ggritk
 TdQIyvoJTOkTFCE1xAA/DIYqDVAtwnSjwcsmBdVfhB2GQwK3MgKZoOTYn8aEjArwQ58R6CVCG
 /LRwhC39eZGcYWEMOWv8+D1dT9CxtNVRJj7ga7uD0qjyKhLGN9UIpvAyKeYCExG5TRrrIbgEe
 qkbWmzgxG4AyHR0GDlcY8JCu3m9OFhXzNzYA2iDX+RiZ29ItA22jcJGLnaU2HJvZb9AYKSzNM
 z/HwObTsDOE18V1d7qNXdCKBMDNWhBJpoQlPyevWOZ85SuiolqepXc9Am7GTaBHK6paF+634z
 1q/pVasGxAvYRebb0+RDAUcIWXlCgCL9kGz04YUGK0OhRMdS4fOm281IFR9SXcSRQIugq1f8W
 HuM59o6kBbqIArvMQJiVxaDLS9uk2fNHhEKWm7VwUdGzNqczuyD9MXfAmk3i01B8HfqOaBx2Y
 EZUZpvHMVgDlejEyda4xSlDrhYqK1ajIxUChHRpZyGwsaOHLvSNsHWPzybXe7/3fKdpn2IPBa
 8GN8zlSXAiDmWG+zDS58n/ReU0Rvu9Fc43LaeQ==
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This patch series adds a phase offset feature to the SI5351 clock
outputs. This is necessary to generate differential clocks or
arbitrary phase shifts with respect to other clock outputs.

Patch 1 adds the DT documentation to configure the phase offset.

Patch 2 implements the phase offset feature by adding *_set_phase()
functions to the multisynth and clockout stages.

Tested on a Xilinx Zynq (ARM Cortex-A9) board with Si5351A-B-GT for
several frequencies and phase offsets.

Jens Renner (2):
  clk: si5351: Add DT property for phase offset
  clk: si5351: Add clock output phase offset

 .../bindings/clock/silabs,si5351.txt          |  10 +-
 drivers/clk/clk-si5351.c                      | 234 +++++++++++++++++-
 drivers/clk/clk-si5351.h                      |   1 +
 include/linux/platform_data/si5351.h          |   2 +
 4 files changed, 243 insertions(+), 4 deletions(-)

-- 
2.33.0

