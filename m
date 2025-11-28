Received: from DU2PR03CU002.outbound.protection.outlook.com (mail-northeuropeazon11011003.outbound.protection.outlook.com [52.101.65.3])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67BF22DE6E5;
	Fri, 28 Nov 2025 03:14:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.65.3
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764299700; cv=fail; b=VbBWRurxK8N1Gc5a59AbIbS9UwSnRaICbGMnIBlGixdIE/LRI2CTELVJJD8i9t11C+zZcTdk9nZ6fxlkyXgpt0QSo/AwFc8WoVCeCVub4yIuDDJZiBAqBLZqrT8+DstirU/QFk8/EmmXx35m8PUdSiM/imrq4XBULaxNdQj+SfM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764299700; c=relaxed/simple;
	bh=0k0JmNMzEuxw68RYlDUpJR99jff2TkJc8iC3A6fnV3E=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=RfFBuOSRgU/95XtvfKdgYaiw2CGiE/rFADJMoyy3pHPNJ2eMsrHCg4Y8b0N11cC42rLSdkx7PCWNQgYsGQogJzcdWKt7mSvUkQxqBW64DdEKj97TUPXB8q2VeR/PQe/wzo+kWX0hSRPIt+Si00Eta+jjNTHQ0srLUrGFeEhslCo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=M68ztqCY; arc=fail smtp.client-ip=52.101.65.3
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="M68ztqCY"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eEWC/xBur92syPKHRBLVObG9pfFseJQuYFk3hr0pitKqL5jv770i2Wjy2vZAr2O0cwMT14gEAciITrUSSCOCRjI3rM+1kvEospGkYmgoKwsFTkJeiyViCLJcY7ZL4ka2y6embwd8TozkBzjpI2OU5PmklgxROseeNd/JuhUxsLjwlJoO6wBxeUj1ZNjfF5vwOpiVwliRXF2qs8lvkxipyRtFS4yqTZgm4+J9X2rgmdSaiJHzU455GUoKdS81RDpEGnrVavaW5q9u436iN02LC0WSlH8Ss2W6mBjSm6qR/5+jr0hZjLvPvNRHPB3sxWgpWCBnVObMSz+9IyG1oKlRjQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5cxuJG21DsOwlcD3WvZG/izZpVQlox7FcT7lthS0/wE=;
 b=NV2WOAihmMLvJa+D9k1U7JrodjGKKVfrpS9j04ftfoV9lG7MhLCupefOPxD0rrDVY+QWReu/+5wem/9fbtFuLYAXR0J7pZcNmvNN1Eoz4hv/arC1oeFKrwJqkf7jWHancqnaFunDI+CuTiomH5/PPF9RzmVhO/qCTO5sjlm9GQhXWqh3n2AYB8Y2qBEcKChuBZAXUDgxUyjc8cvUg7FzWTaoOCfcEQqjCCeTQ488Q3DJkR2MiSTM1LiccGBnUgQqA2TE6Ccb8tREslAy5Iw/kcPB8rubRzdSsLVE8ZwAMSurI7Fv0C8LGQt5RJvh1ndBV124P/OWeCUeyLfLas9akw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5cxuJG21DsOwlcD3WvZG/izZpVQlox7FcT7lthS0/wE=;
 b=M68ztqCYemktKvsRoHzLdUekWYK97AEEaAgXC+V8xE58kd1QI+hqMLcqt6FWZiBOtGD91Q9IKAnAhsxvVH3je+X4wB2IxcW+sOj0qLOYh16enrkUMcgzyaruAxSYCg4JJD70kMNgh1Hb7p0nACvinOlFIeGpxgdWZLuoap+bUPFAKfyS6Aw+WFBvhdSMKW9BTkJZCo9dMJ/TcREAUuSGa67p2urrDn/jvqCduW9sVok3TjC6FU5gXo/EqfXYvbsCaX4SvagLmW8fsT9vJvMJuzNUYNCBft1kToehCp2h18WpYds3no28lGF9s3W6ph76AmAE7AgVik18Z2JhQb0YwA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by DB9PR04MB8429.eurprd04.prod.outlook.com (2603:10a6:10:242::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.15; Fri, 28 Nov
 2025 03:14:55 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 03:14:55 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 28 Nov 2025 11:14:15 +0800
Subject: [PATCH v6 6/6] clk: scmi: Add i.MX95 OEM extension support for
 SCMI clock driver
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-clk-ssc-v6-2-v6-6-cfafdb5d6811@nxp.com>
References: <20251128-clk-ssc-v6-2-v6-0-cfafdb5d6811@nxp.com>
In-Reply-To: <20251128-clk-ssc-v6-2-v6-0-cfafdb5d6811@nxp.com>
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
X-ClientProxiedBy: SG2PR02CA0031.apcprd02.prod.outlook.com
 (2603:1096:3:18::19) To DB9PR04MB8461.eurprd04.prod.outlook.com
 (2603:10a6:10:2cf::20)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DB9PR04MB8461:EE_|DB9PR04MB8429:EE_
X-MS-Office365-Filtering-Correlation-Id: 91424640-facf-44d7-5c7c-08de2e2c4c98
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?R1p4cEhrVjZ3VWVNeHltdFU1QlFGVGpNSmFmdWlWalFjU1FEeHNRdlZWNmhS?=
 =?utf-8?B?c0VScDZEZjFOS3RIVU5zc1hwMU0xSy9WOG96ME5VUStHR3RmNm92TUorT2k2?=
 =?utf-8?B?TDdhNHdMaVNDTW1ZaUN2dEhKZGhPMDA1SloyekVNSzc4ZW5aYjZRRUYxQ05L?=
 =?utf-8?B?Umd0TDY5ejY3clFnQ1M2VitaaE5IRnErSzROUkpGQmhETUtNOEFXUTVobzlC?=
 =?utf-8?B?RFFoTjA3TjVnbTAxM2w4eVZzK0xnWXZ0ZEFiZFpuOWs0RkxKM2R6RVlQZG9O?=
 =?utf-8?B?YWZ6OCtmYk5JZ0dRRHBBUU8waFBrWE5UWEI5blFDTXB3YTI4ZWtHMENsU2NQ?=
 =?utf-8?B?QTJCdWx3YTk4UzYrcjFCZGZValZPN1pOV3JSRzZleHdNeU5JYm5PWWlueGo1?=
 =?utf-8?B?czJvL2tqS0YxTXdrbStVRGZsL3dreFJ3OWxHVFk2TWl3SFIyYUJlQzNxejFM?=
 =?utf-8?B?RmFVa052RkUyclk1dXFlcC9ZcGVxdFgvL0hISTdZejNiRmRDWCt5NW42Tm0w?=
 =?utf-8?B?SkpNQ1o2bDJ4V2dlQ2hjaWZsc3B3bDd1ZXpTTWNlUVZtUEp5OFVzVzFlTXZH?=
 =?utf-8?B?ekJmamxHMCsvRFdjREkreURYY2dVUVVmN3plRFFFSWFENGRXWE9pU25qNWFF?=
 =?utf-8?B?dlJLMGtPZ2hhVlJBQVNSUHRnMXpWSXlSb0gyZHJZTTExd3FVMlduUUUraXd4?=
 =?utf-8?B?aURIMlc1cExic2Q4VENFb2JMbEdEaSt3VlNNQ3hoMVVpRjNZSyt4SmhyMFpp?=
 =?utf-8?B?N0MyZkx6OEtibk5lSEk3bHNQMFpKUFIvampsWWlJN092WUtIV0haZm5CZTFq?=
 =?utf-8?B?ellyR0w0dkNsSE1Bb3dWV050b1JpdGNtWlNKQXRqOElkUnlzQUZYdmkxbldH?=
 =?utf-8?B?RTJlc2o4ZWdJZVhwY3JLTyt0dmJVREd0MTlxcU1QREhKSVBZQXdFZTVDMnV4?=
 =?utf-8?B?SVpyaUZyMmhGUTczd2lpRHIxc05ydFA4QTlhR29KZktoNGhLQ045czI2SnAw?=
 =?utf-8?B?UHBpeVlBRGE2TWxabDI3aFBRSjlhQy84b3llVWYxVDlRdWxVNlRSaEZ5ckFp?=
 =?utf-8?B?aVRTUWdFWURRQ3dPOWh5bkpOVWJkUXhpbzUrM04xVUFvQkdmNmZkY0NrdUhX?=
 =?utf-8?B?ZkM4cEY0RDFvRHVqTDZXQkJTcnVMaEh2UC9FSXFUNkpXcGRGSzk5MHhKZStz?=
 =?utf-8?B?TWV4VmYvc1pnWWowQUl5ZWphZVJqZWUwcGtxSlZxN3VVZUZNYTNiTzZOeHo2?=
 =?utf-8?B?bGMrekpxRDluQ2llamJSaXhIUlY4aFoxenRabUJIN0M5R2JOSFdrSVJBeFFP?=
 =?utf-8?B?U3dpN0h6VW9Xb2VNSmxpbGROZ1RERkZNL2JmV3lzYkRKMENuaDRYTWhOOFBT?=
 =?utf-8?B?eThRVCtaZVE1K3UzSnpER1lQZm10eWFLMitVTGRQaFBkOXpnaVZ1SWZqMDI0?=
 =?utf-8?B?VndWL01QaXlHVjIydE5SSUYrOCtSU0p5QWRJTVRVMWtmUmYxSkkzQWJUVzZ6?=
 =?utf-8?B?VHRFUC90YVVBbkF4M1k0Rm1ySVNaZ0JVTU1sb1FGV3hkT2ZIVytZMTRPSlFu?=
 =?utf-8?B?VC8yTDhMUnF0clpxbWZJNjgrTFB6WTJ2VXVMc0tmb1RLU2tmakFnc3FzVXNs?=
 =?utf-8?B?UlBzNjNWZ04wd2lENkVDZExJOFZrN1dVWW4ydlpGYk5VL2I4WGJnTmJGaUFW?=
 =?utf-8?B?dGo2Zml5ZnZVdUpNd3lnaUVxVC9nWjFrTlpOU0NOeDh3VzkrWWdiQnZhR1JN?=
 =?utf-8?B?QzJsTU5weFY3Nmxtc21RN2Rzd2NHcHA3SHVtWVpOZDdBY2FDemd5Q000VnVq?=
 =?utf-8?B?ZEhPYUkxemdaT0F5TUpUN1lEalhrRjVuZlRkY0FRVkFpOWZwSk5NdWhSSEtY?=
 =?utf-8?B?dHBHUTdKT2NjVFcxMUlPZi9HN3RhOTFTejg2bXU4N3Fid1RtUmF2RUU1QlNq?=
 =?utf-8?B?RThXVis1UWlROUp1MTVQQUE5aTk3b1VMUzFBRWxCbFZVZ0tndjY0bG1HOWl0?=
 =?utf-8?B?Qys4Y3dybFI4NE01U1VTdHdCVWlHVHV4ZHNJT1ZlUi85VVMxbGx6Y0hzeWYv?=
 =?utf-8?Q?2US0yS?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(19092799006)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YWczWlQ5MUdUMEVZdzFPWDZDaUloVGhUcWpNUG9xNTJvK3l6ZTBVc1ZuLzFy?=
 =?utf-8?B?RmVucWc2NU5CdzAybDZrV055cW0xY1E3djJqNUN5c3k3U2xqUGtLd0JFRzlz?=
 =?utf-8?B?ZGllMWd4QmdUNGs5ZG5pTC9Qb28zcTFZOWFZaEp3d3IzT2paamJhYmg1dk5U?=
 =?utf-8?B?RDFaLzZWRjVaSDdOUXprZkFPOE4vQnVKVkxMUWQ2K0h3UmdJQitTMWFmQnNt?=
 =?utf-8?B?ZkNPSjZQYXR2SHgzVXNPMSs4QjFmYy90N0dUZXltalRYc2lpWXZLcFlsdSt0?=
 =?utf-8?B?bk91OEh6K3RzVzZ3Wmg2bHczdDgzZENuMHVKKzIvdFlac0MvWDZDanlHTGFD?=
 =?utf-8?B?V2dFalhsZzJKZGlpY0VZVm9NajVaMWMwQUNDcWlTUWk1a3RDTDA3K3hKTDdK?=
 =?utf-8?B?NHBUUXpWYXVYMjZDZnhXc2l5K1U3UkhaVjhIZkE4SHJoaUg1SW9FMGRDbi92?=
 =?utf-8?B?LzNaaXFvU3dLU2x3SWgrLzd6TERxU1U4eCtXME9CdXAzeElXdjl2L0NINzdi?=
 =?utf-8?B?ZWt6OGM1L1hIODZkWTkySW5wQkw2VnUxaG9aalBKNGVlTFF2RXhDZGN1R01o?=
 =?utf-8?B?byt6VW9HbVpkeXJ6RnpaM0loanNZSittVWVuZm5OSVhMLzVHbndDUGd2MDdW?=
 =?utf-8?B?eUJJZytmM1dUMjlMZ3lOUEVGQi9XeDlJKzZiNk4vQklmWnFUbythMXRqNFpF?=
 =?utf-8?B?RHE3Y0pYZUpoeTVYVEVnTk8yQ3VORlNQK0cyNUMwSDNKWWVhOEF2bXNEWnRm?=
 =?utf-8?B?UjV3UkkzcldJWmhvdWxFcVYzcitOQ0l6bXVoVEZkT3lOSDlJNDVBOTdobnNG?=
 =?utf-8?B?VE14K2xWdGt2UkR5bGR1SmRxRXhKcjlITWI3UGZuZS95UjNqL2l0dFIrME1x?=
 =?utf-8?B?bHpXZlY5K3FxOFBnaDB4c1h1VzhxVkdMVEwvTUZpanBidk9mTmpEQ2twcGVE?=
 =?utf-8?B?MzZxL3ZUVUpDYWUwL1RqTHdwTEdiRXZndlJKVjFGQlBFR1lqazFaU0FXUFlp?=
 =?utf-8?B?cHVJUm9pWjBYM3NPdGFFK0FoR0Ryditia1Zubk0zVHc1bHpYNlUvUUErSUJT?=
 =?utf-8?B?aENmdVZZL1JvNWlHMkR6YjFGSUtNbmNJK21hTUg1VjhhV2tPZXYwQTNjNWxv?=
 =?utf-8?B?Zk90d2NqNzZGajFPSDlMSm42RjUvYi9yQmpSNm5uVmpOcC9qRStUbE4vSUNt?=
 =?utf-8?B?NWF6NjRzd1c1c3JEUnJJeVZuSmNab2dHb0F2ekV5WURnbklQMlc5NkFPTkdj?=
 =?utf-8?B?WmdHUUtBaENtV3AxRXFPeGFmT2lGSmVhaWp0ZE5rZXUzdm1BcVZaOEIyb2VX?=
 =?utf-8?B?UjIzRGJUbzFZc1IzbHFjeHRvUFcvVmplMEhTL3J4NWN5YmZlVWVuQzJkbWcr?=
 =?utf-8?B?UUplY0VSYkpWbmVWZHo4Z1U5VUxnUmRiTXBwNnJET0V6cjArUVJkc1lZZTN2?=
 =?utf-8?B?ZzBiMXQxWXB0RG9PYzRwTGhrQlBBaVVoYk5uK1YzSlZvc1FEMVZRWHRzblFn?=
 =?utf-8?B?bHl0dUJJSHVxMlBZQm8rRmtJK0ZVTll6RWRhUWlUWlkxWFdmL29JRFJVQkxN?=
 =?utf-8?B?dDYzZzZTbEJYT0hhOS8rSmlaem50aUJuVnRYN0ZDNHlJV0RSK2dTTEIzRWpw?=
 =?utf-8?B?c1lpM1J6WWZpWjJMRlBub3BJd0lRRkJ2RHkrbkF3bkUxRThQY01CckxiaHdE?=
 =?utf-8?B?RUhkNDVsOXRubHJ2RVJLeDc0M2MxL1JkYjVmS2orNmM1R2E5OW1GRTZLZEVC?=
 =?utf-8?B?cmRFbzlZQUs1UDlXYWRma3dyMXUvdERrZ1NRajRLU0VSMzZkNXZ5S2IwVGpH?=
 =?utf-8?B?QXUrdlpUOXlYU1BzU3p0VTlWaWtzN0F2RXYxRFYzVXFBenV4d0pYTmVwZDBh?=
 =?utf-8?B?czdLdFRINzUxMURXYk0rL3JlT2NTNmM5TnpwSVMyd0daQlRLQmlMZDJCMlVa?=
 =?utf-8?B?ZStwSjczbmFKelJzaU5DSC8vUDRFQXQyUlhENmV1c3hLOUlwZ1VuWWNOVVVV?=
 =?utf-8?B?Rmp6a3J1NkFtS3d6bVFRVkJUdkJqZzd4V29kZzUyM3FxT28yZ0NlQktxeEhI?=
 =?utf-8?B?MHRwcnV5czlEZEdRamRQVUxPL2ZURWRwMFMwUWFtUkdRRWVqOFZpWGhrVVBt?=
 =?utf-8?Q?MTYWis3OfiM5U+NwO3X63Sxjt?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 91424640-facf-44d7-5c7c-08de2e2c4c98
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 03:14:53.9876
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FpqC5ImjD6qUn/piSvxTyjS0R4XH+imPxaCkwGJmC8NJXf/Mx1eFLa8qCnlSPxJ+KHV1ARTaNaNi/su6ElN4dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8429

From: Peng Fan <peng.fan@nxp.com>

 - Introduce 'clk-scmi-oem.c' to support vendor-specific OEM extensions
   for the SCMI clock driver, allows clean integration of vendor-specific
   features without impacting the core SCMI clock driver logic.
 - Extend 'clk-scmi.h' with 'scmi_clk_oem' structure and related
   declarations.
 - Initialize OEM extensions via 'scmi_clk_oem_init()'.
 - Support querying OEM-specific features and setting spread spectrum.
 - Pass 'scmi_device' to 'scmi_clk_ops_select()' for OEM data access.

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/Makefile       |   2 +-
 drivers/clk/clk-scmi-oem.c | 103 +++++++++++++++++++++++++++++++++++++++++++++
 drivers/clk/clk-scmi.c     |  19 +++++++--
 drivers/clk/clk-scmi.h     |  11 +++++
 4 files changed, 131 insertions(+), 4 deletions(-)

diff --git a/drivers/clk/Makefile b/drivers/clk/Makefile
index 9e8c989b24be0f7cfdf2325c9b19d05e9d2a8eb9..fd54e2fe3c429362b93457d0e349e1deab2320f3 100644
--- a/drivers/clk/Makefile
+++ b/drivers/clk/Makefile
@@ -95,7 +95,7 @@ obj-$(CONFIG_COMMON_CLK_RP1)            += clk-rp1.o
 obj-$(CONFIG_COMMON_CLK_RPMI)		+= clk-rpmi.o
 obj-$(CONFIG_COMMON_CLK_HI655X)		+= clk-hi655x.o
 obj-$(CONFIG_COMMON_CLK_S2MPS11)	+= clk-s2mps11.o
-obj-$(CONFIG_COMMON_CLK_SCMI)           += clk-scmi.o
+obj-$(CONFIG_COMMON_CLK_SCMI)           += clk-scmi.o clk-scmi-oem.o
 obj-$(CONFIG_COMMON_CLK_SCPI)           += clk-scpi.o
 obj-$(CONFIG_COMMON_CLK_SI5341)		+= clk-si5341.o
 obj-$(CONFIG_COMMON_CLK_SI5351)		+= clk-si5351.o
diff --git a/drivers/clk/clk-scmi-oem.c b/drivers/clk/clk-scmi-oem.c
new file mode 100644
index 0000000000000000000000000000000000000000..fd81aca7bfca254669ee117ebd51e481a74cdcb4
--- /dev/null
+++ b/drivers/clk/clk-scmi-oem.c
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * The Vendor OEM extension for System Control and Power Interface (SCMI)
+ * Protocol based clock driver
+ *
+ * Copyright 2025 NXP
+ */
+
+#include <linux/clk-provider.h>
+#include <linux/of.h>
+#include <linux/scmi_imx_protocol.h>
+#include <linux/scmi_protocol.h>
+
+#include "clk-scmi.h"
+
+#define SCMI_CLOCK_CFG_IMX_SSC			0x80
+#define SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK	GENMASK(7, 0)
+#define SCMI_CLOCK_IMX_SS_MOD_FREQ_MASK		GENMASK(23, 8)
+#define SCMI_CLOCK_IMX_SS_ENABLE_MASK		BIT(24)
+
+struct scmi_clk_oem_info {
+	char *vendor_id;
+	char *sub_vendor_id;
+	char *compatible;
+	const void *data;
+};
+
+static int
+scmi_clk_imx_set_spread_spectrum(struct clk_hw *hw,
+				 const struct clk_spread_spectrum *ss_conf)
+{
+	struct scmi_clk *clk = to_scmi_clk(hw);
+	int ret;
+	u32 val;
+
+	/*
+	 * extConfigValue[7:0]   - spread percentage (%)
+	 * extConfigValue[23:8]  - Modulation Frequency
+	 * extConfigValue[24]    - Enable/Disable
+	 * extConfigValue[31:25] - Reserved
+	 */
+	val = FIELD_PREP(SCMI_CLOCK_IMX_SS_PERCENTAGE_MASK, ss_conf->spread_bp / 10000);
+	val |= FIELD_PREP(SCMI_CLOCK_IMX_SS_MOD_FREQ_MASK, ss_conf->modfreq_hz);
+	if (ss_conf->method != CLK_SPREAD_NO)
+		val |= SCMI_CLOCK_IMX_SS_ENABLE_MASK;
+	ret = scmi_proto_clk_ops->config_oem_set(clk->ph, clk->id,
+						 SCMI_CLOCK_CFG_IMX_SSC,
+						 val, false);
+	if (ret)
+		dev_warn(clk->dev,
+			 "Failed to set spread spectrum(%u,%u,%u) for clock ID %d\n",
+			 ss_conf->modfreq_hz, ss_conf->spread_bp, ss_conf->method,
+			 clk->id);
+
+	return ret;
+}
+
+static int
+scmi_clk_imx_query_oem_feats(const struct scmi_protocol_handle *ph, u32 id,
+			     unsigned int *feats_key)
+{
+	int ret;
+	u32 val;
+
+	ret = scmi_proto_clk_ops->config_oem_get(ph, id,
+						 SCMI_CLOCK_CFG_IMX_SSC,
+						 &val, NULL, false);
+	if (!ret)
+		*feats_key |= BIT(SCMI_CLK_EXT_OEM_SSC_SUPPORTED);
+
+	return 0;
+}
+
+static const struct scmi_clk_oem scmi_clk_oem_imx = {
+	.query_ext_oem_feats = scmi_clk_imx_query_oem_feats,
+	.set_spread_spectrum = scmi_clk_imx_set_spread_spectrum,
+};
+
+const struct scmi_clk_oem_info info[] = {
+	{ SCMI_IMX_VENDOR, SCMI_IMX_SUBVENDOR, NULL, &scmi_clk_oem_imx },
+};
+
+int scmi_clk_oem_init(struct scmi_device *sdev)
+{
+	const struct scmi_handle *handle = sdev->handle;
+	int i, size = ARRAY_SIZE(info);
+
+	for (i = 0; i < size; i++) {
+		if (strcmp(handle->version->vendor_id, info[i].vendor_id) ||
+		    strcmp(handle->version->sub_vendor_id, info[i].sub_vendor_id))
+			continue;
+		if (info[i].compatible &&
+		    !of_machine_is_compatible(info[i].compatible))
+			continue;
+
+		break;
+	}
+
+	if (i < size)
+		dev_set_drvdata(&sdev->dev, (void *)info[i].data);
+
+	return 0;
+}
diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
index bf85924d61985eb9e596419349eb883e3817de73..1ed2091e3d4a951c8662db4c94dee4b9c98b8326 100644
--- a/drivers/clk/clk-scmi.c
+++ b/drivers/clk/clk-scmi.c
@@ -14,6 +14,8 @@
 #include <linux/scmi_protocol.h>
 #include <asm/div64.h>
 
+#include "clk-scmi.h"
+
 const struct scmi_clk_proto_ops *scmi_proto_clk_ops;
 
 static unsigned long scmi_clk_recalc_rate(struct clk_hw *hw,
@@ -242,6 +244,7 @@ static int scmi_clk_ops_init(struct device *dev, struct scmi_clk *sclk,
 static const struct clk_ops *
 scmi_clk_ops_alloc(struct device *dev, unsigned long feats_key)
 {
+	struct scmi_clk_oem *oem_data = dev_get_drvdata(dev);
 	struct clk_ops *ops;
 
 	ops = devm_kzalloc(dev, sizeof(*ops), GFP_KERNEL);
@@ -288,11 +291,15 @@ scmi_clk_ops_alloc(struct device *dev, unsigned long feats_key)
 		ops->set_duty_cycle = scmi_clk_set_duty_cycle;
 	}
 
+	if (oem_data && (feats_key & BIT(SCMI_CLK_EXT_OEM_SSC_SUPPORTED)))
+		ops->set_spread_spectrum = oem_data->set_spread_spectrum;
+
 	return ops;
 }
 
 /**
  * scmi_clk_ops_select() - Select a proper set of clock operations
+ * @sdev: pointer to the SCMI device
  * @sclk: A reference to an SCMI clock descriptor
  * @atomic_capable: A flag to indicate if atomic mode is supported by the
  *		    transport
@@ -317,8 +324,8 @@ scmi_clk_ops_alloc(struct device *dev, unsigned long feats_key)
  *	   NULL otherwise.
  */
 static const struct clk_ops *
-scmi_clk_ops_select(struct scmi_clk *sclk, bool atomic_capable,
-		    unsigned int atomic_threshold_us,
+scmi_clk_ops_select(struct scmi_device *sdev, struct scmi_clk *sclk,
+		    bool atomic_capable, unsigned int atomic_threshold_us,
 		    const struct clk_ops **clk_ops_db, size_t db_size)
 {
 	int ret;
@@ -326,6 +333,7 @@ scmi_clk_ops_select(struct scmi_clk *sclk, bool atomic_capable,
 	const struct scmi_clock_info *ci = sclk->info;
 	unsigned int feats_key = 0;
 	const struct clk_ops *ops;
+	struct scmi_clk_oem *oem_data = dev_get_drvdata(&sdev->dev);
 
 	/*
 	 * Note that when transport is atomic but SCMI protocol did not
@@ -350,6 +358,9 @@ scmi_clk_ops_select(struct scmi_clk *sclk, bool atomic_capable,
 						 &val, NULL, false);
 		if (!ret)
 			feats_key |= BIT(SCMI_CLK_DUTY_CYCLE_SUPPORTED);
+
+		if (oem_data && oem_data->query_ext_oem_feats)
+			oem_data->query_ext_oem_feats(sclk->ph, sclk->id, &feats_key);
 	}
 
 	if (WARN_ON(feats_key >= db_size))
@@ -407,6 +418,8 @@ static int scmi_clocks_probe(struct scmi_device *sdev)
 	clk_data->num = count;
 	hws = clk_data->hws;
 
+	scmi_clk_oem_init(sdev);
+
 	transport_is_atomic = handle->is_transport_atomic(handle,
 							  &atomic_threshold_us);
 
@@ -438,7 +451,7 @@ static int scmi_clocks_probe(struct scmi_device *sdev)
 		 * to avoid sharing the devm_ allocated clk_ops between multiple
 		 * SCMI clk driver instances.
 		 */
-		scmi_ops = scmi_clk_ops_select(sclk, transport_is_atomic,
+		scmi_ops = scmi_clk_ops_select(sdev, sclk, transport_is_atomic,
 					       atomic_threshold_us,
 					       scmi_clk_ops_db,
 					       ARRAY_SIZE(scmi_clk_ops_db));
diff --git a/drivers/clk/clk-scmi.h b/drivers/clk/clk-scmi.h
index 6ef6adc77c836dc2d599ff852cdc941f217ee388..d7f63f36c56d155f728325efd6bcf7fe2585b170 100644
--- a/drivers/clk/clk-scmi.h
+++ b/drivers/clk/clk-scmi.h
@@ -7,6 +7,7 @@
 #define __SCMI_CLK_H
 
 #include <linux/bits.h>
+#include <linux/clk-provider.h>
 #include <linux/scmi_protocol.h>
 #include <linux/types.h>
 
@@ -19,6 +20,7 @@ enum scmi_clk_feats {
 	SCMI_CLK_RATE_CTRL_SUPPORTED,
 	SCMI_CLK_PARENT_CTRL_SUPPORTED,
 	SCMI_CLK_DUTY_CYCLE_SUPPORTED,
+	SCMI_CLK_EXT_OEM_SSC_SUPPORTED,
 	SCMI_CLK_FEATS_COUNT
 };
 
@@ -37,4 +39,13 @@ struct scmi_clk {
 
 extern const struct scmi_clk_proto_ops *scmi_proto_clk_ops;
 
+struct scmi_clk_oem {
+	int (*query_ext_oem_feats)(const struct scmi_protocol_handle *ph,
+				   u32 id, unsigned int *feats_key);
+	int (*set_spread_spectrum)(struct clk_hw *hw,
+				   const struct clk_spread_spectrum *ss_conf);
+};
+
+int scmi_clk_oem_init(struct scmi_device *dev);
+
 #endif

-- 
2.37.1

