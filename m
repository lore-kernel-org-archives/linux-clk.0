Return-Path: <SRS0=DnCL=OU=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.9 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5FE6C5CFFE
	for <linux-clk@archiver.kernel.org>; Tue, 11 Dec 2018 15:15:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8DF0C2084C
	for <linux-clk@archiver.kernel.org>; Tue, 11 Dec 2018 15:15:12 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="CMBh+GtB"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 8DF0C2084C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726506AbeLKPPM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 11 Dec 2018 10:15:12 -0500
Received: from mail-wr1-f53.google.com ([209.85.221.53]:43832 "EHLO
        mail-wr1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726401AbeLKPPM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 11 Dec 2018 10:15:12 -0500
Received: by mail-wr1-f53.google.com with SMTP id r10so14458448wrs.10
        for <linux-clk@vger.kernel.org>; Tue, 11 Dec 2018 07:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=to:cc:from:subject:openpgp:autocrypt:organization:message-id:date
         :user-agent:mime-version:content-language:content-transfer-encoding;
        bh=1f9Qni6RCEtfeJP8ujwxD26cwBVf4O//Ds43LhA2ZHw=;
        b=CMBh+GtBoz8pka53WwYk72oQaieVRVR7U5G/sVmvGpyCBUb09YPGrTDF+BqY92D2dU
         Wq2OTZXML6iYaCgwTT/LlZ/XFkBYSUR+LlKYMEn1Tbm/zyeqbbm/oXbMJ4QBhE3XCeU2
         83QjvkJGqqdSiamBzP7T1ouSBPwTpA3MkFle3e8MEobr+ycwayAlX4rtVxvV+xL8UVSk
         YoRbRUZsUfx1VWFO4x0rEm4MVNLwQY9LGFe7Q5DhD3rPiopmdUksoSxk6EIJeIGSOFAd
         tgnFkJgX6nlon++bBMEG8upYnXcHhI5Mf6kLmfuXYWIA3kEHFf7BDUzEUf4nh0k8vp0s
         6NgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:to:cc:from:subject:openpgp:autocrypt
         :organization:message-id:date:user-agent:mime-version
         :content-language:content-transfer-encoding;
        bh=1f9Qni6RCEtfeJP8ujwxD26cwBVf4O//Ds43LhA2ZHw=;
        b=MTdu9mTwKFsNkZNAKm0XSDfJ2yRCAI4+k37TDEgT/ODxcAJavFRE7aMVzydkibyHl7
         TPUQ1XO9oH9Hy88Vnfk390FG9FLS8/tmyWVSOjZGeLsuVOm6Aleoi8g2Kvii+Qr2tKuL
         Lotjk9GX9rPFA9dRbgKodGv6BPQkObT9vjURdlKoDGgM3FDwrxsRP1E/f654lIZbWbtG
         2KQVl7TtcE+uqwhWyWgP95xeKE9GjUBb8yC1OQq6I0Mb9v+7nhrBbIt/VtuXFGe8dqt/
         zyBZPi8+YZc+oXBqtOV/kFGif4OYuWXQh8826YqAhAJNguO8vOjgR9Ph36i9Q0v3lOmZ
         56+w==
X-Gm-Message-State: AA+aEWbvvgHE/5SL4cMBQudT0vCD5bIvpmkZjmb0qSoFwVVxtxP4YJgG
        XTleYlZ01Z4GGDIlPWiCtw5Hzg==
X-Google-Smtp-Source: AFSGD/Ua2cc+1qr0/T52QY5w+UbZLOZc9cv8JNGSsGQwpYhtH6MRD74vuia5KcW2F7Q6EUXII0TPQQ==
X-Received: by 2002:a5d:5351:: with SMTP id t17mr13592396wrv.288.1544541310033;
        Tue, 11 Dec 2018 07:15:10 -0800 (PST)
Received: from [192.168.1.16] (lfbn-nic-1-206-198.w2-15.abo.wanadoo.fr. [2.15.53.198])
        by smtp.gmail.com with ESMTPSA id h2sm9997768wrv.87.2018.12.11.07.15.09
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Dec 2018 07:15:09 -0800 (PST)
To:     sboyd@kernel.org, mturquette@baylibre.com
Cc:     linux-clk@vger.kernel.org,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
From:   Neil Armstrong <narmstrong@baylibre.com>
Subject: [GIT PULL] clk: meson: updates for v4.21, round 2
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
Message-ID: <4506cbc6-4997-8332-3d34-fe753f480b69@baylibre.com>
Date:   Tue, 11 Dec 2018 16:15:09 +0100
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

Below is a request to pull updates for Amlogic clocks, round 2.

It covers essentially Meson8/Meson8b video clocks, a fix for previous round
and helper addition to simplify clock driver input management.

Thanks,
Neil

The following changes since commit a7d19b05ce817d60ae672c4c112e77892978dc3c:

  clk: meson: meson8b: add the CPU clock post divider clocks (2018-11-23 15:11:58 +0100)

are available in the Git repository at:

  git://github.com/BayLibre/clk-meson.git tags/meson-clk-4.21-2

for you to fetch changes up to f03566d0aa79f9e09a288936980741c479a22fdb:

  clk: meson: axg-audio: use the clk input helper function (2018-12-11 16:07:03 +0100)

----------------------------------------------------------------
Update for meson clocks targeted at v4.21, round 2:
- Fix GXL HDMI Pll fractional bits (from first round)
- Add the Meson8/Meson8b video clocks
- Add clk-input helper and use it for axg-audio clock driver

----------------------------------------------------------------
Jerome Brunet (2):
      clk: meson: add clk-input helper function
      clk: meson: axg-audio: use the clk input helper function

Martin Blumenstingl (3):
      clk: meson: meson8b: fix the offset of vid_pll_dco's N value
      clk: meson: meson8b: add the fractional divider for vid_pll_dco
      clk: meson: meson8b: add the read-only video clock trees

Neil Armstrong (1):
      clk: meson: Fix GXL HDMI PLL fractional bits width

 drivers/clk/meson/Makefile    |   1 +
 drivers/clk/meson/axg-audio.c |  83 ++---
 drivers/clk/meson/clk-input.c |  44 +++
 drivers/clk/meson/clkc.h      |   5 +
 drivers/clk/meson/gxbb.c      |   8 +-
 drivers/clk/meson/meson8b.c   | 746 +++++++++++++++++++++++++++++++++++++++++-
 drivers/clk/meson/meson8b.h   |  54 ++-
 7 files changed, 870 insertions(+), 71 deletions(-)
 create mode 100644 drivers/clk/meson/clk-input.c
