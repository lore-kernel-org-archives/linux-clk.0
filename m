Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011066.outbound.protection.outlook.com [40.107.130.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67EF118A6AD;
	Fri, 12 Dec 2025 10:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.130.66
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765534045; cv=fail; b=ufLhYJew5cw0ibsA4nmQhPmltoMZoN71qimsphqn8tQ1j4b8aeP2V+Jf7FNy3/UzxTLL+Qbmm2/bYYqtkmkyMTieDfoYyhOQyCvPpefb+kM5FPlIce/hyZPw8mQy32yK03xfa0YNXwwBvyg/1Offde/V+n6HY1Fu9a4nc1FYy20=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765534045; c=relaxed/simple;
	bh=Djqbd2nWxiLfcciQnS7CYS+bMQIkM35Ggft//gJiAX4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=GYYXt9raWfv8PlP/wrhbu01foLFaXMBeIEIos5per9oUEEqY+w4rJOYGYadU3OtYavgfTaGyy6+7qoUBdaA9yrOSxBKD+yBRyDg2C4czKBoMLYe9nIXpytwiaucgLwcJWBW2oJyMNdnOSsKYBR/biz88tNP2cYPXwvN0cHmwqUs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=eCXvv1+Z; arc=fail smtp.client-ip=40.107.130.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="eCXvv1+Z"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lLTrKkQ7BTaJIJIhOzf6o96it5F3aWEBvneCSRzTy99bGgc1Tt/8Kw0siSuY7Qop1+cWZsHfCAxCdYorzDMNZE6tHf7Y9PwWBw6I/C8rg7IEZoE0bur7p/j8yAacFX0hWqTsCEm10bYGHA5IKp8TSVvXZpgrltxAl9JtTdJUfXRxQyJNSnaY3ig2ER/7FdyLz//aG0EsFJKiouVXrlBvw40LD69oOmoD26fJZq+SoJxqrhEgnLvvSuJFiybh6bnBuyDbeAOJcZwNWHKXTBlcwLKO1pce5dRGpR20zjIyDyXoMDPVAvXKBgwXVWroM3H7AK9jUiWfhJ/IY5dqTMoCYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OyYOtGQTD0eU/qgTBnQbAdbmm/216HAdRoN/g6jvsro=;
 b=GN+turRGRzyi71jk2q9j8e99LPbtxjqIfPz6K6cagjNWAeUg3QtZU5+yMHWWkh/Jjr4PfuGdYquRJvDxpOWSWMgFuirbxNLhNJpO1fEsierBdel0iUohSXd3l2tzgT8VnhwJpG2Igy9P+s19r6SOMJIWb3cxjud013O1c10lZjRskhbGhC9jYv/i2+WzT6AfxSXvA5WwNFNYoDnrJWhJdwCoXdn1rGRgRWMNm9BqcUMEN8gfWiAv+etucxFUHfsAuqxmmRhshuOeCuEIf3jx6Xa02fKHEBL6G7Ms85gnP1S7T7VYCLyv1CubERWx5Tl8wCuSFdT+eHiaNrhJ8ahk+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OyYOtGQTD0eU/qgTBnQbAdbmm/216HAdRoN/g6jvsro=;
 b=eCXvv1+ZYlAAngu9nqIJTQEQUUR8nFojAv7mZwMnca1CeIEZibfcCfZ2iSkfxmxldbvEQ7Oe69hTlVx6ckRLbv7wbCMmSggdBXZbECqZZ2PsTGV1yKV4z/J+kS9SN43ayyqN+jvSQC1GCn/tmv7Fz64SkiCzdOPwI1KImNsa0LnK8m9+vWWjuYfuip4LEC5OHcsS0YPUYc83C/rNs+6oKmL/kKEJyL3GM+vmG9Myq28CLNi/Fad4dnRsFhCt0coZP9bYuIaGbEG6mlSzFnMhvUccapzWln5B5hG3Y0tkxf70/QdLNYcIqAfuDbsn8uXlLGG1jzIKYvZ2n8Yu6GiQyg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by PAWPR04MB9958.eurprd04.prod.outlook.com (2603:10a6:102:380::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 10:07:19 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%4]) with mapi id 15.20.9388.003; Fri, 12 Dec 2025
 10:07:19 +0000
Date: Fri, 12 Dec 2025 18:08:25 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sudeep Holla <sudeep.holla@arm.com>,
	Cristian Marussi <cristian.marussi@arm.com>,
	Sebin Francis <sebin.francis@ti.com>,
	Brian Masney <bmasney@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
	devicetree@vger.kernel.org, arm-scmi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v6 0/6] clk: Support spread spectrum and use it in
 clk-scmi
Message-ID: <aTvpmQAPE6HfIy+r@shlinux89>
References: <20251128-clk-ssc-v6-2-v6-0-cfafdb5d6811@nxp.com>
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251128-clk-ssc-v6-2-v6-0-cfafdb5d6811@nxp.com>
X-ClientProxiedBy: SI2PR01CA0003.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::16) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|PAWPR04MB9958:EE_
X-MS-Office365-Filtering-Correlation-Id: 22d7edfb-c830-4ecd-845f-08de39663c2a
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|52116014|376014|7416014|366016|1800799024|19092799006|38350700014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?aUo4U1NjbDhHM25rRytJbHlrRE5ra05naWFBSXJUa3VlZ09lMSs4WDV5SDBh?=
 =?utf-8?B?bWVrbWp2MmRGdk9PeW1jcTZjZUdyUlFiSHNMdXNmbktmQ1Nmd1JYams1UFI1?=
 =?utf-8?B?OGRtTGYzLzF2YThtS0dwWCttbldyNGtkc2MzTE16WjhYYnFsaHM5RUd2SVNO?=
 =?utf-8?B?dlE5NzBqNkZvZFhCb0pJbFpJWkpqdi8xVWVDMnNieHdMeit4NUhUL3F5NjUy?=
 =?utf-8?B?R25XRDlNeEE3UlFLTlY4WDZGVUlzL3ZBVUtFSWNxT0NwaW5VN3FNbTFScTlX?=
 =?utf-8?B?WnNPN0toZE1qUXM5MnJSTUpIcmIraVFPT0Fka2FuMGdwcWZ2S25BUnE5WUtY?=
 =?utf-8?B?ZDRBZkZERk90TVJvdE90Yy9hZi9FNGNvS250bER2MkJHSUx4ZkZVR0NQL1VV?=
 =?utf-8?B?ZlUvaCs0Rnc2QUQ5Y20zK0hJZDJRVlVLejA0aWlqUEJ3dDRjQUhacmRwY0hp?=
 =?utf-8?B?SGpJRVNWdmpvR1VnaW9TSEZFampkb3VkYkxGRTJpaTVWbjhuRnJVd0JncERE?=
 =?utf-8?B?emJvZm5PSnVBbjN2OEJ4cUp3eTU4bzQ3OVhwME1BdDFqSWZoYVZwWFpzdm9Y?=
 =?utf-8?B?RDB0UFVjSXQ3L2U5cmlySmVLbkMwNC9kM1ZZS2NUVG0vNG9BZUZCZzJ2T05K?=
 =?utf-8?B?Z0U4d2tIWmFxa0xQS3A4aU9TT1dCdkhIcEtXY2Y5RWQza2EzTlNub1FHRG5r?=
 =?utf-8?B?YWJ5MkhaRnQ3ZmhlTjR4dHovMXpMSlRob0ljSStiZ1lUTzFMRjVYemRKUW5p?=
 =?utf-8?B?TDhLdEpib0s0Zm1rSXRQZXJZWUZoV1BGeU4vUXIxNFRnMzRZV3JhUFM2QjlC?=
 =?utf-8?B?K096ZkQ5ZDgyWkNNWmxqTW9MVVJ2YmhvNTZSb3Z6RjJrUmllNjhZZjFnYnQ4?=
 =?utf-8?B?L3B0c1U4TC80RUpxSEhoVm92b3d6N3EvbUQzRlFYZGkzTTdxVEN0NVZOeVV5?=
 =?utf-8?B?clVGcDJJU3JWWFlPeHJ5RkFJTkRTVjZqVnhZeTZSS3R4QlhiUWhWZlFiMWd2?=
 =?utf-8?B?SWgrZnNmd21kWG1VbEpHMHlWcVB1eFdLM2pOdzVlMkhSUzlRZFdOcjh3MFk0?=
 =?utf-8?B?OGlmRGdHanQxYmtPZ0IzQTV2dk1rbzYzTG4wWUsxbktmc1VzaVI2dzlKWEd2?=
 =?utf-8?B?RmtNK3l1cFNDYzlBNEphdlNzM242RFpEVGt1bXpYV0dlVHRaQitpcnR6OHRU?=
 =?utf-8?B?aWMvMTNUNndxZVFwL1pUQi9VRnZyUGg4cGNJRDBMM2lWcmhJZ1ZzODgzSUNC?=
 =?utf-8?B?WUcrQ0hsZ0JFcitDenVCVlFETnhNYzR3dUNBYVJCNjF6ajJmNmZtYVlXMEFB?=
 =?utf-8?B?RG1BNGJIQ0hVK05aVnBseVVVZS8yTCt4djIrdXdBSkg4T2JxZlBFdG9qZVA4?=
 =?utf-8?B?K2k5MEVjbEo5UWd4V0VEaVdXTXpkTi9SNkVwWlEyTE9SaDhKb1ArbWRnUkVk?=
 =?utf-8?B?d0d4SHRlSEE4cXBPZEthRjM1Yi9IZjBvWTlNaTBDRGNmYVQxeVh1OWFGZGht?=
 =?utf-8?B?N2xEdlp1NlNvb2EyVmM1U3JvSzVJMSttaXcrd2cvZXc4eUFKMmpWUU55eXV0?=
 =?utf-8?B?RnNOUW0wZDhuSlA2KzJQNjhFWXZZNGljaWFBQkV5djBUU051TmsvZ0M5RlN6?=
 =?utf-8?B?eW82V0RyMmJBR0tsaE1FemkxUU1WN2hUeWFtbVJJODdJT29wamdVODAzZlBQ?=
 =?utf-8?B?TkM4K3RNQ1ZoWlJVTllDRnY2bXdpY0xSdlFxZlZDd0VmdWs0L2ZnUms3OEpH?=
 =?utf-8?B?ZlRtWG9lV0pYOUpGODY1dWM0QjRQK3UwN0NiVjZQMnBtTkpobjk5bEpqNlJn?=
 =?utf-8?B?K0VXT1NJS2tTdnhpZWpld2J3U2xhbi9LZHVRaFJqbU9Sb3hGZE9DUFZWSmtu?=
 =?utf-8?B?Z3IzQjBmRUxqWnBxV0NiRGIyejFhSkFJMThrRm5hNE0zcVJrU09DK1c4YWN1?=
 =?utf-8?B?UjRlYUZSdCtFSDJlVkpEQUsra3MvNzcxSkQzTmtYZjAyQ1k1UjY4dDFxUTFG?=
 =?utf-8?B?dUphSDl5ZnJnPT0=?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(52116014)(376014)(7416014)(366016)(1800799024)(19092799006)(38350700014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?NU9XVjdmeG1GWjdoMVNyTWpHL1Z6TzNvc294dkFsUEpTS3laSHI1WFZBbHVp?=
 =?utf-8?B?VTdibzE1ZlFFZCtuR2JhcmhFTDB4SVZ1Q1loL3NkWHc4dnl4OWNXaHhFaTIv?=
 =?utf-8?B?K3hTZ2txY2xkQW9JZU5adDg0NTR6bFNsVVpPK0JKblRUK3AveUxLV0h6MUl1?=
 =?utf-8?B?c0pLMWh6Z2NDU25FM2dGSmpjQnpsN3VTV2xxZklRcEdzZEV0SXlzbTVHdmhD?=
 =?utf-8?B?RjF0LzRJM0NFNDF1dGphNGpxNjhWRzZiRHhIM3F4ME9WV2ZqZkpQUVdybW12?=
 =?utf-8?B?UUlWaDJvTFpjMkw5dWVTVENybUQ5U1VCVVRiZjQxdDMrZmVpdTNJV0FjL2Nw?=
 =?utf-8?B?K1QvVFlTcTlyVmdFOFF4Tk15RXdZb1ovMHN3Mk5PNmI2RWZ0TUlsT1hJSTF0?=
 =?utf-8?B?U0xVM3FoUS9UYkUwV01kN1VDRkVJMW82aWxKdnFhcGVISENKV1VER25wakl1?=
 =?utf-8?B?Y25sT2NVeFNCcVVtejlOcUZVMWxqMTFmNUhUYmFYR2RNQnZQdHVkQlZvZThN?=
 =?utf-8?B?ZTFoSDRmOTA1Wk0vRVZPVncxVTBBcmloVUY1YjUyTkZXbUZTeU1WY0FCeXJO?=
 =?utf-8?B?aWtSWnoxazZhRGZzcFJFcUJSRWVHL0J5Y2FxeVlkd0owWFV4K2lxMkJSRnIx?=
 =?utf-8?B?a3hCU3M4RFFkdVBJTVpmcVNlRHNzeVFoWGpCcGhNaDJ1MVlKZ0VSUHpvSW9v?=
 =?utf-8?B?SnJkYWdLWWhsLzJPYkMxZnVSNXV2Si8xemxoSnlJSmZyeHQ1NkM1RnU3U2N1?=
 =?utf-8?B?ejRaMVBsZUZIdVJIMmpCSTdJNUhRQk1BWnJqOEFMRUpxNnZXRXhKTkNjZXhI?=
 =?utf-8?B?M0hWZEdyQzNaenV1Q3haSDRveXRWVFc1WW9QZVFoUlBPKzlRYnB6KzVvajNR?=
 =?utf-8?B?bVdWUHlwQ3ZMMEczRDFva0JGWEtkZzYzVjdLU1prMUpDVUdNS2NwTnozdXBZ?=
 =?utf-8?B?NytKUmdEdDEzS1F6NHVvUkJib3R6NnBPa0RhWEVGd2dUZGxDUmRlYkdMdUI3?=
 =?utf-8?B?WWJJUjR1em5QUHhJZkFldFY0Uld0Y2kyQzdaK0xSMGZ1VERGaGgwWDNnK3Rv?=
 =?utf-8?B?bkc3TXVTMnlFS3I1VEMxOUNQQkF4eFFrQWZxKzkwM2gyMElnMmVBYXNKaHRU?=
 =?utf-8?B?NCtwWDlpbVFvc3Nxa2VFODgzWGdIUGZDeWcreTQwZExoZGpuNTE0bHdIY2U4?=
 =?utf-8?B?SW1sOHc5UFBselhjQjJNVEhLVjZXa05rdVlzelRWMDBrUG5oalQ2SU5HaUsr?=
 =?utf-8?B?K0w3Mno0VU0rQ1AyWDR3NGJJa2w3VFFVNXlkZ1RBUFFVeTVLc0w4TmROUWg5?=
 =?utf-8?B?Zy81SjI3UW1mRE44ZTVvSGRPTW1PTnY5ekVTdUlZVU9jd0kvVzJTc3Z2UWQ2?=
 =?utf-8?B?b1B5UnhrdDl2ZFRJb2Y2dWlUd2VocG9hMi82M3dJTjdGT25NWkVVRXVJbUk4?=
 =?utf-8?B?d3JPYW9ZR3dyanlSL3YveHBHUS95TzVTVWJwYkNmL0piSWwzOU9TcmVwVDlX?=
 =?utf-8?B?Yit5OTJyc3dzOWpzK2FNTHoybVRteDNlYUhyZW5aUFlHRGtZNkVUcmI1Z3Zo?=
 =?utf-8?B?RWYxWVlvMlF0TzkyaEE3MVdBZTVGSEd6REJoMEpWemdGU0E0WUx4MjA1SkNm?=
 =?utf-8?B?aHhTdmpxVjk5SS9va21RdkpUQUZWRWN6d2hhekJpT3Z0WENIbWEzaWF2eVNz?=
 =?utf-8?B?bTBUaytrK3E5NjliVWh1TW1QS1JMV2V1Z0FwNndFRkMrVXlQOE4vMTNFbHcr?=
 =?utf-8?B?RDQ4M1hiVWVQMHd0cVlBcXlSK3VjY0ZOOHRMRWVTVGdSN05ncW5VY2hnTmJW?=
 =?utf-8?B?VUs5L2hIcmtlYXdJdHdoQnIyUnVGSytMblAwOUJYNUducGRjcjZic242Y1ZU?=
 =?utf-8?B?YUVYN2lVN1VpVGdIbzlrdTJOdHBhUDd0MlFHN0FkVEk1cUJlNys0T1VCRVdq?=
 =?utf-8?B?dUQxcGwvZXdWNXdkQkliM3JBTFp1RG9EKzkyaVVjZFRTLzRyYkdxcHprMFpt?=
 =?utf-8?B?cFpXYnZNcTY0NmZTSW8yRjlXdmoydExzL3B2SGlYUE5RVXFLS05RQ01kaE1B?=
 =?utf-8?B?Ymx4aUJNQWdOQ0d3bWFCWTBMaHpuaGszanNGTjg0NXZ3SFRhZWpDMXJyWTRO?=
 =?utf-8?Q?PfGZiKresaN5g1f1qghcjrVRJ?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22d7edfb-c830-4ecd-845f-08de39663c2a
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 10:07:19.4211
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nYtrGwQfORd8ILwsNnd0upYAWYQur7cvDQ6QppSX1vmXw19u1U8h62V3atNFWDmL2aZDNhwlnQQNw8Uu3wd3nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAWPR04MB9958

Hi All,

Sorry for top-posting. There is only one comment from Krzysztof regarding
cleanup API usage. Since 6.19 rc1 still not out, I will wait two more weeks
to collect comments, then post v7. Hopefully, you are ok with current
clk-scmi-oem stuff.

Thanks,
Peng.

On Fri, Nov 28, 2025 at 11:14:09AM +0800, Peng Fan (OSS) wrote:
>Since the assigned-clock-sscs property [1] has been accepted into the device
>tree schema, we can now support it in the Linux clock driver. Therefore,
>I've picked up the previously submitted work [2] titled "clk: Support
>spread spectrum and use it in clk-pll144x and clk-scmi."
>As more than six months have passed since [2] was posted, I’m treating this
>patchset as a new submission rather than a v3.
>
>- Introduce clk_set_spread_spectrum to set the parameters for enabling
>  spread spectrum of a clock.
>- Parse 'assigned-clock-sscs' and configure it by default before using the
>  clock. This property is parsed before parsing clock rate.
>- Enable this feature for clk-scmi on i.MX95.
>
>Because SCMI spec will not include spread spectrum as a standard
>extension, we still need to use NXP i.MX OEM extension.
>
>[1] https://github.com/devicetree-org/dt-schema/pull/154
>[2] https://lore.kernel.org/all/20250205-clk-ssc-v2-0-fa73083caa92@nxp.com/
>
>Signed-off-by: Peng Fan <peng.fan@nxp.com>
>---
>Changes in v6:
>- Add kunit build warning
>- Update OEM string comparation per Sebin
>
>Changes in v5:
>- Per Stephen, export clk_hw_set_spread_spectrum, use enum for method,
>  add const for set_spread_spectrum and rename clk_ss/conf to ss_conf.
>- Per Sebin, Cristian, Sudeep, I added clk-scmi-oem.c to support vendor
>  extensions.
>- Link to v4: https://lore.kernel.org/arm-scmi/aNQPWO6pfA_3mmxf@redhat.com/T/#me81231bf286e2a8e4e00a68707ed1e525a2b4a3d
>
>Changes in v4:
>- Add R-b for patch 1 from Brian
>- Drop unecessary change in patch 4 Per Brian
>- Link to v3: https://lore.kernel.org/r/20250912-clk-ssc-version1-v3-0-fd1e07476ba1@nxp.com
>
>Changes in v3:
>- New patch 1 for dt-bindings per comment from Brian
>  https://lore.kernel.org/all/aLeEFzXkPog_dt2B@x1/
>  This might not be good to add a new dt-binding file in v3. But this is
>  quite a simple file that just has four macros to encode modulation
>  method. So hope this is fine for DT maintainers.
>- Add Brain's R-b for patch 2
>- New patch 3 to add Kunit test per Brain. Since Brain helped
>  draft part of the code, I added Co-developed-by tag from Brain.
>- Link to v2: https://lore.kernel.org/r/20250901-clk-ssc-version1-v2-0-1d0a486dffe6@nxp.com
>
>Changes in v2:
>- Simplify the code in patch 2 per Dan Carpenter and Brian Masney
>- Rebased to next-20250829
>- Link to v1: https://lore.kernel.org/r/20250812-clk-ssc-version1-v1-0-cef60f20d770@nxp.com
>
>---
>Peng Fan (6):
>      dt-bindings: clock: Add spread spectrum definition
>      clk: Introduce clk_hw_set_spread_spectrum
>      clk: conf: Support assigned-clock-sscs
>      clk: Add KUnit tests for assigned-clock-sscs
>      clk: scmi: Introduce common header for SCMI clock interface
>      clk: scmi: Add i.MX95 OEM extension support for SCMI clock driver
>
> drivers/clk/Makefile                               |   8 +-
> drivers/clk/clk-conf.c                             |  69 ++++++++++++
> drivers/clk/clk-scmi-oem.c                         | 103 ++++++++++++++++++
> drivers/clk/clk-scmi.c                             |  44 +++-----
> drivers/clk/clk-scmi.h                             |  51 +++++++++
> drivers/clk/clk.c                                  |  27 +++++
> drivers/clk/clk_test.c                             | 121 ++++++++++++++++++++-
> drivers/clk/kunit_clk_assigned_rates.h             |  10 ++
> drivers/clk/kunit_clk_assigned_rates_multiple.dtso |   6 +
> ...kunit_clk_assigned_rates_multiple_consumer.dtso |   6 +
> drivers/clk/kunit_clk_assigned_rates_one.dtso      |   3 +
> .../clk/kunit_clk_assigned_rates_one_consumer.dtso |   3 +
> .../clk/kunit_clk_assigned_rates_u64_multiple.dtso |   6 +
> ...t_clk_assigned_rates_u64_multiple_consumer.dtso |   6 +
> drivers/clk/kunit_clk_assigned_rates_u64_one.dtso  |   3 +
> .../kunit_clk_assigned_rates_u64_one_consumer.dtso |   3 +
> drivers/clk/kunit_clk_assigned_sscs_null.dtso      |  16 +++
> .../clk/kunit_clk_assigned_sscs_null_consumer.dtso |  20 ++++
> drivers/clk/kunit_clk_assigned_sscs_without.dtso   |  15 +++
> .../kunit_clk_assigned_sscs_without_consumer.dtso  |  19 ++++
> drivers/clk/kunit_clk_assigned_sscs_zero.dtso      |  12 ++
> .../clk/kunit_clk_assigned_sscs_zero_consumer.dtso |  16 +++
> include/dt-bindings/clock/clock.h                  |  14 +++
> include/linux/clk-provider.h                       |  31 ++++++
> 24 files changed, 580 insertions(+), 32 deletions(-)
>---
>base-commit: ef68bf704646690aba5e81c2f7be8d6ef13d7ad8
>change-id: 20251127-clk-ssc-v6-2-57658f944324
>
>Best regards,
>-- 
>Peng Fan <peng.fan@nxp.com>
>
