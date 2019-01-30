Return-Path: <SRS0=JnSZ=QG=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	UNWANTED_LANGUAGE_BODY,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2F28C282D7
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jan 2019 15:46:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6A78A21473
	for <linux-clk@archiver.kernel.org>; Wed, 30 Jan 2019 15:46:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1548863216;
	bh=n+gxj75RpvIpNRphQr8dRvARsQL2/9kHsDQBW1VRkU8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=OwfUs+vSPsm39BQRs/EBaHDoJ0mtiXrP9SXvpHY0zExyNIebJv71OBjVm7ecDXfzO
	 6iJBBeh5BsVdpxIHUwDjfBysuaLGGG16JrYTnAyhXIaKuD2TDQxsu5OfTUaVlAXS2C
	 VyyORaDQIFul61naGAXFF3fFOfm2KPqWmeeS0S0g=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730122AbfA3Pq4 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 30 Jan 2019 10:46:56 -0500
Received: from mail-oi1-f196.google.com ([209.85.167.196]:41160 "EHLO
        mail-oi1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726439AbfA3Pq4 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 30 Jan 2019 10:46:56 -0500
Received: by mail-oi1-f196.google.com with SMTP id j21so19566184oii.8;
        Wed, 30 Jan 2019 07:46:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=TN1LQ1HRcvLbPsh//czIuLYaojCX5H8AWx+xzGIPCxI=;
        b=RyWL3GCpGPHeOe2tp9y47mcucq5y9I2ya1Xh7knYuWsXwVBTIK8cGAh0UT1m4R41ly
         ZVCYL2ZmKlaRWyo4qbF6j9ou1gux2yc2Vek20LGMxzRkJh4QYntJXfCQIC9c3c2JSGh3
         ooTAHlNehnikZ57CXdJHelp2mfMQdcMTlmWxN3BmKQ3Em+zkg0BpYInIudQhpih5zpx7
         STQWpR+x4BOzAXKeop/+YiXiqItjpTZaVlrIAiTAtztKKCzQ87mkUHkowgKfAZwpTKEX
         aP6k1fOvcZxHCRW1cAWDr01Lov3Iw6S4LzmEdMD1ThSddx83YuZIcbijIvOcBQ7agq+m
         +Tfw==
X-Gm-Message-State: AHQUAub5LQx0ta6MyKEYpTZLtNcZp/AHgUYK+7iT+HYwr9Cb0zsbUXLN
        h0vwDlaILeX+PSbL1vcJSQ==
X-Google-Smtp-Source: AHgI3Ib/Im/cwyDEXNLWF0ZI8lYRwc2ne6kjvoSfaEqgZFl2u4gqpBUqGqw+yfv2Wtyeay0KX7+mGw==
X-Received: by 2002:aca:4e11:: with SMTP id c17mr12262717oib.254.1548863215018;
        Wed, 30 Jan 2019 07:46:55 -0800 (PST)
Received: from localhost (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id g25sm650859otr.30.2019.01.30.07.46.54
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 30 Jan 2019 07:46:54 -0800 (PST)
Date:   Wed, 30 Jan 2019 09:46:53 -0600
From:   Rob Herring <robh@kernel.org>
To:     Kamil Konieczny <k.konieczny@partner.samsung.com>
Cc:     linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        Chanwoo Choi <cw00.choi@samsung.com>,
        devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
        Kukjin Kim <kgene@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sylwester Nawrocki <s.nawrocki@samsung.com>,
        Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>,
        Marek Szyprowski <m.szyprowski@samsung.com>
Subject: Re: [PATCH v5 4/5] dt-bindings: clk: exynos5433: add imem clock
Message-ID: <20190130154653.GA17638@bogus>
References: <20190122090232.29194-1-k.konieczny@partner.samsung.com>
 <CGME20190122090251eucas1p122f1c6d47f3cb60febeadda88ada3a76@eucas1p1.samsung.com>
 <20190122090232.29194-5-k.konieczny@partner.samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190122090232.29194-5-k.konieczny@partner.samsung.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Jan 22, 2019 at 10:02:31AM +0100, Kamil Konieczny wrote:
> Add Exynos5433 DT bindings to describe imem clocks for SlimSSS (Slim
> Security SubSystem).
> 
> Signed-off-by: Kamil Konieczny <k.konieczny@partner.samsung.com>
> ---
>  include/dt-bindings/clock/exynos5433.h | 6 ++++++
>  1 file changed, 6 insertions(+)

Reviewed-by: Rob Herring <robh@kernel.org>
