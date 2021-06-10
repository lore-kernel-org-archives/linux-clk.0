Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85F7DC47094
	for <linux-clk@archiver.kernel.org>; Thu, 10 Jun 2021 15:43:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 70561613C1
	for <linux-clk@archiver.kernel.org>; Thu, 10 Jun 2021 15:43:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231424AbhFJPpK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 10 Jun 2021 11:45:10 -0400
Received: from mail-eopbgr80085.outbound.protection.outlook.com ([40.107.8.85]:21926
        "EHLO EUR04-VI1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230280AbhFJPpG (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Thu, 10 Jun 2021 11:45:06 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Qlvugh2wjWnZhxtXwJDZY5HVL+wUyf7g+2Ej2JNMom0HTJ9ajml+A+CvskrFcOkvhBvJegw71F5Xvf7A1mv5ez2YqJdkHDYA9QPsMwNvQwj3wQKs5gXiYszpehLIgbwvjBIVi2oyELyopzfmfZ1oauw17Wpt68OmuKKhuggDB60ioNmeJCyrAnPyjxVz4uGgppTscFbQ+3kdSlC/b6yhO2cO1iIUXJfviStzseQEQSMZVnikmZ3FsI8Aci3xtUr4F5hBPAkSICXb00lvesNxjkVAt9z/pPUaZiujUaeuJNlQTIX3U3WmHu5SzjSlGAe3pyLItp+YH9lRMl/Vbhd/gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TztxRpnc2QQUNNxB7JQO9scF7gd++vPIzAr88yWRZbc=;
 b=L2jE7F8JsJh6n/Zx0aHdbedtrSNtvrecXnGZotlCCtbHvHHPAt0VgTP+vbngCbyFB7GsHX0EC555BkIsL7G2YRC6iTlDKlD3bPl680tk3Nt076OCEOQZkzE2KFjoMmNnJf60sMX2FpJ7HZBS5hhRj0fYHbgEArwIzgc+vDaCJkbz4WQXTPSI29OGWLEgB6VzUuwkGc4ZInlnOJSHJCvAC7i/iAPY2QVlvuyCADPSeJoi+m/OxQDwXYgWWexGOw25RA1OzP7dXzZvlHYli2rpIrvhayjei6gYNFeMh/Wllb4TIYXhWi1Z3GLbCEezPYJsMfrv6WQJ3Q3j/QyyMuatYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=secospa.onmicrosoft.com; s=selector2-secospa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TztxRpnc2QQUNNxB7JQO9scF7gd++vPIzAr88yWRZbc=;
 b=3EJ5XIvCjvqKmpF76kkeX5R2zAAWoDy3xXn550yWpFCRRTBlnA+gCC6oU1Pkd0KLP+5BA/Ie4FO/1dmQfGZhmYyt3BovPnJI9t99Co3zSw7sahRKjUozkK2Cm8ScIes26H0eDW57xdX1TpQG4AwUOhlFzmdDJdx/mo/cH3Tb5Zo=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com (2603:10a6:10:19::27)
 by DB7PR03MB4985.eurprd03.prod.outlook.com (2603:10a6:10:32::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.21; Thu, 10 Jun
 2021 15:43:08 +0000
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::40d5:3554:c709:6b1b]) by DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::40d5:3554:c709:6b1b%5]) with mapi id 15.20.4219.022; Thu, 10 Jun 2021
 15:43:07 +0000
Subject: Re: [PATCH 1/2] dt-bindings: clk: vc5: Add property for SD polarity
To:     Luca Ceresoli <luca@lucaceresoli.net>, linux-clk@vger.kernel.org
Cc:     Adam Ford <aford173@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
References: <20210607154931.2491499-1-sean.anderson@seco.com>
 <eafea6ac-fbfd-3f42-93fa-edb8cdced3ea@lucaceresoli.net>
From:   Sean Anderson <sean.anderson@seco.com>
Message-ID: <5ef31cbd-473c-0916-85ff-860012ac694d@seco.com>
Date:   Thu, 10 Jun 2021 11:43:02 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <eafea6ac-fbfd-3f42-93fa-edb8cdced3ea@lucaceresoli.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-Originating-IP: [50.195.82.171]
X-ClientProxiedBy: MN2PR12CA0026.namprd12.prod.outlook.com
 (2603:10b6:208:a8::39) To DB7PR03MB4523.eurprd03.prod.outlook.com
 (2603:10a6:10:19::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from [172.27.1.65] (50.195.82.171) by MN2PR12CA0026.namprd12.prod.outlook.com (2603:10b6:208:a8::39) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4219.20 via Frontend Transport; Thu, 10 Jun 2021 15:43:06 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: bc090565-67ef-42e5-05ef-08d92c267198
X-MS-TrafficTypeDiagnostic: DB7PR03MB4985:
X-Microsoft-Antispam-PRVS: <DB7PR03MB4985869EAB1867A1E8C2C7C696359@DB7PR03MB4985.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:8882;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: E+YDVfGDXOntOOwJS+/+QhYoQRnDuxq/fNwIqEP4Hg/vsX6CXYs3u/a/d0GmmtTXyutj5OjEsM1CjEqyXpl5KC8/1KGu0M2kxMEGiiWzdfugNyNZ4XxYeB/TRWmeKq+HXsDkJC6o6B1DFIiWibFeVjVQc+OGTKWP7yp3qjxiZb0JnpaIV7tfhEsG+ZbVJ74gGW0JPKl7ORMjdV65nVomHz8bOIOzJIY0lLBIwui3oDVuX0qRAV1XZI8W6UkYLEow9H4CWTiwoUDeK2XUoUIXfwjUf3bK+PTER9zsUI4YYwDxmoLaa9lT6MkGNTjWWjU6It6T5Dl7t/+4bRj6DKvoFe5Q1Kn5tnFCSxTOCH5GoN7lcesKBTa1Hfd7f5hob+BJDZL2yx3461Y2smv2PXSt9JGbBhFD+nwA4tWwZGozlYuzH2uXzzFZrPG1cNb0SeWXv2utzxyGib3Dxz/CsmkNAHWXckKaJwYy6ZvELfVK+0r1fqZ55qX+XKOktUw08u5mloQ9/rF9y00fBdRxbylGRiZiVgmLT6BaSiMCt5Mqt9y/uJ9GCt6+sUKMRzY3F4WnwBh6PHW3FcKhg5OZgevy3Zt2VXINRxyDt1WwT6HHDNUergm9L4Uw/xe3Pgy+KJ7PcU+GAs9RxHZg1ki6SPCy6S2hNYi/tNqY66i4/L/7En7JF4v93FOQWLMBHyppROn/yTrEQvwRKlTHUZzAqCxB/XucwQeKzN2J6+73Iv00ZU/kpYAb62k4T4NuYhvl7KIUm9QvyLTUj2hhsKUDYwB4J1pImr36+hvczmIERENpv+bNax2gwB7ZHbUG/ODiqwHM5coX4hbsqH9fIMUskiZLqA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4523.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(39840400004)(376002)(396003)(346002)(366004)(136003)(5660300002)(966005)(31686004)(44832011)(478600001)(2616005)(6486002)(8936002)(4326008)(16576012)(83380400001)(54906003)(8676002)(956004)(53546011)(31696002)(26005)(66946007)(66476007)(16526019)(86362001)(66556008)(186003)(6666004)(52116002)(2906002)(38350700002)(36756003)(38100700002)(316002)(43740500002)(45980500001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?utf-8?B?bE1JdEpHMWhLenp1RkFSaHc0ZmJvbk5NZzNqWHpSOHlKRjE5ZUNUaFg4bXg0?=
 =?utf-8?B?RFNzd0JWaXFLT3dRZ1lEOWpwZncxa2FJdTM0UElqK0gyTk4zcDFXckt5d1o1?=
 =?utf-8?B?OCtESHFma0gzeUlEcnV2KytJWUdFMEdDNU51aTJZUjdZMmdLeTdDcWlsV3dW?=
 =?utf-8?B?SEMwVTlOZWlnUjVkeVpiZHlOc3UwMWhwb3FDamJkZG9RVjNCT09mWEJ6Z2hV?=
 =?utf-8?B?QlViZUpXcXZ5WitzYlpUblhMY3VvZmkwVnBoVUhVa3NIdHMyOFBwdUFIZ2M1?=
 =?utf-8?B?ZEtaUVg4Q3MydEFNekt4NUhlRWE1aThtUDhFcTVOQ3I1a0Jvbis3QTVXa2VQ?=
 =?utf-8?B?aVVnQXVRbG5rMEZwWUE2cnA3eWUraGRGUHZ4M3UzT1J3Q1EyMmVLVExpYmRl?=
 =?utf-8?B?TUg2OUJ0S1RZNE9aV25HY0NaNUkvb05aTVhaKy94U01lM0VOMFVsYkpYdEJT?=
 =?utf-8?B?MUFvQjA0cTMwbFZtaWR4RDN3OWlSbVJYRUZXVC92aE8xS1pZc016NDBUaWJB?=
 =?utf-8?B?dlJnb1FNVy92M09TbUczNU1DM3JWMWRONWw1Sjh3YXVkdnhFaGR2bmtMbUd1?=
 =?utf-8?B?b3RCeWpCMmVRQzBVbWM2a1hiYXlmV3JBZ3RHVTQ0cHdza0dKdm53RGk5OWNQ?=
 =?utf-8?B?ZXpwTW5XWE83ZklrL3pXZzc5RkRDckpwQTA1c3lTc2FnMGIwSjg1VTNNcG9z?=
 =?utf-8?B?YXYzOFBhSFY0QnFpZGRKZ2lybjlrRGNISzk4RFZhUnRpaG9zNGFQRDEzbUF1?=
 =?utf-8?B?N0JrYmlMeEdPYlVaQXB5OGF6TVM1R01LcHlYRG9VSm14aDBnK2dJNjF0UVIw?=
 =?utf-8?B?QzZvdU9Ya0xpRjZaS25jMjlLZ1RpL0V2cDVpbGZhejRYT3I1WHk2TVIwT2pT?=
 =?utf-8?B?cW9XSFZ4ZU5zNU9PVlErYUw0T1ZBM2VJMzZaZU9TZitJOEduS1phZG91QjM3?=
 =?utf-8?B?TnBESFNmNWVRT1pKcEllSkZXOE9XZnVNeVZIV1I0ei95ZW9CcUFpb25xSmVK?=
 =?utf-8?B?TStHb2FUL2dXTGRwMEJISmZzZTEzQ3FZSmFWV2EzSFBxVHViSEQ4ZjRWUlkz?=
 =?utf-8?B?RG5kTlBVd3kvNHdwVkNUcUhkbW5EK2NBdXVSWWdiNW9QU2NyQS8ra1FEVUVP?=
 =?utf-8?B?KzIrdm5BNEFDTW5DM2pkMDZHT3Q4b0FLWGNrNTkxSWkwTGFQSlVTcGZ3OFR5?=
 =?utf-8?B?U3dLbzVtSjhiVjg4dnpRcHdpb29JR3NIM2ZTK2ZqZTlEL2pMVG10NkdLV2lp?=
 =?utf-8?B?OGV6NWNCNWJPNEwzV213Q2ZBb3ZwNUF5YjQ2Yy9VUTcwY05nTnZGZGZGbFZ3?=
 =?utf-8?B?dWxvYm1sRWliSHIvUXBTRzI3b2RHZ0I4T1BEVVBVai9Sb09vZXJkOXZiNzY2?=
 =?utf-8?B?VHVNdURrSHNoV0NBMEIzZ2NlZ1dvR3hiQ1grcFJ2YktnUFdYM3d0YnFqQkcr?=
 =?utf-8?B?bVl0Q3U3Y3lXWUJKWnlRVGNGQ0ZtdExRTjJndEJMdHhZREdpS2FjNDdtQ3Q4?=
 =?utf-8?B?ajBnQkVNUUxEbmZqbTZGSnJGSFMzWkJNaWV2dXZGZkxIeXFZQWRhU1JrWXNC?=
 =?utf-8?B?VW5SK2VkLyt0ZXYzZkhJbzBVVVNtWGJ4L1FSaVRwZ3AzWVFIV3NNR3VMNHdt?=
 =?utf-8?B?ZngvR1N6WjlVUm0xQjFYUGIyd1dZQ0xQNDVhT2ZQMTNIMVBCMHJYVEdSSEsr?=
 =?utf-8?B?NEdxcndUV3Y2V25yL1lNSEFSTm5jdXRnRmdGWHVKTEE3dzNHREtzZk85RVZo?=
 =?utf-8?Q?/0GnyA3OHzew+usn9X8uGScdteuE+JFf1JI7VSO?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bc090565-67ef-42e5-05ef-08d92c267198
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4523.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2021 15:43:07.8192
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 6hLwDAGEFsca6cYD108rd09jbErOf3kCCVRX65qmatoNsbfKHi2uhv8zFRQKyCMTlyaG9o6IimE2O97fsJFFuQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB7PR03MB4985
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 6/10/21 5:05 AM, Luca Ceresoli wrote:
 > Hi Sean,
 >
 > On 07/06/21 17:49, Sean Anderson wrote:
 >> This property allows setting the SD/OE pin's polarity to active-high,
 >> instead of the default of active-low.
 >>
 >> Signed-off-by: Sean Anderson <sean.anderson@seco.com>
 >
 > Thanks.
 >
 >> +  idt,sd-active-high:
 >> +    $ref: /schemas/types.yaml#/definitions/flag
 >> +    description: SD/OE pin polarity is active-high
 >
 > I think the name "sd" is misleading.

I do as well. After sending this patch, I reviewed the documentation
again and discovered that the functionality was not as clear as I
initially thought.

 > In the Renesas docs (which are very confusing on their own about this
 > topic) this bit is called "SP" -- *S*D/OE *P*olarity. But actually it
 > controls polarity of the SD/OE pin only if the pin is configured for
 > "OE" function:
 >
 >> SP bit = “SD/OE pin Polarity Bit”: Set the polarity of the SD/OE
 >> pin where outputs enable or disable. Only works with OE, not with SD.
 > (VC6E register and programming guide [0])
 >
 > As such I suggest you use either "sp" to keep the naming used in the
 > Renesas docs or "oe" as it actually controls OE polarity only. I do
 > prefer "sp" as it helps matching with the datasheets, but maybe adding a
 > little more detail in bindings docs to clarify, as in:
 >
 >   idt,sp-active-high:
 >     $ref: /schemas/types.yaml#/definitions/flag
 >     description: SD/OE pin polarity is active-high
 >                  (only works when SD/OE pin is configured as OE)
 >
 > BTW is it only me finding the "Shutdown Function" of [0] completely
 > confusing? Also, Table 24 has contradictory lines and missing lines. I'm
 > sending a request to Renesas support to ask them to clarify it all.

I rearranged the table to highlight which bits cause the output to
become inactive:

SH	SP	OSn	OEn	SD/OE	OUT
x	x	1	0	x	Active
0	0	1	1	0	Active
0	0	1	1	1	Inactive
0	1	1	1	0	Inactive
0	1	1	1	1	Active
1	0	1	1	0	Active
1	0	x	x	1	Shutdown
1	1	1	1	0	Inactive
1	1	x	x	1	Shutdown
x	x	0	x	x	Inactive

This may be condensed to

SH	SP	SD/OE function for 0/1
0	0	Active/Inactive
0	1	Inactive/Active
1	0	Active/Shutdown
1	1	Inactive/Shutdown

According to the datasheet, the default settings are SH=0 and SP=0. So
perhaps a good set of properties would be

idt,enable-shutdown:
	Shutdown the device when the SD/OE pin is high. This would set
	SH=1.
idt,output-enable-active-high:
	Disable output when the SD/OE pin is low. This would set SP=1.

--Sean

 >
 > [0]
 > https://www.renesas.com/eu/en/document/mau/versaclock-6e-family-register-descriptions-and-programming-guide
 >
