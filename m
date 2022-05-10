Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 74A5DC388F3
	for <linux-clk@archiver.kernel.org>; Tue, 10 May 2022 13:24:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242885AbiEJN2L (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 10 May 2022 09:28:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243828AbiEJN1a (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 10 May 2022 09:27:30 -0400
Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2082.outbound.protection.outlook.com [40.107.20.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 817162BFBF7
        for <linux-clk@vger.kernel.org>; Tue, 10 May 2022 06:20:32 -0700 (PDT)
ARC-Seal: i=2; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=pass;
 b=HaaiP9j1tTcu53tFDxX7X5dlLrjv4bxFF5ZWmnH/5PJ9rSmBO4AlznQPqNvfJdLwCyGm71E/RpUneANQloexwWBtE1WRgptOCScqPwqWHL6EGjhSvVceLJIeF8tl5rJpIWhqH/XStfTYH2Pj/KqtX8wyOHSna9q+TT6ufgfjyNHv2++LfAbuX/Z36xofSC3seEnXVOFiHTLHz9mANZKIEY110/cfBaZYFBeEMuUWVB2U9DyHifDJSSEKPRVZLYV2GhdAX8FN5YhIHQ/7MGTnhQ/UoMqzZfmcuRyNNhjVspoeknqj0KbQkVEPdgxFMcH1bcO3c1BSDllyTZ8PdtduaQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=60dOKRYuayZNUzExXXnRQ/Thm2f6yuMv7DfMsWthOFk=;
 b=UInjECvozyuS8G+WbymtFvD1Cv10etVQtLlvhrjOF/FcUYq6wc6Ks9G3gkdFzb6CpsKitkmcbjVHmKbiZLoZn+7OD9VNbCHrvZwfYVF6xQPe2o4QaxENN0LdDbSHo56Au1ivMB2IjCm3PdWuYq8rDyTyTc5HDUaT/83rPb7s6IjYOu1N30tB7NFw76qwkJUv//YhYlKE8sziy1HoA0jKX7r7aUn7Weu9f1O0gxufE2nJdNvuCWjAl351gbOhWRZNxYhf9eO4JaG7G5No58QiTsOQzbJb2KH33l9OaxNF72LPgDaWiXaezXpVh0dHAlFVDQ3e53eLRNVgq928EDvdmw==
ARC-Authentication-Results: i=2; mx.microsoft.com 1; spf=pass (sender ip is
 63.35.35.123) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=arm.com;
 dmarc=pass (p=none sp=none pct=100) action=none header.from=arm.com;
 dkim=pass (signature was verified) header.d=armh.onmicrosoft.com; arc=pass (0
 oda=1 ltdi=1 spf=[1,1,smtp.mailfrom=arm.com] dkim=[1,1,header.d=arm.com]
 dmarc=[1,1,header.from=arm.com])
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=60dOKRYuayZNUzExXXnRQ/Thm2f6yuMv7DfMsWthOFk=;
 b=g9Iy+9MwLGMPLrG1wBIBv9rb6gqSDQB47pLzpPg9tcbtphY6T+3Un/ZGJV0pVx0mjyZs/CJS9QBdKrhKFJQlg7SjzT7obS9uwq5KuLalRzjSlZV+11nIIhEQLADRQVQ9SMrR23TmayU7rkvWR+Zc/7wSfz1QPZbH8m0uCQOEgBY=
Received: from DB8PR04CA0030.eurprd04.prod.outlook.com (2603:10a6:10:110::40)
 by AS8PR08MB7094.eurprd08.prod.outlook.com (2603:10a6:20b:401::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Tue, 10 May
 2022 13:20:28 +0000
Received: from DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
 (2603:10a6:10:110:cafe::1d) by DB8PR04CA0030.outlook.office365.com
 (2603:10a6:10:110::40) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.23 via Frontend
 Transport; Tue, 10 May 2022 13:20:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 63.35.35.123)
 smtp.mailfrom=arm.com; dkim=pass (signature was verified)
 header.d=armh.onmicrosoft.com;dmarc=pass action=none header.from=arm.com;
Received-SPF: Pass (protection.outlook.com: domain of arm.com designates
 63.35.35.123 as permitted sender) receiver=protection.outlook.com;
 client-ip=63.35.35.123; helo=64aa7808-outbound-1.mta.getcheckrecipient.com;
Received: from 64aa7808-outbound-1.mta.getcheckrecipient.com (63.35.35.123) by
 DBAEUR03FT014.mail.protection.outlook.com (100.127.143.22) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5227.15 via Frontend Transport; Tue, 10 May 2022 13:20:28 +0000
Received: ("Tessian outbound ab7864ef57f2:v118"); Tue, 10 May 2022 13:20:28 +0000
X-CR-MTA-TID: 64aa7808
Received: from 60ea09ec9e62.1
        by 64aa7808-outbound-1.mta.getcheckrecipient.com id C0FF7D67-A8F6-424C-BDC4-65FEB09AAA29.1;
        Tue, 10 May 2022 13:20:22 +0000
Received: from EUR04-VI1-obe.outbound.protection.outlook.com
    by 64aa7808-outbound-1.mta.getcheckrecipient.com with ESMTPS id 60ea09ec9e62.1
    (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384);
    Tue, 10 May 2022 13:20:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dIBVWRnojZn0Hc1tdRNSjLwFBIwFxzQyQZfzGaNHhY8X5+5kjDgwZCyx1p2g0BW5HzdF1QHa/iQ4XWg/VJOfobGYzWqBUY2A78RVFG8FHOnCf6QxOglm2QIEWAOjrpqr/dTbx14feurb840psiTiL0FqvkhdrqaHP14SmtjV8Fjbp3MAZ5vooa6CBdHnz4Dlc8ucu9v6po1O6E4rFEBIWk6aMPtmOM0lPfSVj3SIYbwm0gSqDw5XV2D+rA1qxFU+2MPkPOcc2o24tExGtysIRH8L3KFUug/mf5pOD5QLXOD+4cMcvBACOzB6Z3nE0w/ZS7KwQdRZ/90Fb19r8+GdWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=60dOKRYuayZNUzExXXnRQ/Thm2f6yuMv7DfMsWthOFk=;
 b=GB5AGMW17uOsCfTTeE1UX/ch5AgOrJpjJdON+d2wS8PJWwdlCDDJKKDhW/Kl+0xlkcbESs+auDzqMOSlorlgcU8T1cUxfAGM8jLD4YJY7hbTWCF0C1tVpg/IuBH8O72ctESYwFhcOM27ltJo1EudUWRO6WJOz1JoWUv3yEkvRnPdScNnLT6bQHqEhJc0tV1k0TTM0H7xY/d4CNpp78be9//SyRTIcwXt6EDL3VOyu3soCWol8fC6zj4LSJ5jdLA2IKOUVmxkLo/DRC3u+MzkmbVJfOsnvEN0M05bYGoPpqaTwzLhtbVOvGLPCRx3OMOmwex112bXsp+eLePu8Xhp1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=armh.onmicrosoft.com;
 s=selector2-armh-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=60dOKRYuayZNUzExXXnRQ/Thm2f6yuMv7DfMsWthOFk=;
 b=g9Iy+9MwLGMPLrG1wBIBv9rb6gqSDQB47pLzpPg9tcbtphY6T+3Un/ZGJV0pVx0mjyZs/CJS9QBdKrhKFJQlg7SjzT7obS9uwq5KuLalRzjSlZV+11nIIhEQLADRQVQ9SMrR23TmayU7rkvWR+Zc/7wSfz1QPZbH8m0uCQOEgBY=
Received: from VI1PR08MB2847.eurprd08.prod.outlook.com (2603:10a6:802:19::31)
 by DB7PR08MB3772.eurprd08.prod.outlook.com (2603:10a6:10:73::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5227.21; Tue, 10 May
 2022 13:20:18 +0000
Received: from VI1PR08MB2847.eurprd08.prod.outlook.com
 ([fe80::c519:4c0d:8824:4821]) by VI1PR08MB2847.eurprd08.prod.outlook.com
 ([fe80::c519:4c0d:8824:4821%3]) with mapi id 15.20.5206.028; Tue, 10 May 2022
 13:20:18 +0000
From:   Guillaume Gardet <Guillaume.Gardet@arm.com>
To:     "Ivan T. Ivanov" <iivanov@suse.de>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Nicolas Saenz Julienne <nsaenz@kernel.org>
CC:     Maxime Ripard <maxime@cerno.tech>,
        Dave Stevenson <dave.stevenson@raspberrypi.com>,
        "bcm-kernel-feedback-list@broadcom.com" 
        <bcm-kernel-feedback-list@broadcom.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "linux-rpi-kernel@lists.infradead.org" 
        <linux-rpi-kernel@lists.infradead.org>,
        "linux-arm-kernel@lists.infradead.org" 
        <linux-arm-kernel@lists.infradead.org>, nd <nd@arm.com>
Subject: RE: [PATCH v4 0/3] clk: bcm: rpi: Add support for three more clocks
Thread-Topic: [PATCH v4 0/3] clk: bcm: rpi: Add support for three more clocks
Thread-Index: AQHYWs2tZ+IusTTmbUuyraGSgCHidK0X9hJA
Date:   Tue, 10 May 2022 13:20:18 +0000
Message-ID: <VI1PR08MB2847DA5DC2665EBA2756D7EB83C99@VI1PR08MB2847.eurprd08.prod.outlook.com>
References: <20220428065743.94967-1-iivanov@suse.de>
In-Reply-To: <20220428065743.94967-1-iivanov@suse.de>
Accept-Language: en-GB, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-ts-tracking-id: 5DDBC4498858CC4D8644F165C8CEB44A.0
x-checkrecipientchecked: true
Authentication-Results-Original: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-MS-Office365-Filtering-Correlation-Id: 92e9b7f4-d6a0-49a8-c8b9-08da3287d9fc
x-ms-traffictypediagnostic: DB7PR08MB3772:EE_|DBAEUR03FT014:EE_|AS8PR08MB7094:EE_
X-Microsoft-Antispam-PRVS: <AS8PR08MB7094EEFDDE8C04478708792B83C99@AS8PR08MB7094.eurprd08.prod.outlook.com>
x-checkrecipientrouted: true
nodisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam-Untrusted: BCL:0;
X-Microsoft-Antispam-Message-Info-Original: T4ZAOb7qk1KNRnmWAMbL5FkNAVi5nCfqxfzky30V6uL1MpeLe/azCS++L40Nh9JAoC9Yc+ZvsRJcGwrpOstECQ7fb+WYp80vLHK75dMaHzF6x60JrQkinsy3fXh9JiyJ9A4r/pxb1lqRs/dQWZ0jIz4hBiNjee3RORf9+s1rZ5yv2yWOuWHnU/HPmi30MeEienzGc4rkqFA6JaO8GmEAKVp87Bh+pNbroo4GKC6VvcfTeXO0W/S2pCyzFCKjSoToDj27aER0JfcHIHw35yVqBF7p82A0RXGl9vcuGEki3Luc8PU+ZPzGVIVOv7Y8E0sEU7hX/P4XK0oiPJvxlywAQa/l+Z48yNnq11WY0j60X1SmUHyyAazekpedhJx/wf1jr+9y5J3GxymS/lsesFn0Z6bKaCH/hPOx3tIjN8r1PTRYJh9zVwrt9Te0GZRoI6HdjFCBeOk4RfGLGhNMsUWLTLp4q7Qw3WVMg1O4dJXFTGWVpUkwDatiiJGKsS9OV3/imBWrq1kx+xPrBpueJVn71MdiuJs4MAPzin5sjRtlfiho6bZ2u+qGBTB7nO2/XW9/sm/rohzm/QVJhTMGSHGob3YDscMsq/mgAz1r0GcYJpuAXqxdiSaOWt8gPnq3dvKBTW2TGm1eUGcCZCI01NWeWErvB+8pwd2t4MyT/s+Mtpog+JeLsNUmH/Xhp/u85sZNVFW+7Ru3A2y+bSWHkhHYUCPTcbRcUgs7n1zUbx7JZQ6x82Q8f1bqpAjVGvvh2R7AnRf3TIb8LRy9uPwt8KNkSr5uklL+53hWeHHwcOr1iR8=
X-Forefront-Antispam-Report-Untrusted: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:VI1PR08MB2847.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(7696005)(38070700005)(6506007)(71200400001)(53546011)(966005)(86362001)(508600001)(38100700002)(83380400001)(122000001)(186003)(9686003)(8936002)(55016003)(52536014)(33656002)(7416002)(5660300002)(110136005)(54906003)(316002)(2906002)(64756008)(66446008)(66476007)(66556008)(66946007)(76116006)(4326008)(8676002);DIR:OUT;SFP:1101;
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR08MB3772
Original-Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
X-EOPAttributedMessage: 0
X-MS-Exchange-Transport-CrossTenantHeadersStripped: DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id-Prvs: f94d62da-e6af-44a3-883e-08da3287d407
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hVNIqXbAIDQXJsVred2py91aOrSVDnnXirFAq81ShLrUNk8KQtn0pT05NO/81OTl6upVesqOaGFifmkdvDBGkaaBrjmGTNx5oiY4xqd5tnNPgsUSfs9bypBgEHxIpJHLEI2phXhVtZ3zRHSvQcx9GugpQ/ZQSj8jF5lA6Rj1nDjviNcFhKXO5oJLgSzZfxy9Btw3K93pc3xTRDVfHKj30zLVKgO4EzindJhWelUUs36gjo2lmccni/wTnD650bys1BhTElF3RF2tfX5jxSDkBoRtFQVmUkX1RHATyKXCtzFAtx7J/7OW0wO6KwoTVGQMDxQZaMk1ImbgwCK7J82jfodouZRPhOpmpOGoUcHl8nhVKZaIbobWDEc0Mog2MQon+fNb38H9snqNAgS3rnzbOc5JrYjtiG2FRFPdcUmUdvpOHba1iuW9wo/5MCXgkk//uew2nCNJ8AvhJNtGiahtw4TJb5dGifLaLl94hfZouUJ/mtLCy16ZDKNbtXBcP7Oe/r0B5CqBaFnx9oQRUiA+tzimXoltwhVZuDrtJSLlHNsvLdoC8nDxShF8/1wZ8VKQpRK5mW24ARjXQW2gVboxmnOr5gxDKYIAvz2ElnGzXbndQ4SzNaAkRva7UQhGjKBFSWcynU/4YvXZW8xNbwU+5AbTEx3af0gc2IrOGq/Eh7vopY5RM9Ynsxk9Z8ikJBwfRcz/1lz7PouCfUiOE+vvD/Ft6Q/GlZ4WeqANY5c95eQPP3Nsh2xtrbAvwQ7CIIV2t0FbWYI3SB+DePxf5mFIEQ==
X-Forefront-Antispam-Report: CIP:63.35.35.123;CTRY:IE;LANG:en;SCL:1;SRV:;IPV:CAL;SFV:NSPM;H:64aa7808-outbound-1.mta.getcheckrecipient.com;PTR:ec2-63-35-35-123.eu-west-1.compute.amazonaws.com;CAT:NONE;SFS:(13230001)(4636009)(40470700004)(36840700001)(46966006)(7696005)(53546011)(6506007)(5660300002)(54906003)(9686003)(26005)(8936002)(2906002)(186003)(47076005)(336012)(82310400005)(83380400001)(356005)(36860700001)(52536014)(55016003)(966005)(508600001)(33656002)(110136005)(70206006)(86362001)(70586007)(4326008)(316002)(81166007)(8676002)(40460700003);DIR:OUT;SFP:1101;
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 May 2022 13:20:28.5542
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 92e9b7f4-d6a0-49a8-c8b9-08da3287d9fc
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f34e5979-57d9-4aaa-ad4d-b122a662184d;Ip=[63.35.35.123];Helo=[64aa7808-outbound-1.mta.getcheckrecipient.com]
X-MS-Exchange-CrossTenant-AuthSource: DBAEUR03FT014.eop-EUR03.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB7094
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi,

May I ask what's the status/plan of  this patch series?

It seems it has not been merged yet, and I know we are a bit late in the 5.=
18 schedule, but I think this is a good fix for 5.18.=20
And, this looks like to be a good candidate for a backport to stable kernel=
s.

Thanks,
Guillaume


> -----Original Message-----
> From: Ivan T. Ivanov <iivanov@suse.de>
> Sent: 28 April 2022 08:58
> To: Michael Turquette <mturquette@baylibre.com>; Stephen Boyd
> <sboyd@kernel.org>; Nicolas Saenz Julienne <nsaenz@kernel.org>
> Cc: Maxime Ripard <maxime@cerno.tech>; Dave Stevenson
> <dave.stevenson@raspberrypi.com>; Guillaume Gardet
> <Guillaume.Gardet@arm.com>; bcm-kernel-feedback-list@broadcom.com;
> linux-clk@vger.kernel.org; linux-rpi-kernel@lists.infradead.org; linux-ar=
m-
> kernel@lists.infradead.org; Ivan T. Ivanov <iivanov@suse.de>
> Subject: [PATCH v4 0/3] clk: bcm: rpi: Add support for three more clocks
>=20
> Add missing clock required by RPiVid video decoder and provide more relia=
ble
> and accurate source for HDMI pixel and video encoder clocks.
>=20
> Changes since v3
> - Put back support for VEC clock, which was actually one of
>   reasons for this patch-set [1]. I mixed "HEVC" vs. "VEC", sorry.
>=20
>   [1] https://bugzilla.suse.com/show_bug.cgi?id=3D1198942
>=20
> Changes since v2
> - Added Acks from Maxime Ripard and Dave Stevenson
>=20
> Changes since v1
> - Drop RPI_FIRMWARE_VEC_CLK_ID clock it doesn't seems to be used.
> - Rework downstream changes on top of recent Maxime changes.
>=20
> Dom Cobley (1):
>   clk: bcm: rpi: Add support for VEC clock
>=20
> Ivan T. Ivanov (2):
>   clk: bcm: rpi: Add support HEVC clock
>   clk: bcm: rpi: Handle pixel clock in firmware
>=20
>  drivers/clk/bcm/clk-raspberrypi.c | 11 +++++++++++
>  1 file changed, 11 insertions(+)
>=20
> --
> 2.34.1

