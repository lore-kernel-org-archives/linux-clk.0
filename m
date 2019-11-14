Return-Path: <SRS0=Db4S=ZG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PULL_REQUEST,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE648C432C3
	for <linux-clk@archiver.kernel.org>; Thu, 14 Nov 2019 11:18:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C5667206D8
	for <linux-clk@archiver.kernel.org>; Thu, 14 Nov 2019 11:18:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JDJXAT/9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726115AbfKNLSq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 14 Nov 2019 06:18:46 -0500
Received: from mail-lj1-f193.google.com ([209.85.208.193]:36991 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726057AbfKNLSq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 14 Nov 2019 06:18:46 -0500
Received: by mail-lj1-f193.google.com with SMTP id d5so6244201ljl.4;
        Thu, 14 Nov 2019 03:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=v+tsZpY+66pcbVo/OY/RGHrGsjnRRyiaeBb/nfvhNWU=;
        b=JDJXAT/9bVZALalkbjBDhr9eFwGX0KHr4UxXY0UR6+4x47aOH3zajn6aKi55MhYKng
         EAO5Zv0AUX+FLBZvFBAwkqT2XXffyvfT6Vadr/mU/c+3FbWK8fcM86IbYF4Gl6dS436v
         3ZUSV5fAfTAlXaZcODxK2Qbp3MsJP889c8lUBhMtQe+cu22wYAyl6KLk8HXEQOzM7M1W
         JN3zZGc/DvK7Y50A0gLP9OXKk4e4auLE3C/jZc9G67ixVaIVYwJ52zmUametVrRtAHzP
         q7Z6+ngzsExsyynJpcHascXXPkEJfQCC/2LylwaWIJvC2KbfdHzlt0Y0q7HYafXio+bW
         xJJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=v+tsZpY+66pcbVo/OY/RGHrGsjnRRyiaeBb/nfvhNWU=;
        b=UNu0otxCA/ystjqGbEfjtybU6JCo21lWO8UNvnwb6GL5TBtnIq5Z7vqhnhPWPSrT/K
         zBw+aNa84jBCjz1mJODwyJNEj+a7ONl6xKFPwKef+MBxP07qnlaRJ+QIcEg4UHaTw6Zs
         k02ngGYlQkygS2buWXnt0C8C4K5cM2/sWbfdZapkju5Cj0BP+QnI+QASMCArwrTH2WQe
         RiWFStZS6VB8woSMiaJk1jRWppvF/UBGEWDyv3wxe2+ixMC9rL93jUs39qka5NSmQTy4
         CQ0T8KO8L4WNc+9SWHsqW7CRU+Zq9wujTYdba89ac+WwJenbtHuk9WDpmc89q4yAE6Ts
         Irsg==
X-Gm-Message-State: APjAAAXM8OmsJTH2z2PI8bc99lo4J1NvkUJdkPEiGpSd8QrMsjF9Mnd1
        XfHY32JUJnh+HzbG5D/XkMqB/5mm
X-Google-Smtp-Source: APXvYqwWb03c0GgDY2jDk3MQSUX5LPCWbYS4OJBY8fv8MDFv9WmXATcOauVqlmIlop+k+7CFmMe2Yw==
X-Received: by 2002:a2e:7c12:: with SMTP id x18mr6293985ljc.130.1573730322226;
        Thu, 14 Nov 2019 03:18:42 -0800 (PST)
Received: from [192.168.2.145] (94-29-10-250.dynamic.spd-mgts.ru. [94.29.10.250])
        by smtp.googlemail.com with ESMTPSA id u7sm2067963ljj.102.2019.11.14.03.18.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 Nov 2019 03:18:41 -0800 (PST)
Subject: Re: [GIT PULL v2 2/2] clk: tegra: Changes for v5.5-rc1
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Thierry Reding <thierry.reding@gmail.com>,
        Sowjanya Komatineni <skomatineni@nvidia.com>
Cc:     linux-clk@vger.kernel.org, linux-tegra@vger.kernel.org
References: <20191111144507.4027979-1-thierry.reding@gmail.com>
 <20191111144507.4027979-2-thierry.reding@gmail.com>
 <20191113192705.4BB34206D5@mail.kernel.org>
From:   Dmitry Osipenko <digetx@gmail.com>
Message-ID: <569efe4b-fdfe-3885-886e-ea543f21d4c9@gmail.com>
Date:   Thu, 14 Nov 2019 14:18:40 +0300
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191113192705.4BB34206D5@mail.kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

13.11.2019 22:27, Stephen Boyd пишет:
> Quoting Thierry Reding (2019-11-11 06:45:07)
>> Hi Michael, Stephen,
>>
>> The following changes since commit 54ecb8f7028c5eb3d740bb82b0f1d90f2df63c5c:
>>
>>   Linux 5.4-rc1 (2019-09-30 10:35:40 -0700)
>>
>> are available in the Git repository at:
>>
>>   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/tegra-for-5.5-clk-v2
>>
>> for you to fetch changes up to 07b293c5b01483f3c65372e72e62a2ee559ce1cf:
>>
>>   clk: tegra: Fix build error without CONFIG_PM_SLEEP (2019-11-11 14:53:05 +0100)
>>
>> This updated pull request contains changes needed for the updated API to
>> retrieve a clock's parent's index as well as additional Acked-bys from
>> Stephen.
>>
>> Thanks,
>> Thierry
>>
>> ----------------------------------------------------------------
> 
> Thanks. Pulled into clk-next. I noticed this error from static checker.
> 
> drivers/clk/tegra/clk.c:241 tegra_clk_init() error: double free of 'periph_clk_enb_refcnt'

That's a good catch! Sowjanya, could you please make a patch to fix it?

> And maybe that function can use struct_size() too instead of kcalloc
> with a multiply?

The struct_size() has a different purpose, it should be used when
structure is padded with a variable-size array at the end.
