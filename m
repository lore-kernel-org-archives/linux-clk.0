Return-Path: <SRS0=iadI=C7=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C8B9C2D0E2
	for <linux-clk@archiver.kernel.org>; Tue, 22 Sep 2020 12:36:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 907F42395C
	for <linux-clk@archiver.kernel.org>; Tue, 22 Sep 2020 12:36:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UVdqrcAo"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726563AbgIVMgm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 22 Sep 2020 08:36:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726505AbgIVMgm (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 22 Sep 2020 08:36:42 -0400
Received: from mail-ej1-x643.google.com (mail-ej1-x643.google.com [IPv6:2a00:1450:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9200C061755;
        Tue, 22 Sep 2020 05:36:41 -0700 (PDT)
Received: by mail-ej1-x643.google.com with SMTP id gx22so13565216ejb.5;
        Tue, 22 Sep 2020 05:36:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:references:to:cc:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=37wPUZzrX/ueT6NMg9kdHB6XHwPYogZuEw4uPuTq8sE=;
        b=UVdqrcAopld6iqwnmFYqqatYlAwVgvPY4GOZkUByWKVEaTSj8gDTHr6fJqu+sSvgUl
         P78O7cfKnKGWzh/Vlu7Dn+tRNVC/SUtIyOCCzM5yngQ4sdb2KebddqhInOnrqYOxf5wH
         yJDkU2NEmZ531vZN3FQBqZUglkUG/eXe8tmRgb8VxoDD5u2a/T+6To/aXZMvDkfZE3g8
         JkMLY7UQNjsz+quKqIgStDh/NWERlJsz3c3y1bnOMOjcqsOz81oGFlctjnXCSaRfeDMW
         SMACO1gY5GAeIbCV/4vkjVVDEah4PD4QQMLnDJsExdXASyv/qLXbjPb0bgq1lCpOC1a9
         OTrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:references:to:cc:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=37wPUZzrX/ueT6NMg9kdHB6XHwPYogZuEw4uPuTq8sE=;
        b=j+d10HKPZPJB2yUTkTR9RA/VBfhQpINUcgw2CBwiVyyeQCBgfCFq3Dfpfeh4ODrfV8
         o6CFJQC1FKOcU8lvpruaNqxBmRQ4ppTsSRYMOxwLFkRIGuKw5iP5+GG4Kv+BMevHziOW
         4jf0AT+mPZDHJdNwA5BuBRkROlWJXsDFjEx9JGd0ia2hJ9j1Ir+BD2YyFn8tA7ADastf
         f5u6SMKRlAxIfIzWF1sPrQuQpcNsmL6J/OLLoMgECyB1DPz7GwgTqc9HGQ6VHxKdZMb0
         ZeG6ve2Z7noJ8GabNG31wWgIrkwvDIJq1tVLGthAUiJbaaN7ieVj4wskvUZsp+CrN0D5
         xzug==
X-Gm-Message-State: AOAM533lTKV8Ez2Zv7RY/3t4uEiV0omlnUsarLfRnn90MHV1dzmHu2kR
        twE9QjHG1hWPwhBYlqJvFR1JGUoFL0sPOw==
X-Google-Smtp-Source: ABdhPJx/ivoNrPnHok6AuooB49i9RX/dbfmnvOx1eoqAsN6bQv/uXgYgtW6w+3o970f9qAgo6DTdQw==
X-Received: by 2002:a17:906:fa81:: with SMTP id lt1mr4561267ejb.459.1600778200068;
        Tue, 22 Sep 2020 05:36:40 -0700 (PDT)
Received: from [192.168.1.101] (abab42.neoplus.adsl.tpnet.pl. [83.6.165.42])
        by smtp.gmail.com with ESMTPSA id r13sm10867936edo.48.2020.09.22.05.36.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 22 Sep 2020 05:36:39 -0700 (PDT)
Subject: Re: [PATCH -next] clk: qcom: Remove set but not used variable
References: <3724370a-19da-d4c6-fa6a-245e5017869c@gmail.com>
To:     Li Heng <liheng40@huawei.com>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        mturquette@baylibre.com, sboyd@kernel.org
Cc:     linux-arm-msm@vger.kernel.org, linux-clk@vger.kernel.org,
        lkml <linux-kernel@vger.kernel.org>
From:   Konrad Dybcio <konradybcio@gmail.com>
X-Forwarded-Message-Id: <3724370a-19da-d4c6-fa6a-245e5017869c@gmail.com>
Message-ID: <710ed642-cafc-7a68-dfe7-f16b6a1f81e6@gmail.com>
Date:   Tue, 22 Sep 2020 14:36:38 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <3724370a-19da-d4c6-fa6a-245e5017869c@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

This is not the correct solution. I sent a proper fix here [1].

Please do not modify critical platform drivers without having tested them on real hardware (I don't see any Tested-by's?). Instead, file a bug report so that more people can take a look at this. If this got merged, it would have had to be reverted eventually anyway..

[1] https://patchwork.kernel.org/patch/11792407/

Konrad
