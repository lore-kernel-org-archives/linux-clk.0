Received: from NAM04-BN8-obe.outbound.protection.outlook.com (mail-bn8nam04on2055.outbound.protection.outlook.com [40.107.100.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 093B91F9ED5;
	Fri,  3 Jan 2025 11:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.100.55
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735904124; cv=fail; b=D5LdC17hY6cHAAGoy65dNacvIpcHPAdg94N2YPrNuP7vYYdppJjBm1bGjnmiXmLDoDFpD/DBbeU5i90+1Y9QmTaekqdh530iDQrmEQzkhlAQro9NVBVwuh+J0sxhEX35xPKJ5cqd9aJmDg3n5YvS6jkJ1umJhj+jVtTmlGaHk90=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735904124; c=relaxed/simple;
	bh=UM5S88DP83tomJ3nrw4fPaCEsM2HlYS9ljGzSa7ZGT4=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=aiBJIOhrU0cvgnsA/geRHazoo+aHOqCR2dEic70zPns3/91iqO8i7Z2vtsAjahfL5lOMnPBn/AG1c7bdxNs+rUC+239Edd0uQN94EItiwGT0nkywvOVqSztg6PkbUBztKXFUKXmeaCoytBYl/GQoBz//IwXinF6H1egGMSU/pCw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=qUeZI3Zm; arc=fail smtp.client-ip=40.107.100.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="qUeZI3Zm"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e3aSg5cbeaOJnUXzmM/zhiravaU7wDLI2aBkIn9RliomIoQPNfbbK+C89Zo4xgbTw7fTpVkqRv+Beh3ypSbT2eMLHByk27g1CtDJ29ElGajDNOVpDfiPA4sTpdYUMJqaMuwfkTv8TUM7J6PeJGYguJYJVCvFmiZAu+Ay45u39JL8pvoHYe/tcrC2v4K1W3ocCluz5Lq3rE3/+dc9dDSqi+GfUEt+AyE1s2EuuuM42jXVQRGJ6jiu7rjwr9CH4aP3unVaDPllQn+kN2rfigETRN9Chy7NH02iXbyG9AYnuPMX+TlymSH9eBkym2WDcIPrm/217PKjrL0zEK2iXbtmtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sqpmG6sUCKRNzAqwVEbxbkyrc1DdeTgQBnqxVEALyhk=;
 b=ydnttxnBgQ7S8ZZsxorljPLGFy6bGynRuGgzXdF8ve/3vKQ7TOQPf/3MhHCVw4uzagDDme+kCNk5qdtYm753gfsUDLbVRHX8I4ufCv3wEojRNbrQeKjxyksOMgSYkHQJ7RnD2+qWbxPKZ8F9t2o6O62Qtlop5Qw156eFrqciDnJd6U4EIWK6rYPiNDEGzCYjA6M56Xpo9nNORseQS6JSJvP+3+fPYCp/XqjnI4no+iwFA2LzgRinlqqUDcBrkOOs7xH1uMqukjsKUUHRF/usnirfkwIpWfmpOYGpyiRQL2Q5gPvgtKAQo9GTFKvjaIwbn+8LY38eRkqYnWTrtom2Yg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sqpmG6sUCKRNzAqwVEbxbkyrc1DdeTgQBnqxVEALyhk=;
 b=qUeZI3ZmgzM5NkahGvcsJuYeKpTo4bZrGl4J5P1GlUPjZ6EHhK4uPPQBVrkotASyM4nA106aapz2xHQodtxZ0/yVe5vkLXEJZC9TrK2I6aY4cSO6hYMX2yiCgCc4dW2u5cBKwJ2uuQLdyN7C9pNwIhV/bRzJ0qONQY1poINGM2Q=
Received: from CH2PR12MB4875.namprd12.prod.outlook.com (2603:10b6:610:35::24)
 by MN0PR12MB6295.namprd12.prod.outlook.com (2603:10b6:208:3c0::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.12; Fri, 3 Jan
 2025 11:35:16 +0000
Received: from CH2PR12MB4875.namprd12.prod.outlook.com
 ([fe80::ff88:6c6f:c187:6511]) by CH2PR12MB4875.namprd12.prod.outlook.com
 ([fe80::ff88:6c6f:c187:6511%4]) with mapi id 15.20.8314.013; Fri, 3 Jan 2025
 11:35:16 +0000
From: "Visavalia, Rohit" <rohit.visavalia@amd.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, "mturquette@baylibre.com"
	<mturquette@baylibre.com>, "sboyd@kernel.org" <sboyd@kernel.org>,
	"robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
	<krzk+dt@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>
CC: "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: RE: [PATCH 3/3] dt-bindings: clock: xilinx: Update VCU bindings for
 reset GPIO
Thread-Topic: [PATCH 3/3] dt-bindings: clock: xilinx: Update VCU bindings for
 reset GPIO
Thread-Index: AQHbXTSjAjUanOkjk0GhB74y61pj6bMDziSAgAEZLuA=
Date: Fri, 3 Jan 2025 11:35:16 +0000
Message-ID:
 <CH2PR12MB48756A2F01CD874686F141DDE5152@CH2PR12MB4875.namprd12.prod.outlook.com>
References: <20250102163700.759712-1-rohit.visavalia@amd.com>
 <20250102163700.759712-4-rohit.visavalia@amd.com>
 <35351b4f-daee-46f9-8d0e-f3de12869794@kernel.org>
In-Reply-To: <35351b4f-daee-46f9-8d0e-f3de12869794@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CH2PR12MB4875:EE_|MN0PR12MB6295:EE_
x-ms-office365-filtering-correlation-id: 7a63a470-ce59-4fd3-dafe-08dd2beab1e8
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info:
 =?us-ascii?Q?NtgqvzHaY/BXfvBSuK4QgKZJjmzpLwaNKkV3F2YYJ9r6j1JTuZ3pRzKy//YR?=
 =?us-ascii?Q?rjv6VgjxUUsBfpm4561DW89wFgBQp1ykqW7l8RCNtbtafbhEe97lPOPdd92x?=
 =?us-ascii?Q?iQhTr7lmUCwHOTNQ/oTd93nuPSLXFlF95UYaSaUgVFq0j+66pcIMkzVjpHE7?=
 =?us-ascii?Q?JL+NdbIBGmSN3hf1lxWToOJt0HQo/p5g5ZfScuStb4gofze/hO0hA1stZYdq?=
 =?us-ascii?Q?ebmNZjtf0hp46B2u+L926JulUn3HRR8tzQ+IK1H9Fm1u8s2OD1cd1yMB0QPX?=
 =?us-ascii?Q?we7zSfGorI0cJhl1w7LTXXWzcoFLGyJduX6UUWw0496U5Cb6NRHTiBsJlVE+?=
 =?us-ascii?Q?VheiLr+goFOgKZxidxb1ODN4IyL0OBsie8rySjWPjW+aIIlmrjHL/pxuLp0r?=
 =?us-ascii?Q?fzq4mamcf8BbcndEZzAEctilq0SkXD4rELIefOBWBdvPYGCFLPofJ1ZcE0C8?=
 =?us-ascii?Q?kbUi+6weMGEhe7lKYsYXzJqA5jpsAcTcPyEyGnB8WTr9UtOLgj8QOgsYz5LO?=
 =?us-ascii?Q?/lMFD7WoKHYk33vLGc0qShEzU4XozyXTE8ZAEWAvl9GodcQ4Dgsw73pRXaol?=
 =?us-ascii?Q?2r34n5xH0CXKgXEnI/sztC2iTjPC+NnzN2rJjkGqNg7Ngi9CdnptDcvZgTX5?=
 =?us-ascii?Q?EkbiiN8E3Q1zriIDivWcyoDrc/EutbgiShLBdgq5KIwRFf1DW9uiAsykkCJM?=
 =?us-ascii?Q?dJ6qkLSRcF2kmYKO0EOoODEpg3MfmL9px24etHi/64iUI//IZt7RdhuIyRaH?=
 =?us-ascii?Q?aSjQ6prRjUi/r96PUc2wNPcrGF6MzaqdcWj95iqhTxGlHh1OjYtfqbnneLAJ?=
 =?us-ascii?Q?z5TUENlE8mUApnFevkdl1Vk/TPFzXbpay1nqojOIdeS0NmlnA3PTSN3BeZ5W?=
 =?us-ascii?Q?9V2okG8tNqQOk3XP1Av7cTkA/5D6gaHlU8Z9qkdEsAZkb18csHjMMUzroG54?=
 =?us-ascii?Q?zcy1WIWgnvSKK5pe2j2ZJt9/eonRXmqh+2r+1rwi2+NAO7xPY3ezKqD1xTQ6?=
 =?us-ascii?Q?x7IsIa/bhLFNFCjpcdVg5HD1UUFpfIcBA0Xdd1FtLmbACHPV1cFWDkr/6plv?=
 =?us-ascii?Q?9RUcrPMbwbTWAILny9eDAOHio0vDap3e8UNCcIqjfoPaM9U78Gg/QQgVgMUr?=
 =?us-ascii?Q?E29THx+bS/pA6X8vqO+zSfxEiPD6OyMI5OTX/wKrQEK4X4HBMdUDdu2B+HNT?=
 =?us-ascii?Q?hmxlAHytj4ruB/o9QRLjkmiR7BGHyxoBC32A+A1kAjTh5jJ1kAG/e7gtKD7t?=
 =?us-ascii?Q?4f6VT+voR+v6GOP+RoXGnIfR/zKiftjqRUExoAkE77Gtbbkwv2pskiCPgFbP?=
 =?us-ascii?Q?33HSEdcSgeINvGxHkg1waIvTN99epPM26xGS++pGjbHlgTPpUFzrRJ2m5qYk?=
 =?us-ascii?Q?hVlr9f/2p+J6UOIIHeZGenTsVOj9u7HihXfJeFdehJKnHvOF7tUwTTb3BRle?=
 =?us-ascii?Q?v+Un0fBhyhCNQQg98jAuaOSu48gi03uZ?=
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH2PR12MB4875.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(38070700018);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?us-ascii?Q?9LEqgqRvgzKQGdBwSbLkk7zDIorXJV7KImvXrPi+QZgHs6Vz0ryfhAPUe7tG?=
 =?us-ascii?Q?hhTb9WvsHrVnAVJCg7IkLCkYKMQz88MnSnutzx7Z1gdIQnRQf63puwYR4yT/?=
 =?us-ascii?Q?yTtWzwzU5m8Kt+0wyvzISyNIyz51wQz74S3zg4+BY5Zg0jpxIwWcHsG4jvYt?=
 =?us-ascii?Q?52hhZ48M1GCEAq8X8njkXuEgz2AGzKw/TDlAWaop1JYWOL/tG+w7qnXqKeIH?=
 =?us-ascii?Q?41BCqsvtHaVyW6OPIO2iqogTN333JdPypPq9LONd3KZElYKKnAue0CIc0ZsR?=
 =?us-ascii?Q?ZRW+M7BbkPIFA62p4rqknrwcNh6uEiW185Wkwk+5hOYRRApkYAips/xZaeVc?=
 =?us-ascii?Q?7E5i4Pmq8GfK1ZVOld1hyIZOx/2OFtUoKaF94lPiNu8OyPiP32tDNT2WoClR?=
 =?us-ascii?Q?9kz+Dg8y+QU+fCYKe8WucsW8wFHQ0fIUWW8MW88mQ82ZG7v6lPpq9pGTLkU9?=
 =?us-ascii?Q?GSeAdURnegoFdk8b6DUlUMijlUk4h5akSQjlheHaShbHv+kFsTes6jj8v/r8?=
 =?us-ascii?Q?7kg/GAZK2dgh3HnwP/v07z85G1YRIRt25Ye+PEMUgMsaBcC5EB4PgsfVRE+T?=
 =?us-ascii?Q?FRFxJX9FK3lWnAwfhwrn6/yBeqyRc8n+n4f+L5FT8giJ2Ijy85PE02YZwMXd?=
 =?us-ascii?Q?OkkDWhBtiXHKd7GBSPS59ChRnpHY2jF/zYNuOy8Chf6IpoD+/M4k8bCoOqy3?=
 =?us-ascii?Q?dGoDBh4CMPrL1foNEc3QA84Vw4FIYRBSLxhF0/E1dlgKgT24s9ApzhsEGNCA?=
 =?us-ascii?Q?Nk3DoBR4cvUnfSqRdGJragXdo4IamIzuluwkeCa2ovUrXPmqmhZOuizfXB4X?=
 =?us-ascii?Q?pNYMJlhCOnzSDE6p3g6x2IhwKAwIVnz7JioXt6RTWE5mFfm5TvU4HrVjaoOV?=
 =?us-ascii?Q?33vVLIUFY9EXaH2MdfaENUUUw1OPQnToEX+PgdjFnk7VpvOegCNuO8nfJwCa?=
 =?us-ascii?Q?lm5qskbRXgiIA2d1cxSKAYSOmr0MZEJe3bABjEewQN0Qm68Hz7reSjyidkIg?=
 =?us-ascii?Q?fxTE92m/Jz6yBnP4RamyacL1FSAiOGnvQcEJdS6F3z6wweiOFD8YmcK9IhXB?=
 =?us-ascii?Q?G8BDCEZBvKVV/jf6LnCoLSvqyQcyA//gCAWXnzKgHpAHzaxxqMKYf+VY2H6y?=
 =?us-ascii?Q?QwfAsxK8/YNxhA//ETnZwOVeuc1BxAaxRePObQQ6cSv84JzDSL41C+NT5x/W?=
 =?us-ascii?Q?I8E1a2tj+6hHZop7q89uVExkmYiXSH8ta4SrXhFl00D+UFU37YzrfTpwOkCB?=
 =?us-ascii?Q?k+y6tlJVsgd9FztWx+NDH+vP1E6kNWB/ZilPPwNxzYp+Mt7Hv6ARtDXPBDF7?=
 =?us-ascii?Q?PSzPOpjA59oH8OmGVtv1JdXvVX7EtlUZmdn7EkuQQseGBWe9+5zkACTZwI9o?=
 =?us-ascii?Q?N6W2UBBWFPHYou15tXlG7uuxUHPGIS2tdzxUjUnumMW2pIiAL4qJqlLlcggA?=
 =?us-ascii?Q?X7DG5C6IEusUzOKua9MyTy2G1CrOUDKqEhOFid/mSqA3mQkdwvidf82NJD7b?=
 =?us-ascii?Q?iWcyDf3MJbo8H6Ex12CQFH7Laa+wdU8CGmTNZd+00Ih8B8eXwrEaiV/F339s?=
 =?us-ascii?Q?tEQ0DBfSVOjyCWyrw/M=3D?=
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
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a63a470-ce59-4fd3-dafe-08dd2beab1e8
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Jan 2025 11:35:16.3533
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: jq4qrHQ8+q0+IBrlbdCDMHhqTP5F4F8FJhekZNR5y0bw8AQVIfwCJr7qIot+4WaJdnbFLNv5DistFU3qo5n6pA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6295

Hi Krzysztof,

Thanks for the review.

>-----Original Message-----
>From: Krzysztof Kozlowski <krzk@kernel.org>
>Sent: Friday, January 3, 2025 12:00 AM
>To: Visavalia, Rohit <rohit.visavalia@amd.com>; mturquette@baylibre.com;
>sboyd@kernel.org; robh@kernel.org; krzk+dt@kernel.org; conor+dt@kernel.org
>Cc: linux-clk@vger.kernel.org; devicetree@vger.kernel.org; linux-
>kernel@vger.kernel.org
>Subject: Re: [PATCH 3/3] dt-bindings: clock: xilinx: Update VCU bindings f=
or reset
>GPIO
>
>On 02/01/2025 17:37, Rohit Visavalia wrote:
>> Updated VCU binding for reset GPIO pin as optional property.
>
>Subject and here: everything is an update. Be specific and drop all redund=
ant
>things making this unnecessary long: add reset GPIO
Sure. I will take care in v2.

>
>> It is marked as optional as some of the ZynqMP designs are having
>> vcu_reset (reset pin of VCU IP) is driven by proc_sys_reset,
>> proc_sys_reset is another
>
>"are having is" looks like two verbs.
I will correct in v2 patch.

>
>I don't get here mainly why SoC has something driven by its own GPIO.
>That's unusual pattern.

VCU IP is in PL not part of PS.
>
>
>> PL IP driven by the PS pl_reset. So, here the VCU reset is not driven
>> by axi_gpio or PS GPIO so there will be no GPIO entry.
>
>Anyway, this has to be constrained per SoC.
As VCU IP is in PL, it depends on PL design creator how connection of VCU r=
eset pin is done.

>
>>
>> Signed-off-by: Rohit Visavalia <rohit.visavalia@amd.com>
>> ---
>>  Documentation/devicetree/bindings/clock/xlnx,vcu.yaml | 6 ++++++
>>  1 file changed, 6 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/clock/xlnx,vcu.yaml
>> b/Documentation/devicetree/bindings/clock/xlnx,vcu.yaml
>> index bdb14594c40b..b3061309f8dd 100644
>> --- a/Documentation/devicetree/bindings/clock/xlnx,vcu.yaml
>> +++ b/Documentation/devicetree/bindings/clock/xlnx,vcu.yaml
>> @@ -36,6 +36,11 @@ properties:
>>        - const: pll_ref
>>        - const: aclk
>>
>> +  reset-gpios:
>> +    description: Optional GPIO used to reset the VCU, if available.
>> + Need use this
>
>Drop redundant parts. Not being part of required defines "optional"
>already. Don't repeat the schema but say something which we cannot deduce =
from
>this.
Got it.

>
>> +      reset gpio when in design 'vcu_resetn' is driven by gpio.
>> +    maxItems: 1
>> +
>>  required:
>>    - reg
>>    - clocks
>> @@ -52,6 +57,7 @@ examples:
>>          xlnx_vcu: vcu@a0040000 {
>>              compatible =3D "xlnx,vcu-logicoreip-1.0";
>>              reg =3D <0x0 0xa0040000 0x0 0x1000>;
>> +            reset-gpios =3D <&gpio 0x4e GPIO_ACTIVE_HIGH>;
>
>GPIO numbers are not hex... unless this is not GPIO :/
Sure, I will update in v2 patch series.

>
>>              clocks =3D <&si570_1>, <&clkc 71>;
>>              clock-names =3D "pll_ref", "aclk";
>>          };
>
>
>Best regards,
>Krzysztof

Thanks
Rohit
