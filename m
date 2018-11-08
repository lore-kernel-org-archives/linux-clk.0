Return-Path: <SRS0=ZQGu=NT=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.1 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19C9FECDE47
	for <linux-clk@archiver.kernel.org>; Thu,  8 Nov 2018 14:16:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AF6F52086C
	for <linux-clk@archiver.kernel.org>; Thu,  8 Nov 2018 14:16:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="eeSa/gsg"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AF6F52086C
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726781AbeKHXwg (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Nov 2018 18:52:36 -0500
Received: from mail-wm1-f68.google.com ([209.85.128.68]:36142 "EHLO
        mail-wm1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726541AbeKHXwf (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 8 Nov 2018 18:52:35 -0500
Received: by mail-wm1-f68.google.com with SMTP id a8-v6so1353285wmf.1
        for <linux-clk@vger.kernel.org>; Thu, 08 Nov 2018 06:16:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=zBYFu15CXvo0kZTftqS7JYuQKPPmzw/DXlVOlfJMqaQ=;
        b=eeSa/gsgMovvtGk2iF5t6sqQ7JNsACbnCqkByQrNrNsnZRnbNkw1ZK+XHIRKrDLcNn
         Zm4tHYU3JhrsieOzuHP21ib854mr3KA1WSKXx/Pj7KOoD4etWLrXmQU1EmBb2EfSm2Dn
         UIKNZMyaDZTfM8Lp6j7qmY0AJnudRaOe4wNMGjN48oIfLbXfrBys8/Y/MdffIYcLq0NW
         cIFzHaF7NOmiDJqiVLkDBuouB6kwD64gM99sO7qdJPIoyTzndNDZR2dGcM2iR5it7nHi
         IFTz9l82goIcE4zbmQ6xyjA1gqE8bKO4hqDT4HBFkAwptDVcyFye4vKts1BKDol4isCu
         184g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=zBYFu15CXvo0kZTftqS7JYuQKPPmzw/DXlVOlfJMqaQ=;
        b=R4MGAxSa/1+SP9+DxFZrl926Ih8XTbEiaDDdEIM23DZyPoiOsgOZvU+u6IXXVEvIZ9
         jJXajFYziUDdymNj9icAvpCcoJYNG/rjNbM8391dNKasNeB9N+AVu0CiWGo8ldLAX7iT
         JkK17gmOojqGoRLPJctQkliUxj5z6Lt5onYqE6Az8UCqN4msPwPIpcJ13d+JqtiItd7z
         9PUSmPnw/EyWfVoCFGHkv6zxJ31KYBiJPrCeepAroEi2VJgnbQ4q7Z3V0f7FbYLetk8i
         dhtTrZLlt6aIdi1bmmAhwR7adRqPH/HUzxZBA9qSXb3Yfb9I/db8w1UUOi6IjQ/L7plE
         c6xQ==
X-Gm-Message-State: AGRZ1gKHp0SInOqb+bdQMKPR7I4dbAdtznFbs+/fybg+Ji3019r3hQ8C
        w7Y8S2Lq025342H6+816Wc6FXg==
X-Google-Smtp-Source: AJdET5dKCVLVENWC81qs76YpAV5MsHYfpIN+KHpn14d8hzSjgkZNNLUMYyJEtRzuv/dUh7qs17zubw==
X-Received: by 2002:a1c:85c5:: with SMTP id h188-v6mr1317069wmd.59.1541686613109;
        Thu, 08 Nov 2018 06:16:53 -0800 (PST)
Received: from [10.1.2.12] ([90.63.244.31])
        by smtp.gmail.com with ESMTPSA id y83-v6sm3049063wmb.20.2018.11.08.06.16.52
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 08 Nov 2018 06:16:52 -0800 (PST)
Subject: Re: [PATCH 0/2] Meson8b: fixes for the cpu_scale_div clock
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-amlogic@lists.infradead.org, jbrunet@baylibre.com
Cc:     linux-clk@vger.kernel.org, carlo@caione.org
References: <20180927085921.24627-1-martin.blumenstingl@googlemail.com>
From:   Neil Armstrong <narmstrong@baylibre.com>
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
Message-ID: <a8798132-4544-ce91-7321-1489948c4429@baylibre.com>
Date:   Thu, 8 Nov 2018 15:16:51 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20180927085921.24627-1-martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 27/09/2018 10:59, Martin Blumenstingl wrote:
> While trying to add support for the TWD timer I found that our CPU clock
> calculation (when running off the "cpu_scale_div clock) is incorrect.
> 
> The main problem was the cpu_scale_div clock:
> it's divider table has an off-by-one error. the old formula was:
>   parent_rate / 2 * register_value
> however, testing shows that the correct formula is:
>   parent_rate / 2 * (register value + 1)
> See the commit message of patch #1 for a complete description of the
> problem and it's history.
> 
> While looking at the "cpu_scale_div" clock I also found that it's
> register width was also off-by-one, so this is fixed in a separate patch
> as well.
> 
> Both patches are not critical because I haven't seen a case where u-boot
> uses cpu_scale_div for the CPU clock. It's only a problem when playing
> with the CPU clock in u-boot (by writing registers manually) or as soon
> as we support CPU frequency scaling.
> 
> 
> Martin Blumenstingl (2):
>   clk: meson: meson8b: fix incorrect divider mapping in cpu_scale_table
>   clk: meson: meson8b: fix the width of the cpu_scale_div clock
> 
>  drivers/clk/meson/meson8b.c | 17 +++++++++--------
>  1 file changed, 9 insertions(+), 8 deletions(-)
> 

Pushed to fixes/drivers for 4.20

Neil
