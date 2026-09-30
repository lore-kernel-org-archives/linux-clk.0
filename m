Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 341863B6377;
	Wed, 30 Sep 2026 20:58:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790801925; cv=fail; b=BuC8bdUFBDWxCG6f3e8raeTZyajGsTol/7fGPsEerdX0bK7DEZ4Sfqhk8SCVuajtFGCmdAeZyJVMPelFi9vsJFPKYtc7TRK8CNnkQMhDdzjijz34GjHi9e7v88gDNApqY/YRPo3STisRIk4cVAa4tKsuIkN7NhQXt6dd9lpsZSw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790801925; c=relaxed/simple;
	bh=GKgJfL4GJNQztfdq60DS8MRueDp8KuHFmExooAQfKoc=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=BuH8IVEn5DnuTbt/Xy9KioZ4lyhIlJGPEllkfx9vvq7/K8miy5TBbDNtFHncBX550oPQ3QWmZrqYttPcXQQdYhYgF2z7QLSHTaEsAgrErEr/Oib70QCBpNLD3Y4IvEpjK+PJ7WGlgKDgv2nUDVZjqzO1WwFrC57kKIWN+gv87rY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=leHblAUb; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=LUMS8Oa6; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="leHblAUb";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="LUMS8Oa6"
Received: from pps.filterd (m0380145.ppops.net [127.0.0.1])
	by m0380145.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68UKkAC24104425;
	Wed, 30 Sep 2026 15:58:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=ODLe2DzL/4rGixpI9jPaEA7rI3SlX9mLo3uACkgJJ
	QE=; b=leHblAUbrBcq66CDkPRigOX8nuJRuk8IkrsRnGc8zmg0bd71P5WD5ZtZt
	6dFooFKp960P6T4iHfbG0sImU6mL+iXaqQkNMITowejnRjuSKysA/x/Yy91xDC5g
	ZC+A7q+7yYbi43S6RIgLo1WgKem2Qtxae8qmTPHQjl9c2ZMZO4WB5KnONFVsfqib
	1Sy19qSa8UppMp3Hhb0AZnFLu+CaqYD+U7I7KssIoW3OUoSlckTFzYZz+oB3h8p6
	ISiroM7CXKPF4eazoR31woth9EQVNlD7VSAb3EVZjOCHo9BTH9zj6m3mY5xmFr8X
	cVsavJQ0F5LveGiM7f5yJOIHE5n1A==
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazon11012010.outbound.protection.outlook.com [40.107.200.10])
	by m0380145.ppops.net (PPS) with ESMTPS id 4h10t1ue95-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 15:58:34 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CjvFkB8ljZ4yX275V7cLwVuOkroD4DRS6p7tL8XJ78K+YHX7xW7lufSIH/3JbcL7JoAhLHEiUtgTFxVcdmvFdLGp9YO1Jz6SWnDcv151jYI+waGTRqTLVZC2M2pYB2nWDtzMB9XolRrimO92FbJBACVEomtoTBgMjzQ+/9gv5Fo/g+y5Gf287YSeAj47aoZacg709YsAq1xuwF6EM0yK95hc481r4DbzH+Gf8fbdytvMKFrBS3VXsYOCYuWGVKPrBvBz47ALeLlf2MHxi7CQQg5ggiJbbYPnDePz9nrPMOPbTps6KEHHkqenRgvTV/iYktLhyPCuZmc4uN/PG0DASg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ODLe2DzL/4rGixpI9jPaEA7rI3SlX9mLo3uACkgJJQE=;
 b=IBFesl5sFgMLw9kZO2cr6IW+xH32rx/XGpye8s9YOld+1TCcZrf6Dt7h7yuawoGcvNS7Wua+AmhGEpeJwBJpjDAHoAacisMjL4nfP0xXg+cLdY2KwY+27fXs87qLZ6/FiM1uL2kBYOR/tPjPjM0+ceUudlMduisLPKxdpL6AwXOKLK1Px2M9By5CB0fMP7jzucKI4rzWqiU0Laa6dDivg8teq7BUJYrDlRTMpjanRBu9WNOmNxSk7UhVY/MH+N0/xP2bGfscEJ6HVX1xTultaWUx2jKh5DUfdMigspXu4s21s80vV2fph1TTbHN7PKDlwkf2v5U1j3ubB8IQWdPFtg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ODLe2DzL/4rGixpI9jPaEA7rI3SlX9mLo3uACkgJJQE=;
 b=LUMS8Oa6L8x5JNo3l6fecL+0UuVZMK/aGgnLmdJsj89l7gBuBeu+5hu1+A18ZbeWmVXZnTIbszjM26q0gZi2mPl7BFmGYVwQuU8JA9c/l2Onrdvt2sD7v0hOc9cA5rNogNM005K0gis4uLBcRYXjg4Sxw5eeKmxcpjuHNWOlP9s=
Received: from CY5PR18CA0002.namprd18.prod.outlook.com (2603:10b6:930:5::25)
 by SJ0PR10MB4462.namprd10.prod.outlook.com (2603:10b6:a03:2d7::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.14; Wed, 30 Sep
 2026 20:58:31 +0000
Received: from SN1PEPF00036F3F.namprd05.prod.outlook.com
 (2603:10b6:930:5:cafe::93) by CY5PR18CA0002.outlook.office365.com
 (2603:10b6:930:5::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.15 via Frontend Transport; Wed,
 30 Sep 2026 20:58:31 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.194) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 SN1PEPF00036F3F.mail.protection.outlook.com (10.167.248.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 20:58:31 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 15:58:16 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 15:58:16 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 15:58:16 -0500
Received: from [10.249.144.74] ([10.249.144.74])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UKwBqu3838477;
	Wed, 30 Sep 2026 15:58:12 -0500
Message-ID: <5646ef7c-bd4a-49f8-91d9-39c8249b987c@ti.com>
Date: Thu, 1 Oct 2026 02:28:10 +0530
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
Content-Language: en-US
From: "Padhi, Beleswar" <b-padhi@ti.com>
In-Reply-To: <99ed72fd-bda7-42db-a974-42f01324563f@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3F:EE_|SJ0PR10MB4462:EE_
X-MS-Office365-Filtering-Correlation-Id: bcd59672-e1a9-4234-6bcf-08df1f3595a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|36860700016|82310400026|376014|23010399003|56012099006|13003099007|3023799007|6133799003|10067099003|4143699003|5023799004|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	TFpd8Kkfq7ERajCCXVN92wEpTrX4lY0wTI1fortW9U9sdZBNvbGlHrXoYU9DzbGmfJ804Oi75kCJAOAPxvC2XnUd0QpfswfJPBB7I7XbpmQmA3vOF/4kVCfY1wxGyBe56PfB4nFNLayE07GxxzWGgAnBP4ps82wuLM/aMKIMQyk9L8PVUo/7Qh4CjcfzEm+4Yewf3+Ze8XoNAjOELnlme9T71AwDKMUGUnrC1Bo7CTcWMr0EcuRx1B2jQHvVjnsQ4n9F4sKuXS3GO1jNiWyixDRPib/Ax8KAnmGKjh+LDh3nMy2f/6sYXjGoXcGG6IxKsfze23fnG/m6DnlTXTqbqwm3vPlOj0FrDQLckK0DYOi42HCNctL8oM0CFYs/F4DKJHU63tlGMFvL05Epa9eZGcRYqzECSsiArByARBzvzpxAbQWhfsO4VmMAbKSh2KyS/gG/Yqnr+Dm3PSnNjjZjH3FvqBJPmsBSzyXJL4ocbVrqljlwJaAqDRVl77U+3btKODLgTKo+10bNiSliqzG+jqAHvM0MVp3xmX5lNTfavBZrP2q43S2yozNG4XGUalZdcIi4x4F511y2+kPMQ4I1UvxTZAr7SSlfAOwOUyK6v/M2nlM2ofjpci18X6HHabUWm2X2O/icC6Y0jrOl8TCsiyZTjVNMcCVcoVzmRTY2wo7pa/jKYsWOb/Vz53M8oKLAQlYvF/8gJ3H20S0yG6z+/Q==
X-Forefront-Antispam-Report:
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(1800799024)(36860700016)(82310400026)(376014)(23010399003)(56012099006)(13003099007)(3023799007)(6133799003)(10067099003)(4143699003)(5023799004)(22082099003)(18002099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	jLt3ZOFw8ToxKsz85ABpjwIP/ikyH6ZjmkUCEjBCMOfdkj5YMLqZpwQUrBzK72u0jyXJiCOmL1EUfyH2vLyp5XSJ5oE1YqVHqTvj4Pp6RhfylnxZOvHszSjQamDX6VbSrT+kE2lH9Vm9Y4NjXRBDMxRMM0phWUUrRZjzkyaf7JCfSBlrK3jRCZStKrz5lvX2TKGjkF05oZa7xfbgcdfB7m9IyFS10Pfm0ABPMopJW7N/Z8k+u7bE8Q8iv1VSXYZzrUHrqzKBySaOzUcDyOoSAyMbOetuHjrQB41KzzGuSA5jSr8zr2SCdwjnIVnAdklpVjpT3argDQO9yzNGidiJ0lEPbjrYPjmdKgkh+bnTcV/VZwjwnbMXpjlv9f810ZjDXNucsf8I9UExmV8MrWQpru5QKm872iX1UuSrkkP9BHhzQbLHA/IQI7Y95n2QO6Ng
X-Exchange-RoutingPolicyChecked:
	IBy5Ugi4rmxzxttJi2NhvZv1goNUgON0WWymgxNjQBRbXwAfwNHLTAGBWBlesWiqCLudG8T6H+eDmVkxQH/gM26ljrcpU8302Fw1l7iQ8SgxWclvL3eBvctKVUOm6pqcvzbBE61NqCTQm9bKUEMArxQ+YP39nxAi8HtnThh0ERual8zZS2faKKkZUb3uDT1cRoRf2rrId5IYTVgADjvn0rA1653DKSp9DUncKazHNCKGyOl79ZXfkawIZNHxLOqqHzOzRmzRGoWO4ndL0kA/v8Fm2v37uIRP8TbSnSTXZdnEfk6mipY4GeSFfOCbqrnOjVsahURTbpwHnoUBudUuhw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 20:58:31.3515
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bcd59672-e1a9-4234-6bcf-08df1f3595a4
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SN1PEPF00036F3F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB4462
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA4NSBTYWx0ZWRfX94DghoZ9VZ9+
 tBtFO/usHXNZ6HkbkkpjZpOP1j/7Lxk+7jIjo0aC09LcIC6OpbfHuNnwwFQ+wKwHasEn1bMQY3F
 31Tchx4p5yBaEWJkOisRNR1BKm2hWdI=
X-Proofpoint-ORIG-GUID: 8-YBEywEbrApn-5M3bIcbLDDPF7AfA6s
X-Authority-Analysis: v=2.4 cv=C7R8WgP+ c=1 sm=1 tr=0 ts=6abd77fa cx=c_pps
 a=I0dIGTHPrmtoUi9UVMbYOA==:117 a=WotqVVQAdb04rnGuttW3Kw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=gO1vWkAQAl3rybz1DQOp:22 a=NEAV23lmAAAA:8
 a=sozttTNsAAAA:8 a=xVlYqOM5LvOgblX56WMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: 8-YBEywEbrApn-5M3bIcbLDDPF7AfA6s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA4NSBTYWx0ZWRfX9IghckXpTjAE
 u/D5v/oNmL6u9jMz6cWIiux6TG+bU2G0fhETVXpH5bhzSxPWs1Q5yAOqGF141E2wmoQJq2DiKsx
 JxZF5NM9t+bWBQifjzyX5INBhCoAAUPIv4vQXjumbP51GF102q6Pu3nKvLOdJQarLosRAlK/K++
 bPkjBflwYl654ftF7vQHAhF7VysAkhnp/56A+xnZnR9Y3PFpkpwgRs7Es2VL4b/h2dIdytkqMx/
 e4ykgB4G1nOYHMxS8VHWAumuIU1hOLkK6/cwEEsemxj6m6E+kt4Ux8mTQmRmHVsUcfYnl2tAHH6
 trKOjRzewbbFWSIowrCbQ86wWjuRWAuBh9/pV51EgnHI/hpaBQGhmA+CtRcjBNqvdE5B+PL7IcB
 di1EdmAbcjBzICMsKzy6nQa8RpTsB8YeEftPAyCg8KeGVstOx4e1vDFn5qrz5K5yoo5ui+dTg/k
 k74bsjdjAGCXSEZIpYQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 impostorscore=0 spamscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300085


On 10/1/2026 12:49 AM, Andrew Davis wrote:
> On 9/30/26 2:03 PM, Beleswar Padhi wrote:
>> The sci-clk driver unconditionally calls the get_num_parents TI-SCI
>> operation while scanning clocks, both from DT and from firmware. This
>> works for all cases today, but with future support for some System
>> Controllers (e.g. PDM on TDA54), this may not be always right.
>>
>> The PDM system controller on TI TDA54 SoC manages clock parents
>> internally and does not support the clock parent related ops. Therefore,
>> when scanning clocks from DT, treat the clock as having a single parent
>> if get_num_parents is not provided. Such a clock is registered without
>> parents, so the get_parent and set_parent operations are never invoked
>> for it.
>>
>> Scanning clocks from firmware relies on get_num_parents to discover the
>> valid clock IDs, so return -EOPNOTSUPP in that case instead.
>>
>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>> ---
>> Testing Done:
>>   - Boot test on all keystone and K3 platforms.
>>   - Verified that the patch does not result in any warnings or errors
>>
>> Logs:
>> https://gist.github.com/3V3RYONE/d821cea46f5dc1e70a759c97878fa487
>>
>> Note:
>> This patch is independent and can be applied directly.
>>
>>   drivers/clk/keystone/sci-clk.c | 23 +++++++++++++++++++----
>>   1 file changed, 19 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/clk/keystone/sci-clk.c 
>> b/drivers/clk/keystone/sci-clk.c
>> index 9d2094bd48e3b..5bf615893a8c0 100644
>> --- a/drivers/clk/keystone/sci-clk.c
>> +++ b/drivers/clk/keystone/sci-clk.c
>> @@ -468,6 +468,13 @@ static int ti_sci_scan_clocks_from_fw(struct 
>> sci_clk_provider *provider)
>>       int gap_size = 0;
>>       struct device *dev = provider->dev;
>>   +    /*
>> +     * Clocks are discovered by probing the firmware with 
>> get_num_parents,
>> +     * which is not available with every system firmware (e.g. 
>> ABI5.0 PDM).
>> +     */
>> +    if (!provider->ops->get_num_parents)
>> +        return -EOPNOTSUPP;
>> +
>>       while (1) {
>>           ret = provider->ops->get_num_parents(provider->sci, dev_id,
>>                                clk_id,
>> @@ -589,10 +596,18 @@ static int ti_sci_scan_clocks_from_dt(struct 
>> sci_clk_provider *provider)
>>                   sci_clk->dev_id = args.args[0];
>>                   sci_clk->clk_id = args.args[1];
>>                   sci_clk->provider = provider;
>> - provider->ops->get_num_parents(provider->sci,
>> -                                   sci_clk->dev_id,
>> -                                   sci_clk->clk_id,
>> -                                   (void *)&sci_clk->num_parents);
>> +                /*
>> +                 * Firmware without get_num_parents (e.g. ABI5.0
>> +                 * PDM) manages clock parents internally, so
>> +                 * treat the clock as having a single parent.
>> +                 */
>> +                if (provider->ops->get_num_parents)
>> + provider->ops->get_num_parents(provider->sci,
>> +                                       sci_clk->dev_id,
>> +                                       sci_clk->clk_id,
>> + &sci_clk->num_parents);
>> +                else
>> +                    sci_clk->num_parents = 1;
>
> Why 1 and not 0?


Functionally, 1 and 0 are treated the same everywhere in the
driver. Could pick either.

>  Also, why not keep `get_num_parents` defined, but just have it
> return num_parents as 0? Haven't checked but if that works the same, 
> but if it
> does then it saves us from having to make changes here and we can isolate
> firmware differences to only the firmware driver.


This works for the above branch where we are scanning clocks from device
tree. But the code path where we scan clocks from System Firmware explicitly
depends on a NAK against some clock to get out of the infinite loop. If 
we are
writing a get_num_parents() which returns a NAK always and sets
num_parents to 0, we are patching the protocol at this point. This does not
give the correct view IMHO.

Thanks,
Beleswar

>
> Andrew
>
>> list_add_tail(&sci_clk->node, &clks);
>>                     num_clks++;
>
