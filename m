Return-Path: <SRS0=DelH=WE=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72D33C433FF
	for <linux-clk@archiver.kernel.org>; Thu,  8 Aug 2019 16:46:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2789321881
	for <linux-clk@archiver.kernel.org>; Thu,  8 Aug 2019 16:46:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=nxp.com header.i=@nxp.com header.b="WrIjnxXL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404085AbfHHQqw (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 8 Aug 2019 12:46:52 -0400
Received: from mail-eopbgr00045.outbound.protection.outlook.com ([40.107.0.45]:16707
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728289AbfHHQqw (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 8 Aug 2019 12:46:52 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cBeD0lXwdVBRQM6m1OchkuD2i9RNRA/Q4e8vgpUlPbZ55l/WTwPCyFP14gDwE2G0ktHndmSFaTCW4V8Yqy9OJu8nIMbSKWCH0mfatYCiF14Wpa+H1rQ6Kz16cxzp1/lLbI23DUPgMSB1GWp6egVtr9UaB2l8RVK6tcmAPybESo00gojI7l3KD1/NyCb3kyp6ZRuV6137r30kPdPyZktUCEsLszpLa27o/ui+m5EVpqiTracPf6wWaLqsavmQI4ysVaykndxHaniiMh4Ew/3dSvhTad77vUfpp3qtB2Uj8kAFrcFAMDu7fogdjt7zNXZ85NFUbKZCaFJ0o82QEYxlRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=89gyf+bubo9ODlDykcslOmaUDYIz+Q9T4mnOpFe3EdY=;
 b=RS/qggNCtoGeJdCzUkKjIIqZhzdp01yWS36JEfB2hRQbYFWg+SEsrFPympLPWuHqvtxVNjoeo0KG6KYINrtrdzja4txLvLAe835sMD/pAd1a67yhRWPf9Z5aYPX0XKRUo13IKnwscGhgcq2jrlFZDNAuC1tB0Dslggl3WtIopY3/sOsqyDT+//oFM9y34GGPtq8inE9lLnoc7Kv2uW4inHcXuVx2ynIk+aqRvnEPommW9eKk3QssNEIqhN31o7ERLSrjO52KuABZhVHsMN0MtJxmKTX3EmXOdMKbQJVGt0ZT0jyRQoZOvtJZr5Ejbv2mOMc1lgEYmz7n6y19oBEL8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=89gyf+bubo9ODlDykcslOmaUDYIz+Q9T4mnOpFe3EdY=;
 b=WrIjnxXL2O7WSZNR3TqRvuVCR4UKDYo0zQrEmBD9fYyCwDiZdUG+rfg38gBij2ALy+CjL4FDd9pCoXVYPvQHtFf5KIEqIpXHvIYWADaygQwxXitk9XBziRKPmJSqqkcV0CQHaAzUBxndcGlhBEUx2EbJjfo3vTbtVzOf+L/DXvQ=
Received: from VI1PR04MB7023.eurprd04.prod.outlook.com (10.186.159.144) by
 VI1PR04MB4557.eurprd04.prod.outlook.com (20.177.55.215) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.2157.14; Thu, 8 Aug 2019 16:46:48 +0000
Received: from VI1PR04MB7023.eurprd04.prod.outlook.com
 ([fe80::e53d:e6a9:79bd:f970]) by VI1PR04MB7023.eurprd04.prod.outlook.com
 ([fe80::e53d:e6a9:79bd:f970%2]) with mapi id 15.20.2157.015; Thu, 8 Aug 2019
 16:46:48 +0000
From:   Leonard Crestez <leonard.crestez@nxp.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>
CC:     Michael Turquette <mturquette@baylibre.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH v3 1/2] clk: Add clk_min/max_rate entries in debugfs
Thread-Topic: [PATCH v3 1/2] clk: Add clk_min/max_rate entries in debugfs
Thread-Index: AQHVTfoGXeMGdmRTE0G0NHpNjfznmw==
Date:   Thu, 8 Aug 2019 16:46:48 +0000
Message-ID: <VI1PR04MB7023C8A78321E34492290E56EED70@VI1PR04MB7023.eurprd04.prod.outlook.com>
References: <68e96af2df96512300604d797ade2088d7e6e496.1562073871.git.leonard.crestez@nxp.com>
 <20190808150028.0BC1F217D7@mail.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: spf=none (sender IP is )
 smtp.mailfrom=leonard.crestez@nxp.com; 
x-originating-ip: [212.146.100.6]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 33e44622-d231-4747-20e8-08d71c200146
x-ms-office365-filtering-ht: Tenant
x-microsoft-antispam: BCL:0;PCL:0;RULEID:(2390118)(7020095)(4652040)(8989299)(4534185)(4627221)(201703031133081)(201702281549075)(8990200)(5600148)(711020)(4605104)(1401327)(4618075)(2017052603328)(7193020);SRVR:VI1PR04MB4557;
x-ms-traffictypediagnostic: VI1PR04MB4557:
x-microsoft-antispam-prvs: <VI1PR04MB4557EEE9F0B55455288F7382EED70@VI1PR04MB4557.eurprd04.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:2887;
x-forefront-prvs: 012349AD1C
x-forefront-antispam-report: SFV:NSPM;SFS:(10009020)(4636009)(39860400002)(346002)(136003)(396003)(376002)(366004)(189003)(199004)(229853002)(74316002)(25786009)(71200400001)(2906002)(71190400001)(66066001)(66446008)(52536014)(486006)(76176011)(7696005)(9686003)(55016002)(4326008)(44832011)(53546011)(53936002)(186003)(478600001)(6506007)(8676002)(6246003)(8936002)(102836004)(476003)(81166006)(446003)(33656002)(26005)(7736002)(66946007)(81156014)(256004)(66476007)(91956017)(64756008)(66556008)(99286004)(14454004)(6436002)(76116006)(305945005)(86362001)(3846002)(6116002)(110136005)(54906003)(4744005)(316002)(5660300002);DIR:OUT;SFP:1101;SCL:1;SRVR:VI1PR04MB4557;H:VI1PR04MB7023.eurprd04.prod.outlook.com;FPR:;SPF:None;LANG:en;PTR:InfoNoRecords;MX:1;A:1;
received-spf: None (protection.outlook.com: nxp.com does not designate
 permitted sender hosts)
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam-message-info: 2+f84Ue9wfJGnABiGJs6t9Jgkc5/KreJrfSPR13/OI34f5xoqvEVA9ngZmB+VYfQqniB4r5uAezs95OkDm3yMJy7+iAZt+vuclDwDeqOPacUb5bCONs4Ta1nJ9zRfUeSgoc5zZF3xTeR3cdxwbGR4tkj3rkkCswfLrbVHgp7kTLUDwHJESUJRo1NAGDK/o/k65F+oPr4mMphg2Vsbh7WELwfOkM7KIIt2nT9p2Tr143Z+LfuLz7AFH4Uv4l2BQ1TFX+/sDozpQTyu42r5AJE79i4aLpuE79jK+6d0fIfqBoqRS7v53ajcrkJYYmWngKjbhCyFZCGc9V4V6Qa/6nCdMx44CCsi8nDHVqQYZRcfgkEVtXY/6GON3gldyBPuCg/mmmJkaisAGpQuxmM0r6SI+m1nPK6ZJQXWwV8fa7lTAA=
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e44622-d231-4747-20e8-08d71c200146
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 16:46:48.0647
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: f2Bkq9W3Tl39MTyXT/yBo8QljNd4e/kf/2EMZzD+0vaVXIEmnGps5HC6qYdDnI5wsdFxX75f57SzvoZMqtDpeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1PR04MB4557
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 8/8/2019 6:00 PM, Stephen Boyd wrote:=0A=
> Quoting Leonard Crestez (2019-07-02 06:27:09)=0A=
>> diff --git a/drivers/clk/clk.c b/drivers/clk/clk.c=0A=
=0A=
>>   static void clk_dump_one(struct seq_file *s, struct clk_core *c, int l=
evel)=0A=
>>   {=0A=
>> +       clk_core_get_boundaries(c, &min_rate, &max_rate);=0A=
>> +       if (min_rate !=3D 0)=0A=
>> +               seq_printf(s, "\"min_rate\": %lu,", min_rate);=0A=
>> +       if (max_rate !=3D ULONG_MAX)=0A=
>> +               seq_printf(s, "\"max_rate\": %lu,", max_rate);=0A=
> =0A=
> What are the if conditions about? We always output the values in the=0A=
> individual files, but for some reason we don't want to do that in the=0A=
> json output?=0A=
=0A=
These if conditions are an easy way to avoid spamming "min_rate": 0, =0A=
"max_rate": 18446744073709551615 in json. If you object to the =0A=
inconsistency a nice solution would to be show "null" in both debugfs =0A=
and json.=0A=
=0A=
Outright hiding min/max files from debugfs is impractical, it would =0A=
require filesystem calls from clk_set_min_rate=0A=
=0A=
--=0A=
Regards,=0A=
Leonard=0A=
