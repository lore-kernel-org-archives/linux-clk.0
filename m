Return-Path: <SRS0=uK82=OC=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6674C43441
	for <linux-clk@archiver.kernel.org>; Fri, 23 Nov 2018 15:23:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id A16DA206B2
	for <linux-clk@archiver.kernel.org>; Fri, 23 Nov 2018 15:23:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="f8I2pIZA"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org A16DA206B2
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2410085AbeKXCIO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 23 Nov 2018 21:08:14 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:35677 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388306AbeKXCIN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 23 Nov 2018 21:08:13 -0500
Received: by mail-wm1-f66.google.com with SMTP id c126so12292773wmh.0
        for <linux-clk@vger.kernel.org>; Fri, 23 Nov 2018 07:23:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=to:cc:from:subject:openpgp:autocrypt:organization:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=0tl8WTa8pIQ1yTF1QMAwLSeuxIws0UCdbwmGKzvatz8=;
        b=f8I2pIZAovQbk252Z5k28XfFZiHB/Nu5U2Z3bAvQ+UPi5brxwYT2tr8CH1QfcE2wbZ
         N0HAEpNgRPJI6p5qBbQ5lAV3olDGCpejxKWlXXPF3CHAG1+iOWWwfvuQkqCQPlJhG2LF
         F9ijY1RTsZaBFpBU8KizVIb07mXiRhFIVxPuma3HHIYOu0b0OTtbECNsOJ+uQTC9mn6K
         MVhCipaoKfz+3N/1cNEzZHekyM/Z3pRo1+dWJEZ/hoBe5y7AQTfe8nYgScTx5DsxuQEt
         SvcZC0OjofMyZ1t+XMGcTc+D+PotIChPwQBhqVyLoIG+Iev7m+klHpbPSph/M2GFS51F
         gx1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:openpgp:autocrypt
         :organization:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=0tl8WTa8pIQ1yTF1QMAwLSeuxIws0UCdbwmGKzvatz8=;
        b=glhFreT1XvTyuaBLbo7wMchkE6UJcojpiZ+E10vUfzGfGOmWYxkc9FUJ08YP08NZOI
         UMOPgrkK4Q1LwnTqhyNtMlqHC5FeGbcjbNbb/+fA5+Gm1r7T3t1FQXendZI7X/iNgZw7
         9ZXh94n6VPZ7nZGfFGiyUUQZNUPUng7gSrKTEQnXa5GAFy3FzL3mROjt2iJIoEJsYN9I
         TkHTL3MRdD5gGsKmXPupyVVySHLNBc08Vk91EqFEOGcbhcbJLHPfIbyvoORZKRYO72yV
         nZy8eA7OOsCnbQiCSSrr5Z6VOCJBSY8BAzclvmuodVTQxhzIjaAABHdbp2Sy4hnB3hVP
         Wqfw==
X-Gm-Message-State: AGRZ1gJUAI6y9KwSGphavodGDFEqmvIHJ26d1VUGc7iLKqI8q5r3+gl4
        BEs3Jr46jY6+mTGpSMAWEo+JOw==
X-Google-Smtp-Source: AFSGD/V1AeT2R61KKgVnrIPdMpA6jboiP8n+xTpghPATxLioVg9VMSoIYjZn8gcOjHTEkN5W4uFjdA==
X-Received: by 2002:a1c:9303:: with SMTP id v3-v6mr14775443wmd.82.1542986615145;
        Fri, 23 Nov 2018 07:23:35 -0800 (PST)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id s66sm8086222wmf.34.2018.11.23.07.23.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 23 Nov 2018 07:23:34 -0800 (PST)
To:     sboyd@kernel.org, mturquette@baylibre.com
Cc:     linux-clk@vger.kernel.org,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
From:   Neil Armstrong <narmstrong@baylibre.com>
Subject: [GIT PULL] clk: meson: updates for v4.21
Openpgp: preference=signencrypt
Autocrypt: addr=narmstrong@baylibre.com; prefer-encrypt=mutual; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKE5laWwgQXJtc3Ryb25nIDxuYXJtc3Ryb25nQGJheWxpYnJlLmNvbT7CwHsEEwEKACUC
 GyMGCwkIBwMCBhUIAgkKCwQWAgMBAh4BAheABQJXDO2CAhkBAAoJEBaat7Gkz/iubGIH/iyk
 RqvgB62oKOFlgOTYCMkYpm2aAOZZLf6VKHKc7DoVwuUkjHfIRXdslbrxi4pk5VKU6ZP9AKsN
 NtMZntB8WrBTtkAZfZbTF7850uwd3eU5cN/7N1Q6g0JQihE7w4GlIkEpQ8vwSg5W7hkx3yQ6
 2YzrUZh/b7QThXbNZ7xOeSEms014QXazx8+txR7jrGF3dYxBsCkotO/8DNtZ1R+aUvRfpKg5
 ZgABTC0LmAQnuUUf2PHcKFAHZo5KrdO+tyfL+LgTUXIXkK+tenkLsAJ0cagz1EZ5gntuheLD
 YJuzS4zN+1Asmb9kVKxhjSQOcIh6g2tw7vaYJgL/OzJtZi6JlIXOwE0ETVkGzwEIALyKDN/O
 GURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYpQTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXM
 coJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hi
 SvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY4yG6xI99NIPEVE9lNBXBKIlewIyVlkOa
 YvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoMMtsyw18YoX9BqMFInxqYQQ3j/HpVgTSv
 mo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUXoUk33HEAEQEAAcLAXwQYAQIACQUCTVkG
 zwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfnM7IbRuiSZS1unlySUVYu3SD6YBYnNi3G
 5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa33eDIHu/zr1HMKErm+2SD6PO9umRef8V8
 2o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCSKmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+
 RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJ
 C3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTTQbM0WUIBIcGmq38+OgUsMYu4NzLu7uZF
 Acmp6h8g
Organization: Baylibre
Message-ID: <8b905b7b-d72a-010f-bb2c-3cadeca603ed@baylibre.com>
Date:   Fri, 23 Nov 2018 16:23:33 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Dear clock maintainers,

Below is a request to pull updates for Amlogic clocks.

It covers essentially Meson GX Video clocks, Meson8b CPU clocks
and 2 bindings changes.

Thanks,
Neil

The following changes since commit 651022382c7f8da46cb4872a545ee1da6d097d2a:

  Linux 4.20-rc1 (2018-11-04 15:37:52 -0800)

are available in the Git repository at:

  git://github.com/BayLibre/clk-meson.git tags/meson-clk-4.21-1

for you to fetch changes up to a7d19b05ce817d60ae672c4c112e77892978dc3c:

  clk: meson: meson8b: add the CPU clock post divider clocks (2018-11-23 15:11:58 +0100)

----------------------------------------------------------------
Update for meson clocks targeted at v4.21
- Add GX video clocks
- Switch to HHI syscon for meson8b
- Fix meson8b cpu clock
- Add support for meson8b CPU scaling
- Add Meson8b CPU post-dividers clocks

----------------------------------------------------------------
Martin Blumenstingl (14):
      dt-bindings: clock: meson8b: export the CPU post dividers
      dt-bindings: clock: meson8b: use the registers from the HHI syscon
      clk: meson: meson8b: use the HHI syscon if available
      clk: meson: meson8b: fix incorrect divider mapping in cpu_scale_table
      clk: meson: meson8b: fix the width of the cpu_scale_div clock
      clk: meson: clk-pll: check if the clock is already enabled
      clk: meson: meson8b: do not use cpu_div3 for cpu_scale_out_sel
      clk: meson: meson8b: mark the CPU clock as CLK_IS_CRITICAL
      clk: meson: meson8b: add support for more M/N values in sys_pll
      clk: meson: meson8b: run from the XTAL when changing the CPU frequency
      clk: meson: meson8b: allow changing the CPU clock tree
      clk: meson: clk-regmap: add read-only gate ops
      clk: meson: meson8b: rename cpu_div2/cpu_div3 to cpu_in_div2/cpu_in_div3
      clk: meson: meson8b: add the CPU clock post divider clocks

Neil Armstrong (4):
      clk: meson: Add vid_pll divider driver
      clk: meson-gxbb: Fix HDMI PLL for GXL SoCs
      dt-bindings: clk: meson-gxbb: Add Video clock bindings
      clk: meson-gxbb: Add video clocks

 .../bindings/clock/amlogic,meson8b-clkc.txt        |  13 +-
 drivers/clk/meson/Makefile                         |   2 +-
 drivers/clk/meson/clk-pll.c                        |  19 +
 drivers/clk/meson/clk-regmap.c                     |   5 +
 drivers/clk/meson/clk-regmap.h                     |   1 +
 drivers/clk/meson/clkc.h                           |   6 +
 drivers/clk/meson/gxbb.c                           | 773 ++++++++++++++++++++-
 drivers/clk/meson/gxbb.h                           |  26 +-
 drivers/clk/meson/meson8b.c                        | 393 ++++++++++-
 drivers/clk/meson/meson8b.h                        |  17 +-
 drivers/clk/meson/vid-pll-div.c                    |  91 +++
 include/dt-bindings/clock/gxbb-clkc.h              |  18 +
 include/dt-bindings/clock/meson8b-clkc.h           |   4 +
 13 files changed, 1319 insertions(+), 49 deletions(-)
 create mode 100644 drivers/clk/meson/vid-pll-div.c
