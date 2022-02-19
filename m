Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48915C433EF
	for <linux-clk@archiver.kernel.org>; Sat, 19 Feb 2022 11:34:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238937AbiBSLe3 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 19 Feb 2022 06:34:29 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:42052 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238457AbiBSLe2 (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 19 Feb 2022 06:34:28 -0500
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (mail-mw2nam12hn2223.outbound.protection.outlook.com [52.100.167.223])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 16B414F447
        for <linux-clk@vger.kernel.org>; Sat, 19 Feb 2022 03:34:10 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=N4VqNwe7aQ1AjOFTsDYEuVwd3Afc6/ycOqudb1d3WqA55/sJcdvDQijDdNg5O8ohXKZtYxdRP5TFA+sArGMeUmJyLEgU+pU3xazQuZBXqRyElVrg76jgctzEGno+CynEN7EarDFEwFw8f4Mfx/XVAVUZcobhtU5m850KEffVksoBgapQ2RdoPXZzrHFCf25gz8D2bcrIiV4ph0AHmivdhZaqp077rBLvyTjgcBkJlo9wvbGB5Q/GbH8ZolBIO0C1eDF4EZcNc8UJDatCO+2t2rykc4Cu64GoajlK/bavfBSpGHESb7/ankkfzLcXPHt7E8+2zb4XXn7lQUAR60aiYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5+iJiA0J6jviS6/j+q9zQZlf+odb/fFUug6nr0gp3M4=;
 b=ganmzJv6ycJ0wt2dult2A10Ns5J92su9HtWeAxQPS74DULwXozwuBfP2sJnOtPidx/OfSz96pCZyVMpmbv7u9OFh5fIx/n2UWQB/uqqi+fWLyP1bWSBJY04p3PjiMGV+TTtk+kvygNSPzuGTHl6OspclmLS/remchLDvgtIDlhWmcKlYQ7/OdiGluDpocqR8j4ZvmVm5KS4pL9gxFjTrtbwlj+yyTZGQA0mnOU8QUM/hJuJEMxmMtxvMB1nvdjgwFolrwsdhvCSa3+OlsydXkIqdNAqThDkZsNBwmgVTiKtH6LphiC8Tr3xdiNh49W5huAXxyfkeaGlJpNLLXlyuDw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=fail (sender ip is
 216.169.5.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=u-csd.com;
 dmarc=none action=none header.from=u-csd.com; dkim=none (message not signed);
 arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucsd4.onmicrosoft.com;
 s=selector1-ucsd4-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5+iJiA0J6jviS6/j+q9zQZlf+odb/fFUug6nr0gp3M4=;
 b=JETcHuO9kDJTcKZx35h1WIJcWa+a/vz2UNOAxNpK/zcpUwRGfVonGSnSYJVuM/IV3SvhqZS3OSfFtfCjvE7bAOyvEYmAT4R9/IjFo7QRwDR4LSTjHm+7g3tc0dy+uZ18S06emcicwd18PmmEHUwE4t7hRMXNNzUg6NydGYMLQNg=
Received: from CO2PR04CA0155.namprd04.prod.outlook.com (2603:10b6:104::33) by
 SJ0PR06MB8595.namprd06.prod.outlook.com (2603:10b6:a03:40e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.16; Sat, 19 Feb
 2022 11:34:00 +0000
Received: from MW2NAM10FT045.eop-nam10.prod.protection.outlook.com
 (2603:10b6:104:0:cafe::7b) by CO2PR04CA0155.outlook.office365.com
 (2603:10b6:104::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4995.17 via Frontend
 Transport; Sat, 19 Feb 2022 11:34:00 +0000
X-MS-Exchange-Authentication-Results: spf=fail (sender IP is 216.169.5.195)
 smtp.mailfrom=u-csd.com; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=u-csd.com;
Received-SPF: Fail (protection.outlook.com: domain of u-csd.com does not
 designate 216.169.5.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.169.5.195; helo=UCSDEX1.u-csd.local;
Received: from UCSDEX1.u-csd.local (216.169.5.195) by
 MW2NAM10FT045.mail.protection.outlook.com (10.13.155.45) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.4995.16 via Frontend Transport; Sat, 19 Feb 2022 11:33:59 +0000
Received: from UCSDEX1.u-csd.local (192.168.16.43) by UCSDEX1.u-csd.local
 (192.168.16.43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.18; Sat, 19 Feb
 2022 05:25:25 -0600
Received: from [199.231.186.244] (199.231.186.244) by UCSDEX1.u-csd.local
 (192.168.16.43) with Microsoft SMTP Server id 15.1.2375.18 via Frontend
 Transport; Sat, 19 Feb 2022 05:25:25 -0600
Content-Type: text/plain; charset="iso-8859-1"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Description: Mail message body
Subject: HI..
To:     <linux-clk@vger.kernel.org>
From:   "Kristina Pia Johansson " <info@u-csd.com>
Date:   Sat, 19 Feb 2022 06:25:25 -0500
Reply-To: <piakjp2022@gmail.com>
Message-ID: <ece3649d-8caf-4220-8e75-28bcd754d33b@UCSDEX1.u-csd.local>
X-CrossPremisesHeadersFilteredBySendConnector: UCSDEX1.u-csd.local
X-OrganizationHeadersPreserved: UCSDEX1.u-csd.local
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8dc9e5fb-7b09-4e38-1cb6-08d9f39bb908
X-MS-TrafficTypeDiagnostic: SJ0PR06MB8595:EE_
X-Microsoft-Antispam-PRVS: <SJ0PR06MB859521C657046D296272963397389@SJ0PR06MB8595.namprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Forefront-Antispam-Report: CIP:216.169.5.195;CTRY:US;LANG:en;SCL:5;SRV:;IPV:NLI;SFV:SPM;H:UCSDEX1.u-csd.local;PTR:InfoDomainNonexistent;CAT:OSPM;SFS:(13230001)(136003)(39860400002)(376002)(346002)(396003)(40470700004)(46966006)(36840700001)(3480700007)(70206006)(26005)(86362001)(5660300002)(70586007)(2906002)(47076005)(4744005)(2860700004)(8676002)(31696002)(7116003)(40460700003)(8936002)(82310400004)(36860700001)(82740400003)(336012)(31686004)(956004)(6706004)(16576012)(9686003)(81166007)(508600001)(40480700001)(316002)(356005)(186003)(6916009)(16900700008);DIR:OUT;SFP:1501;
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?4TFxO9lB6Ir2s0Ow0jm4UF8sfu1U6gHjapCDQszzOe5FF4fV6Rxz77tUAZ?=
 =?iso-8859-1?Q?1VpAb6kZO9lk9HQrPDtXw0kNL+O+lc4pIwocKfIj3YxRFwXTi/Vam0zQRV?=
 =?iso-8859-1?Q?AtTy7dxAFev0OOOQKNqseo1FmvG9OOQvTqglu1au+9tcIX4Zm84bzNsMtW?=
 =?iso-8859-1?Q?x7eefOxWLCjOmWtwlr8gOIH3m4eWolUMj2l9adIB1TclaQN5/qgNpXYEg5?=
 =?iso-8859-1?Q?flyuWLKmKs80A4MG0IEZl4GgV+RZmEDG0CuZDD3Pr6NSTSBszYSqEHDiuO?=
 =?iso-8859-1?Q?YfoNQqa/ANK4YZQbgHczi0rfJKeq/nh9tyWakkpdGY/m8OsyeYriXGtiRv?=
 =?iso-8859-1?Q?IfoEx3ST+uYLo57GpSXuomb3OnkJhxM6dkCfzqOvmxBIqKyhNpYAKdj1Oj?=
 =?iso-8859-1?Q?OsM8/30mO1ATk1GOColJ92XpEf74VyLSAv5+Xm7bkZV9Ssbsg/L4dRF3Fy?=
 =?iso-8859-1?Q?N4B3XOGqPHPPtLW7IGx8/H69V5OrRRxjTDxOVDn7aOUXcTFun2TyN/ps1t?=
 =?iso-8859-1?Q?klOwUU7eOiXa1paYuP/IM/CGvyDv3f1fEnMLTZ1lq8q0Y/58QKOLTdjpDZ?=
 =?iso-8859-1?Q?oUMpLVAGWqBM5bVNsaalPCyXK7ZGBpoqg0DfQ5yEMb3kt1ekphNG3IvV0C?=
 =?iso-8859-1?Q?xWroOh/aNh5ixcrCDi4Gx1yYe6qd8d1fhFXwt8nYeqH8A3Ko2ne5Kv4QU+?=
 =?iso-8859-1?Q?5ZoFf6S/MAKegRzT4aEF0WBTxpRO3kd6uRBTAekPkcTYPD9HWkxosVuRGf?=
 =?iso-8859-1?Q?0hV9Uq2n10dTBXxIti70pk3AbZPpoP34fToXpvrZ4PivuAgcSU7vlLm4UA?=
 =?iso-8859-1?Q?KZR73j5t4oPliv6Fq/TcRTK4yCkpBC4nZYlawqfw7oiPKwRLpD8JTiaYZo?=
 =?iso-8859-1?Q?4lGSRCc6FkQ4C3d/PBzjWU98GOAsdHOk7A9JvCXWejP9E/cwkQhBF7c4YS?=
 =?iso-8859-1?Q?J2qrpqkdP66Mcn59IwDrbYI5bCx+ymDMsp9Fqy3ihvx3cEr32+IwQWjafC?=
 =?iso-8859-1?Q?WXvhlORwhhTh0EKCCeffxby0OKTrhehB3dK5/KOJUYZ2Rjz+HC5+67c0+d?=
 =?iso-8859-1?Q?bZL+UptmithB7Ekn7LmNWoqCtc3eI94+49fmXjW0KtIIwloa+L1JkwSv+6?=
 =?iso-8859-1?Q?NDMy68OhLbZa0t2tV7NSix5GmTcK0=3D?=
X-OriginatorOrg: u-csd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Feb 2022 11:33:59.8339
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8dc9e5fb-7b09-4e38-1cb6-08d9f39bb908
X-MS-Exchange-CrossTenant-Id: 663d4886-a028-4654-8be0-f6e600c88247
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=663d4886-a028-4654-8be0-f6e600c88247;Ip=[216.169.5.195];Helo=[UCSDEX1.u-csd.local]
X-MS-Exchange-CrossTenant-AuthSource: MW2NAM10FT045.eop-nam10.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR06MB8595
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi

I hope that you are at your best and doing well. The purpose of this letter=
 is seeking for a pen pal like friendship and I'd love to and be honored to=
 be friends with you if you do not mind.. If the Idea sounds OK with you, j=
ust say yes and we can take it on from there. I look forward to hear hearin=
g from you.. My name is Kristina From Sweden 36 years , this will mean a lo=
t to me to hear back from you.

Warm Regards.

Kristina
