Received: from MA0PR01CU009.outbound.protection.outlook.com (mail-southindiaazolkn19010009.outbound.protection.outlook.com [52.103.67.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DBB621ABDC
	for <linux-clk@vger.kernel.org>; Mon, 10 Mar 2025 07:34:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.103.67.9
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741592061; cv=fail; b=IWpei483oOB4ik6maKNlzAbNVwqompyAsenkHvN9EfOa4rC69l59pjEYNer+71gtTm1mtzcRj9EL/SeVI9Wvh0mtgFcLCEvcaMjEIxzDKzP0oYRFFkLLJ9APpJOi35gYppXzih+YXYDKIxpT4OUDvkm9DkOkuvvbtjHCszY0zMs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741592061; c=relaxed/simple;
	bh=c/8txWDu/W9mf881KDNBtuPAnCGbYvLfFM+8ntg35VY=;
	h=Message-ID:Date:To:From:Cc:Subject:Content-Type:MIME-Version; b=M54KUtMvao+1AsRKiJLfLZlg8VpM3PvQKsQsNpUM1HUc41w6f6WDcOKdJj3jCO/Dr7Xl0KOt7R96XX0zw6Mntyu3SUjr79MzFNNXBtANQpprR3YwhKtDDjHWGFWumwk7d+hRfyu+J7xdllo5yl5Ni1bkY+FZtsbdelIzWyz8P7U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=gMm4rqa8; arc=fail smtp.client-ip=52.103.67.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="gMm4rqa8"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qmpwRvB+X3RrGeb7/gMlZmF50FyS4IhvCprpl3nkQF9GfxKuNvIMjphOsbR9MRU4WIy++MuvdyPsuFpTfzSmQSBerYBMzLQa5FkxwRIxT2APJmsbVu7/cUlLjE6YwXiNsBCzfnGgTmuHjvgHaiHunEKcvNJmEVYcEAvP0aiIMlt8snedOvqck8Q5EmhnfrI33owjycpa5UjeFf/sZKJhtZAEmu7j6ea/cXhLufJftx3OOn0Ci9aVGL67gFlZ/n0UM77o8or0n7Nbzg7rCvGqx1bpr32+XP8kMRh7r/aYFwnaq4hEIrn6dwaLG9bCApC2ZdMdcTNDqI8nZcsiYjXfGQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=32QUlU9cwEfyTc8QqnqDypAmEypRuNJ0jRxJXP1BPNs=;
 b=OHTIvVmurF1xC6qhIKMzVFmJGDfh17gcBQnVWayCWUr5atf8xRnEIPC77tIVsckfXdiXj2XhlAX05baKqAcK2yi2mGmfkByiMAljUDHSRgTFzrhbZ/qAQkmzJQEhdfdOdolEeKzYYgleXFHex1Rzv7ScxbBUsN+0M5nm07chuDAF326fTz3GzTkcfPTBhjAVDnsu+jlLKiaqwcygvPXQivzEL1RMJlAgRGL9+P3IlaAhQ607zkyiMFdnmYgWs05PpGpw19XYFk/rj5aoc+vRwB05me7+kifdrPb0eUqHzZiB7SIGJ31Q19lC8o3eaHFqSL2PTvKx7YWxyM0Z5c/VVA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=32QUlU9cwEfyTc8QqnqDypAmEypRuNJ0jRxJXP1BPNs=;
 b=gMm4rqa81OkRQOOy5MXg/SRMV673qE1iaEzKVllSUMTe+1BnIFcBnZmUs/BwGPUKJhE6WzfKTXPRJDRE1oGmigPVNYR+DurIMlTf1QgJSjnZyl2hL1kQvgU1GjJYt9XHeh2kua6uj/hwpc9TfnlBeMfOxxdToyFW85rGHhUFCwBmjIipejB8DXQJfHPU/JRkfb8fRreyI6EUI2eu7VcEyZDNzXu/e5OHRY2UYeplnkDCFRFAmX9i+2escNiesAh6U468L6T0GHfG8rlRjp+/m3Wy8Y8hfmW5QWUNqs1TX4o4QmCw6fhHS196+va+YiwFR0r9kZKiMTdlAfjB5/RSxA==
Received: from PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:1eb::14) by PN3PR01MB10065.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:1e5::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.26; Mon, 10 Mar
 2025 07:34:11 +0000
Received: from PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::1b4f:5587:7637:c5a5]) by PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM
 ([fe80::1b4f:5587:7637:c5a5%3]) with mapi id 15.20.8511.025; Mon, 10 Mar 2025
 07:34:11 +0000
Message-ID:
 <PN0PR01MB10393DBCE92A34489031BE9BEFED62@PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM>
Date: Mon, 10 Mar 2025 15:34:08 +0800
User-Agent: Mozilla Thunderbird
To: Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
From: Chen Wang <unicorn_wang@outlook.com>
Cc: linux-riscv@lists.infradead.org, sophgo@lists.linux.dev,
 Inochi Amaoto <inochiama@outlook.com>,
 Xiaoguang Xing <xiaoguang.xing@sophgo.com>, Chao Wei <chao.wei@sophgo.com>,
 unicorn_wang@outlook.com
Subject: [GIT PULL] RISC-V Sophgo SG2044 clock drivers for v6.15
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SG2PR06CA0233.apcprd06.prod.outlook.com
 (2603:1096:4:ac::17) To PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:1eb::14)
X-Microsoft-Original-Message-ID:
 <ab031592-9100-45db-a3bd-7844e185f6cc@outlook.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PN0PR01MB10393:EE_|PN3PR01MB10065:EE_
X-MS-Office365-Filtering-Correlation-Id: 337a98e8-6ca9-4561-31e8-08dd5fa5f2e3
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199028|5062599005|7092599003|15080799006|8060799006|6090799003|19110799003|5072599009|10035399004|440099028|4302099013|3412199025|1602099012|1710799026;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?NnBzQ1RjZlp5a0U4ellzMWpha2wxakQrdWtHRjJLS0JpMm9JZlhjdjY5cGdD?=
 =?utf-8?B?bithc0xuVVQyRHNibXVuQ2dXVHFQeDR6N0t5SzM5TXBoTHpHZ0ZTNW9FQklF?=
 =?utf-8?B?K3FxTGgvQURlOGxVUkQ1dUlRUC9CdjFrVUhVOUx6ZWtCclhxT0taWkVGNDBa?=
 =?utf-8?B?SGVocmpwN3pyR3BreGpZWXRJZWtXR3c1Sjl0WlNOdUVmTFd3RDNvdXhQR3lF?=
 =?utf-8?B?ZUdUaWtLZUZVZkkzU0t5V0V5S3BCYXZlUytxTHN1VjMweDRjdmhYUW9Fd2ZB?=
 =?utf-8?B?ckVHN1VrU3hLeW5QMWp6SjNKWTUwWSs2Z3pjb0k3RWNrY0JGWDBmNFdoWlhn?=
 =?utf-8?B?UndwRGtObk8vcjFWV0IzNE9Ickt2emNyczlUMExmOUpwNjFYUW01ajRTRnIv?=
 =?utf-8?B?M3EyaERNQVZNNDFPK1BjWFR0WXMrSEZGMTc5cWdiWnRIZlVUemdBRlVpWlZs?=
 =?utf-8?B?NlRFZGxJTkkzRTVEYXFuSWNCV2dzQkVaTkptYVAwbkRUVG50YlB1bklPdk1R?=
 =?utf-8?B?MDdlOG9nSWd6NUtBc3lwVEgxZkFQaEdKbjhKM045OXJjZHJQS0NlbGhhZlYw?=
 =?utf-8?B?cm1rdUY5cmNHRE4rVnNYMkdPSFdWTnNZZ1I3MllYRlA5dUpIdVcrbzM0YlJZ?=
 =?utf-8?B?VkJFR2VUQzNITDRFZE43NEV4alVDWW1LUmtNbDNndkkxc0Y1bzVLUVlWbytB?=
 =?utf-8?B?Qk91dWJ2LzBqejNqenlIazMzSGg2U1M0ZjBWMGd5K1RvQkxxMEoyQ0FVNjV3?=
 =?utf-8?B?UVUxRDdvcTBScFdqS3FuRFhWc0xqN3RWc3JOZHFQeW5zVXpHSkVWcDJFdDBw?=
 =?utf-8?B?ZHBKUlQ0NFk2azFRSU9LcEYySVpWRTdUOERqT01JWVVsd25NemFCNXF6VXBG?=
 =?utf-8?B?Tk9oSWpWNlZNUUdMUnA4SkMwb1orZStUKzlFM0tJQitoeCtVQUQ0bE9uSTNC?=
 =?utf-8?B?c3g2MUVPT0RpUzUzYTVlZVVPeFVxWDFDR3pocnFjN3Q3K2o0VFl5YktiZ01t?=
 =?utf-8?B?eHJ4NWRCS3RBdk5jY3FiTEtMckdzSmMybmsrL004MER4dTBCRTR3TTJBdWZq?=
 =?utf-8?B?YS9vTnRQL3E5c0xYWmZXRGRqRG42b3JSaUhBMThCMkpkU09XTUtqMm1tYTZt?=
 =?utf-8?B?Qk1BNTdBRHZFTWhYSE9lenFCUHVsSXRyT1hyWE0xSEEwbU9Ed3N3bnBpZnh5?=
 =?utf-8?B?NVVnWEtidkgwQVFHNDNQZTF2dkw2MXNTZ0dYK2s2ejVJMFk2ZXlRUGdqU1Vj?=
 =?utf-8?B?Y3Rrb296K3RNOUw1SnBObVlKU3pCRDhsNDJZRzdadE1pV2tHTGlMR1k5engz?=
 =?utf-8?B?Vy9SWE9mSU8wajdrZ04wYTBYMjdyRXo0VFVNbFZIOWM3bTk0ejZ2NERWRTRm?=
 =?utf-8?B?OE0xL2dQRHNwME5WYmc5QUlEWitMaU5xUlpFdXlvK1dNOHFuSTVUMitOVVJB?=
 =?utf-8?B?YlkyNFhHc0ZPbGdER01UTGtvMktmYklLTGZJdHk2bWl4MjJVOTdPZWRmbUNr?=
 =?utf-8?B?SnJ4RityWVNpc1NQalRaOHM4bloxOW53bVZMTDZRM1BHbGgvZG1uUVJyU2tJ?=
 =?utf-8?B?elRpeTlDYThrRmN6c1JzQTVzRVF6TU8xTVViR0pNNEsvRktUeWl1cmwzL1Za?=
 =?utf-8?B?b0ZYODd6bWhiSllwSWZDYitXa3VSaDh3Z1dGaVZPSjFob0VoUW5YYnM2by9F?=
 =?utf-8?B?MEo0K3Fjbi9iMjdJMWRXQzBUWGpTaVlIRGxnQ3dRamYvekJOSm5HdWxwQ3o5?=
 =?utf-8?B?d1hrSk9ZcEtISkJXWGxkbnFvQUpESlorUVdtQVFYbVpxYTVXaDBlbzRFajNR?=
 =?utf-8?B?bmIzZHgxK3NDUEV3Zjhudz09?=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?THdsN3R6MFp2MGluUll1STJjcVV4emdsZXYwTUVxRURhbjcwK0N2a3JBVVBv?=
 =?utf-8?B?cEdadzdOdUVyTnVDbW55cUxCWTBvQngvVWRHMWx2Z0pDcGRpNlJRVnZqQXRm?=
 =?utf-8?B?OE1xY2ZCdVFkbDc3ajBBOUgydGhWczBuNzVydTlQeUR4bG9aZlNkTURlRTBw?=
 =?utf-8?B?MWQ2bDg5blQ2UVkwRjdYMTBYa1BuTVNlTlhzRVNmZjdIMjgrZVZHUWdzdTEx?=
 =?utf-8?B?Yi9FYUNsL3pyd0hhQ2J1MWZubktrNWN3ckIxZVBnLzcvN04zdXRYSTRBdVYv?=
 =?utf-8?B?NWNvMmIzZFlYV3UrbFR1V1IrcldwcFYrdWpSZHlQNEJ0QVFnb3dHR0syZDVu?=
 =?utf-8?B?cVpXdHJKeGQxM29zc2xDc253TnJocGlMa0dzVTN4MXkva2NwVkh6a1gxSThH?=
 =?utf-8?B?bDJjQUdaSGZ0N1ZrWkdDU3dKVUpJOW5NdFZKRFhGMHJNMTdGdEcvOGQ0bDE3?=
 =?utf-8?B?Ty9LWlV3UjdaamNDa2NEUVRObDE0WXdQM3VqeVE3VVE3bmo3WDZFbEN3V0ZW?=
 =?utf-8?B?b2JWK0ljQlczRGVQZldacTdxc285MmlDVTBzKzdFdUVCNWcyeGNlc2pLZ2xp?=
 =?utf-8?B?NDhrd0kwY2dDeG12NGtpbUs3VDcwcEh6eWt3b1QzamdxVkhGdzFjWnhkcGlS?=
 =?utf-8?B?WWNrNXJBVENxRHlhYnV4cnlwbnNTeWw0TFhkaEMxaUgrT1BlanVMbHloUDBp?=
 =?utf-8?B?OEtqNU9PU1JrYkNVWlBsVkQ5amx1MGxkNVAxbGVUbXQvSUcwbmYxYTdIbGoy?=
 =?utf-8?B?djl6U1F5cGFkK3dEUTVuc0N2bFowNWZlekM2eFhvUXpLSmVtcWZUMExjQ2Nv?=
 =?utf-8?B?VElUcU5kR3ZTcms5RnZ3cXZ3b2dHN01WOUFBanI0dlVVV3FWcWh5bXVGT3Rk?=
 =?utf-8?B?MG1IbTE1Q1ZPUFBobTZTY3N1bE1WbjRJRjRBY09IcU4wZ003eWNjcGNnSVZN?=
 =?utf-8?B?U0FTNmdQMFBxOVBYZFlqdHlwVkNGaHFDRDg2VlNKd0t6WVVxZElhTVovbWZx?=
 =?utf-8?B?d2RYWHFuWWZiWEhpT1dvT2RSalZHd2g0a05pL1hVU0dpUEFNYnpOb3JCbGs4?=
 =?utf-8?B?OVZpUHYwL3FWd2ZIVWVOZFFOZit3WXFZL1pkaDdZNk9wNS9PRC9ENkhoenBD?=
 =?utf-8?B?SU1ySWlMUGVYN1V6WkhTbTZMS0FNZzFlZXMvRUc4ejR1OEEvYjZCR2VkRlN1?=
 =?utf-8?B?cW9TL2ZUaFNCQU8xcjEza2lna0QyeDVuVC81cW9RbytUMU9BNS9tVnZqT3g4?=
 =?utf-8?B?SzNDb0oyRlYxNlhraWZlZk9uUkR5YXFPcFZkMkZPMjZ0MnFYMERWWElNeVlY?=
 =?utf-8?B?b2R3SmRndDZXTHdWWWowM0xsM2VVeGQxS1hBTjBIQ3RZQ213T1Z5cmo4d0Nq?=
 =?utf-8?B?Ym9admdqUEw1RWlwT014MXdvdEpYOCtIT1JKR2dCRGxjM2tEdlBsUERaNnJm?=
 =?utf-8?B?QkFwN0RKdlZXSzdKcUR3akNKUW5UZUxWSE9oaUlleWhyNVVYTmlKaXg1OVN1?=
 =?utf-8?B?clIxMkRUdGl2UGZLR0MxNEZMN0dJeXdPTGxsSlEyZmRXc1BLclN3cDVMZ09n?=
 =?utf-8?B?YUo3QmwxQW90ZTdOd2hHallrMUJnRFVLRDU4ajAyTXlsaHhZaUwrcXdDWXU2?=
 =?utf-8?B?MUFhVml2M0UvdnNDeDZkM0JFTjRXSExjU2dlYkxWL0dpMnZ5Nyt5Z1VSS0tC?=
 =?utf-8?B?VHlrY3ZpODRsRExsNS93a1AvR2NmcG5wNGs3bCthb05vQ3pDSmtsTnVkTFlT?=
 =?utf-8?Q?DSTYzQI1kEAHE9auPPJ2XoUuZ8A+emtrBecITMO?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 337a98e8-6ca9-4561-31e8-08dd5fa5f2e3
X-MS-Exchange-CrossTenant-AuthSource: PN0PR01MB10393.INDPRD01.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2025 07:34:11.0738
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PN3PR01MB10065

Hey, Stephen,

Please pull clock changes for RISC-V/Sophgo/SG2044.

I send this PR just want to expedite patches for this clock driver. The 
patches have gone through several rounds of review [v1], [v2], [v3].

Link: 
https://lore.kernel.org/linux-clk/20241209082132.752775-1-inochiama@gmail.com/ 
[v1]

Link: 
https://lore.kernel.org/linux-clk/20250204084439.1602440-1-inochiama@gmail.com/ 
[v2]

Link: 
https://lore.kernel.org/linux-clk/20250226232320.93791-1-inochiama@gmail.com/ 
[v3]

Thanks,
Chen.

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

   Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

   https://github.com/sophgo/linux.git tags/riscv-sg2044-clk-for-v6.15

for you to fetch changes up to 135418add3878dcd44483d0f2851f6f470a85395:

   clk: sophgo: Add clock controller support for SG2044 SoC (2025-03-10 
12:22:01 +0800)

----------------------------------------------------------------
RISC-V SG2044 clock driver changes for v6.15

Sophgo:
Added clock support for sg2044.

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>
Signed-off-by: Inochi Amaoto <inochiama@gmail.com>

----------------------------------------------------------------
Inochi Amaoto (2):
       dt-bindings: clock: sophgo: add clock controller for SG2044
       clk: sophgo: Add clock controller support for SG2044 SoC

  Documentation/devicetree/bindings/clock/sophgo,sg2044-clk.yaml |   40 ++
  drivers/clk/sophgo/Kconfig |   11 +
  drivers/clk/sophgo/Makefile |    1 +
  drivers/clk/sophgo/clk-sg2044.c                                | 2271 
+++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  drivers/clk/sophgo/clk-sg2044.h |   62 ++
  include/dt-bindings/clock/sophgo,sg2044-clk.h                  | 170 +++++
  6 files changed, 2555 insertions(+)
  create mode 100644 
Documentation/devicetree/bindings/clock/sophgo,sg2044-clk.yaml
  create mode 100644 drivers/clk/sophgo/clk-sg2044.c
  create mode 100644 drivers/clk/sophgo/clk-sg2044.h
  create mode 100644 include/dt-bindings/clock/sophgo,sg2044-clk.h

