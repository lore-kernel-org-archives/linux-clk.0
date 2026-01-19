Received: from TYDPR03CU002.outbound.protection.outlook.com (mail-japaneastazon11023136.outbound.protection.outlook.com [52.101.127.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C3D23AB87;
	Mon, 19 Jan 2026 12:17:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.127.136
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768825034; cv=fail; b=Vh7U5XXkOXG7O9d15z751mo9EQu4TL3OgNHgqODfwzNcCDsYXHc4vS9jwjVtWKMCMk8tYGhnM+zM3WW6VHcu7muRMSnW5YNQfXPlo6hJL9d2bLDmct0km4iKT+xdChz1cOVoQtW4ynHnG0q+Y+u0uB61XXvZDBCWdXx7Et7r620=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768825034; c=relaxed/simple;
	bh=9OR5eR2FNgjWUFDJxISbhBzU2+RBYNClL6zIqB/c/MQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=sgKUIlN69M9qTHeSSHfVgHD7YVmxNWxfYNxWHi390qZJqlhXocGxqr4GVcsiH9L284cmja5Eex2oarZt6yag1NHOi4JbxECTH4hcHBxf346L/TwdKmkQmLrzzl7xtJLvYU/C1DU6U0p7PZP3nPSZlq35bFUtDfodjr9juDX13rY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com; spf=pass smtp.mailfrom=amlogic.com; dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b=rVKeMs7d; arc=fail smtp.client-ip=52.101.127.136
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amlogic.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amlogic.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amlogic.com header.i=@amlogic.com header.b="rVKeMs7d"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BgtsonxAIiiGZlzCcS4UvpHQ4R+6hX2W4DtZG8tSIxbDTCjYh/ilre+w/i1YPgXljOU2wmGQcXuZVG8MKifvOfyQI9vfoyZhl0ZhhscRnI4BPiMMUTpSC0+piB6M4B+D+HO64QwpKDzY5BfrFcIUHn31vag4+cS3/t9aLUDVYOu7jCi7WpUWccMZrM6qJTaWEbr8CdgZwXKZbaLQ4pykS9RgRP4sR5+fDvT2NRCRJ43gMGeSNdvVXzFfs0MqgKsMKAH55S+t2LJMySc6yspIGmyUqwmP1zeoLTlxulP/7+KAmGZYEuF6Pb5l3Xi/p6n4cgBkiQ2sxFe6B08NomkABQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+pQ5Z6ufKQmspKui21wBRAc29h0Z9mlDXJ9/CV/qsAs=;
 b=thGsr4EUsxaYdL5wI/Ox1tthRaNU4A7cRk5+AtNb33wbvP9oovIN6Nq3tSSUBVtwIlhRCezYEgiIMFDuZAe2tFcXVWAhnlB6StQo4M/9ZlLu+FInyuKCNbj9YnpKGxo6Pk+ZqZ6aWPJjObwXppKgc0p5petV9tn+oLK0nhrLKjDT1UaSg2GRyspfVEY4wPqDKz8fPVZkTFk1Z23lb0KIL+brGmMI1CgK8MTzFrO2KOKHGbIPTj5Y71ACnVJ0SeoAhjE3J0MtstqPNGYTVCeGXYfIkIgk5P2J8QLQuE8F5uHoDzi06UfMcNgJ2LX1JyXJeqYgEQdaJW0QMzkd1HDU/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amlogic.com; dmarc=pass action=none header.from=amlogic.com;
 dkim=pass header.d=amlogic.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amlogic.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+pQ5Z6ufKQmspKui21wBRAc29h0Z9mlDXJ9/CV/qsAs=;
 b=rVKeMs7dcOW4qJ94T7njgl/0NHB7xhsgKq9tCiqsOUfaVQ1ufPrNLVPre2jLhE8sqF/znIbG62RFfa/66uiFfJ8qTEff/OA3ss9AI3VLvhFKw3uhISw7TdR2oQy1SzhVinGEyqx2EATa989K01IsVNC4xh7KY8ukhzL2P4DtndXLJ4OPdrcZtkeak+CVJliTbCrr5kjzDkF0z54kJXhMXVJShkshHjX5fAWIsJufj1U3eGDiG0MMEj6ZqQJ2NWlABO9mZl1cKTSvOxkiwk6AdttomW0i1rTWoK1hzWIC9n+DIu6EYQ2iFAEKcyep2VDMMVkzqpeFbccvipf+aBfEgw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amlogic.com;
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
 by KL1PR03MB8042.apcprd03.prod.outlook.com (2603:1096:820:fe::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.11; Mon, 19 Jan
 2026 12:17:09 +0000
Received: from KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e]) by KL1PR03MB5778.apcprd03.prod.outlook.com
 ([fe80::e1e:5c95:a889:828e%5]) with mapi id 15.20.9520.009; Mon, 19 Jan 2026
 12:17:09 +0000
Message-ID: <ea7e209d-cd30-4d93-9deb-104aaf7c92eb@amlogic.com>
Date: Mon, 19 Jan 2026 20:16:19 +0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/8] clk: amlogic: Add A5 clock peripherals controller
 driver
To: Jerome Brunet <jbrunet@baylibre.com>,
 Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org>
Cc: Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>,
 Xianwei Zhao <xianwei.zhao@amlogic.com>, Kevin Hilman
 <khilman@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <20260108-a5-clk-v5-0-9a69fc1ef00a@amlogic.com>
 <20260108-a5-clk-v5-5-9a69fc1ef00a@amlogic.com>
 <1jecnsr1eg.fsf@starbuckisacylon.baylibre.com>
From: Chuan Liu <chuan.liu@amlogic.com>
In-Reply-To: <1jecnsr1eg.fsf@starbuckisacylon.baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SG2PR06CA0199.apcprd06.prod.outlook.com (2603:1096:4:1::31)
 To KL1PR03MB5778.apcprd03.prod.outlook.com (2603:1096:820:6d::13)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR03MB5778:EE_|KL1PR03MB8042:EE_
X-MS-Office365-Filtering-Correlation-Id: 047be5af-5220-404e-fdda-08de5754aaa3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?L0NWMURTZW8wY25NRDcwQXowUGpnc3FaT1Qxc1o0a3F2RnZKQzlFelhVVUZZ?=
 =?utf-8?B?VDl1ODkrMEwyQTZPa0E0WmhGZFhTTS9HS0dueDhnVHVicGpJVXNrejRqQk93?=
 =?utf-8?B?VmVzZXRYcUR1R3ZPY1JLbE52VXRmUWNvMmtWdjRUOGVlQ3dBVjlnQ3NPVnRr?=
 =?utf-8?B?MGFyTnUrWjB5c3hnT0xEOVppT3FIYXFpNXlrWDN4U2ltVVV2QmV4eXNtN044?=
 =?utf-8?B?NlR5Z0toYTBST2RYVzBSL0VvVXoyOFFlajlIOWMrQ1p6enIrTkV5bWlpNm14?=
 =?utf-8?B?ZXd1eFZqRXNaN3JEN2JIZTZXS1dwbDVhZllYYkJISzREclNTVlB3RHNISWpj?=
 =?utf-8?B?R0JXNGNJdHk1dVBzRGNyR2VKMVdEQVZzZm01WHVuSHZvUmhLbWVTUzBoaWsx?=
 =?utf-8?B?QVpHcHdSQlZwYWtHUGZwQVBadm1ZYktyR3I3bGhqeGRuOFdPUXpGdkVRNzR0?=
 =?utf-8?B?YzdCWURSZTVaQWdhc3A4N01yTXZsNzhaQllkVXA2Q3M5UGl1b2dJRHcrdkdO?=
 =?utf-8?B?Q09CUnIxckoyczhlRnNVNG5KZGI2NWdlQTZSb3NVYU94UG1WTzNYbmx1cVBB?=
 =?utf-8?B?K001azFLZUlCU2VoUEJ6UzVJRkNvazcrWnVEVEwwbFhiRXZWbTBZSS9JQmFP?=
 =?utf-8?B?OXJWTkZPcGxxcktyckRjU21lZEtqOUNhOFkxS09WNmYyUjZGeXNsMDRpb1Y3?=
 =?utf-8?B?OTFwSnA0NXE4NGVZNDVESzRaZGdmbkFqYXMxRzVuQWMvelVHcTFYNTc5c0pH?=
 =?utf-8?B?YUlWNGZaWjc3eTA4ZlZBRTcvVHVWWk9YRWg1cTc2RnBnTi9kWnRDWVVSLzh5?=
 =?utf-8?B?ZkswV0dNYm1LdXNFVzFFOGlEbnM3U0M4TGFDWTg0V0o2VkhEYTNNamNtYXZz?=
 =?utf-8?B?YkljcUtxL3RJWEtLclA1VFdTMi93QkhWUmpWK0FNS2VObjF4M0hvZXRDVHRN?=
 =?utf-8?B?QWZ0aUVrZFI1VDFHb3lHeVNjcCswb0lqd1pIc0hXZE5XS1M2S2VkUGF6ZXB6?=
 =?utf-8?B?ZHhKWkpTYXlWak5BaGI0SVdRTksrNVVQSFl1VW5yMFlwZG1Ya3Y2NzllblZ0?=
 =?utf-8?B?NW02VEdrS243UmtEOC9jVCtFNERiY1pESlVqZURUK1RpYzE0cjNyZkE0MGNz?=
 =?utf-8?B?THYxLytuazNwOGRkY1pkeE1GSSs4Yzk3N3lXR2dkNmpkVTN0SThTdzUrbGVH?=
 =?utf-8?B?L3FXbDNyOXlBd1JJQzRiRWVZOWJtSy9IVE1VSm9uUXBYdllPRVBIbmk5NHhH?=
 =?utf-8?B?OTl3TU0wMWtJZlF5SmQ0VnRPMkRsa1lmWHVqOTRjYUM5dkhlVlpOakNpelFC?=
 =?utf-8?B?S2tJMU1UcUlieis4Z3pvVUIyOWFUb3pWUERMYlJOaVRNWTZaSjRGSUJGTlRj?=
 =?utf-8?B?ejZ6VyswQi8raDlENkF0Yk94bVArVisweWtXQzlkRXBWejJqNjF5eVZIWlhI?=
 =?utf-8?B?VGJzWEVWNW1ZeDdMcEJTYWM4cHRpNnJUbmJvZ1puWmhST0pUMVVBRHVrd3JN?=
 =?utf-8?B?R0dPMDVpaGV0NTc1ZlBuUGlUM2dqc3VEdi9weW1qRGVSZHpJRHdObHlaWUlX?=
 =?utf-8?B?M29DODhoUHpWSGg3MVQ2Y3lTZTFLRTBEY3k5cCt4L1VNcmM4Mm1EbFYyTjQv?=
 =?utf-8?B?M1hDa0NXOUVMc2lHNU13MjRCOUhmMTJraTVkb1RBS1VEelYxMldlcEpNWUlR?=
 =?utf-8?B?aUhkRE1tQXhRQld5U09JQ3g2UzdLRkRUZUJpQWVSNGhnZ0dIc0QweTJSYzE3?=
 =?utf-8?B?RC95ZWEwdFFQelMwYldtS3psKzNJcUJmUWNxS1gwQ05HMU1HS3ZtbXZSL2lK?=
 =?utf-8?B?RWVNSUp2S3RqNU04Qm1hMW5tYU1aZU5keFBOYkYxNEh2OWR2Q2RGWjNlWVdJ?=
 =?utf-8?B?a0VGNkRPN1FiL0pPbEZ6TTlvMzdjOUdxdUcvbDdnb0FBek9TS1dZT3ZESlZv?=
 =?utf-8?B?eXh6KzdTTjBEWUY1TVFIQ2cvNE0xeFJIU0RqRWJqSXBLQ1IwNisxeGE2TlFj?=
 =?utf-8?B?MHRtaVlOVTE3RzFaZ3ZyT3BwejgrbjYvSXBLYmFtOFNiUmNJSUQydTMzaVJw?=
 =?utf-8?B?RUs2N0JiVHRwcU9nNzVQUExpb2pydEd0a0dabHJRaHJBcGlOYU5GRWlleU02?=
 =?utf-8?Q?gEoA=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:KL1PR03MB5778.apcprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(7416014)(366016)(376014);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Zk5rVCtZZUJORTRoQ0pPb2IzWnlpWThxTEZYaUlCanVFbzJDQmZCM3o0ZGhI?=
 =?utf-8?B?MkNGNTU1aGlPSFptY3k1WHBzV1VMSTNiSE9RaWRtMjRUZGxhQUJRckxteFh1?=
 =?utf-8?B?OW9abXlSTHpWcHBYandnZGJNUHJEUFZoVnFIb3VrOTYzUmZxbjNLWmQxSHo4?=
 =?utf-8?B?T0RpT3ZBUXZhRy9maHN2YTYvaGJmcHFtVVJnT2lvVnV1UU96MStiZlJGbHVQ?=
 =?utf-8?B?aVhIMExrMElNNDM5Q3phOWIzQk50Wm4xc1JHeTIvMzhJQ1VTL2YwdWhYMW1M?=
 =?utf-8?B?STRtdDB3S1BldlphdW9yTGZhNU5oS2x0VnhXWnpoVGc0OEtGZ2w3S3Y1cXhG?=
 =?utf-8?B?VVFNQVZGZmhWSnVJY0R4REpaZkJvVlVhdTJNZ0lVSCtQQnFpbG5ja2RmUHVG?=
 =?utf-8?B?enhDK2l4TzdMSHZSeVNuM25IRk13cXhSUC9MemxEZzlMUSt5T1lYcTN1NHZS?=
 =?utf-8?B?aVJ3WmhDeUc1aXd6bHZrVTBHYWxlZ0w4NHBEYTZDQ0EyVjdScVplRXhqY2g1?=
 =?utf-8?B?bVA2R1hpUlpjQkJLMFh1d0poMWo1bEgzK0VaMlBpakJLZURsQUNwUGk2azJx?=
 =?utf-8?B?ZlhtdWlxUlpOV0R5M3MzanZWdmVwbDVCQkNxZy9ZdGxab2Q0YmJnRFozdXg2?=
 =?utf-8?B?TjdESEY2dkR0R2V6L0J5eGNqN1FsSm04TEh0ZndDOTFKdUlDdGN6VXh5WE9h?=
 =?utf-8?B?YTh0dklrVXZhL3prTXFjL2FCZGtQVnBBdTlPbHdjTVpVM2xLSG5kTVAwQ0dl?=
 =?utf-8?B?d05PUGx4MFdPdnFuMXhJUk5kMFhmR0pYeXdSRzNhdENwalhRT3ZYTGdXdUhY?=
 =?utf-8?B?V0dqeTRGNHBYSzdXYWlvK3NPMWF5S0JkNzhmV2xSZ3ErSjZwYmlvK0dmRjla?=
 =?utf-8?B?UHR2bCtKeDJIVWZiTlFqN01HYWx4NVViUHJMSGNHUGo5cUszOE5iM2JrWUJZ?=
 =?utf-8?B?NnkrSy9hWnp3QTluNVZvZjE4eFdvd09wRHl1V1lXTGFBYnBoZW9UWDU5MWt5?=
 =?utf-8?B?R0tXL1REOENkYmYycDljWHhlSGNZVDh3TXNJU2NzUS9UQU1maWwxWG5wYTJL?=
 =?utf-8?B?dk9JQUl3MXBrZjhva1Z5TFp3UmdhNHNObUdiRXNzUGFCWE5rZmJoU091ZHVq?=
 =?utf-8?B?WmJFbDN3bkZwRGRCTUhES2dGOEhSSk51ais4T3lJOGJDV2VuamJ0QzJQL28y?=
 =?utf-8?B?dDNyaGJTVXljaXR2L05TYVhsOGZxV3VlZjVTbFZLbDFYYVJzeWVXRmdkeHpY?=
 =?utf-8?B?RlRhek55UXF5dzE0dWUrRHZkejU2R2NITnV1b1JRa0h4Uk0vQW5RMjNjQlFX?=
 =?utf-8?B?MDN1dEo5QzltU2JMeDR6VDRlNlB5T0hrSHk0aVJDd0VveEZ3ZlJjZkRkTkk1?=
 =?utf-8?B?bzRhei81SUJTTGpQTDkrZGlYOHptSGplZXE4MGdMdGdvVXZQd044YnEyQ1RL?=
 =?utf-8?B?dFJzYlkwWUxEYWtvM0RiSzJ2ODR0bi9yc0doODcrWG5NVC9YVEtSNXo2TkZS?=
 =?utf-8?B?VU5XU1p5aVVDYmF2c2JTZVBLNG5xTHMyNHVtZUI3TStXN2NzWUl4cDRaYXVz?=
 =?utf-8?B?ck5rdnlmVHhna2JleHR4U1F0TGFSVWZzSFlsenRqMzhMNG1QTDIzMnVkRjFY?=
 =?utf-8?B?VVFyVkYrUEQyTStmZlpESFJ0VkhuM2k3eElKb0dHVEZhY2hIak1ONFRDdncx?=
 =?utf-8?B?YlZGVkdhT2Q1NDI3a1ZreHBIYnhQRUlKY1lVK1ZaaG9ZeE1mYXN3bm1qdkM4?=
 =?utf-8?B?TXpacFBiZ3ZXU1BldG1xYVNwekhsRXB5YVFYc3pCN21hQXZQNlJZTHVvQ3BE?=
 =?utf-8?B?SzBiMGdJR0xtOHVMT0RBMDdoTkdBRmIveWxoZCtsK1RsOFRZMExMNTd3bVRU?=
 =?utf-8?B?bFA2M0ZRL3VBbVRhdm1xbUorRGRNMTZ6bkJmQU9PRWtpWURmcTlkYXY4M0ZV?=
 =?utf-8?B?RDY5azZXQ08xM2sxUEZQSDhhdFRpZTVvMWNzTEVUb2hvRzUwSElQTDFxcDUy?=
 =?utf-8?B?SmFWM1BIbE1QZzZCcDdxT0VpckpXazlISHAvVjVsTTZiTzlaV0YzSHBKSjlN?=
 =?utf-8?B?enF5cEVNclVWRHZ0OU52OU81bTdhbWdGdHNXdmFBK3IrTXBLd085d2o1U092?=
 =?utf-8?B?bGkveUlrM2hlRG05OUUvWkVsVERVajU3ZFVleUNBMlJUSDNqRkVsbWxDUG44?=
 =?utf-8?B?MzlvVGIvdUxuODVWZmVoVXFoZmRVaXZxYTVVWHRvTnBjeTlzb09ZeE1IV2tt?=
 =?utf-8?B?YXJEVDQ2Vitua0xxSi81NGdvUDFpVFdjRms2b1UvbTVPeXRxazRkdTd6UGF1?=
 =?utf-8?B?UEtsVUhhbmVoc2g1czY0MTMxUGxjR2tMVHdnMmFlVzRqdFRmc0dvQT09?=
X-OriginatorOrg: amlogic.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 047be5af-5220-404e-fdda-08de5754aaa3
X-MS-Exchange-CrossTenant-AuthSource: KL1PR03MB5778.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2026 12:17:09.4941
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 0df2add9-25ca-4b3a-acb4-c99ddf0b1114
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JuJWo8yTJuHuDUvKCgVaQE9j4zMdhchIvaj03pKJpBqiFBtdAouT8tkU8vlY6ocszc4K77wZfcQeKxPAIB9osg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR03MB8042

Hi Jerome,

On 1/14/2026 5:25 PM, Jerome Brunet wrote:
> [ EXTERNAL EMAIL ]
> 
> On jeu. 08 janv. 2026 at 14:08, Chuan Liu via B4 Relay <devnull+chuan.liu.amlogic.com@kernel.org> wrote:
> 
>> +static struct clk_regmap a5_rtc_clk = {
>> +     .data = &(struct clk_regmap_mux_data) {
>> +             .offset = RTC_CTRL,
>> +             .mask = 0x3,
>> +             .shift = 0,
>> +     },
>> +     .hw.init = &(struct clk_init_data) {
>> +             .name = "rtc_clk",
>> +             .ops = &clk_regmap_mux_ops,
>> +             .parent_data = a5_rtc_clk_parents,
>> +             .num_parents = ARRAY_SIZE(a5_rtc_clk_parents),
>> +             .flags = CLK_SET_RATE_NO_REPARENT,
>> +     },
>> +};
>> +
>> +#define A5_PCLK(_name, _reg, _bit, _pdata, _flags)                   \
>> +struct clk_regmap a5_##_name = {                                     \
>> +     .data = &(struct clk_regmap_gate_data) {                        \
>> +             .offset = (_reg),                                       \
>> +             .bit_idx = (_bit),                                      \
>> +     },                                                              \
>> +     .hw.init = &(struct clk_init_data) {                            \
>> +             .name = #_name,                                         \
>> +             .ops = &clk_regmap_gate_ops,                            \
>> +             .parent_data = (_pdata),                                \
>> +             .num_parents = 1,                                       \
>> +             .flags = (_flags),                                      \
>> +     },                                                              \
>> +}
> 
> I wonder why I bothered reviewing v4 ...

Regarding the comment you made on V4, my understanding is that you were 
just teasing ... In the next revision, I will change this part to use a 
unified macro.

We may also consider adjusting the "MESON_PCLK" macro later by removing 
the SoC prefix from the clock name, so that it is consistent with the 
naming style used by "MESON_COMP_SEL" / "MESON_COMP_DIV".

> 
>> +
>> +static const struct clk_parent_data a5_sys_pclk_parents = { .fw_name = "sysclk" };
>> +
>> +#define A5_SYS_PCLK(_name, _reg, _bit, _flags) \
>> +     A5_PCLK(_name, _reg, _bit, &a5_sys_pclk_parents, _flags)
>> +
>> +static A5_SYS_PCLK(sys_reset_ctrl,   SYS_CLK_EN0_REG0, 1, 0);
>> +static A5_SYS_PCLK(sys_pwr_ctrl,     SYS_CLK_EN0_REG0, 3, 0);
>> +static A5_SYS_PCLK(sys_pad_ctrl,     SYS_CLK_EN0_REG0, 4, 0);
>> +static A5_SYS_PCLK(sys_ctrl,         SYS_CLK_EN0_REG0, 5, 0);
>> +static A5_SYS_PCLK(sys_ts_pll,               SYS_CLK_EN0_REG0, 6, 0);
>> +
>>
> 
> [...]
> 
>> +
>> +static struct clk_regmap a5_gen = {
>> +     .data = &(struct clk_regmap_gate_data) {
>> +             .offset = GEN_CLK_CTRL,
>> +             .bit_idx = 11,
>> +     },
>> +     .hw.init = &(struct clk_init_data) {
>> +             .name = "gen",
>> +             .ops = &clk_regmap_gate_ops,
>> +             .parent_hws = (const struct clk_hw *[]) {
>> +                     &a5_gen_div.hw
>> +             },
>> +             .num_parents = 1,
>> +             .flags = CLK_SET_RATE_PARENT,
>> +     },
>> +};
>> +
>> +#define A5_COMP_SEL(_name, _reg, _shift, _mask, _pdata, _table) \
>> +     MESON_COMP_SEL(a5_, _name, _reg, _shift, _mask, _pdata, _table, 0, 0)
>> +
>> +#define A5_COMP_DIV(_name, _reg, _shift, _width) \
>> +     MESON_COMP_DIV(a5_, _name, _reg, _shift, _width, 0, CLK_SET_RATE_PARENT)
>> +
>> +#define A5_COMP_GATE(_name, _reg, _bit, _iflags) \
>> +     MESON_COMP_GATE(a5_, _name, _reg, _bit, CLK_SET_RATE_PARENT | (_iflags))
>> +
> 
> At the top. like C3 and T7

Except for A5_COMP_SEL, which differs slightly from T7 due to the 
additional "_table" parameter, the other macros are consistent with T7.

I also asked for your feedback on this in V4 and received your 
confirmation. Is there anything here that still needs to be updated?

[...]
