Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 370EAC433EF
	for <linux-clk@archiver.kernel.org>; Mon, 20 Jun 2022 06:13:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232762AbiFTGNE (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 20 Jun 2022 02:13:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44322 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234123AbiFTGND (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 20 Jun 2022 02:13:03 -0400
Received: from NAM11-DM6-obe.outbound.protection.outlook.com (mail-dm6nam11on2088.outbound.protection.outlook.com [40.107.223.88])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B79D760D5
        for <linux-clk@vger.kernel.org>; Sun, 19 Jun 2022 23:13:02 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MoKf+/H+NQ8wBKrwRjnANYRP74HQquXI9FEUL7Tyk0qysAjRYpL4gGdrWxF+vZjlHFrxx2plEOrnys+H+lV9YEjpF1V2+f/1OE0Hz13rwCDF6BSenl+CoQbI9FNCfuF47cBTO785i8sFp7mCdHCGYC9G6EJbTC4ukqHhRE9+EOFuREhsvQGPy0+0QDAf1duf7spIdDlmtFRk+77xLulgzj7cn+542C00k7IrFWpYgERQ5PVCBiYAbzuNaHDqiaKFS6MDts9V0bzRyd/IzpeKlgIt19dYynrW1lVuhXYz3EGpewpkovuIuuohNFHMUb//cJnyhZAM1gTYWE8PRRU77Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=poJRNZBSzN8GOWyNSwbdLC5sCgGfs4wphXtxMmJX/pY=;
 b=C5I3bTk3zkShVxCLhDRuCBuMXxoWJCfbOnocXV6AG7m3Tr4oIfvKOJkU0xg1MXwAcXBrGf2NaPiKLFjg1t0sldyRoRZkZmf1DReZYIn4Xl+ph2JQ7tD1lTo1iYRC1U/BxIkIGzz5hKTvvBnPO1IadvyJw8sXfSp0Frh9FuIXYdzAwPTQgELp8WCUJcLjxw5RqteyxHPN9x3Sxy4PetV7u9dRSqC3kEyujTYa4avEMKbycCvxhk7fOiUBlHFyrULhO+UbIHIqs4kNZ+XSxt4aNpxkc3RXQl/nAhB+JH7NdyEXEPBJWw/YhsFAoOYCfcLlSSM09rzy8+fh40mNlCyLJg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=poJRNZBSzN8GOWyNSwbdLC5sCgGfs4wphXtxMmJX/pY=;
 b=Mr3cvyvdGJKc3PcTAurZPobsAtBuKVRMSmnbqna6VFwTLLsmm/V9SUw0K+xV12BTR3CIIAV78mRjSM1k4pMHOHoh2vtju3kZF7OqqT9mobwKr1QMgoz7PzdG600hfbCv8C/sne2d4zLkMsq2bOJ+DsGVat2EgKoyLjmQfbRwvq8=
Received: from BY5PR12MB4902.namprd12.prod.outlook.com (2603:10b6:a03:1dd::9)
 by DM4PR12MB5746.namprd12.prod.outlook.com (2603:10b6:8:5d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5353.18; Mon, 20 Jun
 2022 06:13:01 +0000
Received: from BY5PR12MB4902.namprd12.prod.outlook.com
 ([fe80::59c7:d947:6370:7de6]) by BY5PR12MB4902.namprd12.prod.outlook.com
 ([fe80::59c7:d947:6370:7de6%7]) with mapi id 15.20.5353.021; Mon, 20 Jun 2022
 06:12:54 +0000
From:   "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>
To:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC:     git <git@xilinx.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
        "Simek, Michal" <michal.simek@amd.com>
Subject: RE: [PATCH v2] clk: zynqmp: Check the return type
  zynqmp_pm_query_data
Thread-Topic: [PATCH v2] clk: zynqmp: Check the return type
  zynqmp_pm_query_data
Thread-Index: AQHYSZfQky0OUlWrbkOl4+B3Fi1v6a1YRixQ
Date:   Mon, 20 Jun 2022 06:12:54 +0000
Message-ID: <BY5PR12MB49028DE779172E69A634735781B09@BY5PR12MB4902.namprd12.prod.outlook.com>
References: <20220406092211.19017-1-shubhrajyoti.datta@xilinx.com>
In-Reply-To: <20220406092211.19017-1-shubhrajyoti.datta@xilinx.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2022-06-20T06:12:49Z;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=77f601cd-ef62-4beb-98e8-a61067457b31;
 MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=1
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 5fbde27d-3e57-4758-afa4-08da5283e9f8
x-ms-traffictypediagnostic: DM4PR12MB5746:EE_
x-microsoft-antispam-prvs: <DM4PR12MB5746D61262822BB5AF17DB2581B09@DM4PR12MB5746.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: STjiq40xv4K6V+POVdkHUjY7QBucp7OEZt7Tr/p51XZPfg8jOU0aFkCFgYpMeMLmIn3TqQ9U1I7aHVq5XzRoV5tludd3YA8WUmNZugE1RFwomoiOy/knMQzzMaJz9ANStOPkmSw1al/uFK1QLY94mWWUFubIb87iVuY4/8XgJeKXAqOj5tMSmtP7peGmROx8xntYU8j2kKmftnw+0eRvH7el4ZyNIKQem0WUXjZ3hhtRx8nCtuP7+KVNCnynPwEvICulsn0XkKumGmMU/FOKGMQZewTtR5IZVO0546e1F7yhTGyCPp8AUE6y0NbqaFntuESZtL/d7wrpngiBJzd7LDsWSgnDAs09plfXy2YkD923GmkxVgHBib7rRoIrw7+N9gniISMfbz22W3xFAPxq4j2OyVZ/Rv0+lv9OFwQRdCMf2U6lS6ZnXH9r6cD+KOkB7z5RuEAZxzzXm2E3ymsHE2v1eTFbWe4UbqGB4AGQoViMeseZoFo3YpPx9ECXIQBWFNFqKMCV9iVog8tUctmL3UJ6HWbBsFoKSFLpu515J9hYsJddg4fmVqYk78IRB94DgadAo7dIPHfXFFkI4TvfLMLZvjKj9YoK+sVFY2Osb/2ElucFozx6uUrr+pPNPUwDtgA1d+wfHywX9aMmNubFYh0cCaVX2EjBrui4RM9bGOFWa9D7SzH45OOJgFpLrz4h9xc6S7FDZ4eJ2fZavwt2GA==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4902.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230016)(4636009)(366004)(346002)(376002)(136003)(396003)(39860400002)(55016003)(41300700001)(53546011)(54906003)(316002)(478600001)(52536014)(38070700005)(9686003)(110136005)(2906002)(26005)(66446008)(5660300002)(186003)(8676002)(86362001)(76116006)(66946007)(66556008)(66476007)(6506007)(33656002)(38100700002)(4744005)(64756008)(8936002)(83380400001)(71200400001)(122000001)(4326008)(7696005);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?aRgI1VFEB1Ac7iuea6da1l9W5jpuT3XDPQ7tUDGUmSvyCp5Ojn/G7OiNthQ1?=
 =?us-ascii?Q?DN8bpea85I5rPgzcAaEnsZNGWJpF6BWE++j1bGpP3hUBpf0sd6DQ0W149qQ5?=
 =?us-ascii?Q?dy5Ec5WputWNoOMtlmgQIr+RWOoqon8wvOvpQjK9ymJZBTMtM8Ub+ahvtO6x?=
 =?us-ascii?Q?6hc4b72umVUOdMam7Sxc82Q3gIg3BbUE5+MYFyIBGV2zm8ZXgWfQR9gubq/9?=
 =?us-ascii?Q?4V7BCYRWqLrL5Tn9+MT/Klm9DB+m0YFd04oSNbHZB669qacSeYUyfUpeXaGG?=
 =?us-ascii?Q?Htw8a5iaVffn9ir1K/0MlbKlYUUAv757BkV4+whlDbvTpI7lJDYEKqK/HO7r?=
 =?us-ascii?Q?TjL53ITgXbb+ez7CGr6eL7904fN0DTLig5NudE8bcO5xNehSEZiW/cleYvVf?=
 =?us-ascii?Q?OoPyrLo+K++hi1aypI+ZHxTjhHX3HpBB8dKm2t0vwtqM9dHgZrvW91+Z7GVB?=
 =?us-ascii?Q?LIPiANAfxjC+mcNs6jRhSlSxLnV0TSSrN+JVimn1S5FmaNPaE0P1io+M+oPK?=
 =?us-ascii?Q?HX9raOCW4PpXAcsdJKTNmIEVZkaYnE3TxLghaes1rmvcENdJM0/zkvzjjgAz?=
 =?us-ascii?Q?JXZKCxHYA/kuHKWNGlV5QxlISeEloAyggOJ7d0MLYu62k2s4qHDh9i4raN1I?=
 =?us-ascii?Q?ZDUcpMutWWVWdqAVU2ib7y3hAJ+AENPLiYg0lNHtbm4Kk1QAtenjsEliIfWy?=
 =?us-ascii?Q?9NgVAmOxI1iOAf7QHSVxqv4DaJ/39/fd70fP+AHjXkf7mq34PvPrP8qJff0v?=
 =?us-ascii?Q?3oCpasOMKxNIJgXtsUuVxtlHNCFzPxw7La01GuaAuTZ/fur/AzebuUb/iJsq?=
 =?us-ascii?Q?pegsB0fSADwHyT6jSOt5wIIhtyg3SaWBzVwFVa0r9nQYyB32sI45Os2Hp/up?=
 =?us-ascii?Q?GZ1q39odbmqrY0MYgEw+hD1WSrNvNEka32VE13B3CPFkwinmY992LPA66+hT?=
 =?us-ascii?Q?715RpZl0RQ2DAlXC7f4tpie0VWrW5crpefmCqBr3kSe5Ix8l408Ton7JbeR+?=
 =?us-ascii?Q?3ganURZh3ZdMHqpzHEkZ8Q2d7WUSSfepgguwW7uSuQHRdd0iF2xKpAIaOFYK?=
 =?us-ascii?Q?NSVgksS7ecWl17dxTbji9Cj/da6EycywS9NjVvKORTwS7cj5qhdrJ2AGq6jw?=
 =?us-ascii?Q?zVfh20T6LDGfrORa6gC36JnU80CeUgYX1zc6lzHoMCgwtZNMFwOE8uGdFb0O?=
 =?us-ascii?Q?T8F6RD+Z3ICMjN5tA3VBH1W14tzbzwqN7/Crm1Y8VhoQUSt7IY5f9ix+fm7e?=
 =?us-ascii?Q?150NZRGk5YkH2N96lGpn5CStvmiKOf92tFSnDBroR7WZRucJdFZx5gk9WfsZ?=
 =?us-ascii?Q?ZvRz/HeRZQhmJAQuzd7pa4t4P3R1ULaYiRRf5vuNJIUokkqlpDMw6dkg8t62?=
 =?us-ascii?Q?dvO+REUURRZW1aiuIM6DTL6DdC5Ta8i4yKDhAYeF4CCN6EUAn61nEig3mPeD?=
 =?us-ascii?Q?K9pWzumgpTyb6ltDBqTud3XP94yCZYxovWwGbgBWm+VWR3OoSd5mKRfeYImY?=
 =?us-ascii?Q?Mj2zvJbI3KJeN9fkQCY/gDCph90E9vWJYLsBReW9q7DjaN5Y0rVKOkLBCDGz?=
 =?us-ascii?Q?eVPjKTVFL5Wu3RNrqZ6yRSj+WvY9hPTQ3K3LdeEXk7A95EaDiskzW8kQaFEu?=
 =?us-ascii?Q?KeLEuuEqMqNQAjr+rd1/PPcV5ZtFg/3MRhW3nsZKQsszeRtYsBtmVjWY9NI5?=
 =?us-ascii?Q?68BfrqoSpn9Pw2q3k2jixm34loxG8oWHCeOuPRmM+SnNry1f?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4902.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5fbde27d-3e57-4758-afa4-08da5283e9f8
X-MS-Exchange-CrossTenant-originalarrivaltime: 20 Jun 2022 06:12:54.5304
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: iLddVsAaHMOxpE1tDBrPR1N7dF1M137l3pA/oPpZ+ViLk7akholW1h/rbUvL1fieeg2m8kfpLib6foHT10CI7A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5746
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

[AMD Official Use Only - General]

Gentle ping.=20

> -----Original Message-----
> From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> Sent: Wednesday, April 6, 2022 2:52 PM
> To: linux-clk@vger.kernel.org
> Cc: git <git@xilinx.com>; Shubhrajyoti Datta <shubhraj@xilinx.com>;
> sboyd@kernel.org; Michal Simek <michals@xilinx.com>
> Subject: [PATCH v2] clk: zynqmp: Check the return type
> zynqmp_pm_query_data
>=20
> Check the return type of zynqmp_pm_query_data(qdata, ret_payload);
>=20
> Addresses-Coverity: Event check_return
> Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
> ---
