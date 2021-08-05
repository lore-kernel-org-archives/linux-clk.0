Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1CFEDC432BE
	for <linux-clk@archiver.kernel.org>; Thu,  5 Aug 2021 17:19:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E8A2361132
	for <linux-clk@archiver.kernel.org>; Thu,  5 Aug 2021 17:19:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239108AbhHERTr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 5 Aug 2021 13:19:47 -0400
Received: from mail-0201.mail-europe.com ([51.77.79.158]:52812 "EHLO
        mail-0201.mail-europe.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239104AbhHERTr (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 5 Aug 2021 13:19:47 -0400
Date:   Thu, 05 Aug 2021 17:19:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail; t=1628183968;
        bh=mZ5hDbxACcTMRejNrvm5o3SgDu2wNo9qD49zWbJpoo8=;
        h=Date:To:From:Cc:Reply-To:Subject:From;
        b=Uq/Qkljrc8Lumb22Y80QlIUWCGPy6jzRDNX6eEJ51Snm/m29LetTfpHHNzfXq9oOK
         imSoPzxtT6ZLBUtrCXTfW0lNr1rsR/ktAECB6fuZ6rFi+BCiV8TPH4RL9ydRdqgStc
         JZfU/FasVb+8L95oa8iCGpGQA409BryJIv08IImQ=
To:     bjorn.andersson@linaro.org, sboyd@kernel.org
From:   Sireesh Kodali <sireeshkodali@protonmail.com>
Cc:     agross@kernel.org, mturquette@baylibre.com, robh+dt@kernel.org,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        phone-devel@vger.kernel.org, ~postmarketos/upstreaming@lists.sr.ht,
        Sireesh Kodali <sireeshkodali@protonmail.com>
Reply-To: Sireesh Kodali <sireeshkodali@protonmail.com>
Subject: [PATCH 0/2] Add rpmcc for MSM8953
Message-ID: <61Du39sy5yiN1xcir4yEOpkELdashqygFwNeY5wcHhk@cp3-web-020.plabs.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

This patch adds support for the RPM clocks found on the QCom MSM8953
platform (SDM450, SDA450, SDM625, SDM632, APQ8053). Since all SoCs based
on the MSM8953 platform have the same RPM clocks, a single compatible
string is used.

Vladimir Lypak (2):
  dt-bindings: clock: qcom-rpmcc: Add compatible for MSM8953 SoC
  clk: qcom: rpmcc: Add support for MSM8953 RPM clocks.

 .../devicetree/bindings/clock/qcom,rpmcc.txt  |  1 +
 drivers/clk/qcom/clk-smd-rpm.c                | 37 +++++++++++++++++++
 2 files changed, 38 insertions(+)

--=20
2.32.0


