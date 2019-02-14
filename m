Return-Path: <SRS0=hHRo=QV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 33260C4360F
	for <linux-clk@archiver.kernel.org>; Thu, 14 Feb 2019 10:35:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 01DB9222A4
	for <linux-clk@archiver.kernel.org>; Thu, 14 Feb 2019 10:35:30 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VfHmYe6i"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2438337AbfBNKfa (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 14 Feb 2019 05:35:30 -0500
Received: from mail-pl1-f195.google.com ([209.85.214.195]:33806 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2438334AbfBNKf3 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 14 Feb 2019 05:35:29 -0500
Received: by mail-pl1-f195.google.com with SMTP id w4so2959902plz.1
        for <linux-clk@vger.kernel.org>; Thu, 14 Feb 2019 02:35:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rwjOfrTEYGkGc5BS4BtBGe4HH8UgLM5DQXjqkIXGaC8=;
        b=VfHmYe6iUsd9GpoVY2XfvgN0dqznFDeJv6VJApeZePmUVi1pITG9xrI40nEFH7iJrw
         pJy+xZblwlFWOwJqCv5XA6hlxJjFHEuy3puUbj0p4jPgutyn9YAkI/TlzrXQ8ZeXP21A
         MWw6+wzqhCnG2oPV40OS9scSi3vZZ+YrQgs8H7AhleZdJ8iAf/++pasoPouiL/rYeQNf
         25ZvF7ky4wVXVbkfa5eK5x0eV+a6A1lyhhydQy8TS/gngqKG3rxHh15jTcX+821ua9kC
         8H91cvPGTwdVWD2K694ZKqI+13x/8P9L8SjCxNN43dRTiXgVB1zuoCifpY8WgpA19G0O
         GISA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rwjOfrTEYGkGc5BS4BtBGe4HH8UgLM5DQXjqkIXGaC8=;
        b=BBBUPtuDDVp0eo4REOJ6l1fb7aldZLc0g5eIEX9Samk6qsMuQZ+NuMbSX7bzoPy25W
         /TVZwQkNOg02gn49ogjsW6SjWH8v+JBvpImUUxK8m1zkqmu1gZdLspniVXc2XgwPPSc3
         xU0DiOj/FAXPjJudZ7VU769SkPcQNdbpasTRtEhZmHBn8JFKGgclES8H+CqXHlm0PQ+S
         4mOj/hLbwv8M6BBrhkOKzHE8cSd9eHb0qcSoBE1aqvvT6BJmTVK8GTi7Wp5HiJw9l6I9
         ao38mnHhLiGfXbyclKsYJg90TMp9gV87XvUFcjFTJ54AB0NZ/KGjL/pLLqgq9fjYF8WU
         60gw==
X-Gm-Message-State: AHQUAubcoTIUlsuY/mdNM7AhDHbssilqslGrRm+i61qCXBpovWem8oLx
        guLHmBe9J5kEQkUJbe84wYAakg==
X-Google-Smtp-Source: AHgI3Ibbx6ye3ET6qlC8sLFNRn5/zsfuHqaF034/LeC27Trj3RhmkUdJxe4ejFa46jWJTjq8rOLk5g==
X-Received: by 2002:a17:902:8b82:: with SMTP id ay2mr3401562plb.64.1550140529213;
        Thu, 14 Feb 2019 02:35:29 -0800 (PST)
Received: from localhost ([122.172.102.63])
        by smtp.gmail.com with ESMTPSA id d68sm2964620pfa.64.2019.02.14.02.35.27
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 14 Feb 2019 02:35:28 -0800 (PST)
Date:   Thu, 14 Feb 2019 16:05:26 +0530
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
Subject: Re: [PATCH V6 1/2] arm64: dts: freescale: imx8qxp: add cpu opp table
Message-ID: <20190214103526.ly5gvkgg3s32t33k@vireshk-i7>
References: <1550137826-18531-1-git-send-email-Anson.Huang@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1550137826-18531-1-git-send-email-Anson.Huang@nxp.com>
User-Agent: NeoMutt/20180323-120-3dd1ac
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 14-02-19, 09:55, Anson Huang wrote:
> Add i.MX8QXP CPU opp table to support cpufreq.
> 
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> Changes since V5:
> 	- add clocks for all secondary CPUs too.
> ---
>  arch/arm64/boot/dts/freescale/imx8qxp.dtsi | 30 ++++++++++++++++++++++++++++++
>  1 file changed, 30 insertions(+)

Acked-by: Viresh Kumar <viresh.kumar@linaro.org>

-- 
viresh
