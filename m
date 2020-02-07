Return-Path: <SRS0=NCQF=33=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0ACF2C352A2
	for <linux-clk@archiver.kernel.org>; Fri,  7 Feb 2020 11:06:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D2A782082E
	for <linux-clk@archiver.kernel.org>; Fri,  7 Feb 2020 11:06:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JPoQVHY1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726674AbgBGLGi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 7 Feb 2020 06:06:38 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:38439 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726942AbgBGLGc (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 7 Feb 2020 06:06:32 -0500
Received: by mail-wr1-f66.google.com with SMTP id y17so2161194wrh.5
        for <linux-clk@vger.kernel.org>; Fri, 07 Feb 2020 03:06:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=kDpqIQHMvRBYKt5xeHhPjweUUqEWRQvzpkXya/wCUUg=;
        b=JPoQVHY1lXyIlR6WpWlCoC6OGL7RlRZFd/kQqBU4wVkrPg7xTFkq1QOXG+vygc9Xl5
         sEv7MKKrZc8ZRi+BwZoZKRoGlQJRGduF5idiU1DUJhvWDm2lcRbfn0kuHHORyMvVknME
         vlexSTbZngIqBmsdTky5O5aQKMOrUZ+OM16ZnFFbH4vnrNKOGabUKkZLeBEirLBB8OTN
         oc5UNVpuhIz3avNSp13ibhxF3wvaEs/8vz2AUJxkkbmgAI2XBRI57g9xby8bm1MphFNx
         7rMJ+sQ+GOnz9/RZiOIawBhevXVafMQ+TJG7SlgYMoe1mJ+AhHQbYe9dUD5jaDBsxW6N
         3ZGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=kDpqIQHMvRBYKt5xeHhPjweUUqEWRQvzpkXya/wCUUg=;
        b=QM+Jh/GXZykw0w7mLJ1GLyBynnnh/CTDOIYDJtLawOre/WyEfMflRtB2FVss8e1t/y
         ihyMc/1qwd7b/ZjLTMzTTVKWDDK7qyTxSD6wggeGweJaNFptvojHL9ArAKj6bKbNbUMZ
         9pxYsdgBylKOxTvzAsVBLITIb2kBW513GzTnjGgwpDeEqxRhgTrNnbHCCRHOWPOUC+vJ
         gAMlzn9CS31PcFBY4ioY8r2l/bHLFZH1WjgWlhHKOwiRF55Z2Fw1DaHqPhxb+kmOzhCq
         nJ76ynq9+6VHbOwYuh1HfucC9/Y25Ow0LuzVrKQ++kaDZUOPFrbSDbPed31ldd539Aa2
         dmaw==
X-Gm-Message-State: APjAAAUMSv7tZQiLhjQ3if5otzbgm2RYCPtPCSyAYXp4XCGRODmVCR7K
        Qm15rEDq+3GCLscfW7cTfvk=
X-Google-Smtp-Source: APXvYqxSVDBgVjP8RRsGF0l25WsdUK5txojGab34Gi9pD5H4Z3iOIPVv1PJkM1N7YA72cstH6Mn4dA==
X-Received: by 2002:adf:ab1c:: with SMTP id q28mr3969185wrc.425.1581073590595;
        Fri, 07 Feb 2020 03:06:30 -0800 (PST)
Received: from localhost ([193.47.161.132])
        by smtp.gmail.com with ESMTPSA id e17sm2922751wma.12.2020.02.07.03.06.29
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 07 Feb 2020 03:06:29 -0800 (PST)
Date:   Fri, 7 Feb 2020 12:06:29 +0100
From:   Oliver Graute <oliver.graute@gmail.com>
To:     Aisheng Dong <aisheng.dong@nxp.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     Shawn Guo <shawnguo@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        dl-linux-imx <linux-imx@nxp.com>,
        "kernel@pengutronix.de" <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH RESEND V5 00/11] clk: imx8: add new clock binding for
 better pm support
Message-ID: <20200207110629.GA6975@optiplex>
References: <1573993519-14308-1-git-send-email-aisheng.dong@nxp.com>
 <20191211080525.GS15858@dragon>
 <AM0PR04MB42111A436D719D321ADB479380200@AM0PR04MB4211.eurprd04.prod.outlook.com>
 <AM0PR04MB42115D5A9D431D6EEA0C8D2D800D0@AM0PR04MB4211.eurprd04.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM0PR04MB42115D5A9D431D6EEA0C8D2D800D0@AM0PR04MB4211.eurprd04.prod.outlook.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 21/01/20, Aisheng Dong wrote:
> Gently ping..

Hello,

what is the current status of this patch set?
I'am running this patches since november on my im8qm board and it works
very well for me. So I'am interessted to get this into mainline.
I there something to improve? or to test?

Best Regards,

Oliver
