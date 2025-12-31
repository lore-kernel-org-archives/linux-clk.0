Received: from OSPPR02CU001.outbound.protection.outlook.com (mail-norwayeastazon11013005.outbound.protection.outlook.com [40.107.159.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D218331A041;
	Wed, 31 Dec 2025 10:13:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.159.5
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767176012; cv=fail; b=hYOgMs70Mcs1WwR6tve3BKfEv6OVCrS4la+249PzBIMhdFvYceCMf6jMkCn3giRi65Db6LYZnoWurY3L4RTLm/oLEFYS2N8bnN3pspjV4MlERZAKBApqC3EB1kwizeqfbx8RxRePkK5rAYM1GS1QgARDj/F59ixWtRkoJnBCgLA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767176012; c=relaxed/simple;
	bh=3GQy6nUafjz090xlhegjY9LVe2nPtW74RERPh+uk1Cg=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=JVlZssVwq+Rp3tArIP17mTEkmaHbdGCU4XDhb0ZLLK4lyRHlTwuBMwF92Nr3cjnO5rsoy0Irn/KHNJBnqudeCVGJxYBp6h5L9OX3UdduA7jcys6HiWKKvXQ3M5vYS3KCEZTQDEJskUmZWUqKhBaD8Z9PzYNne/dWdVTC6Wrq3uc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=CUnxQUGr; arc=fail smtp.client-ip=40.107.159.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="CUnxQUGr"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hbLdYITJPpltJmnv1vIA/4lHNGbDSZIRha6HCcpg9cPXsb3g+sfspEKCZrKs8nB6zt3JQ7jHKfVFuf0jn4xZCjEI1OObui1eywQQdzl/EYC2dQ2VKr5F24b4AOh7TGWu+yqU9WQ5tC8iR1+FNetxXn2iZyBW+DuhO94SurNLAryrhhm/JN0Hi9H28H+I3pQZYDF5EoSSPl/s93WeFVkaksbOJBbSN7L7k77Hr38Hj92EgPAlxIKff8EDZzbUT4Q/9iAhk7d3E2LhfnQZl7NlPtIA4IK69hQV21V5/TTL1S/gbiW7jiyrb/9kcF9+OlcchDnntijlv2Edlma3mJ7WxA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=S92I+xv9eKrBGsZOh7TuY4+IRTsPjahfL1fRhgRBnYA=;
 b=pSn1m0ormeNbowvrQH7IMhndgMmk8NPpgJxQ1OrN2/Hb3g6ft/UmfUD9FlPWy8GUy5ftBYDNoCgcpdENGzNEDG4iSACcaom9B4M9K8WwVbJzHyVD7dAU/imXO7PubbpPGoOr4wsHsBWkE4pMr9f+IT5tzSVITv9cNgggiWxNUDc+fZMv8B2xeN+usDWZ3XdiMRlSdjiCANZL6H5ZM+z152QAECZwOTXnqK5XtoADHgm7GdDvJ21E0OqAEIvuzT+w6OWqtksJYRjzeBqovyLbfgUjui+2uELcbLWsmfPxOJjSLTmHbjZXeXpk0gaXXCgdBQq/isaEuDSzjO9+kBn+Vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=S92I+xv9eKrBGsZOh7TuY4+IRTsPjahfL1fRhgRBnYA=;
 b=CUnxQUGrQUTEJr0EiaZyLYcMtpXCZlMeiaVt2kruQOFnPCILt8aZS2pNEde4L6Lk/V5v3eimBEg/EYLm3dArEIY5TdwxaQUJwYsdRQmVnNYO0WITDkEz2xhXlNdbJJzszSBZ/0hOIA0lN6IMQ7JVP0s1xCUyrT9+FVl+lzrPE8fF0tOzyE5SsJDFlYbzQULJAoGEzfZLTpVy1Bd6vqbae7KX4HtinHeHvmPIhRebHBQHpCGRqIuCGPP++KzO+abSmqDTDaHrOdIQmKTQBaZiTcqhKGNbIN917znhBwfmmubrn1ouRSbdVsh2Pd7G4PKvNa+Q9Y1ywdTnNbVnGC6bBQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by DU7PR04MB11089.eurprd04.prod.outlook.com (2603:10a6:10:5b1::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Wed, 31 Dec
 2025 10:13:26 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9478.004; Wed, 31 Dec 2025
 10:13:26 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Wed, 31 Dec 2025 18:12:51 +0800
Subject: [PATCH v7 4/6] clk: Add KUnit tests for assigned-clock-sscs
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251231-clk-ssc-v7-1-v7-4-380e8b58f9e3@nxp.com>
References: <20251231-clk-ssc-v7-1-v7-0-380e8b58f9e3@nxp.com>
In-Reply-To: <20251231-clk-ssc-v7-1-v7-0-380e8b58f9e3@nxp.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>, 
 Sebin Francis <sebin.francis@ti.com>, Brian Masney <bmasney@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, arm-scmi@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SI1PR02CA0005.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::13) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|DU7PR04MB11089:EE_
X-MS-Office365-Filtering-Correlation-Id: b20d0c5d-f3db-450b-cffc-08de48553cac
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|19092799006|376014|7416014|52116014|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?eDN4QnNuV3Bvb1cvVzkvcXVVNnZvWERKY3pXb2NLdFM0QkdvaHJwZjM5amVN?=
 =?utf-8?B?WVRWTjJkWHdCK0JaN0czRWh5a1pick1STHR6Nml4TkFxL09CN2VmcllQUEIz?=
 =?utf-8?B?OEhyMnB2T0YyYURMbjZGdDN4S2J0bTExYXlPTHkxbTB2Q24zd2pJVGg5N29C?=
 =?utf-8?B?dTRjMGl3RWk5VVFDbFU5eU5PZHVKaFcyNlUxdWQ2Z0NMNDY2WkErYW1Eb0FS?=
 =?utf-8?B?bmt1K3ROQWdLbHNGTTJROWFWTVhyc0tEUW1rdVkvaW13RC9ubmZVK25DVnZz?=
 =?utf-8?B?UEZxclRjZGZZM1NPS1k4Y25RSEloQUR4V0VyYy9hMURmclJpenJPWnFCWlhH?=
 =?utf-8?B?RHEvR1NKd2ZDeEovSi8weWhZWDlnRSs0TmhMbUJoR2xNOFlxa1d4UVJDV3hx?=
 =?utf-8?B?b1h6NDNZUjU5SUJqV3JwRnQzODMrak93ZGRrOERUdVFTQ29QdWorY3FuRzlM?=
 =?utf-8?B?T3FJdmpCc28wMlBOQ1BFYjVjdVVjT1JnamdhVE5xelp5MitUMk1vUnpSWXFp?=
 =?utf-8?B?Q0t2S3dDT2tVU0NzWFd2QVNsMTA0L2xnSFRnRzYxQkhVc0IxNS9CU29Iak5m?=
 =?utf-8?B?N0RXVmMwMHYwT1IxSG03V1dOSC9XM0FVSVRvQ3VuSHhmbVFZUzE5WVQ2U2gy?=
 =?utf-8?B?b3Y2emo5bnFOMlRRVWl0QmZ2cFFHazNZdlRvU3JPYUxSSlU3TFpTM2VoN09B?=
 =?utf-8?B?b293aWluZnR4eXZWeUlCazBLQmN1VmZGZEh0TGd3bkx6SnJFQUlPT295RGZv?=
 =?utf-8?B?YmNkNXRvZVRaTnZST3dtekp3enZKTUVVY1BMTzVxR05rVDJaS01zZkxMbWcw?=
 =?utf-8?B?RHV0VDh6Z2lic1dvbkNoUnF4T0pyTzZIL3p4V2NBSzNOOFB1UGJxQVpqSzZP?=
 =?utf-8?B?Z3pKVVpGdStJMEhLdTZ3VEpWREUwa1ZyaDFOK1Bzc3Q3ckRNVjZ0OWNyYUw4?=
 =?utf-8?B?SitBVTJnOWpWaVRyc2M5dVN3NlpyTUJLcnhCcXpielBUOFB3cUhQN1FnVVpX?=
 =?utf-8?B?Y3BBRExoeVVOOWNjdmFpUW9qc05OZUxiUjU2MEpTbk10TjlOc3ZUMHlla2RQ?=
 =?utf-8?B?WDhwYkZnVGRDNmRWWHQ5cFZQY2xzNFBvRVpybHFUTnltYWR3a1ljR3hGd2tS?=
 =?utf-8?B?S3VEeXlyU2lGZEMxSng0b1R5SU1pem5qV0ZWejV6TzZiWDhHb3VFUUVRRy9U?=
 =?utf-8?B?ZEF3bnhXZE9vRUtWUys1aWYxazhsOUtURTZUWWxvc1J0ai9Cakc2RWRSakgv?=
 =?utf-8?B?ZGZ3SzJFVFhJSVJIbE01Wkt3c0NxTW13ZjVERTduT09KanFFeFUwU3VnRjBo?=
 =?utf-8?B?MkIrU1RsRmtYZnFOSGx0WWY2eDBNcVBmODFLcGk2c2NvTXpNVSsySWZUNEFx?=
 =?utf-8?B?SWRIUE1CeGFoMnRGL24vUyt1QnZGV01nT2JHTExML0ovRm16cytYck5xaGRB?=
 =?utf-8?B?U0g2MldSYkhnMW54elBWYlVJemhoOG1hSk1rMklFS2xCcGl2TXNXYmNQalVY?=
 =?utf-8?B?Ulo1Zm5weEZCYnpDVjBaYTJWeXpHaHcyNHd2UnlZQ0RsVFc1VlJFV04vekp5?=
 =?utf-8?B?ZXVTcU9mNTJOOVo5RUVkeFArK1VnMkpyQ051OXQvNWZjek0wNVJKV1YzTDVD?=
 =?utf-8?B?YjkrNS8yWXpjeGorNitPS0hvU2VEQ05lV1JOdGNyRSs2T0VzQlMrU25Va2pC?=
 =?utf-8?B?cHkzMlBnU3ZNaHAzdDF6V3NYVU5UR3NTR2lIMHhaYWxVZndkSEV1cmpGdStB?=
 =?utf-8?B?b1hUZEhzV3pSb2JCcndjbktRSzMxS0tkKzMzbkRXWERzL1FZVHFHZzY1V1Ex?=
 =?utf-8?B?VkJ2VmlmSEVZU3pVZlhzcjQ4QUkwMTl2S3Bma3UxNU96bWtOUG83NWhCMTlq?=
 =?utf-8?B?U1lleHZDWXp6Zm9XS01XU0xnQmkyZWZnQWJqM0lQbVZTV3dnS1M0aWFtVVRQ?=
 =?utf-8?B?R3l1QmZVQ01jcFRGZk5udUNRMkVONGtMWk1zbk1rUDU3NytuSFNUVXNSQkJu?=
 =?utf-8?B?S3RnOHRKK3dWRllCTG9ieXF6Q2VZOGFNYno1Z2NpK0tKOUJoL3lwR2dhcGlS?=
 =?utf-8?Q?5IpVar?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(19092799006)(376014)(7416014)(52116014)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?TzVtczM1WGozalhOTCt6N3hEMFJwN1E5eE1JMDM3bElhWVBXQXJLdjNLb0Zx?=
 =?utf-8?B?dHFGMFNmQnA0NGYraHI3K0c1ZXl3MGtWWWp3NDV1dW9sT0dpR2EwQ29qQ0ha?=
 =?utf-8?B?bHpCWlQ5MUs3VG5UaWp3SnVmWDRMNTNoR0lpN1JqZmZkQ2lubEp4TkFUcmNC?=
 =?utf-8?B?Qyt0VFl2MUJmRSsxVUFsZW9oVngvMXdzV1pIUVIwOTNZU25yU0c5dEt0OGQ5?=
 =?utf-8?B?cjVQVjczU29PMUhaclMxanBqbmpsK1IwT0FjNG4xWWZUcExuMTF1aWV4aEdM?=
 =?utf-8?B?QnJCSWRWQjZJUFh3VWZtQ2srcVEvbmpnL1J0NmZUNEpaY01vR2ltNkIrSTRy?=
 =?utf-8?B?d3lYUCt5YnVKd3ZpdGRTYmNkdmxkSCtoSGo1T3pUam9hdFJnNy9uU0hieUNQ?=
 =?utf-8?B?SVJWUGRJY3ZYTnZwSlplWXF3dFg4UDRvNktxb1BPbFkwNWpJb21BdVhsUlJn?=
 =?utf-8?B?QnNwWGRKOUpHbE4vaXRLN3I1cmZDVVNTUTBFWkdaTi9FSzdHRlNWU0FsRHQ5?=
 =?utf-8?B?Z29ydEl5SlJMRk4xaFE0V1hWeXlxZm0vbGVQem83cE1OV2xYUmtEbXBITHNS?=
 =?utf-8?B?QjFwcm9pa1M4R2EvN2NBcWI3dWpsMUtPSVNWeGp6ek9Nd3JTMkxsTEdrWm5M?=
 =?utf-8?B?QmFNOFVyaTFHU3UwWG02cW9KWjhQUno0WEtkU2QzaW11VGI2T3B1ejNsdmM3?=
 =?utf-8?B?Z3ZaMjhWU2NlWGhLRjF3ekhqNTA4cnlxekhZbDVwb2V1eHcyd2RIN2s3WXFi?=
 =?utf-8?B?Z0FBMUlzdklwR1kxdVBlSkZ5Q0ZvZit4L1N1eEM2WHExRmR5a01CUVkyYTNz?=
 =?utf-8?B?NlRmeTlWY0Y3UXZ4MkVKc0R5N0VmQWxGcXVRWkI1amkxNXo4WWZRMUxOMkhR?=
 =?utf-8?B?cVRLeUpWMnFyVXhwbDRwbXpYV0U5TjIvVzYweURBNjNQRS9kWWRsdVZDK2dS?=
 =?utf-8?B?SmFBei9Ic0JQa2g0ZThzbkovcjhPMWVpK0JMMHJkNmRjZEp4c05FeXh0Q0FT?=
 =?utf-8?B?WDNuVFp4bVZmZWkyY0hlY0l1cHdCVk9BTlBENCsrNEx4dUw4aEpoa3dtSFdy?=
 =?utf-8?B?ZDd1RHM3NjdxeVhqSkh5RWJZQnNGTEtqdnRjdWVKRUdVazZEYjllOHZYU1RT?=
 =?utf-8?B?SHZkOEY2RjFWTXRVcDEyVGZySm53Wm96QWd5RHlyd0pqdWVtNUtzVzRSRksv?=
 =?utf-8?B?ZEZTQWFDb2ZSQlZqSGxXQ2gwbW9RbFJkQkdOSmZEOFQxdExrYjJidEhsL2Rq?=
 =?utf-8?B?Y1l1Q095bHY4VVY5bm9kWWtYTFM5M0VUTXZWMVQvdit6cUs2UTBnSVVmNzlk?=
 =?utf-8?B?UVBvL2R2N3BuNjlUM2Y2dE9ENFI0cG4wQ2JDVXhiUm5IZWRoNWhjQUVqdDBp?=
 =?utf-8?B?TU9jRDQrNEtqN3RtUFc2cWtoZjIxWlJKV2kzbmNjbktpT1lLUnF6Q2xhM3BR?=
 =?utf-8?B?a1dIQVVXUUFlWTcwQThHWjZXTzFZTEU5enNORGxhL1piSEFuVFZsTVJ4UE5D?=
 =?utf-8?B?SDE4MWorMTQzdGxIdE4zSk84NDRVU1QvNWVzWkUwMFZSYzdCNTdwNFIzcVhl?=
 =?utf-8?B?Tk9vR1YwSExjbE5JNi9xbGh5QllYRDJpaHFTLzA5d21wZE9aRFFyZUZ6R0RH?=
 =?utf-8?B?QndpV2tmV0duRWlkWjQ3Qm1iK1A4cEdTMU9IbWtpaHVJN1MvelplRlZJZEdZ?=
 =?utf-8?B?eWh3VHM5cjJzcStBU2poaDJueTc0U0psR2liSlRZVVU0bkJkbVRVNk16dWts?=
 =?utf-8?B?VXhYaXlJc0UwZUxnWVArQmgrTERrelQ5UFJYUFkwU2JmSDF0QnhRWCt4eVpQ?=
 =?utf-8?B?ejd6cFhUb2Y4ZmNPdnV2YkJ0KzNuUVVaekVxL001UVNWd2xidHdRcDdFK1Ny?=
 =?utf-8?B?ckFhOFBUa3c0eWZWVHlneWhwd1FvRTVnZUZsNUJGZ0V0d25ydFdrWlpDaDA0?=
 =?utf-8?B?RGdQV2NxcGZ6Y1F1M1lVd0VQREs4UGMrS2d5UVdLUE9uQmZFYUtIQXdhUHBV?=
 =?utf-8?B?QXRrSjNXUVZtQkR6YzN1UjA4K1oyVklNdnI4Q1NWNjM5aFROMjhzanduVmNv?=
 =?utf-8?B?eHRYYVlHMXlqclpJbGpldXBlcDFFMmhnSVYzRDFYR3JUZUdpa3ZpREp0eVpO?=
 =?utf-8?B?MlZIQXp4VkYrSGs0Y1lKQU0wVWJZMnVyNjJUK3VXckt2MXNvclE5dkw2MzY0?=
 =?utf-8?B?L0R1YkN5aWxZdm5aZk9ySGEydEx2ckJONlFCd3BZeUxMT281YUZjcWpabitT?=
 =?utf-8?B?YTArVU44OFJ2aWgwcytOSDhmN3dMeGM3Wno2QXhjVkJvenhiOWFqZDV5RFYv?=
 =?utf-8?B?YklQdkwrdVEwYW1xTVY4ZUZpRTBkaGFOVGFSUFlwSkRnNEJ3RTRwZz09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b20d0c5d-f3db-450b-cffc-08de48553cac
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Dec 2025 10:13:26.1761
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JzUqxVgb7T/c7maV+AWwxOJvuoKZfHIdIz6pYZI8tQkogELou2sJ+gD94ZsBlUHoLLBxmJTh9RWb9FWz0Emj+g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DU7PR04MB11089

From: Peng Fan <peng.fan@nxp.com>

Spread spectrum configuration is part of clock frequency settings,
and its behavior can be validated similarly to assigned clock rates.

Extend the existing KUnit tests for assigned-clock-rates to cover
assigned-clock-sscs by reusing the test framework. Add new test
device trees:
  - kunit_clk_assigned_sscs_null.dtso
  - kunit_clk_assigned_sscs_null_consumer.dtso
  - kunit_clk_assigned_sscs_without.dtso
  - kunit_clk_assigned_sscs_without_consumer.dtso
  - kunit_clk_assigned_sscs_zero.dtso
  - kunit_clk_assigned_sscs_zero_consumer.dtso

These tests cover various invalid configurations of assigned-clock-sscs,
ensuring robustness and consistent error handling, similar to the coverage
provided for assigned-clock-rates.

Co-developed-by: Brian Masney <bmasney@redhat.com>
Signed-off-by: Brian Masney <bmasney@redhat.com>
Reviewed-by: Sebin Francis <sebin.francis@ti.com>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/Makefile                               |   6 +
 drivers/clk/clk_test.c                             | 121 ++++++++++++++++++++-
 drivers/clk/kunit_clk_assigned_rates.h             |  10 ++
 drivers/clk/kunit_clk_assigned_rates_multiple.dtso |   6 +
 ...kunit_clk_assigned_rates_multiple_consumer.dtso |   6 +
 drivers/clk/kunit_clk_assigned_rates_one.dtso      |   3 +
 .../clk/kunit_clk_assigned_rates_one_consumer.dtso |   3 +
 .../clk/kunit_clk_assigned_rates_u64_multiple.dtso |   6 +
 ...t_clk_assigned_rates_u64_multiple_consumer.dtso |   6 +
 drivers/clk/kunit_clk_assigned_rates_u64_one.dtso  |   3 +
 .../kunit_clk_assigned_rates_u64_one_consumer.dtso |   3 +
 drivers/clk/kunit_clk_assigned_sscs_null.dtso      |  16 +++
 .../clk/kunit_clk_assigned_sscs_null_consumer.dtso |  20 ++++
 drivers/clk/kunit_clk_assigned_sscs_without.dtso   |  15 +++
 .../kunit_clk_assigned_sscs_without_consumer.dtso  |  19 ++++
 drivers/clk/kunit_clk_assigned_sscs_zero.dtso      |  12 ++
 .../clk/kunit_clk_assigned_sscs_zero_consumer.dtso |  16 +++
 17 files changed, 268 insertions(+), 3 deletions(-)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 61ec08404442b4715dc84a563b3330cb5169f8b2..cb10156db2a37e1956d84113d1711e23d9d864ab 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -18,6 +18,12 @@ clk-test-y			:= clk_test.o \
 				   kunit_clk_assigned_rates_without_consumer.dtbo.o \
 				   kunit_clk_assigned_rates_zero.dtbo.o \
 				   kunit_clk_assigned_rates_zero_consumer.dtbo.o \
+				   kunit_clk_assigned_sscs_null.dtbo.o \
+				   kunit_clk_assigned_sscs_null_consumer.dtbo.o \
+				   kunit_clk_assigned_sscs_without.dtbo.o \
+				   kunit_clk_assigned_sscs_without_consumer.dtbo.o \
+				   kunit_clk_assigned_sscs_zero.dtbo.o \
+				   kunit_clk_assigned_sscs_zero_consumer.dtbo.o \
 				   kunit_clk_hw_get_dev_of_node.dtbo.o \
 				   kunit_clk_parent_data_test.dtbo.o
 obj-$(CONFIG_COMMON_CLK)	+= clk-divider.o
diff --git a/drivers/clk/clk_test.c b/drivers/clk/clk_test.c
index a268d7b5d4cb28ec1f029f828c31107f8e130556..97113b61c2841701a44603ca9935638374000a2e 100644
--- a/drivers/clk/clk_test.c
+++ b/drivers/clk/clk_test.c
@@ -28,6 +28,7 @@ static const struct clk_ops empty_clk_ops = { };
 struct clk_dummy_context {
 	struct clk_hw hw;
 	unsigned long rate;
+	struct clk_spread_spectrum sscs;
 };
 
 static unsigned long clk_dummy_recalc_rate(struct clk_hw *hw,
@@ -83,6 +84,17 @@ static int clk_dummy_set_rate(struct clk_hw *hw,
 	return 0;
 }
 
+static int clk_dummy_set_spread_spectrum(struct clk_hw *hw,
+					 const struct clk_spread_spectrum *ss_conf)
+{
+	struct clk_dummy_context *ctx =
+		container_of(hw, struct clk_dummy_context, hw);
+
+	ctx->sscs = *ss_conf;
+
+	return 0;
+}
+
 static int clk_dummy_single_set_parent(struct clk_hw *hw, u8 index)
 {
 	if (index >= clk_hw_get_num_parents(hw))
@@ -100,18 +112,21 @@ static const struct clk_ops clk_dummy_rate_ops = {
 	.recalc_rate = clk_dummy_recalc_rate,
 	.determine_rate = clk_dummy_determine_rate,
 	.set_rate = clk_dummy_set_rate,
+	.set_spread_spectrum = clk_dummy_set_spread_spectrum,
 };
 
 static const struct clk_ops clk_dummy_maximize_rate_ops = {
 	.recalc_rate = clk_dummy_recalc_rate,
 	.determine_rate = clk_dummy_maximize_rate,
 	.set_rate = clk_dummy_set_rate,
+	.set_spread_spectrum = clk_dummy_set_spread_spectrum,
 };
 
 static const struct clk_ops clk_dummy_minimize_rate_ops = {
 	.recalc_rate = clk_dummy_recalc_rate,
 	.determine_rate = clk_dummy_minimize_rate,
 	.set_rate = clk_dummy_set_rate,
+	.set_spread_spectrum = clk_dummy_set_spread_spectrum,
 };
 
 static const struct clk_ops clk_dummy_single_parent_ops = {
@@ -3097,6 +3112,7 @@ struct clk_assigned_rates_context {
  * @overlay_end: Pointer to end of DT overlay to apply for test
  * @rate0: Initial rate of first clk
  * @rate1: Initial rate of second clk
+ * @sscs: Initial spread spectrum settings
  * @consumer_test: true if a consumer is being tested
  */
 struct clk_assigned_rates_test_param {
@@ -3105,6 +3121,7 @@ struct clk_assigned_rates_test_param {
 	u8 *overlay_end;
 	unsigned long rate0;
 	unsigned long rate1;
+	struct clk_spread_spectrum sscs;
 	bool consumer_test;
 };
 
@@ -3116,7 +3133,7 @@ static void
 clk_assigned_rates_register_clk(struct kunit *test,
 				struct clk_dummy_context *ctx,
 				struct device_node *np, const char *name,
-				unsigned long rate)
+				unsigned long rate, const struct clk_spread_spectrum *sscs)
 {
 	struct clk_init_data init = { };
 
@@ -3124,6 +3141,7 @@ clk_assigned_rates_register_clk(struct kunit *test,
 	init.ops = &clk_dummy_rate_ops;
 	ctx->hw.init = &init;
 	ctx->rate = rate;
+	ctx->sscs = *sscs;
 
 	KUNIT_ASSERT_EQ(test, 0, of_clk_hw_register_kunit(test, np, &ctx->hw));
 	KUNIT_ASSERT_EQ(test, ctx->rate, rate);
@@ -3167,14 +3185,16 @@ static int clk_assigned_rates_test_init(struct kunit *test)
 	KUNIT_ASSERT_LT(test, clk_cells, 2);
 
 	clk_assigned_rates_register_clk(test, &ctx->clk0, np,
-					"test_assigned_rate0", test_param->rate0);
+					"test_assigned_rate0", test_param->rate0,
+					&test_param->sscs);
 	if (clk_cells == 0) {
 		KUNIT_ASSERT_EQ(test, 0,
 				of_clk_add_hw_provider_kunit(test, np, of_clk_hw_simple_get,
 							     &ctx->clk0.hw));
 	} else if (clk_cells == 1) {
 		clk_assigned_rates_register_clk(test, &ctx->clk1, np,
-						"test_assigned_rate1", test_param->rate1);
+						"test_assigned_rate1", test_param->rate1,
+						&test_param->sscs);
 
 		KUNIT_ASSERT_NOT_ERR_OR_NULL(test,
 			data = kunit_kzalloc(test, struct_size(data, hws, 2), GFP_KERNEL));
@@ -3203,6 +3223,9 @@ static void clk_assigned_rates_assigns_one(struct kunit *test)
 	struct clk_assigned_rates_context *ctx = test->priv;
 
 	KUNIT_EXPECT_EQ(test, ctx->clk0.rate, ASSIGNED_RATES_0_RATE);
+	KUNIT_EXPECT_EQ(test, ctx->clk0.sscs.modfreq_hz, ASSIGNED_SSCS_0_MODFREQ);
+	KUNIT_EXPECT_EQ(test, ctx->clk0.sscs.spread_bp, ASSIGNED_SSCS_0_SPREAD);
+	KUNIT_EXPECT_EQ(test, ctx->clk0.sscs.method, ASSIGNED_SSCS_0_METHOD);
 }
 
 static void clk_assigned_rates_assigns_multiple(struct kunit *test)
@@ -3210,7 +3233,13 @@ static void clk_assigned_rates_assigns_multiple(struct kunit *test)
 	struct clk_assigned_rates_context *ctx = test->priv;
 
 	KUNIT_EXPECT_EQ(test, ctx->clk0.rate, ASSIGNED_RATES_0_RATE);
+	KUNIT_EXPECT_EQ(test, ctx->clk0.sscs.modfreq_hz, ASSIGNED_SSCS_0_MODFREQ);
+	KUNIT_EXPECT_EQ(test, ctx->clk0.sscs.spread_bp, ASSIGNED_SSCS_0_SPREAD);
+	KUNIT_EXPECT_EQ(test, ctx->clk0.sscs.method, ASSIGNED_SSCS_0_METHOD);
 	KUNIT_EXPECT_EQ(test, ctx->clk1.rate, ASSIGNED_RATES_1_RATE);
+	KUNIT_EXPECT_EQ(test, ctx->clk1.sscs.modfreq_hz, ASSIGNED_SSCS_1_MODFREQ);
+	KUNIT_EXPECT_EQ(test, ctx->clk1.sscs.spread_bp, ASSIGNED_SSCS_1_SPREAD);
+	KUNIT_EXPECT_EQ(test, ctx->clk1.sscs.method, ASSIGNED_SSCS_1_METHOD);
 }
 
 static void clk_assigned_rates_skips(struct kunit *test)
@@ -3222,6 +3251,19 @@ static void clk_assigned_rates_skips(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, ctx->clk0.rate, test_param->rate0);
 }
 
+static void clk_assigned_sscs_skips(struct kunit *test)
+{
+	struct clk_assigned_rates_context *ctx = test->priv;
+	const struct clk_assigned_rates_test_param *test_param = test->param_value;
+
+	KUNIT_EXPECT_NE(test, ctx->clk0.sscs.modfreq_hz, ASSIGNED_SSCS_0_MODFREQ);
+	KUNIT_EXPECT_NE(test, ctx->clk0.sscs.spread_bp, ASSIGNED_SSCS_0_SPREAD);
+	KUNIT_EXPECT_NE(test, ctx->clk0.sscs.method, ASSIGNED_SSCS_0_METHOD);
+	KUNIT_EXPECT_EQ(test, ctx->clk0.sscs.modfreq_hz, test_param->sscs.modfreq_hz);
+	KUNIT_EXPECT_EQ(test, ctx->clk0.sscs.spread_bp, test_param->sscs.spread_bp);
+	KUNIT_EXPECT_EQ(test, ctx->clk0.sscs.method, test_param->sscs.method);
+}
+
 OF_OVERLAY_DECLARE(kunit_clk_assigned_rates_one);
 OF_OVERLAY_DECLARE(kunit_clk_assigned_rates_one_consumer);
 OF_OVERLAY_DECLARE(kunit_clk_assigned_rates_u64_one);
@@ -3384,6 +3426,77 @@ KUNIT_ARRAY_PARAM_DESC(clk_assigned_rates_skips,
 		       clk_assigned_rates_skips_test_params,
 		       desc)
 
+OF_OVERLAY_DECLARE(kunit_clk_assigned_sscs_without);
+OF_OVERLAY_DECLARE(kunit_clk_assigned_sscs_without_consumer);
+OF_OVERLAY_DECLARE(kunit_clk_assigned_sscs_zero);
+OF_OVERLAY_DECLARE(kunit_clk_assigned_sscs_zero_consumer);
+OF_OVERLAY_DECLARE(kunit_clk_assigned_sscs_null);
+OF_OVERLAY_DECLARE(kunit_clk_assigned_sscs_null_consumer);
+
+/* Test cases that skip changing the sscs due to malformed DT */
+static const struct clk_assigned_rates_test_param clk_assigned_sscs_skips_test_params[] = {
+	{
+		/*
+		 * Test that an assigned-clock-sscs property without an assigned-clocks
+		 * property fails when the property is in the provider.
+		 */
+		.desc = "provider missing assigned-clocks",
+		TEST_PARAM_OVERLAY(kunit_clk_assigned_sscs_without),
+		.sscs = {50000, 60000, 3},
+	},
+	{
+		/*
+		 * Test that an assigned-clock-rates property without an assigned-clocks
+		 * property fails when the property is in the consumer.
+		 */
+		.desc = "consumer missing assigned-clocks",
+		TEST_PARAM_OVERLAY(kunit_clk_assigned_sscs_without_consumer),
+		.sscs = {50000, 60000, 3},
+		.consumer_test = true,
+	},
+	{
+		/*
+		 * Test that an assigned-clock-rates property of zero doesn't
+		 * set a rate when the property is in the provider.
+		 */
+		.desc = "provider assigned-clock-sscs of zero",
+		TEST_PARAM_OVERLAY(kunit_clk_assigned_sscs_zero),
+		.sscs = {50000, 60000, 3},
+	},
+	{
+		/*
+		 * Test that an assigned-clock-rates property of zero doesn't
+		 * set a rate when the property is in the consumer.
+		 */
+		.desc = "consumer assigned-clock-sscs of zero",
+		TEST_PARAM_OVERLAY(kunit_clk_assigned_sscs_zero_consumer),
+		.sscs = {50000, 60000, 3},
+		.consumer_test = true,
+	},
+	{
+		/*
+		 * Test that an assigned-clocks property with a null phandle
+		 * doesn't set a rate when the property is in the provider.
+		 */
+		.desc = "provider assigned-clocks null phandle",
+		TEST_PARAM_OVERLAY(kunit_clk_assigned_sscs_null),
+		.sscs = {50000, 60000, 3},
+	},
+	{
+		/*
+		 * Test that an assigned-clocks property with a null phandle
+		 * doesn't set a rate when the property is in the consumer.
+		 */
+		.desc = "provider assigned-clocks null phandle",
+		TEST_PARAM_OVERLAY(kunit_clk_assigned_sscs_null_consumer),
+		.sscs = {50000, 60000, 3},
+		.consumer_test = true,
+	},
+};
+KUNIT_ARRAY_PARAM_DESC(clk_assigned_sscs_skips,
+		       clk_assigned_sscs_skips_test_params,
+		       desc)
+
 static struct kunit_case clk_assigned_rates_test_cases[] = {
 	KUNIT_CASE_PARAM(clk_assigned_rates_assigns_one,
 			 clk_assigned_rates_assigns_one_gen_params),
@@ -3391,6 +3504,8 @@ static struct kunit_case clk_assigned_rates_test_cases[] = {
 			 clk_assigned_rates_assigns_multiple_gen_params),
 	KUNIT_CASE_PARAM(clk_assigned_rates_skips,
 			 clk_assigned_rates_skips_gen_params),
+	KUNIT_CASE_PARAM(clk_assigned_sscs_skips,
+			 clk_assigned_sscs_skips_gen_params),
 	{}
 };
 
diff --git a/drivers/clk/kunit_clk_assigned_rates.h b/drivers/clk/kunit_clk_assigned_rates.h
index df2d84dcaa93511694b6da842debdc3cfd3a6c19..d7ae5ec2d25bed79b8438e8ce580872131ce4286 100644
--- a/drivers/clk/kunit_clk_assigned_rates.h
+++ b/drivers/clk/kunit_clk_assigned_rates.h
@@ -1,8 +1,18 @@
 /* SPDX-License-Identifier: GPL-2.0 */
+
+#include <dt-bindings/clock/clock.h>
+
 #ifndef _KUNIT_CLK_ASSIGNED_RATES_H
 #define _KUNIT_CLK_ASSIGNED_RATES_H
 
 #define ASSIGNED_RATES_0_RATE		1600000
 #define ASSIGNED_RATES_1_RATE		9700000
 
+#define ASSIGNED_SSCS_0_MODFREQ		10000
+#define ASSIGNED_SSCS_0_SPREAD		30000
+#define ASSIGNED_SSCS_0_METHOD		CLK_SSC_CENTER_SPREAD
+#define ASSIGNED_SSCS_1_MODFREQ		20000
+#define ASSIGNED_SSCS_1_SPREAD		40000
+#define ASSIGNED_SSCS_1_METHOD		CLK_SSC_UP_SPREAD
+
 #endif
diff --git a/drivers/clk/kunit_clk_assigned_rates_multiple.dtso b/drivers/clk/kunit_clk_assigned_rates_multiple.dtso
index e600736e70f5041ddeb1bfb0d6074746a064e08a..6c54d65444d5d779c9fa4bb2a79c4742dd88f6d0 100644
--- a/drivers/clk/kunit_clk_assigned_rates_multiple.dtso
+++ b/drivers/clk/kunit_clk_assigned_rates_multiple.dtso
@@ -12,5 +12,11 @@ clk: kunit-clock {
 				  <&clk 1>;
 		assigned-clock-rates = <ASSIGNED_RATES_0_RATE>,
 				       <ASSIGNED_RATES_1_RATE>;
+		assigned-clock-sscs = <ASSIGNED_SSCS_0_MODFREQ
+				       ASSIGNED_SSCS_0_SPREAD
+				       ASSIGNED_SSCS_0_METHOD>,
+				      <ASSIGNED_SSCS_1_MODFREQ
+				       ASSIGNED_SSCS_1_SPREAD
+				       ASSIGNED_SSCS_1_METHOD>;
 	};
 };
diff --git a/drivers/clk/kunit_clk_assigned_rates_multiple_consumer.dtso b/drivers/clk/kunit_clk_assigned_rates_multiple_consumer.dtso
index 260aba458daf2bc57fde46b5442453e7de10faac..b1fee396c4b1e51341a411168569d8351bb23b12 100644
--- a/drivers/clk/kunit_clk_assigned_rates_multiple_consumer.dtso
+++ b/drivers/clk/kunit_clk_assigned_rates_multiple_consumer.dtso
@@ -16,5 +16,11 @@ kunit-clock-consumer {
 				  <&clk 1>;
 		assigned-clock-rates = <ASSIGNED_RATES_0_RATE>,
 				       <ASSIGNED_RATES_1_RATE>;
+		assigned-clock-sscs = <ASSIGNED_SSCS_0_MODFREQ
+				       ASSIGNED_SSCS_0_SPREAD
+				       ASSIGNED_SSCS_0_METHOD>,
+				      <ASSIGNED_SSCS_1_MODFREQ
+				       ASSIGNED_SSCS_1_SPREAD
+				       ASSIGNED_SSCS_1_METHOD>;
 	};
 };
diff --git a/drivers/clk/kunit_clk_assigned_rates_one.dtso b/drivers/clk/kunit_clk_assigned_rates_one.dtso
index dd95ec9b1cf977883f71564a94602ae518937132..da6e91b9e6bda0ef2c8f601a08aef1f10fda4baa 100644
--- a/drivers/clk/kunit_clk_assigned_rates_one.dtso
+++ b/drivers/clk/kunit_clk_assigned_rates_one.dtso
@@ -10,5 +10,8 @@ clk: kunit-clock {
 		#clock-cells = <0>;
 		assigned-clocks = <&clk>;
 		assigned-clock-rates = <ASSIGNED_RATES_0_RATE>;
+		assigned-clock-sscs = <ASSIGNED_SSCS_0_MODFREQ
+				       ASSIGNED_SSCS_0_SPREAD
+				       ASSIGNED_SSCS_0_METHOD>;
 	};
 };
diff --git a/drivers/clk/kunit_clk_assigned_rates_one_consumer.dtso b/drivers/clk/kunit_clk_assigned_rates_one_consumer.dtso
index a41dca806318b031187c1b8739fcf71eb088a480..4b6e06048f863d014aed8222652d6d9d38e9238b 100644
--- a/drivers/clk/kunit_clk_assigned_rates_one_consumer.dtso
+++ b/drivers/clk/kunit_clk_assigned_rates_one_consumer.dtso
@@ -14,5 +14,8 @@ kunit-clock-consumer {
 		compatible = "test,clk-consumer";
 		assigned-clocks = <&clk>;
 		assigned-clock-rates = <ASSIGNED_RATES_0_RATE>;
+		assigned-clock-sscs = <ASSIGNED_SSCS_0_MODFREQ
+				       ASSIGNED_SSCS_0_SPREAD
+				       ASSIGNED_SSCS_0_METHOD>;
 	};
 };
diff --git a/drivers/clk/kunit_clk_assigned_rates_u64_multiple.dtso b/drivers/clk/kunit_clk_assigned_rates_u64_multiple.dtso
index 389b4e2eb7f74f1770ff5f5c4be5b45dd344dc9c..3a717dab2d00b7fdaff580e30ed2cc520683ef95 100644
--- a/drivers/clk/kunit_clk_assigned_rates_u64_multiple.dtso
+++ b/drivers/clk/kunit_clk_assigned_rates_u64_multiple.dtso
@@ -12,5 +12,11 @@ clk: kunit-clock {
 				  <&clk 1>;
 		assigned-clock-rates-u64 = /bits/ 64 <ASSIGNED_RATES_0_RATE>,
 					   /bits/ 64 <ASSIGNED_RATES_1_RATE>;
+		assigned-clock-sscs = <ASSIGNED_SSCS_0_MODFREQ
+				       ASSIGNED_SSCS_0_SPREAD
+				       ASSIGNED_SSCS_0_METHOD>,
+				      <ASSIGNED_SSCS_1_MODFREQ
+				       ASSIGNED_SSCS_1_SPREAD
+				       ASSIGNED_SSCS_1_METHOD>;
 	};
 };
diff --git a/drivers/clk/kunit_clk_assigned_rates_u64_multiple_consumer.dtso b/drivers/clk/kunit_clk_assigned_rates_u64_multiple_consumer.dtso
index 3e117fd59b7da19cd8a603af77eff29175ce6900..cbee7cbad068f3336f0c8997a5b3e9af4db565c9 100644
--- a/drivers/clk/kunit_clk_assigned_rates_u64_multiple_consumer.dtso
+++ b/drivers/clk/kunit_clk_assigned_rates_u64_multiple_consumer.dtso
@@ -16,5 +16,11 @@ kunit-clock-consumer {
 				  <&clk 1>;
 		assigned-clock-rates-u64 = /bits/ 64 <ASSIGNED_RATES_0_RATE>,
 					   /bits/ 64 <ASSIGNED_RATES_1_RATE>;
+		assigned-clock-sscs = <ASSIGNED_SSCS_0_MODFREQ
+				       ASSIGNED_SSCS_0_SPREAD
+				       ASSIGNED_SSCS_0_METHOD>,
+				      <ASSIGNED_SSCS_1_MODFREQ
+				       ASSIGNED_SSCS_1_SPREAD
+				       ASSIGNED_SSCS_1_METHOD>;
 	};
 };
diff --git a/drivers/clk/kunit_clk_assigned_rates_u64_one.dtso b/drivers/clk/kunit_clk_assigned_rates_u64_one.dtso
index 87041264e8f544dafddf2e905efc89dc1f917c54..9b04d6927f0830a5621af1cbea503a427b46bee0 100644
--- a/drivers/clk/kunit_clk_assigned_rates_u64_one.dtso
+++ b/drivers/clk/kunit_clk_assigned_rates_u64_one.dtso
@@ -10,5 +10,8 @@ clk: kunit-clock {
 		#clock-cells = <0>;
 		assigned-clocks = <&clk>;
 		assigned-clock-rates-u64 = /bits/ 64 <ASSIGNED_RATES_0_RATE>;
+		assigned-clock-sscs = <ASSIGNED_SSCS_0_MODFREQ
+				       ASSIGNED_SSCS_0_SPREAD
+				       ASSIGNED_SSCS_0_METHOD>;
 	};
 };
diff --git a/drivers/clk/kunit_clk_assigned_rates_u64_one_consumer.dtso b/drivers/clk/kunit_clk_assigned_rates_u64_one_consumer.dtso
index 3259c003aec0be3269ab60a4a3a95df69f8de1f8..4784d40520f4193e4f08c8981386f0772a063452 100644
--- a/drivers/clk/kunit_clk_assigned_rates_u64_one_consumer.dtso
+++ b/drivers/clk/kunit_clk_assigned_rates_u64_one_consumer.dtso
@@ -14,5 +14,8 @@ kunit-clock-consumer {
 		compatible = "test,clk-consumer";
 		assigned-clocks = <&clk>;
 		assigned-clock-rates-u64 = /bits/ 64 <ASSIGNED_RATES_0_RATE>;
+		assigned-clock-sscs = <ASSIGNED_SSCS_0_MODFREQ
+				       ASSIGNED_SSCS_0_SPREAD
+				       ASSIGNED_SSCS_0_METHOD>;
 	};
 };
diff --git a/drivers/clk/kunit_clk_assigned_sscs_null.dtso b/drivers/clk/kunit_clk_assigned_sscs_null.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..43b2068c845dea53ea1328bb63a2f58a4b8ef339
--- /dev/null
+++ b/drivers/clk/kunit_clk_assigned_sscs_null.dtso
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+/plugin/;
+
+#include "kunit_clk_assigned_rates.h"
+
+&{/} {
+	clk: kunit-clock {
+		compatible = "test,clk-assigned-rates";
+		#clock-cells = <0>;
+		assigned-clocks = <0>;
+		assigned-clock-sscs = <ASSIGNED_SSCS_0_MODFREQ
+				       ASSIGNED_SSCS_0_SPREAD
+				       ASSIGNED_SSCS_0_METHOD>;
+	};
+};
diff --git a/drivers/clk/kunit_clk_assigned_sscs_null_consumer.dtso b/drivers/clk/kunit_clk_assigned_sscs_null_consumer.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..bda008f5aaa35e53af97863e4f2e6d8a168cc053
--- /dev/null
+++ b/drivers/clk/kunit_clk_assigned_sscs_null_consumer.dtso
@@ -0,0 +1,20 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+/plugin/;
+
+#include "kunit_clk_assigned_rates.h"
+
+&{/} {
+	clk: kunit-clock {
+		compatible = "test,clk-assigned-rates";
+		#clock-cells = <0>;
+	};
+
+	kunit-clock-consumer {
+		compatible = "test,clk-consumer";
+		assigned-clocks = <0>;
+		assigned-clock-sscs = <ASSIGNED_SSCS_0_MODFREQ
+				       ASSIGNED_SSCS_0_SPREAD
+				       ASSIGNED_SSCS_0_METHOD>;
+	};
+};
diff --git a/drivers/clk/kunit_clk_assigned_sscs_without.dtso b/drivers/clk/kunit_clk_assigned_sscs_without.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..08660846b55c12122bfb211c01c377a3a45223c9
--- /dev/null
+++ b/drivers/clk/kunit_clk_assigned_sscs_without.dtso
@@ -0,0 +1,15 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+/plugin/;
+
+#include "kunit_clk_assigned_rates.h"
+
+&{/} {
+	clk: kunit-clock {
+		compatible = "test,clk-assigned-rates";
+		#clock-cells = <0>;
+		assigned-clock-sscs = <ASSIGNED_SSCS_0_MODFREQ
+				       ASSIGNED_SSCS_0_SPREAD
+				       ASSIGNED_SSCS_0_METHOD>;
+	};
+};
diff --git a/drivers/clk/kunit_clk_assigned_sscs_without_consumer.dtso b/drivers/clk/kunit_clk_assigned_sscs_without_consumer.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..e1c089c6f0c0223f16f7ac9a396e7ac7b821c967
--- /dev/null
+++ b/drivers/clk/kunit_clk_assigned_sscs_without_consumer.dtso
@@ -0,0 +1,19 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+/plugin/;
+
+#include "kunit_clk_assigned_rates.h"
+
+&{/} {
+	clk: kunit-clock {
+		compatible = "test,clk-assigned-rates";
+		#clock-cells = <0>;
+	};
+
+	kunit-clock-consumer {
+		compatible = "test,clk-consumer";
+		assigned-clock-sscs = <ASSIGNED_SSCS_0_MODFREQ
+				       ASSIGNED_SSCS_0_SPREAD
+				       ASSIGNED_SSCS_0_METHOD>;
+	};
+};
diff --git a/drivers/clk/kunit_clk_assigned_sscs_zero.dtso b/drivers/clk/kunit_clk_assigned_sscs_zero.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..f39f4e754e532c9c1b1fdf034700e5af1f3f0779
--- /dev/null
+++ b/drivers/clk/kunit_clk_assigned_sscs_zero.dtso
@@ -0,0 +1,12 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	clk: kunit-clock {
+		compatible = "test,clk-assigned-rates";
+		#clock-cells = <0>;
+		assigned-clocks = <&clk>;
+		assigned-clock-sscs = <0 0 0>;
+	};
+};
diff --git a/drivers/clk/kunit_clk_assigned_sscs_zero_consumer.dtso b/drivers/clk/kunit_clk_assigned_sscs_zero_consumer.dtso
new file mode 100644
index 0000000000000000000000000000000000000000..d6bd7dfada7e2f455cb23e483b9bd6ce24839e3a
--- /dev/null
+++ b/drivers/clk/kunit_clk_assigned_sscs_zero_consumer.dtso
@@ -0,0 +1,16 @@
+// SPDX-License-Identifier: GPL-2.0
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	clk: kunit-clock {
+		compatible = "test,clk-assigned-rates";
+		#clock-cells = <0>;
+	};
+
+	kunit-clock-consumer {
+		compatible = "test,clk-consumer";
+		assigned-clocks = <&clk>;
+		assigned-clock-sscs = <0 0 0>;
+	};
+};

-- 
2.37.1

