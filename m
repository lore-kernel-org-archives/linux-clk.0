Return-Path: <SRS0=eU8d=QH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BEB78C169C4
	for <linux-clk@archiver.kernel.org>; Thu, 31 Jan 2019 09:09:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 99DBF2086C
	for <linux-clk@archiver.kernel.org>; Thu, 31 Jan 2019 09:09:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="koMMPUOP"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726440AbfAaJJ4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 31 Jan 2019 04:09:56 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:42617 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726434AbfAaJJ4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 31 Jan 2019 04:09:56 -0500
Received: by mail-wr1-f67.google.com with SMTP id q18so2349194wrx.9
        for <linux-clk@vger.kernel.org>; Thu, 31 Jan 2019 01:09:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=p7g2oiiMuH9TCi0rtrHnCkxhA/O1w9HJBCPx/mBRROU=;
        b=koMMPUOPjakYYN8cqkDDEtvcwewqQugA2RTHF8bkoznj8SN2p6X9PE7VukZjtyLp1P
         78ENy+MQgd5r3cF06fBQ/NKDDIMJahr1ThnqVWIuqZY4pzcI1m/g7xffyx4kUB44DdDG
         y/9lLUgJM4U5Aaqsdp2GRX6ui8l7aLHfAS8oMgsCCzp0qf1elirCPtuehshI1HzZ4N/u
         c1LnEmQqhP+INU0wEm1amBbRSyPb1ZY4j869B954iaarOoFoFNI/5G4YK+5yWBcSKcvX
         nIJDq5lInEPisvyuCVJ/4gY4xhNLWCXs6pWVmKZOkGv6azJy3Y/9tPd7vmbIZbP4IuVU
         SVPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=p7g2oiiMuH9TCi0rtrHnCkxhA/O1w9HJBCPx/mBRROU=;
        b=IPrWK6oZ5/1CgPEB6v4qu6EtFSErzXuCrNQs5BjwAp5I8JzGg/A5xsaSqs4LPavXnK
         ansg68WCf3tgcRf4ebUJnGkjSMssNrkOgyK3EqK2cSvy8kzzIGKUH6to5/Udk5/Dkne/
         Yp+byihWfVXdtqCkmcYG2ZeCY+aCrn3yLW+mbzs6hbeMDw9/Vnk/sNhj+LPAd/m4mwO6
         0KtxZ7/ksgc1YwWO3OktMdcA3s0jWktj1eBqaitQDd4Eic/uAFjXIdUOjkIPCaBedLci
         NncPTw/48O9OxUY9rV9es66QxVs3InYKisbLdByC4SsbbCUKLx2tYcLioA7GNHao7ksI
         zehw==
X-Gm-Message-State: AJcUukdI6b3WTyvptQIH5SAuskEQZEh3VAtOxQ4QEB5QFTJ315jc1paZ
        H4wUDwRm2bz/J7j3ix1Aky+gUZ6+YLE=
X-Google-Smtp-Source: ALg8bN5vJCMbiBxtTau90dYL84RIZwPTpRPWtnfA6tD/qhTWhOn4vtLiLhKyAIosqeLCR1KkewBgdg==
X-Received: by 2002:a5d:6684:: with SMTP id l4mr36493053wru.154.1548925794574;
        Thu, 31 Jan 2019 01:09:54 -0800 (PST)
Received: from ?IPv6:2a00:23c4:f7a1:ce00:5105:4b7b:c922:7c6? ([2a00:23c4:f7a1:ce00:5105:4b7b:c922:7c6])
        by smtp.gmail.com with ESMTPSA id l20sm9519547wrb.93.2019.01.31.01.09.53
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 31 Jan 2019 01:09:53 -0800 (PST)
Subject: Re: [PATCH] clk: imx8mq: Add missing M4 clocks
To:     Fabio Estevam <festevam@gmail.com>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        linux-clk <linux-clk@vger.kernel.org>,
        NXP Linux Team <linux-imx@nxp.com>,
        Sascha Hauer <kernel@pengutronix.de>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" 
        <linux-arm-kernel@lists.infradead.org>,
        Lucas Stach <l.stach@pengutronix.de>
References: <20190130201725.18961-1-ccaione@baylibre.com>
 <CAOMZO5AU8y1mf1DCMcJ6Y_AN_rP47jx1uVhj9pLRtgL6P70ksw@mail.gmail.com>
From:   Carlo Caione <ccaione@baylibre.com>
Message-ID: <0590fb7b-4934-9ef8-dce1-6fd251864522@baylibre.com>
Date:   Thu, 31 Jan 2019 09:09:52 +0000
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.4.0
MIME-Version: 1.0
In-Reply-To: <CAOMZO5AU8y1mf1DCMcJ6Y_AN_rP47jx1uVhj9pLRtgL6P70ksw@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 30/01/2019 22:46, Fabio Estevam wrote:
> On Wed, Jan 30, 2019 at 6:17 PM Carlo Caione <ccaione@baylibre.com> wrote:
>>
>> The clocks list is missing the clocks for the the M4 core.
> 
> There is a repeated "the" in this phrase.

Ouch! Can I count on the maintainer to fix this while merging? ;)

Thanks,

--
Carlo Caione
