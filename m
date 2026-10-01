Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D7C3316905;
	Thu,  1 Oct 2026 06:35:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790836552; cv=fail; b=uKSIzi5YqmW9JkRn7AW37wVuyeCPIgFUQKxh4uEYGQ05x8iiGPSYDMwgbUU3OV9CPNIouJB54+FYNua/LcF6q5vQkDaNQdJUVZXzKSnMhP1WJVEA+2m2p77W9ZXdNHBR90bgojA0LbYh6asG2hSxdgMTCytBgpYLN9MpXro2Upc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790836552; c=relaxed/simple;
	bh=Bf+KBc9j0tPP5EXWT866a4/WzZxiptNl6PYuOYkwV20=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=f3zCvnqsbUEjILFtMPSBbQBcCPzjafNY7fQUPrYefIIQ0714qFJsrNZhJpCpZMBe+J8PvEW+89AcTqi/lzunNT2lEalWDbfFxZinQpxVjwUYQcqRx0PU9w1B17GUgfg+VPrHV/1zYhYDDtAuCrvltVGiUf+fT1TgK5huYdZxYBo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=OSGDjAkP; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=RS5J7qeA; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="OSGDjAkP";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="RS5J7qeA"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 6913fh3X1197679;
	Thu, 1 Oct 2026 01:35:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=K+dgRNxBW7MQfOzKSjoJvcUWcxvDw8xD+L/BcKXZx
	us=; b=OSGDjAkPnEHHZ++mwB2Dlxqy1NbWgACo7r9cmvfDom2jHOVgY6Sn5SwKD
	znyZ7oTRtE3nh1Kdh3mwxoJBShJjyTWdrVkQ9DreGWHJnho4glOGRdOLoSvnedho
	8OHgjtuO1NPiZu7oGn0Esg2SVf2CW+m+sv9pWvkXEZnaO1/9QatKgboCrGO/qIUn
	xQfK02pDbPYBXKJISGM7iAbPxMXEOyHHdbijNpha21EfqocEnJEDUyW/jclOy1W5
	p96oD/SYBksnKnl6ndVysLVPyJznobrKDBHGlfU3OU76Zk0nLLwXuZXt/vYLm+BD
	fFw0kPcO7YS4ViOacnR7FBWg0OfkQ==
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012017.outbound.protection.outlook.com [52.101.48.17])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h10s262x1-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Thu, 01 Oct 2026 01:35:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DkCO0+9hC6T2VUQ5Jea4M4xjgengKk9shy/oLASk7FQuhlPjt6T3PTf7ZNfGYY1FcGrKgZhzg9yWzeKF/9FdastYKJX5r9eLFufvKOBSEppjmZthO2TqvWvCACgedgNBHae7TWlY62ltTO6k7BgpGWHesoA4gbQxEHNtgAIUCr7QN4GsGI8G5OfKmwtwEqn25aAT0zSBwkXlBvK3H78teh9P50slNDI17KqHqMO3qCdV8lvE5jLELyZEPlaez1zLEkLrYnG0imWVfGSpjN8neBIsLCRneNzFzW3cl1A5Ub+sRTebvPmMfivngVZWj3GH5r+x2MWk5F6Z8sb2ehHsyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K+dgRNxBW7MQfOzKSjoJvcUWcxvDw8xD+L/BcKXZxus=;
 b=AWk4T/frJeIMKPLxvLNK20x9kUv0UEpHfPFihTcLgM0bcODordb9I89mv3eDKK66qmlP1Z5lajA+yJ7ULhIFTc/N+hgkdStImgenY6P+wCqZRy4mk3C179LUvcPUbmAYApe1BfPHLOwgx8WOOzzZRCbv0IKUnf0j6elKtYTtflJQQwx4wpxTKVBGGsFTxZtDrRZ+dMLdPkDwSyIcaLop2dACFAoVszciyHOZxnmpaTallsg6brAqA5UVGT9UmyuMRGUOsMUaW7SFGypThp18BM0Q7zSWyu32xUF/c0StSE5Dbnrweq411fIx4GmKHmnTzkwxQT4O40wd56PfKG9Xxg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K+dgRNxBW7MQfOzKSjoJvcUWcxvDw8xD+L/BcKXZxus=;
 b=RS5J7qeAQPPGvmP8gnLvQfGDkI8o2MYnRefP6gN+BEqeSZUv02xmpmqKWWjuXKkr8L1WqHEk72bviRIjfjV/Zm7ggjya146Gvg31ahheTtRNTJfsVtPG536dFrqs1LcA9YpOyBd2YF39+3iPpwS403K/OnL6wRtAnQA9Yu4HR4I=
Received: from BN9PR03CA0170.namprd03.prod.outlook.com (2603:10b6:408:f4::25)
 by DS4PPFF0E76365E.namprd10.prod.outlook.com (2603:10b6:f:fc00::d57) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.15; Thu, 1 Oct
 2026 06:35:29 +0000
Received: from BN7PEPF0000009F.namprd04.prod.outlook.com
 (2603:10b6:408:f4:cafe::84) by BN9PR03CA0170.outlook.office365.com
 (2603:10b6:408:f4::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Thu, 1
 Oct 2026 06:35:29 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.21.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BN7PEPF0000009F.mail.protection.outlook.com (10.167.248.151) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Thu, 1 Oct 2026 06:35:28 +0000
Received: from DFLE200.ent.ti.com (10.64.6.58) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 01:35:01 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE200.ent.ti.com
 (10.64.6.58) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Thu, 1 Oct
 2026 01:35:01 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Thu, 1 Oct 2026 01:35:01 -0500
Received: from [10.249.144.74] ([10.249.144.74])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 6916Yvcp1382592;
	Thu, 1 Oct 2026 01:34:57 -0500
Message-ID: <01e74f08-f78c-4642-83ef-562537396ede@ti.com>
Date: Thu, 1 Oct 2026 12:04:56 +0530
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: keystone: sci-clk: Handle missing get_num_parents
 operation
To: Andrew Davis <afd@ti.com>, <nm@ti.com>, <kristo@kernel.org>,
        <ssantosh@kernel.org>, <sboyd@kernel.org>, <bmasney+clk@redhat.com>,
        <jbrunet+clk@baylibre.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <u-kumar1@ti.com>, <vigneshr@ti.com>
References: <20260930190348.11720-1-b-padhi@ti.com>
 <99ed72fd-bda7-42db-a974-42f01324563f@ti.com>
 <5646ef7c-bd4a-49f8-91d9-39c8249b987c@ti.com>
 <30efa0f0-7689-4e39-ad38-1094cb46bf6c@ti.com>
Content-Language: en-US
From: "Padhi, Beleswar" <b-padhi@ti.com>
In-Reply-To: <30efa0f0-7689-4e39-ad38-1094cb46bf6c@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN7PEPF0000009F:EE_|DS4PPFF0E76365E:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c661e98-fa9c-42a9-5e1a-08df1f862f20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|1800799024|36860700016|376014|82310400026|13003099007|4143699003|56012099006|10067099003|6133799003|5023799004|18002099003|22082099003|3023799007;
X-Microsoft-Antispam-Message-Info:
	H3BGYr6ZW5q43lqOyyfzMB4n5C0oW4wy7qLDMovfxlThqvKJHU+2d05Uo1clk0ws0Kod6EqFs2A4ddvjykbYO4d6/kIbw4fDkNsT2dGztHcwwTmXo0IiSe713JhsE/OepQPJu5m7AMfxapjk6F6YWn9WzoISUzlsFmQe1RrN3kEEo3qnrIT4B8Usj1NON5Qz6W8ao1A9u6zqRB3FnAHpd5bxufH1u9DbXX/zqh7Qo3VW7amAXxzr0w2QPVknlCwcATrk1LKztvrnvHTd5S+WiSue/teLC2fv4DPyD+8RB4FP8O5DDfpoi4qghfQc68Jqw9UyxJWYGcpf0KJhBS9p9+qV7QkelN1BxdhdE6Yt2x99/0pR1LxvWXJKtjceuJBDVi5uRcLW53cbtC/gzpFwV8RVPWoKZsyJTlIfT+sOw27aQ2vr7Cm4+kzOvvhnEzAXyuqf4mSXirvB0QBBJrwNPJH48DyhaItUDTf2D+cL2AHmOPxwC+3jhQRj2Psr2cegJXZZ2Hyf23sAQPE+agjT2QcYSHV9xtRWJRoMLRJqt1IGf7GixtWontzWWi0xdJADmnehEtFn510YBKGoEPIrb5BwxUaAuppm5OkauYEvH0Yvu2iQQzV6lxA5Km5xW2RuzS3Dc1AR0NPUmKW2+gnNxD670u7RiqUEd/xvAq42vc4MjykxdoV/roa76VXETVp7GXlFNWgbm9zdhHaNzYmrEQ==
X-Forefront-Antispam-Report:
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(23010399003)(1800799024)(36860700016)(376014)(82310400026)(13003099007)(4143699003)(56012099006)(10067099003)(6133799003)(5023799004)(18002099003)(22082099003)(3023799007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	r2qSzvvZbO4uuNc+QcI//TIm/PPnXNsmS3AEGl8Zu21lwFgJltbEjehzY/BiTqKujGYgj+f2OPVfB5U6Th7I4Lyyt0jidC8+ofYD0GsMgZZfI/bsSNa1YDzlo8/lXL1NnEHVvnNLoNpdaYx/dRM3LCIGtXTWDfp386Bs1vQbgvVq4uQJm9Rl2lr3nNSkH6Hojz/wGaZldDoZHHvaMm27lzykPszPXFWn7U/nDel4uNpGEfHCyvFKSfjTc5iNXbbQ7rvY+XDpv9s6PPH7o11udRPx7mB5mLBuM1KdH3dVFZ8qQpzxuPn3rybyQYqzt5ylp4iyLsf7+RiQwYebh7vIz7hlcuDaRDcw3kSL8zzJjIgxLay9Uv9Pzq4KQOUDvtYQy6Y7LQBAuTAWc0u15Cr2QKwaZVA2OTolYJplXPHdbJJKmf00cVBrH52gcBrphRf7
X-Exchange-RoutingPolicyChecked:
	TUaa527rY2c2TDzTHL4ubcSUfvpvWqLI+ZXnUJQjJnnuqggUeDHlABnzXppqd+gkERIQrtWU4rGhs4B0SoZbwbsL6V73wHv/MHeGTkc6xxCYCtaErobQPwdZGiLHhAqn/doOeON3iCCFn/EjhDPpo08BixZYRfuXFVPftf3q/CcRo/WWYizCkNvhKp5fln3ITPk9x1N05sNbL2PwQ7LvbvZXqGK7uVPIdcCG6uTyNBgiq46jNza9c2K+5ngAjmwzX/JeTBcnYFOqq4myZwptqQFbdk1D2KusCtBAylgG+JWEmb01dphgZJC9xUw//yqbIVtj68tXCOKeV3uHbXP9WQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Oct 2026 06:35:28.5476
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c661e98-fa9c-42a9-5e1a-08df1f862f20
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN7PEPF0000009F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS4PPFF0E76365E
X-Proofpoint-GUID: UvdEZiCj5ntOkVt_SPgNvpTZsTaCmAg_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDAxMDAyNiBTYWx0ZWRfX1Jtp20h4iG8w
 fY0gU2OfnS4hezib1Du8d6q2KU83sLlccxUZ4jKRJwXbFnIrHvrjgjli4vfVtPz1lLwCy66pZ8a
 o+Guwx+zfB2gL8+7/ea3V4SOlF4ciPsQ6huSDdHYSVVOxDtYN1c+b57vr+dVtAu4eiNo27EwZiR
 3Eqcbv/xuH2Goy15fzWD1b+P8zLEmnjuiv7xVtuwk3kW2EGs+DYHGriUpCoujL/E5KeqgWjilQi
 3hzxugMCkZOaFwqzQJQ9RJFmc/oLjpTVNCFE/R4MogkSvg3Gg6WCloaYPYfiCYLs8YAOFKLnY4e
 uD4M6nJHxc1ttk+8czC+7KcU/1JsEk0kRvxu7PpznQuGbvZbVZ+obYnThCesTEErcDqwbOWBW3D
 NZ+v0ORROT0oYYD/tH8geW1CTrvFqFRnwoTD+QF33GJoilvM27Zog58N3jPSBd107M1IlGjCrGU
 +7QyizhGFzXc2LOiBsg==
X-Proofpoint-ORIG-GUID: UvdEZiCj5ntOkVt_SPgNvpTZsTaCmAg_
X-Authority-Analysis: v=2.4 cv=G6aJgNk5 c=1 sm=1 tr=0 ts=6abdff35 cx=c_pps
 a=0w/E51Vap1Xy1BB5zk4tLA==:117 a=tJyPKKxUohctrY4NYmUjkA==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10
 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22 a=Z8NIEmU8O1QQgoT56wFK:22
 a=taLDd7a_hP9WKsMzeGRc:22 a=NEAV23lmAAAA:8 a=VwQbUJbxAAAA:8 a=sozttTNsAAAA:8
 a=kdYuOxiikmsQCnhyxFgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDAxMDAyNiBTYWx0ZWRfX3eut65U+g91R
 IoKiFOSiz0kag3AfSw67Y2TiMQMShhiFjvqFPQKRTWZsJEXhMCp+M7G1UwFjZU8b2aWJ/soejNE
 xLMSQP6EgFL2hqcxdmFRtvE+fBnBTaE=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-01_02,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2610010026


On 10/1/2026 4:22 AM, Andrew Davis wrote:
> On 9/30/26 3:58 PM, Padhi, Beleswar wrote:
>>
>> On 10/1/2026 12:49 AM, Andrew Davis wrote:
>>> On 9/30/26 2:03 PM, Beleswar Padhi wrote:
>>>> The sci-clk driver unconditionally calls the get_num_parents TI-SCI
>>>> operation while scanning clocks, both from DT and from firmware. This
>>>> works for all cases today, but with future support for some System
>>>> Controllers (e.g. PDM on TDA54), this may not be always right.
>>>>
>>>> The PDM system controller on TI TDA54 SoC manages clock parents
>>>> internally and does not support the clock parent related ops. 
>>>> Therefore,
>>>> when scanning clocks from DT, treat the clock as having a single 
>>>> parent
>>>> if get_num_parents is not provided. Such a clock is registered without
>>>> parents, so the get_parent and set_parent operations are never invoked
>>>> for it.
>>>>
>>>> Scanning clocks from firmware relies on get_num_parents to discover 
>>>> the
>>>> valid clock IDs, so return -EOPNOTSUPP in that case instead.
>>>>
>>>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>>>> ---
>>>> Testing Done:
>>>>   - Boot test on all keystone and K3 platforms.
>>>>   - Verified that the patch does not result in any warnings or errors
>>>>
>>>> Logs:
>>>> https://gist.github.com/3V3RYONE/d821cea46f5dc1e70a759c97878fa487
>>>>
>>>> Note:
>>>> This patch is independent and can be applied directly.
>>>>
>>>>   drivers/clk/keystone/sci-clk.c | 23 +++++++++++++++++++----
>>>>   1 file changed, 19 insertions(+), 4 deletions(-)
>>>>
>>>> diff --git a/drivers/clk/keystone/sci-clk.c 
>>>> b/drivers/clk/keystone/sci-clk.c
>>>> index 9d2094bd48e3b..5bf615893a8c0 100644
>>>> --- a/drivers/clk/keystone/sci-clk.c
>>>> +++ b/drivers/clk/keystone/sci-clk.c
>>>> @@ -468,6 +468,13 @@ static int ti_sci_scan_clocks_from_fw(struct 
>>>> sci_clk_provider *provider)
>>>>       int gap_size = 0;
>>>>       struct device *dev = provider->dev;
>>>>   +    /*
>>>> +     * Clocks are discovered by probing the firmware with 
>>>> get_num_parents,
>>>> +     * which is not available with every system firmware (e.g. 
>>>> ABI5.0 PDM).
>>>> +     */
>>>> +    if (!provider->ops->get_num_parents)
>>>> +        return -EOPNOTSUPP;
>>>> +
>>>>       while (1) {
>>>>           ret = provider->ops->get_num_parents(provider->sci, dev_id,
>>>>                                clk_id,
>>>> @@ -589,10 +596,18 @@ static int ti_sci_scan_clocks_from_dt(struct 
>>>> sci_clk_provider *provider)
>>>>                   sci_clk->dev_id = args.args[0];
>>>>                   sci_clk->clk_id = args.args[1];
>>>>                   sci_clk->provider = provider;
>>>> - provider->ops->get_num_parents(provider->sci,
>>>> -                                   sci_clk->dev_id,
>>>> -                                   sci_clk->clk_id,
>>>> -                                   (void *)&sci_clk->num_parents);
>>>> +                /*
>>>> +                 * Firmware without get_num_parents (e.g. ABI5.0
>>>> +                 * PDM) manages clock parents internally, so
>>>> +                 * treat the clock as having a single parent.
>>>> +                 */
>>>> +                if (provider->ops->get_num_parents)
>>>> + provider->ops->get_num_parents(provider->sci,
>>>> +                                       sci_clk->dev_id,
>>>> +                                       sci_clk->clk_id,
>>>> + &sci_clk->num_parents);
>>>> +                else
>>>> +                    sci_clk->num_parents = 1;
>>>
>>> Why 1 and not 0?
>>
>>
>> Functionally, 1 and 0 are treated the same everywhere in the
>> driver. Could pick either.
>>
>
> Exactly what I was seeing, setting it to 0 just feels more correct.
> Might be some future case that checks on the "1" parent that doesn't
> exist, but "0" parents should always result in no parent check.


Sure, will do.

>
>>>  Also, why not keep `get_num_parents` defined, but just have it
>>> return num_parents as 0? Haven't checked but if that works the same, 
>>> but if it
>>> does then it saves us from having to make changes here and we can 
>>> isolate
>>> firmware differences to only the firmware driver.
>>
>>
>> This works for the above branch where we are scanning clocks from device
>> tree. But the code path where we scan clocks from System Firmware 
>> explicitly
>> depends on a NAK against some clock to get out of the infinite loop. 
>> If we are
>> writing a get_num_parents() which returns a NAK always and sets
>> num_parents to 0, we are patching the protocol at this point. This 
>> does not
>> give the correct view IMHO.
>
> We wouldn't return NAK if the clock exists, we return success and
> set the num_parents to 0. Only for invalid clock IDs we return NAK.
> This should keep the TI_SCI_CLK_PROBE_FROM_FW path happy.


That should work. Although, I am thinking if it's alright for us to 
implement
clock parent related ops when the ABI spec says that it's not supported. Let
me know your preference, and accordingly I can send a revision for this or
handle it in the TI-SCI ABI5.0 series whenever it's due for a revision:

https://lore.kernel.org/all/20260930194131.117129-1-b-padhi@ti.com

Thanks,
Beleswar

>  But really
> that path has been disabled for many years now and I highly doubt it
> even functions at all anymore, it should probably just be removed.
>
> Andrew
>
>>
>> Thanks,
>> Beleswar
>>
>>>
>>> Andrew
>>>
>>>> list_add_tail(&sci_clk->node, &clks);
>>>>                     num_clks++;
>>>
>
