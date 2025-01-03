Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2055.outbound.protection.outlook.com [40.107.100.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3649F1F8F1C;
	Fri,  3 Jan 2025 11:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735904122; cv=fail; b=s14/VVWYM1T4Wo13EHdCSQAYGx/fQn8g+3k9at4ucn0wY5zaOi+HFOH1jX9ddE9EHn6bmziSFBZvbyOhFZJk1quqEjpGZq58TiQ4OQaumYSPv1GxOswuCqt9U4cnClcry/c+HMhM1W3XRvLb1TM2h130LgddzJ1kDNlaCL6Ew7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735904122; c=relaxed/simple;
	bh=0ZHlL5WMPP9gZTyrx2lDTqln1wlxFSmS81pMSeOyaok=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=RumwKYZZauyRfsod3jnZ0FaC2hr7wMSpTvXglciA6LrdynDR2x5FSa1Srh+u5kv8Vc1MzkdV/DXZk8n1qT26I4cYNtz6RrWDEqmTpXC7terSFihKhhaaPfoFnw2pjWKHCudS4Cb8btltyUznD5MGqPYSUhyRTz+2JfJFtsZXTE4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=5NWBh5ir; arc=fail smtp.client-ip=40.107.100.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="5NWBh5ir"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=AuXd2d7eeWjAt0nZQovsySa/6wP8E1cCR5epYrsTmMClF+3t2Jr/YTOx58sAv/EN8lD2TkDeOIKoXDleLqVHSbDAju7+zMkQbnU3rMUpzyFC2EJKQFxqSOdXgtN0uFpbI/j5mK9HeW9QJqrTee4nS+NG/RaAt+5vNXRM9pe6X9aKeyD0TnVMMDDAHLpx8U/qaU39C2IMOtWr+99WwfuKk7U1nq36QgzbFr4nrItVzHdvlRQMykvGjyiw8cvlnw1+bdOJxVtRYoMRuXXz7qOVwDGuLu/wic3DDjpyN3/hI5xACoOnrm5Nrf6Au4G5WvHxkZerKmrP0fa1Ne1955kc/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kSHQgn42jaDR0o+a1m504KgRA6CJj4T6Ec+BNd0EhMM=;
 b=xTswpjRn9lTMXMwASsrMT+dvqpWmTkGK7fivPyeIzwz4mXyHr6xEAoY0nxpj40RH/Ylq3RxX9ni8DywJc/2uHSHy61HUAOqF8jcNvc/RUFw9lBcYJvXbdx+toUYNv2t7qjUTh0j3BJf4/+XPkBClix0+e8JDefBSWEu47B8AZq4eBVrKOgaf/tcSJSm+e1IvXs4CaKThB90IPe8b057O0LfARES5Xo/7m2pSR5OCAomV7r2Fzp1uChS5ASQAcqLGQEaIUXjE6Hc18grcHBIiM3fA5LoDaotgqFGqh6tmAWnIZ+wGk9MhL2gkzQyL3ss/+I09zMbb4oaTw/PnfOKZ0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kSHQgn42jaDR0o+a1m504KgRA6CJj4T6Ec+BNd0EhMM=;
 b=5NWBh5irmq4FgrHSHFv+F8kQ5ZiX2b1J+0a9nWPDrNqhUFSstUhPvbKsO4M97rEMGFS63QSyDSNTpf+JTMo5W07sOmcfr67ch+QhgUVituGoYr9qQQiec+9coxKsmfG3z/ksstSBs1by9zCNHh8/tKPFC7ujegkKFR3EtmodT/g=
Received: from CH2PR12MB4875.namprd12.prod.outlook.com (2603:10b6:610:35::24)
 by MN0PR12MB6295.namprd12.prod.outlook.com (2603:10b6:208:3c0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Fri, 3 Jan
 2025 11:35:13 +0000
Received: from CH2PR12MB4875.namprd12.prod.outlook.com
 ([fe80::ff88:6c6f:c187:6511]) by CH2PR12MB4875.namprd12.prod.outlook.com
 ([fe80::ff88:6c6f:c187:6511%4]) with mapi id 15.20.8314.013; Fri, 3 Jan 2025
 11:35:13 +0000
From: "Visavalia, Rohit" <rohit.visavalia@amd.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
CC: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 2/3] dt-bindings: clock: xilinx: Convert VCU bindings to
 dtschema
Thread-Topic: [PATCH 2/3] dt-bindings: clock: xilinx: Convert VCU bindings to
 dtschema
Thread-Index: AQHbXTSRAfcW3KxWlki7CeaPPiBPwrMDzSQAgAEZgTA=
Date: Fri, 3 Jan 2025 11:35:13 +0000
Message-ID:
 <CH2PR12MB487574AB5E22A9DA58ECA5DEE5152@CH2PR12MB4875.namprd12.prod.outlook.com>
References: <20250102163700.759712-1-rohit.visavalia@amd.com>
 <20250102163700.759712-3-rohit.visavalia@amd.com>
 <49d2fd63-cd27-4a49-b581-62722e012451@kernel.org>
In-Reply-To: <49d2fd63-cd27-4a49-b581-62722e012451@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB4875:EE_|MN0PR12MB6295:EE_
x-ms-office365-filtering-correlation-id: c556c2d6-66d3-47ae-f722-08dd2beab00b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?Zu7zQjUBPY1b779EMQyI4hYNnlG0T5DhkntyWHpAB9xa+Pr4ICBTZPkuK1JY?=
 =?us-ascii?Q?/6/nj2DNmOKD6go41D1ZmYjqKtChgaYm01MLWoOho3NIT3jB6zttMlLHcAnT?=
 =?us-ascii?Q?2wLxqSsLrUUeR7W731S/zyZO8X+TjGzzwUeOC5q0JdDMppaYMySqbVRJ8bgK?=
 =?us-ascii?Q?lEbPFm6S0eGjbNxx/TroNynubo8yCRnJsz7LdBCcaBnXokJ2i4gx9pXGi72E?=
 =?us-ascii?Q?atmuw33FHizZ7dp6BJObUlK4t2i4Uy+uGcoFsz4+KbdWwzQ3lDEh29xy/3kW?=
 =?us-ascii?Q?MwH4hxibnSeqR+CHHhlC3cGht5D4qKdGsVkJhWpjl+nYQHzOxWdF5vVjERWH?=
 =?us-ascii?Q?NwdiKONF5utcPRl6RqyKW263KxM2D+rUjXfHLh6aeUtFLeDtEeV5y4FOdnA5?=
 =?us-ascii?Q?PdVjaIU8wqs+ntwiRuAchr3ucmVBQ4F+QvL4I8ly7Q9CobtZGb1raCYfDtIB?=
 =?us-ascii?Q?grCEmCGEG/eutNPZajQZMi3+6UIzc40HDJlW7U88CGae9gTipj7Fsz+6aexO?=
 =?us-ascii?Q?nAKmvWMkGbvZxKY84Z+XjjjcqcGwXDhtLqkJxObxuEWI+c6vJEUFVgkouiz5?=
 =?us-ascii?Q?69WK7vzyNv+oRua1Pt/yM0Qaq7Ypn+NQ46o2kms9/AHgTA+9nxaRFc6gG3Ka?=
 =?us-ascii?Q?+9J7YgyikfYbNmt84EoV5PV9CZ2ythYHKbAqZPv2/PRFvegdh50q+QIDIn6D?=
 =?us-ascii?Q?FqHRMQVSNjvukJebTHP9OW2H2C/RDF40DH1TVWPHMeMth7WOn2STTq5duoMq?=
 =?us-ascii?Q?wcqEsXdXhoiT8cZo/wODsBeyFRBkdI+vLeHaV58bHt7WQJkndKnQnZlP/bT5?=
 =?us-ascii?Q?ZsH/t3Nyz9BCibgKu33y1RnXbFpGRtgrKriLixs5VJaDqCOjuLvg+e2CAOdx?=
 =?us-ascii?Q?+rxEUKiWXKhm6MQM6KbEXIAE944lkzDwY7QXeuhyiCy4ydQpAUOy1ozn1GK4?=
 =?us-ascii?Q?nb6cxGn1MxxBenLS+M/Nm1vXeDsC57J9DuadhukQ5mJKqke8WkwL17KL0PRW?=
 =?us-ascii?Q?NmS4+2iSGhT3v1HvSps3PIeZ9R0zV2JAk78IP++/LprZ4xU+Zk3M+ezsR/jM?=
 =?us-ascii?Q?onB5sTVdR+uWv4ZZ2Cc7XlNvA6Da8jSIMMa8dqH+CbuOKA1LMcpjif0qqtu5?=
 =?us-ascii?Q?FEBbe6MGfD69Kz48/y0fxQKBI8zTo91axqXjpzjPmupe6+ASy1lovYcLpwco?=
 =?us-ascii?Q?oqKQpn7KCdcfrl28I81DDQEafhKmPCfE5vCHuziP4v0xMCQI8mE5zuSzWEz7?=
 =?us-ascii?Q?E4Rd7rex1OCDaHZ3ZfJnYNzmF6oKUOIVLplawuM3yTFPgxX50k6WrKJ0OvIG?=
 =?us-ascii?Q?giDYowrx/ETecIWiDDiwkhUb2CgjZsMMJinVZyd7RaCWqQRM9UehOF+SYrEf?=
 =?us-ascii?Q?35cc/UbmsDTyYFj+HXwgCk/z5P/GSXeG6jyUjKF5ip2n0slBzTm40riqyZg3?=
 =?us-ascii?Q?eYFLqzhc5PAgp227nA71blr0RjVLJtiB?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4875.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?8k9R3jm/4BUc7wDqKBdRL8PpWV2VY/NolckmsLxHokS+CdTa9grssmAEARUO?=
 =?us-ascii?Q?AjpsS/9352TwymxE789SZcK7ywLQ12n+T88lUSj7aEqS/tWKGaCOpQ0H/wHR?=
 =?us-ascii?Q?N8MDXg8rcqg/v2tjNs34PLVH1m23tpY08h/P/o+B7RaUJFTPEkJDdiI/O/8w?=
 =?us-ascii?Q?Khu0cQImjK3dIBHJ3KsSrYpkyYf+37j8JORNCPV57dRp70NpZGu7CfVXZ91X?=
 =?us-ascii?Q?ja+iRqmZATK85RhjtEexgM+UVci4yaiFGwzzPyGIT9OVxfUrNGwpm5u6ssQw?=
 =?us-ascii?Q?4cocqJe+bTaVXPg/oXX6AIVlRGAj44D90n02W6hXeJ+QKZ7r/ZBrY42bUuWf?=
 =?us-ascii?Q?AjSha8GxnFxB1moEaRTlGEaPbDV9cpJT4T+WPaj7ffnnk1MaRx/m2yADugmd?=
 =?us-ascii?Q?5FNXCgASMHjrS3Gdd+VNY0hiK1DldA2ZzKE57Yqq7y8cGOux/ojuT75jxezO?=
 =?us-ascii?Q?ua1KQpSyMqHMoCroMRGFMNlpauwX/e229qpYHXzUHrRQEcnpEunzChhN7ZB1?=
 =?us-ascii?Q?E4rwbSI4PYhR59+8qd9NIJ9KW238g+fssOw+JUmiWB9nypKsRkOjGSkdukUA?=
 =?us-ascii?Q?Ky/OIodijeMKW9XnjYlOLo6idpeTDyhisNWbRgpM2jVGmyYbHN0OtRr1DIl/?=
 =?us-ascii?Q?BtDZvY4aUyYJszximR7RUkKjOZ/jgJaZvkVYCxeSRJOZk3WAoQxh7uTS9qGD?=
 =?us-ascii?Q?7t+ORK3WE53hVEOrAT8LL+Eb+Q0bB0OOvgFJquROm5Uv2mCFP/lGgOlWZPIr?=
 =?us-ascii?Q?UFT7xEMx6XhSD9DJi6/aP1SgPuNjGXZAfNAXWo/t/wbjwLHSx/elU14m0hNC?=
 =?us-ascii?Q?i3JU+O/GbIE8kIoSleq2G/cCgHkAoPBsrcAwMccsgXNHonWchVSKaf4uIvfZ?=
 =?us-ascii?Q?VReFR6o1ltIlOjmkm0oG+AJ5nqq9gyygZ60NG2LyHLgBuqGwr0wiQcoOz2lp?=
 =?us-ascii?Q?cILOaTuQ3Mnw/gix/oNmBlT0l+8VQH5WsWvs2DAt7uVH6VJL2FA8pH8JFer/?=
 =?us-ascii?Q?cnzmHuh8itbnmgYxlHa8nh7Tzd79phlRwFHPHwkaB9BXnsGY+MiamU00ly3V?=
 =?us-ascii?Q?V0I4xB6vMjs+BdOm9DEA/ecIFghla68TIHO/eQOnE3TJY+jVNDMUicZC9D79?=
 =?us-ascii?Q?3OGAErpZoBLZ6/NTZQ1mYHiGTkLanMIkWi61RWWKxWckQ6g+9smEb7J4mmDk?=
 =?us-ascii?Q?KVJaku2C/5RVAXmV/8BE1dqdIQekmslH958YszTEjQrYNrl1dchPwKyEnUG1?=
 =?us-ascii?Q?/NiKK57u1YvKlrHMNM5pwNTlB5gjEDRtayNqBwJud1wq/NIifIX+gfb9XS7T?=
 =?us-ascii?Q?LnIhTJsymtawvXKnsoV0ljvAm+Rh1Teg91nHEkTzJSzkMB93gOwgNkKpT8HV?=
 =?us-ascii?Q?1awcIbGuRuZuhlI8cCnOPgvbhmA5rsZT5elkRRgLPlDgFSXQv20rUq7chnST?=
 =?us-ascii?Q?nS+p/d7I8IMF7Boiv/bLmtz4h64EQ5aljfC3c2ahKNt7lM83jxv3mZEtd0LB?=
 =?us-ascii?Q?zcCo2Lg4RaVWrlAX/MdCBn8Z0OJVEmQuitmNe+jGhds9Pp9u0mEtzkrS4l4H?=
 =?us-ascii?Q?PXaqv5j7v5Oqkzza1oU=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: c556c2d6-66d3-47ae-f722-08dd2beab00b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2025 11:35:13.2023
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fZJ6MoCUY9xebK2gbQ3dfc0e1hiqHVumhT2BXPUAMZXdWbkGduRbI2EaK6FcWic6r6c2rWRgOv8I+OkNL9ZxDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6295

Hi Krzysztof,

Thanks for the review.

>-----Original Message-----
>From: Krzysztof Kozlowski <krzk@kernel.org>
>Sent: Thursday, January 2, 2025 11:56 PM
>To: Visavalia, Rohit <rohit.visavalia@amd.com>; mturquette@baylibre.com;
>sboyd@kernel.org; robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org
>Cc: linux-clk@vger.kernel.org; devicetree@vger.kernel.org; linux-
>kernel@vger.kernel.org
>Subject: Re: [PATCH 2/3] dt-bindings: clock: xilinx: Convert VCU bindings =
to
>dtschema
>
>On 02/01/2025 17:36, Rohit Visavalia wrote:
>> Convert AMD (Xilinx) VCU bindings to yaml format.
>>
>
>
>...
>
>> +
>> +properties:
>> +  compatible:
>> +    items:
>> +      - enum:
>> +          - xlnx,vcu
>> +          - xlnx,vcu-logicoreip-1.0
>> +
>> +  reg:
>> +    description:
>> +      The base offset and size of the VCU_PL_SLCR register space.
>
>Drop description, redundant.
I will take care in v2 patch series.
>
>> +    minItems: 1
>
>There is no code like this. maxItems instead. Please use example-schema or=
 other
>recently reviewed bindings as starting point.
I will update in v2 patch.

>> +
>> +  clocks:
>> +    description: List of clock specifiers
>
>Drop description.
I will remove in v2 patch series.
>
>> +    items:
>> +      - description: pll ref clocksource
>> +      - description: aclk
>
>Original binding said different order. Mention change in commit msg with
>explanation why.
I will update commit msg in v2 patch.
>
>Best regards,
>Krzysztof

Thanks
Rohit
