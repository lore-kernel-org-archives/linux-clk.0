Return-Path: <SRS0=WJeD=SU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2BD19C10F0E
	for <linux-clk@archiver.kernel.org>; Thu, 18 Apr 2019 09:46:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F16C32184B
	for <linux-clk@archiver.kernel.org>; Thu, 18 Apr 2019 09:46:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="giwTdgDL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388461AbfDRJqk (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 18 Apr 2019 05:46:40 -0400
Received: from mail-wr1-f52.google.com ([209.85.221.52]:45474 "EHLO
        mail-wr1-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387971AbfDRJqk (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 18 Apr 2019 05:46:40 -0400
Received: by mail-wr1-f52.google.com with SMTP id s15so2123436wra.12
        for <linux-clk@vger.kernel.org>; Thu, 18 Apr 2019 02:46:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:user-agent:mime-version
         :content-transfer-encoding;
        bh=wFOSH+TsufDrAKB6RXYXQt2TcaPAfldbSHx2BWbJYxA=;
        b=giwTdgDLtuXlOhDzfRleqFVVXN3qd49xjhg7zFvtCVDgVFM/AgZTa+wOoYQOw6ujWK
         1T2hfER+HjAbHZ2JeD1kIgpx60Wa/Nc2fR0zi/C40KkrwsEQX34oY4IOL1hTcAhrJQhV
         QZOzCpPdhw+qfOfJbx3whHzw/F3Zn9s/9h13prV9MYIUpkPK6OtESz0vbQHpFMS34bQO
         wEZYInevOA6cVpQIu/4HRp34+IS7WhwXbrjcYPBnbiABwxCPwJUHHg6A9ak9IMqqGlrd
         vsw09u/q4I+2tPXS2IDF+zwKXk4V84pm5aHBtrB55O2BNKFjYWqf+moqSM9NJd9CygdP
         CW6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:user-agent
         :mime-version:content-transfer-encoding;
        bh=wFOSH+TsufDrAKB6RXYXQt2TcaPAfldbSHx2BWbJYxA=;
        b=iHlNcvjDaolz2FOZfHUVuLUfA7ToRda3Ww6jBmnRgJSsbr+B+CdElBp+T6/t6gMeEM
         nYnBUOXaZV+Ohef1Abf20rRTdKaUUBJL0QDoYQSYoLhlglPI0aK7Y66tnZlGh469vTOb
         W2abZFqDpbDcGdFySjmPdNZV64fxspDeLsKYSjBoVTXs5NxK9GFtBMa7WOcmxEylX6cw
         TA5UJJJ6GuwUtix4DZnC7iGWKWPy7kZHakIoh5syHQfKi7z4dm8tEmWa7ioxRDNB3Y0o
         9OT+MNtIw5Umz2TadyLp5urQEWC75VeWyc5UvOecw8Ym9SzCDCLBnHCeyN6hDRCpReTI
         9mbQ==
X-Gm-Message-State: APjAAAWemkmWpWV3eXYeJZ5BcA8tUVEjquMVC+8i0S5IE1RmSd+IdLpS
        hnBXHUVIg837gpmZphr48RPmsg==
X-Google-Smtp-Source: APXvYqyBPw54P/D5S15QzOu6VM+WQp28dmywCDDa7fGzE5cNP9k10SL38i22EjIlOj0Gz2EgNwRrXA==
X-Received: by 2002:a05:6000:12c8:: with SMTP id l8mr58866072wrx.80.1555580798198;
        Thu, 18 Apr 2019 02:46:38 -0700 (PDT)
Received: from boomer.baylibre.com (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id x192sm1724886wmf.48.2019.04.18.02.46.37
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 18 Apr 2019 02:46:37 -0700 (PDT)
Message-ID: <3d961b5ea14a7aae4088282955f926e19b7bc9d9.camel@baylibre.com>
Subject: [GIT PULL] clk: meson: 2nd update for v5.2
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     sboyd@kernel.org, Michael Turquette <mturquette@baylibre.com>
Cc:     Kevin Hilman <khilman@baylibre.com>,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>,
        linux-clk <linux-clk@vger.kernel.org>
Date:   Thu, 18 Apr 2019 11:46:36 +0200
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Dear clock maintainers,

Below is a request to pull another round of update for amlogic clocks.

The main purpose of this pull request is to add the g12a SoC family
support in the axg audio clock controller driver. It applies on top of
our previous PR.

Cheers

The following changes since commit 90751f686e3f0415f1f931bf47ff14dd34316ea5:

  clk: meson: meson8b: add the video decoder clock trees (2019-04-01 13:34:29 +0200)

are available in the Git repository at:

  git://github.com/BayLibre/clk-meson.git tags/meson-clk-5.2-2

for you to fetch changes up to 075001385c66a00fba9810b9ecb88d644384df88:

  clk: meson: axg-audio: add g12a support (2019-04-08 09:59:33 +0200)

----------------------------------------------------------------
* Do not register clock inputs in clock provider
* Add g12a support in the axg audio clock controller

----------------------------------------------------------------
Jerome Brunet (3):
      dt-bindings: clk: axg-audio: add g12a support
      clk: meson: axg_audio: replace prefix axg by aud
      clk: meson: axg-audio: don't register inputs in the onecell data

Maxime Jourdan (1):
      clk: meson: axg-audio: add g12a support

Neil Armstrong (1):
      Merge branch 'next/headers' into next/drivers

 .../bindings/clock/amlogic,axg-audio-clkc.txt      |    3 +-
 drivers/clk/meson/axg-audio.c                      | 1219 ++++++++++++--------
 drivers/clk/meson/axg-audio.h                      |   36 +-
 include/dt-bindings/clock/axg-audio-clkc.h         |   10 +
 4 files changed, 736 insertions(+), 532 deletions(-)

