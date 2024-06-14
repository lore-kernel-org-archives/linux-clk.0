Received: from IND01-BMX-obe.outbound.protection.outlook.com (mail-bmxind01olkn2039.outbound.protection.outlook.com [40.92.103.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778CC18F2E2
	for <linux-clk@vger.kernel.org>; Fri, 14 Jun 2024 07:28:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.92.103.39
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718350115; cv=fail; b=jz7x1cRzjpLTX+7HT/JjcxnyU71DqsLRkHIfwURaoook9gMgbdt7XObu0FtS52dXVabizTQ1oOCn0jKx1u4QgZfUTESlihj6yG91zAvfWAAx22NJN32KeC9H5a/k5T1+ibyd0sxcV0+aB+kQ0bfayZ+skIU8x/Y0rW5c527/DyA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718350115; c=relaxed/simple;
	bh=bbeoDhiKM4X470EteivpGWjj4Gc+g4LJRPlwbeH4qKA=;
	h=Message-ID:Date:To:Cc:From:Subject:Content-Type:MIME-Version; b=Cy3pDnvEYrIJkqT3leT8piR5Sh6UMtAPpu9xc/nukduRmRdDz2IqSz/LP6Wz3Ug0pgSDRnl53Bc2XZghIDkHKvaPoW1fB6q9MyPPRrcw691Pw+jiqxxHUA3mSYDmcKLzQH6mTt4HoOhV04MZDrfuntpOy4nag5KWI/WjonOkxh8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com; spf=pass smtp.mailfrom=outlook.com; dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b=AW5Ri04r; arc=fail smtp.client-ip=40.92.103.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=outlook.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=outlook.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outlook.com header.i=@outlook.com header.b="AW5Ri04r"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i8ANci2O8Wi46C2vYMcATzQuGV8C9Set4YNvlKTHvb24HmmhtrEMbmDzfU1jubDvPIU4VrLL28zlstsIKMCGP7buqpG0xfSumK99+afG8pzxVpXk4QCexW5+gGWkgoq+VYYCbtpbFgWP8pti6wO0k1VJPpLmmloWynrGibBTeR3lA5cG5dCrmVwEG7PJ4EDzobd0urJRxi6cGKEuY6CI7q0+wEmhIegG49uUTVgPqArussdbXbfadF51HrpijxaHe+6fc0sbZJ2bpHtf03DJ1ph8dAG1N8CdM+Xpdn4+4UIfXM5Jp8mnWdzI+tGa6fNFXpQYqyILrnigNSHwYVWnMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FNaWefvVbNUQ9DZippYyD6DsamDuNoqw8MJ20IeKheA=;
 b=gy8MBAxNsOt2DNqNRVQk4Q/al5Tap4uVp3e3dDGiakGfhSBbLYECNW0qfdjEMsGEmx4nC41MGRESjygFdBc+MUCr9mYLjrZddipCqHgOvuk1a8mLrhcK91mJGkU67ZZsatgfn89MZu5v8kfxUzbQeRMrQd23KloFBzEWIRTjz/nQb61LG1T+5UpoZQ8O4B2ajKp7uFo0/Vwbco1i7nA4IrBThaq82CdlWitjMWEowRVfFxN4cBdmQKuKDnvAwxuwDbEH6zrdnq+WYgoJmI6HkXXs6UoV+ExKmXHmhH0ADwAf55Ux3kk0ZemU2KKRqTJ2df6MHty7HkbuwIKln4QTBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FNaWefvVbNUQ9DZippYyD6DsamDuNoqw8MJ20IeKheA=;
 b=AW5Ri04r+K3iblF0JRQPnn/cz7tgWrb47xT/9j9QzIkfxj8V8rSPoARvaY9fg+jkD+/TavszBs1VuMKD/qGHA3b66fYPpbEyLylSb8JBakQzx5P4jrDPs3imBvLzy6tNxl4c4A3DdjF7cVzw3Cutx7YE1+jNA4pEWjVzIcpjna6sWH5hrr/fmtrzRjz3SqQuwWKc8U48rD5TycsmQCWTnztdDDcxH2RQZri8IME85SpLgFexuOamJ9GerB9E4OdHjlQgLoANvTG5KsKYRftt56pB6BoYkHKTQIaAKwlD5P4XJssMQAyVaDdLFrDLCwcTjJPD4Dw2A233uK5nG2AtNg==
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:138::5)
 by MA0P287MB0678.INDP287.PROD.OUTLOOK.COM (2603:1096:a01:11a::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7677.25; Fri, 14 Jun
 2024 07:28:28 +0000
Received: from MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c]) by MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 ([fe80::a94:ad0a:9071:806c%3]) with mapi id 15.20.7677.024; Fri, 14 Jun 2024
 07:28:28 +0000
Message-ID:
 <MA0P287MB28221A333D852974F55E3228FEC22@MA0P287MB2822.INDP287.PROD.OUTLOOK.COM>
Date: Fri, 14 Jun 2024 15:28:22 +0800
User-Agent: Mozilla Thunderbird
To: Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
Cc: Conor Dooley <conor@kernel.org>,
 linux-riscv <linux-riscv@lists.infradead.org>,
 Inochi Amaoto <inochiama@outlook.com>,
 Xiaoguang Xing <xiaoguang.xing@sophgo.com>, haijiao.liu@sophgo.com,
 Chao Wei <chao.wei@sophgo.com>, unicorn_wang@outlook.com
From: Chen Wang <unicorn_wang@outlook.com>
Subject: [GIT PULL] RISC-V Sophgo SG2042 clock drivers for v6.11
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-TMN: [V6hmKVxa+2TXGYhWZ337mj1u1hjF14KI]
X-ClientProxiedBy: SG2PR04CA0200.apcprd04.prod.outlook.com
 (2603:1096:4:187::15) To MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:138::5)
X-Microsoft-Original-Message-ID:
 <e2a72fdf-be39-483a-9992-f46338662ee2@outlook.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MA0P287MB2822:EE_|MA0P287MB0678:EE_
X-MS-Office365-Filtering-Correlation-Id: 1986975e-7254-490d-aa68-08dc8c43958a
X-Microsoft-Antispam:
	BCL:0;ARA:14566002|461199023|3412199020|4302099008|440099023|1602099007|1710799023;
X-Microsoft-Antispam-Message-Info:
	PUYoOBv3ixO/wZAHwk+ofCFemmftZLXYhOrMKxVP04fq09c8rWwTXvJKWi7Kla8TBmJUMV+90ib9NrjBRpj/pSd/ukFEAjUBGGu/KF799jOOaFUz5DEmf53pZuVgEL+/vWR6PZoIjH/jGIzsqi0cOBUv0On5xEYDqRWUbzITjIF8aotMVNnDIwUyUKTJ8bZDtKG4P/RinLHOw/DjASmGFewaJc5NvATpM0ovyR3AT93Fy2DsPQa5o7PP9tSvjXTw3VyZD38bzVOzsmmAdpB1y2BIntPNFmeLACGWK6dOrd6QwJVncf1iZl56w6Cs84H0IEyYdEKm/mtL6JF8KBPiZz7/K1ObUfOG5DkDcZodHHaZ0OrXX68poamCs3o45e1r6bPI9Qmx5apB3/YaFkUYFCekuydH24cBqv27L2NzDIhozMPyy2ephuToF4Hv6hZBJVJRSfNu7y1uhvTHZkDLYIEEQAJ8oj6yfBBViryb0Rme7D2CgJRBICNCz0mtQLDMyffA/Stmy3RiWnMyWbxuU9KWA4eCggViMGXh0UGybxSUSp3/E3mIxUCyQts72Y+r91GOYkfmeP57kW4uY9a6RznN8Su44hXW6rDsbHYDKQseWeWYyhzYsHYWAkjOGMT2fbvA/l3GlS9ejFLjq2YKt6RcDM1L3WHzWb3XY46X5p8nimsB9bx+OAqByBVeuPZlEBqIK3xp2j4FVP8Z0/cFwBiDKiF7PXBewXy/G5rUsTE=
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?WElJV2FhNXpkdW1qdVBFS1RrQkFJQXlLSGVZMmpxR1hOYy9iRS85eXlGdEtx?=
 =?utf-8?B?Q0cvQ3dxNWZpK1FGM2VtdUZ3ZHJHaVYwWVNxWFN1VnptZVZiUkZiZm4xRGps?=
 =?utf-8?B?OGlzOXNTTDI3OVFyWldPaHRHS2tWTXorQnhTKzEwaVhoWlFubExBZUV0MDZ5?=
 =?utf-8?B?ak9CQkRaUUNNU1g2ZHFOYVl3WmhaWG5SZWpGWmp0SWduV3hVVW1pVktSMTJW?=
 =?utf-8?B?bXkwNktsbWMwR1VCV1JMd05YTldqZkQ0MjdPODdrQmxPTjkvZ0NncmxPVHRy?=
 =?utf-8?B?cnZuYWxZbkN3RmZmLytGblBFMVlONDRmRUJQZWYvY3NzM1FHREdCVWFuOW9u?=
 =?utf-8?B?bWhVa2VKdHdZV3B2cmhveW8wajVLV01BTHQ4RklqN1lrUm9RRCs4MEMvbmt4?=
 =?utf-8?B?Z1YybVI0Vm1KMDFYRTNzMXFyWXZzOXVSNDdwSGRKYmllaC8rMlN3eVF2aHMv?=
 =?utf-8?B?a1lRTjFNNHpPVDl6N3lxa2xGd2hXYXV5dm03TTlhbE5UVGl1TTlvOTNFaG55?=
 =?utf-8?B?bU1iYVRWWXAwZ2lqVkFyT3pWWkRXZ0llbVJQZUZlY0VxWDdsNDZIcDJTdjRI?=
 =?utf-8?B?MEM3RUxBWExxOXYxWlhEWHJGK0VIWXJDVlg5cmpPS0FHcDVOVTVTbHZpYSs4?=
 =?utf-8?B?Qk1MR2NBcnlwUCs4bGRESTN1N205YjcrTldubk9wZnNqaEVBVHRXdHc1ZEgv?=
 =?utf-8?B?aWpTVVVUV21jdzVOVDZUNUFNTXh4QzE5anh0RTVTbmNQL2NiZlVOMGQ5RHlO?=
 =?utf-8?B?dnJZcWIxTU9ncjF0WTdxcGc4S24yaUcyMTJSbTVqSjE1MXpiTGtRYXBjZ21j?=
 =?utf-8?B?SUtvc25icmRnUDJTWTdBNzJMeE92NDhPWG9uMjhCcnc4ODFMeTBIVHVJZ3Rm?=
 =?utf-8?B?RFZkMXZHNTRReXdqRzBlRFJjc0hKRGVqRHlLZDVPaWNYVkxxemQ5cHgxMkgr?=
 =?utf-8?B?anJJaHA5VCtzSzRzMlcrcjAzeE1sYWV6dko4ekF1QkxsSmxsVXNOYmQ4V3NT?=
 =?utf-8?B?UjJiTnBkVFZIYkd0bERhWktucjBXRTBsb2lmM1VoNFR4Rmp0UkFkWndmQzRv?=
 =?utf-8?B?elNNZ1NneXdQQytqNFpaN0c0cGpFR1NtaEVRODBCRFQwOUxCOWN2OTdJWGxL?=
 =?utf-8?B?S2NpcXk3ZWtONml5a0J0MU9uZzRWTE5tbFZFenRWbkg4Rjl1S3ZGdjNXenFa?=
 =?utf-8?B?NWNnSDRjaG1yWHBOTjJOOUsvb0FZUFZuMXZjVDBJZ0pzZFV5ZzRkMENJbS9j?=
 =?utf-8?B?YUhjSjh6SkwybVVNUVMxV3B4a2hqenFMM1Q3eWkxSzJWbFdyVXJHZEo0S1BR?=
 =?utf-8?B?QlZRTEZIWUkxandmQkRIY0tEcW9UTFFnTjRQK2MvTERuSHVJN2pQQjcreWdj?=
 =?utf-8?B?b0g5cE40SkRRVDEvTlVLSzM3QkdSUWRtVEFYYkNQTHNaMnBhRWNicXREd1NL?=
 =?utf-8?B?Rk5ob3B1OHo4Q2tKWmROY0NlaG9oUHV0cyt1QWExNmNQV3JleWV0cE1vV1J6?=
 =?utf-8?B?N0ZmYnZXTE9VMjRNZFlrWTNXcWJtdWwwclo5N0pwaW5wQmM3YzFHa3pTYW9B?=
 =?utf-8?B?VVhtcWtWamo3b241a2hLWFhpT2VhR29vK3FGN2FLUDFGdGpBQTdWcDM2N3Qw?=
 =?utf-8?B?N3JzVnJJSStoSUVUZlUvMjZPUFNEcWdFL1NSSUg1N003eVgwZENLZDRZRXFE?=
 =?utf-8?Q?VMzX9Th7Ocl7kVj3p3fY?=
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1986975e-7254-490d-aa68-08dc8c43958a
X-MS-Exchange-CrossTenant-AuthSource: MA0P287MB2822.INDP287.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jun 2024 07:28:28.1165
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg:
	00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MA0P287MB0678

Hey, Stephen,

Please pull clock changes for RISC-V/Sophgo/SG2042.

For dts part, I will handle it at my side.

I send this PR just want to expedite patches for this clock driver. The 
patches have gone through 16 rounds of review [1], and I have carefully 
checked and revised all of them based on everyone's comments.

Link: 
https://lore.kernel.org/linux-riscv/cover.1717661798.git.unicorn_wang@outlook.com/ 
[1]

Thanks,
Chen.

The following changes since commit 1613e604df0cd359cf2a7fbd9be7a0bcfacfabd0:

   Linux 6.10-rc1 (2024-05-26 15:20:12 -0700)

are available in the Git repository at:

   https://github.com/sophgo/linux.git tags/riscv-sg2042-clk-for-v6.11

for you to fetch changes up to 48cf7e01386e7e35ea12255bc401bdd484c34e7d:

   clk: sophgo: Add SG2042 clock driver (2024-06-14 14:49:40 +0800)

----------------------------------------------------------------
RISC-V SG2042 clock driver changes for v6.11

Sophgo:
Added clock support for sg2042

Signed-off-by: Chen Wang <unicorn_wang@outlook.com>

----------------------------------------------------------------
Chen Wang (4):
       dt-bindings: clock: sophgo: add pll clocks for SG2042
       dt-bindings: clock: sophgo: add RP gate clocks for SG2042
       dt-bindings: clock: sophgo: add clkgen for SG2042
       clk: sophgo: Add SG2042 clock driver

  Documentation/devicetree/bindings/clock/sophgo,sg2042-clkgen.yaml |   
61 +++++
  Documentation/devicetree/bindings/clock/sophgo,sg2042-pll.yaml |   53 ++++
  Documentation/devicetree/bindings/clock/sophgo,sg2042-rpgate.yaml |   
49 ++++
  drivers/clk/sophgo/Kconfig |   28 +++
  drivers/clk/sophgo/Makefile |    4 +
  drivers/clk/sophgo/clk-sg2042-clkgen.c | 1152 
++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
  drivers/clk/sophgo/clk-sg2042-pll.c |  570 
++++++++++++++++++++++++++++++++++++++++++
  drivers/clk/sophgo/clk-sg2042-rpgate.c |  291 +++++++++++++++++++++
  drivers/clk/sophgo/clk-sg2042.h |   18 ++
  include/dt-bindings/clock/sophgo,sg2042-clkgen.h |  111 ++++++++
  include/dt-bindings/clock/sophgo,sg2042-pll.h |   14 ++
  include/dt-bindings/clock/sophgo,sg2042-rpgate.h |   58 +++++
  12 files changed, 2409 insertions(+)
  create mode 100644 
Documentation/devicetree/bindings/clock/sophgo,sg2042-clkgen.yaml
  create mode 100644 
Documentation/devicetree/bindings/clock/sophgo,sg2042-pll.yaml
  create mode 100644 
Documentation/devicetree/bindings/clock/sophgo,sg2042-rpgate.yaml
  create mode 100644 drivers/clk/sophgo/clk-sg2042-clkgen.c
  create mode 100644 drivers/clk/sophgo/clk-sg2042-pll.c
  create mode 100644 drivers/clk/sophgo/clk-sg2042-rpgate.c
  create mode 100644 drivers/clk/sophgo/clk-sg2042.h
  create mode 100644 include/dt-bindings/clock/sophgo,sg2042-clkgen.h
  create mode 100644 include/dt-bindings/clock/sophgo,sg2042-pll.h
  create mode 100644 include/dt-bindings/clock/sophgo,sg2042-rpgate.h


