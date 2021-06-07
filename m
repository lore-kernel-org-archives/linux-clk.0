Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MSGID_FROM_MTA_HEADER,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3DEECC47082
	for <linux-clk@archiver.kernel.org>; Mon,  7 Jun 2021 15:49:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F8ED61029
	for <linux-clk@archiver.kernel.org>; Mon,  7 Jun 2021 15:49:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230294AbhFGPvi (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 7 Jun 2021 11:51:38 -0400
Received: from mail-eopbgr40081.outbound.protection.outlook.com ([40.107.4.81]:37445
        "EHLO EUR03-DB5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S230254AbhFGPvh (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Mon, 7 Jun 2021 11:51:37 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iabFjxK2UTMrtoU4oIvIdY4WhZiGPZheWpLSDy7RoaSLOU7wRdCvWHNWL5dw0FdAKIpr+sPzSGaTLLFSk9pcTZsI6G5unO0vvTZoSClQSQlp0Z6uAW+M9V9Rb+akS4trMChdTKtX1Db8U0PuWbMXLbM91/ivUcJASIyAX2OmfVCBKXCmrkIwq5ftHFmJjZV4LnenTCYZ9P2qOJeLscjZKkAW8BQf2GrqWNNhg1AK87e4iJ06+Q0DyBk4LJpctiflMmeJm4PoTpHvcHgEkcHkBcruCyvfle06V73Lqwh5+egd5qpE+ce1LoMP3ZS1ew1PIQ5C9JyL44XKV9h0lNqGAQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bn9P/SDSA3n2LlfevqR/BrlKlyvrw/c6ghv2/WwuAio=;
 b=i5boUmN05u7sgqjy/IN91uSBSZzguKafk6QD09Pxb0XitVopLO90a7ZfdsrTcwT7/YPzX9CM8PbDoLzdpIK+8oMLJ04vBUaLVELVaE1+kj7btFVWcpXgjje9bCHJeCYLedrWNb/8ZkIOSBX7I/eRLaOe0K/ZY0arJVD0C5UwboN35wQPGviZ3BOfnCGomx08magZzzSqMw8r55z9XdfQw9tkVoE+aNINQNXcOjLiJICjmLQ0zJGVLxk3SakzcJ2TASz8M9qiSgO30nczRiBvj9R2jjV4D5PZGAAOvnm2aLb7cv3npCdbMVj8MvRnqGdBO4RXprnxSR2DF7D/rTGUxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=seco.com; dmarc=pass action=none header.from=seco.com;
 dkim=pass header.d=seco.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=secospa.onmicrosoft.com; s=selector2-secospa-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bn9P/SDSA3n2LlfevqR/BrlKlyvrw/c6ghv2/WwuAio=;
 b=RN7IgCgwSBE523ELAtC4YVG6wW/1BE6GxQrHRiY/uU3x43M4oSg+Fe7Z97JnatUqgmD2soJArbS/VuvY6FZYQ6J85bbGLRHMsTkUEHhD/1fSKq9CvkiDxszJtOBdOXJOEFkTJ8uEVLwvtKjvFJ2aVcnUk2ETZ0Ur/tU6Qn15e8c=
Authentication-Results: vger.kernel.org; dkim=none (message not signed)
 header.d=none;vger.kernel.org; dmarc=none action=none header.from=seco.com;
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com (2603:10a6:10:19::27)
 by DB8PR03MB5673.eurprd03.prod.outlook.com (2603:10a6:10:105::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.24; Mon, 7 Jun
 2021 15:49:43 +0000
Received: from DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::40d5:3554:c709:6b1b]) by DB7PR03MB4523.eurprd03.prod.outlook.com
 ([fe80::40d5:3554:c709:6b1b%5]) with mapi id 15.20.4195.030; Mon, 7 Jun 2021
 15:49:43 +0000
From:   Sean Anderson <sean.anderson@seco.com>
To:     linux-clk@vger.kernel.org, Luca Ceresoli <luca@lucaceresoli.net>
Cc:     Adam Ford <aford173@gmail.com>, Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Sean Anderson <sean.anderson@seco.com>,
        Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org
Subject: [PATCH 1/2] dt-bindings: clk: vc5: Add property for SD polarity
Date:   Mon,  7 Jun 2021 11:49:30 -0400
Message-Id: <20210607154931.2491499-1-sean.anderson@seco.com>
X-Mailer: git-send-email 2.25.1
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [50.195.82.171]
X-ClientProxiedBy: MN2PR16CA0060.namprd16.prod.outlook.com
 (2603:10b6:208:234::29) To DB7PR03MB4523.eurprd03.prod.outlook.com
 (2603:10a6:10:19::27)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from plantagenet.inhand.com (50.195.82.171) by MN2PR16CA0060.namprd16.prod.outlook.com (2603:10b6:208:234::29) with Microsoft SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4195.15 via Frontend Transport; Mon, 7 Jun 2021 15:49:41 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 4dd77d1b-6352-436e-449e-08d929cbdde6
X-MS-TrafficTypeDiagnostic: DB8PR03MB5673:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <DB8PR03MB5673EF5D3EA68879044B877896389@DB8PR03MB5673.eurprd03.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4125;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: oDgMjmP5aIiNUN/Kn12t7DuZcyGB5tQb1DGXMjTdCPT4ZqbZP0qvsQQttc3F6/ysu015q48tqQ/ub2k2ssTOCLuxLF5CtbswmcVKpDNU9u+MtaEtMLYvzbnvk2Faz+Ycrp0060Qh9gUER7A3ILRgXxFFXke/dH0erLrgNsqOT95m3LA6PvmFzPKyVgr4n+KqXTtLAOtx+xhRiijIYSC2Re5dA0JniV+DXisKsIFfEzLwGo79EcH+mxxDzoUHsU4nVUgI2XmCbR62K0u/TxiYWpwmM96/JJOfHC3dfvJYbEkjvf3cEmkRtgzVssKjrsiM0FYlBZ82QMLWRQrt3x9QTxFG3xIVh67vyDVyBUh4zh1G+xCN6FHmFXXDS+TLeztqAGooGMdlWs2A1D6lRT5/mtXi23Jxp/T8bSAf+VlALILuS2W4lXnM8pjKnUmJ3EGTteavfSN6Djdw5W3KbcUWays41jezUQeJGgR2zeOwMFRaVQE3vmagmY4IbYS4jHADTSHAPvbEXm8RW0dVIp2uDMtDJHf8v7fPf+m/w+YkJjjDDpOx8YXK86DK8b7upnYMIy7fKRhqpf71S2NnPXVdCVxu/MwSMmGmJRmm/e6yhaqtvssHxJD7ghJWFWNd5BZDUfvq+Jp3bDwHwtRxGdHUZw==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DB7PR03MB4523.eurprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(366004)(52116002)(4326008)(5660300002)(54906003)(6486002)(6916009)(6506007)(2906002)(6666004)(83380400001)(6512007)(186003)(26005)(44832011)(36756003)(1076003)(8676002)(956004)(2616005)(66946007)(8936002)(38350700002)(66556008)(66476007)(38100700002)(86362001)(16526019)(498600001)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?YzOBW0er6i4qQzmNp7YJlN7lAXWeviXR+2mpxzOxTj2XknT0FZXRkWakOqe0?=
 =?us-ascii?Q?z/7ECdM6E2ToCDPyuQStziGwmfHw8+M+DzjP0vLBAjmyZ+HvdH6xr/kCmEpA?=
 =?us-ascii?Q?w9fNcH4rzLWswuty+oVQfvBkAYwgdR2Q65Xg2MKH6SEmqzde8bEyx00woLde?=
 =?us-ascii?Q?V/69F3Vb0YEkDuYSbDuI/w4BU0J2Kvbdj27bUozqktFykp2Ks3kYjy3tOh2d?=
 =?us-ascii?Q?NrBw4HXNP7IU9Pq4KzmwL0tXM9iXWFxgHp4rMhko84/iYdXBQJWAy05+JMZw?=
 =?us-ascii?Q?j3TG2B8lDutVS5Adrq5lXOwAr2BvdebHm6iPtXq5TWrkks4jBnqe1FKuA6Ws?=
 =?us-ascii?Q?wn9EPIEpsHhv7B1KyKgytRCMdvECBU/gbKdlWzUlJehoCrKU6cBVCdp09C+f?=
 =?us-ascii?Q?feSy/x7aWL8s9Miko9wVLGwEeeNtXMPTdAREbubWyY5/Te/yUH5/2gtDucR3?=
 =?us-ascii?Q?zKKkNpHl02Mntx6U0aJxcwJW3Mq2EKZjXgC/X7tRGYpWXQB/2WHJN0R8e+VR?=
 =?us-ascii?Q?J7Nr/EeMrIfIQHab0+9fU7QheIVj3dKSbAsi7zf/wQNogavo6aW7a7QDHlOb?=
 =?us-ascii?Q?4sWXGfsU85O+AR5Fs3YtLYfceUp8BJkGUkvBYumzQkj4fKioKYNatgOMiTxp?=
 =?us-ascii?Q?3iP85psvkh4f8qgh47gT/mcNX8JPaKnXEP0A7XV8pY9mdVgu1kzwdnuWnrKZ?=
 =?us-ascii?Q?0wLvg7KZZRtAB1gtYpSzaJjOR2oem7XkM18iOVsRjJ+OKMN6wmsE99ln1yv7?=
 =?us-ascii?Q?dRiQq95Fei3FP9rlEavelF8Avbz1FJQPb4fDY+qVJYcP78XI30eB7mnyecrn?=
 =?us-ascii?Q?xyJK2+SjK8s0KvTxfiw4erblCDRb1OKTdEB/s5YFjhHFeOGld5KXMMMeCsBs?=
 =?us-ascii?Q?6lAkU0BorAw9p5mqqb/pu3f9GdD8i9V5czTPr0MspqwoLddU+JSzjBv9Qcr2?=
 =?us-ascii?Q?2fWzGEs2Mik4Ud7T6MVmQ5q+xlA6+qAJDuGr+5uBU+W5oWDoMCV/pg4HWjTa?=
 =?us-ascii?Q?GeQQuqS5PhIpE7eeyi7dpNdBNm5keGHfRlE2YroxBIvJD1L7aobjzU6HYWZQ?=
 =?us-ascii?Q?CuaFwOAXorfhiPXbzlNemlWH4gknOFcj6uJsaEPLW+QSdq/8KreUZJe+9aAs?=
 =?us-ascii?Q?uQvoiDAo7VYbc9F4Eqx2kVO2LfDnW4ax+ahXjUb0OZKTfWlcdfKmsMlrRMDA?=
 =?us-ascii?Q?N4i+wE8Q+f3sQ1A8HJvZ0tbTJ+OcD4xk/A2tS2lklj2imeIm1fKgJyDLmwmY?=
 =?us-ascii?Q?L3jRPOOAKZbNgnLUnxfkGtkABFsmALanRfVhy0TmcGddGc/DyIBIs6oSKCzD?=
 =?us-ascii?Q?jrDpxzbPKlM+SiE5cedIU5qt?=
X-OriginatorOrg: seco.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dd77d1b-6352-436e-449e-08d929cbdde6
X-MS-Exchange-CrossTenant-AuthSource: DB7PR03MB4523.eurprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2021 15:49:42.9500
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: bebe97c3-6438-442e-ade3-ff17aa50e733
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bUjN0FHdO0ZsHngiyMd2wEZGdBJjXelX57PxUzi08nieoDDN2C7mxzb1ZZuxKeUIamAGbDdplSvnZ60TapWORw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB8PR03MB5673
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

This property allows setting the SD/OE pin's polarity to active-high,
instead of the default of active-low.

Signed-off-by: Sean Anderson <sean.anderson@seco.com>
---

 Documentation/devicetree/bindings/clock/idt,versaclock5.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
index 28675b0b80f1..e6406c0db624 100644
--- a/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
+++ b/Documentation/devicetree/bindings/clock/idt,versaclock5.yaml
@@ -64,6 +64,10 @@ properties:
     maximum: 22760
     description: Optional load capacitor for XTAL1 and XTAL2
 
+  idt,sd-active-high:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: SD/OE pin polarity is active-high
+
 patternProperties:
   "^OUT[1-4]$":
     type: object
-- 
2.25.1

