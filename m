Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC506C32793
	for <linux-clk@archiver.kernel.org>; Tue, 23 Aug 2022 11:42:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1357709AbiHWLmc (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 23 Aug 2022 07:42:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358459AbiHWLlx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 23 Aug 2022 07:41:53 -0400
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82B27CC323
        for <linux-clk@vger.kernel.org>; Tue, 23 Aug 2022 02:29:24 -0700 (PDT)
Received: by mail-wr1-x42d.google.com with SMTP id r16so16247808wrm.6
        for <linux-clk@vger.kernel.org>; Tue, 23 Aug 2022 02:29:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=smile-fr.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc;
        bh=b5SqvktMLhNdA3mMaOmzLY6p2cT5md25GAzVuMoc4r4=;
        b=CIp0kiP5yLD5kCI5UiDO5IlEgewnVN+5NJDKY0BQOcuMfrfzjlyZW9FNLVmiUTybS+
         qvxGi43zIhsaCgvMi5VTXrLCUTs+c9COja1v/TXJCkF5MSNvp6RsIZJEYuLmP/altkxe
         Oz1HJhPIYL6gHiggAuF5Orb+8BcZ7uXTp+/FGiVimmgvJV2oUl0nnTJLfOkpl7ePesaY
         hnxofDecgzIsB3aUOstMzBJbtzunQJnI6ijG7+6/Xt8aBFsW8I8lgeXoU/rMoeyTXOqJ
         jfaIb0hT0b5XPOn/l3xmfiC9hHS/w+vLIVBQdh9fi5AhRt99K/lwa2DThLqKsDjxxNnk
         byLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc;
        bh=b5SqvktMLhNdA3mMaOmzLY6p2cT5md25GAzVuMoc4r4=;
        b=WpqAUJOqOPOG7VWK2/zQOX7H3Xo8DwVSj1wLqTCpiY2BStze2V2Civ9YjwTvkE+ybU
         NGjcy2NvK3VH1aFqEL8s3d7SOy+5KzI1bNrtL6WUzk3JN18ZXdJGBuO3xcF3tLZli5ph
         ZQE7QdN+NFMQbbg3KqSoGmi6u92cI0x+KsLDP6v0DvtECF3f2p7w7fmbEE8ImtSONKQk
         6Zklnj8g5h875NWWq77ZZ03ycUeYbEvnmPgmUxXQy79E6eU9P6fmzLO2G4Vd5h8y5Cag
         nPDO/Euk9s0li5uq/PIxbeRnJwqwr4oyuEAERYCkho6Z2VxF3CLYb14hu2CtE98ulSXa
         r4rg==
X-Gm-Message-State: ACgBeo0znwO24RLUuVwK5VfTV0RAJu3oy7qaRhg1cyOYtZDbdZ66Vtec
        FnWPccjajUM4k2Dp4XHYKbS6kw==
X-Google-Smtp-Source: AA6agR4YYoSedYVviurRFDL2MlH/IvkuklQao1Lewjf01WxdkCHF4BXPKT/acLkLZeVw7OZxj5trNQ==
X-Received: by 2002:a5d:59c3:0:b0:225:512d:23b8 with SMTP id v3-20020a5d59c3000000b00225512d23b8mr5786037wry.505.1661246962417;
        Tue, 23 Aug 2022 02:29:22 -0700 (PDT)
Received: from ?IPV6:2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f? (2a01cb058f8a18001c97b8d1b477d53f.ipv6.abo.wanadoo.fr. [2a01:cb05:8f8a:1800:1c97:b8d1:b477:d53f])
        by smtp.gmail.com with ESMTPSA id c19-20020a05600c4a1300b003a30fbde91dsm19014200wmp.20.2022.08.23.02.29.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Aug 2022 02:29:21 -0700 (PDT)
Message-ID: <c62649f0-2be1-459c-bfa5-4c94a3e4300f@smile.fr>
Date:   Tue, 23 Aug 2022 11:29:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Subject: Re: [PATCH] clk: ti: Fix reference imbalance in
 ti_find_clock_provider
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>,
        Jan Kiszka <jan.kiszka@siemens.com>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-omap@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Tony Lindgren <tony@atomide.com>
References: <63d9211f-d5ce-562e-358a-50f26c7caf35@siemens.com>
 <20220819212337.AECB9C433D6@smtp.kernel.org>
From:   Romain Naour <romain.naour@smile.fr>
In-Reply-To: <20220819212337.AECB9C433D6@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello,

Le 19/08/2022 à 23:23, Stephen Boyd a écrit :
> Quoting Jan Kiszka (2022-08-08 15:26:58)
>> From: Jan Kiszka <jan.kiszka@siemens.com>
>>
>> When a clock is found via clock-output-names, we need to reference it
>> explicitly to match of_find_node_by_name behavior. Failing to do so
>> causes warnings like this:
>>
> 
> Is this superseeded by
> https://lore.kernel.org/r/20220621091118.33930-1-tony@atomide.com?

I noticed the same issue and tested separately with both patches.

Indeed, this patch is not needed anymore with "[PATCH] clk: ti: Fix missing
of_node_get() ti_find_clock_provider()" applied.

Best regards,
Romain
