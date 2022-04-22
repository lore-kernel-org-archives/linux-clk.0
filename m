Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF151C433EF
	for <linux-clk@archiver.kernel.org>; Fri, 22 Apr 2022 07:20:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233539AbiDVHXM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 22 Apr 2022 03:23:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41988 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233529AbiDVHXL (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 22 Apr 2022 03:23:11 -0400
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6BEB263A3
        for <linux-clk@vger.kernel.org>; Fri, 22 Apr 2022 00:20:18 -0700 (PDT)
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23M6JrZN004550;
        Fri, 22 Apr 2022 03:20:15 -0400
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2042.outbound.protection.outlook.com [104.47.66.42])
        by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3fkh6rhx2k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 22 Apr 2022 03:20:15 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IMx0d/vdiIjg6/VgVVuCCoJIEu9XdFKW6r62aHwT/lN7UH1TWVDU3cPA4EAAfHrWATQnisyqukKpwPu42ioYIOn0GIIJQlolE9LmEK0lkx+MlrFWQtS4Www6vMdoLu4QshMCfo3H1LfcoK8y3ky89C02MIHD58uBgygYU5YxS/fnIEBp6mwhkcbZnk7+n+sabfxBPxKbWW9l4n0faA3CXBzX1nMCiDhoT6Xk1fh/TZkUfHqvffgXPtGCryeZXH0s6LJU3U/rk0jvaLvzRjTveqixkpsPc0tpvJfa7Y8sumcQl3ji+sBJr/ZPO2BsFJ/DG4uaNcdO5IfjunkB3GpjnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ydiuaRt0OMcDSTe7QFlRQqlV41il4FyDaWGC88jDZK0=;
 b=Bq/m/aV6wAEdQM2ww4RVKP5E9M1I//m90rC7AGgFqAFlKs5in4T4ZJFwzWf9ReuM9QTDO9izOIg4AoxcDgn3yngYdZY65Ilaz16DLaDxJVku9ji5r8r1fgbT4pmExBu4Yeccor40m66lqVTMNr67n6jSIEynGuPjSIbd6bQkhzNCnRa7+YOIeT4CPscl4NjKW3phQCqt+KwBBiMCsYOm5SvBDBl/k9Q5Hx0Y557KWNaY2I9tlx1EWlDI3pliaNIL/FjCSfNq8Q50utAQN0phn2K70JXzbRpRY1mTq1dwSh0Z/wYtulseGBs5XdGv3VHgMv5aoyYTp5NAr9vOMtYFwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ydiuaRt0OMcDSTe7QFlRQqlV41il4FyDaWGC88jDZK0=;
 b=JtVGlkoBPSn5v74FS1OoiysAuFkHqoHl4XUot78fM++h7c0Uwf9h5MgwE0dMgFVMpvpeLJpZaUVz/wBIMqvITMJQpRWvcupmKp7tdTWx3O8x+lPjX4OKLg/xPi2+7uvy0aSZA/GPCxAW7gXkb3EQXaOC9LPdYI8L0mlLLidqyfs=
Received: from PH0PR03MB6786.namprd03.prod.outlook.com (2603:10b6:510:122::7)
 by BN6PR03MB3297.namprd03.prod.outlook.com (2603:10b6:405:44::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Fri, 22 Apr
 2022 07:20:04 +0000
Received: from PH0PR03MB6786.namprd03.prod.outlook.com
 ([fe80::a97e:a520:c3a6:d2ae]) by PH0PR03MB6786.namprd03.prod.outlook.com
 ([fe80::a97e:a520:c3a6:d2ae%9]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 07:20:04 +0000
From:   "Sa, Nuno" <Nuno.Sa@analog.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC:     Michael Turquette <mturquette@baylibre.com>
Subject: RE: [RFC PATCH 1/4] clk: clk-conf: properly release of nodes
Thread-Topic: [RFC PATCH 1/4] clk: clk-conf: properly release of nodes
Thread-Index: AQHYVbohLd0ieG3TGEyMPwPMewG326z7hw6w
Date:   Fri, 22 Apr 2022 07:20:04 +0000
Message-ID: <PH0PR03MB678680176C04ACB662BE707099F79@PH0PR03MB6786.namprd03.prod.outlook.com>
References: <20220407133036.213217-1-nuno.sa@analog.com>
 <20220407133036.213217-2-nuno.sa@analog.com>
 <20220421195802.2127DC385A1@smtp.kernel.org>
In-Reply-To: <20220421195802.2127DC385A1@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jYm5OaFhHRndjR1JoZEdGY2NtOWhiV2x1WjF3d09XUTRORGxpTmkwek1t?=
 =?utf-8?B?UXpMVFJoTkRBdE9EVmxaUzAyWWpnMFltRXlPV1V6TldKY2JYTm5jMXh0YzJj?=
 =?utf-8?B?dE9XWTNORFk0TURndFl6SXdZeTB4TVdWakxUaGlaVEl0WlRSaU9UZGhOMk5q?=
 =?utf-8?B?TnpFd1hHRnRaUzEwWlhOMFhEbG1OelEyT0RCaExXTXlNR010TVRGbFl5MDRZ?=
 =?utf-8?B?bVV5TFdVMFlqazNZVGRqWXpjeE1HSnZaSGt1ZEhoMElpQnplajBpTWpRME9D?=
 =?utf-8?B?SWdkRDBpTVRNeU9UVXdPRFUyTURJeU5EQXpPREkwSWlCb1BTSjZVa3N2VTFs?=
 =?utf-8?B?UFZGQnljV2xPZVRacVEzQXlPR0ZHVlhkR1JVRTlJaUJwWkQwaUlpQmliRDBp?=
 =?utf-8?B?TUNJZ1ltODlJakVpSUdOcFBTSmpRVUZCUVVWU1NGVXhVbE5TVlVaT1EyZFZR?=
 =?utf-8?B?VUZGYjBOQlFVUjNjWE40YUVkV1lsbEJWblZsWXpKblRsaHRaRkpYTlRWNllV?=
 =?utf-8?B?RXhaVm94UlVSQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCU0VG?=
 =?utf-8?B?QlFVRkVZVUZSUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJSVUZC?=
 =?utf-8?B?VVVGQ1FVRkJRVlpKUlhadlVVRkJRVUZCUVVGQlFVRkJRVUZCUVVvMFFVRkJR?=
 =?utf-8?B?bWhCUjFGQllWRkNaa0ZJVFVGYVVVSnFRVWhWUVdOblFteEJSamhCWTBGQ2VV?=
 =?utf-8?B?RkhPRUZoWjBKc1FVZE5RV1JCUW5wQlJqaEJXbWRDYUVGSGQwRmpkMEpzUVVZ?=
 =?utf-8?B?NFFWcG5RblpCU0UxQllWRkNNRUZIYTBGa1owSnNRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkZRVUZCUVVGQlFVRkJRV2RCUVVG?=
 =?utf-8?B?QlFVRnVaMEZCUVVkRlFWcEJRbkJCUmpoQlkzZENiRUZIVFVGa1VVSjVRVWRW?=
 =?utf-8?B?UVZoM1FuZEJTRWxCWW5kQ2NVRkhWVUZaZDBJd1FVaE5RVmgzUWpCQlIydEJX?=
 =?utf-8?B?bEZDZVVGRVJVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCVVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVOQlFVRkJRVUZEWlVGQlFVRlpVVUpyUVVkclFWaDNRbnBCUjFWQldY?=
 =?utf-8?B?ZENNVUZJU1VGYVVVSm1RVWhCUVdOblFuWkJSMjlCV2xGQ2FrRklVVUZqZDBK?=
 =?utf-8?B?bVFVaFJRV0ZSUW14QlNFbEJUV2RCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFrRkJRVUZCUVVGQlFVRkpRVUZCUVVGQlFUMDlJaTgrUEM5dFpYUmhQZz09?=
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 08aa2453-097d-491f-68d2-08da2430858d
x-ms-traffictypediagnostic: BN6PR03MB3297:EE_
x-microsoft-antispam-prvs: <BN6PR03MB3297E750063763DB7E7DF60899F79@BN6PR03MB3297.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: lm5cdzAjAYB1e1CzDBanwzbNB4hAS1SHV1jXJR9bmwYOPwhSXFRrtR6Rlqp3i3sYMEKy9+2WjFTRzasaPeWSFoIqps/r3BpwCaXSgGZjM/yIFQKBMqA3EvXoItfg/kudlp9ZKY8WhWI6YZIhNxNxdJlbJvBIggfVIOi/aItcj4x/4tA315AxtjhRLD/iHxeiUNgXHdB7CV5eX/tTgXhZ+3Tb7/DlCXR9uFFboy02leGxO3jbbE51L90om7qJqzq6aPg8zHja4ga5kT/DDj0gpNVH8hkg9SvWxTfpGiuPaTTteM03slcmElVtLRkUZYVdBtX7pb8eA2YyERQ8usJ++OSWqsPgqmKd9q6argJOzbV4E7T4zBXMbbnJhVoE/CHNHgtDr390Tdp5S1UeA3/KDOrUWa+h8IfgKL7jQ9iBRTJPkUTU9FjNCM8ppnXXsVtB1s/n5osLQZZg2obtXqa/u+v+FqioR456pyhn+KHZEUooDyGvx3UuOv73jQjASOjR7oWchs6TjgQG2nFgtinKh39cJA/n7SA8gTgJxOvkhIg4CJa1+vDUXwezo3HFNy6WBIrgiHBpI/o6fEXd0n102Ok+/s3PFftt4k8Bch00HzeZ03NVCM0MzrQL+Mkr1ozPGMQDlybZPL8jl03bSeFdeabZHy4+ZXcwcLmt3pTI4nbNft4EVjqHhgCG5MQ0EIZNAczN0489T6zdHM+DCniCBw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6786.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(66446008)(66946007)(64756008)(66556008)(52536014)(7696005)(9686003)(26005)(55016003)(8936002)(53546011)(83380400001)(33656002)(8676002)(4326008)(66476007)(86362001)(110136005)(316002)(76116006)(508600001)(38100700002)(71200400001)(5660300002)(122000001)(6506007)(38070700005)(186003)(2906002);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MHZPNXlhNlFkazF0TVp0Z21mRFgrYnczVmFJaHJBL1luZ3dvbkEzSlA1azIy?=
 =?utf-8?B?N0JUeUw2S1JteHB4eHhKNXlldkxJSjMwY0txeGo5TE5kRjFWU0Z6dytBTmRw?=
 =?utf-8?B?TWVabnJsa2ZMTHV6OFozMisxam9HTGZhcjhoVk1QbDBtVFhmbWZxUlFNcDlv?=
 =?utf-8?B?N2tZMExqT3JhZ2NEVlNuYU5FYWc5cDVaTlIyKzhvL1R1a1crM2szZTV0c24z?=
 =?utf-8?B?ZzUvK3ZlR3RhV2pzY2M0Q1ZqMG92RE9wa005M2ZoVThHaTFYQXZ1Y3FsbDY4?=
 =?utf-8?B?ZmtucmNFdy9JL0hhVUtldzArY1k0R3d4cmZRcTlkQW0wRzkvRXhtTmJPaGdO?=
 =?utf-8?B?cStIaG1oNHk1bXV0NHVBTFFlQzFGLzhJOWVkZ2VyRzRqTTlEQXB1V3pSRlNW?=
 =?utf-8?B?RjdDZjlzSmpzaTFpa1BjejdLOWUxK3J2OFNxSEtKYkRYbjdIOGxZV2tEZG52?=
 =?utf-8?B?SFJjUVFzbG5BdTljbE50SEZ1YzFHVWc0NnNneVlUcU84RDBja0cySm5VMDlE?=
 =?utf-8?B?YllYM1JoWEVSSGF3WnZXRUFiVlpIVGNwOE1wV0pDajN3bDF6WUdPaEZibFJN?=
 =?utf-8?B?dk9kQ09wQW9tU05JVVVvMUd0Y0labHJ0cjVqOEZyTWtSSmZhMTFVVjJyNk01?=
 =?utf-8?B?bDZaM0U4QkpWQ01CbUkxSkdkb2h4cWRUbStsQy95YjlhY3QrU0pGd2taVmQr?=
 =?utf-8?B?VWJUTUhGVjFvSXpaYWpmaGdLWVY0ZjUwUkNNZHNWWjRHMVR3QyszaUxMQ2Q4?=
 =?utf-8?B?eDlKdzVoQjY4Q2g0eFRZdXdoc3JhcEFkM29xbEtJNG91S1BzbTdEbGxwKzgr?=
 =?utf-8?B?MmxHZzRvTVAyWGhWMGVrWjZobm9WY3E4L2FZQW15WkgvVzdCK0hNMDdwS0hE?=
 =?utf-8?B?ZEgvMmxvK3M5dDR4cFhNQ3FmTWpRUHRaR1JoNGFCek9NbGJlcDF3d00vK0xy?=
 =?utf-8?B?Sm5lQVkzV1RleGZDRDZYVVROdytIU1ErM1pJS1JBMWVnbXRWaW1PcFlZWDRv?=
 =?utf-8?B?bm9VWjFDVTI4Y1BkVkJIWkxIRWRKUy9EdVVUSXBjdGRBckhMaG5Jdnk0K3RK?=
 =?utf-8?B?bEE0blBEZ2FDK0N2ZXE1WWtMRDBpWGp3TlVvK3F6Z2NoMk9lM0VVMWhtMUxj?=
 =?utf-8?B?Zy9NTFVRZEo2dmNpdzF3S3IxOEdxQUkxRlg0SXZPWFNXZ2F4cWZzcjZpczY3?=
 =?utf-8?B?b0cvMDFJZEZFdFBYQkRraVpuaHgxZ3A0NHNwQWI4cXlNVXQ1STA1NUZmaXVx?=
 =?utf-8?B?YU5uOGdobXIrK1h5WmdqQ2x5NSt2cHZLTlplTGFxSSswZGtkSUhYeFlYRTdu?=
 =?utf-8?B?MWtnbEQvQkxDT0g5UTNYM2hRdkc0d1FxZ3g3L0hmTit3VUQzOUU2VFBZZkc5?=
 =?utf-8?B?cVpXMHFpWVBVelMzN0RHT3hWS291cjVYU1ZHTnM1TDBrQmVMdGhIZmhOOXZS?=
 =?utf-8?B?Q3htbUo0RExyMk5nSENkOUh0Wk4zVmNZRkw4Y2Rad1llejhJY1FueUdoYWVR?=
 =?utf-8?B?aGV0TjI2OEc2Z3ExeitPOUtwazFVQ09MZU8za2U4NG9pRVJxMlFEeEYvcUdn?=
 =?utf-8?B?Y0dkekkrTS9nR1ZSVGUzM1U2RTBlYnZNNlJiNExnNWJ2Y3RuaWxldUxqdm1V?=
 =?utf-8?B?MUI1QW9HeFdNN2ZKQ3RkSXplalhCTU9KUjJxbUg1MENIQVJ4TjQ3Wng0d2Vk?=
 =?utf-8?B?LzUwc21SVHJVUXZnUkZlVWF2V1dPL3RLamw4aU55MWZhc1BqVHFib1pFN1c4?=
 =?utf-8?B?LzduUmFYSHVIRTk5SGRwWVFaRDdqUFZxNDBBOFJvN3E1QlBheCtrUWFESk9Z?=
 =?utf-8?B?OVpVczBDYWs0QUZuanhMdjc2Zm1KSWVJd1ZNTHVJVVlSRk5XdDFUMnk1S3JI?=
 =?utf-8?B?M0xUR29jSTlUdFpQSFBEaXpSeW1iV05DM0VOMUhsdTF6WVZiZHF2S0JqQVg1?=
 =?utf-8?B?S01CQ3dLWUlUZ255VXZKZEllS29sQ2k3bisweGNuZVc4N1h3YUViRjA1cHpI?=
 =?utf-8?B?ZXMwNTVZVHJoM28yYWh5eTU5U1pYQWtRdkRXd3h0Mzhib25iT1N1QzFMa3dE?=
 =?utf-8?B?cWtPWGN3Nll1ZlhGdU81MWtEZDlOYTdhR0xXQk85Y0dsVkRRM0pGbldRNEli?=
 =?utf-8?B?TVc5aWJYSXNETkt5cFRERHdEMVhyVzRKSTRKR2NBRUMvbXJnZjdvR2xncDJl?=
 =?utf-8?B?M0ZkcGxBVmxXRk9oTVJGLytJdWQ3c3ZFYXEyZ2FMd0dFSmRrWmFJZEZTYXVB?=
 =?utf-8?B?SHZ5WGo3RFhyVDN2TG9wZHdubzl2Y0pYY3BGdG5MUndrWEM3UFpDZ1AweXds?=
 =?utf-8?B?R1c4NkdBSU1uVDlRNDB5ZzNWSVdIUXdMbXppVUhqUTNGTzNBbTR2UT09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6786.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08aa2453-097d-491f-68d2-08da2430858d
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2022 07:20:04.3545
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lRSjk8UMna10OBA2bhkxgR77tCPWsM+vOxb0xAFbizrcj2sSnFbDMtlbWPwoIS7Uq6OZv7+kvqBYt3vwiZ/xaA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN6PR03MB3297
X-Proofpoint-ORIG-GUID: Lpco6RPO6DB-NbjDabkGCrru0_xE0pcb
X-Proofpoint-GUID: Lpco6RPO6DB-NbjDabkGCrru0_xE0pcb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-22_02,2022-04-21_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015
 priorityscore=1501 suspectscore=0 bulkscore=0 mlxscore=0 impostorscore=0
 adultscore=0 phishscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=999
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204220032
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU3RlcGhlbiBCb3lkIDxz
Ym95ZEBrZXJuZWwub3JnPg0KPiBTZW50OiBUaHVyc2RheSwgQXByaWwgMjEsIDIwMjIgOTo1OCBQ
TQ0KPiBUbzogU2EsIE51bm8gPE51bm8uU2FAYW5hbG9nLmNvbT47IGxpbnV4LWNsa0B2Z2VyLmtl
cm5lbC5vcmcNCj4gQ2M6IE1pY2hhZWwgVHVycXVldHRlIDxtdHVycXVldHRlQGJheWxpYnJlLmNv
bT4NCj4gU3ViamVjdDogUmU6IFtSRkMgUEFUQ0ggMS80XSBjbGs6IGNsay1jb25mOiBwcm9wZXJs
eSByZWxlYXNlIG9mIG5vZGVzDQo+IA0KPiBbRXh0ZXJuYWxdDQo+IA0KPiBRdW90aW5nIE51bm8g
U8OhICgyMDIyLTA0LTA3IDA2OjMwOjMzKQ0KPiA+IFdlIG5lZWQgdG8gY2FsbCAnb2Zfbm9kZV9w
dXQoKScgd2hlbiB3ZSBhcmUgZG9uZSB3aXRoIHRoZSBub2RlIG9yDQo+IG9uDQo+ID4gZXJyb3Ig
cGF0aHMuIE90aGVyd2lzZSB0aGlzIGNhbiBsZWFrIG1lbW9yeSBpbiBEWU5BTUlDX09GIHNldHVw
cy4NCj4gPg0KPiA+IEZpeGVzOiA4NmJlNDA4YmZiZDggKCJjbGs6IFN1cHBvcnQgZm9yIGNsb2Nr
IHBhcmVudHMgYW5kIHJhdGVzDQo+IGFzc2lnbmVkIGZyb20gZGV2aWNlIHRyZWUiKQ0KPiA+IFNp
Z25lZC1vZmYtYnk6IE51bm8gU8OhIDxudW5vLnNhQGFuYWxvZy5jb20+DQo+ID4gKGNoZXJyeSBw
aWNrZWQgZnJvbSBjb21taXQNCj4gNjllYjQ3YTI2ZTdmNzI4YTVjMDUyNjg3MzgwOTkzY2Q5YTBk
ZDY0MykNCj4gDQo+IFRoaXMgbGluZSBzaG91bGQgYmUgcmVtb3ZlZC4NCj4gDQo+ID4gLS0tDQo+
ID4gIGRyaXZlcnMvY2xrL2Nsay1jb25mLmMgfCAxOCArKysrKysrKysrKysrKy0tLS0NCj4gPiAg
MSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pDQo+ID4NCj4g
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsvY2xrLWNvbmYuYyBiL2RyaXZlcnMvY2xrL2Nsay1j
b25mLmMNCj4gPiBpbmRleCAyZWY4MTk2MDZjNDEuLmQ2MDY1Y2RmMTU0MCAxMDA2NDQNCj4gPiAt
LS0gYS9kcml2ZXJzL2Nsay9jbGstY29uZi5jDQo+ID4gKysrIGIvZHJpdmVycy9jbGsvY2xrLWNv
bmYuYw0KPiA+IEBAIC0zMyw5ICszMywxMiBAQCBzdGF0aWMgaW50IF9fc2V0X2Nsa19wYXJlbnRz
KHN0cnVjdA0KPiBkZXZpY2Vfbm9kZSAqbm9kZSwgYm9vbCBjbGtfc3VwcGxpZXIpDQo+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgZWxzZQ0KPiA+ICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgcmV0dXJuIHJjOw0KPiA+ICAgICAgICAgICAgICAgICB9DQo+ID4gLSAgICAgICAgICAg
ICAgIGlmIChjbGtzcGVjLm5wID09IG5vZGUgJiYgIWNsa19zdXBwbGllcikNCj4gPiArICAgICAg
ICAgICAgICAgaWYgKGNsa3NwZWMubnAgPT0gbm9kZSAmJiAhY2xrX3N1cHBsaWVyKSB7DQo+ID4g
KyAgICAgICAgICAgICAgICAgICAgICAgb2Zfbm9kZV9wdXQoY2xrc3BlYy5ucCk7DQo+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgcmV0dXJuIDA7DQo+ID4gKyAgICAgICAgICAgICAgIH0NCj4g
PiAgICAgICAgICAgICAgICAgcGNsayA9IG9mX2Nsa19nZXRfZnJvbV9wcm92aWRlcigmY2xrc3Bl
Yyk7DQo+ID4gKyAgICAgICAgICAgICAgIG9mX25vZGVfcHV0KGNsa3NwZWMubnApOw0KPiA+ICAg
ICAgICAgICAgICAgICBpZiAoSVNfRVJSKHBjbGspKSB7DQo+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgaWYgKFBUUl9FUlIocGNsaykgIT0gLUVQUk9CRV9ERUZFUikNCj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgIHByX3dhcm4oImNsazogY291bGRuJ3QgZ2V0IHBhcmVudCBj
bG9jayAlZCBmb3INCj4gJXBPRlxuIiwNCj4gDQo+IEkgc3VzcGVjdCBpdCB3b3VsZCBiZSBlYXNp
ZXIgdG8gZm9sbG93IGFuZCBmaXggaWYgdGhlIGNvZGUgd2FzDQo+IHJlb3JnYW5pemVkIHRvIGhh
dmUgbW9zdCBvZiB0aGUgY29udGVudHMgaW5zaWRlIHRoaXMgZnVuY3Rpb24gYXMgYQ0KPiBzdWIt
cm91dGluZSB0aGF0IGlzIGNhbGxlZCBmb3IgZWFjaCBpbmRleC4gVGhlbiBhbGwgdGhlIG5vZGUg
cHV0dGluZyBhbmQNCj4gY2xrIHB1dHRpbmcgY2FuIGJlIGluIG9uZSBwbGFjZSBpbiB0aGF0IG90
aGVyIGZ1bmN0aW9uIGFuZCB0aGlzIGlzIGENCj4gc2ltcGxlIGxvb3AgYXJvdW5kIHRoYXQgc3Rv
cHMgb24gdGhlIGZpcnN0IGVycm9yLg0KPiANCg0KVXBzLCBmb3Jnb3QgdG8gYW5zd2VyIHRoaXMg
b25lLiBZZWFoLCBJIGRpZCBub3Qgd2FudGVkIHRvIGNoYW5nZSBtdWNoIGJ1dA0KSSBhZ3JlZSB0
aGF0IHRoZSBjb2RlIGNvdWxkIGJlIGEgYml0IHJlZmFjdG9yZWQgYW5kIEkgY2FuIGRvIHRoYXQg
aW4gdjIuDQoNCi0gTnVubyBTw6ENCg0K
