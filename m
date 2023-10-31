Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F7CDC00144
	for <linux-clk@archiver.kernel.org>; Tue, 31 Oct 2023 07:25:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343681AbjJaHZJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 31 Oct 2023 03:25:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343679AbjJaHZF (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 31 Oct 2023 03:25:05 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 083A4C1
        for <linux-clk@vger.kernel.org>; Tue, 31 Oct 2023 00:25:03 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-99357737980so826517266b.2
        for <linux-clk@vger.kernel.org>; Tue, 31 Oct 2023 00:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1698737101; x=1699341901; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Yjxq8E7gNPB9bFCXU5zCmu0wTmIMA9QI7im5HIAGob8=;
        b=UDnBLsrtcgKp5mOUD4ecc0dAOd3RJlcwFDNGlrzk6roVkb4SMOz6fOy5llcqV8+LRs
         QExgROkLruoMEOZKOtmazcUJazusLavMTqgr+/zjHi3qnuUQumzTQfs+e6+yvZZA6h/9
         7EViawuiKBERIA9HiNSH1PnJm1h7fyWiCEpgujnGDAFOUzrpATVXgmmZN1I3truXWvVr
         7JpIAKFTgZSotkShgvxpc6kKNfxm3UlgSgksDJJ4BJmiIdc4nFpzbtF4iaNrSfGmQ9u2
         JeJI3bRdFktDsWtJ0u10BgVOLFkWRGh+3mqiIxI8BIBwCfTuXLRpOHRZjr/yhg1MLMLb
         5c4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698737101; x=1699341901;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Yjxq8E7gNPB9bFCXU5zCmu0wTmIMA9QI7im5HIAGob8=;
        b=Bv62cpts/J67IPqoHX4hHegEb0TennrrW3XalbRSLRQ+fJWNoz4Wp+OxCX1AhglXTX
         kEEQqt/8IQXyS1sjhAKvRE7I4CXmeQ1nA8OjXHywDbgFVfKXMolQZRUUihx/C/78S0UZ
         PQXXA7m45A8r28yShL0LFkhKs0U8ShScda1DfWPl8S+F0GS5JwnBQ6kZKvE8BR5GQJOy
         IvFi4eatm/CiKRH61GNZtZ7/rJwcCKDoE3NyMvQkLXDeWOI7n+CYNUqOUsS1fGPoB5tZ
         Vmk5eG647I2zfDnH9sAwqAODznEdS2RAL6BeUCGrphQmdWoJzYSzPyS2uPsPd7ibLLBR
         hVcQ==
X-Gm-Message-State: AOJu0YzHUPORTEO5Bz6x7sVPc/QQJRUDrHKVqfp+Zj9iwNZU/KhH0PqR
        nQndMgs35ICVO+HhUqAeNhuFJQ==
X-Google-Smtp-Source: AGHT+IGus17rAhpSQfGY8ZFCpaGrrZP3x/TVDAb5d+Mu4tTL5tpzmnsjSSEyrRdZtvyfw5pG3ZLGgQ==
X-Received: by 2002:a17:907:3184:b0:9c5:844f:a7f4 with SMTP id xe4-20020a170907318400b009c5844fa7f4mr9965783ejb.35.1698737101232;
        Tue, 31 Oct 2023 00:25:01 -0700 (PDT)
Received: from [192.168.50.4] ([82.78.167.98])
        by smtp.gmail.com with ESMTPSA id w3-20020a170906d20300b009b28ad521f4sm478828ejz.4.2023.10.31.00.25.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 31 Oct 2023 00:25:00 -0700 (PDT)
Message-ID: <48467507-877c-4789-85a9-932b0e79ed79@tuxon.dev>
Date:   Tue, 31 Oct 2023 09:24:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] ti: fix possible memory leak in
 _ti_omap4_clkctrl_setup()
Content-Language: en-US
To:     Hangyu Hua <hbh25y@gmail.com>, kristo@kernel.org,
        mturquette@baylibre.com, sboyd@kernel.org, tony@atomide.com,
        dario.binacchi@amarulasolutions.com, claudiu.beznea@microchip.com,
        robh@kernel.org, andriy.shevchenko@linux.intel.com
Cc:     linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20231027025057.11510-1-hbh25y@gmail.com>
From:   claudiu beznea <claudiu.beznea@tuxon.dev>
In-Reply-To: <20231027025057.11510-1-hbh25y@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 27.10.2023 05:50, Hangyu Hua wrote:
> kstrndup() and kstrdup_and_replace() in clkctrl_get_name() can perform
> dynamic memory allocation. So clkctrl_name() needs to be freed when

s/clkctrl_name()/clkctrl_name

> provider->clkdm_name is NULL.
> 
> Fixes: bd46cd0b802d ("clk: ti: clkctrl: check return value of kasprintf()")
> Signed-off-by: Hangyu Hua <hbh25y@gmail.com>
> ---
> 
> 	v2: fix commit info.
> 
>  drivers/clk/ti/clkctrl.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/clk/ti/clkctrl.c b/drivers/clk/ti/clkctrl.c
> index 607e34d8e289..cb4aa8a45bb2 100644
> --- a/drivers/clk/ti/clkctrl.c
> +++ b/drivers/clk/ti/clkctrl.c
> @@ -591,6 +591,7 @@ static void __init _ti_omap4_clkctrl_setup(struct device_node *node)
>  		provider->clkdm_name = kasprintf(GFP_KERNEL,
>  						 "%s_clkdm", clkctrl_name);
>  		if (!provider->clkdm_name) {
> +			kfree(clkctrl_name);
>  			kfree(provider);
>  			return;
>  		}
