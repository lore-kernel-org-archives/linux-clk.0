Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A003BC001DE
	for <linux-clk@archiver.kernel.org>; Fri, 28 Jul 2023 06:41:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230404AbjG1Glz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 28 Jul 2023 02:41:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56866 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229568AbjG1Gly (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 28 Jul 2023 02:41:54 -0400
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4A9B710DA;
        Thu, 27 Jul 2023 23:41:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TwMP++cpiCP+xaGKg/BPC/DgEThv5F2tcVS9FsX46cpZaBBIS87JSFdrNonIVJJ4VYDb4lhFq8AIKoGHZbqgCjVhkgDN4eyOUpH2G4nTVnPLLfen8fx/iWT0b9lE1+VJ2hPQuFG+96KgZMVGsWhTnQHueYU4ckMn/eUBlDObDHN8j8FuRZ2S2VJj4SkrHUOrjS7hlTiloyzsTekpR7z+lDNIGZrxMrTLfDGz26+fxm8sYr8jTl7rEuHQwDDugNtF/Rx14wBRSg1iPJjV79sH7P/OakAq0Ou5AAo9ARWK+b+UFvj3aABn9knc3uDN8w6wxBwexbPNgCHFnlPictkuQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0lAukVIcibo/j6fxXwHcWy6WJQT+F6hHOBl84nioMoc=;
 b=IKze2qbu8fZuCqeunq/rxPESSUMtMuaVuBHfUz8X+b8j9hLHA8JF1L6jlq/py/v+qSYUdGZOJ+aMX5snEc3Mgv6rjtoyDSWjv7mJqsN0OptVhxLCQLE8+qk/hAbv2EA/nXjKujzS39YragMEkv7+EGPckZzRFpWVOEhtnN38hEnISn+opvS/yCMT0jWwVjikOSPDV0hN3N/m0hv66OUdAHhkKekd6Tz64n8YotQVHLVpU1Qtod83yi0+5/2d6lchRHgpupTzd/SkVDXKfuTC3V7Bnga0QX7wDxxU4lTWaxU4PjLgBH3tjluWPLJgl2NAx0QaJ9PH0OQIr367voLyeA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0lAukVIcibo/j6fxXwHcWy6WJQT+F6hHOBl84nioMoc=;
 b=JnHUa0saA+ZW5Op5I/IwL2vFTJHsWL9+4Yz4dZ/U3W+vFOcM3A+HPuKMs0B4JZ62037AakBXzjaNYadKQFoKDsggclSRWivgp8b7pz8vdevInAwQ38YOcNcLBgdcPUfdKBljvO/mlmv8W3+V+hY0RQ3s7/MFuCIRdYBZVXJ09XQ=
Received: from BY5PR12MB4902.namprd12.prod.outlook.com (2603:10b6:a03:1dd::9)
 by SA0PR12MB4575.namprd12.prod.outlook.com (2603:10b6:806:73::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6631.29; Fri, 28 Jul
 2023 06:41:50 +0000
Received: from BY5PR12MB4902.namprd12.prod.outlook.com
 ([fe80::dc59:ac68:adf2:62ba]) by BY5PR12MB4902.namprd12.prod.outlook.com
 ([fe80::dc59:ac68:adf2:62ba%5]) with mapi id 15.20.6631.026; Fri, 28 Jul 2023
 06:41:50 +0000
From:   "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>
To:     Conor Dooley <conor@kernel.org>
CC:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "git (AMD-Xilinx)" <git@amd.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "Simek, Michal" <michal.simek@amd.com>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>
Subject: RE: [PATCH v3] dt-bindings: clock: versal: Convert the
 xlnx,zynqmp-clk.txt to yaml
Thread-Topic: [PATCH v3] dt-bindings: clock: versal: Convert the
 xlnx,zynqmp-clk.txt to yaml
Thread-Index: AQHZviCtrm1Q/7lELUKAAndj1qKuB6/JQnWAgACxNvCAAOwDAIAD4NoQ
Date:   Fri, 28 Jul 2023 06:41:50 +0000
Message-ID: <BY5PR12MB49023F377CB6A3A1D7C78B7D8106A@BY5PR12MB4902.namprd12.prod.outlook.com>
References: <20230724111843.18706-1-shubhrajyoti.datta@amd.com>
 <20230724-direness-syrup-14c0b50c8018@spud>
 <BY5PR12MB4902A95CD14D934BCF3B7C658103A@BY5PR12MB4902.namprd12.prod.outlook.com>
 <20230725-untaxed-footman-0c764cc9792f@spud>
In-Reply-To: <20230725-untaxed-footman-0c764cc9792f@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=caf92a21-3d03-4e9a-b7c1-7a8ab02ff51a;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-07-28T06:40:27Z;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR12MB4902:EE_|SA0PR12MB4575:EE_
x-ms-office365-filtering-correlation-id: e223a768-3990-40fa-6ebc-08db8f35b8e8
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: e4+X1/wy8PSx/vAr6E5H3Vs72tcxw/6tt8HAt3Zv3klvQGGzyHEQcQVafiQNCRBvSsf2SHhxKmyExhEirh5XpF/Fss4E77iZjFfXFfbQ1Eb9DQD/J9EEEi4NxLqW6ael3DCX2zyfkiGsudHRkVmInAKf4/U0iBEQXA4tYLsmEavaf4y2QiVUR7mELi4fo6d3njDlXqc16ET4EKrUQcDlf3OpzF77SmxiNzNb1lpxEa3A9KH4su+ZWeGR4E5EO75f1ln0QMqvbjEstmdV0vR08aPRbMcFglsWa77g/ZN+D8UhlTyn5OjcYxlWm7A3UwZHlhyjC4FOth86GVv9xwXk1Gm8YeNf3b7wbGDX7wJw73MUQAfkV7x9vJF8TRymg3SX+ro1d2Dvk8ibMKnMmSJJN7LHzP/VoZhpOiiA7N5dgT/v4ot6gRQrw/YV3Q53xtaVRjUBP8c5SlRGi87M5GnATDQ4edQ0tIr6AGnw2rokQpWsbfOwUnUOuQy/LzLnBszdO4zf+nYqdpydhZRbuyN99WAyClBpwe7r/P1DecEwJ5E2jRTnx7vJXKnPdxGhAQurJ8qEkGrkPg1f0kOAEvmgvhxyFgBE2WPKy+I1lRVnpoPW9k7L1oeRhUJJBS+GbxklKzgNsV/KGcxFLHcELIOYMg==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4902.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(39860400002)(346002)(376002)(396003)(136003)(366004)(451199021)(86362001)(41300700001)(2906002)(316002)(38070700005)(5660300002)(8936002)(8676002)(33656002)(55016003)(52536014)(9686003)(966005)(6506007)(53546011)(26005)(7696005)(478600001)(71200400001)(83380400001)(38100700002)(186003)(64756008)(4326008)(6916009)(66446008)(66476007)(66946007)(76116006)(122000001)(54906003)(66556008);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?xTJv6zN97AIHX+C/yVPxn0Utsz8ttDlVdGUIayqnyGTHzh6aEpO9ffgz2NXH?=
 =?us-ascii?Q?z3m5q6vso8rwb1qdRjJ539pWwO0z+5RLa/xSDzqWvWwF0u1EvfayKkRafoNj?=
 =?us-ascii?Q?3a8XEtR3ChTE4lMYGODXY27jBJjIDeLgfSMWcgeNd1acG7QIci+3VGihlt5G?=
 =?us-ascii?Q?SY9JzwqsinPP4AR/yejs/RHScxLCT0jK5Ftos1OtFrgP0CxHuAi/F0Vhdket?=
 =?us-ascii?Q?WaQHubTOTuAD7PGYbNeLtmq0V7CxqE8urO6ui4v/j4t587lMfhlaX7o6Hh42?=
 =?us-ascii?Q?y/Sh3WcIpSclueduQ+X6JuajxGpJV1Dy85rsGSy28pM3e3t5DgTSr7h/sMBB?=
 =?us-ascii?Q?xZMVJ+hUs2cORvPAHnkksS3WrJLRKVHhFxuK1nFCCmD1raWRH6yO/laNJ/2E?=
 =?us-ascii?Q?9IIBlI5y0zt7q+lYSoR84IEwwR8R6YM/JiPcjtVUXTxgdhi3t+1R0+hymzeG?=
 =?us-ascii?Q?tH7rlr0ek80n5sAJpV+6et+n8coUPwzipt6wMBq4Ly/9+1lOGXoDADcHpjXL?=
 =?us-ascii?Q?ZpPDwOvy7nmn4tu7N2iZamHyg58ccCcSydVpN26iTZM7QqThF3nl6z0+Y4Oi?=
 =?us-ascii?Q?+gtIC0uWDftcl3biVr3k30ng/tvFhTTr9D4uDjpbVkazqZrBEhwEGKTpyWCw?=
 =?us-ascii?Q?KNoZSEML3gcZOseFyhyusvIJLMMHai41dtKtOp7t44Q2RyuXDfeKZErDDB8X?=
 =?us-ascii?Q?rDMZBgjbrICnGddYft1cw6DryCY5rrcGpxUclzcFOzSvktbQoDTVHrhALBgI?=
 =?us-ascii?Q?b9P3046IbUq/rwZ20D+GU8UpJY2LwZg+tRFXx9BOpYeoQuluk/BdjN1r+2PV?=
 =?us-ascii?Q?CpxwSlj3T06S89v39wsH0QgIkvL/GrmNCsXEQH6K0zBxMLIYJSEwLFUIuZmB?=
 =?us-ascii?Q?GNXUB1doBvya73va+NdbTNZe/kqaqKkDgDdTccGjEJxZ843z2Rc6uPiomeSD?=
 =?us-ascii?Q?Ok1Lnm2Z+sh2t2/mmpPC4OAr4UasE+a3T54zXcmD1iv+e3X2f375x9zIC+zm?=
 =?us-ascii?Q?T6wBhGCLtdSQvVV42sBZQuCx/815Ac3VkhDqZbe6/+AwQIvMdA8uAJoPmS6q?=
 =?us-ascii?Q?Dual22gMzYHyhaXjbx/xbnkGT1wjTb8TAFHNYj55lkcWwA7jRI8vS081Exsc?=
 =?us-ascii?Q?V2v/ztI9pRquZfEav6FHYzfik1VLu53yTOx5NSIwhOX7kbibciXuwiK2ImjU?=
 =?us-ascii?Q?C9kehxDgcJEkQCd+31Wq9z2E42HdE0J9+fMCVhawYn4HgZgxJ43L3lIuh1HB?=
 =?us-ascii?Q?+Z/MVTiWKEHigWLtMblfGM75zY6S66F80VG+PNJ0U/O4POXZjnGOErIMOnHZ?=
 =?us-ascii?Q?WN6f5iMfaUp7EtmhJUF6sRUWD5C9K48xgAvz+L0DvXaPx2F397e/EqHlW6Ro?=
 =?us-ascii?Q?PihRU75FJYUdxOcj70nTvWWwTxCLQhu4OO6iFnPUws05sqarI22MhZXGz9Py?=
 =?us-ascii?Q?YBo/jrad+sw2X+BEG8td7kGmQiH7yNtJMYeHSrrJOi/9F4wrxCjFBevcx86/?=
 =?us-ascii?Q?i6w33nwzlItIpf8DUT+8mkwyD7JQ1Mzjk6gE0r7lzAS8ZI9LW7tQeQgruoop?=
 =?us-ascii?Q?oT6P77pWyR8rX0s2nn4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4902.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e223a768-3990-40fa-6ebc-08db8f35b8e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 28 Jul 2023 06:41:50.1250
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OUlUzTj210e8pMsml3+lwXJn9ebtzZEKsCiW+F1T0XoeP0a5YwNh2YAJf+jAAPx5zsBXEdMEhlivEeNtxgionQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4575
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

[AMD Official Use Only - General]

> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: Wednesday, July 26, 2023 12:57 AM
> To: Datta, Shubhrajyoti <shubhrajyoti.datta@amd.com>
> Cc: devicetree@vger.kernel.org; git (AMD-Xilinx) <git@amd.com>; linux-
> clk@vger.kernel.org; Simek, Michal <michal.simek@amd.com>;
> conor+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
> robh+dt@kernel.org; sboyd@kernel.org; mturquette@baylibre.com
> Subject: Re: [PATCH v3] dt-bindings: clock: versal: Convert the xlnx,zynq=
mp-
> clk.txt to yaml
>
> On Tue, Jul 25, 2023 at 05:28:07AM +0000, Datta, Shubhrajyoti wrote:
> > [AMD Official Use Only - General]
> >

<snip>
> > > >    clocks:
> > > >      description: List of clock specifiers which are external input
> > > >        clocks to the given clock controller.
> > > > -    items:
> > > > -      - description: reference clock
> > > > -      - description: alternate reference clock
> > > > -      - description: alternate reference clock for programmable lo=
gic
> > > > +    minItems: 3
> > > > +    maxItems: 7
> > >
> > > This doesn't seem right to me. The original binding requires 5 clock
> > > inputs, but this will relax it such that only three are needed, no?
> > > You'll need to set constraints on a per compatible basis.
> > >
> > Does below look good.
>
> I don't think that you tested it with < 5 clocks (hint, if you remove one=
 of the
> clocks from your example below, dt_binding_check should fail).
> All the constraints need to move into the `if` bits AFAIU.


https://lore.kernel.org/all/20230720113110.25047-1-shubhrajyoti.datta@amd.c=
om/
Here I had it in the if .
Then what I understood from below is that

https://lore.kernel.org/all/745fccb0-e49d-7da7-9556-eb28aee4a32b@linaro.org=
/
it should be dropped from the if and added to the above.

Maybe I am missing something.

>
> Thanks,
> Conor.
