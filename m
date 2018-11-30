Return-Path: <SRS0=1K30=OJ=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 426A8C04EB8
	for <linux-clk@archiver.kernel.org>; Fri, 30 Nov 2018 10:18:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F342420863
	for <linux-clk@archiver.kernel.org>; Fri, 30 Nov 2018 10:18:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="LsDvLtfY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org F342420863
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726469AbeK3V05 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Nov 2018 16:26:57 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:47000 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726618AbeK3V05 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Nov 2018 16:26:57 -0500
Received: by mail-wr1-f68.google.com with SMTP id l9so4697256wrt.13
        for <linux-clk@vger.kernel.org>; Fri, 30 Nov 2018 02:18:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=3+Z+inXLx57fsYiggDyiuyju+69y95yb84U6T+bzjXA=;
        b=LsDvLtfY655HwCXAC0A8k6nJtzIKNy3d5RI5AD7OJ2w8ETfKllnlAJI4wM3Mwb2amz
         iHGfhTbP02dksaXTpquY0KgqIJY7tyOn92SW24L8gXOvuVPF8vh4QFVMyRNlS4Hv2CsV
         LgcPzJEen2yfy/IcGLK8lDLzM5bjkbKDV6pFzEoqLpYcGKLDINyd37rZVx5xM+NWxEEA
         AwGCJU/pNgrdAy7N+ODBgwxQ5cdlvv5fW/xjw8FpEQ4zD35lnx6QAwbakPwnwFGG+Kdh
         jw6nag0Tn6Pyt1OXbF4DLC8nZSfkO+FceF9hyv2EXsZcwlU+vqZKWWAulU8qkcAErbMG
         zSNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=3+Z+inXLx57fsYiggDyiuyju+69y95yb84U6T+bzjXA=;
        b=IHxjOTzPVgtuCkovgc8Fyr5uQBa9eIyWuu0oCC5m6PngfXnRSQqNcg5kKywvdzf1Zx
         mSHRpCld2gnoy8Cr5yZ78oTGoaq0cOMaOtVi4WwH6HU0wL80ANM26Bn4AIEmM6rlO3ja
         HhNYHXmJIkvaj45dEByegiZuej84dzqKpabuTbOjd9VxzSQepixg+gXzuRkHw+KcgoxL
         43xIoZC+Re9gWWmoxSlS7Cu3OB0ROKkBuY9HyfupmfIAd8l/SZQREmyV4lxcJL0KxNX/
         ivFubi8ywWLDA1JZxs1u0fH3LsgWO6LMmYmIzWqfZutBi7ojHBpVB1kQkvvwO9tio34s
         pIZg==
X-Gm-Message-State: AA+aEWZs0J3rQWPm03EbukelPy8AHtcGofdnhJIG7rlyar3FdQOMa3fh
        4IH2WzmS0nmmAE3dF4Q87HCcAkUi1ixx5A==
X-Google-Smtp-Source: AFSGD/U8ndxflqddOuUF8DIMVFgbS+gTPeBe9hFp9DWZEFpa9xm8q35EpOlzfIZss/GWDwkSQj9www==
X-Received: by 2002:a5d:4fcb:: with SMTP id h11mr4572282wrw.139.1543573087261;
        Fri, 30 Nov 2018 02:18:07 -0800 (PST)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id z12sm5026534wrh.35.2018.11.30.02.18.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 30 Nov 2018 02:18:06 -0800 (PST)
Subject: Re: [PATCH v2 3/3] ARM: dts: meson: switch the clock controller to
 the HHI register area
To:     Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
        jbrunet@baylibre.com, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org
Cc:     mturquette@baylibre.com, sboyd@kernel.org, carlo@caione.org,
        khilman@baylibre.com, linux-clk@vger.kernel.org
References: <20181028120859.5735-1-martin.blumenstingl@googlemail.com>
 <20181028120859.5735-4-martin.blumenstingl@googlemail.com>
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
Message-ID: <6720a94f-ee87-937c-e360-87c2e37d29aa@baylibre.com>
Date:   Fri, 30 Nov 2018 11:18:05 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <20181028120859.5735-4-martin.blumenstingl@googlemail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 28/10/2018 13:08, Martin Blumenstingl wrote:
> The clock controller on Meson8/Meson8m2 and Meson8b is part of a
> register region called "HHI". This register area contains more
> functionality than just a clock controller:
> - the clock controller
> - some reset controller bits
> - temperature sensor calibration data (on Meson8b and Meson8m2 only)
> - HDMI controller
> 
> Allow access to this HHI register area as "system controller". Also
> migrate the Meson8 and Meson8b clock controllers to this new node.
> 
> Signed-off-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Acked-by: Neil Armstrong <narmstrong@baylibre.com>
> ---
>  arch/arm/boot/dts/meson.dtsi   |  7 +++++++
>  arch/arm/boot/dts/meson8.dtsi  | 15 ++++++++-------
>  arch/arm/boot/dts/meson8b.dtsi | 15 ++++++++-------
>  3 files changed, 23 insertions(+), 14 deletions(-)
> 
> diff --git a/arch/arm/boot/dts/meson.dtsi b/arch/arm/boot/dts/meson.dtsi
> index 0d9faf1a51ea..ad903d1a2cb6 100644
> --- a/arch/arm/boot/dts/meson.dtsi
> +++ b/arch/arm/boot/dts/meson.dtsi

[...]

>  
> +&hhi {
> +	clkc: clock-controller {
> +		compatible = "amlogic,meson8-clkc";
> +		#clock-cells = <1>;
> +		#reset-cells = <1>;
> +	};
> +};
> +
>  &hwrng {
>  	compatible = "amlogic,meson8b-rng", "amlogic,meson-rng";
>  	clocks = <&clkc CLKID_RNG0>;
> 

Kevin,

I didn't apply this one, but it can wait another cycle I think.

Neil
