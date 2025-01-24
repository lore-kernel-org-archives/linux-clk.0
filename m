Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2078.outbound.protection.outlook.com [40.107.22.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 986F238F80;
	Fri, 24 Jan 2025 13:19:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737724763; cv=fail; b=M5uohF8MzO36u2lxtX7w2rglnClnjcf3guoiS/748IQ5H2lOEnAY6TGctxxyL8s5xc9JDa12TkBvGOZLlwQvPSrB6jKkjeDQT5xWnUbtMDVVR0F5Ecd5Cl5D97FAkb6KmaZN8iCU8h5bsj+rqBHa793wyXj1U2zEmSWSneUYB04=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737724763; c=relaxed/simple;
	bh=5PmrfD3iB17GCQxQOc5IqgHcacpOktEdKneAv7N4q7A=;
	h=From:Date:Subject:Content-Type:Message-Id:References:In-Reply-To:
	 To:Cc:MIME-Version; b=G5xRrRaoZf8x8ycrO7RhKGINfQuC86pDy79Tf/KKC8842jaj/OvNraY3lH1kBuobLv//r1H7rVdsTOAqxq3FBv1vlgsroqdD1qMjlAgpXW2mcrlqj+md3vHe277XMmw7atUqudCjPWsPLgojvMphbxJnd8uW2cYgvORpRTNNEoo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=G6uHiSBM; arc=fail smtp.client-ip=40.107.22.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="G6uHiSBM"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=opA61YvZI1pHtfrBZcxjpxvYB08DzCqc1nP8TqeBzz1hCE+oHVjCAv3HIgWG27ORbuSHhuS/GB2qvJ/FLbrBAK9/5eXdtenbsWVbo1GyKxuAKT06IbW1xXirb5NQKwADZFpa6TRcGcGJ6sA5sIJjKL2PkGImQuJ+I1B9HJi61yR4V1OGn/qX5UbAV0fftgOBFe8NOFB//n0wfEVnsPsH3DXmPI7bn0AhC6zA2JJN3IZf9eIpF1HY5RH0JOh1Q1sGWe32KHy84UzMyF5zTip/VhFt9m0Tr/0y4FlwFYE3TL73CiOXR6tJ/L2T8Rg0dcP5Br6VJ50yCyFyRtIHX/VNlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CnKZ8Mho43YDUCJkElKu7eTrlsMJP2Pw5ApKgJX2Kkg=;
 b=lhcq1ZuC/3NnnZFKxjkkiYBTzhqA2A4d7S+zEM29msy4n/Yk7NlaVHB0TRTmp5ueXZ1UGekdoxK3uP5TdsGfA/QVZyuYehKUCrGNdBOt2YkVdj/dPvdWiJni8XD9sh1/bg3p7Q1QeAZUp2VDCDSqdvxsnN2ycN0VzMWvkeKBT5TaMHK79iKFZoEftRCFmdxuZcUvLXtcQFSpBRcfUfwROStTz4RZv+OHk8nrpIwBl+p8UiiBPhn0L47wzadj+h3RdHaREQ8Cmk1/meR7jej0IXifCFklNIO6M59+U/1WxyY36H3t/flawxM/Nv1oACEnvx+WZ6OAEGVm9TCfJ+S30g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CnKZ8Mho43YDUCJkElKu7eTrlsMJP2Pw5ApKgJX2Kkg=;
 b=G6uHiSBMD+OUBGAmbyvUJrV7rffZm424EoPHhjqu0FZLEAMuFr+u0d69o6r3glyj+QnlGKGBqtA3+wtw4HmeWJoGba5vUKfP9HUNBNV8pJaq+XzhIcSoMEowN5S+uCPhMisk1aBS81ma2+vKeJPklz14S+IdtF/+KjsqIthJmblkV31YMaOoSwyn3XNp1Y4sd2btztMf+cNqFe+w4b1sKPWZPyP0vFmCaHcVW6Gv9QZ+9QC/g3qghPtj+QSykpQ+55ah0zwUT2p7ng5+W29BNrSpizV7sv3B7RIn8GBzPZSMchuEDq8rdddmxXZq1JgvQd9ztoj7lCg0VIRl3nf65A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAWPR04MB10007.eurprd04.prod.outlook.com (2603:10a6:102:387::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.18; Fri, 24 Jan
 2025 13:19:19 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8377.009; Fri, 24 Jan 2025
 13:19:19 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Fri, 24 Jan 2025 22:25:19 +0800
Subject: [PATCH 3/3] clk: scmi: Support spread spectrum
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250124-clk-ssc-v1-3-2d39f6baf2af@nxp.com>
References: <20250124-clk-ssc-v1-0-2d39f6baf2af@nxp.com>
In-Reply-To: <20250124-clk-ssc-v1-0-2d39f6baf2af@nxp.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Russell King <linux@armlinux.org.uk>, 
 Sudeep Holla <sudeep.holla@arm.com>, 
 Cristian Marussi <cristian.marussi@arm.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 arm-scmi@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>, 
 Dario Binacchi <dario.binacchi@amarulasolutions.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: SG2PR02CA0127.apcprd02.prod.outlook.com
 (2603:1096:4:188::7) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAWPR04MB10007:EE_
X-MS-Office365-Filtering-Correlation-Id: 507e0d44-98b4-47e7-a067-08dd3c79b583
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|7416014|366016|52116014|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NXNmQXc3ZW5BZVYvTnJFV2lwaUpGbHFnQ2gyNFp1SE14QWswQ2FwMjk2YkZE?=
 =?utf-8?B?SkxzTlhCU3ViaU9FRVo5VkQ4NUsvQmk2ZHZwT3Juc1U1NmVmQklPRWlQMnhO?=
 =?utf-8?B?QktNYzQzaWUwK1U0SkVjbTQyekl1TkM4RVdwa1V5ZVo2dkVuVWRVSVpHdjc5?=
 =?utf-8?B?UHlGMGVwS1NCdWFtTWlhakVMdjVQa05XbFhKL0JNLzdXYlc2MjZSalZhejN4?=
 =?utf-8?B?bmFMekdLUENoQXFhZWd0T0xYL1IxUlExVXNTT0pERnN1TTBrWDVZOS9FK2JI?=
 =?utf-8?B?U1JnTzFOY0NDUkdlcnArbjY5d3RGR2cwWHJTUVlDcVJiWXhiTEQwU1AzSFg5?=
 =?utf-8?B?T0hLeDZISlRaVXUrcEtDTDFmbjlDalVxR1lwV3FTQWdvMHl0Ym9yYnMvREw3?=
 =?utf-8?B?Qk10Z3EvcWRPWkY0VWZ1VEhUdHBYWVc1TENyenFtazlHck1rSlY2MUlyZmZE?=
 =?utf-8?B?YWozMVo1SSthZW0waytzbzRkRDZSay9QY2FEbnIvUVgvTzNOS0JLQi8vSmJo?=
 =?utf-8?B?MUhuOHpkZDhFR0xkWUVXRDBvT2NGQnB2cjgxM094VmptSmxlNHZiQTloNVpH?=
 =?utf-8?B?c0U0aVh5UnREUWNKcWMyUlVvRTRVSDY2a3g3blNmUkhLNlRnbWRjYVNpZEpD?=
 =?utf-8?B?bkIrdjIzWjhLTTdrWTROY3NHQ1psVkdHRVd0KzgyNGZXanJMeTVUQmdDL2tP?=
 =?utf-8?B?azNoQTI0TVdrQ0NqQUc2Mlc4cllxcnN4SjRraXJyeFp3N0tldlUrbUZUZXpC?=
 =?utf-8?B?ZDE5UjEwb2dMRW9DdUpkSjJDS2c0ZWZMVXNGd3hLbGJlTkkvV3p6NzBxMEpm?=
 =?utf-8?B?U1hzQXgwVVlSaDNFUERZWisyM3ZIcmJlaTFFOWh0N2Y1VHVPMTF2cGVMcXU1?=
 =?utf-8?B?Wk5Dd1dpQU1Va2VmQmhubzdzWWorNEFHU3hrUWJSNEc2ZGVTSnd6c3Z6WEps?=
 =?utf-8?B?T1lpSnloTDBpemx5M3hBMGNXSGNiVnVkaVVzNTJzb0J6RlBNZFE1ODV1bDg5?=
 =?utf-8?B?Ulc0b2l6MXdkTGpyUDEyeUVIN1RickhIUklmSWtweGJYYTZvSy9XZzI5MmVp?=
 =?utf-8?B?MDNFb2pITS9zTGc4aGNLR1JNN1p4VU9sWXJuaVFpUUQ4N2puZXgrQ0dYZXZX?=
 =?utf-8?B?bmZDaHZja3JQVndnbHg2MjJvOHNuV1FUV2k5N0NHSm1yMzRNQW1LRUxRaFpD?=
 =?utf-8?B?OE83NkNXZWdnSEdFWGVYRnZBSHNsaERYQ2txY05QWlBFMGtoT0VPZFpWbjhD?=
 =?utf-8?B?bXBTSkNjaldDV3BRRjlkbGRCYmIvaDQ5bzZiUTZVZERvRDMzM3pWV2RGSy9j?=
 =?utf-8?B?UzFpV2g2Yi93cjRnaS8raTdOdEllaVRsbUZhR2h2ck0xNjNpeVc2eXlIWHNF?=
 =?utf-8?B?azJuNk9jaFZNYzFyYmNzbDJzaDdvMTRlK1cyaVRPTWdaMXlIc0VzTzhaV3N5?=
 =?utf-8?B?aDFqeGxTOTIxdEJseVVmMUkzdW9qdDRkMXZzcU8rd1NxZEtvN3J0RGRmK1hv?=
 =?utf-8?B?N0g5NzNtZGdMN0tWMWk1S3hZU1ZrRjNNNDljazZIL09nUkVjRnFuaWNHaEdp?=
 =?utf-8?B?MWh0VHl0Z3Y1QmVsSHRBMjNjWGhkNGxWeDk2Q01LajZvLzY5MkVWTlpvbHQ4?=
 =?utf-8?B?KzJ4MVhDNnU4d1JGazdjTGd4bXlTZFFiazI5Y29McEdjcmlwVlJpU2FKcDBR?=
 =?utf-8?B?ZGhxQjVJY2ZyTVU1QUNSb1dmb3NWbm5BbDEyc3ZFM2pHb3l0djlMUmwybzJU?=
 =?utf-8?B?eGpGZXJEQjlickJCVGIzM2hGMVVVeVRxN2h3bnhGdFVvd3pnY2t2VkYvbWNr?=
 =?utf-8?B?ekRpdnQzNjhaSVJvTVRSU0ZQNlRJbUxMc2hDVjhBTFJrRjRDM2dGQzRLSlMy?=
 =?utf-8?B?d0xTd2VmcVE2dzg1OFlhTE5UZTU2b1RNSFV4eW4rWEErbjNVTU02OGFKbzJm?=
 =?utf-8?Q?luDK55yvjI8nCBAyHeHi3qVkf8lJ/6LQ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(7416014)(366016)(52116014)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MHljNU8vNFZuT3VrcVpSZjc1eWRxZnFrbHJVTk1MVlhwMlZrSGJrQXp5cytq?=
 =?utf-8?B?UjdOcldVQ0Y5YkxjZ0lYaEw2c3lwTmFGS0Y1SEU1UGZMcjFNOTZ0NitUVjBG?=
 =?utf-8?B?N3lmdmZhU29LM1J2SHVoSE5BKzBVcHFpTWV6MER2VEFXeTUrWERPTzNONzFq?=
 =?utf-8?B?Z0NyQ05aenl4S2E1TzRxOTI4b3N5ZFg2UjMyMFBVNU5RT2llSlNmRitvWnFu?=
 =?utf-8?B?SlRtYW5QaWFNVU8xbnM1UTJqbEhkNmlDZURtdlpNR0d1UkFMT3U4SEpuZ2J3?=
 =?utf-8?B?aEJSTjk3OTZibERoNy9iT2d6c2FPbFVrL3g0WG53US9kdzI3Y21qRHhlYjAz?=
 =?utf-8?B?alRvUFdnS01JYXMrTGVld2dQdXQ1M1RjYXhuQ3lxZWxYNnZ5NFQ5MHVxQnlv?=
 =?utf-8?B?RjlFeUxzSDR0eVVpb1RsNGhJZ21Id2RFalhTYXFCaG4xRzRMNDFNZEw0Zm9I?=
 =?utf-8?B?YTM0U0JQK0htYUtmVFFEeUJPSk94OTRBTzI2T05Pd00zTHNKYmhZRVFDOUN3?=
 =?utf-8?B?VE5YWlRxWE5nM0NxSm42VVZKUWJHMUoxNENsV3NQWDlvTHhlVDkwTkdqYXlK?=
 =?utf-8?B?VDd4N3dianZCYW1meTJ3b0NDNDloNG54aFdKcEt4L1pubU1aWWRpcElDQ2hs?=
 =?utf-8?B?aysvUEE1NjNhZE5rby9GZmJIRDkwOCtoM1ByQ2x0THRXSHVYNFdGVUQ4L1JO?=
 =?utf-8?B?M256QjgzM1UxeFJxYk4xQUNqc3FIN2tSSnhyRUhiSTR5Sk4rUU4yMDZxYTk2?=
 =?utf-8?B?eVNGd09FTEY4eXRVd3pMQWRzOU4wdnhWeXkzVG56TkJpeHMvRDZESTk4TkxT?=
 =?utf-8?B?Rm5YZ08vVXFacXlyNmRNemwyWGViUEExZVFvTmJzMm9KaEZRTmUrcWZ5T245?=
 =?utf-8?B?SEFtYm5IZ1ZGV2k5NjB1aGlnOWQySTlrL21obGJSZU9LSkNmelR6ZWFSYXBt?=
 =?utf-8?B?U3daNXF3RUErMUk5U0dHY2E0Ull1T3JLRnFiZk9QQmZwampqL2JtSVc0d2hv?=
 =?utf-8?B?NXYyV0hQMXZCME9sMm1pMnZQdzhrbFFyeTQwMlB6RVNwTGFqUUxTUHNmQWcv?=
 =?utf-8?B?cEhIaFMyN0NpaXV0NnprbjE4M2ZQWHlzU0dVazI3cXByZkdQbzE5akhKT1Zl?=
 =?utf-8?B?bGZSdVBFVzFsc0JmczlLVHo4ckpVUlRYNy8zc3RUanhVbEo4U01mbXp5MENS?=
 =?utf-8?B?WEVveDFIbUVKamsySDBmTDhidUJTOExJWmR1Y0xiMzNBRkxsbyt6c2V0TS90?=
 =?utf-8?B?RlBDUGc1bEt2eUx2d3NUQUVYLy9lMEFQbVNQTWJxVU56clorR08rUzFXUFBy?=
 =?utf-8?B?TXBIY3BtR21oZzYrL2VNL3dPUE91bkxUc016UkxKYkhOT2srWXc0MW5sYWZL?=
 =?utf-8?B?ZmdzSEVCWlZ1dEdnV3YzTlhBU2hsdUdzQjl3bW5uYkxQdWljM2xRbms2YzJi?=
 =?utf-8?B?U2t4blBwNHhFMHBGVGpvdTN2NzF6cERGZmZvYkhTZEl5aWg5Q05kd1NWRXNl?=
 =?utf-8?B?TG5TZHBXbFNKNFRES0VWdFh1SHoyeVhUZzVxU3RsR0pxNkMzK2ZvT0F0Tlpa?=
 =?utf-8?B?SkRSdytRbG4wc210S3AyQUpaQkFlb0Q4L0xDMVcveFVrdFk5dGNLT0UyRjJq?=
 =?utf-8?B?WDhHdnNUUzZueEg5MXF3REk5YUJWRWZyT2ppRHNNb01jdStDd1AvK1F5aVZB?=
 =?utf-8?B?eGVrRFNOUUlpdWdqWCtjeGM2QzJQOUpnV24rV1FscWNuN24yNllsZ3U3NzNV?=
 =?utf-8?B?MFVXd1pubU9BaUVFaGlSRmw5WE1MZXQzcmNlbCtJdE1pbjkyNHdXa2x6RjBt?=
 =?utf-8?B?TnBHL2VzQkJjRFk3Q1h5elBwazNraSt2c2M1c0JHaGdjUW1KeEdzR05NRFJM?=
 =?utf-8?B?MGZpVC9vU0FGK1N4UDRTSVB1UFVWT2oyYzQydC82ZEdrZTVqNVZPa1B6a1VP?=
 =?utf-8?B?aG5PbFZqSy90a3dxNXIrM2Jjc1Q1YUQ0SEcvbm9xcGFET3k3d012TU52YzE1?=
 =?utf-8?B?UUQzaGFQaXZocVFXeG1URTFpdUNqenFqMEJYUFdKenhFbnlNMlZ1THY1cXVN?=
 =?utf-8?B?NGRYWGVyTHVaV2RhZVR0NlZhOVRoR1BjdHNwdDE1b1dwekduT2lyQitOSjVT?=
 =?utf-8?Q?3ExyAIGDbGQJhrn+AfT/1mYdd?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 507e0d44-98b4-47e7-a067-08dd3c79b583
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 13:19:19.1751
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: s9Ts1lxfmfpt5eDuUMuybtPNobJybquBhF+OVMWcuQoZn8C0MhDDyq7vHP+QqtMSyykAHdZF6A0sIjjEV+7toA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB10007

From: Peng Fan <peng.fan@nxp.com>

Support Spread Spectrum for i.MX95 with adding
scmi_clk_set_spread_spectrum_imx

Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
 drivers/clk/clk-scmi.c        | 37 +++++++++++++++++++++++++++++++++++++
 include/linux/scmi_protocol.h |  5 +++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/clk/clk-scmi.c b/drivers/clk/clk-scmi.c
index 15510c2ff21c0335f5cb30677343bd4ef59c0738..e43902aea6bee3633f8328acddcf54eef907b640 100644
--- a/drivers/clk/clk-scmi.c
+++ b/drivers/clk/clk-scmi.c
@@ -98,6 +98,35 @@ static int scmi_clk_set_parent(struct clk_hw *hw, u8 parent_index)
 	return scmi_proto_clk_ops->parent_set(clk->ph, clk->id, parent_index);
 }
 
+static int scmi_clk_set_spread_spectrum_imx(struct clk_hw *hw,
+					    struct clk_spread_spectrum *clk_ss)
+{
+	struct scmi_clk *clk = to_scmi_clk(hw);
+	int ret;
+	u32 val;
+
+	/* SCMI OEM Duty Cycle is expressed as a percentage */
+	/*
+	 * extConfigValue[7:0]   - spread percentage (%)
+	 * extConfigValue[23:8]  - Modulation Frequency (KHz)
+	 * extConfigValue[24]    - Enable/Disable
+	 * extConfigValue[31:25] - Reserved
+	 */
+	val = FIELD_PREP(IMX_CLOCK_EXT_SS_PERCENTAGE_MASK, clk_ss->spreadpercent);
+	val |= FIELD_PREP(IMX_CLOCK_EXT_SS_MOD_FREQ_MASK, clk_ss->modfreq);
+	val |= IMX_CLOCK_EXT_SS_ENABLE_MASK;
+	ret = scmi_proto_clk_ops->config_oem_set(clk->ph, clk->id,
+						 SCMI_CLOCK_CFG_NXP_IMX_SSC,
+						 val, false);
+	if (ret)
+		dev_warn(clk->dev,
+			 "Failed to set spread spectrum(%u,%u,%u) for clock ID %d\n",
+			 clk_ss->modfreq, clk_ss->spreadpercent, clk_ss->method,
+			 clk->id);
+
+	return ret;
+}
+
 static u8 scmi_clk_get_parent(struct clk_hw *hw)
 {
 	struct scmi_clk *clk = to_scmi_clk(hw);
@@ -266,6 +295,11 @@ static int scmi_clk_ops_init(struct device *dev, struct scmi_clk *sclk,
  * Return: A pointer to the allocated and configured clk_ops on success,
  *	   or NULL on allocation failure.
  */
+static const char * const scmi_clk_ssc_allowlist[] = {
+	"fsl,imx95",
+	NULL
+};
+
 static const struct clk_ops *
 scmi_clk_ops_alloc(struct device *dev, unsigned long feats_key)
 {
@@ -316,6 +350,9 @@ scmi_clk_ops_alloc(struct device *dev, unsigned long feats_key)
 		ops->set_duty_cycle = scmi_clk_set_duty_cycle;
 	}
 
+	if (of_machine_compatible_match(scmi_clk_ssc_allowlist))
+		ops->set_spread_spectrum = scmi_clk_set_spread_spectrum_imx;
+
 	return ops;
 }
 
diff --git a/include/linux/scmi_protocol.h b/include/linux/scmi_protocol.h
index 688466a0e816247d24704f7ba109667a14226b67..7012d5efef00eb7b52f17d0f3d8d69f3d0063557 100644
--- a/include/linux/scmi_protocol.h
+++ b/include/linux/scmi_protocol.h
@@ -80,9 +80,14 @@ enum scmi_clock_oem_config {
 	SCMI_CLOCK_CFG_DUTY_CYCLE = 0x1,
 	SCMI_CLOCK_CFG_PHASE,
 	SCMI_CLOCK_CFG_OEM_START = 0x80,
+	SCMI_CLOCK_CFG_NXP_IMX_SSC = 0x80,
 	SCMI_CLOCK_CFG_OEM_END = 0xFF,
 };
 
+#define IMX_CLOCK_EXT_SS_PERCENTAGE_MASK	GENMASK(7, 0)
+#define IMX_CLOCK_EXT_SS_MOD_FREQ_MASK		GENMASK(23, 8)
+#define IMX_CLOCK_EXT_SS_ENABLE_MASK		BIT(24)
+
 /**
  * struct scmi_clk_proto_ops - represents the various operations provided
  *	by SCMI Clock Protocol

-- 
2.35.3

