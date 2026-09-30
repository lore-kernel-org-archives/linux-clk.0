Received: from mx0a-0002e601.pphosted.com (mx0a-0002e601.pphosted.com [148.163.150.75])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 845FE47ACC7;
	Wed, 30 Sep 2026 22:52:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.150.75
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790808765; cv=fail; b=DwVVdRPvZNBj5OyLEfM/IZ+6R/Z5TGxVVekNJoWnH5mxSHvPjV/EezUEREkWKtwf8HYSsOXdOef1J6TT9xfct5OlkL3KseTHtMgRusefe/mVhILSnVWJQeYpt+xBtp0Sm2iLn23V06ghkWxOvFbgRpJZOwZRs4O7DKSX91Wv4yk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790808765; c=relaxed/simple;
	bh=Sfc3eIzFVy0qaq4QTN/bCxSdaKwNXgoS0ZzwZPuqUDE=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=CP/CGTFgpIKucduXl2uUuMD4Ner9gu1nSgdW2VSgL07ZsnHpu/COtLQ0XOZcRcCQkkIsWqp1pI0YaNSuCoBY0J8k6Q39NqkytiFNt3c5VvWx+FjiXUqlAz6ENVGMuON+PFGvzT08LXbz8JQUdu+4DjhU8pzmVDex9ML6ZUC493w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=iNxqdXck; dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b=BaBSwdP3; arc=fail smtp.client-ip=148.163.150.75
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="iNxqdXck";
	dkim=pass (1024-bit key) header.d=ticloud.onmicrosoft.com header.i=@ticloud.onmicrosoft.com header.b="BaBSwdP3"
Received: from pps.filterd (m0384305.ppops.net [127.0.0.1])
	by m0384305.ppops.net (8.18.1.11/8.18.1.11) with ESMTP id 68UKkG0W442992;
	Wed, 30 Sep 2026 17:52:33 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	proofpoint-05-2026; bh=yzaWV3y0cpGF5/L4wfrxWuxnJW8+j7phdGjhs+MJZ
	kM=; b=iNxqdXckI6FavYXIA2NxT5p485PTYCvl0+x+1uslgTlzPcSTSbnxdKbE2
	52bzvcLB80y7yie5yde5xicq/dACzly8gFo56428dxHXQThKmoDReCvvsKp00nl+
	5ClWBhZAzVUDqv9xDmd6tSuXRCFRuJguQFczV0c8nHiF2DM4+Z1Okcs+sDm4hWjV
	KTKeRKCCbr1DxaYxBqcSMUJqqbZ3mLzncREQw+XUCYAnaqaVEcsZKSmVW5y33ULc
	ndn49YMY4J8BrkFvItLTTw+25O3f0t/uQRzfpS7BOU3nxT/mwcgvQfis/TtgzaRZ
	aw7vJulr6SI7j+Mel74YE+MHcfBiQ==
Received: from sj2pr03cu001.outbound.protection.outlook.com (mail-westusazon11012002.outbound.protection.outlook.com [52.101.43.2])
	by m0384305.ppops.net (PPS) with ESMTPS id 4h10s2413u-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 30 Sep 2026 17:52:33 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=S2636sJNXsAxIF929jjC9xohgDZ8SVfQwS4NSCwR1hr/jJFsJdGoeqNnGNupN6gA3r7tLD7Qn/MKE80Pk6JxHtjSFaZAqAUPP9LmNUnosC5wirDoohn+KxQNk3VsspoyeyTr+WKqW3OEVVYZ8JrcYWJ8cS4SZE4J+zyIefaR9ESbfaDExfByHasAXwFjx7TChU2sgoZqwwwj/9cITH+i/QcRmqTLKf7OvGlTRkqx684CAPa1uGWxiXtq+CwT5FRomfnljcWF8FWn18Md/CKgMYGBk7JasG4m4FovYt8f+2VvxgMIA0wxLzLgVBPv8G7JO8QY4jc3a7/+IcBjEuiG6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=yzaWV3y0cpGF5/L4wfrxWuxnJW8+j7phdGjhs+MJZkM=;
 b=Mz99i1mbQkkBexhhtVVHb2g+l3GlUbalm9/5FMTmLufItHcVCFHz2K3sjWzHPV0h5cFqI4X/1Ii9MJLxgzt9Up7aPiusN6L82dskUrJOOjwfqn52wX/kOh0k0HhSYxq1Hztd+P+UXV70gr56fLwFcWn6DirAY7cRZ9jmkw5EQUYLOL692uOc8w2nAazIn8u1gFivr9fjNGV3UY+tdKQH8zr2NQxCrNWy4ayQDB0TuNbfSnX0FCEhAKmzXqQehS1twQeYephR/764foiH648IHvGXkTCZbFQDnMNWbPFg3M8uksOly0BeGPjoa1aXGzWwJMw9FbhqqVPr1DMrkIupng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ticloud.onmicrosoft.com; s=selector1-ticloud-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=yzaWV3y0cpGF5/L4wfrxWuxnJW8+j7phdGjhs+MJZkM=;
 b=BaBSwdP3we8MexcGNUnAdAzFMJ/HPzPKTW+JDDuKPc0gLyho2wel6L1eE9Q+IeF3ejrvLHa9LatMVK+Jdxs8GjvgU0hYFzaJzkCTXTluOnnmdHBo07i0b+jnXI3dQEP7tqRdbR+jZnutGUxZ5AMQWm8GYR07bZNSMOkCHsJxn98=
Received: from SJ0PR13CA0100.namprd13.prod.outlook.com (2603:10b6:a03:2c5::15)
 by BLAPR10MB5025.namprd10.prod.outlook.com (2603:10b6:208:30d::24) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.472.7; Wed, 30 Sep
 2026 22:52:28 +0000
Received: from BY1PEPF00026958.namprd05.prod.outlook.com
 (2603:10b6:a03:2c5:cafe::7a) by SJ0PR13CA0100.outlook.office365.com
 (2603:10b6:a03:2c5::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.472.16 via Frontend Transport; Wed,
 30 Sep 2026 22:52:28 +0000
X-MS-Exchange-Authentication-Results: mx.microsoft.com 1; spf=pass (sender IP
 is 198.47.23.195) smtp.mailfrom=ti.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BY1PEPF00026958.mail.protection.outlook.com (10.167.244.168) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.472.14 via Frontend Transport; Wed, 30 Sep 2026 22:52:27 +0000
Received: from DLEE214.ent.ti.com (157.170.170.117) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 17:52:19 -0500
Received: from DLEE200.ent.ti.com (157.170.170.75) by DLEE214.ent.ti.com
 (157.170.170.117) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 30 Sep
 2026 17:52:18 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE200.ent.ti.com
 (157.170.170.75) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Wed, 30 Sep 2026 17:52:18 -0500
Received: from [10.249.33.42] ([10.249.33.42])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68UMqIK93990785;
	Wed, 30 Sep 2026 17:52:18 -0500
Message-ID: <30efa0f0-7689-4e39-ad38-1094cb46bf6c@ti.com>
Date: Wed, 30 Sep 2026 17:52:18 -0500
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] clk: keystone: sci-clk: Handle missing get_num_parents
 operation
To: "Padhi, Beleswar" <b-padhi@ti.com>, <nm@ti.com>, <kristo@kernel.org>,
        <ssantosh@kernel.org>, <sboyd@kernel.org>, <bmasney+clk@redhat.com>,
        <jbrunet+clk@baylibre.com>
CC: <linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
        <linux-clk@vger.kernel.org>, <u-kumar1@ti.com>, <vigneshr@ti.com>
References: <20260930190348.11720-1-b-padhi@ti.com>
 <99ed72fd-bda7-42db-a974-42f01324563f@ti.com>
 <5646ef7c-bd4a-49f8-91d9-39c8249b987c@ti.com>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <5646ef7c-bd4a-49f8-91d9-39c8249b987c@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY1PEPF00026958:EE_|BLAPR10MB5025:EE_
X-MS-Office365-Filtering-Correlation-Id: 85c029f9-a7fa-4be8-0228-08df1f45809a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|36860700016|23010399003|1800799024|376014|18002099003|10067099003|56012099006|6133799003|4143699003|3023799007|22082099003|5023799004|13003099007;
X-Microsoft-Antispam-Message-Info:
	VLrW2UrgkDkWsb3GsuiNS7D6lrNA90cEdiWoBFMHZ3asRNIUOpOsfNKcJlOIgo1sD7YaMHD5cf5K8bX3ABk1TVbiIv1m8CmvFjS9Bl/IbCKe+wIHf1alpdjp6g7pMmUy4FpErOgwCj/xd5FQYK+ERyfwFETC0XzvmW4gFmmAwwYI9BVh8RevHeEv8CjBqOUWCUUc0Um5XJYPzYYzflSOJtD1+qcVTnz4G/E8xfhV9HXFWKktppkCNm4oKGGF7LV1gq0szigM+X6cOTIyPwC4Hnlx9gM/7uOMambEm3IlSUeV7UJIF0l88DvM5bm/M4phXYOh1c0cQIIQuB1WPojoxYUaDBf/chz7I0oXtocLNlDzncuS/bPLYuRwdKVzjfMq0Qi2+fNz43AkwyYJcaAsHYabehOK0C+Dr4zelu3Hpfcm9iTFtGhTAfamxDIZfQyeDsqLFaIvX3LFUk2pPImk21zUEkQ6cEkeTTtsF1VZXp1XCEwtE0VDltBI5YMIf8ku0NsANBrivkp2nEI0QyrsjN/xDv3kuGqdghVAj5aLWHiuImy3LGY9Fm6Ka1pTrtpVqUG8zJK3JBPSiJKasSTFxIG78tOLXbW4NiuTCXrqCQm42c6DldNSFMXBy5xLUtsnzyYFzc/r6h9kdldN7slc5KgmYWtvFR7o8Zt2CYazWb21GKTTAwCxr1jDyTAovQC70TE931vzGe60lkZzB4DrJg==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(23010399003)(1800799024)(376014)(18002099003)(10067099003)(56012099006)(6133799003)(4143699003)(3023799007)(22082099003)(5023799004)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	ZphnVdYz0jG85qMpJR9i6IVvqRjeX9Kp7j1GMn2NWAM6yhXvwb9+D6T5RDhYW08KSBJF4HqAoXX/WXmPUaVZWbaWxMj0YolFF0JWk7JzHtEUc9uEqY84RzJa4GYwK1Ey22QcGwjmqlJiXGYtt1khC6hzUgaoRgfAOEpYa9PUqDkUuSRJ6oBoadnNKh8pdFIXaIoYjISK7NZbftdi0cdkrUDWqzsJgdmQw3RsOYqm5Ce6AoDVwrlPY6PMfd2IDo/nxC4rTn3i5AWnrEk1eBWxUFqIblxL5s91ClWEQy80u4e9zcN1QokslBxMp1TnA4i8JiMAHwGyfQG/qU+gfcYhStTq0jDqJNoVLU3Dznta7ViZAB0YCHIjs02vSKHjUgOzoivVL43ugBhjp1Jk1qsScwuSIjF55UNmAizPJKLvB4hoUySfaWzMcJidCiKcTU/c
X-Exchange-RoutingPolicyChecked:
	ifG18ccufKfrXk3mcdyn/sjxBtqoL48l3jT05g5x0n+QVUu5p29PhWXkrUfFdt+yejfACEVQEPmoKEoTjZxKRD1sj2X0ndTxVqC0bRBogF8M235yCGUtw1h+5FFq3MHPdEyJjoH4/vCG4WNkFF543iZPe+m7O3sYykojFpfsKb9r0ibaO3WND9MdWAZSsaNPzsex5yQvlYVt7JF/AW6MPeFu54muGUNU7UDsEcN3ebLvJJC8SoY7GbAAZJ31v+twfGud9KKmSYI7msU+rqeAIyJ6c3TVIJT2SXqB0wezoCDgTv9T/Kcedh7Ouaq7ZQ27lA9QqR4jdFmkhyeo1YtVrQ==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2026 22:52:27.9327
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 85c029f9-a7fa-4be8-0228-08df1f45809a
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BY1PEPF00026958.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5025
X-Proofpoint-GUID: sEQeKlI1oOO6mlR3s6LlnJTUNvSlzdQQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTMwMDA5MyBTYWx0ZWRfX9DdlmPqLb4Od
 xdB9Qw/KvHFTB35zGzdvLrXpTObQZJgFca/bl3WUmeBTtFzIawOvO5PZsAvZuedV0+HhK2gctgO
 2XeGbrIPTn/KCeEDo5SVJeds3+teKMw2MudJ02n1PRylsJoKn9uK6iggdwnVW/MhyFGssAGH/y0
 O2fN28o8iSTWPR+hpd60GZQVjcF6OLF9UiVXergj83StHskE0EPg7lpIBkb81uDJVa7qdCaUSER
 qLIZcCpOpvqgbtZiiOHtXkPSqyftsYjM+Wi7CvcDX/Wn/xNzeEj6BiBUT/ai3mrwDPb7xXuuFrQ
 4Ho8n2PXy3/QU/DAsk81MCGlz89j3ZNIVmHBzZs32AKDaP1/fszBEuYbx5w8bZvxd182OEWfJcK
 NpxhDdjh+qCmkgB7txxrfI5g0wgfqAB+Q6w28hHcDQbMaUk7NyewzR4SiFq0X9rv7qD2XoZXHIo
 RHfRJwFavrsQINZJAuA==
X-Proofpoint-ORIG-GUID: sEQeKlI1oOO6mlR3s6LlnJTUNvSlzdQQ
X-Authority-Analysis: v=2.4 cv=G6aJgNk5 c=1 sm=1 tr=0 ts=6abd92b1 cx=c_pps
 a=E0F994Awt23I4DNeuEdoUA==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=AlMIdn_sM9wA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=taLDd7a_hP9WKsMzeGRc:22 a=NEAV23lmAAAA:8
 a=sozttTNsAAAA:8 a=O_wlYa2R4VlIzrNdgM8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTMwMDA5MyBTYWx0ZWRfX/IxPmS4KzASi
 8XWR7TbVTtNAvdyDDJEwHbG3yKtDRyNZMe9PpLSH/RRYgJPuQLyQK76kKgMPwVqKJBIgWlMpPVp
 s77jPK3SUI3QuZrWDU60EIF8K4UiEis=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-30_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 bulkscore=0 priorityscore=1501 impostorscore=0
 malwarescore=0 phishscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609300093

On 9/30/26 3:58 PM, Padhi, Beleswar wrote:
> 
> On 10/1/2026 12:49 AM, Andrew Davis wrote:
>> On 9/30/26 2:03 PM, Beleswar Padhi wrote:
>>> The sci-clk driver unconditionally calls the get_num_parents TI-SCI
>>> operation while scanning clocks, both from DT and from firmware. This
>>> works for all cases today, but with future support for some System
>>> Controllers (e.g. PDM on TDA54), this may not be always right.
>>>
>>> The PDM system controller on TI TDA54 SoC manages clock parents
>>> internally and does not support the clock parent related ops. Therefore,
>>> when scanning clocks from DT, treat the clock as having a single parent
>>> if get_num_parents is not provided. Such a clock is registered without
>>> parents, so the get_parent and set_parent operations are never invoked
>>> for it.
>>>
>>> Scanning clocks from firmware relies on get_num_parents to discover the
>>> valid clock IDs, so return -EOPNOTSUPP in that case instead.
>>>
>>> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
>>> ---
>>> Testing Done:
>>>   - Boot test on all keystone and K3 platforms.
>>>   - Verified that the patch does not result in any warnings or errors
>>>
>>> Logs:
>>> https://gist.github.com/3V3RYONE/d821cea46f5dc1e70a759c97878fa487
>>>
>>> Note:
>>> This patch is independent and can be applied directly.
>>>
>>>   drivers/clk/keystone/sci-clk.c | 23 +++++++++++++++++++----
>>>   1 file changed, 19 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/clk/keystone/sci-clk.c b/drivers/clk/keystone/sci-clk.c
>>> index 9d2094bd48e3b..5bf615893a8c0 100644
>>> --- a/drivers/clk/keystone/sci-clk.c
>>> +++ b/drivers/clk/keystone/sci-clk.c
>>> @@ -468,6 +468,13 @@ static int ti_sci_scan_clocks_from_fw(struct sci_clk_provider *provider)
>>>       int gap_size = 0;
>>>       struct device *dev = provider->dev;
>>>   +    /*
>>> +     * Clocks are discovered by probing the firmware with get_num_parents,
>>> +     * which is not available with every system firmware (e.g. ABI5.0 PDM).
>>> +     */
>>> +    if (!provider->ops->get_num_parents)
>>> +        return -EOPNOTSUPP;
>>> +
>>>       while (1) {
>>>           ret = provider->ops->get_num_parents(provider->sci, dev_id,
>>>                                clk_id,
>>> @@ -589,10 +596,18 @@ static int ti_sci_scan_clocks_from_dt(struct sci_clk_provider *provider)
>>>                   sci_clk->dev_id = args.args[0];
>>>                   sci_clk->clk_id = args.args[1];
>>>                   sci_clk->provider = provider;
>>> - provider->ops->get_num_parents(provider->sci,
>>> -                                   sci_clk->dev_id,
>>> -                                   sci_clk->clk_id,
>>> -                                   (void *)&sci_clk->num_parents);
>>> +                /*
>>> +                 * Firmware without get_num_parents (e.g. ABI5.0
>>> +                 * PDM) manages clock parents internally, so
>>> +                 * treat the clock as having a single parent.
>>> +                 */
>>> +                if (provider->ops->get_num_parents)
>>> + provider->ops->get_num_parents(provider->sci,
>>> +                                       sci_clk->dev_id,
>>> +                                       sci_clk->clk_id,
>>> + &sci_clk->num_parents);
>>> +                else
>>> +                    sci_clk->num_parents = 1;
>>
>> Why 1 and not 0?
> 
> 
> Functionally, 1 and 0 are treated the same everywhere in the
> driver. Could pick either.
> 

Exactly what I was seeing, setting it to 0 just feels more correct.
Might be some future case that checks on the "1" parent that doesn't
exist, but "0" parents should always result in no parent check.

>>  Also, why not keep `get_num_parents` defined, but just have it
>> return num_parents as 0? Haven't checked but if that works the same, but if it
>> does then it saves us from having to make changes here and we can isolate
>> firmware differences to only the firmware driver.
> 
> 
> This works for the above branch where we are scanning clocks from device
> tree. But the code path where we scan clocks from System Firmware explicitly
> depends on a NAK against some clock to get out of the infinite loop. If we are
> writing a get_num_parents() which returns a NAK always and sets
> num_parents to 0, we are patching the protocol at this point. This does not
> give the correct view IMHO.

We wouldn't return NAK if the clock exists, we return success and
set the num_parents to 0. Only for invalid clock IDs we return NAK.
This should keep the TI_SCI_CLK_PROBE_FROM_FW path happy. But really
that path has been disabled for many years now and I highly doubt it
even functions at all anymore, it should probably just be removed.

Andrew

> 
> Thanks,
> Beleswar
> 
>>
>> Andrew
>>
>>> list_add_tail(&sci_clk->node, &clks);
>>>                     num_clks++;
>>

