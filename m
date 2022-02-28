Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6EB24C433EF
	for <linux-clk@archiver.kernel.org>; Mon, 28 Feb 2022 16:04:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233770AbiB1QEr (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 28 Feb 2022 11:04:47 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60802 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232365AbiB1QEq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 28 Feb 2022 11:04:46 -0500
Received: from EUR04-VI1-obe.outbound.protection.outlook.com (mail-eopbgr80079.outbound.protection.outlook.com [40.107.8.79])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F6DB41981
        for <linux-clk@vger.kernel.org>; Mon, 28 Feb 2022 08:04:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VkJwA6hNiDUwLDThDty9IawVEgIfx0m78GZPQEXO/wGFe0vjxG94QDL9JsxbNbSRcFihVBPNiiRk6a+yiJ8OJ4iijk++tqIWtPN1oyN1UrGUbdEQ9WRbkdl1+SNRw3UpYlqGfwPrqFRxrtSc4pmjdXLmKKLzhVwZNq+hkQDroqoxG5VcV1XBJHxmJxMi/MmbGimLsjEjIzKmBZWclUUINtgHCQs2IODRroqVwnrsDNHs/82oaNnMdgKD0FPFYnYQBrVmOm0SCpNgGZlwDLb1UN43daJUopm1PkMyJhlvYgtZ2/JQhir0Ty/Np01CG3LH3lYYqYuKhEIFbv/HmWx6yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CCHgUaQ+Nv3pg+yKtC4+KXQd7bsDHWbGMH5o7NN4KW4=;
 b=GCz4appQiNYOevetsbsdEmk8naszx08no150xQ8yYT2Q/g07Z6iEbhcGNpPlu7SkhNsSANWtZrlYpzJKIrV8lie2EVEI/+6Dv/oRG4NsEF8PWkuTrx09EliOFUsM8/ZqkcfHc7PoR9gwZjDzxC/WjlLjZlye4ZtQ7jU0w3e1kWytXBatSwrFKEK5Bab36LWIyzOH+8Y/5KwdK/c2j7xdvB+q2l8wHREjuBPlW/G5yEEp1nhvJrwuDvUjZhOVjnEpVxe+KqphvEfaZ4Fcvt/jKChvtzv8vEFSdiHI9l2S18CPTcfNi/34Vu1U+QcsUioYo9Hc+HvQGOhnejPFlgQmLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=seco.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CCHgUaQ+Nv3pg+yKtC4+KXQd7bsDHWbGMH5o7NN4KW4=;
 b=ZZ4ziVgKkRqrUoULLBBmkIZtGZQULhOPX0CJm6cbLr3H3SyuwTGemkJnJEZoKCHuXQiKz4C9OQZL+QceHiFFrUCGcDPLC0OoE/mVdOCl0xzlB6uLvG43QhX8h7cUuvoVSPdsv7YHuLNhK7IVsflhA0GPNV4ocBLjrsQooS1IrAATq98fUCnTtuJ0iYvzKGMNok4gs7bp1SKby39Pqn9rbCAA98wZu/KR9xvIMon/TlxHUnkhgXpUlPCSpHXoKGH5KESe5xct62slBEsz/gCmDGLIgHXXUMtYveIjvz4Iiqhh1wYpRI2ysgSURJzEYAGpHn53yRfaMZGWV9CgnHzNQA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com (2603:10a6:10:19::27)
 by AM9PR03MB7996.eurprd03.prod.outlook.com (2603:10a6:20b:43f::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5017.25; Mon, 28 Feb
 2022 16:03:59 +0000
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::fc23:1f08:6f41:72ab]) by DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::fc23:1f08:6f41:72ab%6]) with mapi id 15.20.5017.027; Mon, 28 Feb 2022
 16:03:59 +0000
Subject: Re: Questions regarding regarding idt/renesas versaclock5 driver
To:     "Fillion, Claude" <Claude.Fillion@mksinst.com>
References: <MN2PR03MB5008EB5F50B680C2A2E271D893019@MN2PR03MB5008.namprd03.prod.outlook.com>
Cc:     Adam Ford <aford173@gmail.com>,
        linux-clk <linux-clk@vger.kernel.org>
From:   Sean Anderson <sean.anderson@seco.com>
Message-ID: <9e4e542f-6f73-164e-581e-17369aada2f3@seco.com>
Date:   Mon, 28 Feb 2022 11:03:55 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
In-Reply-To: <MN2PR03MB5008EB5F50B680C2A2E271D893019@MN2PR03MB5008.namprd03.prod.outlook.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BLAPR03CA0106.namprd03.prod.outlook.com
 (2603:10b6:208:32a::21) To DB7PR03MB4523.eurprd03.prod.outlook.com
 (2603:10a6:10:19::27)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 58437273-28e9-4de5-044e-08d9fad3ee61
X-MS-TrafficTypeDiagnostic: AM9PR03MB7996:EE_
X-Microsoft-Antispam-PRVS: <AM9PR03MB7996018E0843737941CCA38596019@AM9PR03MB7996.eurprd03.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: z/XKYIPRVDxpQH/Kg8AH11i45djTvWb/ymbHdtvl54wrXwPk9UKf4fV+/OmqAc0AGFfC7gudsgGVU++Uu+Fk3DX1EdiZPXSJTbXvuAe/LLOtm9KOhns1gzKhhVklzIqgcS4ELBLjhh6CP5ZFTIKj5OQrj+SsrHPIppn8PjM2R4v3LuGtlCsrLwAinJmtv/FLBRkvbhOkPJIVBa4scqQscI0UQEmkYOjPrT/EQr4iVF+wm9gj4H9kJf6E4aGlR1tz4cND0lHEYOexbIskSaM4UDdDJMmaLhQ6fC+ANtPV92CcLc9sKTlmJ3TKYx7b/OF7NjZeq+sfO65uk8EetUFJLuRgr41Yiw5c4jJ85nxBOoK1d7EzWS3jMSjLpb8/IqpwkVvd+wXBnACmVKNi9/nSNT3GeNe00kdTTzL/9alB8B5lesZyJf4D0bWj/0cIv62ztovm/x8rz7cdx69ICD4F2c79AzPZ4UPqajo4LOsP9yTSUienPnXlTzOWmaTVi8ies4CuyGp4pgL2znBiW5IyXMiFFFKoo3vo4t+vrqkIUPDxGw0l7ZOlB9oED7T1rOnDo9X6pMD0TEC5ZXmT2Rnq8dPmccud8NXZ5z9skqeznRNF8klydBqEHkMIHGhV9SdqLq6Hi2F1TLvW+1GAEknLEucI/H3lvoSKgNKh7GYnQhOjjJvSZ2pIKeTFUdCrbU8MAFsecGpxJTaMbVEtAlPIp+sY7Th9d+2qGHCdOrirfzoGG5LpVpzE5N3gjw90wsXxaZuIGFGdvgw+EZqt0GgYd/xdcNSL5nXw4+tzHdMqPtbPSzmPl3078OK1b+lpFCTGAf21ZQMWgcqXJyNcI9B5Zz/DktRay8TjGh2rXadsU9iYdl5FhYG1bhjr7Nsb1aVB
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4523.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(366004)(52116002)(2616005)(6512007)(83380400001)(186003)(26005)(53546011)(6506007)(31686004)(36756003)(6666004)(508600001)(6486002)(966005)(66946007)(6916009)(316002)(8936002)(54906003)(4326008)(38100700002)(38350700002)(8676002)(66556008)(66476007)(2906002)(44832011)(86362001)(5660300002)(31696002)(45980500001)(43740500002)(10090945010);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?Windows-1252?Q?D0EBg728tOjvYHw19lsDWrN+DkW4246pduO1Ndx8/3bXt5TjHDOJhRDZ?=
 =?Windows-1252?Q?gE/SHi6M3Kll3xyJ/O2mky8mCbSVv6WvD6X52PJtoFZCvk439hwDapm9?=
 =?Windows-1252?Q?HWR414J5Te5k9zcm3CdtEieAyfGUlGQ+GbX3+nUawej4abtZwqqpBdAx?=
 =?Windows-1252?Q?S0rqzXejrK3EJgCTMSdAT/4xszl5tENNeZmhThuPwSkbItEpwc2cx0PQ?=
 =?Windows-1252?Q?IMpERylFdU0PO+ZX1iqFKf6OGsJkH6w6aQiPU9IsYa1UvJ8QIeNW0Som?=
 =?Windows-1252?Q?ccpXh1kXjB5LKmw6wg/GRGqSlOBcCa+muDGp6ZET52u/RDiS0+v5Bcp+?=
 =?Windows-1252?Q?RwP2fe8rcOThKhX+zh49BbcRTTtIyJ/6Jz3aUXi+R9vwKmXXkPu7SPo3?=
 =?Windows-1252?Q?axUYuPWrbclvXS/wsdF1+pmj+ldpuoZZcG76xX+sgG95KFhtzleeYfPE?=
 =?Windows-1252?Q?ODSYfrfmfGyzj+2i+2amZQS+4xkhmiFSmyPlt6iI1Jy3uwt7bl6+R0Fe?=
 =?Windows-1252?Q?rNRu+v4bez1RRodI1+8x93T+V9QHOmLM0qvl39LVJhbYF7Do3EJvtTuw?=
 =?Windows-1252?Q?4qScXgK++IWZEFR1VpJ8uycJj9FeORZXQO1dV8M7FEgSbf3Eo9oNMDx8?=
 =?Windows-1252?Q?NwNudQcMPCc2u7HQTBFRoCk5dobqTBhXzSTvKet+K0xSxr+AUioi4XYK?=
 =?Windows-1252?Q?iVsPj+OinZKXBZmCrB+tLtXIYbDFGy4PspLhV/ubJ7lD//EFcZIcPmRv?=
 =?Windows-1252?Q?z+Q3nTKlNLP3880cv1QGnfttCL44WT+AayYfUf8sZtXwh+ymORLC43t8?=
 =?Windows-1252?Q?KhQ7jSVaSL/1eEH40OqGZBlAuXheCvzAeeEuAJG5r/yj9cTiN1TjGRIo?=
 =?Windows-1252?Q?7QzTG4SFZfhiVx4bSGifPmldybT+0EjM+qbJ1uIBDJx9evEJnlQ12j3g?=
 =?Windows-1252?Q?R/oZ3h5p3k/FkNWZIYbKUu7mX+yLTRwEvq4h8F0W12HzJCCzpQmtAoCy?=
 =?Windows-1252?Q?fgsTWrVBGhsEsweRfmCvPU/77q/Xqr4LEV0GwF+Z3nJbzY5/59W7UrMl?=
 =?Windows-1252?Q?mwVvCOaID2qXpZMX4MIUFBzRlC93ibD5fJxcJSSdCfrsRsmz7yVCy0e0?=
 =?Windows-1252?Q?xwMg4+eBb3UyGxVKflfec4kRHvqDdyThwlhn46d0kWQU+300QnXWI7TJ?=
 =?Windows-1252?Q?dsGvXuCSo4q6ZsOvQ4zWaaMTyCq0hhUTwIOs/lbBNMyaCeXvfKijcQuU?=
 =?Windows-1252?Q?ZHXFLTEFzrT1kFNUgDGBZFQaSJWSelUkghorfTbSoYn8xfzu6Bq0qjTJ?=
 =?Windows-1252?Q?+A45RWj6rVraBrgQaD+/68OfNDFgamlSJF6bg7v2A3hcMRZnC97/EsAg?=
 =?Windows-1252?Q?EomaAHPJ3G0zz4Tk9hEs9OFhLBoAeMHcEC6xKaB6+OYG/+dUQejbnB9O?=
 =?Windows-1252?Q?908fUfF4XrcZxMMgn7MXzRaqedUCGEWKQVEwmZmNX6IJIPZJVZ8Lci8A?=
 =?Windows-1252?Q?mvauzTjSKxc/aZyX5Dp80O9KhphV79BmcrKhdX+Ebt8orhtucNMwxAO2?=
 =?Windows-1252?Q?MuQ5+JfG17+1jBTqTLdFRMXCUmX8qpw6UlgztbMPtTdVU+d9OQuu5WXa?=
 =?Windows-1252?Q?n2DRbnkS2/SSgxDbX9DxsYzVPoc28DA7HNw1Xk7bmrkdvuvSvf+h8PYg?=
 =?Windows-1252?Q?3Mzsb63DXp+EXDZeMJOyg0OChfeiHqyoaLtf42tn3ZUfbozi6SQXt0pl?=
 =?Windows-1252?Q?M0QZgYW8F6Tq59jqZyo=3D?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58437273-28e9-4de5-044e-08d9fad3ee61
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4523.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Feb 2022 16:03:59.6514
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 45Y3VrsMhH3MvAL1vhmcr7vRvAhITjwKsk6VsZy5iZTDeAyglH2MaKWbTT2awp62pK5CA2n1j66OsoKZUBAywA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AM9PR03MB7996
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org



On 2/28/22 7:35 AM, Fillion, Claude wrote:
> 	
> You don't often get email from claude.fillion@mksinst.com. Learn why this is important <http://aka.ms/LearnAboutSenderIdentification>
> 	
> 
> Hello  Sean,
> 
>  
> 
> I have a design that is looking to use the Renesas 5P49V6965 or 5P49V690 clock chip and am looking to use the versaclock 5 driver (https://github.com/Xilinx/linux-xlnx/blob/master/drivers/clk/clk-versaclock5.c).
> 
>  
> 
> I am new to writing drivers and have two questions I am hoping you can help me with:
> 
> 1) In the driver I see the following code:
> 
> static const struct vc5_chip_info idt_5p49v6901_info = {
> 
>             .model = IDT_VC6_5P49V6901,
> 
>             .clk_fod_cnt = 4,
> 
>             .clk_out_cnt = 5,
> 
>             .flags = VC5_HAS_PFD_FREQ_DBL,
> 
> };
> 
>  
> 
> static const struct vc5_chip_info idt_5p49v6965_info = {
> 
>             .model = IDT_VC6_5P49V6965,
> 
>             .clk_fod_cnt = 4,
> 
>             .clk_out_cnt = 5,
> 
>             .flags =  VC5_HAS_BYPASS_SYNC_BIT,
> 
> };
> 
>  
> 
> However, the 6965 part also has the same frequency doubling bit as the 6901.  Would it be better to set the flags for the 6965 to something like this?
> 
>  
> 
> static const struct vc5_chip_info idt_5p49v6965_info = {
> 
>             .model = IDT_VC6_5P49V6965,
> 
>             .clk_fod_cnt = 4,
> 
>             .clk_out_cnt = 5,
> 
>             .flags = VC5_HAS_PFD_FREQ_DBL | VC5_HAS_BYPASS_SYNC_BIT,
> 
> };

I think Adam will have a better idea about this.

> 2) I am unclear how to set the output frequencies for the device. For my application I would like to set output clock 1 to 250MHz and output clock 2 to 46.8MHz but I am unclear how to do so.  I have looked at the documentation at https://mjmwired.net/kernel/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml but remain unclear how to set the output frequencies.  Any insight you could provide would be greatly appreciated.

Use assigned-clock-frequencies as described in
Documentation/devicetree/bindings/clock/clock-bindings.txt


> I saw your name mentioned so I am emailing  you directly.  If there is a better place to ask these questions can you please direct me there?  Thanks you so much.

Adam (CC'd) wrote the original driver, so he's probably a
better person to start with. You should also CC the linux-clk
mailing list for questions about clock drivers.

--Sean
