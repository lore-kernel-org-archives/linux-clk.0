Return-Path: <SRS0=/Yer=S2=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08FD4C10F11
	for <linux-clk@archiver.kernel.org>; Wed, 24 Apr 2019 23:37:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C9F7B214AE
	for <linux-clk@archiver.kernel.org>; Wed, 24 Apr 2019 23:37:09 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="kZaE+ay+"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727433AbfDXXhJ (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 24 Apr 2019 19:37:09 -0400
Received: from mail-lj1-f177.google.com ([209.85.208.177]:45322 "EHLO
        mail-lj1-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726077AbfDXXhJ (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 24 Apr 2019 19:37:09 -0400
Received: by mail-lj1-f177.google.com with SMTP id y6so18472631ljd.12
        for <linux-clk@vger.kernel.org>; Wed, 24 Apr 2019 16:37:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=KLNrORvuKNvAinge+zhKpygJaR7+13snXpFr/GCw1ho=;
        b=kZaE+ay+C7Xd86Twpz4mybvhAmece29Q9543iYEfXXr9L5cGb5365PuhfiZriFszwg
         kwPdhd77BwLxzV38vQO2zyjSB3gArD9jCZ/H7n45geC0Wef4h0+G50Ea2uxA/1hbWIcj
         S2ALdOzzXFmfhHEvhcUDFR6/Tug7pM9N/WOMY9jj7R0lp6u8Mt8K4isAFhzp0htXAFCZ
         9wg1YRhBq3Z/nBfSjPliTqYQ1/O9y8JXI9k9S/HzJSK2UYCqeaDQgNoKPvhzZVRvvxOH
         7urChbwKNLCOGt6pJFH3ro9UShvIm4HBEkbK3pkXlwqElU1FyLUYOPH4mxQn8vMBtZdh
         YqCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=KLNrORvuKNvAinge+zhKpygJaR7+13snXpFr/GCw1ho=;
        b=i7a092meXQbp/tKtrW7Ip/qpzXAGL+CaRNrqizCRxuuz2bXjSTltUYZ8DP8nukqpWY
         sIA+iCjhzxzDaixCL0TnyhsowhrjN2+OFzZhA20aDlsPKKZIurFFKVtsd5PRqVd61rMD
         LYgapogdqIeRuXkGfv4UVCNNDqIitcQ3J4ZakCHWwyVmSmwAx1IcfLWOxDHAl9Jf52VF
         GM2dhfWzzWX8i785uNvBO2lvT9lmZGZPOnyQHky2v6FrYl8RJTk6sMCXTkzV1DSLBox5
         CCAw71o9PCMvV1Z+pnqC9uj/nY/bRyDZbLtRRs27iNDAFts7ZvBZNTXXJo6qvNtrwh5b
         W60A==
X-Gm-Message-State: APjAAAXpB7fKT19Sm6E7DH+IX/I8IDgBdZAhMkUi6a1qfY37YM/aF23D
        VC00kFMxdVHPi0wR2ZqBIzBKhrQh
X-Google-Smtp-Source: APXvYqyxHnrA6kBruxeZqTJ+sk5atPwo9uv1zJsjUGSdgty0WGHJ+VzewxhtB2m9aLztfqFxgVmOfQ==
X-Received: by 2002:a05:651c:114:: with SMTP id a20mr18782520ljb.53.1556149026915;
        Wed, 24 Apr 2019 16:37:06 -0700 (PDT)
Received: from [192.168.2.145] (ppp94-29-35-107.pppoe.spdop.ru. [94.29.35.107])
        by smtp.googlemail.com with ESMTPSA id y8sm4272903lji.88.2019.04.24.16.37.05
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 24 Apr 2019 16:37:06 -0700 (PDT)
Subject: Re: [chanwoo:devfreq-testing 15/16]
 drivers//devfreq/tegra30-devfreq.c:478:8: error: implicit declaration of
 function 'clk_set_min_rate'; did you mean 'clk_set_rate'?
To:     Stephen Boyd <sboyd@kernel.org>,
        Chanwoo Choi <cw00.choi@samsung.com>
Cc:     linux-clk@vger.kernel.org
References: <201904242234.3ZpDzMBq%lkp@intel.com>
 <bd6a2bf5-aae5-9610-4f48-09e6f44fa3b4@gmail.com>
 <155614819134.15276.7176628667441699971@swboyd.mtv.corp.google.com>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <778e8833-ec80-8474-ab07-24a5a1d22640@gmail.com>
Date:   Thu, 25 Apr 2019 02:37:05 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <155614819134.15276.7176628667441699971@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

25.04.2019 2:23, Stephen Boyd пишет:
> Quoting Dmitry Osipenko (2019-04-24 07:41:56)
>>
>> Oh, there is no declaration for clk_set_min_rate() when CONFIG_COMMON_CLK=n. Either driver should be made dependent on CONFIG_COMMON_CLK or the declaration should be added to include/linux/clk.h (the same applies to tegra20-devfreq).
>>
>> Chanwoo, what will we do?
> 
> Send a patch to add the empty wrappers to clk.h please.
> 

All right!
