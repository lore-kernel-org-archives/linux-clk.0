Received: from NAM10-DM6-obe.outbound.protection.outlook.com (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64B26CA4B;
	Tue, 31 Dec 2024 14:16:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.93.62
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735654597; cv=fail; b=GS76vx1g48tPVYKxlodV77PQTYyKQ/R0dWHavCqm1KuGXN2gu2rYCVe4BiSw66r650v270vO18Sg4ydTFlSM36gd27igUTTPLiStVae9wlRVFqQ2vk54ovE8FqNtquuLcxhQoY3z6b8jvtXg4sDOrkprkn2ygEybI2vQBtFZRZ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735654597; c=relaxed/simple;
	bh=B4B+HNxEy4iayOi6DallGRwAQMwrOVvYAuePCnWnsVk=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=fqRRaN2uzRzJHxqnvMbadtRc+PqTu2WHXj83xy/pLfmIMkOw/4l26TFRYByhndxb5HFUc8AonEuMoR54uuRouzhSDPs4692JHJ/Tu7558vj/fnNoI0DjVfH47Azq7VNh+FyZrUFpc1i9vqKHJHOKfluXCoLfNjpkt+5JTn0MSSg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=munJ/+Hh; arc=fail smtp.client-ip=40.107.93.62
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="munJ/+Hh"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WJyvK84QecKdJs+W6Txzymqpo2zgCTtkDJHckgBLbESiUbuDZAUmZMNaAyLUXgaqRN6B0LvBJ6aGNz0luv8dbcxrW+sDtarrFt8N4YpkbDf0q792NnKhF7W/O3wnj5326NjumKk6tky8U4AegprZoZ4OL6SeWNFifRPimiSoktYP6ttXM3YygJ+hRB56Y3ZLKWEF8/EwconkfhcXDCHZTwt/oMj+NuNHmQIrVFuXynnSgGbdn8r2sI/HVjAbjjhZ+f9r8B0nysgAxsBlpDT6ph3YO4dLoSyJprj9EMRu8ojMhopBkZOFriUolgYVTfVoY7N2T5K2Q+QPUAQB1lfsEg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=B4B+HNxEy4iayOi6DallGRwAQMwrOVvYAuePCnWnsVk=;
 b=fBUMBPRCgNoVj/7uKu7gVvguOesGUc9TFBuUIo7gSp41wtUZJzCrb7tG+jjDuPLXCjoGCkqhR+Zz0UV11pgPYslRleTfJoZogFccttP3JfTvVGSQgonJQt4EiGPCPb+KINx2gQX1WRHEY/dpDAJdfOusMffWO04exhdn3Aa6xHCAnXf0e0b2cpHBuaGjJg//Am9y+BaR5Ty/i0JWSzXLhZ9prtRn9AQx5lzZI8YdojphEB1DaBADxKva7Zoq7ouGbydpAdb74ETFXqIsysePfzyTJQO+d50LGn7pSNKXjCCxtlbUdVI4EahhwaXO1GCipdaa5H2ZiEnURyL4Oc8DOA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=B4B+HNxEy4iayOi6DallGRwAQMwrOVvYAuePCnWnsVk=;
 b=munJ/+HhpOjV2SemB6xs3N/vvbcNvwuJi8/RltuPSCC8LDIJ37d4N1msRIDLuCSwktSj5ojAMexY3xqLa/9gN1EmSiLYTY2feu4PYG7SIXb8En/Ms/ToA8YIYA1vtQZtdQt8Nys3+YejP3vksVus9ius6gTfNWjDXXlZZMNVDgs=
Received: from CH2PR12MB4875.namprd12.prod.outlook.com (2603:10b6:610:35::24)
 by SN7PR12MB8101.namprd12.prod.outlook.com (2603:10b6:806:321::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8293.19; Tue, 31 Dec
 2024 14:16:24 +0000
Received: from CH2PR12MB4875.namprd12.prod.outlook.com
 ([fe80::ff88:6c6f:c187:6511]) by CH2PR12MB4875.namprd12.prod.outlook.com
 ([fe80::ff88:6c6f:c187:6511%5]) with mapi id 15.20.8293.020; Tue, 31 Dec 2024
 14:16:24 +0000
From: "Visavalia, Rohit" <rohit.visavalia@amd.com>
To: Stephen Boyd <sboyd@kernel.org>, "Simek, Michal" <michal.simek@amd.com>,
	"mturquette@baylibre.com" <mturquette@baylibre.com>, "Sagar, Vishal"
	<vishal.sagar@amd.com>
CC: "javier.carrasco.cruz@gmail.com" <javier.carrasco.cruz@gmail.com>,
	"geert+renesas@glider.be" <geert+renesas@glider.be>,
	"u.kleine-koenig@baylibre.com" <u.kleine-koenig@baylibre.com>,
	"linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>, "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/3] clk: xilinx: vcu: don't set pll_ref as parent of
 VCU(enc/dec) clocks
Thread-Topic: [PATCH 2/3] clk: xilinx: vcu: don't set pll_ref as parent of
 VCU(enc/dec) clocks
Thread-Index: AQHbV5CXrhDJVFHq2keqlRdTJAjZZrL/iLqAgADklsA=
Date: Tue, 31 Dec 2024 14:16:23 +0000
Message-ID:
 <CH2PR12MB48757F7E82F4FE8C54BFB2DFE50A2@CH2PR12MB4875.namprd12.prod.outlook.com>
References: <20241226122023.3439559-1-rohit.visavalia@amd.com>
 <20241226122023.3439559-3-rohit.visavalia@amd.com>
 <6fcf5358bbace7400d35d3fac06254e6.sboyd@kernel.org>
In-Reply-To: <6fcf5358bbace7400d35d3fac06254e6.sboyd@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB4875:EE_|SN7PR12MB8101:EE_
x-ms-office365-filtering-correlation-id: 4d5df274-2b5d-46f7-911c-08dd29a5b507
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info:
 =?utf-8?B?TWtzS1RSRjlOTmlyVzhMZmNFa1N3M2J6KytVeXJPYklIZ1hKVHB3YTNBQzBR?=
 =?utf-8?B?QkFEc0lkRnNuelpJelFiSExUZ2hDQW9XSU0wY0JFN0xxZVJRNklDYXY5bSsz?=
 =?utf-8?B?SG4yWnpIOFBWY0V0c3d6T2h3TVdqazRyYVZFNHpyWFEwSkdDWFBKMHNHS1JZ?=
 =?utf-8?B?dG4valNUa3oyTEJOUVpYdFoxbGcrdjBXNjZpdUt3Nk1HRkxOT0dsMGM1QnF5?=
 =?utf-8?B?eEVZUmNzYXJsUEFFNzluaU1WaWhzT0wxTHBOZW5JOU1qTE1WNHZiOGlhUitP?=
 =?utf-8?B?RXg0Y01VaFVnZjNCekJWYU1CdWpaampKVzBTajJ5UlpDcWxYQ3dnTGhZYjUr?=
 =?utf-8?B?R05jOUIxOXc2R1Ira2JhV2VNTUZlWkh5TUtwZjRpZys3UDBBNFdtLzlMUENK?=
 =?utf-8?B?S1g0OGtuL3ZhaFNyZ1RneFBybGNVVEpENHRWanIwQzBkcEtuSWVtdDExQ2FE?=
 =?utf-8?B?WnovbVpjalA5bGNERFJNeDJlcHY2V3V6aTBwZlh3STlVRXlqTmJQOVhGMkZx?=
 =?utf-8?B?b1RvQmdocjU3aFFyMFZJbThiVHJKb1JyRTFLd29vc1V6TURqMWdUNGxCeW1H?=
 =?utf-8?B?VjJVNWlPaHhiL09vYzZycFcrTjVwRmVvb0RwWmY3YzZ0MGNHemJxaytMRndn?=
 =?utf-8?B?YXEzL09JL29KbmF6UUkrRlVjTXdrMDI0OWNiMXhCN1JMSGJ6L1Rob21aZWRj?=
 =?utf-8?B?bDhEOHlLMXpSbzQzNE1JL0FkcmtjR3lEcjFlMkFzY2kwd0JZelluSEZWdmNN?=
 =?utf-8?B?a20yWitJMTU3Z2YyZ09RVlZHNVJ2WUtNWUxray8vaS9pdjJYYW9hcjZuK2li?=
 =?utf-8?B?Y2p4eWl5enhTTTdIS05mNmQrVWJGbnZySHVGV3gxUmlPSzkxbmZudUFLWW41?=
 =?utf-8?B?U3VRYlhjMHhXTmNkdlNKQ2FLMGRsaWo5RjhkWXdOMDd6N0JBY1IxTUpFcjVq?=
 =?utf-8?B?WEgxWXBFbkFRcHFZSmd4QkRDaU1DZk0vdDREMHlxd2hYWmkrbFJNd2pVNFgz?=
 =?utf-8?B?alVRNzhNU1ZDbENpNmd5RlR0ZEhDQkRDMVJ4QThWcllneEtXa3ByWHI2RDZC?=
 =?utf-8?B?aUduaHFTc0IvQlJSSzF3T0ZxZ3RFRU1LYjd3WDdLMm53dWoxcDJJV1pUdXpQ?=
 =?utf-8?B?WkpoS2VVcUZaNSt2KzJsdXhhK09melhPV0lxdTEva21xMnVGWnhXUFpDSExM?=
 =?utf-8?B?SENZNCtobXV1cWUrS3BSVDBUM2krYTVaWkwvcFAvckYwZXNUZVBOVHVxUjdC?=
 =?utf-8?B?QWM2dTBXMnZFQ3JjTjBKQWFZUUhteGg3aVJRcXhmMlp0NjJCY3JRc0tCeERj?=
 =?utf-8?B?S0VFRHBhbkYvcUkrc2N3ZnJsRUFOSTRySFVYZDRqbUtDS2V1ZWpZajNYcmF2?=
 =?utf-8?B?Y2N6YjI4allGR1FSNis5TG8zb3N6dVhKYzVCazM3aHdFZnNzMlhCeURjL21W?=
 =?utf-8?B?Sk9oY1FWK0Q5bU15eHE1RHkvZTg5eEZXOGQydnBIVTA4MjdTeENKN01yU05F?=
 =?utf-8?B?U1dvalNoYnFjRm13b3ZGTlBVNjl6bEtNVmVhUEJ3eDBmRVc2WUtjamFTY0V0?=
 =?utf-8?B?NkFZM2N1b0JEaS9XSXZ0eU8zL0dvQ0JDRGhFMDRiTURQN0YrZGJlOFNuREZZ?=
 =?utf-8?B?SDMzZ25UcjdHTHpmV1JVcWVFY1FSWU4yS0FCdW8wdEpKL2hPclN3WHFZckdy?=
 =?utf-8?B?THJqUnBKeWUyaWthUmdMLzBnNXNxUXR5d1krbXhxeEN2WmRSS1htOE1wNVIv?=
 =?utf-8?B?TTM5SjIzTmxxKzQ2K1RZOHIxSW9LM0tvbEFxdEkxSnVUS0RRbStRM3VGSlhW?=
 =?utf-8?B?dnFiRXFSaXo0em5Nd29jUHNyWDNnVUQxdjczaTJwWGo1QUVMVHY5Z041WGRr?=
 =?utf-8?B?eFF1YjhYaVBXZU5hckhaQ1AwSTNXMkZFMGNxSVNoTXFIUGU1ek5IaFArbTN5?=
 =?utf-8?Q?cHjK0AMP0LRtRd8FJ14Le4Ycn0t10Mmg?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4875.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?Ykk5T3BMemk0QW0zMGJ1RlpMMkJKQmVEL2ZNQkMzeHJnM1VlTEFIVUtlSnNX?=
 =?utf-8?B?c3I0Zk9LcVR4am1FMlhJNTg3UkNLT2VoTzJub2JzcTJ0YnBtK2dpQ0hFcXZI?=
 =?utf-8?B?Q3NmWkJ2eEhoMU9nQzBVNitPODJBdEYrdmliKzVHYXl3YTZjNHZyRTcrZHk4?=
 =?utf-8?B?UmMzS0EvNnlmUlRvWi9raGFjRWMyd3lCbHZHbTR4eDFnZjczbjB1cHdpZ0Qx?=
 =?utf-8?B?RW9UajVsK1ByQ1hob0ZXL3o1bHdUT0dWRElRRjZ4TXFSRGxHb2RhTE83QW9Y?=
 =?utf-8?B?ZEZzUTJTajcwN0V6ZSt3QnptR0VUMkxtSFhzVXBGalBqWldwalEyNGg2VHQ5?=
 =?utf-8?B?YjJzdUlZQXJENm5QZjlrZGtMMlZScWRlYTZqMDVOSXBYN1VIN2ttU2FMTU5G?=
 =?utf-8?B?ZjMycGk0SG1CRFd4aTNmUFJUUlJ2NmNOeWZMV0F5Z2lSeE5FL0hWR256SVBI?=
 =?utf-8?B?VS9XU2lqZ0xkUU9oUWdPYTY5QUppL1ZWTkQ0akRScVFtWFQyTjFhVHQwVzhx?=
 =?utf-8?B?MjlIQUhvcHpDM1JOeTYyRWI0UUJvcEkyZC9qK1dUWnA3Qi84UWxWblBObE5a?=
 =?utf-8?B?SkpnVTdsN1haSnpCN25nNWpWaEQ1WWZKY2Q3YnJURTNhcURPakdUVG5PWWJk?=
 =?utf-8?B?SGhKQXZvMldla1NxVXVoNmFzYURwTE1vclh0aklrc0locWVtOWJkRDNKZGZq?=
 =?utf-8?B?TldtNVFMYzRZWEltVW9PZkpFVFpFRTFMOHlaL1R3aXRlODNORlFKam1qUlZM?=
 =?utf-8?B?ZWJGOGIzeitiOEZBTXI2WXV0elFwSndlS3prR1JIeTJDQ1IvdUFlWVpFUmc4?=
 =?utf-8?B?Q0ZjZkJrbmNpQXVNc3VqTVdJYVVpdXJkRWl4Q05xcEo0dTdBNnNQaWtib011?=
 =?utf-8?B?dVFHcEtjNDUxS255QmphY0VvRm4wV0swUDIwcVdIRXdkcGMyeGdDSStYM3hS?=
 =?utf-8?B?SnZYdzBRNjl0aWl0dTlqZ3FCa1dIVVozSEhsZXpCeTE4dHZHVGNISGxkRFJR?=
 =?utf-8?B?SDQyMkhtK3RuOVBaRFliYyt3RFVPc2FJbTFEa0JOVDkrWHdUSlg0U0FvQ0VY?=
 =?utf-8?B?Q25HRXFET2dxSkpjWDhwWEcwY2x6RTVSVjROdFlvZFJneTBTb3V5cTNCVDla?=
 =?utf-8?B?ZkNMTWFxY3BnS2pPWW9nY2dYc2RRWWEzc3grbzcxZFVKaCtRQ291NUlhWEdC?=
 =?utf-8?B?VlM0N1pSSHU0OFNTRUNReUo4Q2tVaytlMUpFaFRwVmcyZ3BUMldRMG4wSENa?=
 =?utf-8?B?cnFTSEhzVkNuYUtCbVRobnRlTHZ2a2tTTmlxOVJQMDF1UjJYMWNwbkU5RDlM?=
 =?utf-8?B?bG1RU3hHcjAwTDRQWXNDTyt2eklIam1GdzhWcnVLc1ZGeW16YXNxdGdhb0x6?=
 =?utf-8?B?L2VwV1J2YURJSk5PanFyajlsZmNwazRKS3dNME93ZCtXUGdESVN3WWE4N0V1?=
 =?utf-8?B?dzcwczcwMFV6NWoyS1NuTFBLM3hNZjRlRi9rNSsxcGQzSjZwTEU4cjNIQi8v?=
 =?utf-8?B?NU1aeFBGSU1uU1d1RmUrNjNXRXl1a3ZVeVMzaXIyNjFBWFY5MHdKNi9pMzVj?=
 =?utf-8?B?amdXMndJQ1BaQzdsNHp3NUxLWGNQOHdhb0NzTWsxbEtieCs2SHg2V3lUVUJN?=
 =?utf-8?B?bnE3bEhGK1p2eEM5dVp6Y2ZnUW52ZXJEYmhzemJZbkhXMWQ3dHRXQWtjR1NH?=
 =?utf-8?B?WFZDVGExSENCdXN0b0xYM2oyMUM3b1pPd3NYdTBMN0phNGlkem16MkFMY3Zt?=
 =?utf-8?B?U2hBOUZJTkdDdzYrR0tXZUJjakNaVkl5MWYvMnFuN3RGTEptSEs2alFjbEZW?=
 =?utf-8?B?Mkc5MFR4T2Z6Z1NRcGZOSGlodzJHMXo3bStiUjQxakNrNjEzS1Fta0hTdi9i?=
 =?utf-8?B?M29iL3ZpeTYvMUdxVU1IUDY0RFlNa3pETlk4S2xRTXluTm9XT28wQUUwblFF?=
 =?utf-8?B?OW9UU3hKbUtCVFc2UXFLS0JpWlRKeGYzQjJOcS9RbFRuUE4rNHk1MXozcjJp?=
 =?utf-8?B?YU5aZzNaVUdocHEvbzduSEI1WXBTQisvM1RyNGpyWm1QUWhFOHlwc0dQUmZh?=
 =?utf-8?B?MHBDT0lseEhkWUtVSVRneFBsdlpzZmprWlFZOTVJTkI5bXFRSFV6Yit2VFlG?=
 =?utf-8?Q?UvF4=3D?=
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
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB4875.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4d5df274-2b5d-46f7-911c-08dd29a5b507
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Dec 2024 14:16:23.9450
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: x59ZPXYhmhFOzWbYTkuLfwAZgKsSSLrJZSS8EDcHdMOb3EF+7kgW1yhO/p7FD55CBuzT41E0XHUHgIouva5PKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB8101

SGkgU3RlcGhlbiwNCg0KVGhhbmtzIGZvciB0aGUgcmV2aWV3Lg0KDQo+LS0tLS1PcmlnaW5hbCBN
ZXNzYWdlLS0tLS0NCj5Gcm9tOiBTdGVwaGVuIEJveWQgPHNib3lkQGtlcm5lbC5vcmc+DQo+U2Vu
dDogVHVlc2RheSwgRGVjZW1iZXIgMzEsIDIwMjQgNjowNiBBTQ0KPlRvOiBWaXNhdmFsaWEsIFJv
aGl0IDxyb2hpdC52aXNhdmFsaWFAYW1kLmNvbT47IFNpbWVrLCBNaWNoYWwNCj48bWljaGFsLnNp
bWVrQGFtZC5jb20+OyBtdHVycXVldHRlQGJheWxpYnJlLmNvbTsgU2FnYXIsIFZpc2hhbA0KPjx2
aXNoYWwuc2FnYXJAYW1kLmNvbT4NCj5DYzogamF2aWVyLmNhcnJhc2NvLmNydXpAZ21haWwuY29t
OyBnZWVydCtyZW5lc2FzQGdsaWRlci5iZTsgdS5rbGVpbmUtDQo+a29lbmlnQGJheWxpYnJlLmNv
bTsgbGludXgtY2xrQHZnZXIua2VybmVsLm9yZzsgbGludXgtYXJtLQ0KPmtlcm5lbEBsaXN0cy5p
bmZyYWRlYWQub3JnOyBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBWaXNhdmFsaWEsIFJv
aGl0DQo+PHJvaGl0LnZpc2F2YWxpYUBhbWQuY29tPg0KPlN1YmplY3Q6IFJlOiBbUEFUQ0ggMi8z
XSBjbGs6IHhpbGlueDogdmN1OiBkb24ndCBzZXQgcGxsX3JlZiBhcyBwYXJlbnQgb2YNCj5WQ1Uo
ZW5jL2RlYykgY2xvY2tzDQo+DQo+UXVvdGluZyBSb2hpdCBWaXNhdmFsaWEgKDIwMjQtMTItMjYg
MDQ6MjA6MjIpDQo+PiBDQ0Ygd2lsbCB0cnkgdG8gYWRqdXN0IHBhcmVudCBjbG9jayB0byBzZXQg
ZGVzaXJlIGNsb2NrIGZyZXF1ZW5jeSBvZg0KPj4gY2hpbGQgY2xvY2suIFNvIGlmIHBsbF9yZWYg
aXMgbm90IGEgZml4ZWQtY2xvY2sgdGhlbiB3aGlsZSBzZXR0aW5nDQo+PiByYXRlIG9mIGVuYy9k
ZWMgY2xvY2tzIHBsbF9yZWYgbWF5IGdldCBjaGFuZ2UsIHdoaWNoIG1heSBtYWtlIFZDVQ0KPm1h
bGZ1bmN0aW9uLg0KPj4NCj4+IFNpZ25lZC1vZmYtYnk6IFJvaGl0IFZpc2F2YWxpYSA8cm9oaXQu
dmlzYXZhbGlhQGFtZC5jb20+DQo+PiAtLS0NCj4+ICBkcml2ZXJzL2Nsay94aWxpbngveGxueF92
Y3UuYyB8IDIgKy0NCj4+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVsZXRp
b24oLSkNCj4+DQo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9jbGsveGlsaW54L3hsbnhfdmN1LmMN
Cj4+IGIvZHJpdmVycy9jbGsveGlsaW54L3hsbnhfdmN1LmMgaW5kZXggZjI5NGEyMzk4Y2I0Li5j
M2E0ZGY3ZTMyNWENCj4+IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9jbGsveGlsaW54L3hsbnhf
dmN1LmMNCj4+ICsrKyBiL2RyaXZlcnMvY2xrL3hpbGlueC94bG54X3ZjdS5jDQo+PiBAQCAtNTUw
LDcgKzU1MCw3IEBAIHN0YXRpYyBpbnQgeHZjdV9yZWdpc3Rlcl9jbG9ja19wcm92aWRlcihzdHJ1
Y3QNCj54dmN1X2RldmljZSAqeHZjdSkNCj4+ICAgICAgICAgICAgICAgICByZXR1cm4gUFRSX0VS
Uihodyk7DQo+PiAgICAgICAgIHh2Y3UtPnBsbF9wb3N0ID0gaHc7DQo+Pg0KPj4gLSAgICAgICBw
YXJlbnRfZGF0YVswXS5md19uYW1lID0gInBsbF9yZWYiOw0KPj4gKyAgICAgICBwYXJlbnRfZGF0
YVswXS5md19uYW1lID0gImR1bW15X25hbWUiOw0KPg0KPiJkdW1teV9uYW1lIiBpc24ndCBwYXJ0
IG9mIHRoZSBiaW5kaW5nLiBJdCBzb3VuZHMgbGlrZSB5b3Ugd2FudCB0byBub3Qgc2V0DQo+Q0xL
X1NFVF9SQVRFX1BBUkVOVCBmbGFnIHNvbWV0aW1lcz8NClllcywgaWYgcGFyZW50IHJhdGUocGxs
X3JlZikgaGFzIGJlZW4gY2hhbmdlZCB0aGVuIFZDVSBpcyBub3Qgd29ya2luZyBjb3JyZWN0bHku
IFNvLCBtYWtpbmcgbmFtZSBhcyBkdW1teS4NCg0KPg0KPj4gICAgICAgICBwYXJlbnRfZGF0YVsx
XS5odyA9IHh2Y3UtPnBsbF9wb3N0Ow0KPj4NCj4+ICAgICAgICAgaHdzW0NMS19YVkNVX0VOQ19D
T1JFXSA9DQoNClRoYW5rcw0KUm9oaXQNCg==
