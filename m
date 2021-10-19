Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B335C433FE
	for <linux-clk@archiver.kernel.org>; Tue, 19 Oct 2021 18:15:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 22FFA61057
	for <linux-clk@archiver.kernel.org>; Tue, 19 Oct 2021 18:15:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234832AbhJSSR0 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 19 Oct 2021 14:17:26 -0400
Received: from mail-bn7nam10on2054.outbound.protection.outlook.com ([40.107.92.54]:10735
        "EHLO NAM10-BN7-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S232130AbhJSSRZ (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Tue, 19 Oct 2021 14:17:25 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cjfM9Z1sJX3mqWYMNVkz2bAEx6LNb17W7qT3//HaPtVPQnLKXMrPFWpalBHCQlWOYB+L/NPqCHva/F/MhXUHVy8WPhZCUCG9hpYhhKIB+FmSeFvlrs880UtUGEK6HJav/Ylz+FRtV/cRVzvsvsYzKYwwxnKenDQAlURsdNH8RA+M0JbnpaPjH+eVZcY9B0tCOzeZwBDrECq6zacuj3XDAo9T/wjSRek/UjgQOt9rLrKCydZc3V4Kda6IWTRa3eUv+uzIl7mjo6XWHDTMeVwCncekeMK0pQGhI1UEUnE37T+d+aD1H5orv3rbKrXVVxRi0Z8ovHhh1l2FLzSw6aTt1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kD2rCu7tfOwshldFhq7OApROrYeG0wGyWJwFHX0wvrg=;
 b=Oi+37YQSFQbA9X/b/c67Q64HghtAh3zWeYYUWq0Gv25w7tXkor0vZkXirLrrH1OdCi4H/wSZaxuG/h60qrl+7wlsEozSMixVahik8fvoNuWKSWUmJ4Z9AIEU4VZCJcVu8+9Qb3gCK32mSAHRFw+QoOJZgGeAm7ZY99YjLL6eC8jhLTjZ6uu0O/6Xn7pMD7kQbxiis82Pg2iQLZvSjg+QOg+TMKWgrjmAvHC4X8tB1JfQuyZj72/lckk9nbrVHwOH7RyjR+q7hAlpUH+EvjR9+QSJssf/tT21if/OvfTQDv2VWdOnbmtFxUah+jlQ1qnkRFfC7hfbWxqvgjpXo8F1nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kD2rCu7tfOwshldFhq7OApROrYeG0wGyWJwFHX0wvrg=;
 b=n3udFsd2Wt7HtmWPVV3a/Dq8T3T3cKiAjOB6rpF4HF1Cukjk0pkYrrGZfaIfJgJ6Fa/A+F20WLIjR//L3xOmOJOYcnuk0PUDUZWvUExvasXFMv6hUaVesaauW/GWPWSyvfG/WDSd1Q9Kx1LO63bD2f44sVfUX3RXSkwyuzNCvKo=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3627.namprd12.prod.outlook.com (2603:10b6:5:3e::18) by
 DM6PR12MB3819.namprd12.prod.outlook.com (2603:10b6:5:1c6::20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.4608.16; Tue, 19 Oct 2021 18:15:10 +0000
Received: from DM6PR12MB3627.namprd12.prod.outlook.com
 ([fe80::549b:1773:f036:9ee2]) by DM6PR12MB3627.namprd12.prod.outlook.com
 ([fe80::549b:1773:f036:9ee2%4]) with mapi id 15.20.4608.018; Tue, 19 Oct 2021
 18:15:10 +0000
Message-ID: <6e90866d-d471-8b83-20f4-3c3b9f9aac0b@amd.com>
Date:   Tue, 19 Oct 2021 23:44:56 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.2.0
Subject: Re: [PATCH v2 1/5] x86: clk: Add config option to enable 48MHz fixed
 fch clk
Content-Language: en-US
From:   Ajit Kumar Pandey <AjitKumar.Pandey@amd.com>
To:     Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
References: <20211012103612.101859-1-AjitKumar.Pandey@amd.com>
 <20211012103612.101859-2-AjitKumar.Pandey@amd.com>
 <163417468443.936110.1163914591071839489@swboyd.mtv.corp.google.com>
 <ba07cb00-0cdd-89b9-9d6d-932f366c4023@amd.com>
In-Reply-To: <ba07cb00-0cdd-89b9-9d6d-932f366c4023@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PN2PR01CA0171.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:26::26) To DM6PR12MB3627.namprd12.prod.outlook.com
 (2603:10b6:5:3e::18)
MIME-Version: 1.0
Received: from [10.252.92.171] (165.204.159.242) by PN2PR01CA0171.INDPRD01.PROD.OUTLOOK.COM (2603:1096:c01:26::26) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4608.16 via Frontend Transport; Tue, 19 Oct 2021 18:15:07 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4b915aca-a8c8-4202-56da-08d9932c62de
X-MS-TrafficTypeDiagnostic: DM6PR12MB3819:
X-Microsoft-Antispam-PRVS: <DM6PR12MB38192F5040051DB36B004B5882BD9@DM6PR12MB3819.namprd12.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8273;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: nmtop0r12RWSzEbTANjqhQSyQYpqaTNQiS2MtNxEQ1aUsHBrb4RWWtfKBtAKlT4hSZSCGt3NWmmUpF198IRqChsfp8+PA6qsocTE8R175bFhxK/0l2NVoT3mGNcCq0QRVbpWgXdlsjDojgguis3Mkvo1b9wL6ORT4t5lifJY0F1Vu6IzyMcnQmndjAtoWW2Rvf2CMcGGFT6qMP8/U6jWETo96d7VrlHrkY6irSDzdbM4+ZrUDnktvImRpOIeyWTmQzwkfWDtaTdgPe6Vw0/x31bDOO7Vy/ApWHbLS+f8FFh4em36/uOdgXxmsor8IdX9lteLGGZ0tQj8i3zjz3AFoAB+3Cgz1srovq4KSOx73MoTaoeJ1vYq9xP4fuHuk1DIULHJ239XgaH4ByVH1YRg7G9lIIKfSNdKdhfdyWz0V8/iautCUko1r+6scLSeKNB+WjPc4HSZTU+1OkVyCZxccRoVgncH8tJuIWTl3DHwWa0ffHHb/XPl12EohViu3fc4cJBaESDcRWlIZWQGQmSOdv9HCnzANuHvRhmEdRJnApvOXfHaxCP5BzQmMVNquHo9qwyOSFm279M3fu3KEnXkPgM37ApVRNbWe3Te91VHfuqmM+CIceZ4+JOqP9BpEJPtcrWyQJafm/E8ufJkyiwhz6NJZpjZnJOMU7ecK4OcAyMEzHY/RIVKakdlcJuPQbNM/DzHW5hhahAZ3+6cVe+QtSjEAswH1RH2jYUyqTnyxoM=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR12MB3627.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(4636009)(366004)(5660300002)(8676002)(8936002)(316002)(6486002)(26005)(53546011)(4001150100001)(31696002)(31686004)(66556008)(66476007)(38100700002)(16576012)(36756003)(508600001)(2616005)(6666004)(186003)(2906002)(86362001)(956004)(66946007)(83380400001)(45980500001)(43740500002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZGpOZ2pnbFU3Z0xhTitHTmdFQVh6RG1IdlFRTm9ZVExNdlNxaEtoVnBkV1hh?=
 =?utf-8?B?ZkVlQTBwSUpCdjlIdzZZOWxKWDRxMHRzay9yZmdFaWsyVXM4TE1rbjM3VWZm?=
 =?utf-8?B?ZHdwcnJBVU9NcTZKZzg5ZWdPL2lhbWUyV1VwU1dleVR3TVg1OEkwUzRYalpY?=
 =?utf-8?B?eDUvcklhaWFVY0pCdEg0TCsrY1pxWFl2K3ExOXlhYjljczZrWjVHQlhNVDdw?=
 =?utf-8?B?SmNoSG5sT2ZpTEMvcXFScnZ4U29hcmFRaXlTcHRqejNqMEdFMUdqVVN2bFd5?=
 =?utf-8?B?QnhQMGNaS3BOaUdjQUM1VW1XZk5MTzYrTTd2Qzk0VmRiVFBHSy96bW9tNERI?=
 =?utf-8?B?Y3BZb2FJYjVhRjkvZ0d3UDB6dmRneURWVGoxRko4d2VBRTBmbE5IU1Q3L1ZI?=
 =?utf-8?B?SGh3Qm85N1RXQlVpblhyR2FtNVpCc0ZlUFl0RWoxZURyZjllUS96RG9aMGY3?=
 =?utf-8?B?d0o3cUREQTJCWVB1N0pmb2Y2dmNvckJOaVBQYzNsaFAwUVg5MlM0aHNkTzBu?=
 =?utf-8?B?Zm1ZUkNGWEk0a2N4ZlRvbFBHVkJMeDZwTzNNYm1reTdvakttTzE3V0FmWGRt?=
 =?utf-8?B?WW4zMU5oc09Kc3lvMnhGRjljQ0YzNUNZL25uZkRySEpSSWhmd081MDhHV0Nx?=
 =?utf-8?B?ZDNOQXE1UFFiOFpMU2lZSE1XQ0R1V1A4TEV6cy9QVnhUSEZzdUdEREE4QTFN?=
 =?utf-8?B?NmxEU2VGNjZ3ZUtXWDV0b2pvSk5nSkJHNWRrQVFtSWd2aEhQTVpqMHJLWTRY?=
 =?utf-8?B?TFJQR3lBU1VUeENQV29OOEtsU1JqcGlxcms0RDBZUFF6ZlhyWDBPbE12b0RM?=
 =?utf-8?B?STJXaEo3aXRqU0xMZmtwTzBmeW5GS2J0UDNmYXVYMzdNdVdCVzVjb25CNGJM?=
 =?utf-8?B?ZzhycUlQaUJjbGFxYWNJVTh3M2FvSWZ4ZHRuZGpCOVNGMnlRN0dvSUkzdmZI?=
 =?utf-8?B?SEJkWi9DVjA3SU9iSUFPbEYwZVR0U1ZOczI1UC9wNDduR1YramU4ZGZvUGRo?=
 =?utf-8?B?ZUFVQ1hEQ1BYa0JzNFlVaUl1elhxMVNqQnlDVkVJR1FLQk94eEQ3TlA4ZVMy?=
 =?utf-8?B?LzNTcHZ1bFRpWGRoZ095Q0NGeDQyQXNYUkVlTHpjcUNVOEZkTmJuS2Z3UHJU?=
 =?utf-8?B?SjdPaUxzT2ZEdnRIbTl5SzgyWFZ3SUl5S1doNXlpSFhlcnF0WCtwTDVwYlNk?=
 =?utf-8?B?QkJtVytVd2QrNlhqalNzV2VzZFJWVUpsWHZsZFZ4bzRvWWRLc1o0RUdGcVBZ?=
 =?utf-8?B?b0pvVUhidFlvUVFvakZxcXBSbjltK2ZjVVA4UW41NDlMM2VNVmZ4ZWFxMWNJ?=
 =?utf-8?B?Q3A3dWpnVlZLYzhLYVhZWjVzOWxPM0tTTVpkWC9VK3c3ZFU3a1MrMGw0MDk0?=
 =?utf-8?B?b2VZVjRiVDQrSGg2R3VuZWJlcjdVYTVCTVI4empCbmxDNk5UNU1uazZab2tT?=
 =?utf-8?B?MS92MVNHV21RT3ZQZFRsTGZ4SVp4aDJFYjU5L1N0ZzF4OEJXNHVUdFNBcXJ0?=
 =?utf-8?B?WWMrcWUrSjR0NkFjZXZVTVZhT1U1dEo4SERoTjhTNEFhTDZXM2s2c0NYZmJj?=
 =?utf-8?B?bit3YnhiRldyQ210cXRxZGdxVkt2SWQ4VmhRUVpXMWxEVS85QVArMDZ5YXhy?=
 =?utf-8?B?bWxrMmYwdHAyNC9ndXdRNFp6MVRkTHRZWTJsU25YN2hvcVVOL2tKSW1yQXlq?=
 =?utf-8?B?c2RxYU50WUYrcXZDRkdRakw2QmpIYmw3WTNnSnlXRGloemRtSjM1UWVXR1k3?=
 =?utf-8?Q?PbsHwMxuCUAttxo4OzKFIeNpXCbx+ZYEymzAdZf?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b915aca-a8c8-4202-56da-08d9932c62de
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3627.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Oct 2021 18:15:09.9666
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FURHbGnr+uD77yXke0FUqRlKtZqtFUHpHg6wQd/8NJ1oDDlzNJ5tqKKexY8kPbAS+DSd0z5N84RzjSyTtzZGDw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB3819
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 10/14/2021 2:43 PM, Ajit Kumar Pandey wrote:
> 
> 
> On 10/14/2021 6:54 AM, Stephen Boyd wrote:
>> [CAUTION: External Email]
>>
>> Quoting Ajit Kumar Pandey (2021-10-12 03:36:08)
>>> At present 48MHz clk support is only enabled for RV architecture
>>> using "is-rv" device property initialized from boot loader. This
>>> limit 48MHz fixed clock gate support to RV platform unless we add
>>> similar device property in boot loader for other architecture.
>>>
>>> Add Kernel config option to enable 48MHz fixed clk gate registration
>>> with clock framework. This enahanced flexibility to enable 48MHz fch
>>> clock support on any platforms by simply enabling kernel config. Also
>>> replace RV with FIXED as generic naming convention across platforms.
>>
>> What do we do if I enable CLK_FIXED_FCH in Kconfig but don't populate
>> the 48MHz clk? It's always present so this isn't actually a problem?
>> Why does the bootloader set an 'is-rv' property at all?
>>
> 
> Yeah 48MHz clock is always present and we will select or enable CLK_FIXED_CH config from
ALSA machine driver which enable/disable this 48MHz clock.
"is-rv" property is set in bootloader of RV or Raven SOC architecture 
resembling "is-raven". Actually we want to use existing clk-fch driver 
for 48MHz clock support on raven hence used an acpi property to 
distinguish raven platform and used check with "is-rv" flags to register 
48Mhz clock with CCF. Now since we need this support on older and more 
platforms we moved to config selection approach for registering 48Mhz 
clk as changing or adding BIOS property isn't feasible on all platforms.
