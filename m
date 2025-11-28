Received: from PA4PR04CU001.outbound.protection.outlook.com (mail-francecentralazon11013016.outbound.protection.outlook.com [40.107.162.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311B72DC32E;
	Fri, 28 Nov 2025 03:14:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.162.16
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764299690; cv=fail; b=rSV2sw6N2zPRLJNToie53a4Lg0jOM2gPiGIitdzyGQul0DPAkdLV7889/psLiQtsgJFctcYTjXbp9Vc8p+lyC1TEUKlV3m769lmmuORO8lE5gGDlTPwXmcDxforRwO8jlwONZG165YrSvM0JL8k145VrqafNAqXumg7atiRNssY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764299690; c=relaxed/simple;
	bh=2mtUwFfnmwKNNQyu8izKYolFWmaJKZy+YuKhp8DvFz0=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=ZDOGemVFri5extD/utJtbzZXW1Lr4OWuOz5kCRQfIc7NhFQrbW4+Ntu2Ze+DBSOVn1+as6u42mzLvXt6ifsaReUJfMPSvMx5RwyyWYeFBYmDzIjYpB2zkUREyOQq780w816uiIEU7kmIfFyA8GdSrBQLb0olPAS1jHwtyMwWbm0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=ELQqro3G; arc=fail smtp.client-ip=40.107.162.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="ELQqro3G"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YPiWJiQxUAM1n8VFEkLPqUpSRdtyIrqsSVUYHodPdeS7UHhRqK+21OIcULR+Aznz96OoliuzjWCjza/a3u8WOHfWUO6TE+CW6fUFwoa1RrIownUAD2We0tXlDEksDn2Y4A9fX9uyFi3g4WrGBpeyXi+QQD1Y1enUh6dODitnUrOOzqmMgLJdjr7A+GMvlIcRk9wOo7dI0wBwuVj0HwfD/8otNa+qxhrZUxWNNNC3UA5MocxlADtEXbs9BaK1qRGbsy/JfUl8JGPrgjw3z6ejswOteF8hvzfBi4tDFUPCythapHsDK240wQIePVhk9Z7Qh8K603wljdjFQq3Zesz23Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nmm6CXq/mUWEf+DXT9H9scV/KMyl4opnZvpDuoz+kJw=;
 b=ozL4XHl4ZReqc75idKbwQbKCSyQUX2czFvhGgJTmquY2tmVQPm4Yb6LA4EPn/vVIY6qbXF+Dq3IUyrpDKmehogIVzbISWBbe7zmOccZpy8oeZzX2BOmuNsEW+l2zFqIUritR+MH86BBmDJiTUjvxW7myc1mZ6vUp2TLsjXMbE2hG075Xxn76a+d7yhyChByld2PfhogPwOp3G7VeEmVAquDuHUtFXH2zu1LdWHEJkMXm6MtJYjqTHyAMnuZi/clq5y+SmL1jZnVg03IognQKI6rr0dBuqGflmHJz9SWsusQ+3PD3WMflWON14nX7l4jj+AqPZAs/oav/o/iSe3mmkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nmm6CXq/mUWEf+DXT9H9scV/KMyl4opnZvpDuoz+kJw=;
 b=ELQqro3GC9ptTOPiSM2orXoOokkUyEcPXL6ELZI3kAWBXx1vdKMTs2CljxV0gHv+d9+nY3QjASJpBW7hEx2jeHoEwqktaa7RWpKC9ReWg5T35MdpVT/9nOwwDfo1L5/bky9YDq6u+UOp4RVamOSdODjmYdqNWMNXOEdF56i5drz3AwxXETyeoBAnuVJF9Vnx6TOmK9aIrD7cVfCDlstPNkrQ7mW0Zqhrtbh13wuFv+vqMeDIfFqTMOkgKop8LSp+8we/VQC32xd4X93ocuB03ankec4Ybss7qwShD+srSpBcvIBUBdTM8FlyBPw5SLEXRjiMRyZh8V1crKAK24BO2A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com (2603:10a6:10:2cf::20)
 by DB9PR04MB8429.eurprd04.prod.outlook.com (2603:10a6:10:242::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.15; Fri, 28 Nov
 2025 03:14:44 +0000
Received: from DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197]) by DB9PR04MB8461.eurprd04.prod.outlook.com
 ([fe80::b1b9:faa9:901b:c197%4]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 03:14:44 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 28 Nov 2025 11:14:13 +0800
Subject: [PATCH v6 4/6] clk: Add KUnit tests for assigned-clock-sscs
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251128-clk-ssc-v6-2-v6-4-cfafdb5d6811@nxp.com>
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
X-MS-Office365-Filtering-Correlation-Id: 2e234c48-7f1f-485a-c62b-08de2e2c4747
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|7416014|1800799024|19092799006|366016|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UnNHUUJvUkZPb1NSNzJiY2dNS3R1SDVGL2JQOG14VVBLTUI3K0RZNFlmUUNz?=
 =?utf-8?B?WHcrSUdFTVMxcU9YRWNwN0xIUmFHWkJZcG5CWW9TVDBGYjRYSGRERFdZYkhm?=
 =?utf-8?B?Nm5SekVvZ2drOXYvQTNwejhYY1hwbTZLVFV5azRNS0VrcG1XNlAvZUV6VC8r?=
 =?utf-8?B?YlA5MzNVdDAzQmR3cW9lTnh5SEU3dTVOa2x3YlVWcHRmMDE1QitsRlQ5bGVj?=
 =?utf-8?B?bURTZVhNVlBXRWdBZFY4MTh2TUlvaHVZZDkxVFpnZ2VrNXlMcElFNU82ZlhB?=
 =?utf-8?B?V2lSTEgxTmxHUUQwa0xIRXQyalVheVNlUEdKWWVKM3dtVzM2MmQ1Q2t3L1Fm?=
 =?utf-8?B?V0ducXUwQmE0cnhPclF3RDdmL1E5QlBkZitxS3lFUzdNVk8zaHdtZ0lVYmsr?=
 =?utf-8?B?czNQTXNnVHhZRmxDQ0VGelRSZHBSWklWQ3Z0cU1WOEowclRSRGdHb1c1UE1u?=
 =?utf-8?B?eVVkQ0FrYnRoZGFWekk5YmdaRWNrMDl6Yi9mQkNkT3lBeWxPY3UraGpIODFo?=
 =?utf-8?B?SmRYd3ZVN092SDBNYnlaVkxNUVI5QnhOeEJwRVZ5YzltdlF5NTFoYUVJV2lB?=
 =?utf-8?B?cTB0T1JQaDlYR2c4QnZ1RXZjaXdFZVN4QU9udUltcWFUNUY0emFnbzNCUE8r?=
 =?utf-8?B?VHQ2bldDYlRUSVMzN0k2a2Y2UDc4bVl4Qk5LaXRqMC9HNCs3RkJOVk5pN1Vs?=
 =?utf-8?B?a0hLNVBRcmpUeGEyZHY2QkRPc3RXSXRZUUdlZ1hnNkEzY01ENlhBMHl6R2l2?=
 =?utf-8?B?TUt2SHJmWDBYaXovNWdOK2lNU0lQekJRRTlOem81ZnZkVFFWd2M2TUg3eHJw?=
 =?utf-8?B?ZlR5c3lSQWxqSURPMHZjVXpDREdJU1hyc1g3NDBwTHc1alJiWU1FczYxMWlN?=
 =?utf-8?B?ajlCWW0ydldMd1F3SzJ6Yng4MGRYdGZkU201TzN6bjYxOUpQKzljREMxcnZI?=
 =?utf-8?B?eDlBRDdYek0xRk4zQjNQMXFZSDdMa0xJM2o5ckYzQUVMdWhtTXZWRll0Zk1h?=
 =?utf-8?B?ZWFYNWpZc25nY2NMSEZ3NWd2U2gvRGJMVEdZakNsWkNyMnJzdlVob3AwaU1t?=
 =?utf-8?B?cVBzNUw1S1llZ3UySDcxendEbS9zSDlDMUwrV2x4VWJRS3ludFNtUFRsd2sz?=
 =?utf-8?B?V2plaHlzbHZOcEx0N0xRSEsyMjZmMVQwNkJOZEE2VjZnU1V4MVRZMURCbUZM?=
 =?utf-8?B?dkdFeEIrVFNPVW04eTgvZGpBb3JOWElpanQ4UjZrWVNVL1pYVkJkcWtVcTln?=
 =?utf-8?B?TGU2WnN0cjVZRjl4Z0FQUWVVR0M1bGc2SHFLZkxESnpsSTR0QUlEOTllVnFK?=
 =?utf-8?B?TkN2ZmlIVG5mcmJya09nWFJ1UU5ockx3Vnd4dXJidVVVUlRVUFVHY3hFK2c2?=
 =?utf-8?B?S3NyUGFXSDl5WkVXM21aQm9aRldIU3U2b0Q0QmpESUxhVDlSOS9BcmpYL0ZJ?=
 =?utf-8?B?bmErY1d2bXlkTnpaRVFtWGhteHVZQ3MzU2RQRHQraHVrd1BWUElyVkErN1RY?=
 =?utf-8?B?M08vZGpmK1NFS0hDanIxeHpoRFlHTzZ4NitnYWRyeEtPMS9VUlJyZUhGc0RY?=
 =?utf-8?B?amcrMk1hdnBvZDJHQTFlZ0t4dWhiUEdUOXJ1SURBbCtGK1FPZzFYZEF4ZkVu?=
 =?utf-8?B?TTdxRkxGVXlicExQUzl1TUQ4TFhWY016TWV2ZzhKZWpWY0szYTFZWllpc3RD?=
 =?utf-8?B?cldCbmpFQlhuQlFjMXhMWlM3WXIzcHplS3VZWE9oSXZpaFp5MU5FSVlRWE9U?=
 =?utf-8?B?ZE04TEFCR0RTWlJhRStHdkRuZWV5YTJ4c2xYMHA1MlpzeUF6eTltODRHVVNi?=
 =?utf-8?B?NjNzaFI2cG0wN3VrVFRrMjB3clZNQVQwMnRMT29qaDZPTThUUDlVZDJxZGwy?=
 =?utf-8?B?MUQ4bUNWRWkxdkh1cDc2Q3RSQ0dQeUNyRzJkMnJNVGV0d2VBdHRVeFhsMlBu?=
 =?utf-8?B?MDBoVUFXd3FuV1BTQXdHRWFsUHorbWcyaWI1d0dOVTNNRThud1BrMlE2NWNL?=
 =?utf-8?B?ekZ1WExMRnJMRng0RGhobzdiNFZCakVScUc1K3V2dytoamVkWGxNYjV3NVp3?=
 =?utf-8?Q?ikS1Qu?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB9PR04MB8461.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(7416014)(1800799024)(19092799006)(366016)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bForVzNUdkJPa251ZzloQmFaYnZJdWlMVWZ2SHVrMUIrT0dxOWFKdXBuUWpl?=
 =?utf-8?B?bmhBVEV5M2IvSzA4MXBpYk14enloTWF1K1J1Qis3dFIwbGdJdkRRY1lXdjRB?=
 =?utf-8?B?S3Y1OXgybDN1K0tUNTlKckVLVVBFT0FvWis0SXdkdkdoWUdiaEZXOTRweVRx?=
 =?utf-8?B?TDZXbFdyQzU5c0ZkQW9zTyswUGJsN29MNGo4dXpDc1l2QWxaWFYySkFoK0o0?=
 =?utf-8?B?MWdhcDFEanRiNWxhUW9YQS9qenNzUmd4VElDcUlhTE9VaUl3VUxzb0RtOFQ3?=
 =?utf-8?B?M21uWnp6VGlhQS84bEpDYXc2aWNXZ0lZQmtwMWhDd290T3ZheGFZYXNoNW1X?=
 =?utf-8?B?d2hyV29HbmQyVUtEZjNPbGloTzhYdi9obHZsVk9YMWZ0Ni9kR2tscEJSUWR4?=
 =?utf-8?B?ZTBtSjg5M2J4a3NHUmhEZ3lxcjlNRkc2VWQya0c1SDVwb2F2NmpyMDY4ZjJa?=
 =?utf-8?B?WjJETi83MjhKVHlYZ3UwRHM0aG1LaEFXUWFTalBQK2F2dmdrKzkxbWc0Vms4?=
 =?utf-8?B?WjZlS3hEMWxsbmN0L0tZZGlMVVBjZEtta3VjR0kyd0JwS1lnbmZ1dEhzRHpk?=
 =?utf-8?B?bkFSN0JRb0Nna0xmSjFrZFRWYnJnWUdHL0NMNHZZSm13Vm5HYXg1NjlZSEsx?=
 =?utf-8?B?Rm5Nd05wcVprM1FZOTlFZ3N4V0JhTEx6cVNLVlhmWHk5c1pkbVdBZml0RDYv?=
 =?utf-8?B?ZnRRcWVqd0xwRFRpSlR4UlJLNFoyaW1xOTRpSnJpMk1RNTFRNE05dGZpbkVj?=
 =?utf-8?B?RmxxdVRVcGZzWkM2U2NNcm12Nm1KdUY3MHBjY3pQSERjUnJqbzBjR25VeVl1?=
 =?utf-8?B?YkgyZGZJQ2JkYlFNdjBtZmFwOTZ6cnZKNHFwdnlFWkl3S0V4VzMyY2hlQlc4?=
 =?utf-8?B?Y1o5cHRjd3V1bkNWSWRraTBnektJclJycWZ4cVVmYTNNWGxWdDF3SEpuYUpR?=
 =?utf-8?B?QTdNR0RXU1d1Z0tiSStQd3g4a0lIT2U0VWhUSUtLQVcrSWUvRGpjeFRhbElM?=
 =?utf-8?B?Q0FMd3NkbHQ5c0Z1ck93TVdGM0FDM0hWL3o1RDlvYmRNNzhyRVJIVUszbG4z?=
 =?utf-8?B?VDhXTmFGU0RaRXhtZXNEcHN6ME93WDV6eUlsYjZhZVp3eU9xVE9pRkxvdlV3?=
 =?utf-8?B?Y041Y3Rrck9vUVVrcUt3VFJ3dXNrTEZLUWRTSENjSEdheXEvVlI3dWw2L0Fl?=
 =?utf-8?B?VEorSkNiMGtnNDUvaVhMeDlvNmI4UWdhYWs1L0lrRndjTzd5bWNQNFpibDY0?=
 =?utf-8?B?eXRYNHBhUENyRlBTS0ZyMzNkMi9yZGNYSjZRTnVMVG5DODZpK1N3dTNLYk9X?=
 =?utf-8?B?SGoxOSs5b29hVDlUc0VDWEVqVW14NmRBOEtGb3hBUTUwQkFUTjRhczJyWHh0?=
 =?utf-8?B?QVVKQWh1MGNBeGRiZ2IyQng0QmVMaGFXeEhZd0EwNjdNbzJ1OHJpWXl3TzUr?=
 =?utf-8?B?L1lkMENVR1d1MGZTZ3dXdDdlSUVqbCtUT1R5RzlKSVJuUE9yMG5YWDZPK3c0?=
 =?utf-8?B?TFB6eC9RQkdxcFVobVMvelQ5VUdmLzgyaHBJYjBhdkdIeUxCdjlGRVFwU0Zn?=
 =?utf-8?B?OFFCWXZaZDlaQXo3bjBGREszdGFYenJaWVVMcnp0MjMzdUZXdjRXcjlrRDZo?=
 =?utf-8?B?RURFUWtHSzIxMmtMaWxOM212bC81Y2Z6WWZiWEZ1U1VZRFhEU2h4QWQ4WlM3?=
 =?utf-8?B?b2libk1BMCsvZU9YZ2Z0TFBsRitiRjJFaDkzTnhZL2NQQno1a09HRGFlZUlz?=
 =?utf-8?B?WmwwSEpHcW9qY1d4empkZ2pna2tRVG9DUzNSQkNRMnhudDlPL29QNWpUbFE3?=
 =?utf-8?B?cU0vZ0RNZTZCcWhod1VTUGNKY09aMTA4OG05bDFJV1lTcWdUSTlGdFFEQTlx?=
 =?utf-8?B?YWlJOUN6ZHAvbkgvS0VoYVpjNjkvcTNzditRanZFMjU3QzY3UEEwN1RlbU1W?=
 =?utf-8?B?aWVCU3JOWU11d2UyYlZCVkRxbkpnSEdlY0dSUUVuSnl4d2s0aG42ZVpQdytX?=
 =?utf-8?B?bnlld3RXUGJBeHlzdjFjNVZCdzR2b29rejJGUisveXpMOGV1TFpJUlNqUTQ5?=
 =?utf-8?B?emp2ampXUmZZYlFXSG9iL3kzM2JvUGtxbERWZzFRRk4xalloSUtxcnFiUkNj?=
 =?utf-8?Q?oUlJR5m4fvEvbX0ZN2lJJH4yv?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e234c48-7f1f-485a-c62b-08de2e2c4747
X-MS-Exchange-CrossTenant-AuthSource: DB9PR04MB8461.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 03:14:44.3936
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4Ry5Dm0yG1nBbu+FIuqBu0HZVvdZhEsSzg+02ejwtix1KZQ2h9ZiK28obDAy9/khxTm7XyimV1LyrtqjENcGAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB9PR04MB8429

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
index b74a1767ca2787a978db36b0055ea34cb909310e..9e8c989b24be0f7cfdf2325c9b19d05e9d2a8eb9 100644
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

