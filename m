Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011067.outbound.protection.outlook.com [40.107.130.67])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B73535975;
	Mon, 22 Dec 2025 05:53:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.67
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766382790; cv=fail; b=GtK0kBZtEQlf2df1M+XMJySVdXCq2KkYmLTOZw5oSlObKTBAI5wpznwuAoS6sbL8/F3DbUuZuQTSP2PkcU4ixhAqdSCHVVkR5+t955mDEltGcin2BRtg3J84mfd36aoWbZocvj9dXJkMvUdhlt8MvZ3GBHjLqr2Ll/3u1uL5L/s=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766382790; c=relaxed/simple;
	bh=EebSwf0z40+G81Hta5AzK7qs1QZ2QfguUKgcCXKCsOQ=;
	h=From:Date:Subject:Content-Type:Message-Id:To:Cc:MIME-Version; b=G71U1zPt0i6DtQvZGERrMFw7Yhs4aYDC67Itrr/X3Co/O7FfSaNrYd4fySlh+Ba5O8D666YO3TJJgGR9Z1y500EZW3Bym6JXg320OEZvNrPAE0nkD/S50lp1hlm3Sc1hNwhnFIhje97XV5eGFfd69Bmv0VgQDVwEQpo2rDPP1iQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=SO1pP+fg; arc=fail smtp.client-ip=40.107.130.67
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="SO1pP+fg"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RqmAzUv/LpU1swUUYzK+eZcvzMES8VN6iaueamSoIyH/aCjjHPLjEIKGDpGB5ySAT6MQCABJNUTsZOx1q+D39HZS9ozaEaCF/W2gAF+HeypD7eqrYfI7WjineT74YTVwy+LI3zo/obu7N1oiW7BshgApMaw/viax7gqAxmENZSz6fk7JleKJ4gPjvNAjfPpfgus/FDhxYi1yotJuNA9/uTzGxvbKf6kJqeypl0OeQZX2AxB7sXKESqDDDn8SScC5B0Am+1xDKvWWTX8Alp0GrrFwpvfhkV/k5GSd5Ukeczaeq0FOjNh6ftH8U8WoH+I/HD63w2zb2XLt96ho4MiMAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aht5uvl66JO6ao28qJTwr8Box9+ch1HsDKpUUHcPi0w=;
 b=wlQ8q7cqBYCG629F9Z6utbZXsKLYECWPfDFJnhXyoSGOKXVNGKgypaNODomsv86RX4JGFzDP4lH5URwYcbsBtQuUD7BXNHJm3YEB/IfLGhvf45xRYIeP+jVGQDWDUv4n6AdVVnQSKvV2lwDnQNzek2NTj9ulZ916A37MjHcMpAeUVgdgU5L6f08O0SIAnIToyJmvMLep+GPLDknBecbT0wmOUk5Tk7EAehJw4uqfAsMxC/2u9VtePC+qoYaNnJ90xS9zbVSK0vEhOEmSqxuueT/vB0JmkW9QbM72Wzy10Cw92AvPPoSqmYO2iT8sWUNi6nU+HOBtH9j5wgdA9u3SxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aht5uvl66JO6ao28qJTwr8Box9+ch1HsDKpUUHcPi0w=;
 b=SO1pP+fgGdqB7f6IvFbCzkRW136FMnYehaQsUuGbzxDaZwitS7xhR1sdcBZwsA/jCveo/k/gdO+ECzgorGdEQE86NK3KTaUSBKRuKjhlwwNNo6jKWoZnZqop+vdtb5lHhX1D7F/BJmq1XUFvaYntNebyd9wJdoevG103GlvO9YF+HWOgjtSb3bwPNCZdriUqGnFh5+RIb8f+JVob7tbBwa0xotSRyE8TGjAaMN+XN3FlVyu9ccnlMyFu9IB5SfGgr0zHao0Wghe1vsJKs0XQJl/CLjD62A6xByVEZEPsiVmtvzPO5Gu7wyw/JW1elLPnAaVn1L38W5s+zzC3cTu3VA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by VI0PR04MB10391.eurprd04.prod.outlook.com (2603:10a6:800:236::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 05:53:02 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 05:53:00 +0000
From: "Peng Fan (OSS)" <peng.fan@oss.nxp.com>
Date: Mon, 22 Dec 2025 15:06:33 +0800
Subject: [PATCH v2] clk: Disable KUNIT_UML_PCI
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251222-clk-v2-v2-1-83e1a5ed8c7e@nxp.com>
X-B4-Tracking: v=1; b=H4sIAPjtSGkC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDI1NDIyMj3eScbN0yI10L0zRz42QLE0szs1QloOKCotS0zAqwQdGxtbUA9BR
 nw1gAAAA=
X-Change-ID: 20251222-clk-v2-85f73c84966e
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, 
 =?utf-8?q?Thomas_Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>, 
 David Gow <davidgow@google.com>, Johannes Berg <johannes@sipsolutions.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, Brian Masney <bmasney@redhat.com>
Cc: linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Peng Fan <peng.fan@nxp.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: SG2PR06CA0183.apcprd06.prod.outlook.com (2603:1096:4:1::15)
 To PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|VI0PR04MB10391:EE_
X-MS-Office365-Filtering-Correlation-Id: a97b682e-a453-4424-95e8-08de411e5d23
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|52116014|19092799006|366016|1800799024|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?V1BqQS9QdEs4SHdsajEvNVppZUVucHBMV21vRVlwZkk5SXh1Z0JxZWlGSE5F?=
 =?utf-8?B?YTRibDdyeW9BTVQwZytkQUJKOXJkWjJlM2dqT3pkcUorNTgyQmI4dVRhaHlK?=
 =?utf-8?B?YUpIekt0WWd4U1dKL3RMQ2RtWllxMnUwUGpKZ2Vja0d5emlGbkpqWldwUlBI?=
 =?utf-8?B?SzNhck5mSXIwMnJjSnlzNDUwM0RZMGFVUTdTZUxCVk8xWCtrVzhNWkZDdzcv?=
 =?utf-8?B?SlJtazY2NEtCUzEwaUtjQjU3K3c4M3oweEtQNllWQ2YwU0prdGtwcU9uaFFv?=
 =?utf-8?B?QmJ4V1lqdkxrODZSM284bGFPMUlRTjFJWjBFdkNWanEySjIyVXp2RUNLRWZ2?=
 =?utf-8?B?TnJFZnlkRGN1K3VGVEV3aFhtS21kTnN6SmtXcW1nUVlCdWh5Q0U2S2t6UGVx?=
 =?utf-8?B?WGNMeVZxSmNkbnJGTGtacW9TRVpZM21ndEN0WnIvSmV3MzJpZWlMN0VJUys4?=
 =?utf-8?B?VVV0RkRNUTl1czFPN2ZpOVQraFRlc1JiY1p4T1Q5dFVFTWIremNZb3ZUV0pH?=
 =?utf-8?B?STNqZzEyRVZiTjNlWUJqZ0l6bWdYMWdjOGhyVmtBSlRLNXgvQlI1THNhWUtp?=
 =?utf-8?B?K0RMdmJpZjU0UXdHY2d0RnhEZU5JUEV6ZW9LVmdTbG50WXFPRWJsUjlWUy8r?=
 =?utf-8?B?ZVhTME5ES2hGcHd4eTdtQnhteWxnQmNCRkhtcmFFMmpXWTFFN3pSbGtqTHB3?=
 =?utf-8?B?TXFBdHBnMVRZQmdPNG5nM3FXYUZmWStmQjlESG5FcmxiaGVudDkzUVJiVnBx?=
 =?utf-8?B?SWRtUEg3WnprUk9KazU5ajB0QVIyMnhtZjRSc0dZV2ltTjY5S1ZEbEZyY1No?=
 =?utf-8?B?K296THdWSk9GSG1EQ29vcGlwSUVlNnJKa0ZBaG5mYXpDbkplNVdRN3lZUDlk?=
 =?utf-8?B?Q1l3VzRSaUpMVGZXM3pnN0xhOGtZalJHNXQyWXlaalloMHgyZndjL0gwY0FC?=
 =?utf-8?B?UHdJWUZCSHhXdTI1N0ZDd0xOSWo3am5mdVNDTnRybU1YeE1IQkRkOHFEVDhn?=
 =?utf-8?B?cnlsTlNxZVlTZng3K1RVcUx4eEswMC80TTFxc29LYUhUd0pQbS84dEsvVlZU?=
 =?utf-8?B?eFdmTVgwbVl5V2ljTmUyTHI0Vm5hUm1jTDJlTWtlWTA2NVZSK252VG9pcjZU?=
 =?utf-8?B?YW1YQXJuTUtxdzFNVjV6ZU4xRVI2U1N4QllSeFJtVVQ5cENOTWdYbWVNaHBi?=
 =?utf-8?B?dTB0VW5nNFJpUDVJdHhxd0VWK2N1QTBmc0wyWHgyK1NRaWxWb0RsMThQcE5l?=
 =?utf-8?B?YkdSWkFDUzMrSnRFbzk4OXZOQzhYWGhqNnNucy9PYjlwQnJlaHVSWUJ2ZWc5?=
 =?utf-8?B?R1MwQUVZOU92cjluaVBGRGs5cHR6VGVudkwrOHcrc1ROcmR0Rlp1WlVLVUQ0?=
 =?utf-8?B?aDk3WFhyS1F4RmtwbmxVTEcyTUlIV2lyTndteDBkNE11MmJ2YUlHSHFwNVN2?=
 =?utf-8?B?bWRkZW1pQlNxUzBVbU5lSEdzVzh1dkp0WEVCTmlFY0krNDlHRitybW50WkVs?=
 =?utf-8?B?azVhc2NENEhrUmVLejZXNmhZL3dIU1pLa1pmb2FYNkdjbEVFQjFxaVpCVDV2?=
 =?utf-8?B?S055dDNia0xwaEJSUW9rNUczN2p0T0lOclJJWW9HYTNxNDI0a1RCRTd3SDB2?=
 =?utf-8?B?S0V2eTVpQ1ZyNW9FVWkraUFZcWszQlpjSGdNMHFLMnkza004aHo1NmpqVUl1?=
 =?utf-8?B?WUsyRjRJaHBQdndqTGJCNml2QXF2S0VTSEpWRlV5ME1VczVJc0ZQYVpJYklO?=
 =?utf-8?B?TkxDcDkvWUpFUHJOWlNFNVFCbkJheitaWE1MNU0rUmpWdHd0bmk3Ly9kMzdK?=
 =?utf-8?B?SnJaWC9UUE9LdGxjeVJUSG9MRGVnRkVZWGFQS013SU5vVnNTWERwaEpjWkxj?=
 =?utf-8?B?Wm1WT3ZMTWkzWXhrQmFaQnFxV3ZRY1FLeUpsNzFHeHZkSTNYYVhMU2hSZVNt?=
 =?utf-8?B?QnN3c2tLZEJDd3ZGTlVOSmZvNmdqZXdsVUNnVkNuam9VMXFONHJ6bjFBZ3ZT?=
 =?utf-8?B?MDZZdmtvUXBrRmxTYlF0eUdSdFJyNmFxVEIwc2RHem1waHJWOTVwTTBRSzcr?=
 =?utf-8?Q?L7nIHM?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(52116014)(19092799006)(366016)(1800799024)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cStwa04wWWNtaHh1U09tNHViTEp6STJtOFM3bEdINFFXYWM4a2wraDg5Z3JF?=
 =?utf-8?B?YXZoYmd0OXBYVFpXNnpHZDRxVXloTGRDVmE2dXlGaVF2VWo2ZS90Q3I2aHBH?=
 =?utf-8?B?R3FUWDBGSWp1Nng5NVMxT0hwWlF3c3dpalFVUkFyTjJZVkdFaE5HblpjQk9E?=
 =?utf-8?B?RWhXM2dTT1FTc3pISXo0RzJ0S1BmOFFXeTgrQUNqTEI4T2hrWFp1RnFLMDZN?=
 =?utf-8?B?N1ZmRjJBM1ZXdEFYTHBpdlVxRVlwa1g4V1RWbkZ5ZTdZTFFkVkRKdjZVNmVI?=
 =?utf-8?B?dG9Ja2JtekdYVXhteWVhRGRrUEF1cmxiT3pHdkFxQk9aZThuV0F5NUxWUklk?=
 =?utf-8?B?aXpJTTFUemdEVTJnU2p4bkQ4MW93T1ZvVnVKOWJaZDBiVEFvSTZxajQvU3Rh?=
 =?utf-8?B?Y1JkYnJ5emNhMjRBOWJRams3b0tYS01wY2VnQnlwa3pXUVlBQmV1R0FSYitr?=
 =?utf-8?B?VlJyQTdpM05qbWZuMlNYWUV6L3FKTFN6NVNndnA1c2N1a1pTVEcxWVA0UmZX?=
 =?utf-8?B?K3VGQ2I5V1lMbnUySlBPN0hFK3hRUmdmekY5eGltNWNyRGtuajBtdEY4Z1BE?=
 =?utf-8?B?Mk5raG9WRFFCNENZT1dsNWR1ZkI5cmc1WTJ6SFBTbEN1T0YxQVozejZzUDdn?=
 =?utf-8?B?QkR6cTlLM3FVMDR6ZjF6N29LMnM3ejFHWm9EL2xvL3VmS3FNUEF6cXBBcmc1?=
 =?utf-8?B?OW1ybUEvTkxSZ28zNWQweTg3QVZEK1pzVFIxL3ZpdXhRdFMzNUZVZ2R4MmtM?=
 =?utf-8?B?K2RFdHM1dVIyU2w0ZFpCUGl0OFdaQWVMOWZPSHBYeUxCeWNtbkk0S2JCL3lC?=
 =?utf-8?B?b204TlJGaFA1Y1dtaVpoY0x0MlZZUUJPMTJISGsyTmlHMStrK0QzYVBjL0lQ?=
 =?utf-8?B?SUNuK1M2azhhY2taclNldyszNGRkalFWQ1RIVk1ZNW0yV1JCNEp3TUdvUmRn?=
 =?utf-8?B?cCt6TUFMWFVMcFZ5cWRJcVlpcEFHRmEvSVRrQ2FRdE5pWmRBTy9KdmdNcm4r?=
 =?utf-8?B?Sit6SDdvbWJtejRrMHZQRW51bmtVOENZZnVFS1ljT3Y0c09tY0xLcE5HWWcv?=
 =?utf-8?B?ZWF4S1dYdHpWSHVBNEVIbHYxTW5od254elNQUWdjVWMrWmVOZjI2Rm9yZ2NS?=
 =?utf-8?B?V2RjRStGMVMvOTVSQVJHc3E4eXhtN1Z3ZURidmlucGRkZkduT203Z1dTN1A3?=
 =?utf-8?B?Y3hBUjlCVmZMYlcrZUFqUUswYjh1VUM2d2ppY3U0VEVwMThKdlg3cEttcDY3?=
 =?utf-8?B?WGNNaTdoaUlyNXFZM3I0NytrQzhIR3BOYjIvWHh1MThNNHZsbXhvR09EM0RJ?=
 =?utf-8?B?dlA1amtBY3UzcUZSdVJzT3IvajREY2dVajZDakNjK1MxUUxZL0JiTTNVS0tB?=
 =?utf-8?B?NWdubTByaXFob0lZZ3hqZUhxb0xIalFxb2VTc0hLejh5ZkhkS1FnQmdtYzB2?=
 =?utf-8?B?dHpTeXhQQ2U1d0g2eW51Nm9lZnVnVVZQM08vOHoxSmo3QXJReTFYc2h0N1Y3?=
 =?utf-8?B?MkhvTCt5OVNRZGhMeWcrWUd3Q2pXR0ZrL3FKNjFSWmx1cjNpaHVlUmExYVVo?=
 =?utf-8?B?ZDF2WDd0TlRIUlAvT3NXSDZBR1cxVE1oK3NlZnVBWEdGNDNsVDMwSzBwZ3pk?=
 =?utf-8?B?OXE5UzJEeVM2aVB6dGdOb2Y3S1FlZmRjUHFCOStvbjFBaDBxbjJtR2lveVhK?=
 =?utf-8?B?Nk1xdGxGQVE0SnBYUHozcG1BNVZrRnpQWDRVSVRUVFM5ZjNscUcvVmo0aklT?=
 =?utf-8?B?SThYWnppdW16eFpwdFdKTHJTSVkzZGxtMDhRMkMwZ2plOG9tNXhpVmtqeGFE?=
 =?utf-8?B?L3h5eXgzQzFobllrQ2xYUkRMSkRiMS9rU202VWQ3U2Z4MFNKRFVaUVE3MnJW?=
 =?utf-8?B?VkpPL0tZN0ZJaVkxUTdqQ1dsMWhVQSsxUzYwellMSlRLUUs4Q0x1ZTBnSGRy?=
 =?utf-8?B?ZmptMzl4Wmh5alVkRFlpUE9UcW9yNmVraHN6T3ZxWUZKYVgwZThNSWtaR2Vn?=
 =?utf-8?B?WUJWOVp4SXdCYWlOcXRQQ1ZaazZ4QmUxeFYzUG05VGdLeEdvNStqT04vdkRD?=
 =?utf-8?B?dFFBWEp4RU80aThYTzFpU1FrVkE5WDVNSDNrRSt3VTIwTW1UWDZCOFZqeHhE?=
 =?utf-8?B?RnBWa1RkVjhOclhGeldNVUFGVUgvZzhJTjNMUXNyVi93S0JqN2JqUC9ZbDBu?=
 =?utf-8?B?Y1ptdk13QUdmREF5cTRKRmgzQlZqMi9DaGZoOEsxNWRrR0l4YVhoRUUyclpU?=
 =?utf-8?B?WWJNdEV0QXFDNEdoS1BsVlkxaFBNemZ5UlpFMFVLWTlOTWRtNzdRMVJpZTZB?=
 =?utf-8?B?RmM1bmpKNVZtYzUzb21VZU1WVlh5cjVDazlmRG5OcVBxbGlVSkJ0QT09?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a97b682e-a453-4424-95e8-08de411e5d23
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Dec 2025 05:53:00.3047
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7+QITcaLlTETpTTKjXjaIj+/8j+ADjFrJX16LOFold1ngR3BBBeDQc+GpOWBgZ+8V73p8AXYkb0jJoVXL5nt6g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI0PR04MB10391

From: Peng Fan <peng.fan@nxp.com>

commit 031cdd3bc3f3 ("kunit: Enable PCI on UML without triggering WARN()")
enables KUNIT_UML_PCI, but clk driver could not work with it.
Deselect KUNIT_UML_PCI to avoid the failure. Dump as below:
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

Reviewed-by: Thomas Weißschuh <thomas.weissschuh@linutronix.de>
Signed-off-by: Peng Fan <peng.fan@nxp.com>
---
Changes in v2:
- Drop fixes tag
- Add R-b
- Remove "CONFIG_UML_PCI_OVER_VIRTIO=n"
---
 drivers/clk/.kunitconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/clk/.kunitconfig b/drivers/clk/.kunitconfig
index 08e26137f3d9..8a0ea41934a2 100644
--- a/drivers/clk/.kunitconfig
+++ b/drivers/clk/.kunitconfig
@@ -1,4 +1,5 @@
 CONFIG_KUNIT=y
+CONFIG_KUNIT_UML_PCI=n
 CONFIG_OF=y
 CONFIG_OF_OVERLAY=y
 CONFIG_COMMON_CLK=y
@@ -6,4 +7,3 @@ CONFIG_CLK_KUNIT_TEST=y
 CONFIG_CLK_FIXED_RATE_KUNIT_TEST=y
 CONFIG_CLK_GATE_KUNIT_TEST=y
 CONFIG_CLK_FD_KUNIT_TEST=y
-CONFIG_UML_PCI_OVER_VIRTIO=n

---
base-commit: cc3aa43b44bdb43dfbac0fcb51c56594a11338a8
change-id: 20251222-clk-v2-85f73c84966e

Best regards,
-- 
Peng Fan <peng.fan@nxp.com>

