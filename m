Return-Path: <SRS0=b9GY=MJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48B65C43382
	for <linux-clk@archiver.kernel.org>; Thu, 27 Sep 2018 14:45:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DAE99216C4
	for <linux-clk@archiver.kernel.org>; Thu, 27 Sep 2018 14:45:06 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="WmwuxokE"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org DAE99216C4
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727334AbeI0VDm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 27 Sep 2018 17:03:42 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34916 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727307AbeI0VDl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 27 Sep 2018 17:03:41 -0400
Received: by mail-wr1-f66.google.com with SMTP id o16so2950922wrx.2
        for <linux-clk@vger.kernel.org>; Thu, 27 Sep 2018 07:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:mime-version
         :content-transfer-encoding;
        bh=yFrvAVplhmN2YFC9txo34qKmvTq4Ooz+md+iX7txy9Y=;
        b=WmwuxokEAk/bwJXFhUdiiE29gwrn3Ts/q5wx3kRAH4/4FThSdQQuc+Xi2w93bdcjmr
         hLaxSkVN3Hx4upS941RdHUbCrgF1lbLXWmIA1uuPp6cZVNuQqyy6irLd6l14aNK0czdK
         V0t+AjyW5JxqH28FqjpAlAKm4QgOYF4WhSCWyIDeRH3FHuOYrnsu4PBfhOv/2RrHaJz1
         xgAp6TehIJ0tbJrJiQGF9v5NhAdLSEewBqtm913nXXV1iixsmQprdNspqSkojpCBz8pS
         Uesyr9t4maXSutyA1nlPi+iD5A88dK7LFkjm/MLpHHnAnovOailfaq9xnTb6FU0MtoUN
         bXIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:mime-version
         :content-transfer-encoding;
        bh=yFrvAVplhmN2YFC9txo34qKmvTq4Ooz+md+iX7txy9Y=;
        b=dNC7OBRyGnHxl4tDJetBCJAP3OOr26xI2wezFjOWZ8rw7NGku95aDDB0m9JkQNReSe
         1z325FqNjiDUVj50u7eb5N+TGVj+5L9DY7jXiKGznHeaNJvJ1F+DqUoBLUwQ7VI1dkTy
         bgV/wrboKAeBbFAaHkJSVe+h3K5FFT0g7m9D2+oCRS2W9+LrEyGOu3Y9A6gSnSpgYmbh
         kJfDy5mL5mPw2f+uS8YHfTdKFx2W+xiKBWlb9+wPYnAgP6EEClBJg1Hu400dul3X4H2K
         8Zts0JcQrwt4QlsEAk7XqHbfu/NzO11OKh/amhRLX+GyfebWnR+9cOyS8+1V5GbBvbs5
         qgmA==
X-Gm-Message-State: ABuFfoj7OfiP539ELSVxtsYraRczv7K6DIz9Yym+YOKvwkGpCI22GpRI
        S8H31jnwCpN6PKvOOX28gCw5UQ==
X-Google-Smtp-Source: ACcGV63L9YVkdilrAPDa2fdCetNO1yNPE1zb+/TwmnQezMR6M/XPtc9u1o/AcYgfkufVbxR/uOadDQ==
X-Received: by 2002:adf:9564:: with SMTP id 91-v6mr8917660wrs.60.1538059504236;
        Thu, 27 Sep 2018 07:45:04 -0700 (PDT)
Received: from boomer ([2a00:8c40:243:232:9287:a644:860c:5a1b])
        by smtp.gmail.com with ESMTPSA id w5-v6sm815487wmf.31.2018.09.27.07.45.03
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 27 Sep 2018 07:45:03 -0700 (PDT)
Message-ID: <ee3c1d81101e3e42218c696f663fb8716dfd53a7.camel@baylibre.com>
Subject: [GIT PULL] clk: meson: updates for v4.20
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     Neil Armstrong <narmstrong@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
Date:   Thu, 27 Sep 2018 16:45:02 +0200
Content-Type: text/plain; charset="UTF-8"
X-Mailer: Evolution 3.28.5 (3.28.5-1.fc28) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org
Message-ID: <20180927144502.SO1jPwdSxx34Kwqt5cCEmWa-J1HuGynPmKL6t9b0NXw@z>

Dear clock maintainers,

Below is a request to pull updates for Amlogic clocks.
There is not much out of the ordinary there, except:
- Even if we don't like it, the entire meson8b is now using
  CLK_OF_DECLARE_DRIVER(). Previously, only the reset controller
  part used this but it seems there is no way around it (yet) to
  handle certain things on this SoC, such as the TWD timer.
- We are a bit late compared to the usual schedule, sorry about that.

Thanks for pulling

Cheers
Jerome

The following changes since commit 5b394b2ddf0347bef56e50c69a58773c94343ff3:

  Linux 4.19-rc1 (2018-08-26 14:11:59 -0700)

are available in the Git repository at:

  git://github.com/BayLibre/clk-meson.git tags/meson-clk-4.20-1

for you to fetch changes up to 93c873d686461652921fe18b137ac28002dfe166:

  clk: meson: meson8b: use the regmap in the internal reset controller (2018-09-26 12:02:00 +0200)

----------------------------------------------------------------
Update for meson clocks targeted at v4.20

- clk-pll driver improvements and updates
- add axg audio controller system clocks
- drop mpll3 from the possible pcie clock parent of the axg
- register meson8b clock controller early

----------------------------------------------------------------
Jerome Brunet (5):
      clk: meson: clk-pll: add enable bit
      clk: meson: clk-pll: drop CLK_GET_RATE_NOCACHE where unnecessary
      clk: meson: clk-pll: remove od parameters
      clk: meson: clk-pll: drop hard-coded rates from pll tables
      clk: meson: axg: round audio system master clocks down

Martin Blumenstingl (2):
      clk: meson: meson8b: register the clock controller early
      clk: meson: meson8b: use the regmap in the internal reset controller

Yixun Lan (1):
      clk: meson-axg: pcie: drop the mpll3 clock parent

 drivers/clk/meson/axg-audio.c |  34 ++-
 drivers/clk/meson/axg.c       | 332 +++++++++++++++------------
 drivers/clk/meson/axg.h       |   8 +-
 drivers/clk/meson/clk-pll.c   | 156 ++++++++-----
 drivers/clk/meson/clkc.h      |  16 +-
 drivers/clk/meson/gxbb.c      | 518 +++++++++++++++++++++---------------------
 drivers/clk/meson/gxbb.h      |  10 +-
 drivers/clk/meson/meson8b.c   | 280 +++++++++++------------
 drivers/clk/meson/meson8b.h   |   5 +-
 9 files changed, 732 insertions(+), 627 deletions(-)


