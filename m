Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2052.outbound.protection.outlook.com [40.107.93.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB691C728F
	for <linux-clk@vger.kernel.org>; Thu, 21 Nov 2024 11:49:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732189793; cv=fail; b=nM9dzxjJAaSeDcXNMVLKR9Q8jX3fLY3+Gh2KADDaSh3Yi7VbLOkrPEo3oJiUxcnv2rhRyOV2QzlJb4YERWS+vmMZjnCyALvFsOthpFhKUziKjbyMDNkzCMcJT88oqnfhNWif+US8v2kvebcOJsYm7Xz9pNxxOjZjjWC2ccSbxBs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732189793; c=relaxed/simple;
	bh=lPhiOGp1Io/6TURyER03lJmb+sthSJKWSHz3cjx4NTg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=VVr4WWRvk2O786PucuGC0U5SVuL7K5yVEmk0bJacTDrrM+7QFEbrn/b5q685Lj6znQ+3Jyw356BuurK2Bw13GjEd21eI+rvn17R+Izch7EVovPmkISjBkKgr8P0eBhyZwl9EpV6CbJsloDr4Vjp3FE6JFdmieRHCysujR0Mmfeg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=bL3QtjiP; arc=fail smtp.client-ip=40.107.93.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="bL3QtjiP"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ottmQevyRNNWhTqnR+/3U77EO3XPl2C5yJW80eZ+nrLZBdh2lwDKNeixTHonUzMgp6+bmAWZsUG2dIIwl55vcACCcMC7hBJ2a2RV1SF3ujJSLAX2uh6zWIeCUTZPdLPZndzwll0woPHLP18P0Km+rVkvV3ypU+/lfNZG/AvwX48lzTaGf/wi8YNIlOA3KU2UxOA9UP8BtjRJ4JO0pOErcJbfCMTkLzf+cOY76/GtZN0Jihap+R94LV6BJoMSXSragh/nqDgDNZmSjuGqYv095DY9Ch2nEKGtsi71wDPRQNSjZALs/A6WQKvY1ergMxH2MPsN1+GWiAtLGfZUIxkHdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dmt/n1//ZVes1IZPUVe6vvlWttFCKAZ3X0OHnxZXpVM=;
 b=hInru52rDWNqRJS585YA0TU3QUdw9k1m+icgtH2iTA1Y0ASgR3uNRKV13aWN+nK00sab5LcbeuxoBtgz5MsrlvjdyUAZiXfutLvnYvsBAu1i7MjsP13Z2NiUuNtjpm0Ur8Lal+5ecawNJ/28FSIDSMlttyQSHV6jKXsYbLOyf+cSn+R2fFmMxKQAmSctb9Ex3yMqd6158TJapi95Wp/4F1d5shhveKLmwNS6+Sz6Mgz9YrGr6AHnM3tsk0iiWRh9o8ZBKynLmc+301FS7LiTBrKIStLELbADnx2Hix9EgnM3gnIE6MSRmyi1DxAXQ3jJ1yBS+NgBJXUPjrqgvV8svA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dmt/n1//ZVes1IZPUVe6vvlWttFCKAZ3X0OHnxZXpVM=;
 b=bL3QtjiPAe4bSHoR5hYMzOksp/ihVOmYwhV6LcgRp5i5glUE65DpFrWHHQ1Wgi75t8df3+2oWmg7JX+WF9HxkXQkdwtxmqnZkiImkL6bi4c4UBlj7MMonB0t1NzGwL6RXYL2nfUGC0rUIsuLdwcEeMoxI+BV0YXPyM1jy/zOdhY=
Received: from SN7PR12MB7276.namprd12.prod.outlook.com (2603:10b6:806:2af::8)
 by SA0PR12MB4494.namprd12.prod.outlook.com (2603:10b6:806:94::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.15; Thu, 21 Nov
 2024 11:49:47 +0000
Received: from SN7PR12MB7276.namprd12.prod.outlook.com
 ([fe80::4ff7:c17a:b7a9:6c94]) by SN7PR12MB7276.namprd12.prod.outlook.com
 ([fe80::4ff7:c17a:b7a9:6c94%3]) with mapi id 15.20.8158.021; Thu, 21 Nov 2024
 11:49:46 +0000
From: "Trivedi Manojbhai, Naman" <Naman.TrivediManojbhai@amd.com>
To: Stephen Boyd <sboyd@kernel.org>, "Simek, Michal" <michal.simek@amd.com>,
	"Thangaraj, Senthil Nathan" <SenthilNathan.Thangaraj@amd.com>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-clk@vger.kernel.org"
	<linux-clk@vger.kernel.org>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>
CC: "linux-kernel@" <"vger.kernel.org linux-kernel"@vger.kernel.org>
Subject: RE: [PATCH V2] drivers: clk: zynqmp: remove clock name dependency
Thread-Topic: [PATCH V2] drivers: clk: zynqmp: remove clock name dependency
Thread-Index:
 AQHa3DFjsadbNYIEYkaS7Q2JUnj/tLIeEaqAgAWcUdCAAF+UgIAZ6KrggADdaQCAg4eWMA==
Date: Thu, 21 Nov 2024 11:49:46 +0000
Message-ID:
 <SN7PR12MB7276EE2CA7208EBF7391F2858A222@SN7PR12MB7276.namprd12.prod.outlook.com>
References: <20240722121910.14647-1-naman.trivedimanojbhai@amd.com>
 <ac67f76d4b4b5f4bf108c1457f1263c7.sboyd@kernel.org>
 <PH7PR12MB72845D56BF4361441AA9CB9A8A852@PH7PR12MB7284.namprd12.prod.outlook.com>
 <1234a0176de236abb603f96ab9a1d6a1.sboyd@kernel.org>
 <PH7PR12MB728472C3022ADCD8DF5576DD8A962@PH7PR12MB7284.namprd12.prod.outlook.com>
 <7f295bf3b095bace843c28adc9941344.sboyd@kernel.org>
In-Reply-To: <7f295bf3b095bace843c28adc9941344.sboyd@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB7276:EE_|SA0PR12MB4494:EE_
x-ms-office365-filtering-correlation-id: e8f03ccc-cdee-47f0-f2cf-08dd0a2298fa
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?CNRd3RvD3yBVg61aWQEHtxVNdTAwKABZdn1NpA4vgCR1zFB0m7u5jIq7+lCH?=
 =?us-ascii?Q?29+PCdlqgsE2+9chNUyW5e7q4Ssv22HLrOxu1yypRGe1QK8bmQHIIhdpSKq/?=
 =?us-ascii?Q?gXrCV2ERmv1ogtgrwSwj6PKbyS/oyo4sQh/Y8dzHoEuZXxmRs9Z3XB7xnp/C?=
 =?us-ascii?Q?7EBqvX7XjVjnxGT4go6cvybZmr9AAxBMchODZt+qODzyepbiPSz8+bds+Rf4?=
 =?us-ascii?Q?Mtd0+VWFAeTj29PVLbN6eW1pulJ4CQ+jKuneNDw1Wb5o38cu8th3lq+Yh91I?=
 =?us-ascii?Q?nGbadJxQWVsxxy/I3o07rJH/sFwtLAIMGBH/7L9iwEbkFRvxabZYEsjqZruJ?=
 =?us-ascii?Q?YTDqqcw1pKBjqh9Y0I4Lu+tSlLt1it0gTyB9dtOxNNbJiGyvAjyfGp0f4X8r?=
 =?us-ascii?Q?x8o5ft8bvdHUkmGbNz3Qdi9EP0/81+OSmarxO1bteySu4ybajSl1ZA2L7TQx?=
 =?us-ascii?Q?1xkv/DCoA0GyfUtO50JHQEpc+WfS/Xw94UPoQZGqdHX3rDXF1FketnthkXY9?=
 =?us-ascii?Q?dsMJ4FtHcMzuKsgfnoAktpHB3WRnzbWd9quvfvg2+h/xAGyh8vRGNb6KZvc8?=
 =?us-ascii?Q?DT/VqanO/9l9tZO8uTmsLt02Y8FO6flNd5MgmNNNC1RqzGSQcLHsajA1qh+j?=
 =?us-ascii?Q?stXKSNL8xS5Y/2/QJdsk6dFqGwZOsrmgG0VmGjXi78DeAyEH7iZZGHvSEbv/?=
 =?us-ascii?Q?qHurt/u/VH5wzUw6IDjWU/LwPE6U/W/dYbStKSJePsYERg5ARhLl1acDKj8e?=
 =?us-ascii?Q?F/Cicjtg/SOoFTcsFVgiXVLI9AF/2gWpdxJ3PTOHZOtHfB5QJgY7J5ze/GgD?=
 =?us-ascii?Q?GcLBcYz1+gBiqFdzMAccA63xG27OGmGDbNIL4jsPZ5a+rUbafZs3UORbufgF?=
 =?us-ascii?Q?MfQz43QCmLlyp/tz1srAkir6+IwhqxXF0lcDBnksMS9TK7ql5LKRh3b5Lcpa?=
 =?us-ascii?Q?+m54fy0CMSoEK3/kPEqChyCqGEjPNog6bYtY42r9H2RGAg4JuasF/KQmFa+i?=
 =?us-ascii?Q?a/Wd4EQyjVD8qO7eHUTzrurBgR6aE5XMoYF6RFXln7bDV/gcpL9mZdJ3WiPX?=
 =?us-ascii?Q?XAMacdKEodiVMxcSWT0ZbXbyyBdktAgsKWxZ1LgCz7oc/CieTK8Kva+XAMXe?=
 =?us-ascii?Q?dQPNuxUUrplPN3R1y611lGvJ/4nTxJ4V7HRmfobluksVQSG+v5x352to6ssV?=
 =?us-ascii?Q?YsDMD87ugYFXglOTpr51nmzYMrdqjD6Oe2FgaznWLJL9Fjz913ttBIste2FP?=
 =?us-ascii?Q?8PrpDN4xOYWi74qDMFoJhtOGhf7/qi55L82840SSdmqLT1qPRL0DuRgx1jQD?=
 =?us-ascii?Q?bFeZ4FsjGpCPaO4WTi+eEcs7?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SN7PR12MB7276.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?8xt+n097X6/7dqzcXK3IA8Rdtv+TQl9uwIdxwT6hAR/7UwijRCL7wmQCMJIa?=
 =?us-ascii?Q?8W+AvRG4/xlW3KwJbOxCgUt3TFFW/B63w25VazRv8ZTOzPD7GGtNkRLTFjrf?=
 =?us-ascii?Q?PwSRsPY7THqe6CEOtayJr7iGCPCT2fy3ZXvBTR8fCMrgTcTjjlBtIA4XgSpD?=
 =?us-ascii?Q?3GpGvnkCmaiRDe0wHLg3yvjqdNRcy2lNJ9NBL6Igz/C4vmUI8/vEjUyYB8ZN?=
 =?us-ascii?Q?536PPOG6b1Nsdoy5ZgEQyT3zGTHb2rrqWZuwBsGi8uqi07TTsB3CU52h3Ft1?=
 =?us-ascii?Q?tQZFDTLu+D8fCyHUjHQDC9QwbAlIYFERxwnbhrAfPUEaZZSSQpOY4jTgSpxk?=
 =?us-ascii?Q?zIoCCs5sERkAviI5B+fayWuM/udGQ+CS7RTw/Q0gZaShFOb/tAI58zzCj+g3?=
 =?us-ascii?Q?2TmLbYGZEbZEj+QmfHqITXb+nA5eyjnrc2bFGsfHm6z8IBTkiBntKNZ0/2iY?=
 =?us-ascii?Q?Y/4bZqEiOf7eKcx0CUp9pu33sGsVT9GPz9qumF15g8xgroqft53FpdT2zc/x?=
 =?us-ascii?Q?OlJTowtY6536wQCB6kjEgKbo/WH823D82gwy3wM7xIR+Ti8P5GmqgK6Cu3Xx?=
 =?us-ascii?Q?unQnUtsJMDCxFrhL+2dlxbdTEIIUj+x1uToxh4Py5vtMxD8mxJbrrU8UE4hY?=
 =?us-ascii?Q?o9GS5OHaSrPRiSFXvvpaBjMrgUbOGX9zkwTJTBh4pSG9cUWE3JTTu/h87D1S?=
 =?us-ascii?Q?dCDSqHdwPwv8CXAWirsWF3kQ+wYDybBIvIjzOx9kg0/QZXKfNYYx5Ql3vRPj?=
 =?us-ascii?Q?fuikuCpTvL0vwHeMsXmft5z42LKMz7/mvavOpNXVAD3fyc2lQ1OpRsA6GBqN?=
 =?us-ascii?Q?dbWRKpSpjN6tEKqi+4wwpuWb0vyspLFoSDWj/r9hncvskg2e+2pIEdMb59w7?=
 =?us-ascii?Q?jzgvw2sIOqj6WL4Ccp7J+s4sUWP1yJ5or4VWEijnGSxrtAZWv4GA3nvL8gVH?=
 =?us-ascii?Q?oPcztdFSKMCteTvMTiN14E9hq5FvBj5EkbH+9OsBJih3pvQWmQQQcp0eP03w?=
 =?us-ascii?Q?kinU8Zex/9U2KjvFpDYyEK8z3QYhneLe0R7AIf2wvunoNswH5/e2ms+gkOHa?=
 =?us-ascii?Q?s/pCoqZEoPYquJkAxCHI0RtdJELdC78HDPakYdEF9QS7n0cAcoFEXmxXruku?=
 =?us-ascii?Q?4jxrEvWiK6VhKEGLL5ZH7N7u3xj2g9r0xOrlDNYMk0L/TMIFKNPAQX07cIKX?=
 =?us-ascii?Q?XuXcarvvPCg5whjv5DtAwWSQyXKoDtGIocliFHH89G7AeEmePVFXe0rqR1us?=
 =?us-ascii?Q?zpZLQHjEYwicqKtsQsOafbryzNjK21cGll6RasgQxoADIFD+8+sCXTa0pp9V?=
 =?us-ascii?Q?hS+kyZ/KZdOddjR6lDwstcyGsRZix8y0SmF0tZTWiXj0/zYa11b+sWatW9Wd?=
 =?us-ascii?Q?rIKXjJitfUr8ocgerKk1Nfqv/tvmHyzk1mpS8nGFP4FHxwCxEwcjchH1JyBd?=
 =?us-ascii?Q?afw3b4IPgoLaESgsTMG3qcO40eumUm5UnJrRRDyZdZe7P/akO9Ao9j+Jto/h?=
 =?us-ascii?Q?mK+YlKE1kDOpbXNaMq5ZPFLdjpIv8eH225Z5ItSqd22GE3K2w6LBUKYSVva8?=
 =?us-ascii?Q?BaIuCHWwdBduWVSgDCU=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB7276.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e8f03ccc-cdee-47f0-f2cf-08dd0a2298fa
X-MS-Exchange-CrossTenant-originalarrivaltime: 21 Nov 2024 11:49:46.7727
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5qd1lmAOwLtQBErT/K6B7GzYWodTVbJuF/fmeWCqHdmKPQRY/6MPiHZr1t6UzbQf
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4494

Hi Stephen,

While debugging further, I found that, CCF registers the clock by their nod=
e name if the clock is present in DT. This was causing issue when the clock=
 node name is changed. By adding clock-output-names property in the clock p=
rovider nodes in DT, it ensures output clock name is not changed. This DT c=
hange is sufficient to fix the issue.

I have submitted a patch - https://lkml.org/lkml/2024/11/21/412 to fix the =
same in DT.  So, the driver changes which are part of this thread is not re=
quired.=20

Thanks for review!

Regards,
Naman


>-----Original Message-----
>From: Stephen Boyd <sboyd@kernel.org>
>Sent: 30 August 2024 00:33
>To: Simek, Michal <michal.simek@amd.com>; Thangaraj, Senthil Nathan
><SenthilNathan.Thangaraj@amd.com>; Trivedi Manojbhai, Naman
><Naman.TrivediManojbhai@amd.com>; linux-arm-kernel@lists.infradead.org;
>linux-clk@vger.kernel.org; mturquette@baylibre.com
>Cc: linux-kernel@ <"vger.kernel.org linux-kernel"@vger.kernel.org>
>Subject: RE: [PATCH V2] drivers: clk: zynqmp: remove clock name dependency
>
>Caution: This message originated from an External Source. Use proper cauti=
on
>when opening attachments, clicking links, or responding.
>
>
>Quoting Trivedi Manojbhai, Naman (2024-08-28 22:54:16)
>> >> >> +566,30 @@ static int zynqmp_get_parent_list(struct device_node
>> >> >> +*np,
>> >> >> u32 clk_id,
>> >> >>
>> >> >>         for (i =3D 0; i < total_parents; i++) {
>> >> >>                 if (!parents[i].flag) {
>> >> >> -                       parent_list[i] =3D parents[i].name;
>> >> >> +                       ret =3D of_property_match_string(np,
>> >> >> + "clock-names",
>> >> >> +
>> >> >> + parents[i].name);
>> >> >
>> >> >You shouldn't need to match 'clock-names'. The order of that
>> >> >property is fixed in the binding, which means you can simply use
>> >> >the index that the name is at in the binding in 'struct parent_data'=
.
>> >>
>> >> This driver is common across multiple device families, and each
>> >> device has
>> >different set of clock names in device tree/binding.  This
>> >implementation seemed to be generic for all devices.
>> >> To use index directly, I have to add if..else for matching
>> >> compatible strings
>> >and more if..else inside each of them for matching clock names to find
>index.
>> >Please let me know if this is preferred approach.
>> >
>> >It is preferred to not use clock-names and use the index directly.
>> >This avoids a bunch of string comparisons and makes for smaller and fas=
ter
>code.
>>
>> Agreed, using the "clock-names" adds string comparisons, however, two
>reasons why I think comparing with 'clock-names' is necessary.
>>
>> First, the clock driver is common for multiple platforms. And all platfo=
rms
>have their unique DT binding.
>> So, clock name to DT index mapping is platform specific. Which means the
>driver will have to hardcode the clock name to index mapping for each
>platform.
>
>The clock name to DT index mapping must be described in the binding.
>
>>
>> Second, clock parents information is received from firmware. The parents=
 of a
>clock may or may not be present in the DT node 'clock-controller' as many
>clocks have "intermediate" clocks as parent.
>> We don't have DT index for intermediate clocks so need to register by
>fw_name.
>
>If there isn't a DT index for those intermediate clks then they should be =
using a
>clk_hw pointer directly. The fw_name member matches an index in the clock-
>names property, which has a 1:1 relationship to the DT index.
>
>> For example, below debug prints show parents of "spi1_ref" clock. It doe=
sn't
>have any parent which is in DT.
>> clkname: spi1_ref : parent 0: ppll_to_xpd
>> clkname: spi1_ref : parent 1: npll_to_xpd
>> clkname: spi1_ref : parent 2: flxpll
>> clkname: spi1_ref : parent 3: rpll
>> So, here we need to check if the parent is in the DT, and if not, regist=
er by
>fw_name.
>
>If the parent isn't in DT then it can't use fw_name. There seems to be som=
e
>misunderstanding.
>
>>
>> The zynqmp_get_parent_list function iterates over the parent list for ea=
ch
>clock, check if the parent clock is present in the DT node under 'clock-na=
mes'
>property. If so, the driver registers clock by index, else register by fw_=
name.
>>
>> Because of this reason I believe the comparison with "clock-names" is
>unavoidable. Please share your inputs.
>>
>
>I think what you're saying is that zynqmp_get_clock_info() is building a
>topology description for clks that the driver registers. But some of those=
 clks
>have parents that aren't registered by this driver and are external to the=
 device.
>The zynqmp firmware interface is string based, not number based, so you ha=
ve
>to keep "clock-names" DT property.
>
>That's all OK.
>
>You don't need to parse clock-names for the DT index if you take the strin=
g
>from the zynqmp firmware and jam it into the fw_name when the parent isn't
>a clk registered by this device. When the parent _is_ a clk registered by =
this
>device, you should use a clk_hw pointer for that other clk to indicate the
>parent. When it's a mixture of internal and external you use struct
>clk_parent_data. When it's only internal, use struct clk_init_data::clk_hw=
s to
>avoid even considering having to parse DT.
>
>If you want to skip the string comparisons in the clk core, and I suggest =
you do
>so, you can parse clock-names once, find the index for each external clk, =
and
>then use that info when building the topology returned from the zynqmp
>firmware to mark the parent as "external". Then when you go to register al=
l the
>clks you can use that info to build the parent_data or parent_hws structur=
es.
>It's unfortunate that the zynqmp firmware interface is string based, but I
>understand it can't be changed.
>
>I looked at zynqmp_pm_clock_get_parents() and it looks like it's just a bu=
nch of
>numbers for the parent descriptions. If that's true, then there aren't any
>external clks at all, and so clock-names and clocks shouldn't be in the DT
>binding and you should just use clk_hw pointers everywhere.
>Did I miss something?
