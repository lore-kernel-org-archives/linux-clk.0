Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9F55FC12002
	for <linux-clk@archiver.kernel.org>; Mon, 19 Jul 2021 06:25:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7856B61182
	for <linux-clk@archiver.kernel.org>; Mon, 19 Jul 2021 06:25:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234314AbhGSG2X (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 19 Jul 2021 02:28:23 -0400
Received: from mail-db8eur05on2065.outbound.protection.outlook.com ([40.107.20.65]:45248
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S233714AbhGSG2X (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 19 Jul 2021 02:28:23 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LXJfQ7Nk1TgE3xK4dlns69RoYmT0C+GhrVYOkYGXyWj5TgCARpevctp8apD8cIsV2cMQxiO8p9frJHotO6V51MY6L0bLnTWBSALiIxqvqSUBK5Wm0hT+QQ1+J5S3yvF49k30oXS87QC+IBN+lNIVut84W2hKkPAeqmmuFjaV6F0LhqPkFU2ypZ0dVPC7nh5UtykH1ZtKrcBhJ4yhRMUqg9Y05qhr1G5pRMrEBWRNFGMf5e9kjGaeePMQysrPF6+wkSELWlknP6kVTQZn9gVC6S8/oeOkju7RXRZAHuqqs1C/VoTPmu+Tdacu12EEMjHE/wEcd+68wyZjIrF2BgmyxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=stXOQneMLYdd4UhGaUwgrFQe6wJCrRqVgki0mIZ57ZA=;
 b=SH6/ZCtRJzOBghVUBNprAXsFZrEg68vj9Mq0b+qpnrebTsGjTGthF7U9yFKJdtS7ZAykasTGJmbT/uWAVfwsYVPva13ROVhOEuDR/PevPPAXoBv/Zzj70fy15CF/GHmmA9hoEA6H/quGnTf6+AoEGZ24KOQXY9aqHbvoqYhlbE6NRYg8rJaYFOzKFxoEJPXfoMzpkrEz772Bk2zX/n1+l+nXNFsK/NasMRtsfnWs7ERKnZH2TuxYXgrA5XCydqugKg7q9zPaRCZ9il8xiGMQldBrj0lGYLt4odUjRvNxhWnmPnw7u9+jl/2vn6DCyOTzfEe6Hjbu2CD/od7KBxuEmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nxp.com; dmarc=pass action=none header.from=nxp.com; dkim=pass
 header.d=nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nxp.com; s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=stXOQneMLYdd4UhGaUwgrFQe6wJCrRqVgki0mIZ57ZA=;
 b=DI34Y2S1SrdQK36l0RI8vPy3AfQUpdB698yHFjIkmuJzaUT9oMHJhxucvdgU+8nZrQ5mlRJT9LFDCVgPePPSALNgOnPB2Ddmve8BlHMuV3Pj7wcmYxUDXD8G7E3pf9zf08FKkSad/bRyGKUwAiyYRgRwVRkcDvXHf1A3A+i+X+Q=
Authentication-Results: nxp.com; dkim=none (message not signed)
 header.d=none;nxp.com; dmarc=none action=none header.from=nxp.com;
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com (2603:10a6:20b:113::22)
 by AM6PR04MB6183.eurprd04.prod.outlook.com (2603:10a6:20b:bc::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.28; Mon, 19 Jul
 2021 06:25:22 +0000
Received: from AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::8c66:a7b4:1dc7:2c27]) by AM7PR04MB7046.eurprd04.prod.outlook.com
 ([fe80::8c66:a7b4:1dc7:2c27%7]) with mapi id 15.20.4331.032; Mon, 19 Jul 2021
 06:25:22 +0000
Message-ID: <edb372d81caad1c0d3ae6cee0fdd902edc801ae8.camel@nxp.com>
Subject: Re: [PATCH 9/9] clk: imx: Add the pcc reset controller support on
 imx8ulp
From:   Liu Ying <victor.liu@nxp.com>
To:     Jacky Bai <ping.bai@nxp.com>, shawnguo@kernel.org,
        robh+dt@kernel.org, sboyd@kernel.org, abel.vesa@nxp.com,
        s.hauer@pengutronix.de, p.zabel@pengutronix.de
Cc:     kernel@pengutronix.de, linux-imx@nxp.com,
        linux-clk@vger.kernel.org, devicetree@vger.kernel.org
Date:   Mon, 19 Jul 2021 14:23:18 +0800
In-Reply-To: <20210719053430.1442505-10-ping.bai@nxp.com>
References: <20210719053430.1442505-1-ping.bai@nxp.com>
         <20210719053430.1442505-10-ping.bai@nxp.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.36.4-0ubuntu1 
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR01CA0137.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::17) To AM7PR04MB7046.eurprd04.prod.outlook.com
 (2603:10a6:20b:113::22)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from blueberry (119.31.174.66) by SG2PR01CA0137.apcprd01.prod.exchangelabs.com (2603:1096:4:8f::17) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4331.22 via Frontend Transport; Mon, 19 Jul 2021 06:25:18 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: dadd3473-b31d-41e4-ad54-08d94a7dfcac
X-MS-TrafficTypeDiagnostic: AM6PR04MB6183:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <AM6PR04MB61835432E9346CAD59CB110F98E19@AM6PR04MB6183.eurprd04.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:6430;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0/EvrZmB44jLBIK/P6oZauRUpWF0sAfRjvKqrgl2k/7c1QZPZ16ajWINidxwblPsygsce2Y9yNFl82E5S/HPkzl9LEwsvaDu1wDhJo7dHHpQI0DEc+ivHtpSirOCq1Jx3yeiBl0AuQDtPfnd/8td+qoUx1sFRrEL7vNIyC804ZEO+K8ifH1TZKkmJIqIBf+RdrnhpjuAAPs2WpaC6Fqrq/0xaNcHd49OHXweHi1XIWg/Dtrj+Ef39p0WNjsX89sz39o3XVWy+iKk2KERRZj1aoKos61UjnmKvlSbKLxCvWFuHDqlsCckRFQj+Vf2TzUZsetnJnqpI9ETRU+wgRF/rn71dt1Sb7Bi+H16tz4bEyLvGG6a7jIR/Lx2eXGHiDYYjQobq5JkX6NgjlF8r2ohdAFm9S7eg3O6opWMs5Tc+S4ZfGofG5ynHRLduIp/e6kP70C5+kCTS7o7cWPnDAj8eyEzsPwLN78lxulze+7HE47sfpCqND37IQIhqJecVKt+ePqfu44RZSZMGBtn3KnRQTu0O1q2KGIzxuJ50rxlK4/+a9q2ENB4uzSAlPViP1WEs9k8Gq8FkL7WxYyKWdNo8CUdMfWacMo1VTMEyXJTtjKePsJiXBxeXsVp41MOulK2tMsLAJPJWiA4ZpRLETatMnR8i87m3KosQNoOCECh+7Z3dK0gP2wHh7cWx6j7jy/r48T8vFGUGuy6YzUo3Fbgjd4H4RwMKAn9C81kNNP+Uwk=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:AM7PR04MB7046.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(376002)(346002)(39860400002)(396003)(136003)(366004)(66946007)(478600001)(2906002)(66556008)(66476007)(38100700002)(36756003)(83380400001)(8936002)(38350700002)(6486002)(4744005)(8676002)(52116002)(2616005)(26005)(4326008)(5660300002)(316002)(186003)(956004)(86362001)(6496006)(32563001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MmRCd1Q0d3pycXRXY1pHVGhiK3pJakhBUDlSTVJzMEt1NFZ2TmdWNkpFY1J4?=
 =?utf-8?B?NjgzOURGWlpNTEVRREc1YnFMR05Mc08veENMOHpDa3RmY2xMK0lML0xqbDRM?=
 =?utf-8?B?M2NWWERlMDhMRmkvK051WHFyZlcyTlRlQkd3Wjk4bVA2dnFiUG9wMTIrYkNU?=
 =?utf-8?B?NXJGcHlqaWVZYmsvSllaWURsb3lUVHJuL2RRSGNmb2FCZjUxKzQvYU95QWtt?=
 =?utf-8?B?NDJjeHArV1ovbHo4ZnUrS21JampTSytHK0s5VjgvL3VxYnMvMi8zQXlmSGkr?=
 =?utf-8?B?QStJSWl5amhxUFlXUGE5bXltTDlnRytLSDZ3amxWeXRQcWVRQ2pXaFFKeWd6?=
 =?utf-8?B?ZnhBeW5XWFloaUlGM2JJbzVWQlRwT3AwQndkRnFSMmxHWU9sMXlMUWpuUXUz?=
 =?utf-8?B?U0NiWnhZYTJSUE5qa1FNcFkvaE1lY3o5K0gyVC91anlEMzNxWVhQc1Flai9k?=
 =?utf-8?B?Y0Z4MmJ6UjNIQWF2QUhRWmdINlBoNXNaSEdMYXhmOVpEaVk0K0taSXJWbFQr?=
 =?utf-8?B?WVIyOEF6QTVuSXc3aUpFTFNXQWszdDlublV5cHVDejRYZE5yOEhyWFFZV1dD?=
 =?utf-8?B?NjBMZTVEL0pReFJsZTNIdmRKWnNna25ack9qTjc3VUVYWjJuNDg0NllYWjJC?=
 =?utf-8?B?bms0cVYxYkk1R3FXTjlvWUJTdjlob21qU1JXU0lUVjU2RHVwOStJTlRnKzZy?=
 =?utf-8?B?NGIxTWt1MmhmK3U5NFJjQS9MK09LV04vNzJaMDVtS2lXK3FwRzlvenllWEV5?=
 =?utf-8?B?MERpR0k0OG5LNEhyOFhPMitvQWRRQzhMUkR1UW0vbDhiVzJadUcxMnpncHNT?=
 =?utf-8?B?M1h6a2Z0SDRZZi95eVh6QVVadWFvaXhnbGszK3ViRDVYLzEyb09hblE3dHp2?=
 =?utf-8?B?RWN3eVoyUVlNSVJiaytpK3B4NWJHYUR0QVM2SHkvekt1eG9USVkwUnBLRHg4?=
 =?utf-8?B?aUN6UFhxMU96a2ZEaHY5UG9QZ0VIMHluY09CdmhER3lneVEwTlh2OG42dXVR?=
 =?utf-8?B?MUFjV29VZ21TS0lRNTRpMmw4TDFudEdHQUxkOTdsRmdWWSt2SzM5YUZZN0pS?=
 =?utf-8?B?azdHVVlzOGtNMGtielNOTVpFS2U0YmsrNEdDaUxlV21EdldOSUxpRWEzbktD?=
 =?utf-8?B?WUh3dVcvVURuZEtGZno3ak9rdmRTb0V0emNnY0o3VTh6MHl6SUMwY3BmSVFI?=
 =?utf-8?B?c3JpMzcwN0E1T3JtSHo2Zk82OG4zb3RCL0VITW5SeGh4K2lwaVpEYXQ1NHJ4?=
 =?utf-8?B?ekpjSUtkL2ZWbjY2N1R5UDZZNzFueVRhR3kyNThWc2Z2UU02c1A1U1lVMDk1?=
 =?utf-8?B?Zi9RNVFmZWNWa2xyWWtRZndjSWhTallBRkpMKzhjeGRBbTVSWXZlQVM3Q25C?=
 =?utf-8?B?b291VDVMRklFWFFQWjR5TndwaWFGNUozWW9yRUhuaFlMQzQxbm1kU25JSTRm?=
 =?utf-8?B?RFRxZXVzNzZvakNnaDB0eFIvUUVobEJERndBRkY0Z0o3V1dkT2YwaFZTOXh1?=
 =?utf-8?B?QjNzV2gwd0xxZit6WldXTGhxaUVMOTA2eC90WjU1Nk9iQVdzL0NwUFg3eUZT?=
 =?utf-8?B?K29nbGhmMzZUSVZpRHpnc2dxNVk3T0N4dlRkOHROdGI1WjBlbjRMTG5qR2V2?=
 =?utf-8?B?NGFwM3NBVlNFaVdUTC9nZHdOaVhuQ1puOGVGVUE4Y0hvTGs4cGZLQzJJclla?=
 =?utf-8?B?ZUlPUEdONmJrV05USlBhUmhZd1ZqQXJwTHNkalFIQklLbHFFL25kVGhMWWFw?=
 =?utf-8?Q?dcGPlPEf5bo03A+5R+HKVlxroO8ZNFGPF/qmu47?=
X-OriginatorOrg: nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dadd3473-b31d-41e4-ad54-08d94a7dfcac
X-MS-Exchange-CrossTenant-AuthSource: AM7PR04MB7046.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jul 2021 06:25:22.1163
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eWNj2gXrTkSdrvOpkDaxTRolpHIP74l01FJAEm9UxiF3A8jC3P5wQBTa8gVkQstDECbfkeaamN5XIcNGZ905HA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM6PR04MB6183
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Mon, 2021-07-19 at 13:34 +0800, Jacky Bai wrote:
> On i.MX8ULP, for some of the PCCs, it has a peripheral SW RST bit
> resides in the same registers as the clock controller. So add this
> SW RST controller support alongs with the pcc clock initialization.
> 
> the reset and clock shared the same register, to avoid  accessing
> the same register by reset control and clock control concurrently,
> locking is necessary, so reuse the imx_ccm_lock spinlock to simplify
> the code.
> 
> Signed-off-by: Jacky Bai <ping.bai@nxp.com>

For the general idea of adding a reset controller in the clock driver,
you may add my 'Suggested-by: Liu Ying <victor.liu@nxp.com>', just like
the patch in our internal tree does.

Regards,
Liu Ying

