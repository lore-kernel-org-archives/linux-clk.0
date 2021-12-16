Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6333C433EF
	for <linux-clk@archiver.kernel.org>; Thu, 16 Dec 2021 09:49:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230386AbhLPJtl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 16 Dec 2021 04:49:41 -0500
Received: from mx1.cqplus1.com ([113.204.237.245]:33698 "EHLO test.cqplus1.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230345AbhLPJtk (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 16 Dec 2021 04:49:40 -0500
X-MailGates: (flag:1,DYNAMIC,RELAY,NOHOST,LAN:PASS)(compute_score:DELIVE
        R,40,3)
Received: from 172.27.96.203
        by mx1.cqplus1.com with MailGates ESMTP Server V5.0(4805:0:AUTH_RELAY)
        (envelope-from <qinjian@cqplus1.com>); Thu, 16 Dec 2021 17:48:40 +0800 (CST)
Received: from CQEXMAIL01.cqplus1.com (172.27.96.203) by
 CQEXMAIL01.cqplus1.com (172.27.96.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.17; Thu, 16 Dec 2021 17:48:36 +0800
Received: from CQEXMAIL01.cqplus1.com ([::1]) by CQEXMAIL01.cqplus1.com
 ([::1]) with mapi id 15.01.2375.017; Thu, 16 Dec 2021 17:48:36 +0800
From:   =?utf-8?B?cWluamlhblvopoPlgaVd?= <qinjian@cqplus1.com>
To:     "sboyd@kernel.org" <sboyd@kernel.org>
CC:     "arnd@arndb.de" <arnd@arndb.de>,
        "broonie@kernel.org" <broonie@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "linux@armlinux.org.uk" <linux@armlinux.org.uk>,
        "maz@kernel.org" <maz@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "tglx@linutronix.de" <tglx@linutronix.de>,
        =?utf-8?B?V2VsbHMgTHUg5ZGC6Iqz6aiw?= <wells.lu@sunplus.com>
Subject: Re: [PATCH v5 06/10] clk: Add Sunplus SP7021 clock driver
Thread-Topic: Re: [PATCH v5 06/10] clk: Add Sunplus SP7021 clock driver
Thread-Index: AdfyYenlakiI4birTNO578exV3yOag==
Date:   Thu, 16 Dec 2021 09:48:36 +0000
Message-ID: <cb4d3624cd7f4b7794e770819c559d6d@cqplus1.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [172.28.110.18]
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

U29ycnksIE15IG1haWwgY2xpZW50IGZhaWxlZCB0byByZWNlaXZlIHlvdXIgcmV2aWV3IG1haWwu
DQpBZnRlciBzZW50IHY2IHBhdGNoLCBJIGp1c3QgZm91bmQgdGhpcyByZXZpZXcgb24gbGttbC4N
CkknbGwgZml4IHRoZXNlIGNvbW1lbnRzIG9uIHY3Lg0KDQo=
