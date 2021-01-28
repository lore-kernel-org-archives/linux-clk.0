Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-24.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5432FC433DB
	for <linux-clk@archiver.kernel.org>; Thu, 28 Jan 2021 08:24:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EF28964DA1
	for <linux-clk@archiver.kernel.org>; Thu, 28 Jan 2021 08:24:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231639AbhA1IYC (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 28 Jan 2021 03:24:02 -0500
Received: from mail.kernel.org ([198.145.29.99]:43880 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231480AbhA1IX7 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 28 Jan 2021 03:23:59 -0500
Received: by mail.kernel.org (Postfix) with ESMTPSA id 02CA66146D;
        Thu, 28 Jan 2021 08:23:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1611822199;
        bh=CQBovfnWJxAhmRsLyg6LrP1ewiw9l3fdA2O+HOSM2H0=;
        h=From:To:Cc:Subject:Date:From;
        b=cB/LaC7D5FQgeHr1GJYANYDCrtLovjooLl6RiED3calsUTRsiukH5feXnlgc0XW/I
         PrOy7U3UZrG0ORlQyBq8hE3J0r0BFZ5emohqGFe4aetAlozQIkCrNiy4+uBFWkjPKn
         fuIQWo6BYC+OPRvgo6i8b90oApLjdX80xyle72aIAIoxQqNu1qBXhHMmC3QxQ+/eyq
         9KqA0/IohP6CaES6AHlv01xT/RpOqyLzp5EAgTHK+kSTOgL1U5eUZVLzPZBQWXg9X2
         17LYxIfS3dvllexAw+qM1TqY99B4QKH3KkK0aAMEk6IIzlthpb6KIvmD2RfdbDvj3w
         xLLSSmuzDe3TQ==
From:   Stephen Boyd <sboyd@kernel.org>
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] clk fixes for v5.11-rc5
Date:   Thu, 28 Jan 2021 00:23:18 -0800
Message-Id: <20210128082318.3265480-1-sboyd@kernel.org>
X-Mailer: git-send-email 2.30.0.280.ga3ce27912f-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

The following changes since commit 5c8fe583cce542aa0b84adc939ce85293de36e5e:

  Linux 5.11-rc1 (2020-12-27 15:30:22 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git tags/clk-fixes-for-linus

for you to fetch changes up to c361c5a6c559d1e0a2717abe9162a71aa602954f:

  clk: mmp2: fix build without CONFIG_PM (2021-01-12 12:10:55 -0800)

----------------------------------------------------------------
A handful of clk driver fixes

 - Build fix for CONFIG_PM=n in the mmp2 driver
 - Kconfig warning for unmet dependencies in the i.MX driver
 - Make the camera AHB clk always be enabled on qcom sc7180
 - Use rate round down semantics for qcom sm8250 SD clks

----------------------------------------------------------------
Arnd Bergmann (2):
      clk: imx: fix Kconfig warning for i.MX SCU clk
      clk: mmp2: fix build without CONFIG_PM

Dmitry Baryshkov (1):
      clk: qcom: gcc-sm250: Use floor ops for sdcc clks

Taniya Das (1):
      clk: qcom: gcc-sc7180: Mark the camera abh clock always ON

 drivers/clk/imx/Kconfig       |  2 --
 drivers/clk/mmp/clk-audio.c   |  6 ++++--
 drivers/clk/qcom/gcc-sc7180.c | 21 +++------------------
 drivers/clk/qcom/gcc-sm8250.c |  4 ++--
 4 files changed, 9 insertions(+), 24 deletions(-)

-- 
https://git.kernel.org/pub/scm/linux/kernel/git/clk/linux.git/
https://git.kernel.org/pub/scm/linux/kernel/git/sboyd/spmi.git
