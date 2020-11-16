Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B87DC63697
	for <linux-clk@archiver.kernel.org>; Mon, 16 Nov 2020 07:18:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8B5CF22265
	for <linux-clk@archiver.kernel.org>; Mon, 16 Nov 2020 07:18:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=wdc.com header.i=@wdc.com header.b="mqOkNReb";
	dkim=pass (1024-bit key) header.d=sharedspace.onmicrosoft.com header.i=@sharedspace.onmicrosoft.com header.b="N7SZQLc4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbgKPHS3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 16 Nov 2020 02:18:29 -0500
Received: from esa4.hgst.iphmx.com ([216.71.154.42]:16202 "EHLO
        esa4.hgst.iphmx.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726659AbgKPHS2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 16 Nov 2020 02:18:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=wdc.com; i=@wdc.com; q=dns/txt; s=dkim.wdc.com;
  t=1605511107; x=1637047107;
  h=from:to:cc:subject:date:message-id:references:
   content-transfer-encoding:mime-version;
  bh=8WluFzkWDxCoTfL1v0NM4BH0gXcwxgCoZDwliN1Q+WY=;
  b=mqOkNRebPigIYsYkHdacSAluyyGKR5yODQqBQwqAxF0yzE0Jg/b3WYK1
   31SPQhT5OMuVFOKLfk46JAvtKhbdwLYRQjEqnDL9pKqcRkkQm6Jx+DWQG
   lrlbhENle7Q4PKaP93uUYmE6zcUUMeMQHZWUvpX+DcGXYCl5J5wHThDk2
   8YutnZti6osiYNF85CvMoRIdGcXMqskgkDsBU5o+qe9bCQqCabTL6rHV/
   +iEIlXkRcV9zUQuIE2FMnYc/fKi9AtTAJIfySWzOkViMIVMnuy8PHdH1f
   JkAq1BKFy2dBwQlYHnwmeldBIxw0V5wO0R7rGbHaaTWrl8HX6f1fyXuAH
   g==;
IronPort-SDR: d16sskWGiriHnnDOwkZHBj4NrOcdjcx1mBEc5JUVEQbglQoCq7aF7r5O+x7pdFeRPX/Fd5/MWR
 rRgWE4737odJ4TCM6/i58nlqesdLMBjv9BUys+TgxENyKzdi7x5li5Mi4+MWFRC3X94nfvalJQ
 XhPOFJgt2VXSRduBWHqx4LKPMuU1pehweajFtCd373OZpZFlHawJd0hHp1o/dpt5fzg+FDdpvn
 yFmjLlFG6pWm13bPAI2BvMCcjNA3B9UE/TMPGns7HyZdpzK7Dq61hyjL6ODKXllhRUMT+eIjf9
 4m8=
X-IronPort-AV: E=Sophos;i="5.77,481,1596470400"; 
   d="scan'208";a="152591950"
Received: from mail-dm6nam10lp2107.outbound.protection.outlook.com (HELO NAM10-DM6-obe.outbound.protection.outlook.com) ([104.47.58.107])
  by ob1.hgst.iphmx.com with ESMTP; 16 Nov 2020 15:18:26 +0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Oi9Bp+FTG01/yoXdGduwpf24Kl4hrGTu9wA4UC8eN2iVzNo9+yvdemlTFpWyI0SQmalAcDH42eCEQXlj+M6YngmlFO+wAuXQg7UjktrlW6x1ig9qEV/uKeYJCA0PxZeqULkS3U+faDhFGUAsnxhBIU8h07QuSHe8ndKbWc1jjy/F+kkX4g+mTvCS8RGtA1z0v/roOSSB3xAGPXxJAP4a5bx6Bie0HmCUlnVm8svVXhvNMl2hMN/J231kzxSUwHi1d6jnFOcQ5vZZKelLyoJgf4bRUkPEYF8fu6p0n4li5eSEpk7qg5/k5iXjtuDwv6AvOBK9dVI1hSrJhzRp6t79ig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8WluFzkWDxCoTfL1v0NM4BH0gXcwxgCoZDwliN1Q+WY=;
 b=e0HAmgw/4fs4Zjo8tPde6+X950qEzBXKcVkVu9VWBP5Zm2Slv4I/EyPnazfLVsalX42LapjSpTsxmSk8BYj1nirzYY+1OgxsPx3CendDk4InKLc0t8cgkdoy0QbMTdO4EwXkhh91NNGJQx2Dc6NNHPVJfhyPdRSoMMHhouu0J+EvvpmE72ptTYcpI8Wvus4CfbrshCt+g5HmiZBimb7H8q0Gat2Svdj4QxXalXA9CDT5NBuDGmeBQWd8Qr7zHEKcqTYLXlnQILao2w/OLD2Zi+fRwx2ro4V/U8CdAhzeslqF6FXRWSuVyGTmkmItJSFA4PBu2o3p3teBqLjySlbZDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=wdc.com; dmarc=pass action=none header.from=wdc.com; dkim=pass
 header.d=wdc.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=sharedspace.onmicrosoft.com; s=selector2-sharedspace-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8WluFzkWDxCoTfL1v0NM4BH0gXcwxgCoZDwliN1Q+WY=;
 b=N7SZQLc4zTN1LF+ZVQ3ouSD1Eb4mnMnaz/WsSwDLXVW6noUPms7VE6GCkkL2WR8EDHWAc37Nsm6eUlnUI4kA/dJDdsgkeOLBGjkP7sz6f9/KPNu00GHb2F+iYh35Lw7fXZqC26KS5pExdyN1faxzY5VeQF6AYhSblIhRUDT1BNE=
Received: from BL0PR04MB6514.namprd04.prod.outlook.com (2603:10b6:208:1ca::23)
 by MN2PR04MB6479.namprd04.prod.outlook.com (2603:10b6:208:1a2::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3499.28; Mon, 16 Nov
 2020 07:18:25 +0000
Received: from BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85]) by BL0PR04MB6514.namprd04.prod.outlook.com
 ([fe80::4c3e:2b29:1dc5:1a85%7]) with mapi id 15.20.3499.034; Mon, 16 Nov 2020
 07:18:25 +0000
From:   Damien Le Moal <Damien.LeMoal@wdc.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
        Michael Turquette <mturquette@baylibre.com>
CC:     Sean Anderson <seanga2@gmail.com>
Subject: Re: [PATCH 08/32] riscv: Fix kernel time_init()
Thread-Topic: [PATCH 08/32] riscv: Fix kernel time_init()
Thread-Index: AQHWtN4Q9ZnQv+4b30qO975eAugUlw==
Date:   Mon, 16 Nov 2020 07:18:25 +0000
Message-ID: <BL0PR04MB6514F15F451D70E01A87554AE7E30@BL0PR04MB6514.namprd04.prod.outlook.com>
References: <20201107081420.60325-1-damien.lemoal@wdc.com>
 <20201107081420.60325-9-damien.lemoal@wdc.com>
 <160525270249.60232.12874105352298232293@swboyd.mtv.corp.google.com>
 <BL0PR04MB6514621FDC804DAD854AFA06E7E60@BL0PR04MB6514.namprd04.prod.outlook.com>
 <160525398691.60232.17463845218341195554@swboyd.mtv.corp.google.com>
 <BL0PR04MB65144DA979067F3760D26B01E7E60@BL0PR04MB6514.namprd04.prod.outlook.com>
 <160525508016.60232.12394737512819290718@swboyd.mtv.corp.google.com>
 <BL0PR04MB65142F688DB54141C46D1D92E7E60@BL0PR04MB6514.namprd04.prod.outlook.com>
 <160551041285.60232.8430654706414782453@swboyd.mtv.corp.google.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=wdc.com;
x-originating-ip: [129.253.182.55]
x-ms-publictraffictype: Email
x-ms-office365-filtering-ht: Tenant
x-ms-office365-filtering-correlation-id: 0a0100a1-6373-47c0-5c37-08d889ffcef2
x-ms-traffictypediagnostic: MN2PR04MB6479:
x-microsoft-antispam-prvs: <MN2PR04MB64795F406598B0D8BD8B6FE1E7E30@MN2PR04MB6479.namprd04.prod.outlook.com>
wdcipoutbound: EOP-TRUE
x-ms-oob-tlc-oobclassifiers: OLM:7691;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: vqDJDAl1IQR/3wvm/DjvkwmGhSvnNnqEiVcGQJ+q6VHC3pZPDztOOHdr0C5DFMo9e7oOu9XwzgA8Qd0CjydcZNiwB/oOZO5AnVdo8m9FsNGDjxP/YrmQArQBwgM65RSp/jS9NEZd62SqBxSQ9IwAsQWSKEZsEYEMqR9Hul0TIt+zd//pbBJOcFlg1KV6yYnyemkE+LvXJ3yJA4NyykexOIxukLNaq2E+JYHuVW6osYdBeKYTpgJAnJvTsu1Jxc3mDGHt0fM574rYmjIATV7N9JjNOwsbComTzEPKdp03TU502rztFnPVkReskGR6akuJqID+54SnqgGurSgTlXrONA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BL0PR04MB6514.namprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(366004)(39860400002)(396003)(346002)(136003)(4001150100001)(66946007)(186003)(76116006)(478600001)(86362001)(316002)(110136005)(66476007)(71200400001)(64756008)(66556008)(5660300002)(53546011)(6506007)(7696005)(66446008)(9686003)(8936002)(2906002)(55016002)(33656002)(4326008)(52536014)(8676002)(83380400001)(91956017)(26005);DIR:OUT;SFP:1102;
x-ms-exchange-antispam-messagedata: eAU7XfnVDGp/fSTMg11+wDWaajWBBDfw+HqIHrQ/5jFZ3/wKjCvpvb4UaQGlPk7i8CoKzrA4RSdL2uDbbPlz5owXxl/uXK4vLX9w8ChRN6VBATh+pxM+Zhma7MOnKOZHFxRhw+PvzuAEaSOZYMjU3S1Mt32OWj1q1WZatClFKLl1oHSBWTqkxioH0PPVRKe9oPDuVC/9OR5UNfbpRgULwMMkHXI5jCz0rXlS7Nxy3WcbFUeZexrZfT6Gefs4eZTt7CQZQSMlbQa5PT/EMIoubJP34RbXkAyzhQjYmBNHAY185vxNhs2xbUj/vyaUuDfPtBJPEHpM6NM8xf4COBLc4a88byZr1J0Tfq81HJ2IvGE5LxroFYaaK00y4S3kU+XgEctopS/ZQ4Ebg3W6lCxUJ5vFGAghcucITuFwMKeU8Q1MJEOXx8/zlKl5g3gCUDSfyqbVXJgOO4b+oJxtCcNPsKA8IYzmJpxpsWEti1v5K2i97KFGaQn0CN/CztRxn/drWjBpi1J45Tn/Jl4f1hqPrGPXBMRM1TV9RVx4npEYzzZ0E0kXG94BavuUDmUE5vtLeMzQLh2XSRGlALANXHdPk4yhxff5be0y/IQ3uDdlW8ItVET/H6ht9m7jVVi6L3O06ZTb+8dOXEe0w5c+bKmlEw==
x-ms-exchange-transport-forked: True
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: wdc.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BL0PR04MB6514.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0a0100a1-6373-47c0-5c37-08d889ffcef2
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Nov 2020 07:18:25.3097
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: b61c8803-16f3-4c35-9b17-6f65f441df86
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: vDRUp5MURG71dXKPWhxat5UiSCsj7/RBzuuoWSYzJ2HwJN9iIsc0J1oDaVRQEDKngbikUoyptdvQJ1BRnfTFTQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR04MB6479
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 2020/11/16 16:06, Stephen Boyd wrote:=0A=
> Quoting Damien Le Moal (2020-11-13 00:23:52)=0A=
>> On 2020/11/13 17:11, Stephen Boyd wrote:=0A=
>>>=0A=
>>> Also of_clk_init() is for the CLK_OF_DECLARE() users and if they can=0A=
>>> wait to platform bus population time then they could be converted to=0A=
>>> regular old platform device drivers. Maybe the problem is the clk drive=
r=0A=
>>> you're using is only using CLK_OF_DECLARE() and not registering a=0A=
>>> platform driver?=0A=
>>=0A=
>> Yep, correct, that is what I did. SO yes, indeed, if I where to use a re=
gular=0A=
>> platform_driver, then the of_clk_init() change would not be needed.=0A=
>>=0A=
>> For the clock driver, I followed the pattern used by most other drivers =
with the=0A=
>> majority I think using CLK_OF_DECLARE(). I did see some using the platfo=
rm=0A=
>> driver declaration though.=0A=
>>=0A=
>> I could spend time trying to figure out if I can get away without using=
=0A=
>> CLK_OF_DECLARE(), but since I think other riscv board clock driver are a=
rriving,=0A=
>> we may as well keep that of_clk_init() change, no ?=0A=
>>=0A=
> =0A=
> Sure keeping of_clk_init() in riscv architecture code is fine. It would=
=0A=
> be good to use a platform driver though and avoid the use of=0A=
> CLK_OF_DECLARE() so we don't burden ourselves with more code that=0A=
> registers clks early unnecessarily.=0A=
=0A=
OK. Please let me check if that works. It may not be possible to delay=0A=
initialization as the CLINT/sched clocksource depends on the clocks being r=
eady.=0A=
=0A=
=0A=
-- =0A=
Damien Le Moal=0A=
Western Digital Research=0A=
