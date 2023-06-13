Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C8FA9EB64D7
	for <linux-clk@archiver.kernel.org>; Tue, 13 Jun 2023 19:45:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231398AbjFMTpz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 13 Jun 2023 15:45:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231285AbjFMTpv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 13 Jun 2023 15:45:51 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28D631BEA;
        Tue, 13 Jun 2023 12:45:47 -0700 (PDT)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35DGhqGY009568;
        Tue, 13 Jun 2023 19:45:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=message-id : date :
 subject : to : cc : references : from : in-reply-to : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-03-30;
 bh=JDM7jSSZQzJYyFwFrAR9c5hTeR8LNs4pxQmiX07M+xk=;
 b=cKrJCRtjUPj7gtY/t5H5iwRj3QUVOr9A6/QlprgCjtkwnnEZ8ynrSBrLsJ+8Y8nwe92D
 u3ys1oTfLwOVOqcxVEtRXgk8pu9OO8E4AOsXXvs2wX4m58z8VejIJEl31cjPuccDdAff
 PD0RIAVtkIOZfvBv07eAR85L/vnzs70JMq6++Fc8qlPkcyiFxlHh3FF+k+RsuYNPTsCe
 rMoOjmMlWda1zaZA6eZ2nDdNj6UKT881F7X5E+kfE8jW3q8U4XpVW7ApWbgjhoFEt0L/
 +qRm+Rpjse74JHbMMx+Z//hUXitT7XoZgyUoGbcPCCCqNBFmE0C3/uIyPfnCE2MPiDsZ dA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r4h7d632g-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 13 Jun 2023 19:45:36 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35DIJdxw021667;
        Tue, 13 Jun 2023 19:45:35 GMT
Received: from nam11-co1-obe.outbound.protection.outlook.com (mail-co1nam11lp2175.outbound.protection.outlook.com [104.47.56.175])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3r4fm4mh0t-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 13 Jun 2023 19:45:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nZP6yN7w6BLXPbMEI8RatkBP1H9Siz5kzl2V2cCxTJoGvPr1yZRKz9HH/Z99jWSuZmx7S3XUskTWVUHWupNC1GWVLTFuWRzLT6t1WYYHzRSmLoW97ESOWYVS4vo8fkiZonxMBcCV4C8f0RqCe43GeIkLbOZ3ZT2x3ZFr69gXi9RJ+7AghG0/53YpAZ8heiVOU432EgF3f7BriBUnxBtL81vMbNFjaCSjE0Tba26SsUZfStPxvnr9z232ySHyZLxB7aFk7b0bqtgvSl1eFSfqd+MKmSPWwzpBOEU0kia2eonr0WAGDFdrXs1RafX1CEpknjg4Zefacy3HHQw3YDEMYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JDM7jSSZQzJYyFwFrAR9c5hTeR8LNs4pxQmiX07M+xk=;
 b=CWv7wetH7vSGYpknHkgK9Q4KhQXKvPmqroNEbMinZH+FgG2UaoahuJcUvgDyhPf3aRcgJ+n6e/HOS2XhD9ekJW3MgTdjyxNN/p/1ms7+s9a8cpIxElo6A73S9aBBJgO+4cENqAkKPt4tMM3Zrucg1BvuiRtUmg+81X9ZS422ZHrnWuOoczLi10aGC9XDNybZz7JRAdqgLT8Z4hv6otj7KagJ2cEl9lO0qY9tnta9gmr/thFMxD2yKaFqi5kvX3DHhtlPmuwOb8MSCnLg4Jo2vX08q6AZ+aq97INq6hyXLHBaf4WaiUvj1YgdxDwbLTKPTUYzEaFmE2qkAe8GAqsy4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JDM7jSSZQzJYyFwFrAR9c5hTeR8LNs4pxQmiX07M+xk=;
 b=o/5ImVzmyvl8knrMoeADIW1XS6UmkHZS00fA8e7WjJOwrFaI/cYljEt9S5vucdo5XfVnjrYiHXYuTbGVgoLDca4L75YM6oJM9sd2DXW3Hrb8GknVEK34Ns3vX/xsothR3TJ9USyyXvQQqmE+R4/TgglBLpvaluNXnrBtUW3UyFM=
Received: from PH8PR10MB6290.namprd10.prod.outlook.com (2603:10b6:510:1c1::7)
 by DM4PR10MB7527.namprd10.prod.outlook.com (2603:10b6:8:182::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6455.33; Tue, 13 Jun
 2023 19:45:32 +0000
Received: from PH8PR10MB6290.namprd10.prod.outlook.com
 ([fe80::68c5:330c:d234:3834]) by PH8PR10MB6290.namprd10.prod.outlook.com
 ([fe80::68c5:330c:d234:3834%7]) with mapi id 15.20.6455.030; Tue, 13 Jun 2023
 19:45:32 +0000
Message-ID: <e691a9d8-b220-7bf8-6dca-3728dcc15d28@oracle.com>
Date:   Wed, 14 Jun 2023 01:15:23 +0530
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH v4 61/68] clk: sprd: composite: Switch to determine_rate
Content-Language: en-US
To:     Stephen Boyd <sboyd@kernel.org>, Maxime Ripard <maxime@cerno.tech>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-clk@vger.kernel.org,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Chunyan Zhang <zhang.lyra@gmail.com>,
        Orson Zhai <orsonzhai@gmail.com>,
        Dan Carpenter <error27@gmail.com>,
        Dan Carpenter <dan.carpenter@linaro.org>,
        kernel-janitors@vger.kernel.org
References: <20221018-clk-range-checks-fixes-v4-0-971d5077e7d2@cerno.tech>
 <20221018-clk-range-checks-fixes-v4-61-971d5077e7d2@cerno.tech>
 <45fdc54e-7ab6-edd6-d55a-473485608473@oracle.com>
 <9f2bdc8f0750177b42f5a3b2b9aaec14.sboyd@kernel.org>
From:   Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
In-Reply-To: <9f2bdc8f0750177b42f5a3b2b9aaec14.sboyd@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: TY2PR0101CA0024.apcprd01.prod.exchangelabs.com
 (2603:1096:404:92::36) To PH8PR10MB6290.namprd10.prod.outlook.com
 (2603:10b6:510:1c1::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6290:EE_|DM4PR10MB7527:EE_
X-MS-Office365-Filtering-Correlation-Id: 24d933dd-a5ef-4b65-c4c9-08db6c46bfc4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bZIevXBbDtIvbZCmBbTsgFUeIp8VZJz0Q9e7s2M2zc99zX6N4C2Eb61OlNH8z7UrThQsStwJZhDjSFvjeSwxOFZqR4KnMkxhBG7HdLsIVVvLieHLtr9Hw9zVb1ILpq31rWsETo4aR8HvZjzVS8ZdI8MtLcTt/Gx6soUJlJOPBMMttJ8KrXpBSQzDm8gRcrKYbSHLd4S01DVTYA5p83w6X8+Aaa66NZJust16znjBDNEQdxnvPbIznW3jGWpoMe6SJ2HjRBrN5Y5UqErvkxHs+039S13bh6R8Y9krjsmPwllDof3nt5norgNSFqqeo+dZtYQHCc1bI2rLZgI2pK7gPj+gQ4xQ0hpltd0PDTSYkMvKgF/0nuosmwqD/a3oII+5Z3Il95pk7y59ECQk7uxCfAwT2ea19WbKKO2gHEUNyVxzonFtbMKYdnuWH6swauAzfzX0P52KzWP8EJEvKq8NMPRjypLE/8u0ErnGdy+0g6TWNw9GK/rIOYp+M6YlBZ31ysdg9qT9z+2MKD/ZvoGT2y7PJnYvlxd9DsavPmgJiKYX2uRB/B1eZBfJRquRcLIVlpVE47WxTDmISFYCE/p62qFCG/i5wGlRUtEND5NcodiwtZRth7p/RFGx7bXDd4cBwyXYODCO6ouFBdfkCUnHVQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6290.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(396003)(136003)(376002)(346002)(366004)(451199021)(4326008)(66946007)(31686004)(8936002)(66476007)(66556008)(8676002)(36756003)(31696002)(478600001)(6486002)(86362001)(41300700001)(316002)(7416002)(83380400001)(6666004)(5660300002)(54906003)(110136005)(2906002)(186003)(53546011)(38100700002)(6512007)(26005)(6506007)(2616005)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S09ObzFzL2dpK3Rma2llVGJpTk5zeDRRa21ySFhEYWI3WUFnbG1JcVIvMC9Z?=
 =?utf-8?B?NGpKWnNWN2tvUlg5R2tpS0pWQmIzZVN4dnB2NWZ0c201VEEzR2NkZ1hMODJB?=
 =?utf-8?B?TW1ieGd3Ry9FcFBjalFVc1ljaVRrRFlpWlIzb3FrM0RyWHdkQ0d4c3YrV3cy?=
 =?utf-8?B?cFRBSUVwRXRHc3gwejJBMWt5R0ZieXZvcFh6aFpxa0RmRGI3QURRUHlOWDZy?=
 =?utf-8?B?bW5TemZ2MHNFbjZ2UGw5TkNvQitiQXhvS3ZjNFBLUWRPaG51N0crWE1jZ3RK?=
 =?utf-8?B?TWpxcXFMc0VVTmtrN0dpNlRHbVppMThCQU5odEM1QjRQUEdxNW5wa2cyZUhJ?=
 =?utf-8?B?K0RUNVd1ei9qZjQ2MVJjZ3BORWZyZldVSVhuRUpGeUNPem1NU0c4QzdEb0Z4?=
 =?utf-8?B?M2djRk5jTSsvSThFSndCMzRQQVFVNk9mazRtZ0hObFRud3JyM2dIazB6WW9y?=
 =?utf-8?B?eVBOTVFBL2FwQ0tPNlBOTzg1MzV5bFluNTBNbjJBLy9ycFdFZFRpNVdPRnov?=
 =?utf-8?B?Q1gvN0kwclc5ZVpXdnp0bGF0TDZoVW01bHI5R1ArVFR5bml0Q0hTODRaSDlo?=
 =?utf-8?B?ZE9hZkhvR25aSmpZY1N2WUZ6bWZxVlZMMUd2bW9EalF6K0hWZi84K05RY2dv?=
 =?utf-8?B?Z3ZsVFBoQ0xuQ1JYa29OaTFFODNGRmk0NnhUcFJNZlZrYTFqNEYxVEZiK2Vt?=
 =?utf-8?B?cnArNEZRVG04STZ3NDBYTVdCWTYyeWc2eVlIb1JMVWRNOHZlUWVQZVVEVmo1?=
 =?utf-8?B?azhiZnMzM3oxMHEyOVRFQ1FtN3VYeEJKeDZsVWNJOFcwRWlJZW1qTTFtdXFt?=
 =?utf-8?B?Y2x3K2dlOTlER1o5eHU5bTAwSWRsRFhTb2I2dDR1OTEybUxlamhrSXcwUzJz?=
 =?utf-8?B?RUx1b0xtaUIweHYvd3JoRHdwT2kxaGl1N0RVN0l1Tm8yVDEzem13Smhib0Zk?=
 =?utf-8?B?NVdhcGJJRng2WkdLWEJNTUxnY3hWTzhXSzZ0R1FJbkdXVzB1VkxZOUQwTFFH?=
 =?utf-8?B?bkQzSHBFc3N2dUpUTmVGUXZuQXlhKysyWk11aktRMzlmdkNhUFBTaXFjQVkw?=
 =?utf-8?B?ZzBpTGxFanVlYW83UnowdlkxT29OQjRxSGxGVVNmNXNwTTc1aWgyb3N0dHdQ?=
 =?utf-8?B?RG00aEFWWklBYlFxa1B3WnV4ZDdvalpSVFBtZFNseS92THJiYnJLa1pVZ2k3?=
 =?utf-8?B?QzBjemc3SEtRaW9MSUNJbWNSL2RUdnIvaFp5cjltVWZNRWhZSlpCdzZYWGtP?=
 =?utf-8?B?QXNxVGhrbzBkdWpDekpBRVQ2NHZ6RllBcm0xRGVPTzVVVlNVaXZJQVhkQ3k3?=
 =?utf-8?B?K3RIbTZzekJaS005MVNNV3VVSVkxQXFVYXZuZ2VkdnRtdmVGUHNDaSt1aGhW?=
 =?utf-8?B?MVltR0pHbVVCTnNRWWo0bm0zOURsdUROcDFURndhM01HWjBHQlRNOWJSNWdl?=
 =?utf-8?B?QThQVC9wNkdjTlVBVVA1N2RJbEVMM2F5Y09KZmpYM3NEM01PNlpzaERWeEU0?=
 =?utf-8?B?TUVtMnI4RlRYMEFlRnZtY25QNTBjRm0wcjlSTkY1cjZ2YkQvUVRQQW5FcHBE?=
 =?utf-8?B?dTV1Wi9JbG1WSHdacUl3ZWU3UTRqMFIrUTV3VHQ3cGFxb0Q2b1NaRGpXb1gr?=
 =?utf-8?B?M1gyampNNHUyN1hxc2U0UFc5VUJPRnJVV2d1cklkN0lnMmF4aHF6dlhtRUVj?=
 =?utf-8?B?Uko5WDRiYzVZWUcycjFSTmR1L004aW8rcjE0S1kvTURZWE5ER2oxaGpyKzMv?=
 =?utf-8?B?dWV5c2V6K0k4YzFTWkNlaHM1QmgzRi9IZTQrZjVoaUFIZEZhZU9MS0tIRE5a?=
 =?utf-8?B?UXFDbGc1SEdselUvWHdKK2x1YjV0RHJ0QmJIY0NjS0d3cFFLbVRLSVNxejN4?=
 =?utf-8?B?YzdNNk0ydEU1dXRLWXozNU5QZnIwMzFVN0ZBRGFVUVE5aUs2dWZqVW1QaHFN?=
 =?utf-8?B?eTNaYlJFQ3NFTG9jWlRhcXFUSDBCckRXeUFxUUVBUjZNNUdiODg1bFB0QmhT?=
 =?utf-8?B?T2hUUmNiY1o3YnpoWUJmdTVrQ0NwNmFiNU1CRTYvUXpBekJWN2ZWQ1htdDll?=
 =?utf-8?B?TmdLdkxTQ0dFU0puVEpid3IvL01wbnpneXB1bTJKL2pwY2EralYxdXdSdzlX?=
 =?utf-8?B?bmlvN3k3OTVITjIxVG9yRlB4aFREZ1h3YTVOK2RNb0NHUngwVkJQSVM2azFV?=
 =?utf-8?Q?tzvprKfJ3TAIPcZvYhTgGUg=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: =?utf-8?B?dGpIbEQ1NHhCdmZjM2FZOVZNbU9OdW5SZ2JwYVZIZnZEK2FmWEZjOFdBc1Uz?=
 =?utf-8?B?RVhzUktBOGIweFBndzZLMzdXQlNTRnpSQnQyQm5XOHZ0TlFLenFWSmRQamdx?=
 =?utf-8?B?VlI0bVJZM3lZSzk0VlFKUzhyZmcrY3JzQ0ZMWExUMVFQNHE3NTIzSkpCRU9o?=
 =?utf-8?B?eGtlYlBFOEV4TFNPSFR4YW9TSHdoeWlvNHNzUGIwd0ZFWE5mSC85cyt1REhs?=
 =?utf-8?B?Q1B2RXZCazF3ZGpDSTY3NENjeVJzL0xlZmZ4ZVhCcDUzUi9lWmpOR3VXdnky?=
 =?utf-8?B?Zm5uM3cwSldnN0ZoazM3Y1huRHFqRDlTbEdFMlNmWWFpTDBsOXN6dytsZHlH?=
 =?utf-8?B?RGVmdStjUkw5ZXhvT3cvcFphWnlhall0NmQ0bFE1YnltS2cxZE9IdU9zajB5?=
 =?utf-8?B?TFBuNDNOOFFscDgrb2FENWxnNjNmeVkyYjFLU1lJSE5CVjVjSVJjS29palJ2?=
 =?utf-8?B?MHB0c0dIbVlaNUxhdVowWUVqcVg2OWxZMWxnOWQzdytMWVNJcHI4aHQ0UmdH?=
 =?utf-8?B?LzN2eTI5bHNtek9LdnJONXNFWlhYamE0aTBVZXJ2Z2w4Y21OZUhSa2o1Qzg1?=
 =?utf-8?B?WmpNakZnTVdaSkt6ZTJreTZ5NXJINjVZMGxFdmFuUTkza1NRS2hzcnkzeDhu?=
 =?utf-8?B?TTNTTUtCanhVdmc1a1J0YXNOLzJmbmhCSEdLRXF1SjZkRUJtRXZrRjBNMDg1?=
 =?utf-8?B?RmpBWkp2VWNlNUtIQWtvY09rTlF6c2FsWCsxYUZoVFpYNzZPdlJHN2l3S0FP?=
 =?utf-8?B?dEFmQ21BZ3JoOEJ5R2ZDUWdxcFZsNis2M0dKbFJ1VGNPSWM2cWcwcXpEcXh3?=
 =?utf-8?B?QkR2OTV2V3ZxbVVHTldFUWRYWkE1NEVQMGJ3UGFZTXpSTEVhZFdKb1NRZFJp?=
 =?utf-8?B?cDQvYm5TVmRQNFVDOEsyNndCTTdQVHVSdm1LMk9KZjJBVWlQTThyM1NOVW1T?=
 =?utf-8?B?czFkWDBYZU1naGRDUzBOdVUwU3RSMW5hdmJuc0xXTG5OYXVIUHJ3NzJ6Ty9k?=
 =?utf-8?B?Y0FuWTZySlFxVmdrcXc4TDNJU3Z3VGtTYW1wOEJ4YURPS2ZHY0h5SlFTQVVV?=
 =?utf-8?B?UGdpdU9JTEdXVG5nMUQvV0RxRGkwR01RdVBJdzNnV1ZTUVJuT1ZhbTUvVzkv?=
 =?utf-8?B?VjZWcHpWNlNSclk0Y1JDQnpaRGFhdk9vTzcrWkJnVWpaZ29RSklYRDYycEJE?=
 =?utf-8?B?NWpSYlhCYXZoUXZGRzRBNWpGaStlK09ISXRQMjk3YUlMckU5c2tYdG5mMGF5?=
 =?utf-8?B?eXc1eXFQL0w2YWViZlRPMi9YaXROUTFLWUJvaUNRTzJRL3pqdz09?=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 24d933dd-a5ef-4b65-c4c9-08db6c46bfc4
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6290.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 19:45:32.6837
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pIWGrBIFG0xxLOIJfTCbrz86JM8Ske1ddqUNIEtqwB0Jy/MhP73WOMO05PpftaiFrmh0vooZAxEYWFh/5otikSqFbUC9y9/HOTu7v9SntA7pW+6r1N9CvHtQqeTSRnhQ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB7527
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-06-13_22,2023-06-12_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxscore=0 phishscore=0
 suspectscore=0 mlxlogscore=999 bulkscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306130172
X-Proofpoint-ORIG-GUID: kn4fgouzgFBpbvBs9zpf_PlmonlNBHYS
X-Proofpoint-GUID: kn4fgouzgFBpbvBs9zpf_PlmonlNBHYS
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,

On 14/06/23 12:51 am, Stephen Boyd wrote:
> Quoting Harshit Mogalapalli (2023-06-13 10:11:43)
>> Hi Maxime,
>>
>> On 05/05/23 4:56 pm, Maxime Ripard wrote:
>>> The Spreadtrum composite clocks implements a mux with a set_parent
>>> hook, but doesn't provide a determine_rate implementation.
>>>
>>> This is a bit odd, since set_parent() is there to, as its name implies,
>>> change the parent of a clock. However, the most likely candidate to
>>> trigger that parent change is a call to clk_set_rate(), with
>>> determine_rate() figuring out which parent is the best suited for a
>>> given rate.
>>>
>>> The other trigger would be a call to clk_set_parent(), but it's far less
>>> used, and it doesn't look like there's any obvious user for that clock.
>>>
>>> So, the set_parent hook is effectively unused, possibly because of an
>>> oversight. However, it could also be an explicit decision by the
>>> original author to avoid any reparenting but through an explicit call to
>>> clk_set_parent().
>>>
>>> The driver does implement round_rate() though, which means that we can
>>> change the rate of the clock, but we will never get to change the
>>> parent.
>>>
>>> However, It's hard to tell whether it's been done on purpose or not.
>>>
>>> Since we'll start mandating a determine_rate() implementation, let's
>>> convert the round_rate() implementation to a determine_rate(), which
>>> will also make the current behavior explicit. And if it was an
>>> oversight, the clock behaviour can be adjusted later on.
>>>
>>> Cc: Baolin Wang <baolin.wang@linux.alibaba.com>
>>> Cc: Chunyan Zhang <zhang.lyra@gmail.com>
>>> Cc: Orson Zhai <orsonzhai@gmail.com>
>>> Acked-by: Chunyan Zhang <zhang.lyra@gmail.com>
>>> Signed-off-by: Maxime Ripard <maxime@cerno.tech>
>>> ---
>>>    drivers/clk/sprd/composite.c | 16 +++++++++++-----
>>>    1 file changed, 11 insertions(+), 5 deletions(-)
>>>
>>> diff --git a/drivers/clk/sprd/composite.c b/drivers/clk/sprd/composite.c
>>> index ebb644820b1e..d3a852720c07 100644
>>> --- a/drivers/clk/sprd/composite.c
>>> +++ b/drivers/clk/sprd/composite.c
>>> @@ -9,13 +9,19 @@
>>>    
>>>    #include "composite.h"
>>>    
>>> -static long sprd_comp_round_rate(struct clk_hw *hw, unsigned long rate,
>>> -                             unsigned long *parent_rate)
>>> +static int sprd_comp_determine_rate(struct clk_hw *hw,
>>> +                                 struct clk_rate_request *req)
>>>    {
>>>        struct sprd_comp *cc = hw_to_sprd_comp(hw);
>>> +     unsigned long rate;
>>>    
>>> -     return sprd_div_helper_round_rate(&cc->common, &cc->div,
>>> -                                      rate, parent_rate);
>>> +     rate = sprd_div_helper_round_rate(&cc->common, &cc->div,
>>> +                                       req->rate, &req->best_parent_rate);
>>> +     if (rate < 0)
>>> +             return rate;
>>
>> As rate is unsigned long, it can never be less than zero, so the above
>> if condition is never true. Smatch detected this.
>>
>> Also if we just change the type of rate from unsigned long to long, will
>> the return type of the function "sprd_comp_determine_rate" being int is
>> correct?
> 
> The return type of the determine_rate clk_op is int. We can't change
> that. Are you asking if long will be converted properly to an int when
> it is signed?
> 

Yes, thanks for clarifying.

Thanks,
Harshit

> I see that sprd_div_helper_round_rate() calls divider_round_rate() which
> calls divider_round_rate_parent() which calls divider_determine_rate(),
> so we might as well change everything here to call
> divider_determine_rate() directly. That significantly cleans things up.
> 
> ----8<----
> diff --git a/drivers/clk/sprd/composite.c b/drivers/clk/sprd/composite.c
> index d3a852720c07..ad6b6383e21f 100644
> --- a/drivers/clk/sprd/composite.c
> +++ b/drivers/clk/sprd/composite.c
> @@ -13,15 +13,8 @@ static int sprd_comp_determine_rate(struct clk_hw *hw,
>   				    struct clk_rate_request *req)
>   {
>   	struct sprd_comp *cc = hw_to_sprd_comp(hw);
> -	unsigned long rate;
>   
> -	rate = sprd_div_helper_round_rate(&cc->common, &cc->div,
> -					  req->rate, &req->best_parent_rate);
> -	if (rate < 0)
> -		return rate;
> -
> -	req->rate = rate;
> -	return 0;
> +	return divider_determine_rate(hw, req, NULL, cc->div.width, 0);
>   }
>   
>   static unsigned long sprd_comp_recalc_rate(struct clk_hw *hw,
> diff --git a/drivers/clk/sprd/div.c b/drivers/clk/sprd/div.c
> index 7621a1d1ab9c..c7261630cab4 100644
> --- a/drivers/clk/sprd/div.c
> +++ b/drivers/clk/sprd/div.c
> @@ -9,23 +9,13 @@
>   
>   #include "div.h"
>   
> -long sprd_div_helper_round_rate(struct sprd_clk_common *common,
> -				const struct sprd_div_internal *div,
> -				unsigned long rate,
> -				unsigned long *parent_rate)
> -{
> -	return divider_round_rate(&common->hw, rate, parent_rate,
> -				  NULL, div->width, 0);
> -}
> -EXPORT_SYMBOL_GPL(sprd_div_helper_round_rate);
> -
>   static long sprd_div_round_rate(struct clk_hw *hw, unsigned long rate,
>   				unsigned long *parent_rate)
>   {
>   	struct sprd_div *cd = hw_to_sprd_div(hw);
>   
> -	return sprd_div_helper_round_rate(&cd->common, &cd->div,
> -					  rate, parent_rate);
> +	return divider_round_rate(&cd->common.hw, rate, parent_rate, NULL,
> +				  cd->div.width, 0);
>   }
>   
>   unsigned long sprd_div_helper_recalc_rate(struct sprd_clk_common *common,
> diff --git a/drivers/clk/sprd/div.h b/drivers/clk/sprd/div.h
> index 6acfe6b179fc..f5d614b3dcf1 100644
> --- a/drivers/clk/sprd/div.h
> +++ b/drivers/clk/sprd/div.h
> @@ -64,11 +64,6 @@ static inline struct sprd_div *hw_to_sprd_div(const struct clk_hw *hw)
>   	return container_of(common, struct sprd_div, common);
>   }
>   
> -long sprd_div_helper_round_rate(struct sprd_clk_common *common,
> -				const struct sprd_div_internal *div,
> -				unsigned long rate,
> -				unsigned long *parent_rate);
> -
>   unsigned long sprd_div_helper_recalc_rate(struct sprd_clk_common *common,
>   					  const struct sprd_div_internal *div,
>   					  unsigned long parent_rate);
