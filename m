Return-Path: <SRS0=yexa=UK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_NEOMUTT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 046D2C43218
	for <linux-clk@archiver.kernel.org>; Tue, 11 Jun 2019 02:38:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id CC98F2086D
	for <linux-clk@archiver.kernel.org>; Tue, 11 Jun 2019 02:38:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Q+zRpjrb"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390473AbfFKCiP (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 10 Jun 2019 22:38:15 -0400
Received: from mail-pg1-f178.google.com ([209.85.215.178]:46083 "EHLO
        mail-pg1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390830AbfFKCiP (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 10 Jun 2019 22:38:15 -0400
Received: by mail-pg1-f178.google.com with SMTP id v9so4334875pgr.13
        for <linux-clk@vger.kernel.org>; Mon, 10 Jun 2019 19:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=VzbaCUeairlB7SV9tBrRxtSBGLQPN2IpzYdKT1AqRHM=;
        b=Q+zRpjrbyJm8yQeUStTnWUtyUIayjzHZDfZDp+elDSTN3E4gjC4q2wmSZ1WkjIld4W
         xK+PBrb/7FWR332jiYaXMpvb5Gz2hpv5ughyBnNjyfGdv5bS83rgfcT6IfO637qUErGS
         650EKYXNwyXkKY7P1eT2uzDzuJ+gs/LHXO5d9DCh8XwuERiN+U5LqzhMsanfWppKdBZV
         zADZo025r3gIfNQ3xwKImvE3IlwyJPcLdkaeZ18BfQo1+pARbRdP+SzZTSD0jdtjPfOe
         Ia5WPOB+qHZj00b2BhQL71ybq0qVudOa+/NpKD3iLR2wzlrUaDGu11YybnLwj4ZuIi8h
         8npQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=VzbaCUeairlB7SV9tBrRxtSBGLQPN2IpzYdKT1AqRHM=;
        b=fHyhHgZOfFQ8koblXOhRej/CO667xEbKA0Hw4SxR7qfQKSzoA5naQctvN3MKOARziI
         DRV16b/8ksT62CGxgSP5WCkjSd7xSMcOaACesXRycEqxdjP23O6ZNPfjJttESO2jF7WZ
         X/MPAvwzgWumdr7nfbRWcaIkHpURmSbeXzhXjzMCqCroZaAIo55w/DTgs8M5q2ibH1iQ
         OlFz6sQCPeoCgHhZCEIKzUT96YMFu6zt1Mx3+BUnkeAa/mwTg6ZyNwPrH94wC1/Vkyck
         pnTfLOAnLvQcpcReFq8Dj1iDxsApbbR6ALq+PcRCBNQzSVLqel+mqlkBaUHR0iPTLA2/
         Ba6A==
X-Gm-Message-State: APjAAAXeXo+GiE6k5LzKmnmTOw2DYe/ll50EUEv3WzBmLDJbH8FiXN3R
        IZawITT1Pbkjyt5UWmqw39I1OQ==
X-Google-Smtp-Source: APXvYqy0mB8jLiynhhQ3AwP14lHYE4hjQyOQPc+u/uwTzhBrDCfJUKQTM0HOWMCjFEH3KqdJeyJMdQ==
X-Received: by 2002:a63:6841:: with SMTP id d62mr18009567pgc.17.1560220693808;
        Mon, 10 Jun 2019 19:38:13 -0700 (PDT)
Received: from localhost ([122.172.66.84])
        by smtp.gmail.com with ESMTPSA id j13sm10899658pfh.13.2019.06.10.19.38.12
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 10 Jun 2019 19:38:12 -0700 (PDT)
Date:   Tue, 11 Jun 2019 08:08:10 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     Leonard Crestez <leonard.crestez@nxp.com>,
        Anson Huang <anson.huang@nxp.com>,
        Chanwoo Choi <cw00.choi@samsung.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Georgi Djakov <georgi.djakov@linaro.org>,
        Alexandre Bailon <abailon@baylibre.com>,
        Jacky Bai <ping.bai@nxp.com>,
        MyungJoo Ham <myungjoo.ham@samsung.com>,
        Kyungmin Park <kyungmin.park@samsung.com>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "Rafael J. Wysocki" <rjw@rjwysocki.net>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>,
        "linux-pm@vger.kernel.org" <linux-pm@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [RFC] devfreq: Add generic devfreq-dt driver
Message-ID: <20190611023810.7lrgnyqqkuajlm6p@vireshk-i7>
References: <e48d7e3d71166cea20c3c200300e0ffa6d26d085.1559737589.git.leonard.crestez@nxp.com>
 <20190606031526.xknv5qdoqufim6tr@vireshk-i7>
 <VI1PR04MB50558EF0387824D6AAEEB18EEE130@VI1PR04MB5055.eurprd04.prod.outlook.com>
 <20190610234844.CC289206C3@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190610234844.CC289206C3@mail.kernel.org>
User-Agent: NeoMutt/20180716-391-311a52
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 10-06-19, 16:48, Stephen Boyd wrote:
> This still looks very much "virtual" because the NoC node doesn't have a
> 'reg' property. Is there anything the driver will do besides change the
> frequency of the clk based on the OPP table? If not, then it still looks
> like this is a node for the sake of making devfreq happy to probe via
> DT.

Exactly.

-- 
viresh
