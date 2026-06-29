Received: from PH0PR06CU001.outbound.protection.outlook.com (mail-westus3azon11021076.outbound.protection.outlook.com [40.107.208.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1D6E3A4513;
	Mon, 29 Jun 2026 20:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.208.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782766618; cv=fail; b=a6lFKKmKrx1cWbrDTq5qa5pjsgcqKCg1pNXzOFtZ6FkZV4EinxHJQ1FGZC+B1xPkcrs/+nvTqBK1RLRVTQOngqNYQvvGBTuLWBIYT6RXP9/iNxmDKOJCgIwxz1T+bV6rqPYlC6Wj6mUJdfbCd9QO041XsdtdCdRpSi5CeMzMgEs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782766618; c=relaxed/simple;
	bh=EYNGtXFomhXllAErhrwtkJrq769Pdw+73fz3lOKpR0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=RVrcbdz3pClIaySy7nrAqpOM4Ge3/Ws5iX+wWXFLhnFp1s+PsbLMijTNryYSRDZFcG//KlT3pX5HCukj6FIW7JGgvuc7BjmfiWPDNzhMpKSTg0EtQtTGV9OQeRS+QYYWB7Dp4Zyj6xiVcpAvQJAezj2pIPWAhzQxlLdsCwiDKCQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=in-advantage.com; spf=pass smtp.mailfrom=in-advantage.com; dkim=pass (1024-bit key) header.d=in-advantage.com header.i=@in-advantage.com header.b=K71M/7AI; arc=fail smtp.client-ip=40.107.208.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=in-advantage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=in-advantage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=in-advantage.com header.i=@in-advantage.com header.b="K71M/7AI"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LmcKjdqUEYzCJfKkC2MfmJmGldxhw8r5GvXsSwWTtVDCnTTvu/CX5EtZKItzQEDiDweF4jV6wYwhcevR6s57IgNZiWO8fBl5EN1peiI3YHNFj7qO6WwdzOD0WKM+humc/fm8yEm7YEdeSdChphVIDsnEUCBV0upJqzcwhWNSxAvEMX3iciv4liiaYblapVH8hJblQokWZyhRD4YN+0ig0IUxmvf72rlAL71u7y/0Mvf1fmzJx7oE8r9xQMDIcnpeNGvuMydlHaJ7RiGyl8ZvkfdS0FPhn3qtrkMJUho5hkIJdkVP1xG+fprOuFs4ruYM+3Hlx6rt//Vzd9FVqJIa1A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+0Oawbn7k3z49P+VfahFh2bH428nm6rJU07/eDMoVg4=;
 b=kuq9iH4lsNDyKLru1ngNHsmX4Vz/JS9HIYRYbmFtNdS33pGy6xwVa6/36djFLB1wK1FG5H+bVUCo85knnBZgBJuZCi4bzPB6mIJb7yTZHJL8N5khWTkkJy/tdI+B9Jigu4GJSW8FUr3looEwnipPv2qw1V//d1Z25bV2OGB0R4CMyj/k9HJq2qTjJ4ZaxZBzxk63gjDmJcFIWLCQKACD0lSYz7fCycVRTjRD6wVMfxHgoMuK0BnII+GJL7iYJDnygaIgtLY6PQ3TLdhRF36YhWAD8nPkNbVOGrU8p+ZXLlhaLC1SNBcW4XC9NJJlubWyn+erA55mmMCtzrSPnasN2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=in-advantage.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+0Oawbn7k3z49P+VfahFh2bH428nm6rJU07/eDMoVg4=;
 b=K71M/7AIy1buqPS5vgyfQkiH0c6JnXMFgaBCSmQBIBqIgZeznLsovGo3u+UDrmHtVvABAtyDiE5NrHzjDow7BLjDsXvr70zm5a+8mxBYLRnzuYkNlNXozEboV2xngv8SxYBH0SzxKXGr2ZCCAwKFfOYW/1Y4H6p8fIe/V1IHyQ0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Received: from CH0PR10MB5290.namprd10.prod.outlook.com (2603:10b6:610:dc::14)
 by BY5PR10MB4339.namprd10.prod.outlook.com (2603:10b6:a03:20a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.159.19; Mon, 29 Jun
 2026 20:56:48 +0000
Received: from CH0PR10MB5290.namprd10.prod.outlook.com
 ([fe80::fd87:b9a4:818d:5ef5]) by CH0PR10MB5290.namprd10.prod.outlook.com
 ([fe80::fd87:b9a4:818d:5ef5%4]) with mapi id 15.21.0159.018; Mon, 29 Jun 2026
 20:56:48 +0000
Date: Mon, 29 Jun 2026 15:56:40 -0500
From: Colin Foster <colin.foster@in-advantage.com>
To: Brian Masney <bmasney@redhat.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Michal Simek <michal.simek@amd.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michael Turquette <mturquette@baylibre.com>
Subject: Re: [PATCH v1 1/3] clk: clocking-wizard: fix clock difference
 detection
Message-ID: <akLcCGn-ewTKp31i@colin-ia-desktop>
References: <20260506200555.2558434-1-colin.foster@in-advantage.com>
 <20260506200555.2558434-2-colin.foster@in-advantage.com>
 <akLRwsEQEd3JGcvz@redhat.com>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <akLRwsEQEd3JGcvz@redhat.com>
X-ClientProxiedBy: BLAPR03CA0125.namprd03.prod.outlook.com
 (2603:10b6:208:32e::10) To CH0PR10MB5290.namprd10.prod.outlook.com
 (2603:10b6:610:dc::14)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5290:EE_|BY5PR10MB4339:EE_
X-MS-Office365-Filtering-Correlation-Id: 32b8da00-53e9-49bf-bb72-08ded620ef9b
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|376014|1800799024|366016|55112099003|4143699003|56012099006|11063799006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info:
	76eVUVss+RFzAfrox1DfApkKnB1rBuWqw6EIORUP0VlkYyKWbHr40UFhLGa2pIsfdHC9daNgxEszpw0LVMNr2G1+mKPEuhjIBycVslPGAluqnFGz7InfOZ2Ib2bvNYN1l/dpzyIc+kqnWplZhD0DL2CRMXE9sXTE+EW6/pYjxZlS/sUXn3JdsMMeGG1LuHKfNDrAlMjStUn7Tn0BTYFuFB72bJjnd9AFVGRWMYVrszYPoBu8ZRhQHG+1AdjsLZ6lqu6KpMu9vqFEyytd/rllb/Wq2pfdgdsvvjt4elnFhyXGkuLR+WNdcWM/n2jg1KaURInII4Eu3aJ88a/stFVVgY171Vpw7hUhQ0C8fUcman7JqWqbnrcdXhFerdUTYZGpyVCTEVuQmJkLnIOhrx0Mk7HndtPzKKVZ1moD8Bke0Tn74qH1DoCwE1qo28Dpsep+uDhPzXOBAwydq0pmMYi2UbtWK0mESfI1l3qS2W8BUWmJS6ToLqrAuQU0uPp3FaTtaqu5pViD8wOMxn2rTpOz9bw1yGH62+S/4iKbCvH2vLKcagil3u3oE68J84xBkG7LQkBwsk7whgEQKO5Rtw6NqztX8AFxMHIYC84ECiNZN4tW9+Mh4c2bBrpdlvHphQTnQo4C4Z41Dp/pb++PYJxRWawTPQsFP6uCtwCliMSnxAA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:CH0PR10MB5290.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(376014)(1800799024)(366016)(55112099003)(4143699003)(56012099006)(11063799006)(22082099003)(18002099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Nc109lvdC+B7BLyxbHG1oH3CBPjniDctOAOdSTFULMRTwnm+SlpOXwygPyY+?=
 =?us-ascii?Q?Evphc47fpLv47ESNEvXJ6oZzzfWX+sn9NDewWC3Ma7A3p3uGoqIOXpzp4nyx?=
 =?us-ascii?Q?LLquF1nmteY6RyKuY7vVmXES2KwFj52Pi/rskZXemnw8BVVBYEMYtj1IM+Yt?=
 =?us-ascii?Q?Y5y1TAvyzK3TRA5O6gzWEKcOhE6MnfCnYBOV/BOmIGYCk/wx0mz9NBeYm82z?=
 =?us-ascii?Q?3gQ6r2oTmmiXKWU0iNZCbENc+ek4mudmCKfRjn+zcorqMYQOXLtByTDmBjh9?=
 =?us-ascii?Q?3a0+CYQMR3q5V0x45modbksGdmSw2ItY+rn63cIIaZrlcLOvePZ+7JIjNGl+?=
 =?us-ascii?Q?CTKxCM6nK8jpQYYSvovXTN4cDmZZjWNyOhSvaGyXxykk7S04JESJuAX085HR?=
 =?us-ascii?Q?YXAPDLQ7FIwPwWcD+7NRtUghH7Tz6277+lECijDvAtPGvEDPn5NRYpqjzhXE?=
 =?us-ascii?Q?AAz61u6/K5+MHd5IbP/wE3dq6jeJauo0iHNnQodeo98Nlx/qkfKFM/iQNleU?=
 =?us-ascii?Q?LKc5Ho0LSL2fCy6MLvBrVBD4YFoeADkzERJU2FvZq3w5/C9RniEjx7JFEeCe?=
 =?us-ascii?Q?b8o+eyaxu4h/eqtmGOPsO8KuMIoFqT2kSsKFY1fNAuITQuCgYO9L5CJFsgBJ?=
 =?us-ascii?Q?xm/j1tdyIhKrZP3dlj/6KbzuueZdc9is9W6M2wpVGwqUbEYFLXpEj244fuJc?=
 =?us-ascii?Q?2IR5FhjB06aLrd3tjsZ+eC8IviVh1Mki5dB91vLM/sa+neKtj/FDmY+0rver?=
 =?us-ascii?Q?VNjOEvId6kD1yWG/5p65uxXol96GwiBpj7LoffRx+GwkwkdaF+NKyCeOW6ZU?=
 =?us-ascii?Q?8r9R0rzpoRx+pcRzqSZ4ep/hqfeMtZui97H3NaZ/a8ql7Alvm/B3Ffsl+E0g?=
 =?us-ascii?Q?ypv8resERpXa/LwRYQPsr4EUpvDXpg90xD/D/z0q9bDpyIFCEQ1w5LscP4B0?=
 =?us-ascii?Q?7O61kYAGoE/J5A1yR3jYuANLezqXYINpCmTr8/tkn/t/ON/Xn46jJwQrYQBE?=
 =?us-ascii?Q?z3ITM2t/SRJppxMRhZFTrRBTgOGrpbgfmqwVXXN72ToSCcYo/nznI1YRSW8i?=
 =?us-ascii?Q?lx6IeETbsBDjVaHlJisFarHdRG0f+Vi790kkxnju9MtDOMI8E2k7nmrwfNnW?=
 =?us-ascii?Q?YRMFb3AkaOyBwQk3ocIjUJ7STa+OaQHYhcQZimfBhoDZAOp+ld7e5iV/8oOy?=
 =?us-ascii?Q?wXkB46jtJARGca8/aZt/fAn6ZkzVM9HREqZkG59wQcKUYwnKVe+xSlLRPdh4?=
 =?us-ascii?Q?eXIQIWq3FAcluLYmGt9mFw8hRewJCWF6H5l8UOHcj1/FdymzzODIXAMtaXJg?=
 =?us-ascii?Q?YgLDR14UWXubDrLLW28dAsxl6lzFK6UXLnKCw34ptwxrRfekIBdhh84m2+lQ?=
 =?us-ascii?Q?u7EPA2mnesOBfD3tKt2nRvdTq0QE7kpALKGJJLoFwCOZVw/45ztluT2fetqS?=
 =?us-ascii?Q?IgT8Go1DoCvHMuW9iqScjybO9yS31a+86U4fYu59AOeFyvUw16enohDtvr46?=
 =?us-ascii?Q?ON5fiDMs37J4ZxohVMkfC+geDUCBTRCToLmOBIV9+uC6EDpXKPMcLTPq5AEf?=
 =?us-ascii?Q?ljRWNt9wmxhZSW7AzYF1yQCE3hk43TaRjFd1tynvAvAKLN6Aysmawz2nAfL9?=
 =?us-ascii?Q?i5kSoFBkLEUYurvIey7tc5AdXaBC3+NhJ28P/6HAfb2bRRJY1gUYEv+ePNhi?=
 =?us-ascii?Q?+qdMfY/c2GXX1OvMf/hlW49EEg0z4z8Bx1cE2yR/wfsxpEUeu/9h5O2jgVgG?=
 =?us-ascii?Q?t5PCqJ3euLGgiwEBcZV1Lus42bvj+m0=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32b8da00-53e9-49bf-bb72-08ded620ef9b
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5290.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Jun 2026 20:56:48.1977
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qRPCQyAGdYWxopCSuJymQCffItx/9iZmBHG+WlHFI8DWinrnvVaaShgcNyq4OMfHs6DDsKh7tagkvbrdZnJ4y+r+W2U8zFyQYYLX+EeYKNs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR10MB4339

On Mon, Jun 29, 2026 at 04:12:50PM -0400, Brian Masney wrote:
> Hi Colin,
> 
> 
> Stephen didn't pick this up last development cycle and I'm assembling a
> pull for him. This doesn't apply to upstream.  Please post a new
> version that applies cleanly.

Hi Brian,

V2 sent that should apply cleanly. Thanks!

Colin Foster

