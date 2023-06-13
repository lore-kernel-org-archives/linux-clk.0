Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22090EB64D0
	for <linux-clk@archiver.kernel.org>; Tue, 13 Jun 2023 17:12:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236391AbjFMRMR (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Jun 2023 13:12:17 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236464AbjFMRMO (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Jun 2023 13:12:14 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BC7F81BE1;
        Tue, 13 Jun 2023 10:12:12 -0700 (PDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35DGiBG6013865;
        Tue, 13 Jun 2023 17:11:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=8h937LRp0yH7JoS7Yk9l16tXy4g0QvHCrqX2CF7NxCM=;
 b=nzhUJMF+G05ASZaO4PRzXEdNzAdiSS4Xbv3rOqy4z+H8IjF1wIbEK5rj4qY2Wcj3vXwk
 gQhDZmxyfT2vvvJvI7wScVM25M9BxHNteWHNe4XOT+F7qMFafaDaPm2qKZWah/Z1K4cI
 mW1aXU8xHX/4tQ8nPA1L12CynfSzCJRl6vD5m1pQZSRXIHDoD4aAnISIo16kgGg+kmG9
 e82tZphCWHlrwqBoypy2KpaI7pTdXxhAgrZLBaOWWfLRbfa0+sYE3/Gh9mrmBX4z1nDk
 cm4Z6p4CrV36ofzwEpHegpqRx8IhQlSP8VaC53QktvVhKgu0/Nr9NY/5i+4rcgt1COLs qQ== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r4fs1wurq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 13 Jun 2023 17:11:58 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35DFlDqG017782;
        Tue, 13 Jun 2023 17:11:57 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2107.outbound.protection.outlook.com [104.47.58.107])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3r4fm46svt-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 13 Jun 2023 17:11:57 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eQBWdRXbfwVhAZQNu90ZtGD8IvehXATLGJJfuHm1ro/RQLmzuWaScU0Dl+Po13FSTI2UVZxjs75EyFr6JIVm+n4/SMYmqsonayG7pbof5fyPx1D4J6SwujXl4ruPiJCsjHw4vGHntwCKmgZNS/MsQEHBL+bI/mzG7RtC1OyN07s6ecuM0fAUTyQU4Ba8kiu34t9F1FYXIMPQfvYBjcFSzj1co1TTAVG4xpbleP/h8ZJOdgfr9KJdAqEibBWCXJjUCkLRDddOmjrAT7EXQn4SjX752HMS5r1hTET184FJZzwA6JwNH/BkRcG3McCxVkH1uvaOR/R4brCj1lYV9drSWA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8h937LRp0yH7JoS7Yk9l16tXy4g0QvHCrqX2CF7NxCM=;
 b=fL/zK7ReP3IaKejxGcPoiuRQEY8e4YufZDhGOZ+chKfoQNsKaSskJ8QO14nMEZVzOsQYFxrJB3cLySw7MXpb0b1mM1yAdehC1zmTNS3Y0xsurZk90Ss1blnjjZ6hUd8A80eGlNcX/tddPp7b+s3fD0CGaHpxnK2SqrEbvtIRok1vr2GSQon/DmsY+r0/S58fAWcODU8ptzyR30jEChPnR9HVZrclvkzwdGRr5OYXMOwdUz+abrAIbKtk6QPpiq061BimIirLMU6dEIkp7JNTuaIm8O09dBXVbd1BdaLjP0tWf0T9D3FIriQLfNHnvu28ptllsflmObQ3zGcYqj4xBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8h937LRp0yH7JoS7Yk9l16tXy4g0QvHCrqX2CF7NxCM=;
 b=0T7Ry0OscqLFiGgtpRNdLX76YOK0TmkCBBVbv37Jq8wnIuZnbEqwQifCMHQWEmLoEojz1pnBK7pVfGJQXO4qjmjiolmL10m31Y23ujCSbIikogu/55YFfwc5k29sfTnIFsZAIYdHRqMBcbJc+px3WgmYP8XgRXCjwD9fWHoMMgE=
Received: from PH8PR10MB6290.namprd10.prod.outlook.com (2603:10b6:510:1c1::7)
 by MW6PR10MB7615.namprd10.prod.outlook.com (2603:10b6:303:23f::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.32; Tue, 13 Jun
 2023 17:11:55 +0000
Received: from PH8PR10MB6290.namprd10.prod.outlook.com
 ([fe80::68c5:330c:d234:3834]) by PH8PR10MB6290.namprd10.prod.outlook.com
 ([fe80::68c5:330c:d234:3834%7]) with mapi id 15.20.6455.030; Tue, 13 Jun 2023
 17:11:55 +0000
Message-ID: <45fdc54e-7ab6-edd6-d55a-473485608473@oracle.com>
Date:   Tue, 13 Jun 2023 22:41:43 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v4 61/68] clk: sprd: composite: Switch to determine_rate
Content-Language: en-US
To:     Maxime Ripard <maxime@cerno.tech>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Cc:     linux-clk@vger.kernel.org,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Dan Carpenter <error27@gmail.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        kernel-janitors@vger.kernel.org,
        Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
 <20221018-clk-range-checks-fixes-v4-61-971d5077e7d2@cerno.tech>
From:   Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
In-Reply-To: <20221018-clk-range-checks-fixes-v4-61-971d5077e7d2@cerno.tech>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SGXP274CA0003.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::15)
 To PH8PR10MB6290.namprd10.prod.outlook.com (2603:10b6:510:1c1::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6290:EE_|MW6PR10MB7615:EE_
X-MS-Office365-Filtering-Correlation-Id: c5596911-77f2-4b38-7a3e-08db6c3149c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7p61nMBPxDawjGFZ8+qOlQJ9dvccTHSYnEsSIC+/aGCczumQpx34ayp02/fplBJguWoys2gZJpQShWUEjekejFATt6GrIE6y1yRQUMSVgXRL+ATRkmCL/tL9Y826XnmQ+z+EXCYVxch80MwHwVvc6eiB6zDf0S26n03preMuVRxZqAYDtzg94XK1as03s4MOKbPf2aQzUPmTQfLqu3wpBJt0kAhQ/Mm8LPlZJQ1RO95/+Mt6IwOukQZIpM4HMu8FdyVAEIQ8MUPLI3duytkW4fLJZk/jhSC3OiKL7D8Ulx27TTINzqfZ1ZT4zXoaZ0vK0h4kbh+cGIKqU1AFn3nYEJEfveC/56Bf0UAsNtWqy+SRjks4S5z6Bx9FQlcCm2ZZvE1aD3AUXnUpHyeQfD44RTJfT8CFQYTSRRAC9VduwPmbjzTmgz1uLsAy5jZXgjYaLtPvUTIBIyCWzC8qSHKdFTy0+EChjuodn59RXElo8+egqmT83qYc73iV1EDZERADPkFeD7/k54GyHhXmewxwdo8+Lna+kT/WnbNj64/MdkMd2weCBxgocNkBHhIej7cN3b2HMHW5hCLFaUhDilq+hqZg2rbbZmd2vJsckhzSMCiz9HBD3+QWt/EyoH1V3CqaVK6zkIWnwOJR0iAYs4Iwcw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6290.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(376002)(136003)(346002)(366004)(451199021)(2906002)(31696002)(2616005)(83380400001)(86362001)(36756003)(38100700002)(5660300002)(54906003)(6486002)(6666004)(316002)(41300700001)(8676002)(107886003)(478600001)(6512007)(66556008)(66476007)(53546011)(4326008)(6506007)(31686004)(66946007)(110136005)(26005)(8936002)(7416002)(186003)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?SlpzZTJ0Y2R6UFdXNllLVkNlU0daYUd5UUtHL0VJSnFuWk41dW9nb3IxMmp1?=
 =?utf-8?B?RDBDZVE5UzBVT2dXelpMTGFFSWF0a0ROalVuZVNjODdKRW12NjZyc0hQazU1?=
 =?utf-8?B?QlorY2VnM3dZT1FPRFFXa3dCT3lPMGl3ZThSTnFqU3ZMNGdtL1hoc0VscEVB?=
 =?utf-8?B?M1ZSUUVEbEd1VUg0TmEwNU1FUGpvQ292K0dsQWFPbzdScjFEMDJiV1BXNDkr?=
 =?utf-8?B?TzB0VW5DZGZ0TGtoRktIbmxHNlQrdnNuenRicFJVRkZ3SHFvL2FzbnRUSXh5?=
 =?utf-8?B?SFRUNUlpSlo1emVNdS8wWCt5VmZPcmtQZEpubVNyUXVyeVI3WTNjYW1SYlRC?=
 =?utf-8?B?bHd6Q2N0OFh0cUhVV3JsbTYwUGNGeEpyNlRaNGNwZiszZTducVVocmRLcFh4?=
 =?utf-8?B?NWpRaVY5QStyZ3J4V0NkNTdBMXVtK1BpTzIrWUdaTWhYTDE4cmFFMmQrQzlj?=
 =?utf-8?B?cnlBck9PazlZWDMyeG9iMGhGQ2hmcWhoR3lHdTNTMmx0d1Z0c3U1MlhaTzNm?=
 =?utf-8?B?N0FYWm96S0xTYk1rcy9paVJhQlM4QkdJbWM1Y3dNdHpIOURJaXJsaXVhWFhp?=
 =?utf-8?B?UUJteFZ5cEprcTZFVjAwZWlrcFZWaGVrNEppVE5Cb3dLaFU1NE9KcWxhZ3Zm?=
 =?utf-8?B?b2NGWTNSTGlpTWlMZ3RwMGNNdlpXbDQvNnpmVTJmRUVWb3pYb3N2MHNFeUdq?=
 =?utf-8?B?VTBHQzVhRVpoa2x5ellHZEI5Nk12R2gxNjRtMFplY1B1NkpFckl3dk1NaE84?=
 =?utf-8?B?SnVhS3FiWlBPZE96RXRYT2JuanlxQlJTVVphWXFtQzFTcnhKZk9TUVBBRkVr?=
 =?utf-8?B?bUVqdUdBOUVLOVc1bGtnK001Z1N6Z25CQnBkS2RTTjJEMGtVSTNTUjdLRGdx?=
 =?utf-8?B?dXFScEtkYlRvSGpTbXBxWUhLaFhDVWxtcGJRQTcvQmZkVDJ5MWRaRmRNbXpM?=
 =?utf-8?B?Y1I3MFlpYmJLQkg3MTVWelN6UVJOcVN5dkY3OVVHcmdjZVJMYmN6eVNjWThq?=
 =?utf-8?B?VEx4M0tOdDdNbEpCZzdXVGNCNDVwVWY0TkNkME1BMUpHTWQxenYwbHh3dkpR?=
 =?utf-8?B?dk0xeUMzOTRsU2MyRW9lNVBCZld5U2x4elpBTURuakVadXA5L0FIM2dQSm1Z?=
 =?utf-8?B?Y3RmQmNQTjB5UElIZFNQell6MGI0YU4zSHVuY0xwVFRFUG1TZWFxeVBLb1RN?=
 =?utf-8?B?MXpOckRnN2lvVkVXc2dBV251Vnd5ZTFGRGVBdHdmUEhjTlRERFE2V2pON1B6?=
 =?utf-8?B?RTVGbmNTUFBoYkc1NTRSTEdVMWE1WVBXbENqYWlVSEtOcmE3eUR2c0FKYTl4?=
 =?utf-8?B?bUVLRlY1Z2VDOXc1U1AxRVZvdk1aUWN0Q0xLVUp1a2xCOWlkQ0JzNlRmdERz?=
 =?utf-8?B?QlFvZURQaHc5K0pHMmhRQThFVVhYR2Z5VC8xMHJrY0tPWjU1azVtUVlvRCtC?=
 =?utf-8?B?SUZheFF5T25tc1hUT0pFRDRWa09OQ3F4eVlHRDVBOGNlQVJJaFE3VkVpZE91?=
 =?utf-8?B?V0lKZmZmRyt1M3Y5T0dsTkpuZHA2S05INXJ3QVorVDdhS0ptcm1wZitwK0Zs?=
 =?utf-8?B?NnVOeURxSUxZWlVNcnNqaGRjbHNPN1JjT3ZOQWJ2akV4VjdDeHY1TlJYZTlp?=
 =?utf-8?B?d2tGUjBVRDBlelRXZTFUaFIwblUyOWNWUWhrbzBtb1EwNWMzdHJEWFJ1WUQ3?=
 =?utf-8?B?ZzV1TGY4M0MzZytZWHFyMHdMUEg4U2V3MFRRbTlrcGs1ZGNEVTlhM3hJekJF?=
 =?utf-8?B?VTFRRjBwczM2eC94VjBXQ0tzSHRwSTRrd2pSczYxaWVyQTJDY2VuOVlTVkow?=
 =?utf-8?B?NUthY09kWkFXd3VpNzkzZVRJbUVrclVycVFKMmlEZnV0eDN2ZzVqSVM3RzJr?=
 =?utf-8?B?YjNOZHUxVmpabXV5QWU2OWtEK2NVQnB6Z0FKUVlXNjdEcnJmbUhhZXAzRDNr?=
 =?utf-8?B?cHF2bnFqQXpRQjhoZGNHMmxiV0g0Y3lIbGRkR0ZqN3pOcWNOMHgwRTNRcEx0?=
 =?utf-8?B?aU1Xb1R5SW93ME9qeTFKaTMya2RaWElyNHo0Z0JsSmdBTXRVMDF5WS91VjJM?=
 =?utf-8?B?UjlUY2JJbXFFNWpWTDdMOWg4dWtDdUR1Q2RsVFVCenRTOGNIZlY0ZzlGTWlI?=
 =?utf-8?B?cUQzRC82Z1hpSThJd1hHdFY1L043cUJaZUVjSkx4V255Y3FMQUNaMlVkYi8r?=
 =?utf-8?Q?DNlaM8SByhjJGeYf5bYQIEk=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?WHhJdSsrL2xwdGE5L3lHNFlYd002dTRpK2pTR1dWT3FEeTBYREtsMnJ4M2xW?=
 =?utf-8?B?QlUrNWs0L1ZWWkYwYys2T0owb3ZuUFBSaWhDT0NBRjFjcythNWs2QnFNbzJU?=
 =?utf-8?B?aUxLaFJreHFtaEhWcDRHNGhzNlZFMUpiN2dmaGhnb0RIV3F2NXRjZUdVNzdx?=
 =?utf-8?B?bGpHN1RqTlRacmZZNmxmV3pEWG5ycXQxZ1hWUHcxZFFFUVA2Ky9rNmNPNE9o?=
 =?utf-8?B?OXU5dlkreUM1dU1aeHY0ZXB5UXFhdGQ0UmNIajIvRnVYQ0JYaUlsdEZJMFZN?=
 =?utf-8?B?ZEU3R3FZRW5xaEwwR0pJSzZWSlE5Z2thQWtnYlFOOGVpTmFlQVlhaEk1NFox?=
 =?utf-8?B?endpNFJNeUk2cG1ndmI2K0tRWkYvNEJseXhvNmVzWG5OVUF1VHp1dktIQVFw?=
 =?utf-8?B?QXNQNVVmdlo5Z1p3Y1hsZldMS1pyT004YVA3YnRQay9oYmZkdEN2M1dQOHBI?=
 =?utf-8?B?WkRQczhoNktRVFlwekF5eHNaaHFqNEg4YTg1UG4yTzlHU2J5OGsyM1dMZkNo?=
 =?utf-8?B?dGZpTS93b1JNdGhyalNTQUNEL0FVeW9HYU50N1RUNjV5ZlJpc0srdEpaQ2Jr?=
 =?utf-8?B?WFZpc3JtTTlld0l3dlpqQ2xCRFAzSXlMb0QydTJvcFJaa1hRMnR4YTdhNzlT?=
 =?utf-8?B?cVp5Sm16L0JvVGs1NVBrVlBvR0krRS83cXlrTm41eElCQVp2Ymt4TWtpa2Nt?=
 =?utf-8?B?K3hoVWpxVkpIT1NRajBlUGgxT2ZzMFdibTgxSE1KNE9LZGk3S29oMFdvbHlT?=
 =?utf-8?B?ZHNwTll1MVRoaGJVejZQUUlYYW1raUovS1lmSUNKZWhhNi9pamR0aEx6SklO?=
 =?utf-8?B?L0cyUGRQTnJwcW9ybVNlak5SR1R5bXdLQTlZczJhbHRXNEc3dHMvRVhRQXJh?=
 =?utf-8?B?bUF4Q2wveHF2RnhHTlIvbUpsNGdFQzFaeGwrU1J5ak5JYnZaUkRVUkVVQ3pF?=
 =?utf-8?B?cnJaT3FEZFZrZ0hVQmExVTNIcjQ4NHVvb1czNzA5RFpIZGZXblV6cWE4eXdO?=
 =?utf-8?B?d2RPVS9nclU4clltSkY2UkNlQmRkVE9QZG1pL3pwYTcvWDF1M1dHL2RHN3o0?=
 =?utf-8?B?aktCU1AxUmJJQ3FmN3dxeHQyU2toTUFqWFV4WUZDRTFxaW9oVTJVSlh2elM4?=
 =?utf-8?B?dVVuRmNhNFhEKzd3bGRBUVlnS2pCRkZwanlHbkFuWnU1K0kzTmE0aDNkYWVa?=
 =?utf-8?B?clVJUGw2UWRJeUxzQTRyQXU5ZW9tTEE3UjlneXlVbUNBRUk5UXNvMHpTMGk3?=
 =?utf-8?B?QlpTVDVNMjRxRDhaaEl2MlpFRHhHRTdGZHhPTDZkSUJYT3BVQT09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c5596911-77f2-4b38-7a3e-08db6c3149c8
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6290.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 17:11:55.3056
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Gj9mcTf6NPSqpZMqeKxL6cCIUn09T9r35ECsX7cBTf4KvPkBpfzNRPJn3u+ko66qrZqVTUOctRyOKHEBsAocYpeyZMZhQyA0gbTHQpvFo0bSJ3X+qybRRYeJYBo8Pevm
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7615
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_19,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 phishscore=0 spamscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306130152
X-Proofpoint-GUID: 6X2eStgjJ-82HJCOY_ImgpvA4a9ijoEx
X-Proofpoint-ORIG-GUID: 6X2eStgjJ-82HJCOY_ImgpvA4a9ijoEx
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Maxime,

On 05/05/23 4:56 pm, Maxime Ripard wrote:
> The Spreadtrum composite clocks implements a mux with a set_parent
> hook, but doesn't provide a determine_rate implementation.
> 
> This is a bit odd, since set_parent() is there to, as its name implies,
> change the parent of a clock. However, the most likely candidate to
> trigger that parent change is a call to clk_set_rate(), with
> determine_rate() figuring out which parent is the best suited for a
> given rate.
> 
> The other trigger would be a call to clk_set_parent(), but it's far less
> used, and it doesn't look like there's any obvious user for that clock.
> 
> So, the set_parent hook is effectively unused, possibly because of an
> oversight. However, it could also be an explicit decision by the
> original author to avoid any reparenting but through an explicit call to
> clk_set_parent().
> 
> The driver does implement round_rate() though, which means that we can
> change the rate of the clock, but we will never get to change the
> parent.
> 
> However, It's hard to tell whether it's been done on purpose or not.
> 
> Since we'll start mandating a determine_rate() implementation, let's
> convert the round_rate() implementation to a determine_rate(), which
> will also make the current behavior explicit. And if it was an
> oversight, the clock behaviour can be adjusted later on.
> 
> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
> Cc: Chunyan Zhang <zhang.lyra@gmail.com>
> Cc: Orson Zhai <orsonzhai@gmail.com>
> Acked-by: Chunyan Zhang <zhang.lyra@gmail.com>
> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
> ---
>   drivers/clk/sprd/composite.c | 16 +++++++++++-----
>   1 file changed, 11 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/clk/sprd/composite.c b/drivers/clk/sprd/composite.c
> index ebb644820b1e..d3a852720c07 100644
> --- a/drivers/clk/sprd/composite.c
> +++ b/drivers/clk/sprd/composite.c
> @@ -9,13 +9,19 @@
>   
>   #include "composite.h"
>   
> -static long sprd_comp_round_rate(struct clk_hw *hw, unsigned long rate,
> -				unsigned long *parent_rate)
> +static int sprd_comp_determine_rate(struct clk_hw *hw,
> +				    struct clk_rate_request *req)
>   {
>   	struct sprd_comp *cc = hw_to_sprd_comp(hw);
> +	unsigned long rate;
>   
> -	return sprd_div_helper_round_rate(&cc->common, &cc->div,
> -					 rate, parent_rate);
> +	rate = sprd_div_helper_round_rate(&cc->common, &cc->div,
> +					  req->rate, &req->best_parent_rate);
> +	if (rate < 0)
> +		return rate;

As rate is unsigned long, it can never be less than zero, so the above 
if condition is never true. Smatch detected this.

Also if we just change the type of rate from unsigned long to long, will 
the return type of the function "sprd_comp_determine_rate" being int is 
correct?

Thanks,
Harshit

> +
> +	req->rate = rate;
> +	return 0;
>   }
>   
>   static unsigned long sprd_comp_recalc_rate(struct clk_hw *hw,
> @@ -53,7 +59,7 @@ const struct clk_ops sprd_comp_ops = {
>   	.get_parent	= sprd_comp_get_parent,
>   	.set_parent	= sprd_comp_set_parent,
>   
> -	.round_rate	= sprd_comp_round_rate,
> +	.determine_rate	= sprd_comp_determine_rate,
>   	.recalc_rate	= sprd_comp_recalc_rate,
>   	.set_rate	= sprd_comp_set_rate,
>   };
> 
