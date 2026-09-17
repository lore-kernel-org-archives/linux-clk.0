Received: from MW6PR02CU001.outbound.protection.outlook.com (mail-westus2azon11012024.outbound.protection.outlook.com [52.101.48.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3CAA94F68DC;
	Thu, 17 Sep 2026 18:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.48.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789668651; cv=fail; b=adPiT+N5UzL877N46pmMrazJduYUnCQRC/7CU0NY6jkM4sUjMHB5WFqCUxTflv95fN3iy1CZnWkP8wrzFPvaVaLyXxLuJ4naCcPxeX+zkCZbrb0VSnVck1CkVbgKlWx/lkUgcUVF+zf5IM6OetqepQFKmXW/zSIS6a7IqxpwCf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789668651; c=relaxed/simple;
	bh=IYxgggemF6kcr23u59m435dkuW98QjichUv7dbfp7p8=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:References:
	 In-Reply-To:MIME-Version; b=O9WAt4lD7dEhVCmUshwshUcdsR0lmQPooXLVHVQuivNLfSKc2SgfF4ht5kjKczJGGl2DhD5CxKzAX8ZVbW9DySh2v/FeHA+0wHRtUBahuKE+12jQh8vtjRhBs73aycEp7eSCId3qTUDXMiRG7JbrEhnyHQ+meuozVodyTZIsLes=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com; spf=fail smtp.mailfrom=nvidia.com; dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b=Wpr09Ott; arc=fail smtp.client-ip=52.101.48.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=nvidia.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=nvidia.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=Nvidia.com header.i=@Nvidia.com header.b="Wpr09Ott"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=up1a3i9oJd9Yw9fMoM8TWEP68ZtUiX+5vGFHxRzoVD7YmMShne9g0VUEUbTZElg+z1RXD0TsJlYeYbMgROXI2XlQXiTfoze6ns4D45E7Rf18S3HHGIJV84Vws2fZ2oq9GooUhGHy7A/cvcH+gJ0VgtdnHQ9QcllKXhmecf29xSSRcStYUMHjII1yRmsV6Z4Nh7kU3+0aHEbt7z66nkLivETLOthmBo/RB4lV4UpIW1o6elxKr/A5BDsdvPc547Wl9p/jK08EQWwbzbxkpssTcRWytxblP44ztsYMlJQ3Lpqde1uGQJIrqxg9FMEftPTo3WoDJcLcL2EMMN9I4ua7Vw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IYxgggemF6kcr23u59m435dkuW98QjichUv7dbfp7p8=;
 b=njK3trz+dyUAh4AmUl4vR2snRXPSgOAI8W7eLkBy4Dw4o50ffTIJOnrrBVwC+QUemg7A278L+L6zLuB23BAa1iL0RYB8PwVXWvTM2l30TjCHdUfvZPq2OcI0y71yStC5zcTZNEnP2sdF1QQJ2Av4OudhqppO91yUmz4AK2Xu+rw9aA0dMSAJbTRfHVLsjjkEYdobQSZnNGIt6CRVK05xbHHLJKVAIgleOUQtfqYLA2vPnmhblCCFiNDOfsWBbFTRuj/47Aw/VCbU/OaYfIifA9hwiRAtwgLqfN8J7DYK29pWsprTH7sFlv/MDWftEjCWXXw7WKS3fYU3OHD0KfMscA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IYxgggemF6kcr23u59m435dkuW98QjichUv7dbfp7p8=;
 b=Wpr09OttxCZwLXxlSNIbHy6zlf7jpoPSVy6npw8Gc8iUJGuJnhkzSqe7qnX8vaFA5KTk0JucBky2PEL0BGuIHZ7igbSeQQMOOy/+9nY2lY9fP71XvhmLlat1NL5lM1HxhudRTDNnjJX1eDd25cXAJXBapeKgFvaTp0wqN0iI9r/Dx6LdbsSAnfqXbib1FmZ2v9t1zr1IMRRdhf+U60U3Zim3Ekg1D8ZxplgMtltMFOzdcvks+cQq/ZZu/JUc2sqYobqTweHaToovgO4isyusvtnaSSebudtsKPRJoGR3K64Zma/7e7eYJaiMMy9v6i/uU35NcWa36zAFIUBYh4bKrA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from MW4PR12MB6873.namprd12.prod.outlook.com (2603:10b6:303:20c::17)
 by MN6PR12MB8470.namprd12.prod.outlook.com (2603:10b6:208:46d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Thu, 17 Sep
 2026 18:10:46 +0000
Received: from MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1]) by MW4PR12MB6873.namprd12.prod.outlook.com
 ([fe80::a338:bd2c:3a38:ece1%5]) with mapi id 15.21.0406.007; Thu, 17 Sep 2026
 18:10:46 +0000
Content-Type: text/plain; charset=UTF-8
Date: Thu, 17 Sep 2026 19:10:42 +0100
Message-Id: <DLHSL43HJVOM.2LMYD808W8FPN@nvidia.com>
Cc: "Stephen Boyd" <sboyd@kernel.org>, "Brian Masney"
 <bmasney+clk@redhat.com>, "Jerome Brunet" <jbrunet+clk@baylibre.com>,
 "Miguel Ojeda" <ojeda@kernel.org>, "Boqun Feng" <boqun@kernel.org>, "Gary
 Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 "Daniel Almeida" <daniel.almeida@collabora.com>, "Tamir Duberstein"
 <tamird@kernel.org>, =?utf-8?q?Onur_=C3=96zkan?= <work@onurozkan.dev>,
 <linux-clk@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] rust: clk: document overflow panics in `Hertz`
 constructors
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Georgios Androutsopoulos" <georgeandrout13@gmail.com>
Content-Transfer-Encoding: quoted-printable
References: <20260908225615.1732105-1-georgeandrout13@gmail.com>
In-Reply-To: <20260908225615.1732105-1-georgeandrout13@gmail.com>
X-ClientProxiedBy: AM8P191CA0019.EURP191.PROD.OUTLOOK.COM
 (2603:10a6:20b:21a::24) To MW4PR12MB6873.namprd12.prod.outlook.com
 (2603:10b6:303:20c::17)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR12MB6873:EE_|MN6PR12MB8470:EE_
X-MS-Office365-Filtering-Correlation-Id: 2389c5c4-ad2f-4514-a711-08df14e6fec4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|23010399003|366016|376014|7416014|1800799024|10067099003|56012099006|11063799006|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info:
	T7fPrFaDxJThbVON3pMkhfu5KmmeBDB7F5wOsZHKCm5hK/k7Sdv9ruR5xtuHOg/2WaJrLcddOCdpdGWvJup/HhoL8AeYW9ruefJWbI3DBNnsmInrmOVn1Ptr6Yl+LOJBXks13zM6FSD8+/zVxjZYiVmH6jpKVWAEc9CRMEsFiySDf/NtH8ani8isaSo0MszgZwQuwtUy4Ic3lsr3gOoLiB5le/B87+y+MDmkIf09EWiw5XTV5fzBQF58GmfucJPEJohM13s+qjQJlTSIimkTXCjPJwwxu9VtuarSvajQBEk+dFU4sjCfF6KOtYPC4jnqBVyjiGKLpfTpWre/l7CPSxK8IAxaHTUE32DoNqYxqxW2zIHDOS2R8EEKVsToCcXn/F7jH2R9hU+OnD/cfTKbiP7sWBmatSzA8RvYDOqhPTR4re3IIVOj25oEhLzg33hMybNJN8Io8R/0cOrlYq9omrE379GT50TYCXJ3PgDghpVCSe6LxPzG6TrqTgHZPYtmvjuU6BCkKbngXnIG3q0l8/c+KPoGSr0PLWrUkMVUK3iKpzYSM/iz81TBA1Ef6aHLG+yOsW++d1erEVTeEjHhobz5GeRmxgBkAENv9GfOSolZf0CMCDZop1PIDwTfqF6/sGTiY8pESFqqc6FshNFQZAv8MAVxzWqM58x9+77E1vA=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:MW4PR12MB6873.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(23010399003)(366016)(376014)(7416014)(1800799024)(10067099003)(56012099006)(11063799006)(18002099003)(22082099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?US95SHlYcUtoaHNVem9jbFhQVlN3SGp2VUJsQXg1VVc4YXVkV1NvYml0REQx?=
 =?utf-8?B?MEVQeW5IVW1iWXRRWWZVSW5oZFV3RmxXdjRqZjhCZlZWbHNBZEFzQzc5aitI?=
 =?utf-8?B?NlpOSmtPTnBFcVA2Q2RyYmpnUVRvN1ZhbG1Jb3dxS1pSNnY2bTQ3TWN3RHQ4?=
 =?utf-8?B?TTkrdFhRd0RoNEc0SlJxVkhCcnhMVnduTUV3MHZSMEJuZVF2SVBwQTRxMUlT?=
 =?utf-8?B?QnpoR1IxYmJ5OFQxRFhiYW44MHNZNFl6RXhQUjZJME5DZ29nNERITjRSUlFI?=
 =?utf-8?B?MTVKR3N3UzhRRm1VS2IzQjllMVVJR01pVFZNZlUybWVBdVY5YUtkU3ZJY2lw?=
 =?utf-8?B?eGU2WmxIMWN0eXBHeHdhc0FwcFA2NXQ4dFNxd0JtNjJQcG9ITjF5RWtuVjZW?=
 =?utf-8?B?eHNPTFF5SFN1ZkRSSE9Tb0dHRHlBZCtNdzJNTU5vckJiQnF6WXRvdlIrd05Q?=
 =?utf-8?B?R2FmeTN5M1pac0E0V0RDN29JYjRrR2JsU3pQUkVLaWhwK0RBZTRSc2VmWFp1?=
 =?utf-8?B?emI4eU5ldE51THlSR3pTRlh4cStGQkhkOGc5c093MkhVUERhZ3F0VWJzN2J3?=
 =?utf-8?B?VXhjWnBOeHlxSDcxaHpUVE8zOFE5UUdoenU0dHZNc1dLWmxGTWxFRXNEYnVJ?=
 =?utf-8?B?MWRUNFFFamt5Z0U3SjhFTUFVNFdKYUZoWHE0dDdDTStxbXd4SUZ1R01IeG8z?=
 =?utf-8?B?TFhZYkhtUXJnRHU2cFM0N0l1cjU0aTVwYkpOQUtoRmtXSlJvT0RhaXNjWk1C?=
 =?utf-8?B?NXNuT1pvUDU5Y1h0c0lrVXZCcm9xR3J6c3pNM1VNcDRYaUpNd3c5Yzd2WnJz?=
 =?utf-8?B?QVdpdStWTGc3NXZBWU9LLzJ3cGtHSWIyMExFenZtb1JISEFhOE0vRmIrSjBF?=
 =?utf-8?B?c3pCZUxxKzJ0U09RbW5VVjBsUUVYRjR6VXhIRUllTWtXQjQ5NHdPODl2MVFt?=
 =?utf-8?B?SVMwNTVLK3UrNGpDdll1OWwvZXBRQWJYa2dvb3RLNktHM1RzWDRENDY0cWZH?=
 =?utf-8?B?OW4yYnJOOFQ5Z3BSUTR5SUR4WnZ3c2pRMnJlRWZ2eTMxbWsxWmtjamNBTG1N?=
 =?utf-8?B?V1ErV0xKam03aWJnL0p6TktGQm8vdit3a3gvVVA4K3l1SE1PVURONE5Lam1o?=
 =?utf-8?B?VkM0cHRMVVZpQXhHc2FOSXhZUDk0V2EvTCt4bUpJUjYzR2NSa2pNejJjOUp3?=
 =?utf-8?B?RW5tWFVtYUxSTTRTeWpEVXdhbkZHQ2ZjaFAwV2FybkFqSG9yNnVaUmJoWnhL?=
 =?utf-8?B?NnZLTms4SG42Y01IMW16VGJXWTlFUTFKS1VPQU5sdllmNExaWFA2MjVwNk1s?=
 =?utf-8?B?aDlsaGdVUTZrdndlczk3Qlg0K0JQaDZGbDJQWXAzSyt2L25ScjZRK1AwU2Yz?=
 =?utf-8?B?a0FwYWRLKzFlK1FUMG1TREJPZ24wWUE4S2dyLzkxenF3QnF6THdVdklrT1hv?=
 =?utf-8?B?S3dMOURQTC9KOWZUL3NQU2YxVU9SV2huNDEvaHdRUWtZa3ZraUZ0ZGh2MlRQ?=
 =?utf-8?B?RGlvUXpNbGh4Vk91aGgrZ01iZDN4c1plUnlocmRBdU83eG44bkMzODdDNUFU?=
 =?utf-8?B?YlZSWDRUbTc1bEQ0QTRJd0RQQ1NFZVhySjYrelArQmdTRDV0c3VLTVh1cFdu?=
 =?utf-8?B?WGk2Zm9XVUwyMFNzeFRwcnRRb1p6d2VkdWc4K09JRjBidUs4Z3ZFd2tsVWZL?=
 =?utf-8?B?RHVadG5BK1RRV0JENjVLeTl4ek9pZnV4Unl6eDU1MVppb0xIazdGZU1FS29O?=
 =?utf-8?B?NTVIOTFwVkxrQ0h5dG1BQjFTVTVQOUNoTWR3L1lHVWNOdDVHME1yU1hOS2d0?=
 =?utf-8?B?VWlWQjhpLzRVcEcreGM1YjFlL1hsYlgrUkJqNG90ck1CNytlWnMvVzJBaUY2?=
 =?utf-8?B?NFRZcWszRHRiVTd4UWR3aEVSVjM4RlRJUnM4Lzk5N1dGdUxiZVRNODZBd1Rs?=
 =?utf-8?B?N0hPaEg4aVgzWnB0UFRhZHBzZnJJWTNhSy9uT204VCtwUzFtMEJpTk13NXZE?=
 =?utf-8?B?dFVhWHhMWnJwb1owMEFQbnJMR3NxbXo0VmFla1ZzVEVmR0lXUnlITGsxWWR6?=
 =?utf-8?B?ZFVVREhGTUJGeDUvajhCMFJMNjhzdmNwbVJCMnBESjFUdmhaRi9FeHMvRVRz?=
 =?utf-8?B?aWxzd29Vcm5xd3Jvb1FhNWRPU2JIU1BuUlk0QmpncWppWG5jNlltLzZqODhP?=
 =?utf-8?B?dzZVV3g0dldWY1hUQ2VtVUtxOWs2d0s0T2lTQUZibGNpS2lCV0ZaNlJqRWwr?=
 =?utf-8?B?TytvQWQyTS9LZmpZSkpoNTFPRUw4c2xtMklzU0RKSWg1SHRtNWtJVUpjdFV4?=
 =?utf-8?B?Wnh3a1VQWDVqakhabENDcG1mSlpuaWIrbnV5UVl5TlovT0c2czRjUT09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2389c5c4-ad2f-4514-a711-08df14e6fec4
X-MS-Exchange-CrossTenant-AuthSource: MW4PR12MB6873.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2026 18:10:46.2430
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zm6aBKo7+u47qtLOpswMZnGgyg2WapgH5IJ1sNvB7vV15d/CIVW4kRj3DF1ebmPL56x3XOYfXg2Z9lvWp/9xuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR12MB8470

On Tue Sep 8, 2026 at 11:56 PM BST, Georgios Androutsopoulos wrote:
> `Hertz::from_khz()`, `from_mhz()` and `from_ghz()` multiply their
> argument by 1_000, 1_000_000 and 1_000_000_000 respectively without
> checking for overflow. When `CONFIG_RUST_OVERFLOW_CHECKS` is enabled,
> each panics once its argument exceeds `c_ulong::MAX` divided by that
> factor. None of the three documents this. The panic occurs only at
> runtime, when the argument is not a constant expression.
>
> Add the missing `# Panics` sections stating the bound for each unit.
>
> Fixes: d01d70205601 ("rust: clk: Add initial abstractions")
> Signed-off-by: Georgios Androutsopoulos <georgeandrout13@gmail.com>

As we just discussed at Kangrejos we might want to harden these a bit,
but meanwhile documenting the behavior is indeed a good idea.

Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>
