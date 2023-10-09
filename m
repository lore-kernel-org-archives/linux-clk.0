Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4842EE95A8E
	for <linux-clk@archiver.kernel.org>; Mon,  9 Oct 2023 11:16:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346139AbjJILQd (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 9 Oct 2023 07:16:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1345822AbjJILQd (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 9 Oct 2023 07:16:33 -0400
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (mail-dm3nam02on2053.outbound.protection.outlook.com [40.107.95.53])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C096094;
        Mon,  9 Oct 2023 04:16:31 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ODtsMtDsclp6Lrx0LfDmNLs2KQ0FePpDSnYzDqeqoqKw56jRuCRAxd2tuSnn3xx7eKtrLP8L+WdyUQLo48uQIdkikbIckWDatNtUynx4FyPTB/AXs+HLeEH/JDm02e6RRP/1DYw9jd0Tgh3EyLRd+CaDgL+Wt62WM3AUfkm90FDm4ggrWnmVeadXQoyzwFf9crqGEGFr8AsCuOntfFcZe2dwd6BBEt3JDn37p48bDi57pAenoNb/GofoJpld7odkNETqSFqJxpbEhebfw5G2aune06NpMxucdwWcy4HF9ruf02Lje3TUAzHQk4l3z5XkDMY1CPFUbUJ64E+pErENsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4S+HLepHY1eTWlcjoJiWQukx4eDhdHfn4YqgSAThAb0=;
 b=QSBEw8zqC3N/bg3m66wRLC+1ND0dEds1SMkcgY/hKoqgJ8aa/p66UYhqEuSROH6/7SyPDTmUwvfXQpFDzT8e4dvdBVuoy+eHPMXAAI4pN4E/vTZqqgLIfbMeH2IlBVzBtVNPahBheW9i87ZVEYIw192e94jKgFHsfE+59VqpVQzPAZoMxvIAVxsBJeJuolYEg0NqlNjWoUnGKwEs+mFlZHU4jylIusS+k1rKYQ+PAWXABk5BVkRIqSstmTu8yj2VyzDS1PM38L4ce8r1FUJsRtLYvM9FWgU08g02KQAJ3LnzQGqEeLmpQcYPMK3BCr3wo7uBPHOelY/v/izjUnsHrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4S+HLepHY1eTWlcjoJiWQukx4eDhdHfn4YqgSAThAb0=;
 b=OJo0L7PE8uAPJnSHGjNIOqMPlsxpwFB79ISvOoxoNvpvg7dEqzAeXnB/izSuoqKXGBdLjmR1X8QZSn3oN3dn9PeNX1qbqSgyGCr2kbkje/uANw9G7aSgIg9sN2MJ62qRKrCwg5WjEq39RrByM/VgUa0Re9f2Q4+A0HXUOmT9NFo=
Received: from BY5PR12MB4902.namprd12.prod.outlook.com (2603:10b6:a03:1dd::9)
 by CH2PR12MB4152.namprd12.prod.outlook.com (2603:10b6:610:a7::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6863.38; Mon, 9 Oct
 2023 11:16:27 +0000
Received: from BY5PR12MB4902.namprd12.prod.outlook.com
 ([fe80::48af:8d18:40f3:a43a]) by BY5PR12MB4902.namprd12.prod.outlook.com
 ([fe80::48af:8d18:40f3:a43a%7]) with mapi id 15.20.6863.032; Mon, 9 Oct 2023
 11:16:27 +0000
From:   "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>
To:     "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC:     "git (AMD-Xilinx)" <git@amd.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "krzysztof.kozlowski@linaro.org" <krzysztof.kozlowski@linaro.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "Simek, Michal" <michal.simek@amd.com>
Subject: RE: [PATCH v7 0/2] clocking-wizard: Added support for versal clocking
 wizard
Thread-Topic: [PATCH v7 0/2] clocking-wizard: Added support for versal
 clocking wizard
Thread-Index: AQHZ+oCoV9BW+87LuU61EwHve8YQA7BBTofg
Date:   Mon, 9 Oct 2023 11:16:27 +0000
Message-ID: <BY5PR12MB4902DA4C260D69C8B1DFA53E81CEA@BY5PR12MB4902.namprd12.prod.outlook.com>
References: <20231009071712.26469-1-shubhrajyoti.datta@amd.com>
In-Reply-To: <20231009071712.26469-1-shubhrajyoti.datta@amd.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=57e9d60b-6631-4aa1-9cc5-16851aee068a;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-10-09T11:14:27Z;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR12MB4902:EE_|CH2PR12MB4152:EE_
x-ms-office365-filtering-correlation-id: 09084f66-423c-415b-7a72-08dbc8b92e74
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: NUjmjPKJYMhXLRQuok7fAoLKmKx1saNRp95PfTp1e+Vb1gHzsJo/TcnS0J/mdKdflvYALyK81pkYeROJfbJ6iKTQpOu+m9VbaX69aNg1RczCfk/O43dSganYtscM2B3FMibzwL3VMKHhrzRDMrXXGi66NsfL5+7TKIAvzK0r5O+0J7PQUoKVcIlPKrbRo4tKALm6BaACxME8MHXsnjEPE9T+Lg0zzxzpSdGT1KCGHDXkp2GyKkX2EWTTARQZouyrEpnO013yBoOIt+wAFc0NFugtI80cAc37RtMASQmAx4G4W8q5ButrS240zZ6KBPiwsavomtSAkeocDoW3HSfmR1HVYTBvf6HOusOi8CDDSvv/Eto01Oe81CV+2urPOA27XhdQnCEL8dDOB2FcWINw3oL01w0ryyRiDSraHulHVAvneOQc/8s8Ep1kn2a0gSAPsLBPGf5qVulsbiMoyfX0I4nIEE4BKrPeW1PUNYzq5KbkhlRNsRgmnkv9umCqhrLLN8dDNGhj6ZHFD92ROKIA7ZgyeOCxRWg1AIaebJB+PORc0BplTWg16mcQtSO5eJSAAY+JN83IRRpVfjB0EcJXo6s1VWh4m7Ugy5B8hnJsACc=
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4902.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(346002)(136003)(396003)(39860400002)(376002)(230922051799003)(1800799009)(451199024)(186009)(64100799003)(2906002)(7696005)(6506007)(9686003)(53546011)(122000001)(33656002)(86362001)(38100700002)(38070700005)(26005)(55016003)(83380400001)(5660300002)(8676002)(4326008)(8936002)(52536014)(966005)(478600001)(316002)(41300700001)(110136005)(66556008)(66476007)(66946007)(66446008)(54906003)(64756008)(76116006)(71200400001)(4744005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?OAVQ7tEJVyBs11Of12CeHqVeI+g0QPTRmCw4wDcZWHrUWzAp8nNJ5htmpuo3?=
 =?us-ascii?Q?hVOwvQpkDA7anV7EZUg1bX3tTxxc4/MHWn2KEVTy7Y1nuLcshg/TnF1LmLd7?=
 =?us-ascii?Q?RNB+pFoqU90uZmsULIn6Lf7dTqUiwpVnkYLLdY7VS4QxFypwxGWec0zg64M7?=
 =?us-ascii?Q?HLLUF8iyg3zJxxR9lAOEoK+TEcg7pi7e+/0PjorOWAjfnh12rtYSGbiJEqaM?=
 =?us-ascii?Q?72rH0FELADNb4SCnDRQE6GIt57rliHqDBOJJbOlwIQe0Y3wCW2UAnuPMioGK?=
 =?us-ascii?Q?rR6xbS0rurdhf6TcuLJ0QhG2fxbNzRm7K86MMI2ji4qIf6gbr0/TgJnkzV+x?=
 =?us-ascii?Q?J/gZuNTSz4sjh15WX0ALTSozvYD3eLbNWexK8HpeLEPA9V9xIa/wIgBHKwBr?=
 =?us-ascii?Q?MSwOXck1IjkQ67NzDpoQ7YRS2bzONmyc7sHifJMD+5Q/Niy6D6Ed+ttHV2NJ?=
 =?us-ascii?Q?kJPo8Qar/FMxApjUAIDN9W0YFYrbOEwcH+zpXv0ncPu0uv+CXCGAtdjDI9oD?=
 =?us-ascii?Q?VBJktEaqlscC6aTKn47DBRQGt49Vr2qZzm6fdsTl5vI6MQlnhJcI7yqHDPfy?=
 =?us-ascii?Q?cRSEmVR4eVa1j7xWc/5BY66hnTmTvIg61ucCW+sZDmw4PaJeOfhvKvRRy9Wa?=
 =?us-ascii?Q?iyMPjoYmHRcJGBiWSpCi/g+qV/9dX+1q7ih9sBeRrWYa9qEN4YEhIOlAKZM+?=
 =?us-ascii?Q?fbt7MBx1fV1HcD85QG8XoLj3ics7+7xFn5sRDFJcCbLnAdL+RCqK0uSWOo8M?=
 =?us-ascii?Q?MEdIjVUbLwkikT4NasWST6UyHGeokXboTiYaJ9Dgm4Eng6MCuuFs7jTplU1U?=
 =?us-ascii?Q?EaoWIy3gbnCkLCTcF8jGGGsjidMrjTbzzrIEZ4tGnz5gl/sg/knknbZb4Wo5?=
 =?us-ascii?Q?L8odUV5HCW4mZuZk7lS0EC09FR/O5WAx87CQDA8KTJfZ9eIc3jST/LQZpcta?=
 =?us-ascii?Q?VqZlhutBmn2F4P0YykAofzMxGnbq07WWyDaeO+W53TnkL0+dTcELA8RPcN3D?=
 =?us-ascii?Q?7qAs6UyBUWGd9zZzCrrSGeEaGUvQU5fSlcisSnfKo4oBUqVgFYYYyzPgzsVf?=
 =?us-ascii?Q?7qqiXvIEUUSE6DPg490bOZIQIXeNzAsHpPGvUfWzKwf6wheCTWjiWTAb0SN6?=
 =?us-ascii?Q?ZiocmjeEo5qJptxsJ5pwOLylqVZd46wV+DQxhfuWQtUx/mPlATL70tcQNz36?=
 =?us-ascii?Q?LzYl3VLJ/7cVjpuJv4vop8fX8dRPkdfGhge8e4haWBkerbLHy/wOTjaSgVah?=
 =?us-ascii?Q?Ub4XWNWZXmnhN3w1IqcrZO1SW37omQFbSnFLiCTmHx450oDi0IyseFI7PCrV?=
 =?us-ascii?Q?FJdCI20/1uWguiPsY5k5rS6sktFo7dEZ+l9xaALifz6PnTXBWqgzLrEVWckU?=
 =?us-ascii?Q?StUmWWQdGMXpgezDpygQeA7cRx0BqVZ1wCIoAv3EVBKdrpeRhbE59YDbmjZ1?=
 =?us-ascii?Q?4Vepdi0xx/ub4tZmvwS160QAmzCwLKxOTY3wboTF3QD/+ZkLbn1KYugKZm2M?=
 =?us-ascii?Q?K3vivh3VLMzzuy76TmL+Z7rk1xi4yu1wgZBFI0ykJmES8JeoWhVUS0Ek20WW?=
 =?us-ascii?Q?jMmZE9xsOg76sPieovA=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4902.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09084f66-423c-415b-7a72-08dbc8b92e74
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 Oct 2023 11:16:27.6577
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: S/RW7OI2Kvti12mmpkY9nLygIf2QFjzry7aQjWur9gr+MeHSxmaezH9w8puau5MKXAG6vu89sTedsRqKdFHUcw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4152
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

[AMD Official Use Only - General]

HI ,
> -----Original Message-----
> From: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> Sent: Monday, October 9, 2023 12:47 PM
> To: linux-clk@vger.kernel.org
> Cc: git (AMD-Xilinx) <git@amd.com>; devicetree@vger.kernel.org;
> sboyd@kernel.org; krzysztof.kozlowski@linaro.org;
> mturquette@baylibre.com; robh+dt@kernel.org; conor+dt@kernel.org;
> Simek, Michal <michal.simek@amd.com>
> Subject: [PATCH v7 0/2] clocking-wizard: Added support for versal clockin=
g
> wizard
>
>
> Add Versal clocking wizard IP driver support
>
> The Versal clocking wizard is clock circuits customized to cater to clock=
ing
> requirements. It provides configurable number of outputs.
>
> Datasheet link: https://docs.xilinx.com/r/en-US/pg321-clocking-wizard
>
>

This should have been v5 but accidentally sent out series version reviewed =
on internal mailing list.


