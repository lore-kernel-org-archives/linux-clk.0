Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.103
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1792571068;
	b=Jz2OGzwuJPV+LTtOLbpTx80zvnws0LFls0FEFobX4WYdaudEOquTKZZ2vsYXVStksaPC
	 VA5kWljjnqhhu9vX2qXzsycjMk2Q7gfoa09pK1JY08vyKkplsqSbZa/FYa4gzK1436//m
	 wRpfzJOXCWBa7PQ4cM4n1RfIX6+cv9v3tY88NDYq2SxthPOZoyxpuPMeOEBAeD67WrLr8
	 zzsRPsk/9UZZouuVcBEb36aq9xd1ttPuKifySFLTkGJEGup+mugYLxXe5syyGPPyItWOS
	 wW1WWyCC3z5UWZmTyH25y6mGq7gXaCu6Ge06e11O4iZUtjaatrdjPnhef39vbZbYWjA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792571068;
	h=DMARC-Filter:DKIM-Signature:Received:Received:Message-ID:Date:
	 User-Agent:Subject:To:Cc:References:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-PublicTrafficType:X-MS-TrafficTypeDiagnostic:
	 X-MS-Office365-Filtering-Correlation-Id:X-MS-Exchange-SenderADCheck:
	 X-MS-Exchange-AntiSpam-Relay:X-Microsoft-Antispam:
	 X-Microsoft-Antispam-Message-Info:X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=u4X22pOlQx5Bgxq3jw6Ct6xdBht+f0DBK+2jqPgnbaw=;
	b=xz/gX4ijn0a2PULEPTFxhAnnkzCWR5Cj8KtmrFI2ATREC/GrXGwQfvfU5u6VFFwRFqVY
	 65/pWRCsa4xDRPip7e+QzQK8FVGW3v9KnE+pg5+WQtJXaUwdlq0tDBznue8uHHkoWxgkB
	 jH4ai7e/Jre+Jpvainnqn9l3YrNKLK5ZJ9FnDZ9sQpcokVsT0+WAmg2cJm+QJGf+42THq
	 aQk97dmL0PNVpU1VR2JmbHN3JWALqCwhm//6c3wo6U6XpEcwcLV8j4sz2CAH9nNPwnoMH
	 59gS8gEYYFGMxtM4p6lVOqjbQWmTcPvne1LYXr+tc5j56JsjQNWscTwHSc0gbjNGFTw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=amlogic.com;
	spf=pass smtp.mailfrom=amlogic.com;
	dkim=pass header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=lO0RRqbx;
	arc=pass header.oldest-pass=0 smtp.remote-ip=52.101.126.103
Received: from TYPPR03CU001.outbound.protection.outlook.com (mail-japaneastazon11022103.outbound.protection.outlook.com [52.101.126.103])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6200A606A321;
	Wed, 21 Oct 2026 08:24:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6200A606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=amlogic.com header.i=@amlogic.com header.a=rsa-sha256 header.s=selector1 header.b=lO0RRqbx
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ku2huw1pnw41IJcVbIr9qbHu2vI0Ht+gbARF0kWiJTxY6xh377Tkj8AU1iUCiQ455930Sp4Lj8+CaGxCePdmgc97xzQP76G8yvAtp0fIf8n/eVkRWCIcCqou1YJToNa2Z7WglEAwl1UpgmsGaw0EWYUuQqh/ew/fF954lbkqMwA9Uw9W3FPXa/W2q7hqPHTKvFGZNFP7sebZcAVzd6tJ0QjkCrElr77N1dWKIQAMGYu23y+/aga2F8s6S90WRmm4yYS7RAB3GLHWZeCs3MCMB7o+CuKpf5ZH6pVMfsy1gpjRs+pjZv07u9PngKBLTS4IxtxyF7KWAQoRlTPE1VtgaQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u4X22pOlQx5Bgxq3jw6Ct6xdBht+f0DBK+2jqPgnbaw=;
 b=GD5S/m6fgYhKVN0lrEYBF9QekN9oky1aFsJ3wX4gbxtFL3oZnGKuz8ngWZ7nuGJeddxHMl5fWklkOmM7+ZokVkoYtCyxjXJgv0uiMNsItZtRSvbjeYulSkvOdvbd3CZgbDKdWxn2PQUW1VU1CavelDgu9JZo6hJaSg/yH6ScTYuTxTCMhKiGazlQL8ldeJiPTdFvYyewXtxDPQrkLo29DRkfVUo9H2zK0HBVbXlMLvBvR283IaFkvD1wdd9SzBDGOsFmwdPXx+P9W4E0gU70+EwPgVmUTib5m5QJ3EzoT9vhOfj1hfIny8Sa16fFWYvX06OzTTzYSmWqP6k0kIYJHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u4X22pOlQx5Bgxq3jw6Ct6xdBht+f0DBK+2jqPgnbaw=;
 b=lO0RRqbx4jtdkbciUrrxODYLQLzoEoNKlDSSnQhv3u6rDG8Zi90uPRP9lJG5ESpT+YeSDJFdHCg1V1jIXgpzRrNSWXBEFstFjSF5jDdgQ++u93SBN6c92Nae4f+WfbbBkMUCrNNLGRZaeYO18SIfHgNUZU8MugjcwkvUez/U0ViyQi4Q6ImCUSZVbCZQV013TiXlf/E4ROac1q1oR8cCj0Le8v3WxzNHciZUymXP7Ve9rYuUN0u8/SVptET4Fzstx7w1Wbu4LR5jnngWM0d4SqsJ1f9WkY4oEvFiLaCmB8RgVnr4uqmM3AD50tjXYTQXsUEVu7TJM9ybscpV12QhQA==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by SI4PR03MB10101.apcprd03.prod.outlook.com (2603:1096:4:2b2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.546.15; Wed, 21 Oct
 2026 08:24:24 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e%4]) with mapi id 15.21.0546.012; Wed, 21 Oct 2026
 08:24:23 +0000
Message-ID: <55844de7-efa2-42b1-8d5e-94e826ee27fb@amlogic.com>
Date: Wed, 21 Oct 2026 16:24:20 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] clk: amlogic: Improve the issue of PLL lock
 failures
To: John O'Callaghan <johnocallaghan@gmail.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251031-optimize_pll_driver-v3-0-92f3b2f36a83@amlogic.com>
 <20251031-optimize_pll_driver-v3-2-92f3b2f36a83@amlogic.com>
 <20261021060005.2947837-1-johnocallaghan@gmail.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <20261021060005.2947837-1-johnocallaghan@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: JH0PR01CA0012.apcprd01.prod.exchangelabs.com
 (2603:1096:990:56::17) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|SI4PR03MB10101:EE_
X-MS-Office365-Filtering-Correlation-Id: 68e30c47-bb1f-463c-c891-08df2f4cb67a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|7416014|376014|1800799024|366016|56012099006|260925021311599003|260925022911599003|260925021911599003|4143699003|11063799006|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	bCsWt5lWfpT1PKMb/lbjIQbBesOdPMGl7bsmIoxPIKl66GdaqCgfnyOBIoe0L12PzvA4ILi106aHITXVxBQnXf8e4dfkmPEImGvt6lmQgbTxAOJAHLkZWdPKxBhimSueFzq2Xs2ZSFTwDYGNmkBW9KsDhKQjDxxomlMc2Bs0CohnmDlasgUrxnlUJBP5bcmxVWX96yUnIILGnhIU79psqScdO5Bpyb7uVPhKt0KC4jSASkIRdXu96NRi9gvIsN73Ng1CR/akqWe+WKmsmx0Zk6szciK67txkIFVH+khOvhDiHkShW6bCbSgz+/6x0X1J1gRJn/dwOcXVk7tQu3WYKg7yl95uXnFrl4cVov3CBMuLQ8PJHMdGVP53EfUQ5Zsv0nId+jxz8sgzqMC/Q4XzKySqHRlEfoLzNh3V6M0S3pFKyCXJhwKnheaLW9E9IdhJHx3g/FvgRGPAL+LpPbW+dpY79X7BRqLUiPAo+BeNk7yp4Ld9SPD+lZp672lTebG1M/6DNIFLkMfeLtvljqgwZr4pPmMuRhgyOEZfFC4pDmzQV7f8tWIPHSgayuEUQv7CA8HR505VXVVCNEJCxhQDdL5NGgBCeKqfurhfwGG4b+nU6ZismrxCptZlhdvOBxaVbalg+PqUc6SqoR8NJDLq3pEl+a2qnPcPeZUmriLT1hc=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(7416014)(376014)(1800799024)(366016)(56012099006)(260925021311599003)(260925022911599003)(260925021911599003)(4143699003)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?QUxxeU9qNXl1MlhVQWtOWVM0SnpJRkFxZjA1UmlTM2VIZStIYldjRWxyNngy?=
 =?utf-8?B?aVRVN05QZGxzano3bjRoMHA1NXFQNys1UDZiL3B1K1QwMit5SE9pejNReVVD?=
 =?utf-8?B?TTZGRDhoS2h5dU8vKythdk1ud1BVd25pdzJYTVdpT1ZhN0IyRDlYYTl4N2s1?=
 =?utf-8?B?VStmT1NyVzYwSFdCSlJqVThRc0hxOTBCeHZ1WXJRQitvWjR6YTMwWUMzdk9W?=
 =?utf-8?B?eUorQUNXelBRTE9kV1NReVFSa0VsWlo3enduL1V3V3BYQzlOODNyTmxWeVl5?=
 =?utf-8?B?MjJBZjFNK1FWNWVDYjBhME9yUVpUQzN5MDd6TEwxenk5K3RYc0gvTWU0czV0?=
 =?utf-8?B?NVVrQStWVnpBdSt2OFI5VVRFREgyYk1tdzFjdEhnVllmd05GUXZOZ1RMN1li?=
 =?utf-8?B?MmlyM3JaclNXYVJ6UlI1eks2VFFRdCsxZUd4Wk1wQ0d0T3Q1bGJjdVBuWVgy?=
 =?utf-8?B?VUFZRDFudVloRWh6cUpqSVJsL3BQdVdZOGNMWFc4cVp5TWlzUlhGOFJXREpC?=
 =?utf-8?B?TmltL2VhaWNMWGNOOUNPUkxId3YyL3ZmdXNNQWRqY1VGaWlLQ0tHVXF6MnBz?=
 =?utf-8?B?a3cvdXo4SFV0VWFuam5MT2xXM1g0dFdURlFxc2ZyaUtxNjRZNkUvelRiSDE5?=
 =?utf-8?B?djBqaEpsUXpPblFlVzZkZzNHME9KdFBrVldKbTdoWW5wVTk2cVRIVWhKb2RX?=
 =?utf-8?B?eGVrZ1phVmE4dGhldXJrRHZkTDFUcEFaYW9MZWphb1RYSjVkMkM1NDlQa0NY?=
 =?utf-8?B?dTJoNElXR2V2aU1rd2Y5cXZyVHdIZ2xJYmpqMnUvRHRYQVBJQm9rUlBUSmM0?=
 =?utf-8?B?UUMraFNwWHJsN3RDM2lHUUhOSXJ5Tm1YTTdtR3JUbVNJdVpXUkFva2hNWTFH?=
 =?utf-8?B?NlZab3VBY214RmtVbGk3aThlbEhyc0ltNlIrQlhuaXFIY0psaG16bDFjUlVB?=
 =?utf-8?B?TmtsNER2WXpaWTY2R3FjZUt3SmZhR01uU2JUcnZUVzF2YjgvL01IYi92RzJD?=
 =?utf-8?B?NjN5YXphR2thalo0bjh5M0JBTFJzWHRkVmZkVEUvRGg5akZEVjMyYStnYnhQ?=
 =?utf-8?B?Uko1MUZlbTdDUjN5MzN1MHpMdnJOa0h5NUd5OHJSeDRoV0VDaTNabmNrRjZG?=
 =?utf-8?B?WXFLSFc2WXNNeENodmVxanhmbHNvbW0rSVlrYjM1OXNzWGNITEpqMFJ6NU56?=
 =?utf-8?B?ZDV0eG1DWFZ3a0h3VHRjblgvM3Q0Mi9nMDNkUXRIb2M4TXhsSzZVRGN5V2hr?=
 =?utf-8?B?citRZnY4WlJSR2kwRVRLVVdOak55Q3Bpays1b2RmL3R5ZEY2azlCSXdmc01Y?=
 =?utf-8?B?L1ZoTitPZmc1WVdsN3Q1MS9QdlpIcmhxRm9sK2dnTTdCYzlOZEoweHVNV2wr?=
 =?utf-8?B?djBieW1CZFRHUWMvaTlaV2k1YmJTNzM1MU5nb1F3blBFWFd0TkFLT2lyUkVl?=
 =?utf-8?B?b3ZmalpzdlJaUWhGdlFsZlBSQ3pOeXh3d1lPb0VIanRNbEw5bTVDdmNkV3l2?=
 =?utf-8?B?UUUxaWtZT0tPc1BXck5hbDR5U0ZRL1JmTW1CVGV5NlJIS28yYnZyV2luSmpm?=
 =?utf-8?B?Yk5zZUxkRWQyQ2ZVb2F1ZkNmS3F2UitVWEFDY1BPdGRuTVJWL3F0alJpcWpZ?=
 =?utf-8?B?QkwrVEduUlBCTW5ZR3JVb25qYVg0NEc4eStxZE95RlFnS1BhQWRIL0pnOWsz?=
 =?utf-8?B?bFZGNmh3Q21jb29RZk1jTVlWekZ5ZmFnWFpNWjd5K3ErTklZb1I1SmRWTkU0?=
 =?utf-8?B?c1hlQng5SUxPd1g1ak1WS3c3cWd4MVdFMXB0TERtZ2NFZE9NVGgvMG1Od1ZJ?=
 =?utf-8?B?ME53dE5mb0Fia0tyRE1sTVF4YXk2a1FvVFFXMEFZZW15MXpmWHZRdHNHSitU?=
 =?utf-8?B?bEhoS05pYWlHMDZscndoeU4ySDdsZE1CUHNmRURuQTR1NkxLcnlxaFJGRTNH?=
 =?utf-8?B?dkFrK1h4UzBSWnJacmhWYjgyNmF2L3g1UllSbEF4NUx4VUd4cTBKQ25EekRp?=
 =?utf-8?B?Z0hhY2tONm56Nkx2Nmd6cWlVQWpXRVVmRVBtcnp6blI5Y1I4aDZicTlMQVhR?=
 =?utf-8?B?Znl3a1lvVmRnYWV2cktGeWNHR2VCcXpPU1g5cFd5TG9ReXdsRlEvU2ttb1Rz?=
 =?utf-8?B?TUlHcms5eGxjZzUyOWdnSEJQaTlTS0dpY05hUStnUFp5T3F4akhEdGtFWEFD?=
 =?utf-8?B?a1BNa0xxTlhYT0h1eDhaSVk4V002YW5jTFltU2hmWHRMZHgvU256SDN4bVA0?=
 =?utf-8?B?L0w1Yjl4Vi8xSmhaTitMcVhpZkx5MWtkOWgyTmRFWkJxTTlZcDh2YnZyZVV3?=
 =?utf-8?B?WkhjbS9tdmhFaWFrZmlEOEJ0blViSXRsRDAwTmhmN2w0Qjg0aUVYUT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68e30c47-bb1f-463c-c891-08df2f4cb67a
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2026 08:24:23.7195
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BQYB4ylB1r6XjfIBmCrzjTlDjQD9mMGBFNRi8V9ss0WEoExcquumEjWODM1IV9P2NEK/vlvoeD11+9QYgE5Pbg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI4PR03MB10101

Hi John,
   Thanks for your testing and feedback.

On 10/21/2026 1:59 PM, John O'Callaghan wrote:
> [你通常不会收到来自 johnocallaghan@gmail.com 的电子邮件。请访问 https://aka.ms/LearnAboutSenderIdentification，以了解这一点为什么很重要]
> 
> [ EXTERNAL EMAIL ]
> 
> Hi Chuan,
> 
> Jerome asked what was tested; here is a G12A data point.
> 
> On a Radxa Zero (S905Y2, G12A) running v7.3, sys_pll_dco occasionally
> fails to lock on cpufreq transitions, at room temperature:
> 
>    meson_clk_pll_set_rate: pll sys_pll_dco didn't lock, trying to set old rate 6000000000
> 
> It happens with all the sys_pll OPPs (old DCO rates 3216, 3408, 3600,
> 4800, 5592 and 6000 MHz) but, here, only while the video decoder is
> busy. 

I understand there should be no direct connection between the video 
decoder and sys_pll lock failure. Perhaps it's due to increased power 
consumption when the video decoder is active, causing higher power 
supply ripple? Have you conducted comparative tests on the ripple 
conditions of various power rails after enabling the video decoder, 
especially VDDAO_1V8 (which supplies power to the PLL)?

The operation of the video decoder may also cause more frequent load 
changes, leading the sys_pll to re-lock frequently and thus increasing 
the probability of PLL lock failure.

Reproducer: the userspace governor, random writes of the
> 1200-1800 MHz OPPs to scaling_setspeed (~700 transitions/s), with a
> GStreamer v4l2 decode loop (meson vdec, H.264 + VP9 1080p) running
> alongside. 46 C SoC temperature.

Previously, we encountered similar PLL lock failure issues during 
low-temperature burn-in testing (at -10°C to -15°C) with G12A, and we 
had previously pushed a mandatory patch to customers. This patch 
significantly improves PLL lock failure scenarios, you can first apply 
it locally.

> 
>                                         transitions   lock failures
>    v7.3                                     500290        33
>    v7.3, no decoder running                 250056         0
>    v7.3 + this series (1-4)                 500089         0
>    v7.3 + patch 2/4 only                    500066         0
> 
> So on G12A it is the 20 us delays of this patch that make the
> difference.
> 
> Tested-by: John O'Callaghan <johnocallaghan@gmail.com> # Radxa Zero (G12A)

Thanks!

> 
> The testing was scripted with the help of an LLM coding assistant; I
> ran it on my board and checked the results.
> 
> Thanks,
> John

-- 
Best regards,
Chuan

