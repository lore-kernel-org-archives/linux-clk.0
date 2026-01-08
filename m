Received: from AM0PR02CU008.outbound.protection.outlook.com (mail-westeuropeazon11023114.outbound.protection.outlook.com [52.101.72.114])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B25E73101A8;
	Thu,  8 Jan 2026 18:32:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.72.114
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767897128; cv=fail; b=XHLGJZ5U/OysYNpEck+j1tEX/2aGoW5+HbnK6I5ol2jWJXyiqxzzFIJiSboR1BdTb8rv4fXOpETDE+7nsJvJ+VRjP3SiCgPSZJ+7FfYHRxWXtPirnyNKP70nXI84WwU9sQjxMPcxZcpT4amhFQal5xojNO5i//InK1MnUQa1WBU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767897128; c=relaxed/simple;
	bh=qU1f7rj3txWhH67w7a+MQDJM5PhtN6SEhTLu1JerW/k=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=f6FQKpUtuu9VrxuLEW2LrGnORuG2JNJrEDSSTDFgABfCWPcLmR+EAUVpM8x3b+bmXCri1m9PHDOHnBjkTKmo094LSFqcS+Pq3UwvDfTDPq5x+FGW/xZ8IgnaCQSY1z90iCGiYuGiERSX/PjC8kNCOIdQ6TsSoYGdqRZ2/hu2npg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=genexis.eu; spf=pass smtp.mailfrom=genexis.eu; dkim=pass (2048-bit key) header.d=genexis.eu header.i=@genexis.eu header.b=M/SZv70O; arc=fail smtp.client-ip=52.101.72.114
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=genexis.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=genexis.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=genexis.eu header.i=@genexis.eu header.b="M/SZv70O"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LiMcXhYOraoiaxQHLmeArNsZhGd5CdTsR6pHsAwpRoFBKVMQ06NTm+5IsLgNdoFSFCbHvpxGKjRD62QEW11ViVdDrW1QOiI8kuF7OEFb9J2zx9/H4ePFTXghOswMaQEzWeP5gbglz2LJD0svRasHWfLmIarxE2uy9QN1U5k53WsKYFu8HPSkGtSRMPM0vLRKXj/uvySMtzg/gb8aDY6s78E4vfhh+D7sD47Xo57/X7ziY1dJGreWqmJWk2vkPlqCa3+RQonmRd0l7HcgFvXs04IYAQ5JvR7pS/FVitxTxIQyisIEcF463k3cSj8wqffefpghgN+52Fk9e7wtsPPmwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XCUvavT3SZ9gowc0hlxmOfDhhLC2pWsaE3/lXWObs5c=;
 b=e0H9ajICMPkIVOM+rwKIjbzSi3QSm6phcokTi2XLrfKiLoaBZL+sMBTHxEQ1o0pZ1BUy6uc1rw3LD8DB7d9mw0bIhgGqPpKsD4bOMZrxJstf81NEWEgM72mgblZREqFkMdMZinlmee7yOhTVLCyJ1uEakvEiIxqgcn26TFrd8EMxnn7eXuUBHHujgRTRM0MUDKx1bjvzy4bXmKBsJIrfLyYKEInWzZiW3AHapVIMfm3/8c/5aii8asCCwdazHXCIbABZrWwVREh9gWqsO9EqHLjb5IwIEAnWatHBk0DZv85S0jHSvuXs69dwtsa+EeIiJ1KuaT6rLLLpoKOlMaJP6g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=genexis.eu; dmarc=pass action=none header.from=genexis.eu;
 dkim=pass header.d=genexis.eu; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=genexis.eu;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XCUvavT3SZ9gowc0hlxmOfDhhLC2pWsaE3/lXWObs5c=;
 b=M/SZv70OT5Ov0nP31V0IUH8fV7oS+gV/UtuJHjfdp8azq4DfceAxyEgcfswvn2EWhZ8ebRNz+7C0aL9F+YS1N8HHNjSZSVjCxxCThiom7131PbQ1mWmhbkRFhruS2PzpkQQuZ04vcZ3RDnhuVy4NpmorLCbYxEJI0ZQFSVPkzC6L6Qz1+TcJugOfmXPYgdGOGpDF1lA0JfuNv3hBDtnhw7csltpxuTmNNNDAAAzYMcLs8dI9xyqLSH+XBJ4T601dqtVv68QOcltm5VYl9hXAI7LFwg2B0cv+vObYqk9I6mNcdH+7QVESBEEMVRqgOUOI38fbZSUaDpqSTYmd5nkKoQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=genexis.eu;
Received: from DU4PR08MB11149.eurprd08.prod.outlook.com (2603:10a6:10:576::21)
 by DB4PR08MB8126.eurprd08.prod.outlook.com (2603:10a6:10:383::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Thu, 8 Jan
 2026 18:32:03 +0000
Received: from DU4PR08MB11149.eurprd08.prod.outlook.com
 ([fe80::8b3b:ee06:2f0b:a94d]) by DU4PR08MB11149.eurprd08.prod.outlook.com
 ([fe80::8b3b:ee06:2f0b:a94d%3]) with mapi id 15.20.9499.003; Thu, 8 Jan 2026
 18:32:01 +0000
From: Benjamin Larsson <benjamin.larsson@genexis.eu>
To: b.larsson@gmx.com,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-clk@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Cc: Benjamin Larsson <benjamin.larsson@genexis.eu>
Subject: [PATCH v1 0/2] Airoha EN7581 clock additions
Date: Thu,  8 Jan 2026 19:31:52 +0100
Message-ID: <20260108183154.681958-1-benjamin.larsson@genexis.eu>
X-Mailer: git-send-email 2.51.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: GVX0EPF00014AED.SWEP280.PROD.OUTLOOK.COM
 (2603:10a6:158:401::31c) To DU4PR08MB11149.eurprd08.prod.outlook.com
 (2603:10a6:10:576::21)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DU4PR08MB11149:EE_|DB4PR08MB8126:EE_
X-MS-Office365-Filtering-Correlation-Id: e1199f29-78be-4836-d4f8-08de4ee436e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|10070799003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?WVOn0564RvWgd4ht9gw1prU59L51OOMUeZPN8b3NfqqIaTSRZi20RiqELu1h?=
 =?us-ascii?Q?t2v4V95u8psEP7Gs6ud/fznyYlhW+oQdMEMMYbw2M9MdoLdYQKmhW6bGTY3v?=
 =?us-ascii?Q?o8iGu2wcc1eMHo2Qu3LHG7BEgE9gbenMaGx8cxYx0XXIFqGGuaGaGzEAxMYt?=
 =?us-ascii?Q?cb0O4U550ZaHhR0hlbIoLAL/UF7GB2cNQvyODSUOqJoZTo1M+Z6OPnLfkok1?=
 =?us-ascii?Q?mFn27Xeum9uP5j5G1wxri4PzFKBUF0Nur5BRuh+rqCw7KEYoP3h4NSYRCOyT?=
 =?us-ascii?Q?Vl920hnceIMUevRYg5NzzdAcHTxZXm2rN/OBqLWmbpfmhaqy7toeCxgbWt2j?=
 =?us-ascii?Q?xZUNILCpcfJdX0wr9uXnhX1EoP9hiID4zsTVs7KYvV9i10IGHZH3VZbVa4mT?=
 =?us-ascii?Q?NW2IpssTwS8gaXXmEJZ7wW3bxqeABkldfp89eeKyb3wpASTD/IcMm698jnEe?=
 =?us-ascii?Q?5yTDbf7snDUuaFh//Pq5tVsQEAzzMsYmUo5c0ljCB7WQvf17IH8zKSlWm1Z9?=
 =?us-ascii?Q?VcFX+/fjToH4NBNCUSEQjaZyth4hSPRkQwqVhH8o7XRNeJTOChQPOEje8UQd?=
 =?us-ascii?Q?od/kwF58TEraqF2+lwpbED5v/zIwnY6NkWfYUcpWuFEZYqlVqj5HXn4AnVLB?=
 =?us-ascii?Q?2lgrGdTIYslfJ+DUxaAuekf3WME831m+HEB0unt2CC1Bnuv7/e+G/0R8fr7x?=
 =?us-ascii?Q?U0cFvM6LVqgnEatO4fddOFTETLkAummnRfrZZeAPJGoETfuKiIn4qEyBHrhu?=
 =?us-ascii?Q?SNmhwf1E1gCQVQ/YiCoNFEO5mJFxLSHgcoRyd8Kfgof9p8ZCUZfdCOwNoPPA?=
 =?us-ascii?Q?HHFU48lv6n7NGMqwKsMMfzMtfMAiVMtntQYCAtLfSjEjVWBRPFkwJdbjEbzQ?=
 =?us-ascii?Q?1ONNG+lWYuULM1nNIcCb45QpxszEmh+ejJJMxDFfdR6+I7KV6Aw4QTg47CEx?=
 =?us-ascii?Q?rU/Y+mAoXkl2VQkMfbsqDEzD4UFC38C8xn9UrE5PQI+6nrlLBZHE60gMChIU?=
 =?us-ascii?Q?em9iR3d+y2i+xqw3lcfnxt7HvHVnygAJVtO88yWmdWC4L34hKJQNfxgt8+Ss?=
 =?us-ascii?Q?rMZ9WWfX9+kRq18VkNZgAzgM8P5EXdfPqS0znGfpcFxXOz9nZEbbL21Y5A3f?=
 =?us-ascii?Q?X/ocvxLqpctz02f/vsnZZEaZ0ezt9BSyA/zRU+ggsWPZJPfjJ8B73bNuk66b?=
 =?us-ascii?Q?5Bzgl+DZvQ8hiQ10m2ygjdREI/igSsvgX//Z8hG2cJhbh9uzCW82FMV/m25W?=
 =?us-ascii?Q?nC6eEoWxgtCtPoToFPgYL7TSuvb+rVuy1Afd2WObfTsnZqjFQUm397bEmvmx?=
 =?us-ascii?Q?l5UHah/nxj/Q2j/imJJVoT8AS/I8WGToKjX0AONIQZSP8Wl8a7P3WbTu8dT/?=
 =?us-ascii?Q?ZOBUZJvb46b58eFXpu3Fy+kxlPO55yRP2VnhvqhTRC54+jeCa3dXh6bsWREJ?=
 =?us-ascii?Q?pbSiygxelhYk2qvZ6QuNbJ50p+BVjX+O?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DU4PR08MB11149.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(10070799003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 2
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?TsHRm9kSMbmuJoZbrpBfhj+0fCuNDYdDRuC4dartxgkEvxojWzkCM5nZSlv1?=
 =?us-ascii?Q?Et0Bt6QdHfzzfr6+UehekeMxvc9qqmYaeCcvGLTwUv0lRrxmLz1ujyBVgIia?=
 =?us-ascii?Q?AJz4LAxwPvqj0oJW2C4sc4o+qH3UokgG1aoglftOe3OeMFPPWzTgjWxHCE5J?=
 =?us-ascii?Q?/0ErwnbI+H26AKT/DBaZg+sZovDlgtY0mJKZM/3Am+tvxkxi8vIZFJw2sI65?=
 =?us-ascii?Q?ff97RkArjMIQoSlomWaDxuTr3OyTHGckqarZ1pqCVtHbwC2FLsSzvSbr+/4V?=
 =?us-ascii?Q?FB4WnIeg6zgP7DmNuGM2hqMWqykA/zfQ8Y8UYAlzd1h76B2Xdk3GO1WblmOU?=
 =?us-ascii?Q?E41qfR9MK3IcUvL1t2Bozik0qtiV537aOD+75LxVtuVws3zw70pqGIc8XJLr?=
 =?us-ascii?Q?WpxsXUbTCIVhW2ctzzaWuM0D7X8txiwJklsBm77XH2VylIz4kF45gNmiIcJh?=
 =?us-ascii?Q?tN1TYZ+wMfM7hKkTHR23Fmv+bhX4xy/T8qtMGf19KyxLOmC14cnsesfT7PBb?=
 =?us-ascii?Q?9m5hhTK6N9GYoRDd7MlUM3m1CxK285bTXLK06f7cxxvQnbTVac69H9tFA2QD?=
 =?us-ascii?Q?GauPwKS+1a4w+3wTLUHOZpz3XwhC8WfXF0u/JJwheOxhvEuHD7lmL0kpWBb1?=
 =?us-ascii?Q?4AJ2xSJUGwMci0w6+VbJf0CQ8jb1uvbue3jPk4oMLojnS+b8/x3iWR4gzc5Q?=
 =?us-ascii?Q?+7vh7I09/Ni/nNVj8gNh40rkRd0Y8KFQfboRw1g5aQvsqpdZFsQyA83bJDfM?=
 =?us-ascii?Q?B5JlmlmKIY7NC2YtIKcNvs4QpJC/cVwGccoSENG5jy/q7L48pfEpHdxnvdkf?=
 =?us-ascii?Q?VjWlQ1Yc7EDrVGY0xT4kAxvBj2McuhXfetY89KqLSs3fmqOG5GagvutDRH6V?=
 =?us-ascii?Q?Xf8pKRy2sZPWwC+b8/w2kPUoJGQMhCC1UErvFQ0cU/WaU0LSxW90XmlhL3ks?=
 =?us-ascii?Q?ix2VtRMCmazHpHQgD91bUQHHpzb5jjJuJDZ/mQO6D8TH9AjwY6rvhYzeuAzV?=
 =?us-ascii?Q?XRjMaW9fHGeSX86sezEdNzsHtVxNXTC24eLXk2Qd5USz6O08WliohhUQJNkp?=
 =?us-ascii?Q?H+VZfuC1rINehfs1eZmldOTj/vShMQoMaWAYu6GQ/Yk3KTBFqQY3CXx9tqIk?=
 =?us-ascii?Q?FGa3SSLe+McSbT5t5tuT5PF0d02K87ZpmvDroJWXjG4CWDOJ6eAV0RAQvv2K?=
 =?us-ascii?Q?An5kMDZVmMkuJWkCItH5isZZK0IzhAEAzvGZ3Ike1EqYM1IKIy0JYCQW9FeE?=
 =?us-ascii?Q?SJZwrqb34GRoKfOh+SnWkl/zQ3NKycID+TsuIF+O9Nlnd1OHYIdMFsTFT00h?=
 =?us-ascii?Q?1AtCw2mHNaoLNzSMDnrBHMOmB1HeoXqX5Tojdehhw6UW5gRwPRw0xFjI9zzl?=
 =?us-ascii?Q?jLaDUP4DgB4gv7VowIBJCvoMWPXdrv7NePrjA8MOoBg/aTb1g8NMgJBM40np?=
 =?us-ascii?Q?DaQ92g1aO/9rdTN4gr9gSDxRSzVBCr3ekzrJJg377zXXcif5Y+MGQvvVA56S?=
 =?us-ascii?Q?gNFaeRFmeD1G2cRn4mxY6EWLafd7obd4LJFpv/oWeS/99/HK3MldlhrpwjSi?=
 =?us-ascii?Q?Apah6qSWgCtXzA+Z2QkURvphy3vY2Ta7pPBI9iX+W38G69jOriBm/WHlujUO?=
 =?us-ascii?Q?5MULT6G5OTsGPeuKTSmHXdpk737RRA5T+mDxO25adPqRIqaY1LhMeSyOSZMn?=
 =?us-ascii?Q?isliSHXMY6vB6PQgTy9YGoUpakpwV6xe4vi0niG7H64eoRsaslX2wQ478MwO?=
 =?us-ascii?Q?sFH/SqiT56Rp4NvVDgSME8YiIyEzz1Cmbu9MuqxdutRvz5q3eGHN1xf0IWyY?=
X-MS-Exchange-AntiSpam-MessageData-1: Hbo2eR0vdLN4+lz/PgWni/n5KUWcJLmzkHw=
X-OriginatorOrg: genexis.eu
X-MS-Exchange-CrossTenant-Network-Message-Id: e1199f29-78be-4836-d4f8-08de4ee436e8
X-MS-Exchange-CrossTenant-AuthSource: DU4PR08MB11149.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2026 18:32:01.5759
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 8d891be1-7bce-4216-9a99-bee9de02ba58
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: urlP3vBDX7xfXLn3otnAIj96sj0uGcWfHEadx6potxtuU0fV0dIwu0qJIkT/cFpJDlPx5EoUYCnJLWdg2qQMXK0uKqD1COxnt/G4fGgBcEs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB4PR08MB8126

Add aditional clocks to the clock driver.

Benjamin Larsson (2):
  dt-bindings: clock: add IDs for EN7581
  clk: en7523: Add several clocks for EN7581

 drivers/clk/clk-en7523.c               | 56 ++++++++++++++++++++++++++
 include/dt-bindings/clock/en7523-clk.h |  5 +++
 2 files changed, 61 insertions(+)

-- 
2.51.0

