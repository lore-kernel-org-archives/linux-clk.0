Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82764C433F5
	for <linux-clk@archiver.kernel.org>; Thu, 30 Dec 2021 14:30:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240060AbhL3O36 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 30 Dec 2021 09:29:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240077AbhL3O36 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 30 Dec 2021 09:29:58 -0500
Received: from relay05.th.seeweb.it (relay05.th.seeweb.it [IPv6:2001:4b7a:2000:18::166])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E59DDC061574
        for <linux-clk@vger.kernel.org>; Thu, 30 Dec 2021 06:29:57 -0800 (PST)
Received: from [192.168.1.101] (83.6.168.106.neoplus.adsl.tpnet.pl [83.6.168.106])
        (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by m-r2.th.seeweb.it (Postfix) with ESMTPSA id 638393F3F5;
        Thu, 30 Dec 2021 15:29:55 +0100 (CET)
Message-ID: <5543bdad-3518-fe20-d755-69ebac4ddd69@somainline.org>
Date:   Thu, 30 Dec 2021 15:29:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.4.1
Subject: Re: [PATCH] clk: qcom: gcc-msm8994: Remove NoC clocks
Content-Language: en-US
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     ~postmarketos/upstreaming@lists.sr.ht, martin.botka@somainline.org,
        angelogioacchino.delregno@somainline.org,
        marijn.suijten@somainline.org, jamipkettunen@somainline.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20211230023101.1122588-1-konrad.dybcio@somainline.org>
 <CAA8EJprR_eNiRTXOLnHzztbdH_RYj-+Po99b=7c2Asxvop+jtQ@mail.gmail.com>
From:   Konrad Dybcio <konrad.dybcio@somainline.org>
In-Reply-To: <CAA8EJprR_eNiRTXOLnHzztbdH_RYj-+Po99b=7c2Asxvop+jtQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


> You don't have to init array entries with NULL values (if it's not for
> the documentation purposes). Uninitialized entries will get NULL value
> anyway.
>
Forgot to address this in my previous message, but I think it may be a

good indicator for the next person that decides this would be a good idea

that they should probably stay away from it.. If it's really bad, then sure, I

can remove it..


Konrad

