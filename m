Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011030.outbound.protection.outlook.com [40.107.130.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 34180191F66;
	Fri, 28 Nov 2025 03:01:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764298908; cv=fail; b=Tbiom/7vdYmrmzSgPaqQpCzSQbMOzOet3AipayTjUo5Wjo3tbjV7rLPKV2fpL37ZjHWPSQzktPbiAz8OvhLDyDw6ikBfUB5BK8W3b506ndauBeD0lfN4pYOkUpqYzJZ2XIWImTaetujX9vfnKKxwOl0eiOEyTdu1xrOGr4rBs9Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764298908; c=relaxed/simple;
	bh=fuFioNwUi/3Fj3dR/A99fGE9P8T6b/yGcRQsICyEpMo=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=fl/OIMggQknwll9Oc1u1sNI76grt6aPHHMaQ3pukhma2IQl5vREzDqBIoKOkwJDHw+RyMK97LQcPCvb+K/cN7qWe6kHCqTVSKSu5XV8AZNOH/JeZWb9GfEegFURx8RSDkfiGV6SpyFiXb6GsGgLbTj+FQuEWYgbjNiraIrsVaCI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=B6+YcY4V; arc=fail smtp.client-ip=40.107.130.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="B6+YcY4V"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UQEVTJB90kxQ+ADZyLKj7azlHMFSH42BOKt3sc1c6kZuXSpYFpaXAnvZ/dnx7xpKo/67WjpcTa+mD76JU8NO08OGaFjVMQEc3wende71GLT2pvpfXclxwrYGnGMuaQ1e3yUvoA8lC7gzOxU5CvQnjiMg3Z+VD/pJPpw35e42NhLaUGLGBJ94+HUg24H+v0naOqoccp9ahDdRxmtldQQY+tIS+K2nrfyHw07yo7DCLKqH3ey5A50KzLCslavq49b8wz0zxyiNcI9EuXuRJ7o6anZclRa1Ohcnp9SxM4Qweiydm+ipPlnLowBHkB9XFnk/fPlBFiXtal0VZ2vbaFUWlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rT+iF/aKGiTouNx4bu2T3XPFgJzr82S3v3sBFkzoFZg=;
 b=FvvX4tl4ysabQ7L3yR/XMk5wJYNl74Wx7k41MEa/yh4gFhBUSPx0UnxU/A9MZWtKDR3NjwbHajRloJNfdN2Jzh9nrBLjdu6wVjr9PyQDNdhDp6B7/28gU2bOnH9pE5HFaW1VaEGjfD+rR1uiDeTPhgo8a1bAclick4XgyhtPNDwBOZyRpt3ZqeP+7VoHfyHtVmEWwbnSzZoP1ahV7jdhu62Myl+GpkveNaKHWzZK24RrTBaOjugnIsUP921AK2UOUsXx1R23NT2kImFLqRuK+0x8iWxU2ixWI/1r/krfizJZH3dtWZHE7KDADp52CUxArw1AYbpscyzOu8SeOJ/l0w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rT+iF/aKGiTouNx4bu2T3XPFgJzr82S3v3sBFkzoFZg=;
 b=B6+YcY4VF1ZsftT6huOZvnGss/iI8f2x6WqxhML4p+2QApJuzbJjkHVyhFj/y/FQ5xMETxmGiehZCPyFnOSPoMKYv8d6N0F96dFGlDLkwBLWV0Acu/mz6qkZZrFML2nx1VQaJMvYTAUFxnqHGp75+nqBf+Rsw/o93oQUt/nfkEBK/3H/TCT3KXR+Fq3xQih4evZI9WtI8TynacWi/UERzCwBAnaL7RTywBerU76K9L7+6qMu/JjR+N0pAknKrh6BSbOFZ9Ls+RaRxUVKHfaB3qDxrmrZFFSJX7igywH5OgYy2e2O4OH67Z4Yr38AbGTCHqU8xVRLlFPVmYZHfuSBJw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by AM8PR04MB7730.eurprd04.prod.outlook.com (2603:10a6:20b:242::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.14; Fri, 28 Nov
 2025 03:01:42 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 03:01:41 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 28 Nov 2025 12:14:48 +0800
Subject: [PATCH] clk: Disable KUNIT_UML_PCI
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-clk-v1-1-2dd64cbb0c3d@nxp.com>
X-B4-Tracking: v=1; b=H4sIALchKWkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1NDQyML3eScbF0D48RkQyPL5FQDi0QloMqCotS0zAqwKdGxtbUAmUClZVU
 AAAA=
X-Change-ID: 20251128-clk-03ac129ce08a
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 David Gow <davidgow@google.com>, Johannes Berg <johannes@sipsolutions.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: SGBP274CA0006.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::18)
 To DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|AM8PR04MB7730:EE_
X-MS-Office365-Filtering-Correlation-Id: 7f62b05e-502b-41f5-f36d-08de2e2a74c2
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|1800799024|19092799006|52116014|376014|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZXNzZFlIaCtpUTdQY25tb3RaRkVSTkVNUEZzRDRnOHRBZFBJYVpJVUVYc1dv?=
 =?utf-8?B?TjhTZFZRZkk1Sjd3cjU3UFdhNHJOTXNlMXNXZTN6aG8vRnBHcGVRN1hHNkxQ?=
 =?utf-8?B?OGlBUVB4LzY0M0FzRVRLMi96eWU5bVptdzg1ZG9SR2ZhS3A2dWk2M2ZpT0E3?=
 =?utf-8?B?Wm02L1ZGd242dm4vQm5meEUzMVh5THI3b1AvUHVtUCtDSGJ3WWZJdm43UUJl?=
 =?utf-8?B?b2FoRHZxa3cwbG9jekV2TW9wUkptaURVUk4yNUFYTnpDYWhXSjhody9RbUFI?=
 =?utf-8?B?cmlnTzBoaVRhbHA3bTFxeVNadU4zbE1JMVhpZlVCaGRSMU4zYmlJTFF2ajBk?=
 =?utf-8?B?OUhYaTRscTIvSnNmMkVwdTFPYzdKWThhTncrcWZxU3lCRVoyS2wxbGsyTlBS?=
 =?utf-8?B?UUlpVlVPMUJaL0gvei9zMFEwcWNBK1B3b0Y5Rjc4aHVHVmk5VGtjS0xEcnBW?=
 =?utf-8?B?ODdGQkorMEhPek1KNml4OEIwajJEWEtEVEhGSk9OOGFJSHZvZzZZa2ZBdnov?=
 =?utf-8?B?Z0hPdDFIcHA4VWhiQzYzTWZhaEgrZG1QcFFGRnJBOHdKNVRBMVRRK0ZVMDVX?=
 =?utf-8?B?dVdyeS9zcm5ScDZhYmJhOHRFTjV3QktBRGhQQ3BtWVZTSzFJNGhiVzhOMkRn?=
 =?utf-8?B?eWRydzllbWd1SlhWYnZoU2U5cW5MLzBTTmdOM0VTSEttY3pFVk8zc0dyREZO?=
 =?utf-8?B?U3dFTi9wV3lGYUNXWTRaYXo5YWxTcnM3c2k2Q25WNEtJWDVOQWJ0TzQ2TDNp?=
 =?utf-8?B?c0pqZ21oaHhRR3I0dmZFanVtdCtwNnRMOTRlbWNXeGFPRS84ZXhxMnhubEdn?=
 =?utf-8?B?ZWRKNjJQeGwwdkRPTGZrNWVjYjB0YkIrdW9qSW9keTN4cTZjdFpsNTJndXFl?=
 =?utf-8?B?ajhpanlkWjYyY29mVlNOZ0dJWkxSZDlpQ05oZlNxMGR1ZjNnN2pFenhEeHM4?=
 =?utf-8?B?b0llM0t0Yko3QUEzcFd2MjUxZEVKd1VuN1FwWTBlc3FqY0VEcktUL2FwN3FZ?=
 =?utf-8?B?M2RYOGhuWXdvTU9hN2FRTVRNcW9lUzFJdGZZWTc0amNkWWxRT1ZhWVFUNzAr?=
 =?utf-8?B?d3VLOFphUmdOWTcxUjFnMzdCVTVhL3dqSUhFK1dpc2xWek12VzQrRjJzbHIz?=
 =?utf-8?B?S05CTmVTRmlyS3ZBQnlpUTZLV1E1L0xoMHRPTFIwRG43eHdhRFdUVEFteUI5?=
 =?utf-8?B?Sy9pUFJhUGlmSkJZandJcGVOSnR2ZTdFTm5reTl0Wi96TXk4ZDRpdHVYblVW?=
 =?utf-8?B?Vlh4ZTBSWm1EZ2VBUFFsSGszYTNIa0xMeEdnVzAvMXE5ZFg4ZGNwTnZqSFJl?=
 =?utf-8?B?NkQ5MWJFRkU3ODR1Q0FNczE3UDNTKzdnN0F1MnhXTjJCZDRIdEJkSFFHZUpo?=
 =?utf-8?B?SllQS1czVVE5WExTQm9YVFVSS1h2MzBUcTBybjNxTy8rcDBZWlB1eCt1TDNK?=
 =?utf-8?B?cGxvVW00ZW9RVEN4b2poZENjeXBVYzY1UDBDSG1lbkx6eVgyS3J5TFlmazVH?=
 =?utf-8?B?WFRGcTdEUDg5U0pRcjlFeUFBUllIbkYwUUJGQTN1VytLUFl4U3BYUkZEcyto?=
 =?utf-8?B?M1FmcExQK2RZNUlUcS93SXZkTVl6cThic3RnK2hmUEpNWFpHU0pQblR3c21i?=
 =?utf-8?B?REtyMnRLclk2QlZmZ0Y0emVJb210U2ZjblNEZ3dXMXRVTW1FS0hWd3RIT1Ez?=
 =?utf-8?B?Tk9jU1hmT1Nqbnh6eHpqTU5WTUVKV2VJUTBvdDFmZUt6Y2VBQjRkOElGc2hK?=
 =?utf-8?B?dXpPbnpmalZ1bGhyMk12WElQNDhISmNGNzd4VWpqL2xMTVdtS1hvdjJlOGNj?=
 =?utf-8?B?MkhuU3VkUmJtMGdyRm9oNU9IbFY1Z1N6RlpiL0R6ZnhxZk9EWFl1YVNKcDBt?=
 =?utf-8?B?bWlsa09EcXZueVhKYTg5ZjlzUjlXTnYyWVdWaFkzQXgwQXNjR1BxWmVpMUNF?=
 =?utf-8?B?OGFLODNXWjJ3TWIwZmlNYmNQWFg2R0h0S2RKMTlWQkpqaC9CTEptOGlEdWFK?=
 =?utf-8?B?MVhJRGZnS1k3ankxVTh4V0NpVUpNQ00xWTlOc2M4a002OXpoeWtNUlJPK1F1?=
 =?utf-8?Q?qxkUb1?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(19092799006)(52116014)(376014)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Uk91RVNZbmx3ajN0em5pNy9rRGk3ckdOc0xoWXdMaVVPeGl1dlBCRi9CeE0v?=
 =?utf-8?B?NDlBb25qSU1GL1d3b1YwaXJRenAyb0VrMTlFTmhQZGhVNnVBbHU3QmdKWTRa?=
 =?utf-8?B?eDhrbDh4MWtoU1k3c3Y2T0VRQU5SekV4R3J5Q2NoVU8wNHdzN1IvaHNzemxZ?=
 =?utf-8?B?T05LMXZjVWdXMDRSZ25GdFA0NDE5WXZZN2xVWXBKZ0hDbDRQK3pSSWdlRFd0?=
 =?utf-8?B?WW9KVXNlQkhLSFdCSVJuTUJYR1BXNC9VYjc5NDEvb2l2cjNEWjRZNUwyYTMr?=
 =?utf-8?B?dTg1RFZFeFUyeXIrTVM4NlB4UFc3STAvUFYrNWRHRkFXS3ArODE2dzhSLzBO?=
 =?utf-8?B?WHU4QXhoWjI3VDhYT25ORFpXbzBvYmZKUHRDcExnVXRnUWVScXp3QjdVSmVp?=
 =?utf-8?B?RTVmd1hKckRRM0VFTDNuRnFiNmYvaFhCQWJ1QjNzanNtRldDci9jU1dndDZl?=
 =?utf-8?B?dGpQUjVSbDJtdDdlSnhvaTZ1SEZWNmZuMlZNeVNIenpFYkZ5ekJ1cDZIWWtN?=
 =?utf-8?B?RExBUDVHYzREbkVscjdTRU5GVGovWFM5RE03bDVnK3dUVU9WUzNxZ2RZYzRF?=
 =?utf-8?B?a2FIOXc4V1EvRzl5Wnh5YU05ZjVNZTczOG10U0xCSDZCSXg3UGNYNlJMRUFN?=
 =?utf-8?B?ek5NQlhwTU1KUFB5b2h3aU1Rcm9zOG11ZWVkVWU1aHJ1U2ZQcW1TaGRFNnd1?=
 =?utf-8?B?eThSaS9YbU1CZDNIZmRrc2pNMXJIekNkcmZEMGg2anJXQzQreGpJc1lFZ0Yr?=
 =?utf-8?B?ZDFWMXdmUVR4NThlYTdPV09BK0hNQndia0ZtVUQ0bjJkL3RrZUF1QXZUWi84?=
 =?utf-8?B?b09acS9ENEJURlkxOWRmV1BFVHUzdkNZYjRoM0VHc1RlUnJCSWNvanRoM1ph?=
 =?utf-8?B?VjYzTWpLNGtrdlo2M2U0ajhaWDg1ZWJqSUxZazMvaVlacXpHSDA5L1JWR3JE?=
 =?utf-8?B?MmN1cnNGMXhrdlRJMmpRMy8vTVBKTld2NTgvOW5nY3UxZm5kWFBrMmpSV25i?=
 =?utf-8?B?aEtrRHJXdEIvNm5hYlMyMTdpYTVXMUlJVFB3bG5SWmJTd0QyUngwL3N5eDhH?=
 =?utf-8?B?M20yZU9PZ2RRdzFEZVNKR1RvK21TeFF5WGpXbEZkeDFvdFV0QVJ3WU95YnFK?=
 =?utf-8?B?cGVxOFFCSFYzTVRDdUZmY2hEWDA5TjlWRTcybStxOC84dXgwbDNJYUxwS0dz?=
 =?utf-8?B?c1dWaCtXM3BKNVZkTkF5SVdQVWtCOHJnbG1ZUzNaZW1yUWpDR1NFOWp3UjY3?=
 =?utf-8?B?MCtNMUVLbHFUQ0k4MnNnTVpQYkIyejNQNytuTDVZOVVxV0ZaVjJjUkJuRU5u?=
 =?utf-8?B?aERRYWJlWjRnVkk4RXhpendaV0srOGRLakJQQlFpSnU4c1E4cUN1OFp1Tmpr?=
 =?utf-8?B?NlgyYjZhWE5qOVFzWkxqRTAxZHdBM3Y2VmxVQk1RalhzMXBwdWlKaEw3ZjRE?=
 =?utf-8?B?RGw2WU1LMkwxeE5zVGdWa3Ezb3BQZG9RQ2g4Yk5ha3IxVnhyWVRvQ1laRDI4?=
 =?utf-8?B?TSs1TXhheTcrQVNyWmlOeUcvSzh2eGdmVVVBbGNGdHlhc3JHVCt6ZVduSGdE?=
 =?utf-8?B?bXhtbWJ5NDNtbVFVVmdSZEtlTzNGb2ROV1NlckswZnYxRXE1SWYyWXZUWUVl?=
 =?utf-8?B?SXBXUUZiVzkxeVhBWXQ5dFRHR3NMd2xnNExJUlBuSzZsaC9SeVBDUHg4U0ty?=
 =?utf-8?B?c3ErdC9uZThFbFFhT3J4SUExekU5UDRjM2I0bDFTM3NtTC9xYlozRWM2MGc5?=
 =?utf-8?B?djZVb1NiREpQK045MHhvSkFIY0xWZThTR2hBdDJiclMzOGgzbFVmbDAzUU95?=
 =?utf-8?B?dTRvZkVLWHIxdWRONC9sc1Fhc1ZlczVWU1piYnFoS29NeExKNjh0VXR5NEtN?=
 =?utf-8?B?a01HK1FvUTlVZkZUMFRsYTJtcnNiZHJEaWkxcy91NFMzTmd2Y25vMnNndFBy?=
 =?utf-8?B?c1B2YXEvaXVNU0pTVGZhWk5CcE5aZ0YxSkQxcUI0SlozTnBkcytPWEVtM3d3?=
 =?utf-8?B?MTJFQ054Tlc5elE1amFTZEVlMVN1WWNkcStkcW9Hb2J4blJGejhCcUwyQTM1?=
 =?utf-8?B?MFRlcFNKVERvVEpvVFVXU2V1QW4rc1hLOTVpODBON0Z6NUhDcVpzQVNMcWk4?=
 =?utf-8?Q?NXgMuiZdp0GSxaCJMOIRSARQu?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7f62b05e-502b-41f5-f36d-08de2e2a74c2
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 03:01:41.7042
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Rxih12iRYUq3P8UA9TuTgykxD55YUW/RUHuF6DGnDllUQ0ERyDm5AyJvsy07NzzssNHEk0mrIg1eMGmHanpS2Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM8PR04MB7730

From: Peng Fan <peng.fan@nxp.com>

commit 031cdd3bc3f3 ("kunit: Enable PCI on UML without triggering WARN()")
causes clk gate test fail. Deselect KUNIT_UML_PCI to avoid the failure.
Dump as below:
WARNING: CPU: 0 PID: 227 at lib/logic_iomem.c:141 __raw_readl+0xac/0xe0
CPU: 0 UID: 0 PID: 227 Comm: kunit_try_catch Tainted: G
Tainted: [N]=TEST
Stack:
 a0883d00 00000001 00000000 ffffff00
 603ef142 60044832 6002598b 00000000
 00000000 600211b3 00000001 00000000
Call Trace:
 [<6032534c>] ? __raw_readl+0xac/0xe0
 [<60044832>] ? dump_stack_lvl+0x57/0x73
 [<6002598b>] ? _printk+0x0/0x61
 [<600211b3>] ? __warn.cold+0x61/0xeb
 [<600212cc>] ? warn_slowpath_fmt+0x8f/0x9c
 [<6002123d>] ? warn_slowpath_fmt+0x0/0x9c
 [<6032534c>] ? __raw_readl+0xac/0xe0
 [<6002123d>] ? warn_slowpath_fmt+0x0/0x9c
 [<6029e2ad>] ? clk_gate_endisable+0xcd/0x110
 [<6029e315>] ? clk_gate_enable+0x15/0x20
 [<6028795e>] ? clk_core_enable+0x6e/0xf0
 [<60289f1f>] ? clk_enable+0x4f/0xa0
 [<602a06af>] ? clk_gate_test_enable+0xbf/0x360
 [<60053df9>] ? os_nsecs+0x29/0x40
 [<600cd300>] ? ktime_get_ts64+0x0/0x130
 [<600816c0>] ? to_kthread+0x0/0x50
 [<602507bb>] ? kunit_try_run_case+0x7b/0x100
 [<600816c0>] ? to_kthread+0x0/0x50
 [<60252aa0>] ? kunit_generic_run_threadfn_adapter+0x0/0x30
 [<60252ab2>] ? kunit_generic_run_threadfn_adapter+0x12/0x30
 [<60082091>] ? kthread+0xf1/0x270
 [<60047591>] ? new_thread_handler+0x41/0x60
---[ end trace 0000000000000000 ]---

Fixes: 031cdd3bc3f3 ("kunit: Enable PCI on UML without triggering WARN()")
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/.kunitconfig | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/.kunitconfig b/drivers/clk/.kunitconfig
index 08e26137f3d9..4697bf9fb949 100644
--- a/drivers/clk/.kunitconfig
+++ b/drivers/clk/.kunitconfig
@@ -1,4 +1,5 @@
 CONFIG_KUNIT=y
+CONFIG_KUNIT_UML_PCI=n
 CONFIG_OF=y
 CONFIG_OF_OVERLAY=y
 CONFIG_COMMON_CLK=y

---
base-commit: 765e56e41a5af2d456ddda6cbd617b9d3295ab4e
change-id: 20251128-clk-03ac129ce08a

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

