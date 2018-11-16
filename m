Return-Path: <SRS0=Wnie=N3=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E5718C43441
	for <linux-clk@archiver.kernel.org>; Fri, 16 Nov 2018 08:30:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 634A22086B
	for <linux-clk@archiver.kernel.org>; Fri, 16 Nov 2018 08:30:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="Aduu4USl"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 634A22086B
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389066AbeKPSmK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 16 Nov 2018 13:42:10 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:53095 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727410AbeKPSmJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 16 Nov 2018 13:42:09 -0500
Received: by mail-wm1-f66.google.com with SMTP id r11-v6so21142335wmb.2
        for <linux-clk@vger.kernel.org>; Fri, 16 Nov 2018 00:30:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:from:to:cc:references:openpgp:autocrypt:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=MuYufag5iDsHhRnX2qy6BkJAe7hT4O3SVLEos66JyJ8=;
        b=Aduu4USlKWLUgsWP11ZuEnpSiu+5BexyZ6KE1kiflFDEF2jlqpQuGPO+7bvx9rggsz
         b3CjLoqk7JD6G3JtgKdgEylZgAxW6IWdzVcFEWmE6ElzSz2kfoU7C15A6b0Q7ERcKVHT
         whLaKzRpP7eJci12gpC/H+/9u4fjZWcPm2pjtXtsLhXn2Y/9HE78MHBvyuz4vmjz3HOk
         HeT/E0jl4NuE4/Tlm93hNL5hlVXsbqKrC5Murw2Y2AeL0DEPfeAEb1c8VjS9QH64tvWh
         kjvDHgo2TVB5k1kSv/e9TO+Ncy0yMxAcCDEXUFLtJv+cNAZvUJlymU3/6cL8vHFEMeeZ
         FBCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:from:to:cc:references:openpgp:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=MuYufag5iDsHhRnX2qy6BkJAe7hT4O3SVLEos66JyJ8=;
        b=H7y6ou9Ay/juiGadIMl0XvaZzSAZFmmTJHoeUlQIDFaf2zJXKcVMfj4IrEN3vMXgXI
         RpKeAbQLNKEu0Xsb0LQETWvYbGq4V9QVY8B+B8CxeTRLXWFmYM4CUGTbcymvpN3cNgpz
         wALHWWzN/BF89cp2eNj4pRW1j3zPWuXETziTd40nsGiGvmf82J4c74s1Iu5btvKhgyHM
         UX4Yg3QVhVGfL42UuIdkSNYQhDf5WHvZGnxGUjHldLV9tILFL2seJS+jb13kFvM+wE9h
         wSsVL1MM/9tBrmJZS2aDXooJRCkfqZJjJuCJejezfTNjKvEUiFGo93tX7VZq/yjMgA5+
         nsVQ==
X-Gm-Message-State: AGRZ1gJZ9StKIozbnFiZEj/hF11hCFiiPcGGhjitP499oS1R2Euy0u7j
        zHFIIogzURzlig+leuIIt3siIxXmnM8=
X-Google-Smtp-Source: AJdET5e945UwDae40f/yTtAP0UUML6aAUIxZtHnKQ2iedS3DrpZazdVBxXwoSmOrUV/MWSShz5LXCw==
X-Received: by 2002:a1c:1d85:: with SMTP id d127mr7933854wmd.103.1542357047876;
        Fri, 16 Nov 2018 00:30:47 -0800 (PST)
Received: from [10.1.2.12] ([90.63.244.31])
        by smtp.gmail.com with ESMTPSA id j40-v6sm21852324wre.48.2018.11.16.00.30.47
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 16 Nov 2018 00:30:47 -0800 (PST)
Subject: Re: [PATCH 0/2] Meson8b: fixes for the cpu_scale_div clock
From:   Neil Armstrong <narmstrong@baylibre.com>
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        linux-amlogic@lists.infradead.org, jbrunet@baylibre.com
Cc:     linux-clk@vger.kernel.org, carlo@caione.org
References: <20180927085921.24627-1-martin.blumenstingl@googlemail.com>
 <a8798132-4544-ce91-7321-1489948c4429@baylibre.com>
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
Message-ID: <88485943-55a8-e045-b633-e33d7c352626@baylibre.com>
Date:   Fri, 16 Nov 2018 09:30:46 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <a8798132-4544-ce91-7321-1489948c4429@baylibre.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 08/11/2018 15:16, Neil Armstrong wrote:
> On 27/09/2018 10:59, Martin Blumenstingl wrote:
>> While trying to add support for the TWD timer I found that our CPU clock
>> calculation (when running off the "cpu_scale_div clock) is incorrect.
>>
>> The main problem was the cpu_scale_div clock:
>> it's divider table has an off-by-one error. the old formula was:
>>   parent_rate / 2 * register_value
>> however, testing shows that the correct formula is:
>>   parent_rate / 2 * (register value + 1)
>> See the commit message of patch #1 for a complete description of the
>> problem and it's history.
>>
>> While looking at the "cpu_scale_div" clock I also found that it's
>> register width was also off-by-one, so this is fixed in a separate patch
>> as well.
>>
>> Both patches are not critical because I haven't seen a case where u-boot
>> uses cpu_scale_div for the CPU clock. It's only a problem when playing
>> with the CPU clock in u-boot (by writing registers manually) or as soon
>> as we support CPU frequency scaling.
>>
>>
>> Martin Blumenstingl (2):
>>   clk: meson: meson8b: fix incorrect divider mapping in cpu_scale_table
>>   clk: meson: meson8b: fix the width of the cpu_scale_div clock
>>
>>  drivers/clk/meson/meson8b.c | 17 +++++++++--------
>>  1 file changed, 9 insertions(+), 8 deletions(-)
>>
> 
> Pushed to fixes/drivers for 4.20
> 
> Neil
> 

Finally, pushed to next/drivers to since these are not critical and to
satisfy the dependencies of "Meson8b: make the CPU clock mutable" patchset.
