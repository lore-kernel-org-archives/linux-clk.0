Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2042.outbound.protection.outlook.com [40.107.21.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B87E125948E;
	Mon, 30 Dec 2024 00:18:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735517941; cv=fail; b=HbQu/+ozBzobJY3GzGx9dTYk5TA0XHlJZZOh4OVNd7gQLMpCFqF9Mo/z/+4VfuXrByTBBHdc4RB+mmzTRo4IamzFm6KSMNRh4IY4iimflzx1VxMZmoJeuXOnFUeLCmraxSd4nt94NU3t3DzDu5eEHGZTpPPnsU6DQmD1m16Z5+8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735517941; c=relaxed/simple;
	bh=QqNHET1lhpbQKCrlcRwL2yiUIl4PO7GmUqIKNtGteu8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=XYYtz7ntwZgaY4ZFzU0TG67hxFDP1lIKRuW6F/C6DuXldgIPfnAs3FKz8djh9KjR7D9GL+xEPGNC0ZnpWGWWdGxvrILQEZHasKIj95Usqant0dV8JEAAUfNc0CTAAKkb2EC1ol1HXUI1oyOdpaRz+BaYN+XUXl9J3jUSbCdTCVM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com; spf=pass smtp.mailfrom=oss.nxp.com; dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b=SE5G7Tdj; arc=fail smtp.client-ip=40.107.21.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.nxp.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=NXP1.onmicrosoft.com header.i=@NXP1.onmicrosoft.com header.b="SE5G7Tdj"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZQoq7bQQF37csyJNJlqGF9ZooOxmVDQNR0YdOacXVZLL1TauiI7c9EUdIiuyorAc1hPJfKq7NVJUYG51HlOMlG/jwYziogcStahebbHKpgPAkFLMMhOREq5TGKXtBfXL69mitP8fILEY+fjxecy0DEaPyA5v/4I90NrlejIBczbC5bp1dbZa4aW1iQJDUSWljTU4BaKmzjKyxmS2zO9Fbk4mvNeJdriIwD54ak34uL5MvEjVEnsKhXZgRgEwqG0+7KnP40KGB1VXQh7t/SMhNoyC2LUHoM1jIrn4rrtz4VFyIqJG3jlZr0oBuovAvWItkTmWsBKtpIqzxdN0aO08DA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QqNHET1lhpbQKCrlcRwL2yiUIl4PO7GmUqIKNtGteu8=;
 b=Sho5bVxrGxuag3yHWtpGDp0ZXQjDnj1PiAykoH2MRa9Iftu/4im/VZtjEGQxUfVC8H5P/DrM1wP8RWR8FpwGBc/88ccgTlSETvs8UXIn0ETRVX2SGMrbIWYG6LQQhFXUnigVsJS5wDNQTbOdlslnRpRoGpaHw8Jp4Quh3IPDMvJNEHM4ROaSonmq0zDJXfFC851VHdSf439y5NMkLLjU8fBKxH3O5hvQNMsnwPUxCWFlYXKx1cQHDe46o64ckA5XrQsw+VYIFtptItGbL2OSxtVnwbXZp8TBLU3sZY3pY7nw23nPshiDcAJ6748aaQa1YC8co0nJQyGOiYJ2SPyxqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oss.nxp.com; dmarc=pass action=none header.from=oss.nxp.com;
 dkim=pass header.d=oss.nxp.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=NXP1.onmicrosoft.com;
 s=selector1-NXP1-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QqNHET1lhpbQKCrlcRwL2yiUIl4PO7GmUqIKNtGteu8=;
 b=SE5G7TdjOOkgwMLT2FBqxpJHGFIcXGeMpMZi1anTEdfn6NI4Zbhp3OCTrb1PXsih+i6AcbzG1W6FYeUCbP5e4vYdhWdi2OoNHPKVZLicLn5NMXS6DuT0et7r9sBRP9I5SjHDEw2d8lZCK0dxgbzT/xOb0qaWm9PnW+IbwfhnDHLBJ9aCop9rIUYB1vH5bd0LakAinsTlGDcXmEAiWD7CVlEZw1mqTX+aKStADKYl8/0qoKv+cASANvcNt+Og3sUujsuGoxJyh438Je/TF0jyfMFQDOsMvh4tdK6XccqD20qN/F32e564s2ZT14P+doo3B3ydsPyon8gqnc7AxL0ksg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oss.nxp.com;
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com (2603:10a6:102:1da::15)
 by GV1PR04MB9200.eurprd04.prod.outlook.com (2603:10a6:150:2b::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8272.14; Mon, 30 Dec
 2024 00:18:51 +0000
Received: from PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630]) by PAXPR04MB8459.eurprd04.prod.outlook.com
 ([fe80::165a:30a2:5835:9630%5]) with mapi id 15.20.8293.000; Mon, 30 Dec 2024
 00:18:51 +0000
Date: Mon, 30 Dec 2024 09:24:37 +0800
From: Peng Fan <peng.fan@oss.nxp.com>
To: Marek Vasut <marex@denx.de>
Cc: linux-clk@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Jaroslav Kysela <perex@perex.cz>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>,
	Michael Walle <michael@walle.cc>,
	Nicolin Chen <nicoleotsuka@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Shengjiu Wang <shengjiu.wang@gmail.com>,
	Stephen Boyd <sboyd@kernel.org>, Takashi Iwai <tiwai@suse.com>,
	Xiubo Li <Xiubo.Lee@gmail.com>, devicetree@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 2/4] clk: fsl-sai: Add i.MX8M support with 8 byte
 register offset
Message-ID: <20241230012437.GB28662@localhost.localdomain>
References: <20241226162234.40141-1-marex@denx.de>
 <20241226162234.40141-2-marex@denx.de>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241226162234.40141-2-marex@denx.de>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-ClientProxiedBy: SI2P153CA0025.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::12) To PAXPR04MB8459.eurprd04.prod.outlook.com
 (2603:10a6:102:1da::15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PAXPR04MB8459:EE_|GV1PR04MB9200:EE_
X-MS-Office365-Filtering-Correlation-Id: 4f60a82f-cfff-4bc1-20da-08dd28678978
X-MS-Exchange-SharedMailbox-RoutingAgent-Processed: True
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|366016|52116014|1800799024|7416014|376014|38350700014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SiYFUca6eHVnJIkXC6JqxnPNr8OkPJOXh5k5tvZL+jA01GMNve+oHYTq1V0V?=
 =?us-ascii?Q?2sEgmpYRl7N6pdUZ+LZ5AsRihTkYJdQF5gFb4NKmTy2DVqyIUydBf3oq0USY?=
 =?us-ascii?Q?reqqEnK9fUkQsSpmy9BpYYdrBXcvjUbqdE/zKF3f7y9rGJMSl2sPh90Nbmvq?=
 =?us-ascii?Q?S+PM/xdnuRixTQ2olhPoUiAvuWD3Bz162aJXd1qn0IW9TWqG16e80Ryc0o8g?=
 =?us-ascii?Q?Ha2nWNgIH7gTwCKP10QT/MiDya/96N5AVwIgEWBQZlkkj8gRR/tSXUv1EVsk?=
 =?us-ascii?Q?btif4GQKyhJYI6QNsiZV3mScBHKsh/AoB/E2pKx2CBcAs0I2RxqCpyYbr34o?=
 =?us-ascii?Q?wpf3xsjny+LytWYGzk85SPRIY+BT91nUQzhDDtTQuZojsQGjsApZoJHfE5YS?=
 =?us-ascii?Q?3F34EzisVDLBjvTzSZOxgai3JAtNPCCHbwyGi2Q+rwFKVolGhhWMDxO4cLqo?=
 =?us-ascii?Q?494xyPRq7kwXr3OAgZWdOIahCoK/7dxDE2V41/mW9QPvJezxsDcQFLJEsSiw?=
 =?us-ascii?Q?aMO082rZN9NPqTJXj/jVVKz+u/9iOepUkWm5V538bZO6H1bAjRGJ9jbrHUTF?=
 =?us-ascii?Q?1kMEHLsHiOdG57Ae4g/N01YDLFvkgGBvEz/s3DEj6FAHMz/MI8C66c2CZTBc?=
 =?us-ascii?Q?EVNm4+OEfDwdj63DsnpMNNMzmokvC0f3WV6xM54I0xc1G/TmEearCvZyidbU?=
 =?us-ascii?Q?RpBfYcf9dHs3C8YoJ/nl9q9NNRtvQgyZdAR1quZh0Bkxjrti6pfglKcmCLkA?=
 =?us-ascii?Q?epg4jUCoIcUssbfiU0uEpDSuaqSHUkbP+Vy9y6BH6gLufPtc1+n3aW62Yf0k?=
 =?us-ascii?Q?9VyPqGRwUj4DxDFbgzvJxB8YR+6KK0ke0YBMyQGjFKjOMvlnFvritU160do5?=
 =?us-ascii?Q?tMEPZkRl05GRDc/4CN1YSIJZQ789CzULB305nY80zpxBkdhI+DLFC0oeTVno?=
 =?us-ascii?Q?w5TQMZWfv9aeReIAOSW6pfGl+i9BRygrx8lMkllm/zyl/cQIa+Z/IyjGYKNC?=
 =?us-ascii?Q?B3gFRfwARBIEX4aOsPULydcU0UpUkDdxFnAYEylD4Lq6ditGR6AP8BFFUX5h?=
 =?us-ascii?Q?nkCs6uuXT+zQxJST4X94HPooaDbq9X6YuUgQMAH0lp3kDCGCpqWu/2FW9b2r?=
 =?us-ascii?Q?3R5TBkCBpWSb1QCKoovodFONOpPWdgh7qRjkTPYZko2dzLD5vataff8GevbH?=
 =?us-ascii?Q?BI1Fd2H7te0JFPBdxvg/WCBkEdlWCyyMEwmEIF0BeFUZ5LqXD7q+5U8yK+ai?=
 =?us-ascii?Q?kx/Bjcf4mbICy19o5vuo5w/kAlq3MbsRAxi4/LGvdeefi+ijkZLhXD9JtmSM?=
 =?us-ascii?Q?5TGq4LXpRanp87yubUuYEkf1q8gr4gF3v5sXQBKhMR6Fp97avIS6wpWryrJL?=
 =?us-ascii?Q?SHWmbvggsH1fDzGc/EBMcVySv9O3n4PznNJqoejEWc99+oN3tw3gJu+WIH+e?=
 =?us-ascii?Q?OhNiU3XsQw/S5T2j9qhgUrUAa1Htmtr9?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PAXPR04MB8459.eurprd04.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(52116014)(1800799024)(7416014)(376014)(38350700014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?qs3ZV6KqoqUMbbbcvfdvPFdEWVbNYgx9YSZJPsAYdGa5aH0tToH822pW4c4O?=
 =?us-ascii?Q?yMVGfrjaeokKm6SyVlHeVMY9+F/hBbaISP4Ac+FxkId1BVxAQIfTy7NzbUDC?=
 =?us-ascii?Q?Kc7V7wpm4NdAZ/+NlOCi+RTc0noSRkKs0ReiEEEDHHr4F55sraokVjhHU6jU?=
 =?us-ascii?Q?AZ0BT5yTJIC+KF97qdqEYjmXtYeSzEBLlCkFvUFd5EImSdB2w70jKHYTbXsl?=
 =?us-ascii?Q?7+a8ZxYB4oQb1buTgYCm9V6nf8NjkwnvzHmAnSgvFbohIsIS2HuLQHoCycs2?=
 =?us-ascii?Q?c3xoYdT8yfPLkb8qdZsm3njkLUvT4tC+epkIav7aj0ZrrNVhlqswtRB73KnQ?=
 =?us-ascii?Q?bRLtbqkeUE2ntdcQkaoUOkz78cUNFV7ynZljVTsrFigzuGQz7vbihk18oehz?=
 =?us-ascii?Q?vZIls6Vkyze0wxl7dWmjl9gtKFefR0or9hNR1s5wxRsjbuCBYl/dqWDKUSNu?=
 =?us-ascii?Q?Ox2Cc3PWNuv2wubgVXrrGyMctzmJL+mreIJU+s28CBt8iJFKh3Iab19xi2PH?=
 =?us-ascii?Q?o8ARorZ2UTwMXLHoTDC7jZCxCfSDv26AeKOLygWbMSGZwRB6ynOFpUftOqhc?=
 =?us-ascii?Q?BbipX+2sedgsKifRiw5DeGS642TesGAuu9bNlSbB87b/obkWRpbSf8N4PBQ/?=
 =?us-ascii?Q?H19Gz6yp0E+qVDAmwadkhrwlzxnE/4ZxNRPSPAgYn7v1n5wLT9ETQxH7gCA/?=
 =?us-ascii?Q?C7OoVxtGD5TgHGsE1Khiht7GwhPTh87cmszy3twFTAsEm3NqNiAfht1+7ElI?=
 =?us-ascii?Q?CTNDkY1fLyh5ntWaJF1AW/YUdIoYLtVc1V8aAP2KTALgcUmQ74X8TX7X/smv?=
 =?us-ascii?Q?hMmWOP8LmLrxt15j5B/F6ILoup94Dio/oyg3MRjQ0UoVoJjNiL+0wCIBP0KA?=
 =?us-ascii?Q?isOaH59XkxfbVn64HMkjNCCC3yvjvD/qik/4tVKFsZ9B8xzEOhG2y1Q6ntz3?=
 =?us-ascii?Q?dRrYztZqWRqOl1XnYmLQE4uVsAWJ1FqhP6NG7imBoiIWgkde5wCv2amLgLAe?=
 =?us-ascii?Q?/e3bvJln5Nv5I92EvXgqF6DsLpiJRemDv1gDsWuX8KTilaPWzhMJfHTdtrEF?=
 =?us-ascii?Q?RdChfvNXGRbzhfOml16q2ummlG9XDyepuJkKuB8TkV9rXe3ewIumrMZCvKlF?=
 =?us-ascii?Q?/mJ6tCtwynnDuFWh0I58gq5THBzWFl+qpSr2CcS1YxUdRZlC358kOVLCmu45?=
 =?us-ascii?Q?p4130zcPRyO0mGqEnNwMJuoMxT/W3yI/tHadwFUon9kmzRdGQ49F2J+CX+Y/?=
 =?us-ascii?Q?rd1GouavQT3BLIa24Sji0p+V48v05PexKQQf2fsca0IobFjsJ8ggD9L9n5Jc?=
 =?us-ascii?Q?Dj8H48V2A0NMGGyCPfvjFBxj6/Mu5/JUzYWC/Ybhl9iySTpIrkMfu8dXqQFh?=
 =?us-ascii?Q?XrJFv/yJVHnzGrHNSqjTrCvf4M+ScbtmgOfTN/1SZeFdyTN16rdgeDMDXeF0?=
 =?us-ascii?Q?bqK1Bhh3jfIy4FL95G3fPztK+0+SORtVWBcjUJoOV3Md4QZPjA0synWNj14n?=
 =?us-ascii?Q?FtVY0M2f66x2N/MiIhFwInLnAusVQsbf95i9CxqhF2ktrl4hO/5hBTcOwLnr?=
 =?us-ascii?Q?Ua/oSSr3ILM3AaYBuhSwdxoSe5pBV/6yf57dAKQs?=
X-OriginatorOrg: oss.nxp.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4f60a82f-cfff-4bc1-20da-08dd28678978
X-MS-Exchange-CrossTenant-AuthSource: PAXPR04MB8459.eurprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Dec 2024 00:18:51.1172
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 686ea1d3-bc2b-4c6f-a92c-d99c5c301635
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SqcD0RloxC3nRggMab+cnHKHmOOmtdwUCyGbRBc4ECI54n9bnAKxenuPslelmB7qWAYFEOMplGPtLhOfsCxFVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR04MB9200

On Thu, Dec 26, 2024 at 05:22:22PM +0100, Marek Vasut wrote:
>The i.MX8M/Mini/Nano/Plus variant of the SAI IP has control registers
>shifted by +8 bytes and requires additional bus clock. Add support for
>the i.MX8M variant of the IP with this register shift and additional
>clock.
>
>Signed-off-by: Marek Vasut <marex@denx.de>

Reviewed-by: Peng Fan <peng.fan@nxp.com>
