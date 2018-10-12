Return-Path: <SRS0=EEPi=MY=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B7D1C43441
	for <linux-clk@archiver.kernel.org>; Fri, 12 Oct 2018 11:41:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AAC1B20868
	for <linux-clk@archiver.kernel.org>; Fri, 12 Oct 2018 11:41:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=renesasgroup.onmicrosoft.com header.i=@renesasgroup.onmicrosoft.com header.b="guGS4UTu"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org AAC1B20868
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=renesas.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728040AbeJLTNU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 12 Oct 2018 15:13:20 -0400
Received: from relmlor3.renesas.com ([210.160.252.173]:35168 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726917AbeJLTNU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 12 Oct 2018 15:13:20 -0400
Received: from unknown (HELO relmlir3.idc.renesas.com) ([10.200.68.153])
  by relmlie2.idc.renesas.com with ESMTP; 12 Oct 2018 20:41:15 +0900
Received: from relmlii1.idc.renesas.com (relmlii1.idc.renesas.com [10.200.68.65])
        by relmlir3.idc.renesas.com (Postfix) with ESMTP id 812458918C;
        Fri, 12 Oct 2018 20:41:15 +0900 (JST)
X-IronPort-AV: E=Sophos;i="5.54,371,1534777200"; 
   d="scan'208";a="293390293"
Received: from mail-os2jpn01lp0145.outbound.protection.outlook.com (HELO JPN01-OS2-obe.outbound.protection.outlook.com) ([23.103.139.145])
  by relmlii1.idc.renesas.com with ESMTP/TLS/AES256-SHA256; 12 Oct 2018 20:41:15 +0900
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=renesasgroup.onmicrosoft.com; s=selector1-renesas-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PWaFudFRYM9+//lkmFwAcrQxBhGnSKHxSjhcJ5myWZM=;
 b=guGS4UTu/t6rjJE/AJCFABg98dzIZm9XJ7uZQzCs5dx3erLphFW/b5iT4bcFuLpK2jJDwsweBDGzMSdQo+pT9H2mSuAEw+LD0YCUQOT5Xk0gYfVTEFXt9IP6NKN9wihlqnbUDo35FlBVrIRhcVhNDCCIf67UFiPKmi8YvhEz+4M=
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com (52.133.162.18) by
 TY1PR01MB0238.jpnprd01.prod.outlook.com (10.161.135.149) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.1228.25; Fri, 12 Oct 2018 11:41:14 +0000
Received: from TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::1c53:5c22:c972:dfd4]) by TY1PR01MB1562.jpnprd01.prod.outlook.com
 ([fe80::1c53:5c22:c972:dfd4%5]) with mapi id 15.20.1228.020; Fri, 12 Oct 2018
 11:41:14 +0000
From:   Chris Brandt <Chris.Brandt@renesas.com>
To:     Wolfram Sang <wsa@the-dreams.de>
CC:     Ulf Hansson <ulf.hansson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>
Subject: RE: [PATCH v3 2/3] mmc: renesas_sdhi_internal_dmac: Add R7S9210
 support
Thread-Topic: [PATCH v3 2/3] mmc: renesas_sdhi_internal_dmac: Add R7S9210
 support
Thread-Index: AQHUYKrtptEBqRBHvEyrS0ND+xpSv6UbdlCAgAABSfA=
Date:   Fri, 12 Oct 2018 11:41:13 +0000
Message-ID: <TY1PR01MB1562B5DCB7298E72C96B92998AE20@TY1PR01MB1562.jpnprd01.prod.outlook.com>
References: <20181010150642.73890-1-chris.brandt@renesas.com>
 <20181010150642.73890-3-chris.brandt@renesas.com>
 <20181012110755.qdnevfoyq5qymf42@ninjato>
In-Reply-To: <20181012110755.qdnevfoyq5qymf42@ninjato>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=Chris.Brandt@renesas.com; 
x-originating-ip: [99.185.232.49]
x-ms-publictraffictype: Email
x-microsoft-exchange-diagnostics: 1;TY1PR01MB0238;20:Zk7BNgPehHKwbV1WluUkSVTo4g+9ov+APRwlRobbLzHdcvLRf7B/06ZYtOsC0QvSvLaO+4CvcKcDKqP3o6RAfhjyfqh1SZ0nYy3dlJilu/rYn66/HLD2a1rpBJ8mHmXNrDUUxZLtZn4tidQJKFWfL413CAUYSCtzsrgjFgWwwII=
x-ms-exchange-antispam-srfa-diagnostics: SOS;
x-ms-office365-filtering-correlation-id: 43b7c8b9-e60f-4c72-9816-08d630379d6e
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600074)(711020)(4618075)(2017052603328)(7153060)(7193020);SRVR:TY1PR01MB0238;
x-ms-traffictypediagnostic: TY1PR01MB0238:
x-microsoft-antispam-prvs: <TY1PR01MB023856881CF82338173633B78AE20@TY1PR01MB0238.jpnprd01.prod.outlook.com>
x-exchange-antispam-report-test: UriScan:;
x-ms-exchange-senderadcheck: 1
x-exchange-antispam-report-cfa-test: BCL:0;PCL:0;RULEID:(8211001083)(6040522)(2401047)(8121501046)(5005006)(3231355)(944501410)(52105095)(3002001)(10201501046)(93006095)(93001095)(6055026)(149066)(150057)(6041310)(20161123562045)(20161123564045)(20161123560045)(201703131423095)(201702281528075)(20161123555045)(201703061421075)(201703061406153)(20161123558120)(201708071742011)(7699051);SRVR:TY1PR01MB0238;BCL:0;PCL:0;RULEID:;SRVR:TY1PR01MB0238;
x-forefront-prvs: 0823A5777B
x-forefront-antispam-report: SFV:NSPM;SFS:(10019020)(366004)(376002)(39860400002)(136003)(346002)(396003)(199004)(189003)(8936002)(5250100002)(97736004)(229853002)(71200400001)(71190400001)(6436002)(4326008)(25786009)(55016002)(6246003)(53936002)(9686003)(6916009)(5660300001)(33656002)(14454004)(72206003)(66066001)(186003)(76176011)(102836004)(26005)(305945005)(7416002)(478600001)(2906002)(7696005)(6506007)(99286004)(486006)(11346002)(54906003)(476003)(7736002)(256004)(446003)(106356001)(8676002)(105586002)(2900100001)(74316002)(81166006)(86362001)(316002)(68736007)(6116002)(3846002)(81156014);DIR:OUT;SFP:1102;SCL:1;SRVR:TY1PR01MB0238;H:TY1PR01MB1562.jpnprd01.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;A:1;MX:1;
received-spf: None (protection.outlook.com: renesas.com does not designate
 permitted sender hosts)
x-microsoft-antispam-message-info: XwfOj53TqJisg6NBWlbbHuje+4hzb46ians8EosROifZN+4NlDyXJ8lCzxHIwo/BXkVGjUwyKUUUXWElfhqFoBW/fC1Z8iD9EmKZ83SBKgO+QxBpFZZpoYwoiBB5K3Lc7sKCqjVMbdZNxTO8tNQGSCeY30LLYUSNUOHvAH8OmLH1juTSsejQQa9Dd6CBkpVcb3faKoDlaqnx+BHAUz1u1xEEhqaM6rB6VeZH7oYQlO0exkZsIJFDdVb360YZtXk63eZYwRbO7OvKgkjDKrpMPpeHCYZLS73u7cMI54jrMpJQsGuuDYjnUIrsmL4vpkahFnKhjD+Pkc4rJ/ZOtenp/QGoHgi1fSV0sQwh6oJC9fI=
spamdiagnosticoutput: 1:99
spamdiagnosticmetadata: NSPM
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: renesas.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43b7c8b9-e60f-4c72-9816-08d630379d6e
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Oct 2018 11:41:13.9967
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 53d82571-da19-47e4-9cb4-625a166a4a2a
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY1PR01MB0238
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Wolfram,

On Friday, October 12, 2018, Wolfram Sang wrote:
> > +/* RZ/A2 does not have the ADRR_MODE bit */
> > +#define SDHI_INTERNAL_DMAC_ADRR_MODE_FIXED 2
>=20
> First, there is a typo: s/ADRR/ADDR/g

Thanks!

Even after you pointed that out...I had to stare real hard to see it. I=20
guess the brain corrects what you see.


> Also, I think it would make the code much more comprehensible if this
> macro was named SDHI_INTERNAL_DMAC_ADDR_MODE_BROKEN. Or maybe
> SDHI_INTERNAL_DMAC_FIXED_ADDR_MODE_BROKEN. Currently, on first read I
> thought this mode was fixed on this SoC and broken on all the others and
> was confused.

To be honest, I was not able to fully understand the issue in detail. I was=
 getting information through someone that was not in the design team. So to=
 be fair to the chip design guys, I want to avoid the word "broken".
They took the bit out of the hardware manual, and since the HW was designed=
 to work either way (and the default register setting is for fixed), I cons=
ider it an 'unsupported feature'.

So, how about a compromise of:

#define SDHI_INTERNAL_DMAC_ADDR_MODE_FIXED_ONLY 2


From your other email:
> > As you can imagine, it does have this bit. And it worked fine from me.
> > But the chip guys said they found something not right with it, so they
> > removed it from the v1.0 Hardware Manual.
>=20
> Do you happen to know if this applies for Gen3 SDHI as well?

I don't think this applies to Gen3. This is just a RZ/A2 thing.

With that said, there are some Gen3 HW bugs that are in RZ/A2 HW, like the =
QSPI read bug. Since the RZ/A2 has the exact same HW as Gen3, it has the sa=
me HW bug. Now that one is a "bug", and I don't mind calling that one broke=
n.


Chris
