Received: from HK2PR02CU002.outbound.protection.outlook.com (mail-eastasiaazon11020129.outbound.protection.outlook.com [52.101.128.129])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DF261A28D;
	Tue, 24 Dec 2024 05:20:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.128.129
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735017637; cv=fail; b=BdyCCkE/JsI/a9t41k+GSslhrtFu5cbiKHm2AAfxm8NIrpIPvdtb2b2ZfGb6f1HkoFYip40w2fMNbbASEsNJIdCBR8yhmOlCm/FD9ny2RJtpX7YR8wZ4XtqI4o46q6IZYwZTwHR/FGor53Dh7wWKTvLL4jJmdYBX25prdQQwjjE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735017637; c=relaxed/simple;
	bh=UcDy/Z9QefWQVV2I2Qdq5h4XgghQkao+OJlwCT8a/FQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=Lrtk/rJpF6mQwCaMmrgalh3eolDDdd3yaoPHZHrBNskvAC9SZCKRZY/g2s46EqXchZRnQokhDticX6J6+aItUVhmETwpXbOOZb9SqRq8OLH5YF1NAli3tU4dsIcfx/LFJU4AcPDCy3Mmm7BP0olqSOZ+UuXgbKG/A5IGPV4nD40=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=gFcquQoc; arc=fail smtp.client-ip=52.101.128.129
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="gFcquQoc"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Eh2vwIPbFgNHXPXQsmEzx1Z/dh3VKxaUzD9jjFj8dmF2jCQ+MdlXADnWF8VDzDFHu/JEN/Xb11XB4wfuP+4ZDd0QkXgsf/QqvQhTU8gMeXwuydBFWkbxFY6uuzYzXs/HpdNJ8sDwheBfQnLzwEdRXAMfMTLD0zNzRKz26lM4AkBjbHw9XtIEHIZruK7f1FOlIbYK8xCGM0VjHx8CfUev/x3/gC0Brx1xBcsvD26JBFw35LBjt5bS7dRIzU0JQW3SytHDG80nPMGWtf5u+/Bxdeyz4rH1hm3TnQmIWuuMNDnSfzkFrqslTys2fHqzKbSmYp7hw1W9a0mfP0LEy7k/2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UcDy/Z9QefWQVV2I2Qdq5h4XgghQkao+OJlwCT8a/FQ=;
 b=TFy4wGcWVQDMUjpwOIQuRKJj45lKuz4EsFLWyBUmIdQ13R1Ze25c/r5IVCmCY5kVP4XHK4nhGjrI9ZhGUni5pahmPKdPDHxZ3OZ8Uidw5nZpmMbhz6B8lcl78o0/+5qApmJxM/qkEgyMZy+FyCmDK8NauYcKRgEnmhLqp/2LLJUQ5GY5Oc1B8shbz02uRBTSV4kcT38q6Cfk9Qvcoie3twvqlpEEMqKG7BC+j3OoMc3+MCy/2pzTVXb04qsbsF6gmvW8s/IyRaMNnoG9sp3AncRz4L3QmIdkf9HYEgVMdFl6JCz6n54DECMO7OIlKq1YJADq/AvHlYBg1mVMoorytQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UcDy/Z9QefWQVV2I2Qdq5h4XgghQkao+OJlwCT8a/FQ=;
 b=gFcquQocHLetKCy7ity4VWJwniH/tDE1bEHMVlvCEG6dBElv9VLql5r1o9+YWS2n/X4KN5DXGOHaIUPjgQVgHiyQhbmtOVDg0tvkCW3TDl/TFMQP9Z2eElAolZRGfNoYPr+lig/RC81/dRMKXzRVX2FQ7w80gmP7tOjEohcSfp3h8XxJvvK1Wiem96mG3xMtFIINr5YkTuGfwMeA5PsaHBs/tdLQuR/vu9ROChAB9DkeYBiW+9SX3LlZ/3VYaAQ7aOY5JHx/jtQC/xHAFjTpxkXk02AQNJ71TnId58EX1Y6uwuDV55kT478+PEa88oyQW/aLJUGKJniD8suybKhGZA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by SEZPR03MB8140.apcprd03.prod.outlook.com (2603:1096:101:17f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.17; Tue, 24 Dec
 2024 05:20:24 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::9d11:d1f6:1097:22ca%7]) with mapi id 15.20.8272.013; Tue, 24 Dec 2024
 05:20:24 +0000
Message-ID: <4e4808ee-07f2-43db-b7f8-e9362c9898e4@amlogic.com>
Date: Tue, 24 Dec 2024 13:20:14 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [DMARC error][DKIM error]Re: [PATCH 3/3] clk: amlogic: s4: remove
 unused data
To: Dmitry Rokosov <ddrokosov@salutedevices.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org, linux-arm-kernel@lists.infradead.org
References: <20241220-amlogic-clk-drop-clk-regmap-tables-v1-0-96dd657cbfbd@baylibre.com>
 <20241220-amlogic-clk-drop-clk-regmap-tables-v1-3-96dd657cbfbd@baylibre.com>
 <3ce97435-71c6-4a7c-8d6c-fa387f68494d@amlogic.com>
 <20241223090137.jbzwrlazhkumatfx@CAB-WSD-L081021>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <20241223090137.jbzwrlazhkumatfx@CAB-WSD-L081021>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SI2PR01CA0007.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::11) To KL1PR03MB5778.apcprd03.prod.outlook.com
 (2603:1096:820:6d::13)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|SEZPR03MB8140:EE_
X-MS-Office365-Filtering-Correlation-Id: a95d9717-1d28-4080-8798-08dd23daab56
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|7416014|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TmFiZWF1cDU3YlJncFpsM3JtcWk1OFpCc0lFdVovTnhDVFMxejkwYUo2aXA4?=
 =?utf-8?B?N1l2SzR3S0RHbW41OE8raGdNbDRtaHZ6d2lHcGNhN3JyL1ROejVBMEZnOVZx?=
 =?utf-8?B?eG9lYkdiL2Rwb0tTb1A1Q3MzWFllNENCUk9OdWxIZWdQaUd5Z0o3Z3hDSmZM?=
 =?utf-8?B?L25WQ0M0SFl4TjdxKzFNWWN1dVBoYWhmRGJSbFJEUU5VU1lvazcxbkJSdmRT?=
 =?utf-8?B?cWlwU3J5L2ZjbytqOVlSaUdFS3dRZGtkVDZ5SEFKQlI0SDNIa1JONXVzQzhB?=
 =?utf-8?B?VG1pczVqK2NWQVdCRjlOeVpMYVN5ZWtla2JaM0d1Qk1QZXAxK1R1ZTZWZU12?=
 =?utf-8?B?NUdPR01LK3VBaDdOZC9nRjFkYUpVZkszd1ZQa25ETFhOTFQzOUFlRHYvdjRP?=
 =?utf-8?B?eUtjMlJ6ZEN3YlliZWdhZ1BsLzA3NTFHUjFDY2hOa2d0dnZTM05IeXM5N3RM?=
 =?utf-8?B?RXF0dlNibjJLNUpRMlhuT2pMTUNyZDdDSDNCUStTdjV3QmRSa2grdi83eElH?=
 =?utf-8?B?VTlNOGc5VUh3RVh4OUpsU1FwU0Y3ZnFyMVhXVk5NaHpMaWx1MjJiMjBrc0Z4?=
 =?utf-8?B?VFdEbVpDSUJSejREN3czSWNraldmckFBd2FkaStqZVJjbC8yZ1Urcm90bFA2?=
 =?utf-8?B?WGFOUWJXNDVOaE5IcDZaRU1neWYzNC9KQy9jRUdQcjJhTUszWHFPWFBVZi9G?=
 =?utf-8?B?L0RnOE90dXlZWGMwWUZVRFZwcW5VanNUdHF1NW5DdVpGQ0dJbzZ4UFZJUHVK?=
 =?utf-8?B?aWp2dEE0ejlneWp3c0N2dzk4U1p3RzgvSFRGN05VdXlGMzMrckhkWWlmNzFI?=
 =?utf-8?B?WG1md0QrRTZIMU1VWElwcTFFNkNJTEEvREc2dUlEK2RxNjA1T1ZlVUhaYmpk?=
 =?utf-8?B?Q0JEMm0yTXVJK3Q3dmRNMCtoWlVQTmU1cFpFdTd1dDVlOEhoNi9VR1M5WU81?=
 =?utf-8?B?bW1HbEVibmNtMnRWU2NIYTNRZmhMTWlQQmtIMEVJS0lMOXcvK3JSOHBzZHRt?=
 =?utf-8?B?cnpnb1NDMkNjSGd6OVFNMExhYVpKc2s5MG4xcmxsZnFZaWZNL3I4S3hWUmpz?=
 =?utf-8?B?ZXovV0dma0tucmdUb3pCalpFbjk4cW93QnIvU2ZsNGZiQUpiRFlSeDdHTmJv?=
 =?utf-8?B?aWVnUzBFMittR2dCaFVHRUQvaHlrQWJnY1pMVlAzdHlpQUlJcWpDM0lVYXZk?=
 =?utf-8?B?YWNQTXN2YzFSRnhteExjcXRDQy9odWd1aU5uckJQMUxFRWxQcERXejBNOU9I?=
 =?utf-8?B?NWNmZVp3ZlQrc3BtNExFbmYrZ25UMnY1SUpGMGFzcTFYTHBNZXJvZ1Bhb3Qx?=
 =?utf-8?B?ZmVvc2ZlclN1UmFmVktGVHBvTWJlYTk2bTc3MUNOTCtSdmlRY2VrQ3VCeDEy?=
 =?utf-8?B?MElvOFRScENweUdQR3FKZUVtUGEvSVRDZThlTGVXN3pPd0Y0d0M1aUR0QW9P?=
 =?utf-8?B?eFZKTFgwWW9GRGdMY3FmOHYxZ1F5RytCUVFLajVHREF5NkNOa2tLd0Rtb2l6?=
 =?utf-8?B?Uzk0L0MwaXR5ZW5hQit6OHBldWtxZG42WmV0UUE4TjdsYTNLS1ZDR093K0x6?=
 =?utf-8?B?Mnd3VWJXUWNoVVkzeGpFTnExeHpIVENHTWtPdGZ2WnlhUC9RbWlIQTYwdXcw?=
 =?utf-8?B?azJ4eXZmc1hpandGbmpXMnRZYzZGRytNdlVIY0p4aXYyQnpRbTNEYTgyR25r?=
 =?utf-8?B?U0lHdlJ0bjBHb0JtQU90bGxvai9QQ3RLcHV0dVZCMURlSVVPdnV4V3dpTWxT?=
 =?utf-8?B?VXZuak93RVpvWmpSNnhDRG0yWS9MVXRKZlEzKzFzL2t0VXBYUVl0eGRjc1hI?=
 =?utf-8?B?ek5heEE3cStIOWNaU0V0NEt1azNzeHE4RkhuVis2U2tDMVNsWkVkY0VSOWlz?=
 =?utf-8?Q?70LI/y5RvGlGZ?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(7416014)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cHR4Rmc0VVNNa3pFeG0zTWx3bGtEVEUrZlZCcDB6WnlkWkIzaFFILzNDQTdi?=
 =?utf-8?B?Tjc4WHBHZGNpY3pHeVc1ZUdWckRRS01qc1ZwYWJ2MS9hL2YrbmZ1dGY2dERz?=
 =?utf-8?B?aGVHY1NjTFh2QzBwRW41TXdoZGhoTXJzVTN0YlNsdTg5Y1gyU1lUNnNLZ3p0?=
 =?utf-8?B?LzRsbkJqWnI0RlFuQmw4QVFzazg4bjR4Nk1QRFlRTGJaTlN0T250dExJRDhX?=
 =?utf-8?B?Ni9nUGlMbkdiRUx5YmhrbmZNVHJieXF4TkFYaDVETjlDN2h5T1FmT09qdG5I?=
 =?utf-8?B?ak1wNEwrVW1iQW43UHE5N0NzRHA2OVd4dGF2STdWY0ZOd2JuNk9mbERzUWFh?=
 =?utf-8?B?dXU3Sy82UFBJVkhQZWtMZlNLVE1oOW0xb0lPRGVwMU5GY3ZQeDB6MDA0V3RJ?=
 =?utf-8?B?NHl4TEFHaFN4SEduZysyTkZiWUMrNG5QbTN4aFJIMFJ0VDV0aW9aUzVjZEow?=
 =?utf-8?B?eXV2K0t2cUZGb1VkdXBKay82TDZGU0VZZ1Q5bmFYNGRnRTV5NytIYUFXMmV6?=
 =?utf-8?B?VWE2ZVA3bzBHYVdDYWtxU0JFZFJFUWUvZlM4SFhtaWxwZXVtUzRZcnBoaFVH?=
 =?utf-8?B?WXh3aGtRVDNoZTUzU01jaWg2OEVpZmduZENOY3ZKWlZHQThpOUdwNkp5NVA0?=
 =?utf-8?B?QWF4WGxtWlFVVTN2K1d0YlV2TFFva2VIL2dOeXRZTkpWL0VLUTlQR2tJWU8y?=
 =?utf-8?B?ajUyTUI3VWpwOWUwZjM0OVBBaDNmV0V6MVlQZjJqV1U1eHhGM2txOXNyaVdE?=
 =?utf-8?B?ZTlDeVNXWEYyTEhheVdOU1JuTVVEd0V3M3A3Y1JXQ3VsS2NoMmFueW14SXZt?=
 =?utf-8?B?TXVWNnJQYWtUb0ZJMjFPNiszTzkyUE5WdlRmNmtzNTF1cm5KbHNjZDA5Tm1v?=
 =?utf-8?B?MW1sN085NUZqUzl1R05CVkxHcmd1UHZISUdMdTNNeG5JY3lHOUp0R0xsWHB0?=
 =?utf-8?B?dUgxTTVMb1JSMVh0c2FsRUErY1E3U250OUlyTFZDTXlkSE5tbW1idk9FNHhC?=
 =?utf-8?B?Q3IrUG5WWUxCaWpFeDB2ZTh5MzN1dVF2VFVHUnBpMjNGNHJGcnlxRmFwRVVR?=
 =?utf-8?B?UGQzaEZPaXNyUDVtV0FmYWFMWC9wZnBlbldpOWZrazgwcjlwN3QySkcrOVFs?=
 =?utf-8?B?OFFhaDNZQ2Nuc3NsNVdBcmlRRjFjUnAraFQ4aGNNU29TQzRaM3RrKzl1aS9i?=
 =?utf-8?B?alZYc3BLTjNqWFlwU1ZMZDBQL2laUkIrTjJkUWV2N09VbVdnYjJkRURxckM4?=
 =?utf-8?B?NkIxdnZoYVRYcmY3MENHbDlrRE15UHhGZTRyWlVvcCs0ZzFITlJpemY0UWVB?=
 =?utf-8?B?S1crQTUrbnFTNzlqQU5hejgvTk9TcDYrbWltTFQrRnl0cmFuc3JPa3pORUNW?=
 =?utf-8?B?dWJyZzZiM083RjZtd0tpOTlSYk0vNDRvaHBaUUw4SzViWDB0RnUrSjhsM2kv?=
 =?utf-8?B?UnZRT2s0V3NxcU02TVBYblp2VXlnQmNST25vVThwSUsweW9wbFp5U29nMFBq?=
 =?utf-8?B?SkxGM0tObUx4VXdQVzlaN2Z2YzZBQ0RyWVp0a0hLNmpVckNHQjNxWFpOQ2E3?=
 =?utf-8?B?c1ljMnozWTFraVlVa0owb01mUzdkRGFudWRQaFRycFNnUHVlSlYwVWJ5Vldp?=
 =?utf-8?B?WXdkZjZGcjlZNzJRWXUzTEROdWEvR1lQVi9TMnlGa3VJN1JKUUR0eTVtUlVq?=
 =?utf-8?B?d01uTC9oWUdZT05EYXNhWVBWL2R1eXlESkFyU0E4eHB6azdoaGVEQVRNQlZx?=
 =?utf-8?B?TnpqTjVucExRUVRPM1N3YUQrTGcvWGxrb0NIUjJ5U3JNR0tVSGMyanNYdXdI?=
 =?utf-8?B?UHFQQStQYnVaN2I5ZUl6WmFtSzlabzB6TktGN1dXZ1hZUm1kdUJCMTNSbG5C?=
 =?utf-8?B?MG5ubUFQV0N0M3M1WWQrK1RhbTVoWkZ5QVFSMU5XSWN2N0dkV0k3MHlUMzU0?=
 =?utf-8?B?UHpKaUMyMnR2aVJQemkyamFJQTZINU0yUnhVQTg0bzBFaDZUR29FYzl0SGFK?=
 =?utf-8?B?WTNVOXZHdVErV285QlAxMTV5OTBZRDlnL1BhczM3TFBWRDR4Q0tBT3NYNFZG?=
 =?utf-8?B?eFIrajh4QkpRSnlrNXQ5YkxVMnJkQ0hpUG9CRVZ3QlFad0J4eWt1QkNNcER0?=
 =?utf-8?Q?V7l69TBp68tJBZvLKewXdr9W2?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a95d9717-1d28-4080-8798-08dd23daab56
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Dec 2024 05:20:24.2529
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4RrLYdF8r62qAGZubAoRU5lIBd3s9Kk96IirjEI86UG7ckXGFQt6S0Sr36997wpHmewFVlAiLQXHtY25+9kkdw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR03MB8140

hi Dmitry:


On 12/23/2024 5:01 PM, Dmitry Rokosov wrote:
> [You don't often get email from ddrokosov@salutedevices.com. Learn why this is important at https://aka.ms/LearnAboutSenderIdentification ]
>
> [ EXTERNAL EMAIL ]
>
> Hello Chuan!
>
> On Mon, Dec 23, 2024 at 03:59:07PM +0800, Chuan Liu wrote:
>> Hi Jerome:
>>
>> Thank you for pointing out.
>>
>>
>> On 12/21/2024 1:17 AM, Jerome Brunet wrote:
>>> [ EXTERNAL EMAIL ]
>>>
>>> Following the removal of the big clk_regmap clock table from the
>>> s4-peripherals clock controller driver, it appears some clocks are unused,
>>> which means these are not exported or even registered.
>>
>> I have confirmed here that these clocks are used for the demodulator
>> of DTV (Digital Television). The DTV-related driver will use these
>> clocks.
>>
>>
>>> In all likelihood, these clocks have not been tested. Remove the unused
>>> clocks for now. These can added back later when they have been properly
>>> tested.
>>
>> I will complete these clocks later after testing.
> Are you planning to submit the DTV drivers that will utilize these
> clocks to the upstream?


I have learned that there is no plan for now. It is uncertain whether
it will be submitted upstream in the later stage.


>
> If I correctly interpret Jerome's patch series, it appears that these
> clocks will not be applied to the upstream kernel unless there are
> clients present in the future.


Jerome deleted these clocks because they were defined in the driver
but were not referenced and registered.

These clocks should be added to "s4d_hw_onecell_data" to be registered.
They were omitted when the driver was submitted previously.


> Please correct me if I'm wrong.
>
> [...]
>
> --
> Thank you,
> Dmitry
