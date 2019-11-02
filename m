Return-Path: <SRS0=2Ghr=Y2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74827CA9EC7
	for <linux-clk@archiver.kernel.org>; Sat,  2 Nov 2019 14:37:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4941D20862
	for <linux-clk@archiver.kernel.org>; Sat,  2 Nov 2019 14:37:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q+OspviU"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726675AbfKBOhk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 2 Nov 2019 10:37:40 -0400
Received: from mail-wm1-f65.google.com ([209.85.128.65]:35755 "EHLO
        mail-wm1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726430AbfKBOhk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 2 Nov 2019 10:37:40 -0400
Received: by mail-wm1-f65.google.com with SMTP id 8so4752100wmo.0;
        Sat, 02 Nov 2019 07:37:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BERMe2PRWrqqvzVEB3hnHt7RUi7JRLGfZJJ6Qdlaz/U=;
        b=q+OspviUqdS3RaK+VpA6r2gurw2Jzcfs0+hastKDxxwLuVeUYEHfXE1nKILfdkRCcO
         NjDU1ZUBg69ZubDwBPe/28R0MsVGWfzmHkJ5fgX5keH006U85B99edI/x5ySd6CpjR1j
         FW6n1sU3TA+NStjeCTXO8EQq5a6IGs2xMREdmr8xn4nLFeInSZqBGDkQU5r4AYF/db+1
         bAplW+gYdbZ6++YudaEADX2kSiGyCJ4UuMlXXZlOcCQH0mKbackMedYfnmLcEs1hOq56
         tZ5esNAtw5r1efptowjCScdpcxzqVvR6u1880yhTUing3GO+AEU8ibVvl7cc5VxgEknl
         LCfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=BERMe2PRWrqqvzVEB3hnHt7RUi7JRLGfZJJ6Qdlaz/U=;
        b=abGlwxmFkwjl66X2KQa2AXV1ZaWDyO6ox+fmFMq9ixooO6MlnXy4WzpUaLzBK838G+
         Mgaa/Vs7Mvf86NrriBCedEk2q8SwgL4mgUbVAIKTYXXLK7WMz4Rgyj0504eQZVYnOpbp
         KA02dmM3In/8uEmgKoqS/4rG0URedE90+efxmL71TiNAX/FWifkg5gw6OGn1Z5Gnko1Z
         g+RYFP9SNv4Nht/SKMvL4A0/C8kBN4VT8Eko3Ta/Q8sKvC9h9y/EBSP2mGJ2z8RWFu83
         uFRR0LQ8ZQWhMYBD8gtweBp2rYIKov1isO0CWBXeoMnDER6BbEHxr1OcL2s1RJpCxhNE
         4T8Q==
X-Gm-Message-State: APjAAAV6X4UijzTBQt74CqX0z2/r6VP3V3GkA76ymr3wh0xdz6LnnNVg
        Fk7QeTH7EvjZLM4bzFRNnT6UbQHZ
X-Google-Smtp-Source: APXvYqx9Hy+O9UTDFkZmv9hdTJ+c3t6YNKjvMWj7w/hC1bzNvC+Yf1NEIuYcXuk2IuQihJK0WAB8Lg==
X-Received: by 2002:a1c:e404:: with SMTP id b4mr16526258wmh.90.1572705458532;
        Sat, 02 Nov 2019 07:37:38 -0700 (PDT)
Received: from localhost (p2E5BE2CE.dip0.t-ipconnect.de. [46.91.226.206])
        by smtp.gmail.com with ESMTPSA id t134sm13476427wmt.24.2019.11.02.07.37.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Nov 2019 07:37:37 -0700 (PDT)
From:   Thierry Reding <thierry.reding@gmail.com>
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
Subject: [GIT PULL 1/2] clk: Changes for v5.5-rc1
Date:   Sat,  2 Nov 2019 15:37:35 +0100
Message-Id: <20191102143736.3862768-1-thierry.reding@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Michael, Stephen,

The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:

  Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.5-clk-core

for you to fetch changes up to 837d3fa941cd270e3ac3c2fcf1290cfac4f195f6:

  clk: Add API to get index of the clock parent (2019-10-29 13:20:13 +0100)

Thanks,
Thierry

----------------------------------------------------------------
clk: Changes for v5.5-rc1

Contains a single core API addition that allows clock providers to query
the parent index for a given struct clk_hw. This is used to implement
suspend/resume support on Tegra SoCs.

----------------------------------------------------------------
Sowjanya Komatineni (1):
      clk: Add API to get index of the clock parent

 drivers/clk/clk.c            | 17 +++++++++++++++++
 include/linux/clk-provider.h |  1 +
 2 files changed, 18 insertions(+)
