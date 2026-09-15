Received: from mx0b-0002e601.pphosted.com (mx0b-0002e601.pphosted.com [148.163.154.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4AC14C4F6C;
	Tue, 15 Sep 2026 18:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=148.163.154.28
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789498741; cv=fail; b=aJnyky6iVdpe0juy8j66IVJc1GPn074bAQxydPEbYcfCozzs43vAoyKFMoxquBnEvPbe4FdKy6EFVCXb0rbiFLhHfjHGo+7kIuvo3ddjUdkBYPknWH1LRdQt+4i5kzx/og5VrAHeNVROH64ydzDQBpHu9LX7SnfmHrHjzG79mIo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789498741; c=relaxed/simple;
	bh=+QnCc0Virm8PyTZrp471SNYprCAeSqjAX9kyq3h0dAA=;
	h=Date:From:To:CC:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=nBu7HjR5s6UcSVmiG8aMbTA5cswn4nwua7aA58xokF5GKBfEa9rqkDolj7OV0IHSRaytDtRhhqhWmDvW86Mh+T6Ce8XPkuQpVzpYn6Y+MkPt/bK1vdFEY4fmHHtu2vrq7J3SBpp2PTKgDtlfeuiiPRQWooKtMrhAU/q9cW96VIk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com; spf=pass smtp.mailfrom=ti.com; dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b=g/qjXSqs; dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b=O4SqHXhD; arc=fail smtp.client-ip=148.163.154.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=ti.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ti.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ti.com header.i=@ti.com header.b="g/qjXSqs";
	dkim=pass (1024-bit key) header.d=ti.com header.i=@ti.com header.b="O4SqHXhD"
Received: from pps.filterd (m0374955.ppops.net [127.0.0.1])
	by mx0b-0002e601.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68FIuLK11116522;
	Tue, 15 Sep 2026 13:58:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=proofpoint-05-2026; bh=mueFlKNhcak6xxy
	UmMaPc8kMeIr2L4DqVPZtYPbG9yQ=; b=g/qjXSqsRFFt+Q/htqp2bs2Zzg7lkfS
	FyXhPZOgVd+vHqcqwml2HCAPf3/+e/b9zMV6QVWuD9LA353umN8jcESE2SjTzBzP
	UobLffBXN+mS2sYmaiCto4OcdL4v94QJQB2gtixceryjlBMMEJEa1SfxyTXsl0M2
	zu06VJZh8O4vvUFj7kzw9KuMOtKgf9/VfXVOZDsCK8xfZcdINxMw63lA+LRUrTum
	rA2UbxcAtQx+Jk4CC/hEkItvUU7jrGjRHjOknip1xI2kYmcuiCVx1VaiRmTUUHfE
	X+5xCqJdSBOlYl3CKM6mh5o73P6XS/gtI2tuqMdyCKpXmtQKgkP20ig==
Received: from cy7pr03cu001.outbound.protection.outlook.com (mail-westcentralusazon11010049.outbound.protection.outlook.com [40.93.198.49])
	by mx0b-0002e601.pphosted.com (PPS) with ESMTPS id 4gpvpjg9s4-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Tue, 15 Sep 2026 13:58:35 -0500 (CDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=DlO/HCFpl1J45VtcvJ/A7oPr+tVrPWmmvQKa43ZBaZshh3tNm5MZ9Qo7SA4vcNVmEMnfyH9thphQs2+3Vmi6PF/lj90ZKlW7os64AGR0kO+3qcIAXntoU1T6T0IkvF+i2KDDXMvGdcDG2Uip56ld+Gg4gRKzZi0CBg7CNadhPZ7VDNJxy7Ne0b+U7kRDP2zDmMVsrLNq2Z67mwZamWFfpKG5nZPnSAt5xmf+U0k2NUY20HeQhjkBjX9PQis5K40fXPYtXuftUdnOtpSu3Gjs44eQVqee1d87N1/+BPjf/apxTO2AO/8YOyV7zfXePtMKn+2Gg/ag/VwWTHCeHFyd3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mueFlKNhcak6xxyUmMaPc8kMeIr2L4DqVPZtYPbG9yQ=;
 b=Gg/vkK+Rpis634e6+oms1kNMmqsPe0qg35ftzB/QjNXJl2pyQHaVFdazkVw/+5Ma/8PjSKYJv+xbuOsMGFnp/uJP/+1dL2jzIMLyUeU/WqkseFQLObke50DCOY3Q/VEJEA0ZRHGjfIcjo8qfuogREWPv8moASXdCyQPymXU8YKEXe/i2LVVX8D5ie/pySKm0EpWFdDNXYGGy6XweytbBfHMS1FfbQxNd0W0JnnHBiG0YcX06wL+eHK9aX5690G5xDT4AJ8nkhbVtvoIF9+ZnKiOrp0F21Hlv88ddbn05YSm9ESHImI8sFy6roAfmQogi2OOFDShaf50c+QNPe4S34A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.195) smtp.rcpttodomain=baylibre.com smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mueFlKNhcak6xxyUmMaPc8kMeIr2L4DqVPZtYPbG9yQ=;
 b=O4SqHXhD11Pu+ItpNy4v41XH0c4J2eEX1Ns8V+1Z8F5qmwmKMUAvsu01CBV9UtzDKcYlqZGe9rLSWws80wyJRJsPlTzaFkkKXhYpTvHNhqApRQjjt7o0uK9K7oWVunYg9aJU5xrBRXZ62quaG9QRCe9TKfqy7eIBAtz0c5OLxD4=
Received: from BN9PR03CA0272.namprd03.prod.outlook.com (2603:10b6:408:f5::7)
 by PH0PR10MB6982.namprd10.prod.outlook.com (2603:10b6:510:287::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.9; Tue, 15 Sep
 2026 18:58:28 +0000
Received: from BN1PEPF00004686.namprd03.prod.outlook.com
 (2603:10b6:408:f5:cafe::65) by BN9PR03CA0272.outlook.office365.com
 (2603:10b6:408:f5::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.21.428.9 via Frontend Transport; Tue, 15
 Sep 2026 18:58:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.195; helo=lewvzet201.ext.ti.com; pr=C
Received: from lewvzet201.ext.ti.com (198.47.23.195) by
 BN1PEPF00004686.mail.protection.outlook.com (10.167.243.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.428.7 via Frontend Transport; Tue, 15 Sep 2026 18:58:28 +0000
Received: from DLEE207.ent.ti.com (157.170.170.95) by lewvzet201.ext.ti.com
 (10.4.14.104) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 15 Sep
 2026 13:58:07 -0500
Received: from DLEE208.ent.ti.com (157.170.170.97) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 15 Sep
 2026 13:58:07 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE208.ent.ti.com
 (157.170.170.97) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45 via Frontend
 Transport; Tue, 15 Sep 2026 13:58:07 -0500
Received: from localhost (uda0133052.dhcp.ti.com [128.247.81.232] (may be forged))
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 68FIw77G3772236;
	Tue, 15 Sep 2026 13:58:07 -0500
Date: Tue, 15 Sep 2026 13:58:07 -0500
From: Nishanth Menon <nm@ti.com>
To: Alessio Belle <Alessio.Belle@imgtec.com>
CC: "a-christidis@ti.com" <a-christidis@ti.com>, "rs@ti.com" <rs@ti.com>,
        "robh@kernel.org" <robh@kernel.org>,
        "mwalle@kernel.org" <mwalle@kernel.org>,
        "tzimmermann@suse.de" <tzimmermann@suse.de>,
        "simona@ffwll.ch"
	<simona@ffwll.ch>,
        "mripard@kernel.org" <mripard@kernel.org>,
        "kristo@kernel.org" <kristo@kernel.org>,
        "linux-kernel@vger.kernel.org"
	<linux-kernel@vger.kernel.org>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "maarten.lankhorst@linux.intel.com" <maarten.lankhorst@linux.intel.com>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
        Frank Binns
	<Frank.Binns@imgtec.com>,
        "dri-devel@lists.freedesktop.org"
	<dri-devel@lists.freedesktop.org>,
        "linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
        "airlied@gmail.com"
	<airlied@gmail.com>,
        "ssantosh@kernel.org" <ssantosh@kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "vigneshr@ti.com" <vigneshr@ti.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "khilman@baylibre.com" <khilman@baylibre.com>
Subject: Re: [PATCH 0/5] drm/imagination: add support for
 j721e,j784s4,j722s,am62p
Message-ID: <20260915185807.virpvbeaderex4lt@agent>
References: <20260224-gpu_dts-v1-0-cc5ddffe140c@ti.com>
 <20260225010507.flvt775fs5kfe7ez@unknotted>
 <0f68a788b7fa69a72e51feba765e0140c5c09934.camel@imgtec.com>
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <0f68a788b7fa69a72e51feba765e0140c5c09934.camel@imgtec.com>
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN1PEPF00004686:EE_|PH0PR10MB6982:EE_
X-MS-Office365-Filtering-Correlation-Id: 2b8f811f-19b3-4568-19c4-08df135b53fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|36860700016|7416014|23010399003|1800799024|376014|82310400026|13003099007|10067099003|56012099006|18002099003|22082099003|4143699003;
X-Microsoft-Antispam-Message-Info:
	tXr7yX28RXr8JfT//2H4g8SQEXh1yJepH6oIMbv96xx8gcb1lcDlFkUfxWkBdUyXGJLMYz6/oorw5Q26FVtLKdRt+tipO6PD8Pj/+EPYAiMx4aiBP7d7f/Q14j/liMzGzgDcQGRWPanLjbmIeKDEQU2dY/RQYd/QRKS2DDMBE2otG9fzT6H/w3kCHqMXdB0zwrbyCV0iwH4aX7LFH3ZyTXeEnup4qlXmwSAPuUyMiR2dRIGYqxtjekUQMX94y1hxhR6qbLpQIq8ilx6dX3TABmhuq12ub4p5xD1+C3yjjgdalsz79sU+zmwuXfadAwcw4HxWPBjPN3XgjyIYX1RuRETgNeqbyJNpLcYtvpP9l3GxvQJFduO5V//LjFMC54ddcwdjr8RC7zwl9q6z4QBwlHRrWMAXBHtidcwPmYAQCoxKkieGmGoNrgCx1I2jBTvVRg1u1A1UjN9PSahryxy3bSt6WPQxjf+5jTdfCuKfuycAlTfkXu+BwIemGexADFJqDjVYo/R3ivkQtCPAEScti508AhdJU9ZaEK7/uV07XD5tLmpzcHz3SOZl5EvCjzzIYhJk5RW/g4WfNgr4xvaeGbCjjUbrLeJy9wFmCSq2rCtpNk614+aPE1nSQn3awhaBOfoV/PSVZEExX7A2niA9Hg86JSuZwM3w8HnPu6omWyhYnx/f/fjTACQY8bs92+HqQB1UxWskAKtGjAL+vKTlXQ==
X-Forefront-Antispam-Report:
	CIP:198.47.23.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet201.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(36860700016)(7416014)(23010399003)(1800799024)(376014)(82310400026)(13003099007)(10067099003)(56012099006)(18002099003)(22082099003)(4143699003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	KLs1i0J0D+H9H3FqVEpvxIPWh90tvZWAPegbRGtz3HJUYSWMohS6YrSZW3NEfIKY4T5sCP7PIQ+K4hmmNk6F5VIFgfPW/2mYa5bFGzvVRK4q+pb7iIm697/hPdf+3rkK8cUCWPhhQ3mdsT2yaGqz/8ZwwJgDxjejmTRKsk9Aomo31KewURLF18CDI3vmBXj2PuzPk8lkMnOpqjnwCbTHLLrSUp0dSkx/mCs2FK+8wybl0Q7x5gjCu+glTbKY70DQ4363LevQcblvLyyGoxsRjCR6YDz6Thu3zKPsFYZIAfjAsONMJb1EA8i8rKU5qjPigKfAQE3oB2eUm8Sc/leZfJcXFFcgeVrXpQwjyeWLIMu9zaVJyOy+IjW96uVmjevqEIpQZj6JuHBMcb/c5IT3nzr5gkEvxFqYvXZPTT8J2DVkwHRinXpXUpeRRW3IelnP
X-Exchange-RoutingPolicyChecked:
	T/6uEF1aqKg8pRp1b9GUhqmquw76Zlvw1pJLs10CQGmj3Czmdhiojgg2CKZ7VmbvNtsgmvchTJO/goCvfILJsIAfIdcDjdZO6u82BNEmAPBLBe0fN8qTtIX/x5I4WYrA01viVFp/zP0bFADALPHF85la8+4063NOP2TJjubm0v+ZYf1knnUyD7Vpoz+lOSgEsRJ+SvxXzcKuMyTIqHyEJntYNaAanU1FfMpPSB/RkKirlovm60ZD8Xy7wooufQ2Edno1DZzEFdxyilK5oMTfBleM62Auz8FJN67sDT5DBhS/xZhVBavwubq2JPmOqegDYNV+G523K8k9qClrMMKilw==
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Sep 2026 18:58:28.0710
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2b8f811f-19b3-4568-19c4-08df135b53fd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.195];Helo=[lewvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource:
	BN1PEPF00004686.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB6982
X-Authority-Analysis: v=2.4 cv=KvnYSmWN c=1 sm=1 tr=0 ts=6aa9955b cx=c_pps
 a=+3f3g5PcVU0WeXiSVbezXg==:117 a=f+v6EHfkeJbVwR46tk4DMg==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=kj9zAlcOel0A:10 a=VdqzKS8jKosA:10
 a=s63m1ICgrNkA:10 a=V5UXEbMT0ywA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Z8NIEmU8O1QQgoT56wFK:22 a=fPAWb5peG099m5CrUpKH:22 a=VwQbUJbxAAAA:8
 a=sozttTNsAAAA:8 a=YyvoK_82j7mrY79aEykA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: Nb3H7gtlUI62TSBa2vX3jfexz9kzSCaz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTE1MDI3NiBTYWx0ZWRfX7Y0M1JqGgAdT
 0p+MbQExcqECSZI3tdh2G068z5nBXUMDnSvJyH+SsXlZDnOw3EixOtG6VPf454p0+HxF8rvXg+/
 0bGRkzfp/4uF7tkXe/sRp1P14pgpTtVNX9uBQjjcrva77yJghiCdKXHwnsv9xKHyxKDBaQBsFWc
 Qz/0y1OzjJ+urSyf9oMTkBhotF+fWzUSgoqRWAbQ/vNkPUjDROPdrx98fmHIppn0zCLvgR3y4eJ
 RjvdIb3QjVrOIopZVaJS2tNWqpTXqNvTV8ZvBc81oA96j+iY6H9EjIcqUU2fnEkdMKtfHGvCKe3
 7owj086FWht0yTGb61qEAk/Hre2USC9Zfbk+nBueEZEE1VgfT7vREojabjT5n/q0YTiF/tgtKFE
 4VtQWl1YF6MRl0SlSRNrrr9jaffyuQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTE1MDI3NiBTYWx0ZWRfXxq5gekAtge7G
 tXp7K8t48LPi2oNrd8+6JVzjDVJkXFImgCb76I3xWQcq7nB9tZleMEMWVyPJP06IuTL0ZKUCjBh
 MpanupyVB578Z3oBhOLlITS49DTRDUc=
X-Proofpoint-GUID: Nb3H7gtlUI62TSBa2vX3jfexz9kzSCaz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-15_05,2026-09-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 bulkscore=0 spamscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 suspectscore=0 classifier=typeunknown authscore=0 authtc=
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.22.0-2609040000 definitions=main-2609150276

On 16:09-20260915, Alessio Belle wrote:
> 
> The clock cache patch is in 7.2 now (a80b32a140c8).
> 
> Is there anything else blocking the other patch for j722s/am62p?
> 

Do check linux-next.

https://git.kernel.org/pub/scm/linux/kernel/git/ti/linux.git/log/
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
https://ti.com/opensource
