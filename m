Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2055.outbound.protection.outlook.com [40.107.100.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7FDC2E406;
	Fri,  3 Jan 2025 11:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735904121; cv=fail; b=d1eosU956MI5eJejfA6b19cfYacAlUQX/WD3K+U0v9Gpo0aosKQ59KytRJGGxXIARv53jovQDTEBZ2xGWDTL/ml/2Lf/lkFg2OCrPk5bv5sth5gmMZbRZvGd2MH5ALxu7+2v1X0urhs3MvOVGTPlk6x/S+ZpYMrvtXl1riFOQhs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735904121; c=relaxed/simple;
	bh=h6BYoaFySR7ySPr/sjcsoZYc7+y5Wgcl+SwzICCnrbE=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=P0zeYwU7tXjbZHxPLcnpP/wZPhr8M4QxVClAPJ6wXBRwTGwg8hztx2rZUB+A+kdH3tuPLa0jG2rsml2BqL4zK+icIKPQgA6adtifz2GuM174Ab5vq+sqD2j0aPhhvTr/tfK0ueXaIsxkKn2vB67YO5Wb9++FPhbG2CJXsxHDYco=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=Cu5GCYR3; arc=fail smtp.client-ip=40.107.100.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="Cu5GCYR3"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a3vQ5M29o5tXaYZL9SQ4pR/U/UuOOfVwX5NrpWi3kXoCWopZg81kdmwEDtdjHntUKH7Bbh1mFBaVlaQJzn5pn9jVINyTBJ7phjHXFMNFYLG0mfm13e5S3G3W2iPtINxKh/VvquT7K0peHx3z1PYAk3UB7qZ4FyriQqwIgTWGWZP8+vsDW13UYly34/+7HQVaLtYH8l/3TrWptlj/GNKTsHmFYzp3IVncCkA4EdtDBV7sZWrIIrRTdP5Ik9bvIimDNDzLRo/68hMh8EabOQhSVAgjo7GQ6G7wnE/9MuAe2aYjJDhVAjze8NLXGCq5plvIo3044uO/w4/9F331Ny+TQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h6BYoaFySR7ySPr/sjcsoZYc7+y5Wgcl+SwzICCnrbE=;
 b=E4NYKZGxrtjAEnqyPye1W9w6ifguXDc9dnBALN0Fpqjlx772l79nIt9o6iJCLXhmd1zwBaBT+GYNJgm5tEYsLajsox8HEFQQKNmL7xF/xwC64GQAqbFWJ3aezltb9brdBv87RYwBytF0nc/8eAgLGeUFXKgRMd9J3ySpLf72oZDC/qv9jyStQTTqXb6jDeObFxEh29J1lL/HUah6xnB/x8MmtXQz0U4vwl/KvlxM6VfhMIQ3LYEEcOzeu2Qa47yE/5B+Pw1hHV9aVaG5TBvVG/ImnlJSEdfsvjTk+TjDJEywTrMwxLkzLwC3yi4w3aZqsffS/zh4Z0epo1bOrp3LiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h6BYoaFySR7ySPr/sjcsoZYc7+y5Wgcl+SwzICCnrbE=;
 b=Cu5GCYR3mge0Zftw8Qamm2YheLJD5D4G9POaBsAqtXzPVTmN4TCfMHiGpnEpzdjXP0eRdCA9aL0qJn820jc5PHceqXY1a5rmK3EoR8egQcAHNQNNpzbBMjKUS2Lgq2F3sk1Sl9chKQsLrr3iqsiBcfbJY0gIU0PqYMm3ctDmZ9Q=
Received: from CH2PR12MB4875.namprd12.prod.outlook.com (2603:10b6:610:35::24)
 by MN0PR12MB6295.namprd12.prod.outlook.com (2603:10b6:208:3c0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Fri, 3 Jan
 2025 11:35:11 +0000
Received: from CH2PR12MB4875.namprd12.prod.outlook.com
 ([fe80::ff88:6c6f:c187:6511]) by CH2PR12MB4875.namprd12.prod.outlook.com
 ([fe80::ff88:6c6f:c187:6511%4]) with mapi id 15.20.8314.013; Fri, 3 Jan 2025
 11:35:11 +0000
From: "Visavalia, Rohit" <rohit.visavalia@amd.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
CC: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rohit
 Visavalia <rohit.visavalia@xilinx.com>
Subject: RE: [PATCH 1/3] dt-bindings: clock: xilinx: move xlnx_vcu dt-binding
 to clock from soc
Thread-Topic: [PATCH 1/3] dt-bindings: clock: xilinx: move xlnx_vcu dt-binding
 to clock from soc
Thread-Index: AQHbXTSR+ZYQtrtI7EiXcTxY/L4AqLMDzm+AgAEX48A=
Date: Fri, 3 Jan 2025 11:35:11 +0000
Message-ID:
 <CH2PR12MB48753B72EFBADAB2107CB9BBE5152@CH2PR12MB4875.namprd12.prod.outlook.com>
References: <20250102163700.759712-1-rohit.visavalia@amd.com>
 <20250102163700.759712-2-rohit.visavalia@amd.com>
 <933eee94-d79e-4437-8874-d34988b97961@kernel.org>
In-Reply-To: <933eee94-d79e-4437-8874-d34988b97961@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB4875:EE_|MN0PR12MB6295:EE_
x-ms-office365-filtering-correlation-id: 469feb9c-87f5-4f41-afce-08dd2beaaec7
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam:
 BCL:0;ARA:13230040|366016|7416014|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?rOrLrYkpGVBc3h6UEMeu3T1fbTtFywFbwKj43LqQNKPuZc7TrgqLmwrr4lO8?=
 =?us-ascii?Q?k78qYzlnXghRTFzzrOhNpAmU2kUTLRoKay174HDbPMlQYqDS6MXXJgUjjZGD?=
 =?us-ascii?Q?kHLDv2RZzt0LYZW4RX6VoHJhAqckG5Hu0+ySwn+x1iRSqVcZhvkm+ZxB4UZi?=
 =?us-ascii?Q?d6ScVpchbZyaroJVN8ED62FZVu8MnkB7TjoM9u+jGX1+T7gr+rjCcNjPfWiD?=
 =?us-ascii?Q?2s7KXT4MMR4Y9eRXxBsbLKsqTC+gg69OEs0VOh7+ewtAI8aOxGaROCr2gO5r?=
 =?us-ascii?Q?Sfagq+I5a5MH6JlMT0mbSU/nZpTN0ELR6MpnkbY91Rr6j62WvPN2K9Y3vTXp?=
 =?us-ascii?Q?6wv4XbqliV3vRWcl4tgKHGZ+jzSyaNBYoDnDjOF5RsCqNCUoOGveE6bTKdkc?=
 =?us-ascii?Q?EIQ7Pp44ft1Jf6JobUXAzD2lwoxJFY5ovcbncMOae4KKrnTAXnv0WHGkhlqM?=
 =?us-ascii?Q?Y1SFTgxnVkmifuma6lHKDXiT/hEBy1u6LoeZfS4U1mpiybdYWzyIcUFVFzVQ?=
 =?us-ascii?Q?h7IzUGAFoK4p9NYMvAYaWrb8h7rGsa3UhznU8a9fvKoLsX7wU+6Zp5M9TvOl?=
 =?us-ascii?Q?rs0Lo/ba03cq0gxcm8kzZRez4mCovXpQ0uzqcnYwaWjCfn4VUo/Wb+XgsbrB?=
 =?us-ascii?Q?QLq5Jy2wMtOfz64WSMhJJ4ziwrBIgFJrdu82ryegRdzqDB7W126tQLg3yAxB?=
 =?us-ascii?Q?8B0+AuXPeck1E1QQeyWS6gKSiqOekVqEPM6YaGJBLGKq7yrCtte3bosQ/Z7y?=
 =?us-ascii?Q?phelnvNf3q6kuUKt8Lo/E7dbF633Mtg3gAmuMDc4Ck80vf5Nkk5XDZOmob4m?=
 =?us-ascii?Q?oArJicPVzit/frVCx0o5o56WWi8xnjG+ci1iip+qbIjU5lkQB/Rbgg5fxqUQ?=
 =?us-ascii?Q?265E4Xt+MxZC4+DfNJNIeclvgjcAtSUkGf+Xprc3rv25uZ4f5asvNjbFz88S?=
 =?us-ascii?Q?rPuEG+gO4N0LsCdn64P10pDkK9xlHpH+sCJxVN5hKP+VESCFKrFp0rvUNox/?=
 =?us-ascii?Q?r3+AcRd2UPpevGNYhMSuOobhz5tavjabziNQyA673uYuc9gN/HSTY3Ev7DQb?=
 =?us-ascii?Q?gfQmybVNp2MzZuGMA9aMTKuw9fGOu8CV/0ri1lVRtdsswrAy7qNg9wgKEYlU?=
 =?us-ascii?Q?4/Ex1CoQ87i1zFYakmZkog3aAdKyzBVzPpGI1hSXbi+fFIEHzaTlXeDF3BFT?=
 =?us-ascii?Q?ZTU3D4eHLt7BZRWUKLg7TUYAhFAA0LM9Kv2CAMzL/xv7xdvFhfy2O5Rg1EWf?=
 =?us-ascii?Q?QDfU3iywMlIsuPQiq22dajfZPJVnKkqfkCbAiedRuBwR6x98npWUhF+YglFc?=
 =?us-ascii?Q?Z14bXfiwtHsXHkCkiO22Tz6M3tieBPHPderkJs9Dxc/EmczT/LHeWNO+H9S1?=
 =?us-ascii?Q?3LrxP2Y7g63mH691qY+tEGyaLreH8jl0vg81uSM40s3ZZN6ZXZ90iuBrlfJV?=
 =?us-ascii?Q?RanWsFcleZWaehDcdgS1w2jEmPLZZYq0?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4875.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(7416014)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?2oaAM4cJtZXue6QgIh3juwL2qM53WwSP2Y0LHP4qlcKdAvuVPz2i+nn+Xydi?=
 =?us-ascii?Q?QcqKk8NvGPvSVkUNL30E0EwHXxWIBvqUOlkdQY3WrFFQCBL5SFSpc1Z2zX2Z?=
 =?us-ascii?Q?CTAASe9yfJgQjAgBZAYppWTMnosJPlG9DBvUsRx4z4juvoty0wnEXdSTmcq2?=
 =?us-ascii?Q?an3M2f7JPTyQVsOeMdF431ft6bimr5knt2U43jLt9hCZw+THf9/E5iAqp4dr?=
 =?us-ascii?Q?O2+QAiHBORtGkRSyUI1Fo8v4eL6kIQ/2KaXeqbFLonVnFQaWXhiFK53THeW1?=
 =?us-ascii?Q?xxpso1nGZna4N2Xy45F3rcjQoMGRBwNaj7lyozt/ADzUgYgxU8MN18pFlCuE?=
 =?us-ascii?Q?MbGkjmLO3bbYOY33+hqdhzfMj65/sTDfF6oNoGN7/GH8i0kNKQq0bgUSzEHt?=
 =?us-ascii?Q?VaNzsDXh4BffumZAv55u4kzxMFo7aFjbyrkSvn/55H2ciAK3BMvmSLUpkqHX?=
 =?us-ascii?Q?lv7+yVJJGCN5J8uDhiHflpori8dJLUmMUhY2RI1OFbxY8hXGpBaARz99i9Ow?=
 =?us-ascii?Q?Pv15niiytt+atu0LawFloZ3mIj8O5W7gNq85EI5RKwZX+sd9hvIO3eIXfHtD?=
 =?us-ascii?Q?wi2L6UyiaO0mNVkYXfkrdawtaRXmui6CdF7tPlfNrbqGAUUj9ewYLP8piH4/?=
 =?us-ascii?Q?IxWzEOqwo0sjqGefCp7L9qzlpnZLRWWgg9hk+GCDDNQbs1Yji8qv8KbZf2mS?=
 =?us-ascii?Q?XC91Sd3MM4+b8ITOpJdYxJdxZ6Mvuo24Ghu8yJoEakbxFyOISMOWXAijAPvf?=
 =?us-ascii?Q?ziBqPnTbN0njM/+LNPqAWyal1BZp2055rUCJnXgNa/A6fH4UNaBFs7xtw6+3?=
 =?us-ascii?Q?u+vk4mXcM+4xfw6yoqZi+Ez8ZHfzVm3xsdwmbQCaQiqc5idriZ0luEmi/LNv?=
 =?us-ascii?Q?NIay2OnPDvvfcTwHIwczAynh6PI16PnrU1jLzqpCADsYn0hPV2HQAkRRECWF?=
 =?us-ascii?Q?pB8hkQIyDd+zud830Y12NSlJj5TWotxLxUiqg9Pm+4vGqELTSL50lEyfkeu+?=
 =?us-ascii?Q?BX47j6NUFwMpuNhAREKlycgJMay9kjOiZcAKHKoMhzSAFTqfv+HSNZdOLwWf?=
 =?us-ascii?Q?ObyLSg5/nvdZqyUYDDCAuIaUPNB1DtnZoQuGWJ1fW5WFo8GZXunucI7F5D99?=
 =?us-ascii?Q?6wM6E40cPp9/hjZiP5brr+lcrsw4lP5kwfY5sn02km/FyjWElV378ieb8vTf?=
 =?us-ascii?Q?j2y/DtBbkovXcY6pFqMy2/IsW2mK3uLFiqUUECGFZKxDFmvXd/nzZKrpVHCN?=
 =?us-ascii?Q?QJFrtr+qp7yjh13I9W8x0jwFi1hVYP7ZvQdQ+ctEv97OkWrWYjoOmX8WST/j?=
 =?us-ascii?Q?hVSzz+71diNXgPMfu/j8lJiJfvKigiKsDf9T1MBHa2NhRVF4WQqHxtlWhcGD?=
 =?us-ascii?Q?H2E8XCH/uOxloM0pQ7J2i8szqB7pkTA4Jv6xgGL24RmP2MHGp4rENsdyobqc?=
 =?us-ascii?Q?fAY/EIdAD3tNfLaYEjhbZ+EdXdECKPjfrJixTn43uZNNRy4sEH/k/iI95jRu?=
 =?us-ascii?Q?rpIzYNQkG5/ZBFnLVdWW1y2vF/E858A5QFI6kKBhXtAVT7geyLHTbQmQXAPU?=
 =?us-ascii?Q?k/gD8pOHNiQYGF8uwj4=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4875.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 469feb9c-87f5-4f41-afce-08dd2beaaec7
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2025 11:35:11.0848
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: QfuKjkVYXIu1MuvDLa1HZ7qq4oTMo1iLadIDoQ+M0xB+52yFCCB8l8P72h39nY0AemEG7pMkUPYr4r3KZS7qGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6295

Hi Krzysztof,

Thanks for the review.

>-----Original Message-----
>From: Krzysztof Kozlowski <krzk@kernel.org>
>Sent: Friday, January 3, 2025 12:01 AM
>To: Visavalia, Rohit <rohit.visavalia@amd.com>; mturquette@baylibre.com;
>sboyd@kernel.org; robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org
>Cc: linux-clk@vger.kernel.org; devicetree@vger.kernel.org; linux-
>kernel@vger.kernel.org; Rohit Visavalia <rohit.visavalia@xilinx.com>
>Subject: Re: [PATCH 1/3] dt-bindings: clock: xilinx: move xlnx_vcu dt-bind=
ing to
>clock from soc
>
>On 02/01/2025 17:36, Rohit Visavalia wrote:
>> From: Rohit Visavalia <rohit.visavalia@xilinx.com>
>>
>> As per commit a2fe7baa27a4 ("clk: xilinx: move xlnx_vcu clock driver
>> from soc"), xlnx_vcu driver code is moved to clock from soc, so moving
>> the dt-binding.
>>
>Drop commit, does not make sense. Just move the file during conversion.
Sure, I will do in v2 patch series.

>
>Best regards,
>Krzysztof

Thanks
Rohit
