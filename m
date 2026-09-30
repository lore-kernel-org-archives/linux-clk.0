Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 963A23CB56A;
	Wed, 30 Sep 2026 19:19:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790795974; cv=fail; b=psv8YtUdSEW/DyyfX5Cs1mviqrC3TkL5mA5lkJL9ICI6Uon3AtArEFFe5LUEShaCDZd8i50FOrtaG3YijJhJxOxgzd0gIOs2RC1gKBGRAFzkWFLuaX0ZCRM+ROEKSxYxpSyF2rc56tuoWfDFySti291tSi0/rmoOivTt3vjB/kw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790795974; c=relaxed/simple;
	bh=zBiR/HHnG8m557/5mfTnYGiJOnGsL9s7VVKMBJxDmf0=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=Xq0WNMJmUjq1zOH87cVWLVJDSTSW1mxK9+JRiLM36EcTjAdEqPH2Mr0awYnOC4wjKL1XC3KoFsq02+CyG39T09M5JwaFhoRAwVibP+vSSg0sYzmII9ZAiLnPu5dj0BiesD7/kFWKfW7GHSUMQZny7hQ+nSR1yYC8Hk2midIX2Go=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=bZ67gmdW; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=SLcT/0ds; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="bZ67gmdW";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="SLcT/0ds"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68UHewEM104565;
	Wed, 30 Sep 2026 14:19:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=eqDP8NaQnXTdNW1L3v4DkPlzRMhAfQCEHjcalZOQW
	eA=; b=bZ67gmdWomTX1DTDS48grnWGruRpjL/rOlPd/NURNhTfIEhlClImAfiVA
	ITTzdOoSdZZw/apuEd8Xt95YXg3LZOhqhPIwCsRCBXtpMMuxtbFWPqeRurplN31J
	gidpJV5/AzTKQeACugXpoqvvowv2QC3y5G4BPZX1zl8P36wUb9UDv8AcC80wQEKz
	Ov0tJf4JrH88VSAFvnrLUZ2zQtPEUkwAYoMctObxAwkB+EPEFsK6QtuKHkZFgbgV
	RBCIwM0RsnbUVCInrhQKD/B2OEwNBsASQBHjc22F7Z6C5zJURGeZQ4IaA1zeR0Ot
	m6LjuF0hIgrJDUPwuBfv/uY1U2vkQ==
Received: from co1pr03cu002.outbound.protection.outlook.com (mail-westus2azon11010057.outbound.protection.outlook.com [52.101.46.57])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h10s23133-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 14:19:24 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PO45J/SfVdnExyc01mzobdU1n5JmqEgfnrqvR3sV0JS9QkLrmwKwSfKnfdSAyt+KyZu0BkNFm7BruCfCuRQ4xaxW0qnQy6VMidi00hPEh0PqeHx/zsezWHCWTW1oKVJm++QaJ9CHy7oqe491stClT0m+Dp5RNEerfyojb4U4GhGbYuNa1fGEsC/JSEZu3DyIOHZQ/gy7rhLJkrqqt/LW2bDoNrxmXLwZ1HJCGSgcXbpPzwQ3ywKvom7oOc1/fLFpQBT/jzQdsEf+7IU2QRH1ssXW/Q2zSMGfAIyn2l4hVhHG3chIQB7iyNJNUHs9HMJWdI7YPM89Nv4twXIe51VXeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eqDP8NaQnXTdNW1L3v4DkPlzRMhAfQCEHjcalZOQWeA=;
 b=oXHVBftvLFwdsmMYw3NyyHJxUUUaancYX7Czu3pyPywciUeWtfkwGFJvCxHbafbxIWS4NWG7JGMnBscJGsm7wpDE31Cjxodg4bk1cx9VB1IgxpYJNwO8o4MT49MFk0CF2X6+19nvTdZxk64a5pgzTIKiVtqMAn0Xpmjha7fcqnN8KDQtBMoDHJlN6fI9luxxoMKSUGs9FonjZNsp1845WRuvtrUT993P3OUpXdTAk5WxMGxEXuOrFX3fd/vcX+L58YsRAPCY0XeOhNVj+OgIdWoZIh7uffdTbXZ1mYI76vtgX6ZMsPIIa9RK2yMWXmZ2fAa/v1hkZAlzDmDGxLO99Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eqDP8NaQnXTdNW1L3v4DkPlzRMhAfQCEHjcalZOQWeA=;
 b=SLcT/0ds70gzG9Y65HKkzWPQUB3Y68ohjUi6niALP5H2ySI0MJJeZwnHyFRBZhSKSy8spAvz0b60+2tnxDWx6wfcr7myZBXtujuEF/nCpUpLcQ9rBvZPbfieWEYvsTWac4jjWF7J1kqZkUMCOU/Htl9j157ZaDdgqMU7a/faLec=
Received: from CH5P222CA0007.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::19)
 by SJ2PR10MB6989.namprd10.prod.outlook.com (2603:10b6:a03:4cf::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Wed, 30 Sep
 2026 19:19:21 +0000
Received: from CH2PEPF0000013E.namprd02.prod.outlook.com
 (2603:10b6:610:1ee:cafe::33) by CH5P222CA0007.outlook.office365.com
 (2603:10b6:610:1ee::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Wed,
 30 Sep 2026 19:19:20 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 CH2PEPF0000013E.mail.protection.outlook.com (10.167.244.70) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 19:19:20 +0000
Received: from DLEE204.ent.ti.com (157.170.170.84) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 14:19:15 -0500
Received: from DLEE212.ent.ti.com (157.170.170.114) by DLEE204.ent.ti.com
 (157.170.170.84) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 14:19:15 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE212.ent.ti.com
 (157.170.170.114) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 14:19:15 -0500
Received: from [10.249.33.42] ([10.249.33.42])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UJJE3V3706461;
	Wed, 30 Sep 2026 14:19:14 -0500
Message-ID: <99ed72fd-bda7-42db-a974-42f01324563f@ti.com>
Date: Wed, 30 Sep 2026 14:19:14 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: keystone: sci-clk: Handle missing get_num_parents
 operation
To: Beleswar Padhi <b-padhi@ti.com>, <nm@ti.com>, <kristo@kernel.org>,
        <ssantosh@kernel.org>, <sboyd@kernel.org>, <bmasney+clk@redhat.com>,
        <jbrunet+clk@baylibre.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <u-kumar1@ti.com>, <vigneshr@ti.com>
References: <20260930190348.11720-1-b-padhi@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20260930190348.11720-1-b-padhi@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013E:EE_|SJ2PR10MB6989:EE_
X-MS-Office365-Filtering-Correlation-Id: 754bd00c-7e42-4001-4213-08df1f27bac5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|376014|1800799024|23010399003|36860700016|22082099003|18002099003|13003099007|6133799003|10067099003|5023799004|56012099006;
X-Microsoft-Antispam-Message-Info:
	KXrBAvlmpmtmo/4672CAHvnAWA93uB25GPXCZXHPsBfaDEmiZKgABDdwWz9vTsdO759s3/M+GThv0NUE7vHUpsMs15YWHbej1XbaDMGKz/JDYnMfZKJGC8pJxkkZQwWRzMbrIlfMSk9E2vEQqFjl1wPtxxYDM0zAGYLDbZdM/iRw2dXobYGN7rpC53xc3TWuaCXoW7j0aWKDJ5oPzb5CqseTzvaNGGAf//B44jYRNGnDUNs0qqEcOFsxzrpBU3A9JwPSGFDq5LdBbLj5RTPPmO8SQVg4YavRhYPKUHivYrZO2Tt99IegPAS/NSWfQL+VvJgV+BrOnlIin34+y00PNKndosGAmFQRgrgRlhgLrTeedpfakv5RasyLboHX2QI9IZiNj1ayMBn0/VViqCML5E8ZEga3MyHhFxvn3stDE5hAfcgBmnMGzzC2Of4Et+VKLl9nu43cDZxhfa9mSJlOGcwzbC4Xec05RfGtGxiFA3dqyUwRzbHROIMPnLWnuP+N0wdrq88vJKC2C5ac3WzaGnk9Qiy7wmh7d+1OKyyj+EP8AXGs3iNjGFERK0hmN8EO1eFgrHWrnTP9p9mtxuR0yiVAXR2Hq76hHq2K/jtG9YY4nmNlDzezBQpa7hwGWJycldwCsRksbKTOe5EVskQ9zpLFxUHuIp8mGT6k9jYTzzVdVtHd3ze+OS8gFidMFQPXjcmmRjRYrFsqTBfGLcYQ0A==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(376014)(1800799024)(23010399003)(36860700016)(22082099003)(18002099003)(13003099007)(6133799003)(10067099003)(5023799004)(56012099006);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZtF56hzk2bVJSL1YNe5xjzR/e1eLsssc3V/+nPKPke+yktkoCPNCNSnwWEyqcvr4buc72yp3vfdlRzU9lnTW7fxwGthYzj3daB9mwumr3XS1IbRkQWhX7iqvlm3DWGADsBtvxMLuZso2DN1ESixF9saZm/eXCBPBMxS1NHcAxwuJaTSSyepDjL13Q0MeAgv/mbKflaaDp1a9ZNmJUL6/U/G58//bHvHD3KYHi3F1GdnugnL2VninId9Lm4Q+A1uNdlyYApXfNATCcr39fznWRhi1vltGzwe7YK/vqkO/TwnDJatuFlvlHC/jUoWXlO123qnjv6TU7gzeFUKAmpE/Iwr0My1AU6Kvu5J4ZTKxiR3nF9sPupZPx0JVPs00elw/fhXBKHgsmqzRhKUwSl1uk3WWWtBSkkDT86CkgViG3m8Khc96W8XxIDX7jYKUfL/T
X-Exchange-RoutingPolicyChecked:
	K40+WM5MwAa0tA1Hn+4I9QNptj8ZKOsl4xrdymCB35i2o4VoVpfy9i7sUtzTLO25pzJlGNH36OBSRRnD04kPV6Bl5BMmZ/l+IhS0Zs6SdzcEZxxuC+gjLg8aj79u96+07jeRHBCx8YrFlD19vRyBhHTc/sO7xhFMbZp6fxO7wSGbjbtHn831E/J5T87y/zpZ5IDXGJPUzmEQGbrxfq24TyP1TyS1XUlY+aGnTg2/UKkVC/C6HmQ41UVWh13X7/B5QgOsbQhNy1JH9aLKGREhjSCHis2rqD/eIAXQ5GpELpFfTCncOQg54D5mndEBP7hsmMfGVAudn5GlDv9yLNqlwg==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 19:19:20.6638
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 754bd00c-7e42-4001-4213-08df1f27bac5
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	CH2PEPF0000013E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB6989
X-Proofpoint-GUID: VZaBuAfgxYkX2Dx_QGmSeOrTXTnVqonV
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA3OCBTYWx0ZWRfX+xM3JX2EkGdP
 zF18e0lmrshwvCiQfSbYqTrfM1KGTwUPJGa1cekexQLAcdRP8/uQ77KECM75cC+t09WNo4XK+7a
 Up51r+7cykk+xbkFauG0Af7rxl0sk+Vdpb9UmbUIo3GdayBVsPK4D5SgBMq9IZULcPgrVQfWpM/
 0eozUT0RAilEZ+oM5ek5xuoUM+tIGjBpUDe+4144/QxrWXdRfY5886gofAuSzfnKn4yPjjfiALi
 QRUrY/zY40OocxOz7zxtFpERUtwkWr6ZDnImhifrdCZvvJfdXIITO3xlcQPxFOKNKMycK7A/VLx
 buSGDxfPZRe2s9hPhpfLkYckswMBzzhq6f7X1GZ20CzUbzq/fbieXTQZIRrwwkgAmhCXC1Wf5eO
 JmvHk6C41rKo9BhD8mp3lUrBI67LkX4x/8vdJ22dx5GBUcYR8g+7EIefXu4hpq/B3Q2pMF1Cc+q
 wZmNtfcDxfc4/C8Symw==
X-Proofpoint-ORIG-GUID: VZaBuAfgxYkX2Dx_QGmSeOrTXTnVqonV
X-Authority-Analysis: v=2.4 cv=G6aJgNk5 c=1 sm=1 tr=0 ts=6abd60bc cx=c_pps
 a=GxUr472PnxEa6H6od3s2nA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=NEAV23lmAAAA:8
 a=sozttTNsAAAA:8 a=-1wFsR_Ux2lMD7Y6Gz0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA3OCBTYWx0ZWRfXyBAkTaZ1syjY
 k32nFpKoi+VWE4cmAzQY+eGhbPQsvaKVVRVnhzCadE4RNEbE3B8rH0rTQ7SpQ3jU3+kOj3lQ8W9
 W84a1Z7iC/lXwaLPQPfIFuTfSv8mVkA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1011 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300078

On 9/30/26 2:03 PM, Beleswar Padhi wrote:
> The sci-clk driver unconditionally calls the get_num_parents TI-SCI
> operation while scanning clocks, both from DT and from firmware. This
> works for all cases today, but with future support for some System
> Controllers (e.g. PDM on TDA54), this may not be always right.
> 
> The PDM system controller on TI TDA54 SoC manages clock parents
> internally and does not support the clock parent related ops. Therefore,
> when scanning clocks from DT, treat the clock as having a single parent
> if get_num_parents is not provided. Such a clock is registered without
> parents, so the get_parent and set_parent operations are never invoked
> for it.
> 
> Scanning clocks from firmware relies on get_num_parents to discover the
> valid clock IDs, so return -EOPNOTSUPP in that case instead.
> 
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
> Testing Done:
>   - Boot test on all keystone and K3 platforms.
>   - Verified that the patch does not result in any warnings or errors
> 
> Logs:
> https://gist.github.com/3V3RYONE/d821cea46f5dc1e70a759c97878fa487
> 
> Note:
> This patch is independent and can be applied directly.
> 
>   drivers/clk/keystone/sci-clk.c | 23 +++++++++++++++++++----
>   1 file changed, 19 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
> index 9d2094bd48e3b..5bf615893a8c0 100644
> --- a/drivers/clk/keystone/sci-clk.c
> +++ b/drivers/clk/keystone/sci-clk.c
> @@ -468,6 +468,13 @@ static int ti_sci_scan_clocks_from_fw(struct sci_clk_provider *provider)
>   	int gap_size = 0;
>   	struct device *dev = provider->dev;
>   
> +	/*
> +	 * Clocks are discovered by probing the firmware with get_num_parents,
> +	 * which is not available with every system firmware (e.g. ABI5.0 PDM).
> +	 */
> +	if (!provider->ops->get_num_parents)
> +		return -EOPNOTSUPP;
> +
>   	while (1) {
>   		ret = provider->ops->get_num_parents(provider->sci, dev_id,
>   						     clk_id,
> @@ -589,10 +596,18 @@ static int ti_sci_scan_clocks_from_dt(struct sci_clk_provider *provider)
>   				sci_clk->dev_id = args.args[0];
>   				sci_clk->clk_id = args.args[1];
>   				sci_clk->provider = provider;
> -				provider->ops->get_num_parents(provider->sci,
> -							       sci_clk->dev_id,
> -							       sci_clk->clk_id,
> -							       (void *)&sci_clk->num_parents);
> +				/*
> +				 * Firmware without get_num_parents (e.g. ABI5.0
> +				 * PDM) manages clock parents internally, so
> +				 * treat the clock as having a single parent.
> +				 */
> +				if (provider->ops->get_num_parents)
> +					provider->ops->get_num_parents(provider->sci,
> +								       sci_clk->dev_id,
> +								       sci_clk->clk_id,
> +								       &sci_clk->num_parents);
> +				else
> +					sci_clk->num_parents = 1;

Why 1 and not 0? Also, why not keep `get_num_parents` defined, but just have it
return num_parents as 0? Haven't checked but if that works the same, but if it
does then it saves us from having to make changes here and we can isolate
firmware differences to only the firmware driver.

Andrew

>   				list_add_tail(&sci_clk->node, &clks);
>   
>   				num_clks++;

