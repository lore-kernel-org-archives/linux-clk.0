Return-Path: <SRS0=/AGb=T6=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 087D3C28CC0
	for <linux-clk@archiver.kernel.org>; Thu, 30 May 2019 11:20:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D176625827
	for <linux-clk@archiver.kernel.org>; Thu, 30 May 2019 11:20:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i5Y/x+La"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726843AbfE3LUW (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 May 2019 07:20:22 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:33456 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726563AbfE3LUW (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 May 2019 07:20:22 -0400
Received: by mail-lf1-f66.google.com with SMTP id y17so4731560lfe.0;
        Thu, 30 May 2019 04:20:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=VekgKS2qzcKcSAxRPfpFghP7GZS0WUkLzmxFEC0aAfw=;
        b=i5Y/x+LaTL+31TC/zpG95n9Pxw2Ttz9M8CjsJwaFNoF8mqscNVhB8iZB8iasTK5+GJ
         R4vFDjRYOr01LtD8iq59BJZ1JgTLhSg26Mtbz4zaxOGirksWIbFAmXgd2v6lR/mhD3o9
         zlAxoRCMQsK/yqB7X5vxT0P0a65W0IDsrHLpQ16Xz3wgaym7he5ulnucdJpePFLK0N/q
         hD6oU9KRrBZUNxAJfkDkWQgYBEqWlkptHTXbKa7KX5AXLhShQBEsdNEFzpJNcJNhradN
         XTANkmB+vax7WVabB3JKEo80N+UkarcrfmoLt33gHMPPDy1e9THzG1e+sipTu9H3hHA6
         fblg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=VekgKS2qzcKcSAxRPfpFghP7GZS0WUkLzmxFEC0aAfw=;
        b=GVrt6rC4tqvNyonnd3x9BAYJuy2z/OVrY/Js4xgZnWDe/hTe5/1OwQOV3lFhALPq3m
         y4cmeOjOb/ilIPsoERKf1YMBWinLsxaDt7Be9aYKnAgmf0yBItViPZMGFYJZYBQdkLTg
         G96WRvzKUvOEwEV/M6sHUPojzRmHq4diDP3W+siFq6/F8slYcjnFBl9A7yqs+IpAx6E5
         hTRh3/zSDSA+iLSxlAWoyo01GXjZ7sSW9qzWb44PVSelVHZlZdUH8ZNwQd3vEpA/uTgM
         MZeWFO5D3QS4pmspfGQGg9qPlcHSy8zghj6gpS0+sfafzcQBd/NRxW7f3sWXdzcDsj2n
         PU3g==
X-Gm-Message-State: APjAAAVgg9wtQXn1+2DJLHpQBLSw2XnfUfunBIynZKgsrE1HcLXCfDTZ
        4OcrE5MQFkS3RhC1I7lCmgk=
X-Google-Smtp-Source: APXvYqxcrL5kdqSLjZhlD0FVQkH3bohM0sbHuwh/0mk3vsWwNIiZx41LWxTDWsUlDr10RgWDi82Mjw==
X-Received: by 2002:ac2:4908:: with SMTP id n8mr1767791lfi.10.1559215219998;
        Thu, 30 May 2019 04:20:19 -0700 (PDT)
Received: from [192.168.2.145] ([94.29.35.141])
        by smtp.googlemail.com with ESMTPSA id f30sm440648lfa.48.2019.05.30.04.20.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 30 May 2019 04:20:19 -0700 (PDT)
Subject: Re: [PATCH V4 5/8] memory: tegra: Add EMC scaling support code for
 Tegra210
To:     Joseph Lo <josephl@nvidia.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Peter De Schrijver <pdeschrijver@nvidia.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Rob Herring <robh+dt@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-tegra@vger.kernel.org, devicetree@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20190529082139.5581-1-josephl@nvidia.com>
 <20190529082139.5581-6-josephl@nvidia.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <1838333d-bf58-1e06-7e4c-a64753075053@gmail.com>
Date:   Thu, 30 May 2019 14:20:18 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190529082139.5581-6-josephl@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

29.05.2019 11:21, Joseph Lo пишет:
> This patch adds the required APIs and variables for the EMC scaling
> sequence code on Tegra210.
> 
> Based on the work of Peter De Schrijver <pdeschrijver@nvidia.com>.
> 
> Signed-off-by: Joseph Lo <josephl@nvidia.com>
> ---
> v4:
> - fix the API with generic naming

> +extern const struct emc_table_register_offset reg_off;
> +extern unsigned long dram_over_temp_state;
> +
> +void ccfifo_writel(struct tegra_emc *emc, u32 val, unsigned long addr,
> +		   u32 delay);
> +u32 div_o3(u32 a, u32 b);
> +void emc_writel(struct tegra_emc *emc, u32 val, unsigned long offset);
> +u32  emc_readl(struct tegra_emc *emc, unsigned long offset);
> +void emc_writel_per_ch(struct tegra_emc *emc, u32 val, int type,
> +		       unsigned long offset);
> +u32  emc1_readl(struct tegra_emc *emc, unsigned long offset);
> +
> +void emc_do_clock_change(struct tegra_emc *emc, u32 clksrc);
> +void emc_set_shadow_bypass(struct tegra_emc *emc, int set);
> +void emc_timing_update(struct tegra_emc *emc, int dual_chan);
> +u32 emc_get_dll_state(struct emc_table *next_timing);
> +struct emc_table *emc_get_timing_from_freq(struct tegra_emc *emc,
> +					   unsigned long rate);
> +void emc_set_over_temp_timing(struct tegra_emc *emc, struct emc_table *timing,
> +			      unsigned long state);
> +int emc_wait_for_update(struct tegra_emc *emc, u32 status_reg, u32 bit_mask,
> +			bool updated_state, int chan);

It wouldn't hurt to prepend these all with "tegra210_".

-- 
Dmitry
