Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 63B4DC001DE
	for <linux-clk@archiver.kernel.org>; Wed,  2 Aug 2023 04:25:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231633AbjHBEZM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 2 Aug 2023 00:25:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49964 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231209AbjHBEZL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 2 Aug 2023 00:25:11 -0400
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com [IPv6:2a00:1450:4864:20::429])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D81DE2103
        for <linux-clk@vger.kernel.org>; Tue,  1 Aug 2023 21:25:05 -0700 (PDT)
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-3090d3e9c92so6439156f8f.2
        for <linux-clk@vger.kernel.org>; Tue, 01 Aug 2023 21:25:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tuxon.dev; s=google; t=1690950304; x=1691555104;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mtSlfWL5ufjC4lYnzIHx4JjC5PrXYey+w4yFZchnGZQ=;
        b=hHQxBachE016lHBZru9Jmm7yn8F27Sr0rEDHLVru3e8MY7sPIPx95DiX+OwDwOvCdJ
         W4qv/XjfKPD99PeafFFYa9ahz91P160gQYO2HpePPp0qpUdObbBq8VTaoSIjo9ymGqtV
         HmKse1ZoJHP3ySXmZOt01/d3vAAt7YS3OXcGiSFFpj5gv4VG2s16+qm2mBRBkS8islz2
         natfabDRdnYO5fKJYuRejfefZHDXGpyT93u+yoe+AtP+i4XMIcJFQErciSQiq67VTWDS
         HIdmmb5xCXaXPpE7kUE8kR0Oz5LcfhYzeHGweYfUFbel9EqpWLHGzq632l02P516MMmj
         DK7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690950304; x=1691555104;
        h=content-transfer-encoding:in-reply-to:content-language:references
         :cc:to:subject:from:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mtSlfWL5ufjC4lYnzIHx4JjC5PrXYey+w4yFZchnGZQ=;
        b=KDprM4eFusgVTMsKajy7DXtgc8yq3gh/bmViYbLuAHpv/+BfDD0wMhNtkUDshJNBoT
         1BdeSHd4L/skQAeRfyh2obkd96pWE2bLFmBmeJ6gq9yp//LjEqWwKPqwbdYPCzFkOwMp
         LsLtZ8tPcXIuYNrTSOECM5SxHx6vAN7yP0h2v8PkCDuxg+P549E/d7WqgtuDMTehKJKz
         nngBrSkUcSWXvJ7ivn7S+Q/1QrmhW9pMo+nwQ0noLeKnMhz/MnuqwYKhAJZZuqWso7KL
         aAfhcwUqzr7jg36ES4q9gotIzf0rMvLYpiIeJV62oyIU9jze+YotEIxnDtwlJh/9/nBv
         +gVw==
X-Gm-Message-State: ABy/qLZrY7VzHPik3qbjO8iC8hIYGvaHesAP/jcw/uL9yLfZyo45IY0/
        fXOMlgUXVoZPBXpImCwAw3+iYhbSW2Trrm7Codze3v0N
X-Google-Smtp-Source: APBJJlFhZeydmdaXg6TMe/5VEekDJ1CQYoO96Asld3t94Me+C+AV4bHDV2VWJJlPbnRH20vO5HuUSQ==
X-Received: by 2002:a5d:474c:0:b0:317:631b:43ce with SMTP id o12-20020a5d474c000000b00317631b43cemr3800841wrs.41.1690950304171;
        Tue, 01 Aug 2023 21:25:04 -0700 (PDT)
Received: from [10.0.2.15] ([82.78.167.79])
        by smtp.gmail.com with ESMTPSA id o20-20020a5d58d4000000b0031762e89f94sm17659259wrf.117.2023.08.01.21.25.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Aug 2023 21:25:03 -0700 (PDT)
Message-ID: <79a79ec5-3691-43d2-ca3e-478a94f85e2d@tuxon.dev>
Date:   Wed, 2 Aug 2023 07:24:54 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
From:   claudiu beznea <claudiu.beznea@tuxon.dev>
Subject: Re: [PATCH 03/42] clk: at91: sam9x60: switch to parent_hw and
 parent_data
To:     Stephen Boyd <sboyd@kernel.org>, alexandre.belloni@bootlin.com,
        mripard@kernel.org, mturquette@baylibre.com,
        nicolas.ferre@microchip.com
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-kernel@vger.kernel.org, varshini.rajendran@microchip.com
References: <20230727053156.13587-1-claudiu.beznea@tuxon.dev>
 <20230727053156.13587-4-claudiu.beznea@tuxon.dev>
 <412f9209637e6eb861cd07e1d6dbc346.sboyd@kernel.org>
Content-Language: en-US
In-Reply-To: <412f9209637e6eb861cd07e1d6dbc346.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 29.07.2023 06:28, Stephen Boyd wrote:
> Quoting Claudiu Beznea (2023-07-26 22:31:17)
>> @@ -177,31 +178,34 @@ static const struct {
>>  
>>  static void __init sam9x60_pmc_setup(struct device_node *np)
>>  {
>> +       struct clk_hw *td_slck_hw, *md_slck_hw, *main_xtal_hw, *main_rc_hw, *main_osc_hw;
>> +       struct clk_hw *parent_hws[6], *hw, *usbck_hw;
>> +       static struct clk_parent_data parent_data;
>>         struct clk_range range = CLK_RANGE(0, 0);
>> -       const char *td_slck_name, *md_slck_name, *mainxtal_name;
>> +       const char *main_xtal_name = "main_xtal";
>>         struct pmc_data *sam9x60_pmc;
>> -       const char *parent_names[6];
>> -       struct clk_hw *main_osc_hw;
>>         struct regmap *regmap;
>> -       struct clk_hw *hw;
>> +       struct clk *clk;
>>         int i;
>>  
>> -       i = of_property_match_string(np, "clock-names", "td_slck");
>> -       if (i < 0)
>> +       clk = of_clk_get_by_name(np, "td_slck");
>> +       if (IS_ERR(clk))
>>                 return;
>> -
>> -       td_slck_name = of_clk_get_parent_name(np, i);
>> -
>> -       i = of_property_match_string(np, "clock-names", "md_slck");
>> -       if (i < 0)
>> +       td_slck_hw = __clk_get_hw(clk);
> 
> Don't introduce more usage of __clk_get_hw(). The index for "td_slck"
> should be known, and it can be used as the index member in struct
> clk_parent_data.  This allows the clk framework to lazily find the
> parent, instead of requiring the parent to be registered before this
> code runs. It also reduces the usage of __clk_get_hw().

If I'll do this I will have to also change the approach that has been done
for SAMA7G5 (already integrated in v6.5-rc1, maybe I had to let it more on
the mailing list before taking into the tree) for all the clock drivers
(basically instead of parent_hws I will have to provide parent_data to AT91
clock registration APIs AFAICT). No issue with that... just telling...

The reason I did it with parent_hws + __clk_get_hw() on PMC parents in
SAMA7G5 is that SAMA7G5 PLL parent rate need to be known from the
registration to setup properly the PLL. Otherwise PLL will not lock if not
properly setup. For this I got the parent_hw for PLL parent to retrieve its
rate and thus I chose at that time to also get the clk_hw for the other
parents of PMC just to have the same approach on all parents (and it looked
to me that code will be simpler).

Thank you for your review,
Claudiu Beznea
