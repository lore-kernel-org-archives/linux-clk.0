Received: from NAM10-BN7-obe.outbound.protection.outlook.com (mail-bn7nam10on2061.outbound.protection.outlook.com [40.107.92.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C0611DFF7
	for <linux-clk@vger.kernel.org>; Tue, 12 Nov 2024 13:17:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.92.61
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731417473; cv=fail; b=FYmCC81TZ4fjwqtOYul5j6VAh3lOxcjtsXGbfEqO6fZO/8SbnlQLxXviHD941BUu7gU+ueODYwoGyqKOlys6qt9Gs4nfnjNtIN1AtjEAUlPhvN5iFVMLdxE2UFQBGviDgc7D/iGIcJ+UpEAeK8kUQe00nGiHTT3gm3zBPDzQ/2M=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731417473; c=relaxed/simple;
	bh=SMJfgBWk9cgSNanAHWeTNp003TtirgfkFH8ALMnQGNg=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=PINw9GJR+vBVye/bajHIEMPJNvQZ0RzP70rBJmy/0LD9Ni5JQSV1AEJZcppH9XwHlWMg86el93ZfcNwnqkeIBF/jBjj609IHfKVthrH2JZQW5LWJabJVVbEjNDifRbCZ2N5HIs1orthneXWi7jcd8d1dI3b9ik9ESI4goqOBcZo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=xa/0Lysj; arc=fail smtp.client-ip=40.107.92.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="xa/0Lysj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DNWG9gXMqy3esGzpo31xH+H7Vni7E9Veppj3tnuxpOX3a+BOs1vmowiQx7ZgukQlBlx31/K7Fbl84HutJlqEJ9uzE87QGc1halmn4YCl2kEa7LjA9qcK+WMAjGOexN1bLsh0VPKwjPezx+9RROMwtelPHS6eUeHZB50I7Idqf1HrgoeC5g+duMbpEllZ5P5uMWOqSiNH3OEY6uiDbIknoXyFXYo57muWLEKxTwlR5hTsHg7Ppi3EwAAy7/prCHG9DeBcvRHBZLhZZVX49bPcgqOS1q3ecnUz0f4JZvkmZs2Ikoa+L+K8oFwDo1I3pojNSBhkrmIZeuprQSFUOXKFSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=58V5wgxf+bYvyDVfZg151OF7XHdEPvQ7oHmLu01UN3Y=;
 b=PeCPHlm/O6lznrs3LEdXs256Yas537x2uCnks/uQmCqGmYSeQvPFnGgNvsOJCGrCptyeuZQRgRcKACfTNaLaftRqPtuvtPxej2hcFE9k5q7SL8xWKzg5t/93T6GDUz12xxwnre+7SaSP54jB8hkOWfjrx1D0Ry5U2TNheH6nSkrxce1cm8dtEy7kGC4hnGaf1cwgihf4vKBk/tkngo5xPHUxmMrzSrelp1UsFJBuwoBcHIp49HeKm3EBJC9faLn9SkelXz2EeywUE3M16Ufh9/rVUqfrB2UpKBIyFVX7UburRB9RaDMcjvY8snxOGufqBiixQEIc5+RVLQ3PwOYbOQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=58V5wgxf+bYvyDVfZg151OF7XHdEPvQ7oHmLu01UN3Y=;
 b=xa/0LysjMSvXkbfdZprPv6HfuNGwmO8uZTrOyoRjWn6YMrCC7s85HRbCFbJDGvMhWAgp0GQaxvqeA7xixvpKj9JKzY3NTFyTm/Of+YwkU1zU9rSl4CoooJpTv96p7X5eB2WSRcEO2j+ByO0s8TdHmhFH5AUdDOD4FMUOlh7YtEI=
Received: from SJ0PR12MB6965.namprd12.prod.outlook.com (2603:10b6:a03:448::18)
 by IA0PR12MB8694.namprd12.prod.outlook.com (2603:10b6:208:488::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.17; Tue, 12 Nov
 2024 13:17:48 +0000
Received: from SJ0PR12MB6965.namprd12.prod.outlook.com
 ([fe80::84c6:8bb0:913f:5dd4]) by SJ0PR12MB6965.namprd12.prod.outlook.com
 ([fe80::84c6:8bb0:913f:5dd4%7]) with mapi id 15.20.8137.027; Tue, 12 Nov 2024
 13:17:48 +0000
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
Thread-Index: AQHbNEa09tdAgT34LEiIIhKVflEmnbKyRBSAgAFaccA=
Date: Tue, 12 Nov 2024 13:17:48 +0000
Message-ID:
 <SJ0PR12MB69656066F70FC40E4A5A93B499592@SJ0PR12MB6965.namprd12.prod.outlook.com>
References: <20241031170015.55243-1-marex@denx.de>
 <dd4cb501-5fc7-4430-9ffc-9c8c910df425@amd.com>
 <4ee8d8a5-ec00-4b11-a7bc-4137e1982218@denx.de>
In-Reply-To: <4ee8d8a5-ec00-4b11-a7bc-4137e1982218@denx.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: yes
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ0PR12MB6965:EE_|IA0PR12MB8694:EE_
x-ms-office365-filtering-correlation-id: 19157b38-dfdd-4037-a3a5-08dd031c671d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?bCtsNzlERGZkK3BwMDJzWmI3SGdWakI1V1YzcmdHT2pTV3FZNXJZNnk1eWdZ?=
 =?utf-8?B?blEvVGlaUEo5cS80MHZRM2JmL1JMTzFRbTZhZVVuQ0E4Tm1NTzBuZnowbEdP?=
 =?utf-8?B?amx5UUlQcmVDOGNRMEVZQWhMMXNmeXJkMFowZ2h5ejVCWFIyTXNJQWVNMWVR?=
 =?utf-8?B?M2t0dHUxT215ckN1S2J1alFBcC9LK1MxK3k4aXRuM3Q4aSsxbk10SU0zSkpD?=
 =?utf-8?B?TUVtSzJPVEdYSW5ZREZCVEFFYWFiUjM5OVBFTFJvb2x4eWJZWmdRNHE5Tk5a?=
 =?utf-8?B?WCs2VnZWWGFXV2MyUG9UYnYwdHVhNGNGUXdVblJpOURSczJESzBSWjlaQzFR?=
 =?utf-8?B?ZlYybVhzRnJXL2R0cmh3d0dLMHlvbXd3VktrS0Z1NnZFMjhJU0FIZzNSaUdy?=
 =?utf-8?B?dTMxZ1hqbEl6VUJ6Z015TDlYTEhlZTJ5OEhoTGlRYXJOd2dvOXJUV3dVeEVV?=
 =?utf-8?B?YTVJMXJCUEhCazdjSnRnSU1jMVRaYkdaak9pUFVZVW92a1BPNnFGdkk3MUlM?=
 =?utf-8?B?RmsyNW1YelZKN09ZRHhHUjBXaFJxcVMwdUtWVXFnci9qa3NqTDVPeWYrdHEv?=
 =?utf-8?B?QzluMHRHRHdKbjRETTExWThCdVNUd2xZRzdic1JPSUVYL3RERlN0YjFUZkFj?=
 =?utf-8?B?MURVdTBPcUJ4Y3RMSGxvQUN1cDlpQkJmK0daN2lkUXUwUDRkSlpENXp2YmlQ?=
 =?utf-8?B?dll2cGFQSFdXSDlqQytZZUJqWmUzcHRRMVc2SVllSWtKeUd4SkFVQ1NncUVT?=
 =?utf-8?B?QnpkVDR4R1pralB1T1hSbk5DUnpvdHh6dDVtK0VpMnF0bERjeUJDVEI2aStj?=
 =?utf-8?B?NjJJWlFZaVArN2JpNmxvRmRZR2pDSjV5T1lQSDZ3QkpuTzE4Mk5Vc3kzRGM0?=
 =?utf-8?B?THRzTXFFbE5UQkpHNGkxOUtjSUEyUGFPUHBOYjJKUm4xMDRLYlBqcWNURjBh?=
 =?utf-8?B?b3ZOUVE0aEcvU2Q5TDFkTzlaanU3dnFEcVBHblhpSW9ZM2s0QzcxcjBUK0dD?=
 =?utf-8?B?K25YL1d1UDNuRGFFMFFtMjFJUEZLQzM4MStmYi84UGo3MmVXUmxsMlhYei9X?=
 =?utf-8?B?eUNTaHllS2xnRDlocm5wdVJINlAwYys0ZGRzTUE0azJTQXE2UTAybm5Nd1BH?=
 =?utf-8?B?Qk9zTDVFNko3RURrUkN4WUpwNTBsbC9VeVJQUFVXcFhsN0JRSXZqQWU0UTk2?=
 =?utf-8?B?T0pmOTRReFZ6bUhvTTltSnErZzJEeDczSUZoMStad0dqYXBlOEJXTHFNWGhr?=
 =?utf-8?B?NlMxNzZXL3kyek44RDBJbVpjR0FrYitPRmcwb0grTnN1MldaUWloMXEzcHpa?=
 =?utf-8?B?MEVScFJyR3NCYmN5Uno1bXZlMG80VzM0bWhZMlUvVkhtMjEwUzRQTFRaV2FO?=
 =?utf-8?B?MVRXdERRSGZjaGlPYkFJV2lDcUFyeWVLY2c1V1BEV1AyeG9uaE9xaG11d0xi?=
 =?utf-8?B?VzluL2V4Zk01bXpJM0xiV2Q2OHNPejNaWnFzalA1RzByaWYyb3FIMFF0SnVH?=
 =?utf-8?B?clNObEdKUnFUQS9obVJYZ3R2R3kxNjJsT0NKZWlZNkxlOEtYY1NQeWNKclZB?=
 =?utf-8?B?WGhGYUs0d25yenQ1U0Z3czA3UjR6VEl2VEJITitrRW8xZ3prd0dQWUlNZFRD?=
 =?utf-8?B?M3c0YTVqenFuQWdMSXh2alJNQzFrRTVPdDBZbDllNk5BYTVtczRmNjNseDZq?=
 =?utf-8?B?TkplTkY5SG82Uzh2TmFkV2lOczEybG1CaFpMdFJRdXh3SHFEQ1dMUjBuOTFM?=
 =?utf-8?B?STJkWG9ZbDhJQm4rQzBTaTltVXcvSXIwSjR6OGNqcm51YXVVOTNvenJ1VzZ1?=
 =?utf-8?B?R0xYZ0pNendKdGI2cWZGN005T2F4UHlZQnZpR2M1SlBSWHNjM1I0WWF3dFVr?=
 =?utf-8?Q?aCzD/A7d3EMU4?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SJ0PR12MB6965.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?bGlYeDVRTnVVdGtDSmwyOTdpcnVBSURNSXkwSGRRemtReTNyY0E2UEtkWDg1?=
 =?utf-8?B?YlhhNGphemFwWHdST1RIU3JvZnc1cWx4aXNZSFA1YkRQd20wNG5vc0JGSTRw?=
 =?utf-8?B?NGdhNUcvcytYLzM5ODBtT2NwbDRhai9SZlRQODllQUZBSXVrOXc0VDRoaDhw?=
 =?utf-8?B?SDB1aFFFK3Q3MWlXSWgzcEg3UFdHcWxkN0ZjZ2xBNmFsdmY4akkwUThBelZE?=
 =?utf-8?B?bnFuMWpsRFhtWHpzcmhNZ08vS0x5V0p6aWtCM01XMVhyVHZWYWViTXFqcG1m?=
 =?utf-8?B?d3NqbmZIZzJORUQ5czdsS05kbFdPTEkzT2FkMEVnMFl1ZUszVW03K0sxSzVt?=
 =?utf-8?B?cXU5bEZ6c3lxQU1tZTFDeGtaYTlwU29aQVcxY1Zhc0U5ZHJuK1JjaVZ3UWoy?=
 =?utf-8?B?Z3pJMXcxek4wUTY0cFVxclFJbDU1bkZvQ0psZitUTEtRSzBueHV6eFFnR3Js?=
 =?utf-8?B?ZEtKYmFZVlFKUXBqMGxGTkRoKy9DbEJRMC9tZEVTMStaV2RmaHNsa2cvMEt2?=
 =?utf-8?B?S3dxbTQ4TTVwNzFHMEFBTG96NURUeE5GS2F0YUVWL0g0ZFF1N0JTMXp3c1JM?=
 =?utf-8?B?MUFmcDY2bnU4aW55ZitGb2NlSGh3WVlKZUllaHgrUmtodlhGcnNPeUJEekZp?=
 =?utf-8?B?S3d2S1B6cm9aQVNHblVWOVhpUUlhSjBNZURhMndLdGJyWURsK21LR0JVRWl4?=
 =?utf-8?B?WVV2cDRnU1VOMktRT2hLNjNERkVSUUVxKzZQQUhObnd0RWRmTkxUSmdXRnQ4?=
 =?utf-8?B?MVNMOXJBRTc2RURBdkhTdWNDRmE0UlFJZUh5d1dUbFVHWGViaUFsYnR1VWVS?=
 =?utf-8?B?cmlOYTdjM1JkOGozRXJZT2VJNDZTZElTcDdYT1ZQZ3pHMnBvUnNVWkhtZith?=
 =?utf-8?B?cmRQQ3dOS1VoRVNsWFplNStlU2hLdFVDczIzUno3dUlaWmMxT2dFYjBoSmM3?=
 =?utf-8?B?MURZeGF2SlFIdithOGt5QmJpaHdhaUdXRTFZaS9PZWRuZnROVTlkVlBoUVRj?=
 =?utf-8?B?RUFMakdaUHd4b2orQzV0bndBSS9mcVd0amVlZGFhVlA5OXYxWlJnM3VxMmVs?=
 =?utf-8?B?a2t2bmlrTWR6N3VaL3Y3TVN6ci8yWnM5Q29mTjQraUV6ZENaOUNJSWFvakw1?=
 =?utf-8?B?cXB3M2lZVDU4aVhPQVpnSWsxeTNBTXZIM0krZjU2aGV4c0h3TGlkVTVkN2M4?=
 =?utf-8?B?cnhCNCtSTXpBS1pmSS9zMUgzbEQ4RGRLV29WWWZlUW1qRzdVWkhBcngyazZu?=
 =?utf-8?B?a3NaS1ZuUVFmejE5Qm9HajlGUEw5cG1BRmR5RHZHTkl6UXVybUFtVjJXcGQx?=
 =?utf-8?B?TVdGa254REwwKzZnVGRBLzVVZEpWb1NWM2N5UGJjcGIzYjdoaGRKYVBNdHFX?=
 =?utf-8?B?UWNoSnR2VDVuWGlvcno3RjF3VVlRWENNZzlBMHJQaWhYNFpSM1BEV0NoTW5R?=
 =?utf-8?B?V0pJMFQwd3BEOVFoNzNOakxHa3FTUitKdzZSZkwrTTducnppV09MS2FxbmR6?=
 =?utf-8?B?Q1MwVTY3aGlnVk10bitmN0JuNUllQldPVHVIclFORTRZV1lsZ0RkaytVUVBK?=
 =?utf-8?B?MGxXai9RN2VCSUUvcGNjeE9Hd0t0RHEyWkkzNUF1Y1B1Q0xRQ0NNWkdlL0Ry?=
 =?utf-8?B?RFUvcXByY2psRk5GOTlpYmUwL3FnVnp1cXlONFg5WkRZckNzRTlBQ3cvZU5D?=
 =?utf-8?B?Y0o1ajNrSkxCKzVJdFVQb1BzU3JJazg0MXFZS0ludUdYNW12Q0taZjErNWE2?=
 =?utf-8?B?QTlyeFFpZ1YzeVFPNXRZUE1hNkFvcjlPeGdhYmU2QnJVYnR2aHJVQ1BpVFIy?=
 =?utf-8?B?bEk3SlByb01OQzBNcU80aTNHL3ZiN0JtaElIS0dpdnFsT2dLS3lqZ3JFV1kr?=
 =?utf-8?B?eE4wL1lnUElYZ3VIbUFwdzVqNm1hOWNwWjd0cTh2V0xhbGt1cTJKNllNL2Y0?=
 =?utf-8?B?VHQrU1BuRVh2b2l6OURFR0ZrSGZ3RVpWTEFQV1B0VWl0blZxZG1IS3oyY1Rt?=
 =?utf-8?B?V05WUEN3NmNsOGNnT3JXcjJCdUdIeElhamZxNVptZlJxbkhMZ1k0T0FWN1RD?=
 =?utf-8?B?a05lOXd3aG82aDFkZ1dwTXVnL1REbFJhR2RMQ2UyUkZzeTdQdCtFMFJZUmJK?=
 =?utf-8?Q?0nJk=3D?=
Content-Type: multipart/mixed;
	boundary="_002_SJ0PR12MB69656066F70FC40E4A5A93B499592SJ0PR12MB6965namp_"
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ0PR12MB6965.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19157b38-dfdd-4037-a3a5-08dd031c671d
X-MS-Exchange-CrossTenant-originalarrivaltime: 12 Nov 2024 13:17:48.0309
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: wsLix59Opq9L/tU/wYJqSt0mIDsYtb4u6igDGJ5oe7p0Nz6zkHYNEvCVDkh7wIZD
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8694

--_002_SJ0PR12MB69656066F70FC40E4A5A93B499592SJ0PR12MB6965namp_
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgTWFyZWssDQoNCldlIHRyaWVkIHJ1bm5pbmcgZ2xtYXJrMi1lczItd2F5bGFuZCBhcHBsaWNh
dGlvbiB3aXRoIG1hbGkgYW5kIGxpbWEgZHJpdmVyIGFuZCBkaWRu4oCZdCBvYnNlcnZlZCBhbnkg
aGFuZy4gV2Ugd2lsbCBhbHNvIGNoZWNrIHdpdGgga21zY3ViZSBhcHBsaWNhdGlvbi4gDQoNCkF0
dGFjaGluZyBsb2dzIGZvciBjbG9jayBzdW1tYXJ5Lg0KDQpEaWQgeW91IHRyeSB3aXRoIG1hbGkg
b3IgbGltYSBkcml2ZXI/DQoNClJlZ2FyZHMsDQpQYXJ0aA0KDQotLS0tLU9yaWdpbmFsIE1lc3Nh
Z2UtLS0tLQ0KRnJvbTogTWFyZWsgVmFzdXQgPG1hcmV4QGRlbnguZGU+IA0KU2VudDogTW9uZGF5
LCBOb3ZlbWJlciAxMSwgMjAyNCA5OjU1IFBNDQpUbzogU2FnYXIsIFZpc2hhbCA8dmlzaGFsLnNh
Z2FyQGFtZC5jb20+OyBsaW51eC1jbGtAdmdlci5rZXJuZWwub3JnDQpDYzogTWljaGFlbCBUdXJx
dWV0dGUgPG10dXJxdWV0dGVAYmF5bGlicmUuY29tPjsgU2ltZWssIE1pY2hhbCA8bWljaGFsLnNp
bWVrQGFtZC5jb20+OyBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+OyBsaW51eC1hcm0t
a2VybmVsQGxpc3RzLmluZnJhZGVhZC5vcmc7IEdhamphciwgUGFydGggPHBhcnRoLmdhamphckBh
bWQuY29tPjsgQWxsYWdhZGFwYSwgVmFydW5rdW1hciA8dmFydW5rdW1hci5hbGxhZ2FkYXBhQGFt
ZC5jb20+DQpTdWJqZWN0OiBSZTogW1BBVENIXSBjbGs6IHp5bnFtcDogV29yayBhcm91bmQgYnJv
a2VuIERUIEdQVSBub2RlDQoNCk9uIDExLzExLzI0IDM6MzMgUE0sIFNhZ2FyLCBWaXNoYWwgd3Jv
dGU6DQo+IEhpIE1hcmVrLA0KPiANCj4gVGhhbmtzIGZvciBzaGFyaW5nIHRoaXMgcGF0Y2guDQo+
IA0KPiBPbiAxMC8zMS8yMDI0IDU6NTkgUE0sIE1hcmVrIFZhc3V0IHdyb3RlOg0KPj4gVGhlIFp5
bnFNUCBEVCBHUFUgbm9kZSBjbG9jayBkZXNjcmlwdGlvbiBpcyB3cm9uZyBhbmQgZG9lcyBub3Qg
DQo+PiByZXByZXNlbnQgdGhlIGhhcmR3YXJlIGNvcnJlY3RseSwgaXQgb25seSBkZXNjcmliZXMg
QlVTIGFuZCBQUDAgDQo+PiBjbG9jaywgd2hpbGUgaXQgaXMgbWlzc2luZyBQUDEgY2xvY2suIFRo
YXQgbWVhbnMgUFAxIGNsb2NrIGNhbiBuZXZlciANCj4+IGJlIGVuYWJsZWQgd2hlbiB0aGUgR1BV
IHNob3VsZCBiZSB1c2VkLCB3aGljaCBsZWFkcyB0byBleHBlY3RlZCBHUFUgDQo+PiBoYW5nIGV2
ZW4gd2l0aCBzaW1wbGUgYmFzaWMgdGVzdHMgbGlrZSBrbXNjdWJlLg0KPiANCj4gQ291bGQgeW91
IHBsZWFzZSBzaGFyZSBob3cgeW91IHRlc3RlZCB0aGlzPw0KDQpJIHRlc3RlZCB0aGlzIGJ5IHJ1
bm5pbmcga21zY3ViZSwgc2VlIG9uZSBsaW5lIGFib3ZlLg0KDQo+IFBsZWFzZSBzaGFyZSB0aGUg
ZHQgbm9kZSB0b28uDQoNClRoZSBHUFUgRFQgbm9kZSBpcyBhbHJlYWR5IGluIGFyY2gvYXJtNjQv
Ym9vdC9kdHMveGlsaW54L3p5bnFtcC5kdHNpIC4NCg0KPiBXZSB3aWxsIGFsc28gY2hlY2sgYXQg
b3VyIGVuZCBhbmQgcmV2ZXJ0IGZvciB0aGlzLg0KSSBkbyBub3QgdW5kZXJzdGFuZCB0aGlzIHN0
YXRlbWVudCAuIFJldmVydCB3aGF0ID8NCg==

--_002_SJ0PR12MB69656066F70FC40E4A5A93B499592SJ0PR12MB6965namp_
Content-Type: text/plain; name="clk_summary_mali_400.txt"
Content-Description: clk_summary_mali_400.txt
Content-Disposition: attachment; filename="clk_summary_mali_400.txt";
	size=3112; creation-date="Tue, 12 Nov 2024 13:15:52 GMT";
	modification-date="Tue, 12 Nov 2024 13:17:46 GMT"
Content-Transfer-Encoding: base64

eGlsaW54LXpjdTEwNi0yMDI0MjovaG9tZS9wZXRhbGludXgjDQp4aWxpbngtemN1MTA2LTIwMjQy
Oi9ob21lL3BldGFsaW51eCMNCnhpbGlueC16Y3UxMDYtMjAyNDI6L2hvbWUvcGV0YWxpbnV4IyBj
YXQgL3N5cy9rZXJuZWwvZGVidWcvY2xrL2Nsa19zdW1tYXJ5IHwgZ3JlcCBncHUNCiAgICAgICAg
ICAgICAgICAgICBncHVfcmVmX211eCAgICAgICAwICAgICAgIDAgICAgICAgIDAgICAgICAgIDQ5
OTk1MDAwMCAgIDAgICAgICAgICAgMCAgICAgNTAwMDAgICAgICBZICAgICAgICAgICAgICAgICAg
ICAgZGV2aWNlbGVzcyAgICAgICAgICAgICAgICAgICAgICBub19jb25uZWN0aW9uX2lkDQogICAg
ICAgICAgICAgICAgICAgICAgZ3B1X3JlZl9kaXYxICAgMCAgICAgICAwICAgICAgICAwICAgICAg
ICA0OTk5NTAwMDAgICAwICAgICAgICAgIDAgICAgIDUwMDAwICAgICAgWSAgICAgICAgICAgICAg
ICAgICAgICAgIGRldmljZWxlc3MgICAgICAgICAgICAgICAgICAgICAgbm9fY29ubmVjdGlvbl9p
ZA0KICAgICAgICAgICAgICAgICAgICAgICAgIGdwdV9yZWYgICAgIDAgICAgICAgMCAgICAgICAg
MCAgICAgICAgNDk5OTUwMDAwICAgMCAgICAgICAgICAwICAgICA1MDAwMCAgICAgIE4gICAgICAg
ICAgICAgICAgICAgICAgICAgICBmZDRiMDAwMC5ncHUgICAgICAgICAgICAgICAgICAgIGJ1cw0K
ICAgICAgICAgICAgICAgICAgICAgICAgICAgIGdwdV9wcDFfcmVmIDAgICAgICAgMCAgICAgICAg
MCAgICAgICAgNDk5OTUwMDAwICAgMCAgICAgICAgICAwICAgICA1MDAwMCAgICAgIE4gICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICBkZXZpY2VsZXNzICAgICAgICAgICAgICAgICAgICAgIG5v
X2Nvbm5lY3Rpb25faWQNCiAgICAgICAgICAgICAgICAgICAgICAgICAgICBncHVfcHAwX3JlZiAw
ICAgICAgIDAgICAgICAgIDAgICAgICAgIDQ5OTk1MDAwMCAgIDAgICAgICAgICAgMCAgICAgNTAw
MDAgICAgICBOICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgZmQ0YjAwMDAuZ3B1ICAgICAg
ICAgICAgICAgICAgICBjb3JlDQp4aWxpbngtemN1MTA2LTIwMjQyOi9ob21lL3BldGFsaW51eCMN
CnhpbGlueC16Y3UxMDYtMjAyNDI6L2hvbWUvcGV0YWxpbnV4Iw0KeGlsaW54LXpjdTEwNi0yMDI0
MjovaG9tZS9wZXRhbGludXgjDQp4aWxpbngtemN1MTA2LTIwMjQyOi9ob21lL3BldGFsaW51eCMg
Z2xtYXJrMi1lczItd2F5bGFuZCAmDQpbMV0gOTczDQp4aWxpbngtemN1MTA2LTIwMjQyOi9ob21l
L3BldGFsaW51eCMgPT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PQ0KICAgIGdsbWFyazIgMjAyMy4wMQ0KPT09PT09PT09PT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KICAgIE9wZW5HTCBJbmZvcm1hdGlvbg0K
ICAgIEdMX1ZFTkRPUjogICAgICBNZXNhDQogICAgR0xfUkVOREVSRVI6ICAgIE1hbGk0MDANCiAg
ICBHTF9WRVJTSU9OOiAgICAgT3BlbkdMIEVTIDIuMCBNZXNhIDI0LjAuNw0KICAgIFN1cmZhY2Ug
Q29uZmlnOiBidWY9MzIgcj04IGc9OCBiPTggYT04IGRlcHRoPTI0IHN0ZW5jaWw9MCBzYW1wbGVz
PTANCiAgICBTdXJmYWNlIFNpemU6ICAgODAweDYwMCB3aW5kb3dlZA0KPT09PT09PT09PT09PT09
PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PQ0KW2J1aWxkXSB1c2UtdmJv
PWZhbHNlOiBGUFM6IDY1MyBGcmFtZVRpbWU6IDEuNTMxIG1zDQpbYnVpbGRdIHVzZS12Ym89dHJ1
ZTogRlBTOiA2OTMgRnJhbWVUaW1lOiAxLjQ0NCBtcw0KW3RleHR1cmVdIHRleHR1cmUtZmlsdGVy
PW5lYXJlc3Q6IEZQUzogNzE1IEZyYW1lVGltZTogMS40MDAgbXMNClt0ZXh0dXJlXSB0ZXh0dXJl
LWZpbHRlcj1saW5lYXI6IEZQUzogNjkxIEZyYW1lVGltZTogMS40NDggbXMNClt0ZXh0dXJlXSB0
ZXh0dXJlLWZpbHRlcj1taXBtYXA6IEZQUzogNjcxIEZyYW1lVGltZTogMS40OTIgbXMNCnhpbGlu
eC16Y3UxMDYtMjAyNDI6L2hvbWUvcGV0YWxpbnV4Iw0KeGlsaW54LXpjdTEwNi0yMDI0MjovaG9t
ZS9wZXRhbGludXgjDQp4aWxpbngtemN1MTA2LTIwMjQyOi9ob21lL3BldGFsaW51eCMNCnhpbGlu
eC16Y3UxMDYtMjAyNDI6L2hvbWUvcGV0YWxpbnV4IyBjYXQgL3N5cy9rZXJuZWwvZGVidWcvY2xr
L2Nsa19zdW1tYXJ5IHwgZ3JlcCBncHUNCiAgICAgICAgICAgICAgICAgICBncHVfcmVmX211eCAg
ICAgICAxICAgICAgIDEgICAgICAgIDEgICAgICAgIDQ5OTk1MDAwMCAgIDAgICAgICAgICAgMCAg
ICAgNTAwMDAgICAgICBZICAgICAgICAgICAgICAgICAgICAgZGV2aWNlbGVzcyAgICAgICAgICAg
ICAgICAgICAgICBub19jb25uZWN0aW9uX2lkDQogICAgICAgICAgICAgICAgICAgICAgZ3B1X3Jl
Zl9kaXYxICAgMSAgICAgICAxICAgICAgICAxICAgICAgICA0OTk5NTAwMDAgICAwICAgICAgICAg
IDAgICAgIDUwMDAwICAgICAgWSAgICAgICAgICAgICAgICAgICAgICAgIGRldmljZWxlc3MgICAg
ICAgICAgICAgICAgICAgICAgbm9fY29ubmVjdGlvbl9pZA0KICAgICAgICAgICAgICAgICAgICAg
ICAgIGdwdV9yZWYgICAgIDIgICAgICAgMiAgICAgICAgMiAgICAgICAgNDk5OTUwMDAwICAgMCAg
ICAgICAgICAwICAgICA1MDAwMCAgICAgIFkgICAgICAgICAgICAgICAgICAgICAgICAgICBmZDRi
MDAwMC5ncHUgICAgICAgICAgICAgICAgICAgIGJ1cw0KICAgICAgICAgICAgICAgICAgICAgICAg
ICAgIGdwdV9wcDFfcmVmIDAgICAgICAgMCAgICAgICAgMCAgICAgICAgNDk5OTUwMDAwICAgMCAg
ICAgICAgICAwICAgICA1MDAwMCAgICAgIFkgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBk
ZXZpY2VsZXNzICAgICAgICAgICAgICAgICAgICAgIG5vX2Nvbm5lY3Rpb25faWQNCiAgICAgICAg
ICAgICAgICAgICAgICAgICAgICBncHVfcHAwX3JlZiAxICAgICAgIDEgICAgICAgIDAgICAgICAg
IDQ5OTk1MDAwMCAgIDAgICAgICAgICAgMCAgICAgNTAwMDAgICAgICBZICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgZmQ0YjAwMDAuZ3B1ICAgICAgICAgICAgICAgICAgICBjb3JlDQp4aWxp
bngtemN1MTA2LTIwMjQyOi9ob21lL3BldGFsaW51eCMgIA==

--_002_SJ0PR12MB69656066F70FC40E4A5A93B499592SJ0PR12MB6965namp_--
