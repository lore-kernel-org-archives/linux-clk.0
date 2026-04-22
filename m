Received: from CY7PR03CU001.outbound.protection.outlook.com (mail-westcentralusazon11020078.outbound.protection.outlook.com [40.93.198.78])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B1239A060
	for <linux-clk@vger.kernel.org>; Wed, 22 Apr 2026 19:43:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.93.198.78
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776886990; cv=fail; b=PeHhCL6rLrAF7Ix+VCrYgoWBKqONQme4PZJrcuzqlJ5DYZj4GlUoD3l9fyaCy0Ic3UMxOI7JHKRwr25/UeDDxFs/aUk9aUZGRZEqMjchaRxPCTxSzP1q1FjhlZZbslWX2j5ltMaAqDMtv7XreuhGB7qeCBEg8uZHpoznG2GzUe4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776886990; c=relaxed/simple;
	bh=5biPZ8bpwRZB9y+dCIw+4ehuBVIjU22Li5wegGx+RDk=;
	h=Date:From:To:Cc:Subject:Message-ID:Content-Type:
	 Content-Disposition:MIME-Version; b=Bz/ZFJO/LDPHNb0hq/mU2aEslsSg9vdEph3IghyPg82EiPh/REXIxFcCdN95JpXyZUE57PIRK8iS5fJezijT4wIwiBf9k44CyDpDQEEvOY69Wv796wqnCnwk98s0TNiHHY8W/HVPBUcJeVS7OIHaE/91ZdZi9YVn8w3VrLTN3rg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=in-advantage.com; spf=pass smtp.mailfrom=in-advantage.com; dkim=pass (1024-bit key) header.d=in-advantage.com header.i=@in-advantage.com header.b=mP3EF0uU; arc=fail smtp.client-ip=40.93.198.78
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=in-advantage.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=in-advantage.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=in-advantage.com header.i=@in-advantage.com header.b="mP3EF0uU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FDcNN8Q0avlGWfNHiPHl88WDMnKiwxVDv7e9TFd/FsufVKOTqeeJO7HPYAmK+ZEWL979oUXCtfhvgGaTE9FYp64RzHYotzyZcAwLuyhPbcGxSBHn62GRNW4fKpuie2+ZrVwkV7Ap2LG31/Ey+IUTPq1cT9d9zUgTx8Pf8NoheKtUWFt/OLv1WEhBhwIkiKEJnRwEx0mkUuyhZz8ZTlFbJravUcMxxgV+IYiKCMenzSVivf+ENRE1KK3x/htinunOY+rRb5resQrYkPuzp4VGOxoPPXtz1BxRg6xt3wgf4/CBgLFgYgjLKYWxMxjomy9/2RntKnIiLq3bpWPShXlfTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5biPZ8bpwRZB9y+dCIw+4ehuBVIjU22Li5wegGx+RDk=;
 b=YX/LUBkgVA46oqKNpPR250RIkZfC1d9CHqUVmj0MyY8XAts0nBuOIgQ9qCe1ZYJDJYnGhUruB0jXWfKU3FtepeGQ/BK0uadAT/i2zavB1Y2pbWUbYlGEeu/q94q87dTrPO7Bja9EBzSmGXSDbJupIEu/qYMOACf6HgvYQNhInFY1td+QtRRmjXtr1ms+huusUySOKMZPRKIxv4d7bo50XLMfRGpodFPVXicdwN31xJ0vWgCjQSmbhpWBMeBsg0kEkCCHFrMj9kiMYvz0vY7D4+MaQvguIuipTkWfwhvzNDwBos6v99/XFAOe71MfbBX/89rh1/42TkriB8oLE668jg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=in-advantage.com; dmarc=pass action=none
 header.from=in-advantage.com; dkim=pass header.d=in-advantage.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=in-advantage.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5biPZ8bpwRZB9y+dCIw+4ehuBVIjU22Li5wegGx+RDk=;
 b=mP3EF0uU8yjTFcUgtpbwKjUN4ggFLhVpoIQPZ/OKpCkmIRh6v8Efu4dHKTw/wRfalpCQLwPLihErDRgjQ+XMqSjMDGS7Rj+DSIiS7Yx52c2GxKpC0H/lqrrGvSrgxZltNZI01OsUKrh+Q7UG1X9QBiLDNMPys9t4m/nk0RgYulU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=in-advantage.com;
Received: from DS4PPF3984739DB.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d15) by CO1PR10MB4769.namprd10.prod.outlook.com
 (2603:10b6:303:98::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9846.19; Wed, 22 Apr
 2026 19:43:05 +0000
Received: from DS4PPF3984739DB.namprd10.prod.outlook.com
 ([fe80::550d:c3e:e737:683f]) by DS4PPF3984739DB.namprd10.prod.outlook.com
 ([fe80::550d:c3e:e737:683f%5]) with mapi id 15.20.9846.016; Wed, 22 Apr 2026
 19:43:05 +0000
Date: Wed, 22 Apr 2026 14:43:01 -0500
From: Colin Foster <colin.foster@in-advantage.com>
To: linux-clk@vger.kernel.org
Cc: Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Michal Simek <michal.simek@amd.com>,
	Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>,
	Brian Masney <bmasney@redhat.com>
Subject: clk-xnlx-clock-wizard minimum clock error
Message-ID: <aekkxSx4OQ-YJ1yJ@colin-ia-desktop>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-ClientProxiedBy: IA1P220CA0003.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:208:461::9) To DS4PPF3984739DB.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d15)
Precedence: bulk
X-Mailing-List: linux-clk@vger.kernel.org
List-Id: <linux-clk.vger.kernel.org>
List-Subscribe: <mailto:linux-clk+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-clk+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPF3984739DB:EE_|CO1PR10MB4769:EE_
X-MS-Office365-Filtering-Correlation-Id: 41f3c5f9-31fe-4c84-72bf-08dea0a75f25
X-MS-Exchange-AtpMessageProperties: SA
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|56012099003|18002099003|55112099003;
X-Microsoft-Antispam-Message-Info:
	BYz8K7ywxg2vKFMJSdZgvpPcuMYwZJzn0jNzNbRtMi7q41ZeAVCd2gcCe7DTLY1F3D9R9goAmjF/RZ3ECSUQKejCS9ySY2tlaMnTisjkTq0TlVfeYdXP8Gplo6+cMx56G7w80yYY2zriAj43i/xuZh282Jzz3Q+H8it2KYcWb4mPqEMhxvAnxQv3Vg5w0jjzpSQudHeKfrXN8Guna5lebEDHap7ZcQwAj5vUPypRCC7ACAiQRrqxO4NGJzp9KdHMaY25enWVnPYfZ0H0uR1KOPWElbpnNalqUbRh9dWNXpl/gNb18uEdymE+nraXxZzu0D0yhjknNyJ4eEkT5AuhmTnQN9NU+0e9TCLRWLY6skRW6/TAlUBm7w7RjpvMSbcpv7qtBVp2ymgpD9vM1QH46N7CJ3eJRXBq1xWKv6mT1epnk8cf1ytIiJE98dUZSG7wDX4mRsbwIhaN0zaRqoi0m7Hp0GT/ZzVIPHOzbUU6+59o94VvNlmEutq/0ZC8eN91atrk1HxqOBz7Y79NAxAPusXHfcAnJpW0JAOYYfrB2jU9By1ZI2u13HJ8V+6glOHEc0THXdAiotUehbWkMGdBRd9K2CjfrKIg37fgT8xFrkd1sT1FO18SpZUnAaKuUlmqkfOPaqhVvxhdbuZrW6Vr4p6+mS0ejUz143koxs2td229kbdbNzQHPVSemtsJr65dfxKM1sP3tdNn0H9WNyo5kC7AO+qUU1U9++G7U6pgoIY=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DS4PPF3984739DB.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(56012099003)(18002099003)(55112099003);DIR:OUT;SFP:1102;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?cJxIuEqcYodXHLDofg5ecqrCrZeNLAau4uWR/B/HyrrWEmiDl67wBjEOBJck?=
 =?us-ascii?Q?QwH0fjmsxh/XqQvJdPt1gH5I9q8svp1Ntn+RFlljRxC+4YjZ1JahLSHnxaPV?=
 =?us-ascii?Q?bzKOVXUHJT4TQD8VHsKsINhlBAZvI/Mlc7dvWH5lGSrFscywMNi5kvR0Gb55?=
 =?us-ascii?Q?o4N0tA40FGr4Bmdkg8XBBuA+Q+L/AmHlWHE3e2lzC3SOVYRoFORlF8J2DiAy?=
 =?us-ascii?Q?ncqpnbKZwMUHj77+k6+IjQhdUMAvmc9ZPlQIwbpX+R127fk81/dHn5fdSkEA?=
 =?us-ascii?Q?O2KRiIgVI4mViXgtROhsXAFwRRnj0f76SQC8GVlkpjLVNAHJ+AvhpcTEFQ7U?=
 =?us-ascii?Q?1nVDGSgOJoesbfqSGXxwR1t8y/YXsOHs6xk5uNYeyBxlIvOYnkXvkjmfmoL4?=
 =?us-ascii?Q?sP6Jrk9fGbcSCIcQl5h7rVmMcEmccRJLNUUktqqKlFRZtfByCkiBktsZpJ//?=
 =?us-ascii?Q?ZQ9QJSxT7pGAjfX9p5AT176EshaWdXe8+BtNDwgafdSATwUqNh6CPHOm+DF7?=
 =?us-ascii?Q?ZfAJguZfqsodAo1KHG59G0DizyETFTzZxJcrUdfNDdF0iYoWG/cP3gJXTQax?=
 =?us-ascii?Q?A8CZAjt6g4FqMc9dCijnGNqYgz8SFYSw+5P4Rqr0USHkR1iUNhP0YQl6Xx8W?=
 =?us-ascii?Q?FizSelxl/BJsNCMjtTCD3fsAObR/mQGd4UGyhdxSylfPadd7H/aYkSrGqrLl?=
 =?us-ascii?Q?itIHsTN5anyzfFjMBaMQmdwkvgsNa6vSLx2zdVnxOWAOm6Wi3DVtv3QB7zPQ?=
 =?us-ascii?Q?BLgKbOeMC/qsNhmxaoxuG51l85s7uZuOGVdMWGIlYZYulLLwolf8WAYoaMS1?=
 =?us-ascii?Q?LWcVx6gfrO6Vyn82HtKBRS3YlJxfRGYVVkrBVUEjvKt6ukh8rT5cV8hliP5C?=
 =?us-ascii?Q?F5DtfA6r9Z3KXO+l6OQEEtHHLOI8lgIcF2IAVTep4GF2xytsIVTh2bICweGo?=
 =?us-ascii?Q?pjYY09w9gz7DStbmkanOrONqkukF1ZDyqjLhXcHMX0DTreop5JtgZq5HZPj5?=
 =?us-ascii?Q?7rcqYIWMoZcD6ps1VrSYGEwDgI80BMYcrolMLEDRjvAqfHm3U43LgTL94baP?=
 =?us-ascii?Q?IjZZuTxIx+MY66NMpb2RKEK6ifZxORV1NHD7KSAD6/LUH1wqNLHBs/PuV7qL?=
 =?us-ascii?Q?kIrrJyRxuNYYJUu7pyrKEnvecgkDcfsZh/RVGEElahZbC7+RH8G1FDZBCcvy?=
 =?us-ascii?Q?hts7urcP4gHy+1NC0CTI0fd61ODmhlxouKlqU+CguVuQO34xYsGoK4A5qAF0?=
 =?us-ascii?Q?3aL5p0PZLjMJY+igAdfR9iCpdHzb9PgFVEhcZAelQmo+CWrH33Dv6/xOqMu1?=
 =?us-ascii?Q?MoB6RuemZIiBvzIOxxxjrru7KEAAjISuvFSY6msya4jeQOsd43McmmAgjtLM?=
 =?us-ascii?Q?nlSSUEZ2jHysnuWPUDh1lirFF0eXijsSNs+59qNiIo0A8Rjtj9+2vYyD8AZh?=
 =?us-ascii?Q?t0BUgllCYyIwKQrb0fjr0wHRAVOd2DjW0cU8NczNGsYgUQ2Ps0hgnCSN0QVR?=
 =?us-ascii?Q?EjqbhuyySgkCV7IyyOkxwa8nxb4zWC/c8zMwCPPlW/g+2/H/UjgsN66RhTHk?=
 =?us-ascii?Q?ywbfhDGYGt4p5ZM7yJUEorEKuyn5k7H+2s2KwxShGdXipNC6Gjv2mw048jJg?=
 =?us-ascii?Q?bch431Akn0wL+SxPm7Z9W+f9zgfg0xmEKn1rVsckWIxF3DT7Lg0dNiPGSPAM?=
 =?us-ascii?Q?5ERd46Gus0GLjRpEeAqNgqmRV4HYAAqknEz0QNLSrfrE+bgEsxBfi3O6uKwI?=
 =?us-ascii?Q?14SxNa+XVmbTsGb8LnQfTVfV1FG647A=3D?=
X-OriginatorOrg: in-advantage.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 41f3c5f9-31fe-4c84-72bf-08dea0a75f25
X-MS-Exchange-CrossTenant-AuthSource: DS4PPF3984739DB.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2026 19:43:05.1320
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 48e842ca-fbd8-4633-a79d-0c955a7d3aae
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RqOU8yqZLed5DAfVr5cHmODcEEQlLbjkj3+S5pTw9AOcIFymE9EtbR4D8FqV4JSo8pEg9D9TFGfDDk4d9m+F/70HEowxJwk/8q0XMl2uOSc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR10MB4769

Hello,

I have a (hopefully) quick question about the behavior of
clk-xlnx-clock-wizard. Right now there's a macro WZRD_MIN_ERR of 20kHz.

Is there any physical reason behind that number? I'm new to clock
drivers so I don't know if it makes sense for the restriction to be
removed or configurable.

Thanks for any advice,

Colin Foster
