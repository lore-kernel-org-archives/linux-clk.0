Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6E3CEB64DD
	for <linux-clk@archiver.kernel.org>; Tue, 25 Jul 2023 05:28:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231497AbjGYF2N (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 25 Jul 2023 01:28:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43996 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230450AbjGYF2M (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 25 Jul 2023 01:28:12 -0400
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (mail-bn1nam02on2044.outbound.protection.outlook.com [40.107.212.44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 561E3E4D;
        Mon, 24 Jul 2023 22:28:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SAh0+wz9lYcgxW6ZrxSiu8neh+c89Q1nmp1usKwdYmNZ6fgOpPD4FajNFMt4nkTcWL1SqF8zyallKi51EuOG7OYlq3Zmhnf8hq5Ej1Lb5fIJvHDAe/1+IWByHRdpCPnsKgj+BgCF4esF6kMaoyqHUQ6ek5QqqTNMSouEBmYXCfic4CHwOH1h6ns85Nc5iYqd/VyHRx5VRZ1N8u1IHA3J/XaSKyRmvYo0y3JbuLKI0J9Wy+nRmD+3I3MdVrbBIybr/1s8J19iHxvshPZJ2ZQP2snzDYaIJpNpqjiz4cd4eaAdEiR2klULdKW+egaoNBEXYNESgg52zw8v/hNs83QvXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AWJ9rc1R2B1DfeDKEwRVmbKqxxBPfzGAErUBSA0jdBg=;
 b=Jd6KLfb1Zsnqp3Iz7xP0VbSduNKRm0BJP6/x5SFBSzonuKUR9RmNisqZHLE+te7WKmg8x+POKAUDa2NE8IEGMZwo3/qZ5pa0tpCYa2GFlxTciDcW6bkO5P3UP3NrjV4oHAs5NuSRa/E/8xdrSuGWy8ZOy0SDOV8Zf6T/ndIK1F1HsoBZuPnYdIzo6CMZM+Jv4B354nwlxNbaDuku3QloW8VU2B60IXLlKYYSJ2V0tJqHgve+IdGB3skMC8eI0uk0E2LBEi01jM1oQV2l0pB+6CEZy6GqQHv8wz0ycekseQo9tOU5nq5gRWCTbRgM2JmObmWcjc6G1FT8+7fIvUYj+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AWJ9rc1R2B1DfeDKEwRVmbKqxxBPfzGAErUBSA0jdBg=;
 b=qaaZoGhtQh5viom8xxI3F5OOqItS66ipUfk89tWeNShkjEOrM7ANtrWXhD5EEMV4SSCiF8K4e/pXrvKuReNpdXg5T8FbAmRjacEi/31oHGfwJ8WG4510ZQ8Z92CVsswtrIGyxY/cK1JCwpFGp3N1GDqZXUcBLjmOSV6Z6HoC3h4=
Received: from BY5PR12MB4902.namprd12.prod.outlook.com (2603:10b6:a03:1dd::9)
 by BL1PR12MB5993.namprd12.prod.outlook.com (2603:10b6:208:399::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6609.32; Tue, 25 Jul
 2023 05:28:07 +0000
Received: from BY5PR12MB4902.namprd12.prod.outlook.com
 ([fe80::dc59:ac68:adf2:62ba]) by BY5PR12MB4902.namprd12.prod.outlook.com
 ([fe80::dc59:ac68:adf2:62ba%5]) with mapi id 15.20.6609.032; Tue, 25 Jul 2023
 05:28:07 +0000
From:   "Datta, Shubhrajyoti" <shubhrajyoti.datta@amd.com>
To:     Conor Dooley <conor@kernel.org>
CC:     "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "git (AMD-Xilinx)" <git@amd.com>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>,
        "Simek, Michal" <michal.simek@amd.com>,
        "conor+dt@kernel.org" <conor+dt@kernel.org>,
        "krzysztof.kozlowski+dt@linaro.org" 
        <krzysztof.kozlowski+dt@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "sboyd@kernel.org" <sboyd@kernel.org>,
        "mturquette@baylibre.com" <mturquette@baylibre.com>
Subject: RE: [PATCH v3] dt-bindings: clock: versal: Convert the
 xlnx,zynqmp-clk.txt to yaml
Thread-Topic: [PATCH v3] dt-bindings: clock: versal: Convert the
 xlnx,zynqmp-clk.txt to yaml
Thread-Index: AQHZviCtrm1Q/7lELUKAAndj1qKuB6/JQnWAgACxNvA=
Date:   Tue, 25 Jul 2023 05:28:07 +0000
Message-ID: <BY5PR12MB4902A95CD14D934BCF3B7C658103A@BY5PR12MB4902.namprd12.prod.outlook.com>
References: <20230724111843.18706-1-shubhrajyoti.datta@amd.com>
 <20230724-direness-syrup-14c0b50c8018@spud>
In-Reply-To: <20230724-direness-syrup-14c0b50c8018@spud>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ActionId=f78216d6-8776-4f2e-a372-f7e8fb359da0;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_ContentBits=0;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Enabled=true;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Method=Standard;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_Name=General;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SetDate=2023-07-25T05:22:10Z;MSIP_Label_4342314e-0df4-4b58-84bf-38bed6170a0f_SiteId=3dd8961f-e488-4e60-8e11-a82d994e183d;
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: BY5PR12MB4902:EE_|BL1PR12MB5993:EE_
x-ms-office365-filtering-correlation-id: 7df7c255-9f3e-41b6-569c-08db8ccfed7d
x-ld-processed: 3dd8961f-e488-4e60-8e11-a82d994e183d,ExtAddr
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: +NMUBLAszM9IWFOQohF8D/L9heStLHjXK80KvA03H46pBf2rWVs1wr8d40dHVDK8GKFMB+Gn7v27DFsZMHGH5II2zGizF/9mw/VYivXFr+zL/Kqkzk3e/JtCurOU7K7unyJjVudZJKbg99JLwFve7RnCTQHG03LVITvPQxJ6LIGTPQQJej45kCIIUwPcNXUfTRKHObE8FTEPz+8QS69p8NM5Dk6f9IdVbIdTs2W4OuVbjkJOhUOQ+isM0c86DHRm1zVXcBm31RNzxDLCgOoJQK9xfK0lVBeE+YyYhgPJGBwAg+3X0B5YIlacdOEbnBeLePQXSZNrGZL9RuLXXYhObec9MiYI/YBCax/xkd5ae+i6aFIt1uPQKLHNPWUUvFQYbWrqLwzX1Vio+Ptmd1//geCkwvmZCleILN/UE6e6e5DPkPZng22xZBscrSZUr/MTm66YVuMiBs4ZTOjbLr2JmcMT4ftB2GFF58NfvcryUfi8dlWobCAp8RmxUot5xv8gogVtF09enynC7mXdEuBNaUNIJ1E42jEyU4YE1dSk8E3zMwHvGbZxCTZPgx7lhgwU1tWYwfM9tHvdKkiDApy9Stu7kr78xOqiC4CFWLcu8V10VB7uzxaZh3O5rlvrXply
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:BY5PR12MB4902.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(4636009)(376002)(346002)(396003)(366004)(136003)(39860400002)(451199021)(38100700002)(55016003)(122000001)(53546011)(83380400001)(5660300002)(8936002)(8676002)(52536014)(478600001)(54906003)(66556008)(66446008)(64756008)(316002)(4326008)(66946007)(6916009)(76116006)(41300700001)(186003)(26005)(6506007)(71200400001)(9686003)(66476007)(7696005)(2906002)(33656002)(38070700005)(86362001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?us-ascii?Q?12p5RzlgfO2wx4myd2VKPp4DksHFwdEtG9ZukCgGCdYlq4GZjAtaQMP8d+Uc?=
 =?us-ascii?Q?lCpam2TTPjKgm/yzqrYnvBQimq20okZcJn0QJPlL8r+6iIvUwkzDbRwy76tb?=
 =?us-ascii?Q?iNroV9MwiaVHvdHuv59TGFVUS6egZz+eXThzrRnAX4uC4OarW9e+HOpSoEw7?=
 =?us-ascii?Q?eEN66C0tRuGdq2czl0mfSFKmC2jLJ3hQbvCpsWZx4+DurUAnhZ3oAQDMGMfd?=
 =?us-ascii?Q?lO8TgGHip4JVqSGzaa1uXc1e+lw4jzJXapuGgQY7tw+lU2yp4vRYXAO/r347?=
 =?us-ascii?Q?lcP65IOkRPgzcXQNd6ESbS3mxBbFMykqPkjsfWSdJPDYOu5ypRlhQqpNXtix?=
 =?us-ascii?Q?avWqrPDa8qqKYMVvGHj8RgfhWqnC0PknLPsiItPhhT6nUCjPtxlSeoQqKovN?=
 =?us-ascii?Q?OPMaoz5B2cTHyKwrkmB1fWG1zqitT9DaLIJCtZ8HabZOhUl7khEVv561TuZD?=
 =?us-ascii?Q?fVi0kRhTCA5luHB+7ugH336XwpGqOhMGdy7mV6d0qJO3dNaDcUcixqBig7//?=
 =?us-ascii?Q?vshA91bRwXu+4gNnkr0qoUaZ15JHXQPoiPLea8pNH6f5cO+BC4l699kF78x6?=
 =?us-ascii?Q?GuhCuaw5e+uFVyAx6K6jpv44P0wJLs+x2Hvdm5VLDoGH68N6xqWiJs21KVDB?=
 =?us-ascii?Q?IAmoEtL5JqIKFIIZPXyvX0mS2GoekTz+NPGDHE341XNDpc6PQ+kpVucy3W+K?=
 =?us-ascii?Q?4i9w+G4VluuPMctWP4iS7+DNhErXmf6gb5y9XVVaLKpfatvd8+5/yGI/QKri?=
 =?us-ascii?Q?I8EnZpmAKbnixEO3U4z2256o5YR6AXXGQ554zIuDh75O654AIckL1tXOrD6g?=
 =?us-ascii?Q?SaMpLRuq3ulCyKdjY0BroTezARIJwk/yQLHYsRN4kqTwpDeiiYaj3RHxBY36?=
 =?us-ascii?Q?Lcpt3cL+Jd5IucOOr1I+cFjJcW+H/lleP2B9gqLmi8EO+JCjZrGiPV+xr76U?=
 =?us-ascii?Q?ISzVNduMp58Zn8G6s8+LASw0A98H1me4ru6V0gg9z9s1h8R9uHvFUxY4xO7y?=
 =?us-ascii?Q?CJ2MDSTxMHApUe3w85CbADcc84QD8gPAhpKiHq7Wy+lIBlauQJN1rJHlSPU2?=
 =?us-ascii?Q?5R8AfluXeYZvs3wykTIgalXJx7I44CIlDF/V6d4Xjf/2TSq4SfyWcazL0i6g?=
 =?us-ascii?Q?R0KDwooSJjwLGVCbVR6+7L0SATtb9O4Wfg2/aB0zhjYzypcDYJB5/nGN4eqK?=
 =?us-ascii?Q?fActRFHGPhqRfR2BipBH+WWuvPRwysBlV/KaVxaCT5UuYjI+CpWDZDzkauhB?=
 =?us-ascii?Q?WKhLcgL0VLl6RR1EVb73h9VJRmxY8qkzmQryz3HnmVg5ok9m0S3UB1pE7JhR?=
 =?us-ascii?Q?/sY8buQeAidvRfeA5+U2Nzuh6nPMFcvb3+oNrWjSkndz7dEWVf2v3xKXnrUr?=
 =?us-ascii?Q?aV5zOi68P3z6o9UF9DmbT4lQEFsVX9GI/SCUiPjS1MP8I9/v7KrvaXzM6jSE?=
 =?us-ascii?Q?uNytbtAlbuJMEsCBPDngboQpVhsWv1tKoiu+vgvwVX3XKe+Iuk4PbZ/d2T4W?=
 =?us-ascii?Q?PKWiWZuDGeqfstEs+dNjqd26YRsknoNzbvS+U3nlCuzzMgeWcMh6S1IdhvqN?=
 =?us-ascii?Q?BzxA9ko5stQRuEL0h9g=3D?=
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4902.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7df7c255-9f3e-41b6-569c-08db8ccfed7d
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Jul 2023 05:28:07.2985
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 5nj+EZI+H74i07hV4+4AB/JVEQaQn33XiQ75GlBe7GZfsOXbaWqB3y9Eo8BHJC/Ywh2ZvAZr11/5kr/np2LpLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR12MB5993
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

[AMD Official Use Only - General]

> -----Original Message-----
> From: Conor Dooley <conor@kernel.org>
> Sent: Tuesday, July 25, 2023 12:18 AM
> To: Datta, Shubhrajyoti <shubhrajyoti.datta@amd.com>
> Cc: devicetree@vger.kernel.org; git (AMD-Xilinx) <git@amd.com>; linux-
> clk@vger.kernel.org; Simek, Michal <michal.simek@amd.com>;
> conor+dt@kernel.org; krzysztof.kozlowski+dt@linaro.org;
> robh+dt@kernel.org; sboyd@kernel.org; mturquette@baylibre.com
> Subject: Re: [PATCH v3] dt-bindings: clock: versal: Convert the xlnx,zynq=
mp-
> clk.txt to yaml
>
> On Mon, Jul 24, 2023 at 04:48:43PM +0530, Shubhrajyoti Datta wrote:
> > Convert the xlnx,zynqmp-clk.txt to yaml.
> > versal-clk.yaml already exists that's why ZynqMP is converted and
> > merged.
> >
> > Signed-off-by: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>
> >
> > ---
> >
> > Changes in v3:
> > Update the min and maxitems
> >
> > Changes in v2:
> > add enum in compatible
> > fix the description
> > add constraints for clocks
> > name the clock-controller1 to clock-controller
> >
> >  .../bindings/clock/xlnx,versal-clk.yaml       | 78 ++++++++++++++++---
> >  .../bindings/clock/xlnx,zynqmp-clk.txt        | 63 ---------------
> >  2 files changed, 69 insertions(+), 72 deletions(-)  delete mode
> > 100644 Documentation/devicetree/bindings/clock/xlnx,zynqmp-clk.txt
> >
> > diff --git
> > a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> > b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> > index e9cf747bf89b..deebbfd084e8 100644
> > --- a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> > +++ b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
> > @@ -19,7 +19,9 @@ select: false
> >  properties:
> >    compatible:
> >      oneOf:
> > -      - const: xlnx,versal-clk
> > +      - enum:
> > +          - xlnx,versal-clk
> > +          - xlnx,zynqmp-clk
> >        - items:
> >            - enum:
> >                - xlnx,versal-net-clk
> > @@ -31,16 +33,12 @@ properties:
> >    clocks:
> >      description: List of clock specifiers which are external input
> >        clocks to the given clock controller.
> > -    items:
> > -      - description: reference clock
> > -      - description: alternate reference clock
> > -      - description: alternate reference clock for programmable logic
> > +    minItems: 3
> > +    maxItems: 7
>
> This doesn't seem right to me. The original binding requires 5 clock inpu=
ts,
> but this will relax it such that only three are needed, no?
> You'll need to set constraints on a per compatible basis.
>
Does below look good.

diff --git a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml b=
/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
index e9cf747bf89b..89b8d592a6d4 100644
--- a/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
+++ b/Documentation/devicetree/bindings/clock/xlnx,versal-clk.yaml
@@ -19,7 +19,9 @@ select: false
 properties:
   compatible:
     oneOf:
-      - const: xlnx,versal-clk
+      - enum:
+          - xlnx,versal-clk
+          - xlnx,zynqmp-clk
       - items:
           - enum:
               - xlnx,versal-net-clk
@@ -31,16 +33,12 @@ properties:
   clocks:
     description: List of clock specifiers which are external input
       clocks to the given clock controller.
-    items:
-      - description: reference clock
-      - description: alternate reference clock
-      - description: alternate reference clock for programmable logic
+    minItems: 3
+    maxItems: 7

   clock-names:
-    items:
-      - const: ref
-      - const: alt_ref
-      - const: pl_alt_ref
+    minItems: 3
+    maxItems: 7

 required:
   - compatible
@@ -50,6 +48,61 @@ required:

 additionalProperties: false

+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - xlnx,versal-clk
+
+    then:
+      properties:
+        clocks:
+          items:
+            - description: reference clock
+            - description: alternate reference clock
+            - description: alternate reference clock for programmable logi=
c
+
+        clock-names:
+          items:
+            - const: ref
+            - const: alt_ref
+            - const: pl_alt_ref
+
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - xlnx,zynqmp-clk
+
+    then:
+      properties:
+        clocks:
+          minItems: 5
+          items:
+            - description: PS reference clock
+            - description: reference clock for video system
+            - description: alternative PS reference clock
+            - description: auxiliary reference clock
+            - description: transceiver reference clock
+            - description: (E)MIO clock source  (Optional clock)
+            - description: GEM emio clock  (Optional clock)
+            - description: Watchdog external clock (Optional clock)
+
+        clock-names:
+          minItems: 5
+          items:
+            - const: pss_ref_clk
+            - const: video_clk
+            - const: pss_alt_ref_clk
+            - const: aux_ref_clk
+            - const: gt_crx_ref_clk
+            - pattern: "^mio_clk[00-77]+.*$"
+            - pattern: "gem[0-3]+_emio_clk.*$"
+            - pattern: "swdt[0-1]+_ext_clk.*$"
+
 examples:
   - |
     firmware {
@@ -64,4 +117,13 @@ examples:
         };
       };
     };
+
+    clock-controller {
+        #clock-cells =3D <1>;
+        compatible =3D "xlnx,zynqmp-clk";
+        clocks =3D <&pss_ref_clk>, <&video_clk>, <&pss_alt_ref_clk>,
+                 <&aux_ref_clk>, <&gt_crx_ref_clk>;
+        clock-names =3D "pss_ref_clk", "video_clk", "pss_alt_ref_clk",
+                      "aux_ref_clk", "gt_crx_ref_clk";
+    };
