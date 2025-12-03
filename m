Received: from mo-csw-fb.securemx.jp (mo-csw-fb1120.securemx.jp [210.130.202.128])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBBC42DE707;
	Wed,  3 Dec 2025 10:24:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=210.130.202.128
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764757484; cv=fail; b=Y+htaeepnCPbc1C0oUrs4k3uwCPgkf1Armi5yJHO2z7r3aU2Aii67Kw0Ht/WFCaiWASjnnaW/qgx4rqzxlxd3MYhCMdanFgiBFODoaIpdYuk4kNWs/yry5ZEQ2x95P8AmNWNM+4BNifam9MrYGBtbuG/MVYd4x9wZGYGmwvZqCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764757484; c=relaxed/simple;
	bh=KCFljJgDPKOW009bUfml3CUfZ+FL5yq9dvKv//d6Bqs=;
	h=From:To:CC:Subject:Date:Message-ID:References:In-Reply-To:
	 Content-Type:MIME-Version; b=jKgY793VPjizo+ZdvaO4y0Bu7h3f7/B1PYUvQQsnDczt3YDxRck0WyhrJvMoiqC4Ps0nf6OVFn6cKb6HGObeaoKjnGoK95e3iV7Txxm9eECEEU+ctNYVro7ZiEeeiLheUppTJdMsnmAo5IRDkoJ73crM2CgX46EDdxNEfT2UZ3o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.toshiba; spf=pass smtp.mailfrom=mail.toshiba; dkim=pass (2048-bit key) header.d=mail.toshiba header.i=yuji.ishikawa.x51@mail.toshiba header.b=a3ZrRHlZ; arc=fail smtp.client-ip=210.130.202.128
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=mail.toshiba
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=mail.toshiba
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=mail.toshiba header.i=yuji.ishikawa.x51@mail.toshiba header.b="a3ZrRHlZ"
Received: by mo-csw-fb.securemx.jp (mx-mo-csw-fb1120) id 5B37uGiG390003; Wed, 3 Dec 2025 16:56:17 +0900
DKIM-Signature: v=1;a=rsa-sha256;c=relaxed/simple;d=mail.toshiba;h=From:To:CC:
	Subject:Date:Message-ID:References:In-Reply-To:Content-Type:
	Content-Transfer-Encoding:MIME-Version;i=yuji.ishikawa.x51@mail.toshiba;s=
	key1.smx;t=1764748535;x=1765958135;bh=KCFljJgDPKOW009bUfml3CUfZ+FL5yq9dvKv//d
	6Bqs=;b=a3ZrRHlZxT+WGdbb1SmZlJCCLHlByeuFymJJvcdoqdDzBy6y+7eWXvHNQwvsLyO/mGXbK
	qq/tFfUUY132B4eZm3a2tL/v7+R1e/yKUecgX3a3wg1fIEtz2V+Hf/eX9FiDBS7JLx8/dLPyW0kl8
	LG8xizBnOOPd5fDaTwoeTyJ1/vbLMUUKqDZzcSZKQprNU9dBf2bC42lJ1TOVf9ZKBcrpvGkm2kCXN
	3+GW3H+W7WqODoZnRWOye9rB0cPTo+yQd8PTFYVNe3kKbjcwVJbrne/wkwJ0MGieiBHklSRYfGzgq
	Y8tLvxfIwS62hWK3+zb4MekA7s8VQMwFggVH1oEe3A==;
Received: by mo-csw.securemx.jp (mx-mo-csw1120) id 5B37tYf32437920; Wed, 3 Dec 2025 16:55:34 +0900
X-Iguazu-Qid: 2rWg8Je8ecKBFje3ZA
X-Iguazu-QSIG: v=2; s=0; t=1764748534; q=2rWg8Je8ecKBFje3ZA; m=MsgUxufFR8heQXsHvxBYgIKF2l7ySL1VHzDofRa1ljM=
Received: from imx2-a.toshiba.co.jp (imx2-a.toshiba.co.jp [106.186.93.35])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	 id 4dLqgn0Tggz4vyy; Wed,  3 Dec 2025 16:55:32 +0900 (JST)
X-SA-MID: 55951529
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gsrDOIpeuUK5mtXo64rczCzqTAV3/Mn5I5j+MZKAR8vDGKw/brLnMLZoa1MlCxRwely8Gpn0WfQSdl2f7q869WWkysMRvoJqPznA1O3nYdCkLrK8sZZpmlWvUxiqcejGBaqmQmCA7A5a+0gvASIU0O9w8PSah9j+IvEwhgS7XeSWjEJ69LGgCmG8luPqpVQJgZCZWHkZt4LK2daVo78WTh+dGGqQ80O13hYgGIcvYmKtN/FH8t/+1anXft+1OOtZlgnvPDWDKYqNV1R4r9CWDNPaJfrHxY+yGDV92IwZcL2jwetKafbf+oWCwgOsgv67JYY1wogLlCtBoAx2ZOnyYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KCFljJgDPKOW009bUfml3CUfZ+FL5yq9dvKv//d6Bqs=;
 b=wtlWFCtNofMlZcH560xjS/G9Q78X0yzxK3Vb310n+xysAxdziTwa66TPrc+qm5OTq3Axu6pAVrWkebRt9zpEbHVF++jy+PPunERf8pRwm4ERNtJyc/BzAS1vx+Ylqw8bKHNAN+k3w2dDaML8w0cPvY2btwU4CiprjtgtqR3F0846MUXZkJB03lYbGreZfdwk2iakVX05pWR/ku2z4f6GUo2Y6ql51agx8fThOuBURaivzBGlqW597pmMO0butP8/2MRhKVOYwP1PTBIUv++KWujy2rSfyr1fr3vKcaU7CfP6rjgNCBZge7lidvgFcOXnAOSVv1Zd651N2vQAECG8rA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=mail.toshiba; dmarc=pass action=none header.from=mail.toshiba;
 dkim=pass header.d=mail.toshiba; arc=none
From: <yuji.ishikawa.x51@mail.toshiba>
To: <sboyd@kernel.org>, <conor+dt@kernel.org>, <krzk+dt@kernel.org>,
        <mturquette@baylibre.com>, <nobuhiro.iwamatsu.x90@mail.toshiba>,
        <p.zabel@pengutronix.de>, <robh@kernel.org>
CC: <linux-clk@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>
Subject: RE: [PATCH v3 2/2] clk: visconti: Add VIIF clocks
Thread-Topic: [PATCH v3 2/2] clk: visconti: Add VIIF clocks
Thread-Index: AQHcVTUKS+6qOuKQNE+9tpctRd56ZrT8epEAgBMtRMA=
Date: Wed, 3 Dec 2025 07:50:24 +0000
X-TSB-HOP2: ON
Message-ID: 
 <TYYPR01MB1225694BE61A6CB7A74B44EF5C3D9A@TYYPR01MB12256.jpnprd01.prod.outlook.com>
References: <20251114070512.855008-1-yuji2.ishikawa@toshiba.co.jp>
 <20251114070512.855008-3-yuji2.ishikawa@toshiba.co.jp>
 <176369381444.11952.3963774406317821182@localhost.localdomain>
In-Reply-To: <176369381444.11952.3963774406317821182@localhost.localdomain>
Accept-Language: ja-JP, en-US
Content-Language: ja-JP
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=mail.toshiba;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYYPR01MB12256:EE_|OS3PR01MB7063:EE_
x-ms-office365-filtering-correlation-id: c4be432b-25f1-4763-c73a-08de32409e3b
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|7416014|38070700021;
x-microsoft-antispam-message-info: 
 =?utf-8?B?OWVZUzJockk4Wm9ubHlEOE9OeCtXbHlLR3kvRklGVityOG9XWjA5MmlBcXlo?=
 =?utf-8?B?UzZjZUJwQk5rSDR5MG5xTnE5SGlWNVV4Ynp5NTVJZnRTcjRLNkFPbVp1bWJi?=
 =?utf-8?B?RkNoNkt1UGllRDdldm15K0VIZWhBSWQ4K3RPUXlZbXk2UkZoV1Fyb3k1RlVz?=
 =?utf-8?B?SVhRNmt5SDBNL2lkMzYwV1JONjlPeXkyVFVncUw1aEszWEdIelFxOFc5Y3p1?=
 =?utf-8?B?UXpwVnpnMVM0QXdEVjNnRFhKTlViZUVYT3hHYUtHajM1L0o2Z0MzZEwwK2d5?=
 =?utf-8?B?SmFUUXA3WWlRYzdaTktuT2RybE1PeHAxZFkrQkwxQnVHQktjS09vdVJsNUxu?=
 =?utf-8?B?R1NqaHVRZFRZQlZhVytiRkpGa0lsQi9YZ2JmWDFyRVIxbTY5c0FhQ1JMeDNZ?=
 =?utf-8?B?MjQyM2IvbnNHTk5CZC9vNjkrcGxHYlpDd25COFZySU1WWGh4UFNrMWZwc09o?=
 =?utf-8?B?bkRRWEMyemFPY24vSklZRXJJQ3RKRHdmNVdzRDd5aktRaWhxNmF6d1duZDcz?=
 =?utf-8?B?YlI1MXZmOUh5MFVSSkEra21aRW85ajFoZFZUTUpBSEsvOE56cU1ITW5oWnd0?=
 =?utf-8?B?RmhJNStqZWlTcmx0aFFJMW9jaGZzbGt6ZHVkSkZrM3BtMDhUdWhwa2p1M3R4?=
 =?utf-8?B?VnRKS0doQXY2RGd6WHkwRUw4M2lRb0wwVW9vV29sWG4xa2d0dDNQenoyUmVN?=
 =?utf-8?B?QTdTZEFjQlAxWmtqR3NsSnVEWFNaWHVZYXlZNFJmRzQ3eW1VQVBwd2ZYblpl?=
 =?utf-8?B?Q2VkOXQ1NDRiWWFCdUhERXhTSzhhbjlLUUxHTnpSM2FJM1IzYzBXcFBKYXVH?=
 =?utf-8?B?S3lOWTRQaTZqRWNWejh6OE5xMXUyajRuZUpDTGpiQjgrQXgrZ1pIako4L0VP?=
 =?utf-8?B?TFAycWIrNkFNQ0RENExVYkRQc2hZTlZvMkJxaHZEb1gzZjhrVWNvL3NFUUlr?=
 =?utf-8?B?NUJpUll6TXpzM2NULzAzOXFaa0dWUjY4cDlqU1QzQTJiU3g0WGlSMm10UXhx?=
 =?utf-8?B?dnExd0dTSktNT05iMzh4a3YreFBWaVcrLzNlaDBWOExQNUwwN253eVY3V0I5?=
 =?utf-8?B?YS9yUEMvYWVCazBMRDBQVlVyU0twa3VzYUNpcUFGQVlUTmpCM0kzQW9SWnZr?=
 =?utf-8?B?ZUFxVlZySWcrQmwxV0xJWHpKSk9GRWdIbUxEeUM1VTdZbklDVmtaS1ZuNDJD?=
 =?utf-8?B?OGIxbUdTQW1RN0NGaWRrWmIxQ3gxMkZCMVh2dHZwRUQ4bGhXYmVjdGxnSFND?=
 =?utf-8?B?bUkyZmpRUnI2MVlmdTBvdjhVTHlIK2hWUjA2dWUwdmJFeHpvWjdUSmdUUnZw?=
 =?utf-8?B?SFdBM0pjS0FxempiOUpQdi81VmdRUHRITEFOVHBvK1d5dTBWWlBQMFdjck1m?=
 =?utf-8?B?ckNpZVIzR3Ywb3NlTnhzQUg4MkowaURVOTk4VE9MMm1GSVIrZGFnblpGYWxF?=
 =?utf-8?B?d1ZIVFFjMDZPVE5FZTU1MEt6Yk1tUnFsNGc0TzhPeUpMQzJPd2lkMCtnZDUr?=
 =?utf-8?B?Uld0Ym5qRWdiV0lZTkExd3VEZ1RBc1M2RUF3aXVPUC9DcG41QWdqUUpRaVdK?=
 =?utf-8?B?ZXN5NlVkMi80WjR3UE1xTExGMHNzOGpOVTYvcEtVazNYU281elFNVHZubEJV?=
 =?utf-8?B?VWR2QmpiaEliMlBYeEVIdEdSZEFjZ3M5cWRIODVXalVMYlZOcjJ3dmt4T0Q0?=
 =?utf-8?B?emN5enpLRWtTSTRLeUUvUU9udWlEQUpxU1gwUXFVKzNHNURkWHhhWVk2RW9V?=
 =?utf-8?B?eUNhMllOcWQrQkUvYXJDMjZZVGRIOTRRVFhFNkdDTjlvczNNdVpML3ViQklB?=
 =?utf-8?B?T3k5YWJMVHRkSCsxSVF0b1pWWFYwQnA3USt5ZWNEUFRpc1lpSlNSWHJlcWFk?=
 =?utf-8?B?WFVNV01aQUZZNW1Ma3BZVXRhV1FaTCt3cTE5M3lGZ3J0dE1KSUNEOUdaU1Jq?=
 =?utf-8?B?V0ZHMWRld1BXTzdpVitGcEc2UFhuZnlPWS9BQ2d6cFFGUjZvWXovRUJSb1Vy?=
 =?utf-8?B?ZEYxT3ZkUTJGRjl4Q3VOVXZneXFHOGtwOEZCWmwwV2JZRnV6Y1Rtek0vcjVq?=
 =?utf-8?Q?f+DBpK?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:ja;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB12256.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7416014)(38070700021);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?utf-8?B?eGptbWM5WmJqOUtzdnFEWTI1VlQ5ZC9wUm9IakZOMElhcUI2dy9Mbnd1MDNu?=
 =?utf-8?B?S1FZaWhpQ1VSdTNtbmxTdFdkNnRMZ0JISzk3WHQ5Q2oyTDFldnlwanMweHN1?=
 =?utf-8?B?L2J3TEJpYVlKNmtmbk5yZnZ0UEsrUVFTUGhhMXVSVWVKeFlDYWxFWi96NDg4?=
 =?utf-8?B?ckloZHZNZ1VBVldKdnBVclBUWmFkbmdEYkk1KzFYSkc4aFd0dnRWMkF4RFdY?=
 =?utf-8?B?dThOb1NjOSthaXpWVUdaY2JNYzIrdmJZZVV0ZE5wRDBydE5aVVVjVlIvRnJY?=
 =?utf-8?B?ZFlvREhCVVlZMGFuVXo2SkVwRE1yWGFpM01SS1B4VDM2RFNXNVRWVnQ1SGVF?=
 =?utf-8?B?RUM5RFF4SVVWMHNEQzM0TjNVVkhQUEJWZUdaZ3pqUmNQYW9LYlF6eHBtSXI0?=
 =?utf-8?B?aGw3aGgyR0Y4SEh2ZkZKTlUySGpWQjJyN01oWG9ERExiY1JlY2c2TEh6VnNm?=
 =?utf-8?B?YnBnQVUvU2ZzK254cHk4NzZYR25BTjl0RGE4Uzk5aUhrQUhwaURWWjFjcks1?=
 =?utf-8?B?YVdmcEpHVWQra21RbzVqUWJYMTlvL25USWZtQ2t6eDJyMGxuZGYvaGx1Q1pv?=
 =?utf-8?B?dWxPZmFxb2R0eC9vZElvNG9lMkRnalgxZGw4TTVlL2hYaTN4QVUycG94WFpL?=
 =?utf-8?B?cXI0eEUyRW90MXA2Ny90UjVGSGk3WFQ1RjB3SEljUk84YzFUOFhuK29WSmIx?=
 =?utf-8?B?Q1ZTSTVML1cwaGZIUTdrQmxjZHpqdkZGTlR5TzU4bEJHWkE3VExIZE9IZkxC?=
 =?utf-8?B?M21aNXZvRXNyQjV2VER5RWN5WUhPSkR1NE9Yb3ZZcGRxMHkwTEhzNHFzemNX?=
 =?utf-8?B?VjNlVGxCdEJCWmxFYUdMYXY5aU9IVnZUZ25sTUM3WUFBcmtoakREa3MzZzk5?=
 =?utf-8?B?UC9qYkRFQXQ3Z3JwaXR6MXgvNnBxVWdPaGV1am9qQysrZ09KM3Q3V2s0ckw5?=
 =?utf-8?B?NmZSb3J4TVBRVVNOUnZLUWNpdFI5ai9sN2l3WVh3SDFTcUxXYTg1d1h4OGJN?=
 =?utf-8?B?eUY4ZW1ZVG13dVVJMWNFd3JWL28yMTRLbk15cUQ4MmpRNmFGS1E2NTZaNS8z?=
 =?utf-8?B?Z050cTVkTldFa05mamNRMVN3Q1VMVzcyMXJRUThaNkV3THlmbUhUUmY2RXZy?=
 =?utf-8?B?T0FJWGc3Q3hrc0VoM2hwL0RHaGg5bmpsUlN3N1c5b1UvYUc1V1pyckp4V2x4?=
 =?utf-8?B?eTkwWEZzOXVBRWZLMU04MzQvQm9rNFE4TE9hc3ZjcnFRUXJJdFRVZnZIU1VV?=
 =?utf-8?B?N2VhYmNwaGxOVUdiYW5oWFk3UTRKaDUwRktBdDRyWjJQdWdyUTdIV2g0ZnZv?=
 =?utf-8?B?Z21GTmZYS25pK01RckxOQmxOd2R3Mm1hWStsbW5XbFdZUkEvdEtwUmJNQnhl?=
 =?utf-8?B?bFZDWlY5c2tQNysveTdXOVpTeWs4dzdaMjRwWkxObkd4SEJwTjJWbnllbS9S?=
 =?utf-8?B?WmJmVzZ3U3prV1VGejc1M2tEMmxPUlBHWWdFZ0hQMGdtSjF1aHNsZTRkYmht?=
 =?utf-8?B?d2ovb0JIVFdwTGFqQVFZcHdDQldtVTJuOXBqMG00WHFKUUltT2Z4QlNuSjht?=
 =?utf-8?B?K2lTWnNScjAydzd6aUpFWkxub0lKY2FXZVYxdVVFbkpMQ24rOTFYcHVPME10?=
 =?utf-8?B?MTZkOUxjcHUrdUlIMWMydmEyT1JmSVJTNEJoUm56Skg1WmpJZEdqTSs4UVpt?=
 =?utf-8?B?VGRidVdocFZvdGtTUzB5K0hjbzJFeDJ2aVNXYWFMS3ZRSDZhUGRpS1hmbkdj?=
 =?utf-8?B?di9FU0JzSG8rYkZOeXpXQi9XOVdLTFplUU1zSHIxYllaZmFmMDRPZHM0OEdN?=
 =?utf-8?B?SCs5MjFza1ErNmJEdmR2UXZrMzRqTHhvTkJTL3Z2OWNzYmNzUE02NU90NnF1?=
 =?utf-8?B?OW1pNlhSTktlNnloMS85czBIM1lXUWk3enUzTHo0eldCVzZWUGdpUnE3d3hF?=
 =?utf-8?B?L2trVHc3S1I0N0poMUloR2ZxdFRGaXJpUU9DVVdFUmwvdmZWd240bFl6eGVk?=
 =?utf-8?B?c3U5MnZaQlFWaE9pQUw0NnFpbWcyVXRFWTRQZVl0eDNldno0ZHJzLzRFR2tn?=
 =?utf-8?B?OHdwblBGeHd1eTRmQnN3U0RCOHVpcUorRjM4dndCS3R0YktyTlg5a1dTQ3pI?=
 =?utf-8?B?NXJlRE04TURYZ1FJL1BnYXAxSmJNKzg5MjdpUXcxSHlycCtBblVZYldQaFph?=
 =?utf-8?B?cXc9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: mail.toshiba
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB12256.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4be432b-25f1-4763-c73a-08de32409e3b
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Dec 2025 07:50:24.6663
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: f109924e-fb71-4ba0-b2cc-65dcdf6fbe4f
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: O3832Jdth7plE35aPxwFY9sO4DqyHM+U7M5s7w5h7lJgA9N9h3oegtX3TZEG1kue2Odva9B5Xe9M76eFcJz6O0Q8N850r2GUH7p0FnpN/r4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OS3PR01MB7063

PiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQ0KPiBGcm9tOiBTdGVwaGVuIEJveWQgPHNib3lk
QGtlcm5lbC5vcmc+DQo+IFNlbnQ6IEZyaWRheSwgTm92ZW1iZXIgMjEsIDIwMjUgMTE6NTcgQU0N
Cj4gVG86IENvbm9yIERvb2xleSA8Y29ub3IrZHRAa2VybmVsLm9yZz47IEtyenlzenRvZiBLb3ps
b3dza2kNCj4gPGtyemsrZHRAa2VybmVsLm9yZz47IE1pY2hhZWwgVHVycXVldHRlIDxtdHVycXVl
dHRlQGJheWxpYnJlLmNvbT47DQo+IGl3YW1hdHN1IG5vYnVoaXJvKOWyqeadviDkv6HmtIsg4pah
77yk77yp77y077yj4peL77yj77yw77y0KQ0KPiA8bm9idWhpcm8uaXdhbWF0c3UueDkwQG1haWwu
dG9zaGliYT47IFBoaWxpcHAgWmFiZWwNCj4gPHAuemFiZWxAcGVuZ3V0cm9uaXguZGU+OyBSb2Ig
SGVycmluZyA8cm9iaEBrZXJuZWwub3JnPjsgaXNoaWthd2EgeXVqaSjnn7MNCj4g5bedIOaCoOWP
uCDilqHvvKHvvKnvvKTvvKPil4vvvKXvvKHplospIDx5dWppMi5pc2hpa2F3YUB0b3NoaWJhLmNv
LmpwPg0KPiBDYzogbGludXgtY2xrQHZnZXIua2VybmVsLm9yZzsgbGludXgtYXJtLWtlcm5lbEBs
aXN0cy5pbmZyYWRlYWQub3JnOw0KPiBsaW51eC1rZXJuZWxAdmdlci5rZXJuZWwub3JnOyBkZXZp
Y2V0cmVlQHZnZXIua2VybmVsLm9yZzsgaXNoaWthd2EgeXVqaSjnn7Plt50NCj4g5oKg5Y+4IOKW
oe+8oe+8qe+8pO+8o+KXi++8pe+8oemWiykgPHl1amkyLmlzaGlrYXdhQHRvc2hpYmEuY28uanA+
DQo+IFN1YmplY3Q6IFJlOiBbUEFUQ0ggdjMgMi8yXSBjbGs6IHZpc2NvbnRpOiBBZGQgVklJRiBj
bG9ja3MNCj4gDQo+IFF1b3RpbmcgWXVqaSBJc2hpa2F3YSAoMjAyNS0xMS0xMyAyMzowNToxMikN
Cj4gPiBBZGQgdGhlIGNvbnRyb2wgc2VxdWVuY2Ugb2YgcmVnaXN0ZXIgYml0cyB0byBoYW5kbGUg
dGhlIGNsb2NrcyBhbmQgdGhlDQo+ID4gcmVzZXRzIG9mIFZpZGVvIElucHV0IEludGVyZmFjZS4N
Cj4gPg0KPiA+IFNpZ25lZC1vZmYtYnk6IFl1amkgSXNoaWthd2EgPHl1amkyLmlzaGlrYXdhQHRv
c2hpYmEuY28uanA+DQo+ID4gLS0tDQo+IA0KPiBBcHBsaWVkIHRvIGNsay1uZXh0IGJ1dCBzZWUg
YmVsb3cuDQo+IA0KPiA+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2Nsay92aXNjb250aS9jbGtjLXRt
cHY3NzB4LmMNCj4gPiBiL2RyaXZlcnMvY2xrL3Zpc2NvbnRpL2Nsa2MtdG1wdjc3MHguYw0KPiA+
IGluZGV4IDk0YTczNmRhNi4uMWUyZThkNjQzIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvY2xr
L3Zpc2NvbnRpL2Nsa2MtdG1wdjc3MHguYw0KPiA+ICsrKyBiL2RyaXZlcnMvY2xrL3Zpc2NvbnRp
L2Nsa2MtdG1wdjc3MHguYw0KPiA+IEBAIC0xOCw4ICsxOCw4IEBADQo+ID4gICNpbmNsdWRlICJy
ZXNldC5oIg0KPiA+DQo+ID4gIC8qIE11c3QgYmUgZXF1YWwgdG8gdGhlIGxhc3QgY2xvY2svcmVz
ZXQgSUQgaW5jcmVhc2VkIGJ5IG9uZSAqLw0KPiA+IC0jZGVmaW5lIENMS1NfTlIgICAgICAgIChU
TVBWNzcwWF9DTEtfQlVTTENLICsgMSkNCj4gPiAtI2RlZmluZSBSRVNFVFNfTlIgICAgICAoVE1Q
Vjc3MFhfUkVTRVRfU0JVU0NMSyArIDEpDQo+ID4gKyNkZWZpbmUgQ0xLU19OUiAgICAgICAgKFRN
UFY3NzBYX0NMS19WSUlGQlMxX1BST0MgKyAxKQ0KPiA+ICsjZGVmaW5lIFJFU0VUU19OUiAgICAg
IChUTVBWNzcwWF9SRVNFVF9WSUlGQlMxX0wxSVNQICsgMSkNCj4gPg0KPiA+ICBzdGF0aWMgREVG
SU5FX1NQSU5MT0NLKHRtcHY3NzB4X2Nsa19sb2NrKTsNCj4gPiAgc3RhdGljIERFRklORV9TUElO
TE9DSyh0bXB2NzcweF9yc3RfbG9jayk7DQo+ID4gQEAgLTMyLDYgKzMyLDEwIEBAIHN0YXRpYyBj
b25zdCBzdHJ1Y3QgY2xrX3BhcmVudF9kYXRhDQo+IHBpZXRoZXJwbGxzX3BhcmVudF9kYXRhW10g
PSB7DQo+ID4gICAgICAgICB7IC5md19uYW1lID0gInBpZXRoZXJwbGwiLCAubmFtZSA9ICJwaWV0
aGVycGxsIiwgfSwgIH07DQo+ID4NCj4gPiArc3RhdGljIGNvbnN0IHN0cnVjdCBjbGtfcGFyZW50
X2RhdGEgcGlkbm5wbGxzX3BhcmVudF9kYXRhW10gPSB7DQo+ID4gKyAgICAgICB7IC5md19uYW1l
ID0gInBpZG5ucGxsIiwgLm5hbWUgPSAicGlkbm5wbGwiLCB9LCB9Ow0KPiANCj4gVGhpcyBpcyB3
cm9uZy4gVGhlcmUncyBubyAicGlkbm5wbGwiIGluIHRoZSBEVCBiaW5kaW5nIGZvcg0KPiB0b3No
aWJhLHRtcHY3NzB4LXBpc211ICdjbG9ja3MnIHByb3BlcnR5LiBQbGVhc2Ugc2VuZCBhIGZvbGxv
dyB1cCBwYXRjaCB0aGF0DQo+IGNsZWFucyB1cCB0aGUgdXNhZ2Ugb2YgY2xrX3BhcmVudF9kYXRh
IGluIHRoaXMgZHJpdmVyLg0KDQpUaGFuayB5b3UgZm9yIHBvaW50aW5nIHRoaXMgb3V0LiBJJ2xs
IGNoZWNrIHRoZSBkcml2ZXIgYW5kIGNvbnNpZGVyIGhvdyB0byBjbGVhbiB1cCB0aGUgdXNhZ2Uu
DQoNClJlZ2FyZHMsDQpZdWppIElzaGlrYXdhDQo=

