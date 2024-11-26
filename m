Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2043.outbound.protection.outlook.com [40.107.100.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8153D653
	for <linux-clk@vger.kernel.org>; Tue, 26 Nov 2024 05:25:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732598754; cv=fail; b=AA71NLkRNOsPKuBaDZf59mDEUXKFyzhdbwQ+Hj6gbHWwrIYqwZ4EBv2Ks5i3W9+h0sulb1VMuXDhwxe6Prf5+LUyV9bZrsFh/ur2b2/GJn8mbso2Y843K7CEvyoahngY7/VY/IE8lOyTtjR5ajNJEtzVao5GzT3I+Q8dZGbY6Kg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732598754; c=relaxed/simple;
	bh=/9We1UF/CJ6JOnskxEtfVxImUKNwym0qHXdQ8CMhAxs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=ik7jQFXV5UrAw5tElZQM3DeXUra2e5XBC47q4Wq53tRumVel/BxodqgJjG5w5sL2GvOEoncZtHFmhT0I1xiL6GR8amssUYKMlwis9jaDAvnnitKS2uzf6aZ0rNkDSmIO5/4+CjwPLonaEnOGJAHENAv6OpjUuhJlAyUf+dfvvOA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=gbtgY+c9; arc=fail smtp.client-ip=40.107.100.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="gbtgY+c9"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Z5Slf0pYQvl7QUb8LIW11bkoEvwrXfB3KqIX18L4677R+DIyJcr98Y9wh7oqJy7oGxn6geisEQEjlYd8UDkESJ17knH2NSIH4M/ZHnAojE87pHxhW+c+D3Nlxn/POvzHarWy6VM2Gnf/yKLZWClUC2abHN/7nyvQXojavuq5TbTYHujcsyocfJ6szDbru9gTGHAogEpg8MveY+SVNDIEpPzW9W1V3F9t42MQIBDefaLar8/GYRFUdcXzwr+0sP1ajIjhtrG8wMn7veOtMjypNy6f/1Sz4ps15NrzaCM/4AiIOYcczOKHBoGcNbylXT/aR5FS/XyEF5/oP4tgTbgkhQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/9We1UF/CJ6JOnskxEtfVxImUKNwym0qHXdQ8CMhAxs=;
 b=rNJHjbxUrdrBvfIbpfNlHiiaWnmP8fxA4zMSbbBRSjQrkhSQkDlU7j5lHDJ36BBUu+cllV4OtYymYqLZRCCzxHwE9el2W8E1OyJ4C2GfQhil45TGrp875nzmjH7bHBq+6HlZMgQ6DXw9dtVwlUoqeFa1ZcLnN/349fdfq6xrlO02WNbCwuRz7i3O4+WvNbGNrRsPiZWw8HLNX1p13Xfxxv1zX4mTBhkEUClOJrmRODr3GYItmJl1b5dm52H+VaQL4AsT1mtwRfJ8bpTZvTlMvlOOERkZWSEuoEX5NPLE0Nasw7jccaBGCqygPhYvEIgUDwP7e17ZiZpaaPZklXz3VQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/9We1UF/CJ6JOnskxEtfVxImUKNwym0qHXdQ8CMhAxs=;
 b=gbtgY+c9oAwA7xcPYM6kKErcp0Q5cxDMhpcoMadiUEzdc/lMZMkLscUWwuLJz2wYN7bs/ZSVUi/x5B1H51kLZvicE46C+1iP+GlorgHPVecsLbW9oGzqepgrxWXU0yY/0RmoJrRHHs2bVlXwkD3J78hEkWlG5Cr1mwh6Yo17Bjg=
Received: from SJ0PR12MB6965.namprd12.prod.outlook.com (2603:10b6:a03:448::18)
 by SA3PR12MB9157.namprd12.prod.outlook.com (2603:10b6:806:39a::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Tue, 26 Nov
 2024 05:25:49 +0000
Received: from SJ0PR12MB6965.namprd12.prod.outlook.com
 ([fe80::84c6:8bb0:913f:5dd4]) by SJ0PR12MB6965.namprd12.prod.outlook.com
 ([fe80::84c6:8bb0:913f:5dd4%7]) with mapi id 15.20.8182.019; Tue, 26 Nov 2024
 05:25:48 +0000
From: "Gajjar, Parth" <parth.gajjar@amd.com>
To: Marek Vasut <marex@denx.de>, "Sagar, Vishal" <vishal.sagar@amd.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC: Michael Turquette <mturquette@baylibre.com>, "Simek, Michal"
	<michal.simek@amd.com>, Stephen Boyd <sboyd@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "Allagadapa, Varunkumar"
	<varunkumar.allagadapa@amd.com>
Subject: RE: [PATCH] clk: zynqmp: Work around broken DT GPU node
Thread-Topic: [PATCH] clk: zynqmp: Work around broken DT GPU node
Thread-Index:
 AQHbNEa09tdAgT34LEiIIhKVflEmnbKyRBSAgAFaccCAAHQHgIABIReggABv34CAE3dV8A==
Date: Tue, 26 Nov 2024 05:25:48 +0000
Message-ID:
 <SJ0PR12MB6965E6448CFB1095584B114C992F2@SJ0PR12MB6965.namprd12.prod.outlook.com>
References: <20241031170015.55243-1-marex@denx.de>
 <dd4cb501-5fc7-4430-9ffc-9c8c910df425@amd.com>
 <4ee8d8a5-ec00-4b11-a7bc-4137e1982218@denx.de>
 <SJ0PR12MB69656066F70FC40E4A5A93B499592@SJ0PR12MB6965.namprd12.prod.outlook.com>
 <638cdca0-05ba-4b2b-8a92-3041247c2c7f@denx.de>
 <PH7PR12MB69557B0065EE5D4E51EE13FF995A2@PH7PR12MB6955.namprd12.prod.outlook.com>
 <14d05680-3112-4ad6-9d4c-e892359fc9d4@denx.de>
In-Reply-To: <14d05680-3112-4ad6-9d4c-e892359fc9d4@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB6965:EE_|SA3PR12MB9157:EE_
x-ms-office365-filtering-correlation-id: ec60e6b3-0a72-49a7-3ec8-08dd0ddac8ef
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?ZmJDeDZMZCtNYU4rOHBIZzNQM2lCcnhFbFJPZVB5MUhpV2s4ZGh5YUJuQnAx?=
 =?utf-8?B?aWRCRDduZzM5NjVnak5uQmFDcWh1aUpQNjlwWElHQVFzMmFGVHVmQ1hheWFh?=
 =?utf-8?B?ZVhsdUFEQ1JjekhmMXIxWW5XU25JKzhOVUpFQmxlNTBSblBnWnR6eXJaMkRW?=
 =?utf-8?B?QjFrWDI4NktxSi9OSy9vVU5nOWFFU1FIS2JuV293SjlwYk5aTlpCQ3MzZy9X?=
 =?utf-8?B?TDlhVnZQcmFZcHVleENTYlFvWGFGT0lSNVo5OWRaTDBlc0FZdXFKazFUVEY5?=
 =?utf-8?B?Ukw5MW5HNGdkYi9jcHBwNE5CWEgycHArVTNyVkcvWHE5TXJYN2ljc3YrY2NZ?=
 =?utf-8?B?ZlZVRzRtanNvVlFYYjBYUzltSmowc3k5bU5GajE4VmpjNmwxNng3YnAveHVp?=
 =?utf-8?B?YUptY3lBZWxPTUxqS2ZUQnQ0ckVnQ1ZMcmlhL1VTOXdweGljVEVicHUvN1Rr?=
 =?utf-8?B?L1V4ckNCWlpVdENuZXh3K1RDN05vT01YdzJwY2FNSGtuSk1RZTRyV09xV1I5?=
 =?utf-8?B?T2d1ek9hdzZmZkl4WlNTUTZHZW45Z1VCYUErWVVJRGJLYW8xa3I5TmZCRVRE?=
 =?utf-8?B?WEx1T2V4R2tBZ2NiS0c5VWp4bTkyamV6Z0ZVR0lSRzhuK3B6czNUZWpCMndI?=
 =?utf-8?B?RkRDT20yazdWSkNJaXlNMWNSalhubzRkMldLQ1NXUnMxaWdNditPYUxMTjJk?=
 =?utf-8?B?dnJpSncvemJ4blJ2WXRSOWs3V3VnNGh0L3g4MmRqdC9iTCtEMVkzTVZXbVQy?=
 =?utf-8?B?ZjNtWXVlUitHdGJaazNwSkxSb3BPakJCRjI3ZnpPTUxmeWc5SkIzc2M5Yks4?=
 =?utf-8?B?ZGx6ckVFWnV2NDJPY0g4K3NRYnM1Y2RDcjFMNFFMQnNFTFlJTEZaU3NMd3RK?=
 =?utf-8?B?VkwvWXEyRkVQNEJ3Q1NFVUlQVHQwcHhPR2FxT2U1N2V3cm10ZlFNb1hGRExR?=
 =?utf-8?B?aWVJOUh1SmlZYzdzRS9UMjF3Q2JZUklUL1B0SHhESzk3WVZtOUhlcVpDYmdC?=
 =?utf-8?B?cm1kZEMvdzkraXRnL1BoZGppSVJJNVpzbVU5R1IxVEg4eXY5WnFXKzc3UUN4?=
 =?utf-8?B?N0lUTktycEVMSnRweVNvQlUyNXl1WGZRRXIvOWFwcU9iZXp2d0tqeFJHTjBR?=
 =?utf-8?B?NnZ5MytOUEgxMTVLZE1XSlRZMXFObEd0RzczVUQ5OFptSkdxbzdWUW1uL1VG?=
 =?utf-8?B?eS9rTDBMVm9yTDlVRFQ5bDBYYlVaaFl2d0pBR0ZaVE1UZmNJWXRnWU5mWGJ5?=
 =?utf-8?B?dVRtUHhJY0JBZXZyQzd3dVpYVXlZWitUbjFSUWtTNnhBa21uNjFEN3IwVHlE?=
 =?utf-8?B?VFhqb0tqdUI2eUxvY2JBS2VudGRDTmNrV2FyUjZycStUeitBaEdkZ3djaFRp?=
 =?utf-8?B?WWpZYWZtdTlrY05ZT204dDg1bTNWaWxFU0VRNnYxYkZqYUxvK3NMaXhKRnRG?=
 =?utf-8?B?NzZmZ0JXTWFmQXYyWWkzVXI3YVNGYU9hZHhqRGRxNzZMUEp2Zm81bE1ySmZ1?=
 =?utf-8?B?Z3oxNlJ5ZzlYc20wT0YrRk9iREpIQjFJcC9pQW1lRmNQT21CUXZEazJ4ak9S?=
 =?utf-8?B?dkJrTEE4TXpmZXV2Y3p5UUFzWWJ5SHZYRE5nT3VrVHlCdGhqcDhGVEhUVnd2?=
 =?utf-8?B?RzQ0V0xob3pENHBjb3ByU3ViREhNSEYxWEN0d09nM2c0Ukw2T0o2d2I5dmM0?=
 =?utf-8?B?YkE0Qk5WR0pVV0pySXlSWXRCa0ZUZ0FJSHB4bFp4emFidlhXSkZ5WDhHRDNO?=
 =?utf-8?B?a2hQSkRXOEhtZEIraG9VTDBEV0Y3TGFmUDJaNnRydk9MZGxYZzRkNzVVUXJ3?=
 =?utf-8?B?Unl3b2ZSc2l4ME9UTFV3YmllRzhMMEtWZXdIRFFEUkxrR3NJZURCNklDLzVw?=
 =?utf-8?B?UTcvTWdWZ2FZbXgyZ1R3WkVKS0tPUjFZT1VSeHZHWHVyd0EzRHdHK202VW1U?=
 =?utf-8?Q?R8jNl1Sw2FY=3D?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB6965.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?clpYRmhHQkd0WFlpQyt2K3VJYlBFYityVlhEelVDa3ZBcGF4OUhBZ28vOU02?=
 =?utf-8?B?cmdjaEY5Z2hrUi9CZ0dBUTAzYmdDblBuRkIwVUJoelpxdGRLSUEwYmExQWt6?=
 =?utf-8?B?UlZCbDEybUo5Nk5tTElPQ09ZNUNIRkZtQWtaMGU1TWZHbCtnVmwzUmd4bHli?=
 =?utf-8?B?TzdYaGFDZENWQi9Od25URTl1VTMvUXd3Si9GeGFzNGFJRmE0Slo1UGE3Ykp1?=
 =?utf-8?B?NDY1aHdCc3ZpUDZDZzFHV2RjUW5UTGd3eGtXSmluQTlGSDRoN1pQQ0pHeXVr?=
 =?utf-8?B?Y2dkMFZXQ2ZUOTlWa0YxWHNFWkRFK2FvMTZZYlN1clA0eWVQRFVLUmthcC9G?=
 =?utf-8?B?UnV2WHBOWjNRaFdQakVOcS9rd210bmQzcEE5NzhWNFpYNmZkdWI1aHpza2h6?=
 =?utf-8?B?UW9IRGg4dGc1dDdMV0JGZlZzNnNsbXRBMXNKTFNJSGo2Q3BWQy85cFZFUTRo?=
 =?utf-8?B?cE1NMGlSTkdhZytLWW8zTU5JRlhNTWNyeEFTVUdVbnBWK242NjlobGRBSDZz?=
 =?utf-8?B?ekdReUxsYWNOZnh5Q3lmU1FVZmVPblVpM3VOQ3hSVDZuL0ZSZ3RlWGQ4OUx0?=
 =?utf-8?B?SGIyTW9DZlZ6ZEs4NFg1KzdHTFY5VTVvQW1pYXJTUFJvVFdCRDlUNlUzcGor?=
 =?utf-8?B?Ny9LbkdEQ0tWM1hoS0d6VUs4NGdzSUsvMVdVa1c1b1R4dk5nSXBMWC9YQXhN?=
 =?utf-8?B?NTVqU0dENU9XNG5hQmxnYURiZUJPU0JuSEJ6eG9NU21ENFRFUHorVUlMQXVF?=
 =?utf-8?B?UGFscU13YTA4VCs3bXhjYVlVNzAwcEN1WmZmR1dOK09QL2pqTjFEajlqWWlU?=
 =?utf-8?B?dnhHcFFPRUcwalJ0NUlEdEh3ZWhyb0hKOUlNelJzamJMbk1MYy9SaXVWMlFI?=
 =?utf-8?B?QVNIU2w2U3JyRUVLOXZQNWpEUlFWN0lIZEgrR29LUXVHYW55QVVENS9kKzJI?=
 =?utf-8?B?eWxya1ZFR2VQQVhRQWQwWVRMYTZrZ1gwNkpzRUp6YTh2aGMrNTZuYTAxa3px?=
 =?utf-8?B?SG4yU2pqcFdLWTZWbFEzV0psdE9BU2tORGpMUzBmbFF5SDdnYWdtYzA3K01R?=
 =?utf-8?B?aUdHbFVydzYrdHFsR09MY2ZtN3N5eVQ4NWJvUG9CSWtYSW5yNDdNMHFlWitG?=
 =?utf-8?B?dlFlVTNxVHQwUDJxQzFqWG13TnlaNmVmZVd2RWNlanY4S3RGeG9RODdUeUNR?=
 =?utf-8?B?MllWMlZzSzVNcDUvcnlsVENYejk3SkRwVThjK2JEVW0ycXE4dVYvUzFDRTdS?=
 =?utf-8?B?SlVUWmZvREFQcHRGbEptcjJHa2lJVndPTkZiTC9hM05HalBQZzBSdk52YkZ6?=
 =?utf-8?B?b0YxWDlKdzlNdTN6ZEF2ZEFaNGNEd29OWUVhYXdwLzI5Sm90YjZMeGZQQ0s2?=
 =?utf-8?B?Vzdza2x0V1VEWXAyVi9yU1ZFQUU1dFI2V0ZlQjNhWklGcU5vTW8xdE1VN3lD?=
 =?utf-8?B?VXRZZDVoc3RYUmxXbXltNUpFdnRMT3JITnZadlUxRWhjWk5QY1haR291bmVG?=
 =?utf-8?B?M0t5Z1JIYVhhOGxEak1CcTBwYmhxK1p1YUU3blZ4eWZIcjM0SW1MVnNLVHk0?=
 =?utf-8?B?RXJCcmFVWFQyWjZ4Q3RJcGYyemJSREluL1hPWlNKQzdpT0M5dmhTN0g1U2Ur?=
 =?utf-8?B?MDRuTzdDckRLZXRWMVBOSkJLMWVzQU9NUG9oUzFyTmlVeE1GWmJ6dVNIdEkr?=
 =?utf-8?B?aU1XK0xvT0dwL3pQK3Y5WjNKYmdmSzdXSGhEeVVpSXlFRTFzZHZCYWZvcGlP?=
 =?utf-8?B?azdWSFlTQVN4b0tHYnF3RlhMaFhsaVhiOEVJY3hwSnJibUxUR05KdUFBTzVW?=
 =?utf-8?B?USs1UUUzbnI1dWJFenlEWmRNSFRYSkIvWjBOR0VwbzVoTTRRS1pyVlVpK3VV?=
 =?utf-8?B?alBtSllvUURRSm0xckpGc3JnR241SGhQNFpmK0tCN1I1SWN2RUwyMDBOdnZ4?=
 =?utf-8?B?QTNyVmV5eTBvSHlBTGR6eGR5bzRRVlJOc0ZJZTh2SHlMZmY2RUh0SGZOVmdE?=
 =?utf-8?B?VFFpUWpiZzduY29renUxb3p5alRQWWdaQVNYVW14U0VDL21wTnc5VFd3ODE1?=
 =?utf-8?B?VzJWVHVzUm9JQ0YzYUxmaFZFWGt1Z1BBNGc1bnBhQS96L01wY1pKbXQ2cy9i?=
 =?utf-8?Q?zwyY=3D?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB6965.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ec60e6b3-0a72-49a7-3ec8-08dd0ddac8ef
X-MS-Exchange-CrossTenant-originalarrivaltime: 26 Nov 2024 05:25:48.1185
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: R292ka6gAJakGj9cR/wWP81D0Y3zWx3cHLvzMYTLLRCuq7LnqGzHChPNDq6R2wp+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9157

SGkgTWFyZWssDQoNClllcyB3ZSBhcmUgdXNpbmcgaHR0cHM6Ly9naXRodWIuY29tL1hpbGlueC9s
aW51eC14bG54L3RyZWUveGxueF9yZWJhc2VfdjYuNl9MVFMuIFdlIGFyZSBhbHNvIGNoZWNraW5n
IHdpdGggdXBzdHJlYW0ga2VybmVsLiBXaWxsIHVwZGF0ZSB5b3Ugb24gdGhhdC4NCg0KQ2FuIHlv
dSBzaGFyZSBwbGVhc2UgeW91ciBhcnRpZmFjdHMuDQoNClRoZSBibG9icyBJIHVzZSBhcmUgMjAx
OS4xIA0KW1BhcnRoXTogWW91IGFyZSB1c2luZyAyMDE5LjEgQk9PVC5iaW4gYW5kIHJvb3RmcyBh
bmQgdXBzdHJlYW0ga2VybmVsIEltYWdlIHJpZ2h0Pw0KQWxzbyBJIGRvbid0IHRoaW5rIGFueSBj
aGFuZ2VzIHdpdGggcmVzcGVjdCB0byB0aGlzLiBMZXQgbWUgYWxzbyBkb3VibGUgY2hlY2sgb25j
ZS4NCg0KUmVnYXJkcywNClBhcnRoDQoNCi0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQpGcm9t
OiBNYXJlayBWYXN1dCA8bWFyZXhAZGVueC5kZT4gDQpTZW50OiBUaHVyc2RheSwgTm92ZW1iZXIg
MTQsIDIwMjQgMToyNiBBTQ0KVG86IEdhamphciwgUGFydGggPHBhcnRoLmdhamphckBhbWQuY29t
PjsgU2FnYXIsIFZpc2hhbCA8dmlzaGFsLnNhZ2FyQGFtZC5jb20+OyBsaW51eC1jbGtAdmdlci5r
ZXJuZWwub3JnDQpDYzogTWljaGFlbCBUdXJxdWV0dGUgPG10dXJxdWV0dGVAYmF5bGlicmUuY29t
PjsgU2ltZWssIE1pY2hhbCA8bWljaGFsLnNpbWVrQGFtZC5jb20+OyBTdGVwaGVuIEJveWQgPHNi
b3lkQGtlcm5lbC5vcmc+OyBsaW51eC1hcm0ta2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IEFs
bGFnYWRhcGEsIFZhcnVua3VtYXIgPHZhcnVua3VtYXIuYWxsYWdhZGFwYUBhbWQuY29tPg0KU3Vi
amVjdDogUmU6IFtQQVRDSF0gY2xrOiB6eW5xbXA6IFdvcmsgYXJvdW5kIGJyb2tlbiBEVCBHUFUg
bm9kZQ0KDQpPbiAxMS8xMy8yNCAyOjMyIFBNLCBHYWpqYXIsIFBhcnRoIHdyb3RlOg0KPiBIaSBN
YXJlaywNCg0KSGksDQoNCj4gV2UgdHJpZWQgcnVubmluZyBrbXNjdWJlIGFwcGxpY2F0aW9uIHdp
dGggbGltYSBkcml2ZXIgYW5kIGl0IGlzIHdvcmtpbmcgZmluZS4NCj4gQXR0YWNoaW5nIGFwcGxp
Y2F0aW9uIGxvZ3MgYW5kIGJvb3QgbG9ncy4NCj4gDQo+IFdlIGFyZSB1c2luZyBvdXIgNi42IGtl
cm5lbC4NCj4gTWVhbndoaWxlIHdlIHdpbGwgYWxzbyBjaGVjayB3aXRoIHVwc3RyZWFtIGtlcm5l
bC4NCg0KSXMgdGhpcyB0aGUgaGVhdmlseSBwYXRjaGVkIGtlcm5lbCB2ZXJzaW9uIGZyb20gaHR0
cHM6Ly9naXRodWIuY29tL1hpbGlueC9saW51eC14bG54IGJyYW5jaCB4bG54L3hsbnhfcmViYXNl
X3Y2LjZfTFRTIHdpdGgNCiAgODY1IGZpbGVzIGNoYW5nZWQsIDIxNjg5NSBpbnNlcnRpb25zKCsp
LCA4Mjc2IGRlbGV0aW9ucygtKSBvciBhbiBhY3R1YWwgc3RvY2sgNi42LjQwID8NCg0KPiBJcyBp
dCBtYXliZSBwb3NzaWJsZSBzb21lIG5ld2VyIGJsb2IocykgZW5hYmxlIGJvdGggUFAwIGFuZCBQ
UDEgaW50ZXJuYWxseSB0byB3b3JrIGFyb3VuZCB0aGlzIGNsb2NraW5nIGlzc3VlIGluIExpbnV4
ID8NCg0KVGhlIGJsb2JzIEkgdXNlIGFyZSAyMDE5LjEgLCBzbyB3aGF0IGFib3V0IHRoaXMgcXVl
c3Rpb24gXiA/DQo=
