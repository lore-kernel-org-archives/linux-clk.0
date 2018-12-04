Return-Path: <SRS0=3Y/e=ON=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6AB2C04EB8
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 13:19:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 702A520659
	for <linux-clk@archiver.kernel.org>; Tue,  4 Dec 2018 13:19:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="sZwCCn0S"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 702A520659
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725849AbeLDNTh (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 4 Dec 2018 08:19:37 -0500
Received: from mail-wm1-f53.google.com ([209.85.128.53]:55338 "EHLO
        mail-wm1-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725802AbeLDNTg (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 4 Dec 2018 08:19:36 -0500
Received: by mail-wm1-f53.google.com with SMTP id y139so9517661wmc.5
        for <linux-clk@vger.kernel.org>; Tue, 04 Dec 2018 05:19:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:openpgp:autocrypt:organization
         :message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=jztrnI64pRPProm1qTBHpiuzuFislqUJ1VKo5w5Z9ZM=;
        b=sZwCCn0SGKZhyhuOuSuTbQhAZo61mbMlkyy2+LjDUMcfBBWu5uoemyA7hZrVO1LKYN
         ctARIgi/Oyf3NjN21FnhpdHT6wnFdSCjwbMC/T0KXxuVnSo9KgmBBa3P9F+CWZHMqARu
         6nVHJ3gQ3o0h5DMQrRFD3EiFv2OXPDb9vZsPQvmUGKn3Xz3y9Q0TeasMaishS+tMaBvR
         Z7ZaUvo6s4wd9DV3Fs0L4pQD0XL+kagJ0YJOFqHeiXOkB+SuFVhXw4C7PrfHkOmy5FJX
         QyGfIJfdYziJAuVqc8Aufzm8sad1E/koL9AYbc9Ql1YkIsi3EUr/ZZMevVKFt9LHV9wA
         Me5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
         :organization:message-id:date:user-agent:mime-version:in-reply-to
         :content-language:content-transfer-encoding;
        bh=jztrnI64pRPProm1qTBHpiuzuFislqUJ1VKo5w5Z9ZM=;
        b=XBbi5SdhHck9nlVObsKLD4N2Vlfz521g4k3hLW+lSXJzPL7tKG9wcKrNdsKMLm/KrE
         VXiLVolvm1vGbIQ9Vn+DsfIHVqqaBiohU7P3vJ277t8vnfz2CWAJQAsJ1OkstAlkv6Jx
         cz7lORhDsYXYzTDt2EicB/+Emek/A6usLzkJt6IsIccpVAxOa+lc08lz8LVRMSc/gAVD
         e/H7T5zJW7pg0gOC1Wf5/ohJXr4qAxCU+xQs3zZohOKHm5AqCW1ZfrCTz6VeC0SlUkRx
         Nu8SA7+Zzm5cQhmljKiM0G89uXtHtdDiysuxYR6xL+GcQf5nANhw719vUud+b0VsDFBl
         1H9g==
X-Gm-Message-State: AA+aEWYYaZ98KbXio4OotZsWMKccb+8OBSoyHUzSpcLx2JaKDVih6Tta
        qZS2PnfEl4+2KaGnrOPzPtVMjA==
X-Google-Smtp-Source: AFSGD/U+2aId78hk3pYrVy2bHBWKfhFMvzZWzZsAYYkxzk6jOFcph5JOWvRFD1WuFLxjaU3Zq+XtqA==
X-Received: by 2002:a1c:2382:: with SMTP id j124mr11996799wmj.14.1543929574303;
        Tue, 04 Dec 2018 05:19:34 -0800 (PST)
Received: from [10.1.2.12] (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id x76sm18017271wmd.27.2018.12.04.05.19.33
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 04 Dec 2018 05:19:33 -0800 (PST)
Subject: Re: [GIT PULL] clk: meson: updates for v4.21
To:     Stephen Boyd <sboyd@kernel.org>, mturquette@baylibre.com
Cc:     linux-clk@vger.kernel.org,
        "open list:ARM/Amlogic Meson..." <linux-amlogic@lists.infradead.org>
References: <8b905b7b-d72a-010f-bb2c-3cadeca603ed@baylibre.com>
 <154387405554.88331.5413259014915237358@swboyd.mtv.corp.google.com>
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
Message-ID: <b0d85bdf-5257-9c9c-d640-1c5d1ffffd63@baylibre.com>
Date:   Tue, 4 Dec 2018 14:19:32 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.2.1
MIME-Version: 1.0
In-Reply-To: <154387405554.88331.5413259014915237358@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 03/12/2018 22:54, Stephen Boyd wrote:
> Quoting Neil Armstrong (2018-11-23 07:23:33)
>> Dear clock maintainers,
>>
>> Below is a request to pull updates for Amlogic clocks.
>>
>> It covers essentially Meson GX Video clocks, Meson8b CPU clocks
>> and 2 bindings changes.
> 
> Pulled into clk-next now.

Thanks !

> 
> I got this when testing:
> 
> drivers/clk/meson/vid-pll-div.c:58:26: warning: symbol '_get_table_val' was not declared. Should it be static?
> drivers/clk/meson/gxbb.c:1585:12: warning: symbol 'gxbb_vid_pll_parent_names' was not declared. Should it be static?
> drivers/clk/meson/gxbb.c:1620:12: warning: symbol 'gxbb_vclk_parent_names' was not declared. Should it be static?
> drivers/clk/meson/gxbb.c:1980:12: warning: symbol 'gxbb_cts_parent_names' was not declared. Should it be static?
> drivers/clk/meson/gxbb.c:2036:12: warning: symbol 'gxbb_cts_hdmi_tx_parent_names' was not declared. Should it be static?
> 
> which looks like nice sparse noise to silence.
> 
> It would also be nice to make that table of mux selectors const, is that
> possible?

I posted a fix for this.

Neil

> 
> ---8<----
> diff --git a/drivers/clk/meson/gxbb.c b/drivers/clk/meson/gxbb.c
> index 30fbf8f1f190..b92df222f553 100644
> --- a/drivers/clk/meson/gxbb.c
> +++ b/drivers/clk/meson/gxbb.c
> @@ -1582,7 +1582,7 @@ static struct clk_regmap gxbb_vid_pll_div = {
>  	},
>  };
>  
> -const char *gxbb_vid_pll_parent_names[] = { "vid_pll_div", "hdmi_pll" };
> +static const char * const gxbb_vid_pll_parent_names[] = { "vid_pll_div", "hdmi_pll" };
>  
>  static struct clk_regmap gxbb_vid_pll_sel = {
>  	.data = &(struct clk_regmap_mux_data){
> @@ -1617,7 +1617,7 @@ static struct clk_regmap gxbb_vid_pll = {
>  	},
>  };
>  
> -const char *gxbb_vclk_parent_names[] = {
> +static const char * const gxbb_vclk_parent_names[] = {
>  	"vid_pll", "fclk_div4", "fclk_div3", "fclk_div5", "vid_pll",
>  	"fclk_div7", "mpll1",
>  };
> @@ -1977,7 +1977,7 @@ static struct clk_fixed_factor gxbb_vclk2_div12 = {
>  };
>  
>  static u32 mux_table_cts_sel[] = { 0, 1, 2, 3, 4, 8, 9, 10, 11, 12 };
> -const char *gxbb_cts_parent_names[] = {
> +static const char * const gxbb_cts_parent_names[] = {
>  	"vclk_div1", "vclk_div2", "vclk_div4", "vclk_div6",
>  	"vclk_div12", "vclk2_div1", "vclk2_div2", "vclk2_div4",
>  	"vclk2_div6", "vclk2_div12"
> @@ -2033,7 +2033,7 @@ static struct clk_regmap gxbb_cts_vdac_sel = {
>  
>  /* TOFIX: add support for cts_tcon */
>  static u32 mux_table_hdmi_tx_sel[] = { 0, 1, 2, 3, 4, 8, 9, 10, 11, 12 };
> -const char *gxbb_cts_hdmi_tx_parent_names[] = {
> +static const char * const gxbb_cts_hdmi_tx_parent_names[] = {
>  	"vclk_div1", "vclk_div2", "vclk_div4", "vclk_div6",
>  	"vclk_div12", "vclk2_div1", "vclk2_div2", "vclk2_div4",
>  	"vclk2_div6", "vclk2_div12"
> diff --git a/drivers/clk/meson/vid-pll-div.c b/drivers/clk/meson/vid-pll-div.c
> index b3370ea7beac..88af0e282ea0 100644
> --- a/drivers/clk/meson/vid-pll-div.c
> +++ b/drivers/clk/meson/vid-pll-div.c
> @@ -55,8 +55,8 @@ static const struct vid_pll_div vid_pll_div_table[] = {
>  #define to_meson_vid_pll_div(_hw) \
>  	container_of(_hw, struct meson_vid_pll_div, hw)
>  
> -const struct vid_pll_div *_get_table_val(unsigned int shift_val,
> -					 unsigned int shift_sel)
> +static const struct vid_pll_div *_get_table_val(unsigned int shift_val,
> +						unsigned int shift_sel)
>  {
>  	int i;
>  
> 

