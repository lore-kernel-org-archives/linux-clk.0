Return-Path: <SRS0=hoZU=QU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49FCDC282C2
	for <linux-clk@archiver.kernel.org>; Wed, 13 Feb 2019 09:11:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 07EE7222BB
	for <linux-clk@archiver.kernel.org>; Wed, 13 Feb 2019 09:11:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="VDa332ju"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729700AbfBMJLl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 13 Feb 2019 04:11:41 -0500
Received: from mail-wr1-f47.google.com ([209.85.221.47]:40550 "EHLO
        mail-wr1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728468AbfBMJLl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 13 Feb 2019 04:11:41 -0500
Received: by mail-wr1-f47.google.com with SMTP id q1so1575585wrp.7
        for <linux-clk@vger.kernel.org>; Wed, 13 Feb 2019 01:11:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:subject:to:cc:openpgp:autocrypt:organization:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=L+P3gxUpaewcw9n39ZadRS8MkXSKzNofqtUDsGlWBZw=;
        b=VDa332juxzdKw81P3+o7xp2dMUWKvuBaPKT52bcbh5imdL71tWjPYBeHAQzxjxXtFG
         6E86JYKy9iDhxDiUFajk5p7zvlefvz66oUzR2g4FHFT6iBa9+vH5dsFfF5KCEK6qDND9
         LqZ8X9EMA4AXrro08dE+Eb2SF+dCQ75Qc4r7/xQsuFJNEVhI7J7WmXvUApqjgMOnwdce
         XuG94pV/dHq369Gi/YZzL8IXDtb0WQnl3G62j9rMRvkSMDgzxgDl0O2wYM194Q1MLon9
         I3HowtXOskwkCgSpH/AFu+ladFa2LjYP4ywGjXOz3+hp0u+EVmw9jjoDfqNpB9OScB3G
         j1Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:openpgp:autocrypt
         :organization:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=L+P3gxUpaewcw9n39ZadRS8MkXSKzNofqtUDsGlWBZw=;
        b=peCnjgAsm2gL1X5nHcXtQHQXEncRlJjGJ9eY/XoIiLzMgRjFNfeAgAEl+CDkAebBV8
         X2raO5EUv+cHHphnBqPmrDs8ypTUJijaS6iTB7LQpbsRLce7sMHAcqUzjBgBgkA2U2AR
         ZdGaVl3tk7YhbTzmwZKUvCan4UpHFQH4XnTPmkHunqMfeMYbEUJE8hhjPudCaLRwu9Qr
         6n+G4zngMUIqZN4i6GoJ9RpNuYWG8ZvNque7qsUq/URGUy2mrsXmiUaJbJcXOnXXrDnN
         s2m7yqvRqksvcRO+K7mejoDEaizs3wOJrRqYp7lJzKRe+uySBWaknRjiIqZK9XXgSfXI
         kvbA==
X-Gm-Message-State: AHQUAuZ54xI+7Bh39HCn2qKiV5mTKYWTqaSPNxHPFX5pcdYLnXUHAPy7
        l6CmTwCDOedqSRmz6uQbTpnhvw==
X-Google-Smtp-Source: AHgI3IaN0aStakC2EiIEqdsB3eTGuNn7SIjtD6ivsLleZDo/kOGgh4GHksL3sNexZRSDpJvXsIBnbQ==
X-Received: by 2002:adf:b741:: with SMTP id n1mr6043489wre.287.1550049099000;
        Wed, 13 Feb 2019 01:11:39 -0800 (PST)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id q9sm4464256wmc.10.2019.02.13.01.11.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 13 Feb 2019 01:11:38 -0800 (PST)
From:   Neil Armstrong <narmstrong@baylibre.com>
Subject: [GIT PULL] clk: meson: updates for v5.1 round2
To:     sboyd@kernel.org, mturquette@baylibre.com
Cc:     linux-clk@vger.kernel.org,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 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
 ZaTUOEkgIor5losDrePdPgE=
Organization: Baylibre
Message-ID: <e115449e-085c-8f82-b345-f610b5e735db@baylibre.com>
Date:   Wed, 13 Feb 2019 10:11:37 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Dear clock maintainers,

Below is a request to pull updates for Amlogic clocks for 5.1, round 2.

It adds the G12A Always-On clock controller and a simple typo fix
for a clock name on Meson8.

Thanks,
Neil

The following changes since commit 6682bd4d443fad802e11a0a39332025cdfbf5108:

  clk: meson: factorise meson64 peripheral clock controller drivers (2019-02-04 09:52:11 +0100)

are available in the Git repository at:

  git://github.com/BayLibre/clk-meson.git tags/meson-clk-5.1-2

for you to fetch changes up to c5f09e6bd8a7537beef8ee53cd161a06b04de271:

  clk: meson: meson8b: fix the naming of the APB clocks (2019-02-13 09:51:09 +0100)

----------------------------------------------------------------
- Add G12A Always-On Clock Controller
- Fix Meson8 APB clock ID name

----------------------------------------------------------------
Martin Blumenstingl (2):
      dt-bindings: clock: meson8b: add APB clock definition
      clk: meson: meson8b: fix the naming of the APB clocks

Neil Armstrong (2):
      dt-bindings: clk: add G12A AO Clock and Reset Bindings
      clk: meson: Add G12A AO Clock + Reset Controller

 .../bindings/clock/amlogic,gxbb-aoclkc.txt         |   1 +
 drivers/clk/meson/Kconfig                          |   2 +
 drivers/clk/meson/Makefile                         |   2 +-
 drivers/clk/meson/g12a-aoclk.c                     | 454 +++++++++++++++++++++
 drivers/clk/meson/g12a-aoclk.h                     |  34 ++
 drivers/clk/meson/meson8b.c                        |  26 +-
 drivers/clk/meson/meson8b.h                        |   2 +-
 include/dt-bindings/clock/g12a-aoclkc.h            |  34 ++
 include/dt-bindings/clock/meson8b-clkc.h           |   1 +
 include/dt-bindings/reset/g12a-aoclkc.h            |  18 +
 10 files changed, 559 insertions(+), 15 deletions(-)
 create mode 100644 drivers/clk/meson/g12a-aoclk.c
 create mode 100644 drivers/clk/meson/g12a-aoclk.h
 create mode 100644 include/dt-bindings/clock/g12a-aoclkc.h
 create mode 100644 include/dt-bindings/reset/g12a-aoclkc.h
