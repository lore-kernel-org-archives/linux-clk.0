Return-Path: <SRS0=hHRo=QV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66A52C43381
	for <linux-clk@archiver.kernel.org>; Thu, 14 Feb 2019 10:20:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 31B88222A1
	for <linux-clk@archiver.kernel.org>; Thu, 14 Feb 2019 10:20:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yRy3zGKR"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731789AbfBNKUw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 14 Feb 2019 05:20:52 -0500
Received: from mail-pf1-f195.google.com ([209.85.210.195]:39788 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731410AbfBNKUw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 14 Feb 2019 05:20:52 -0500
Received: by mail-pf1-f195.google.com with SMTP id f132so2879843pfa.6
        for <linux-clk@vger.kernel.org>; Thu, 14 Feb 2019 02:20:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=mJzmhAM1KCaDn3qCEzGBUzKFpMm/FqdTAEQEBba9WuU=;
        b=yRy3zGKRhefQGEI45kJzX0CQ0FHy3th966wa8kA5ybqpteqik9foOkZMUnJzktjGl8
         Z2RzVnByybh6/ptEQCjHrsNZMs8IG4ysPbnuAlnL2X0axVRXLIlaz+FxUhw8+dF/Qn1s
         x6JaLP5I+mzTUiD7tt+bfyHxGIljO92FSZIgfAokdZXoBmxO27F9zjoKS0aZoNoHtoUD
         m02bWjnIMQADXjx0O+iLZCrniyxJUcxijwakKoTdQ5Th6e2K/lQjuDGwvWxM/bMnbER/
         i2uQgWsz1WY8N7EovgTIJeB2+a9R+KMMaauJKrjD/8yy5IttUZZB7fOUnxKTf3ZWPno1
         2quw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mJzmhAM1KCaDn3qCEzGBUzKFpMm/FqdTAEQEBba9WuU=;
        b=Lx4htutdCZy2M/gWSRE/ixwkbIHFAyTGiJqrRAHi9D5vtVl1THnOi22hfu+OpMSI9p
         xwnvrR8l1SYRZ6mmOeRuM5JzdnHyCW85C9NX98DZFj/zi9E6tuO4yAJ70fD9QeMxgdhw
         vMtJJVuUiTwhidpZFQfZSeFAVNVZqsB17VTKApw/y8407zKNG/juOPQKSa/CgdyFnya4
         gfMHXufd0dURT9RFSbOMQD2Xvu/mf5sR9qs0crxW85kufsQRNknw6RZOd3THnWBqGVWq
         /T6CAqh6/kBfKVD1uxGeqPtYfqI+/YSiJnpM/435RMi1QTDwfc6JMIV7wisNeR765DMd
         4dXA==
X-Gm-Message-State: AHQUAuYTb9NXKjGbNLIr7X2ZSNh2P2xRvSzMrDMGvebSTu6eP5F8JhTn
        bPxrgyKiPa5+4VkImjHI0F6Sgw==
X-Google-Smtp-Source: AHgI3Ia4kTM8Lwc2qum7Ad7f9UewW+plRXqPk5ErxDmeO3cNbGl0oMiH1p46WjbMjlZPwhRIL8B9zg==
X-Received: by 2002:a63:be0a:: with SMTP id l10mr3030321pgf.292.1550139651606;
        Thu, 14 Feb 2019 02:20:51 -0800 (PST)
Received: from localhost ([122.172.102.63])
        by smtp.gmail.com with ESMTPSA id h15sm2616261pfn.9.2019.02.14.02.20.49
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Feb 2019 02:20:50 -0800 (PST)
Date:   Thu, 14 Feb 2019 15:50:47 +0530
From:   Viresh Kumar <viresh.kumar@linaro.org>
To:     Anson Huang <anson.huang@nxp.com>
Cc:     "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "mark.rutland@arm.com" <mark.rutland@arm.com>,
        "shawnguo@kernel.org" <shawnguo@kernel.org>,
        "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        "festevam@gmail.com" <festevam@gmail.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        Aisheng Dong <aisheng.dong@nxp.com>,
        Daniel Baluta <daniel.baluta@nxp.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        dl-linux-imx <linux-imx@nxp.com>
Subject: Re: [PATCH V5 1/2] arm64: dts: freescale: imx8qxp: add cpu opp table
Message-ID: <20190214102047.giu5lwxw7dtyfdqy@vireshk-i7>
References: <1550131046-2069-1-git-send-email-Anson.Huang@nxp.com>
 <20190214083419.slnuolyy5xhz4szy@vireshk-i7>
 <DB3PR0402MB39163EE75B512102C5FE19E9F5670@DB3PR0402MB3916.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DB3PR0402MB39163EE75B512102C5FE19E9F5670@DB3PR0402MB3916.eurprd04.prod.outlook.com>
User-Agent: NeoMutt/20180323-120-3dd1ac
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 14-02-19, 09:47, Anson Huang wrote:
> Although all CPUs share same clock and opp table, but OK, I will add clock to
> all CPUs.

Right, but still these must be present for all CPUs as on certain
occasions a CPU other than CPU0 can be used to bring up the cupfreq
policy.

-- 
viresh
