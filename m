Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.43
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795015340;
	b=IDNJQGyJb/HZPGqmReAiejA8E5Ljcv/kxCsjkH51aFyJA6u20odSKziY/6mEaOFqEk2d
	 7wLZSKRzfIxsMSoNhZZYqGPhtDTM++gf14HzMq9aHgCmi6WxMLfapiF0kf7Mq7wU5yVjL
	 URG6XrUxzzaFzF3mNyy0zxIlM/wimJfEN5+66Qqmxx4oGkE9lm1vO3YwlkPfnRz5YYukO
	 ZxPpIL6q5m8rzianXwejs0AQUokzV1InxwTlMP1f0bUMSKmg/WG3axLHz5TovVQSZaLfl
	 MehT5rqGktgdkvC99T75vJLj8+fmzHTBIJCKBI70bspg6yRIiESEOU2XZI9u8kF8I2Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795015340;
	h=DMARC-Filter:DKIM-Signature:Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-Exchange-MessageSentRepresentingType:X-MS-PublicTrafficType:
	 X-MS-TrafficTypeDiagnostic:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SharedMailbox-RoutingAgent-Processed:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped;
	bh=LcNyZeCWspoxJ4/jUwD8ysW+46j8TBaZwCoT6do/XRo=;
	b=BtNqD9nOhHt/8mmkXv/EE0y9hWO6Ew6opT374UJtI6NfL+0aW0i/brIfMfuKJgQlF+B8
	 jEmgfP+Z8EYvecdq+D1TB97yd94DTBLdADxnI2gVama1DPc/sOosTKCk50YKyCBREamjD
	 gAiH2vVZIlb2VgkRb0DcEummBbH2WDscI6XHASYPn/+0vQml1MLRE9utiiTFg3uy/O9NB
	 +bXwY45QGyrokOPz8CbnNiMNB3I3QqOzbD7U0tFdgcKYUlnupSxjyWqwWUDbVTChpwBNs
	 q28pWGpHXgIZjAkZj38fWAen8bUXvYsDnsnMgdqIh2OsuB8gsVhNCCJhOUoz6QEmYlA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.nxp.com;
	spf=pass smtp.mailfrom=oss.nxp.com;
	dkim=pass header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=jz41JNFF;
	arc=pass header.oldest-pass=0 smtp.remote-ip=40.107.130.43
Received: from MRWPR03CU001.outbound.protection.outlook.com (mail-francesouthazon11011043.outbound.protection.outlook.com [40.107.130.43])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (secp384r1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 672D260A261D;
	Wed, 18 Nov 2026 15:22:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 672D260A261D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.a=rsa-sha256 header.s=selector1-NXP1-onmicrosoft-com header.b=jz41JNFF
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=L1xsUvrIAVq1REU4hy6RcmfU2O66rRZD337uOGVHEMwCdVYkRrfASq/OS4rhJ3z1tWwJBVpQA8HHW0HPUGpk9mPJ97vAPQJM1ZZosT+1fpOFLK2Yn2P2BogkaPlP5Wz3xZHydAM1k5Quns33Nm9YX/xs5A71LERkq+9zA5UVNlphVlsRmVIHE7mYnU7Z8XPl2pObkhQ1yDCA4jTUEarX+w2c6rvfyiWmSYx+zSCtLGma0qA2F6Cmc38xRm2JIYjzHZLaxjCmm5zKVTLuoIKmRnWno9w6vca0bboI7pxQBL0EQCSorg+qrbhdeB3LiNgYLBvBkcjAYfiogeUrlzol4Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LcNyZeCWspoxJ4/jUwD8ysW+46j8TBaZwCoT6do/XRo=;
 b=bpSrD6EIGOpJCLcyvRdZqcHD42vFeQMrNQWmqYpQN2dIJaRFpn/q3jG7DkdFOIvybhoSt+hMUq/31OgpE15YKk28ZN/gRPmbgPTR6Dq3h7Lu+GaGc+VTu002Dvsp8RKoni9FqGo+Xt5eT956HX8d/Aj+Xe4KcHdOEaGl00rVz9zBerwNINcOtvaX0k7euwy8+1xhYhAi3FzvgEvFfWFViU0bhnv+diOLAd4O2A9Uyjk1K3W2rbGfWXJyPXxZL49WS8KDk/w3T8mjh63NpitlTkqHssfsUrErkmW9yzYsJW8Y49WT8v6iXHvqijG7uACDgMTaSsbMjbsufXeL0XKAnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LcNyZeCWspoxJ4/jUwD8ysW+46j8TBaZwCoT6do/XRo=;
 b=jz41JNFFEibM0Iq6dc72rZgQoHWAqwPJ9/ebObpvhSszPZq/Crl6EhIdMeb2TyJy+QPoX6tQVKONILlNBDoOzJBzrhs8gx8g6B7oBphkWa662cSj0ZHIYH8JEkOxARfoMLQouZb+8IBddFU3wSuyHF/zq+jS13mflyBUWXHr567uLakrerRKqareLisRB2g7EGbdtFBx5vd+FOSaE4TZAwpQtRT97vqpMm7p5bxcq8dXQXG3+pd2LAzNzimJU/PcEjXxs1nHESgQBF+LoCVyY8WqNs73ov4XvM9FQrlUmlAPcH5AclCOC9luqx4RC6J91oVoW0CpT3arY78CqZ82Ng==
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from GV2PR04MB12318.eurprd04.prod.outlook.com
 (2603:10a6:150:32b::19) by VI2PR04MB11276.eurprd04.prod.outlook.com
 (2603:10a6:800:296::7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.14; Wed, 18 Nov
 2026 15:22:15 +0000
Received: from GV2PR04MB12318.eurprd04.prod.outlook.com
 ([fe80::a498:2b5a:cbdb:d6fa]) by GV2PR04MB12318.eurprd04.prod.outlook.com
 ([fe80::a498:2b5a:cbdb:d6fa%3]) with mapi id 15.21.0615.013; Wed, 18 Nov 2026
 15:22:15 +0000
From: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
To: Abel Vesa <abelvesa@kernel.org>,
	Peng Fan <peng.fan@nxp.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Brian Masney <bmasney+clk@redhat.com>,
	Jerome Brunet <jbrunet+clk@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
	linux-clk@vger.kernel.org,
	imx@lists.linux.dev,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org
Subject: [PATCH v12 3/5] dt-bindings: clock: nxp,imx95-blk-ctl: Add LDB bridge child node
Date: Wed, 18 Nov 2026 15:21:54 +0000
Message-ID: <20261118-dcif-upstreaming-v12-3-29b35e27a1cc@oss.nxp.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261118-dcif-upstreaming-v12-0-29b35e27a1cc@oss.nxp.com>
References: <20261118-dcif-upstreaming-v12-0-29b35e27a1cc@oss.nxp.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: AS4P195CA0023.EURP195.PROD.OUTLOOK.COM
 (2603:10a6:20b:5d6::14) To GV2PR04MB12318.eurprd04.prod.outlook.com
 (2603:10a6:150:32b::19)
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Post: <mailto:linux-clk@vger.kernel.org>
List-Help: <mailto:linux-clk+help@vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-clk+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: GV2PR04MB12318:EE_|VI2PR04MB11276:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b1cec5e-436c-4b1d-64de-08df4587ba2e
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|23010399003|19092799006|366016|376014|7416014|18002099003|22082099003|261009223027099003|3023799007|921020|11063799006|56012099006|261028144727099003|261022105027099003|261021123027099003|261021121427099003|261026121527099003|261026140227099003|10067099003|261102123227099003;
X-Microsoft-Antispam-Message-Info:
	D2WPfUrhp6FIzoWcG5njnfaammCFk+RtI3gQVImVYU/egSsR25nYOkqQjt9y/Pm5ydcK/4xXLT3PoMgXQ6oOpUkEzesCq6PfZSKfvZHdufHxK+skVnW6gZfkogJrjEr2yFhIJN6x6d6hricnAc/sKWafWvnnkqXYYC5JAONcPFIQv4ODD76IYDAWPyKLhKTD1hSrEvuFqx5NelitXKFOLmJawLrJmAMJuOezDOCGX99vXYs0FV0cf1DfkOrh/z1sSLmD/8NskvAgCKMlDKSPtCXVriVcGPRIu+LGntDWmyt9qd7t8ECluRGNWW0bzJ9u05dC/45ksJKIfGbrYqgO61bJaW3JjeUqWZ+ULCJeEcTpBQYu6EGsaEr0d+reT4sdGmwrum1TcbnC7WrJXHGvYpWihV65EvpJ8Z/Mkq6ltZp4QEMV8/nSb26G78aAwCflXdJI4H068eB1NZE+5ZVp/7cx1s2Z/4+iDTtfxChrcQ/tk36/y12u0BIhmPKKAmn209P3ChYqri74gJ1GJsHXBmlgl2Zku83XF4e0EDJOcixnubePZxmP2pkBK1BdCmg8f9bzutVbtOxGdOLdePD7SVEMRCr8FmARI+iX0UzToeqRcCmZ5EnTw3XDOAlZ2wECTYj/281ogOa0OfqCknqUbDberbIPtIJ3nWP7oZzJoPDC1gawQW8FY5C0Le8xnB9eRIV+vIIhw+S0l66W+F7z9A==
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:GV2PR04MB12318.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(23010399003)(19092799006)(366016)(376014)(7416014)(18002099003)(22082099003)(261009223027099003)(3023799007)(921020)(11063799006)(56012099006)(261028144727099003)(261022105027099003)(261021123027099003)(261021121427099003)(261026121527099003)(261026140227099003)(10067099003)(261102123227099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?ZzVYSUxkNVlvSVJKUmRnWC9wQit2VXVPbFhxMzhzUTFJcmNOemhzdytpako4?=
 =?utf-8?B?TW55WEdXKzV2M1BJMlhNS2JDOGFPdEdHdWVIRXlPdjgyOUtEckFQT0NRN0pN?=
 =?utf-8?B?UHBLc3BHWStEMnhyK3dZVmpIaGZVRTh4RDdBLytYRUQzamsyMXlROVVmQVVs?=
 =?utf-8?B?c0dYTTd2TlVhL3VObU1GVUNOU3lQSWpHaDZoMVBpNXp3NFNxNWkva25XQkJX?=
 =?utf-8?B?ZU1qa0hGM2VYRFNYZkwwN01qcmVnUUZrdU9ua3NNbFhRRitrelI1SXBsR2h2?=
 =?utf-8?B?Z21TN00vcGIvRDFqcU8xV21SQ2RrOG5BdFJoRUJGalU3aUYxQ3FZV2p5dm9W?=
 =?utf-8?B?cDNFK1BYa1dqM2xyQ0ZtSnFNL21vakpFcEZTQjFOVS9yM0JzK0hIN21MK3dR?=
 =?utf-8?B?TlZxYS9NWHZLdVoweDFSQlNJOFExUHJqak5KcCthUzlsSXNwVG1QcTlGcHYr?=
 =?utf-8?B?QmdNRXZCVE8wQlh4N2lHSVlKS3RiaFN0bHlHOTFQbHlIc01NQTZFS1NFL2hL?=
 =?utf-8?B?N0M5WmNoWUpRU0hTbmpVZDFYMXFGa0t4Vndud3oxSVdWM1lhZTNLMEpiZWRN?=
 =?utf-8?B?UktyUm4wR3dpc20xcFdQODhCbDRxWi80RTQybE9jWHQ0SDNVZWZ5TUkzckdu?=
 =?utf-8?B?cTZpeDdrQVpIQzJ1aDVPanFhZktpUXo5Y0graXMrcUdPdFc1YVBCa3JYMmRk?=
 =?utf-8?B?eEZ5U0JiRVVwbmlLR3dEY29qRWtkM0NoMFhHWmdlSVkwcGRZQUVGQS9kSlZL?=
 =?utf-8?B?T013b245UkhlNk1Mc29veTJ3VzFVcDJJSHA5czJkS2lDR2NGV3owZmFqak1L?=
 =?utf-8?B?Z2JUWDJXcnBENlZ4Z1dpd05vS3BIQ1RsZjJHcXFQcnJIaVJ6YXdhR3lpcnNT?=
 =?utf-8?B?blB4RmduZnpCSkFsQ21sMkZZdnQybVVVOXRGNHpWc2lJbDFGQUNxL09Bc1FK?=
 =?utf-8?B?S2lqdTJFL3ZZZGpPUnN1SlRONk41bnJQTTdDNEdVSTY1c3ZNdGJsK0s0NGpX?=
 =?utf-8?B?RWpGNm5PVStpay9WTjJURU01YWF6cVZlSW5ZQUhyRDBwUEQxTitHQ3poT1gx?=
 =?utf-8?B?VHhPNFJRa1EzYUNidHpROGQ2TVg2Z3h0QUg2andEOVdZZkd5OWNEVGpDQ2VQ?=
 =?utf-8?B?MWlDQVpTWWFaWnlrR3hCOGNCYVkxaXlSMnpaZHlhbjM1YnpLUTJNeTB5Z0tX?=
 =?utf-8?B?SVNncEpuZEZocXFEaTlSSng4eFJlcDhESVNmYmdhTEtHOVNhM0wrSnhDUkpm?=
 =?utf-8?B?bVd2OWlORFdmVkM5MGo0amJkRWRNZjlRZkxFZW1vT3BrQUZpeGVhNVR2bHVt?=
 =?utf-8?B?SjE4L3oyNERiUk5OZ2ZyN0tObGZ2TUFveVVFYzZaMWRDSTRTL29BaUR6ODRt?=
 =?utf-8?B?K1dnNnVKUWF2T3ZEZ0cxdjUxdnU2MGtzVTVyai9pclA4dGdra2kyczFvVGV4?=
 =?utf-8?B?Nmk0eW1PbXVJUEVJM0FXVmtjdVFnb25qV0pLN3NRNzJoNFA3QXByUGQ3M1Vn?=
 =?utf-8?B?WXlkNjNzNmNsY2ltYzFVYUxKU0gwWE94V3Q5NUlqZTlUSFBKaFI4dHJNTnpO?=
 =?utf-8?B?UjA1ZUowZDBXNEhsN3ZvZkFFdUx4cjVLbTVhNVloSnFNT21Ka0I3MXQ1U0xC?=
 =?utf-8?B?RS84eW1pWmh1UnBYbm85endVR3lncUd5d3luNTRLdS9LeVZ5eTRBemNqL2dI?=
 =?utf-8?B?ZEJqMGhWczJkYjdqcEphSUIzR29TVitLZmtUaGdKL1JGcFZwOEtHL1lqUVBk?=
 =?utf-8?B?NkZvTFlwUlRlMmFWUFBzMUJ6VFpXT2tBQVpGaWcvTEV1akM4a1JQUGZSWjRH?=
 =?utf-8?B?dmYzdEJCc3BrWS9DZVpqQ25ORUNHcmI3UDVsMzVkL2VncmVibGkydHI2Nmh4?=
 =?utf-8?B?MW1LWS9sNHNmYlJDcXoxUHNObmJCZTlTZnhVTmVYblM3R0d1Q3J3Sy9ETUVZ?=
 =?utf-8?B?bDVDbzVma2NuWm9zL0tmWG81Nzg1ais1Z1ZkbEpucEVMaUNYWjhnaERoOFM2?=
 =?utf-8?B?cDQzUzdvdVE4RTNuSU1HNTNOSjdURU5rQmY2VVJ6bitiaFg0UzhPSEs3OVhE?=
 =?utf-8?B?M0IvZFVxUDZhcjZOVUNYb1dNVU5Ib3BEY05iVnNkT1hHTlVsUjN0TjkvYkVN?=
 =?utf-8?B?Z1RxTWxHeW9lVEFYVGZJM3FnVmZ5dS9uUjdnU1BteUJEUURzc0RRYXl4d2tP?=
 =?utf-8?B?MkRjWU1nNklsSXk2WmJQT01hK0ZER3ZCSUJWeXFrT3RUSCt4ZVpWRmt5WEs5?=
 =?utf-8?B?WGxYZjR4VHpBRnVxRWh4ZndNRXowSkxXbmZxUGh3aVZPK1d0bU1DRm9MMFY3?=
 =?utf-8?B?bmFJYmxXU3YrazNVZUxmQXVPVnZpdGpjUDVYa0lvRHdiUnVYazlwWEJGQzhU?=
 =?utf-8?Q?nl8X7jI6VNSk2L4c=3D?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b1cec5e-436c-4b1d-64de-08df4587ba2e
X-MS-Exchange-CrossTenant-AuthSource: GV2PR04MB12318.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Nov 2026 15:22:15.7944
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1JxRuWUbV7H2yBtt5RGAJ9nmEj/a9cV5GC+ADPWxvVZ5CrAEX2dz2celTA/3DYESpWItQejOJl3nMsbhNKfWlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI2PR04MB11276

Since the BLK CTL registers, like the LVDS CSR, can be used to control the
LVDS Display Bridge controllers, add a 'bridge' child node to handle
these use cases.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>
---
 .../bindings/clock/nxp,imx95-blk-ctl.yaml          | 24 +++++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
index fbbf1b3f17904..c2aeb434a8102 100644
--- a/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
+++ b/Documentation/devicetree/bindings/clock/nxp,imx95-blk-ctl.yaml
@@ -51,6 +51,10 @@ patternProperties:
     $ref: /schemas/media/fsl,imx95-csi-formatter.yaml#
     unevaluatedProperties: false
 
+  '^bridge@[0-9a-f]+$':
+    type: object
+    $ref: /schemas/display/bridge/fsl,ldb.yaml#
+
 required:
   - compatible
   - reg
@@ -63,7 +67,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: nxp,imx95-camera-csr
+            enum:
+              - nxp,imx94-lvds-csr
+              - nxp,imx95-camera-csr
     then:
       required:
         - '#address-cells'
@@ -72,8 +78,24 @@ allOf:
       properties:
         '#address-cells': false
         '#size-cells': false
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              const: nxp,imx95-camera-csr
+    then:
       patternProperties:
         '^formatter@[0-9a-f]+$': false
+  - if:
+      properties:
+        compatible:
+          not:
+            contains:
+              const: nxp,imx94-lvds-csr
+    then:
+      patternProperties:
+        '^bridge@[0-9a-f]+$': false
 
 additionalProperties: false
 

-- 
2.53.0
