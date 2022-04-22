Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA0AAC433EF
	for <linux-clk@archiver.kernel.org>; Fri, 22 Apr 2022 07:18:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1444631AbiDVHVO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 22 Apr 2022 03:21:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41264 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1444651AbiDVHVN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 22 Apr 2022 03:21:13 -0400
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9450550E34
        for <linux-clk@vger.kernel.org>; Fri, 22 Apr 2022 00:18:21 -0700 (PDT)
Received: from pps.filterd (m0167089.ppops.net [127.0.0.1])
        by mx0a-00128a01.pphosted.com (8.17.1.5/8.17.1.5) with ESMTP id 23M6Jdca003087;
        Fri, 22 Apr 2022 03:18:18 -0400
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2102.outbound.protection.outlook.com [104.47.55.102])
        by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 3fftq3tyu6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 22 Apr 2022 03:18:18 -0400
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bu7tkoX9hI/qmYGOnULj6vd+ewCARIkL1wco0mQtgcKxAkfRFDafonxqcEC2rGxG/J24r0dvNhUEPhl3a++XUuxFLX7TtL/5QUTN6lrgtivOjF/BEidMBdpFngh5miqaUubvFme3vqmxzC6Lsu+Nd+tWlT2xjshb0Dbh11OEea+xSa9lLLZMKooLKIOZ1vNhV+qg87M0qnVxa1CCIsrXFP8Wo4U42Ic0eqxjw/4SJJfuFxwWp30iAZnp4ZqIVkrH2Sp5vYCfBSEgskypdvZbgNTiiliGrPa8fJUTwD2gNOyc5/owV5XLVmTlowPq0Jyqmfry80gQ6BnG+/maXTWppw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=af7W3d0fNfDtX3dvbkkDXKtu7//OlfzRiJkNhi0TYDM=;
 b=Yl70gjbJG5cjlGOlAMuYEZn//HfP7jY0se65z1mRKYafWh3NW2UOM3VMIuYEpWBuamE1dJbNCdT7qRuXgIxFDRh/wNwGN9SG85c6xUOlw20xGYxouOdq0y1P9eL1ID1fZzCzLUpFF50fn66PZr46fjj+XiFV4+zhkLForTJk+RnUpDL6kvK4s6UXAoGz1FXdIckdKS6yJS5ZAhUPbw5IQkRUaFyUWqrg1SmR53vj1cb5hx3yR6/ASL6F8hqtod4vNHfuxQCbey8rcLLkd3LFAZZMUfm35znzEuyXKovd8MLLDukdpn9KQJNZsZBqh3AP0X4OBCvko4M0g/G9lkV4Aw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=analog.com; dmarc=pass action=none header.from=analog.com;
 dkim=pass header.d=analog.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=analog.onmicrosoft.com; s=selector2-analog-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=af7W3d0fNfDtX3dvbkkDXKtu7//OlfzRiJkNhi0TYDM=;
 b=oqtCLwA6+ajTUMYQjCRFYDPlcvQM3VkidnQrhH7G1WnXQT+hOuYDQ7UHHUIgHXeUEAXj8UZ5MJPHmQ38/zfcdxwOaZKyBkE7v/o6EBZxQgJT0O9uiIsGC+F6K2ywvou/hSOxjHQPXdi0Awl6QuUw5v7O4XB5Dl+9Qk4hluMp8sc=
Received: from PH0PR03MB6786.namprd03.prod.outlook.com (2603:10b6:510:122::7)
 by BYAPR03MB4357.namprd03.prod.outlook.com (2603:10b6:a03:ca::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.13; Fri, 22 Apr
 2022 07:18:16 +0000
Received: from PH0PR03MB6786.namprd03.prod.outlook.com
 ([fe80::a97e:a520:c3a6:d2ae]) by PH0PR03MB6786.namprd03.prod.outlook.com
 ([fe80::a97e:a520:c3a6:d2ae%9]) with mapi id 15.20.5186.015; Fri, 22 Apr 2022
 07:18:16 +0000
From:   "Sa, Nuno" <Nuno.Sa@analog.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        "linux-clk@vger.kernel.org" <linux-clk@vger.kernel.org>
CC:     Michael Turquette <mturquette@baylibre.com>
Subject: RE: [RFC PATCH 1/4] clk: clk-conf: properly release of nodes
Thread-Topic: [RFC PATCH 1/4] clk: clk-conf: properly release of nodes
Thread-Index: AQHYVbohLd0ieG3TGEyMPwPMewG326z7hn5Q
Date:   Fri, 22 Apr 2022 07:18:16 +0000
Message-ID: <PH0PR03MB6786418E3B09D3F965EEFEE999F79@PH0PR03MB6786.namprd03.prod.outlook.com>
References: <20220407133036.213217-1-nuno.sa@analog.com>
 <20220407133036.213217-2-nuno.sa@analog.com>
 <20220421195802.2127DC385A1@smtp.kernel.org>
In-Reply-To: <20220421195802.2127DC385A1@smtp.kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-dg-ref: =?utf-8?B?UEcxbGRHRStQR0YwSUc1dFBTSmliMlI1TG5SNGRDSWdjRDBpWXpwY2RYTmxj?=
 =?utf-8?B?bk5jYm5OaFhHRndjR1JoZEdGY2NtOWhiV2x1WjF3d09XUTRORGxpTmkwek1t?=
 =?utf-8?B?UXpMVFJoTkRBdE9EVmxaUzAyWWpnMFltRXlPV1V6TldKY2JYTm5jMXh0YzJj?=
 =?utf-8?B?dE5XWXlPR0pqTVdRdFl6SXdZeTB4TVdWakxUaGlaVEl0WlRSaU9UZGhOMk5q?=
 =?utf-8?B?TnpFd1hHRnRaUzEwWlhOMFhEVm1NamhpWXpGbUxXTXlNR010TVRGbFl5MDRZ?=
 =?utf-8?B?bVV5TFdVMFlqazNZVGRqWXpjeE1HSnZaSGt1ZEhoMElpQnplajBpTVRBd05p?=
 =?utf-8?B?SWdkRDBpTVRNeU9UVXdPRFUwT1RRek56STNNVGsxSWlCb1BTSk5ja2N2T0RJ?=
 =?utf-8?B?eFFrRjVlRFZQYUZkMFl5dDBTVkZGV0VOelVGVTlJaUJwWkQwaUlpQmliRDBp?=
 =?utf-8?B?TUNJZ1ltODlJakVpSUdOcFBTSmpRVUZCUVVWU1NGVXhVbE5TVlVaT1EyZFZR?=
 =?utf-8?B?VUZGYjBOQlFVSmlXRzlGYUVkV1lsbEJWR2xCVEVWTWVHSjBWa1JQU1VGelVY?=
 =?utf-8?B?WkdkVEZWVFVSQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCU0VG?=
 =?utf-8?B?QlFVRkVZVUZSUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJSVUZC?=
 =?utf-8?B?VVVGQ1FVRkJRVlpKUlhadlVVRkJRVUZCUVVGQlFVRkJRVUZCUVVvMFFVRkJR?=
 =?utf-8?B?bWhCUjFGQllWRkNaa0ZJVFVGYVVVSnFRVWhWUVdOblFteEJSamhCWTBGQ2VV?=
 =?utf-8?B?RkhPRUZoWjBKc1FVZE5RV1JCUW5wQlJqaEJXbWRDYUVGSGQwRmpkMEpzUVVZ?=
 =?utf-8?B?NFFWcG5RblpCU0UxQllWRkNNRUZIYTBGa1owSnNRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkZRVUZCUVVGQlFVRkJRV2RCUVVG?=
 =?utf-8?B?QlFVRnVaMEZCUVVkRlFWcEJRbkJCUmpoQlkzZENiRUZIVFVGa1VVSjVRVWRW?=
 =?utf-8?B?UVZoM1FuZEJTRWxCWW5kQ2NVRkhWVUZaZDBJd1FVaE5RVmgzUWpCQlIydEJX?=
 =?utf-8?B?bEZDZVVGRVJVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCVVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVOQlFVRkJRVUZEWlVGQlFVRlpVVUpyUVVkclFWaDNRbnBCUjFWQldY?=
 =?utf-8?B?ZENNVUZJU1VGYVVVSm1RVWhCUVdOblFuWkJSMjlCV2xGQ2FrRklVVUZqZDBK?=
 =?utf-8?B?bVFVaFJRV0ZSUW14QlNFbEJUV2RCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZC?=
 =?utf-8?B?UVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJR?=
 =?utf-8?B?VUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFV?=
 =?utf-8?B?RkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVGQlFVRkJRVUZCUVVG?=
 =?utf-8?B?QlFrRkJRVUZCUVVGQlFVRkpRVUZCUVVGQlFUMDlJaTgrUEM5dFpYUmhQZz09?=
x-dg-rorf: true
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: f701ba6b-1aa0-4c92-f9e3-08da24304539
x-ms-traffictypediagnostic: BYAPR03MB4357:EE_
x-microsoft-antispam-prvs: <BYAPR03MB4357C067C75EF5F747E1181099F79@BYAPR03MB4357.namprd03.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: dYNx5855EqN7bWvKPOIqPuwu4NlTSp4OjSzm03uyRVGg10e+nK7WOfj2PcmvoZ2oPCFPzehkQlFYBoxOZXVEqBZ+m+0UQ/bR3t72BWiJ27NAiudm4Re+KYtjwg/ww9pkKJjNtzzqBQnvtAg+rCrYTdYdyn6TzUs2dhbroiGkjlBOBw2i89X0YaJrUr8opuECwoBYzbumV6pUER730idfYIcGAk/thOpIMm7YdjRXmbLYpNaItkF8EmtKQzipqkoHyid4qzevXLbnBIhDjD1TBeH12rwlRM7hP19KiXpch1wdiM0aI1NgOqFDzWv4XUY6MKw0uMANQOAk/elukBIXr4McfBnU8O1KE8AcWMIZVdcRMjGJVSWBjDJsjkC9L1s008u/CG/wHgCPVxixKKrERzFABGO7pld+L8dtU84ZCxqaMCM5ozOQ2t3rTcQKk59BMnVxdeBTuEuEXS2Fh7MZkgmaYAofjq5l5MMSO8aTCfwlg1YxYTEFuO+wR8kys27trBRxWDesgrV5zIOQsueWIy8nstEyssk0SbcVxnB5/K/Kb6xSeqzESzq67oJuBsCMCqDZ0FP4EblybSJsGZr61kUXTl2q4+P1Y0cV2QOgDktB2PWLH5HQbUDLdoVs4AvMsnkpwkf1RNUY6MQqEVxipiKgDOi/BsVakcfXqjWgVc4UnZcGCBsttyAeOpx+c/JakHx7Wl2EeI86SiC4RnZOLw==
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR03MB6786.namprd03.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230001)(4636009)(366004)(52536014)(8676002)(86362001)(508600001)(5660300002)(38070700005)(7696005)(26005)(8936002)(38100700002)(71200400001)(66946007)(64756008)(110136005)(66446008)(66476007)(76116006)(66556008)(316002)(83380400001)(4326008)(4744005)(9686003)(53546011)(33656002)(122000001)(186003)(2906002)(55016003)(6506007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NSs3TFloQll4S2Uzck9lS3JhWDFvVWpESmxoOTJyK3cxdkxLa3VEeWJVSGI4?=
 =?utf-8?B?TGtqdlM0TldDVGpiRGJ0bmlYT0pMMDlWd1JSWVZ4b3dZRHFYVUdROEZLdVRK?=
 =?utf-8?B?Yk4rMDEwQ0lMMUVEVnBhTXh3UGsyZnoyWjJ1QUtxc3ZVQzB4Z041UEpWbXE5?=
 =?utf-8?B?NnZudENMNzBULyt5YWRUUzFCQ0F2SHFkVm91b3BwazlmV2hPbWkvZnJROTdJ?=
 =?utf-8?B?RWh5UmZWdDZ5VlIzYmdQTXhJeXBCcHp6MmJhQko4UTJFWXd5S2libWovVU9q?=
 =?utf-8?B?eFR6TGpqVDNSOWJ1YXI0eU9JQVNqZmNBalJDY2lBbjg3ekRldjBmbUNtbjFQ?=
 =?utf-8?B?b2RabW4xVTN0Z3BPUkwzUmhrQ2V4UkQ3QnV5L0g2cFRvVFBROFd3Z1kybnNQ?=
 =?utf-8?B?MzBNNEIwNDJQZUNjK2hmTXNHVGlwU0lUc3VyU2RWR2ZPTlFvSE1RbE5QZjQ1?=
 =?utf-8?B?OGtqMGlhaER2R3lUVnd6WTBDV2tWL3ZUQlREaHp3L3c3a0hiaW1EU01xU05T?=
 =?utf-8?B?NmhWMERUUXN0aFdxbWZ0anRsOU4rdStlVlI4aTdTeityaURsL2Y4SHNJYis4?=
 =?utf-8?B?Z2xCd2xZejViOWZ2d2g2YWZuNTU4WEtRcEtRajBoSmVpZnIwSmJNNHdLdkZi?=
 =?utf-8?B?bHZrWHY2S0VYaHcxcFJzcE5MSjhpUDBSd0ZFemRaK1BYdEltcUdaSXQxaDZP?=
 =?utf-8?B?bUh3TkZDQUh4U1p2V25haExwK0RHVVcwTU1XN0RQemtsM1JYYTN0ZmU2aUc5?=
 =?utf-8?B?T1ZtcFRJcUdRNW4wMG1mcExwSHh2Rmh6WVFaM05lZTZvMTMxekpReTR2TXNz?=
 =?utf-8?B?cFdXYWo3UElEdzNpRkR0VE9pZE1ON1FiZFNkMm5wa2hyekZkWTFIR3BEc0FK?=
 =?utf-8?B?cUpFTVh2eUJqTkRjNGVMOWlMWEhidU1xbXdKdEhIQ1FsbWx5bzRoTG9tOWNq?=
 =?utf-8?B?NjdjRUFYQmJpQ3h4N091MGg0dHcrYm82OS9MOW1ubmh5bmUvT21FaUtRTXlq?=
 =?utf-8?B?emVnOFdMRTBhcnNsTUVQUWNFMGZseEJkT2thY21MUVJLSkdYVWpYczNVdXB5?=
 =?utf-8?B?R0dwYmw5ZnR4QzJEdDgzeXN5REFvRk9OZnVONWFWQ25VMGlLaDBocCtUVmRp?=
 =?utf-8?B?S0pzS1hqazV5Q1hLUHUyQWpaY3Rqc000SmN2RTVualhDZjV1VFEvRGR0eWpp?=
 =?utf-8?B?RHB5Y2NOUXc0QjhuQnlZVjBjRXdmbXFReTAxTXRvYnVWUmEzdUxXTFFoR3JY?=
 =?utf-8?B?MTA4OFd4b0MvZDZwK0x3MWZwOWdGMW0vWUhITzQ4NmpaN1NncjZIU3dWZDlr?=
 =?utf-8?B?RWhRbmNTeWhBaTJZRnFZNzMwYjJEcUhtQlFqby84NGQ0NEVXaGd6N2VxdEpU?=
 =?utf-8?B?Mm01b2Rib1B1YllTYVJKa3dxbzd2R0dLd1VsTERITWNMMnZBS0k0Tk8raW96?=
 =?utf-8?B?M0NkUUc2UkJBT2p2YVliRERVSGpuNVgvRWozY3E1dzE3NGZtQ3VSQmd5Yzl3?=
 =?utf-8?B?N3BPYlAvSVJRNG5TZWswc2RraVoralBSQnJZYjFIUk8ybFUyYmxzZi8xaVZY?=
 =?utf-8?B?T1FoS0F4QmtrMGZJV1dwR0JMRTd0aHVwaGRnb2tFTWt1bkZXTnJKbEVIYk5s?=
 =?utf-8?B?a0J4d2FaRFZaTE1MNHV5WEwzb25ha1MrN1M3c09ZdTdyWVVKQ3FTWFBtZS9p?=
 =?utf-8?B?dit2OTZhRldoeXgzRnN2TnJlWkxGb0V3eTdtTXNhLzZUeEZtYjJVV2pQbk9u?=
 =?utf-8?B?KzBXczEvSXNDSU15cmY3Q0UyNlJURlVHK0hScitTREN2ZThTdDkvYTlvbXpq?=
 =?utf-8?B?UEFlbHVLRGZweEZDY2t1QkROSk8rYmJQOUI4N2J5OXBOMnJZcEdBc1lOdW5t?=
 =?utf-8?B?VkxUdyt4NG1IT2xpVElhbUZiZjBTQkFRUHZEYU0zV3ltZ0RBM2kzRkxlUGRJ?=
 =?utf-8?B?bjAzaVVGRGRSWC9TZEdaMkRJRGlPSWxaZHdTUU1wS1RSUEtOWWhRbnMzTFhm?=
 =?utf-8?B?ajU5YlRHMTZpZ01VRFhaRjUyckpwbysrNllEZ3VLa1BtWldNUFc3M2QvS2xR?=
 =?utf-8?B?WWo1KzRncFpKRU5wVktXaXBoSU1hR25aemNjMHRZTHVYT3l4L2Q5OWI3WlE3?=
 =?utf-8?B?Z1VHbDFGcUtjenpJZW8vRWljMGJTWUQxWHpVV3lVb2cxTHpTTTYxb1B2MGd2?=
 =?utf-8?B?Z054Qm5qU3BDblpTMG1jczMxQ09sSkRSTnd4NHVEYXdPeW52MGRuRXBwSllk?=
 =?utf-8?B?ZElGTG1VQTA2OExZSStXcFovZ1lFa1NSTmFaUmFLQzNkNndzdnM2TzEyQ0pK?=
 =?utf-8?B?aXpNOFA4amUxQ1VQbnA1MUpWRVFZcW53Y0pSWlBjOXR6a3cyUlRKZz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: analog.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR03MB6786.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f701ba6b-1aa0-4c92-f9e3-08da24304539
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Apr 2022 07:18:16.4491
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: eaa689b4-8f87-40e0-9c6f-7228de4d754a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Rbb8VpSaHYEQhWwWFbkPH3Mt5TTQfAraJmo4yNmvrTjrNEHk3YjeUfjbkpQH9pgME+qr0pDAGoy0jhLvnn4ljA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BYAPR03MB4357
X-Proofpoint-GUID: l1FEju3tWWVjz_Akgm_T25Yooee1ymiN
X-Proofpoint-ORIG-GUID: l1FEju3tWWVjz_Akgm_T25Yooee1ymiN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.205,Aquarius:18.0.858,Hydra:6.0.486,FMLib:17.11.64.514
 definitions=2022-04-22_02,2022-04-21_01,2022-02-23_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 mlxlogscore=871 lowpriorityscore=0 impostorscore=0
 spamscore=0 malwarescore=0 suspectscore=0 mlxscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2202240000 definitions=main-2204220032
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogU3RlcGhlbiBCb3lkIDxz
Ym95ZEBrZXJuZWwub3JnPg0KPiBTZW50OiBUaHVyc2RheSwgQXByaWwgMjEsIDIwMjIgOTo1OCBQ
TQ0KPiBUbzogU2EsIE51bm8gPE51bm8uU2FAYW5hbG9nLmNvbT47IGxpbnV4LWNsa0B2Z2VyLmtl
cm5lbC5vcmcNCj4gQ2M6IE1pY2hhZWwgVHVycXVldHRlIDxtdHVycXVldHRlQGJheWxpYnJlLmNv
bT4NCj4gU3ViamVjdDogUmU6IFtSRkMgUEFUQ0ggMS80XSBjbGs6IGNsay1jb25mOiBwcm9wZXJs
eSByZWxlYXNlIG9mIG5vZGVzDQo+IA0KPiBbRXh0ZXJuYWxdDQo+IA0KPiBRdW90aW5nIE51bm8g
U8OhICgyMDIyLTA0LTA3IDA2OjMwOjMzKQ0KPiA+IFdlIG5lZWQgdG8gY2FsbCAnb2Zfbm9kZV9w
dXQoKScgd2hlbiB3ZSBhcmUgZG9uZSB3aXRoIHRoZSBub2RlIG9yDQo+IG9uDQo+ID4gZXJyb3Ig
cGF0aHMuIE90aGVyd2lzZSB0aGlzIGNhbiBsZWFrIG1lbW9yeSBpbiBEWU5BTUlDX09GIHNldHVw
cy4NCj4gPg0KPiA+IEZpeGVzOiA4NmJlNDA4YmZiZDggKCJjbGs6IFN1cHBvcnQgZm9yIGNsb2Nr
IHBhcmVudHMgYW5kIHJhdGVzDQo+IGFzc2lnbmVkIGZyb20gZGV2aWNlIHRyZWUiKQ0KPiA+IFNp
Z25lZC1vZmYtYnk6IE51bm8gU8OhIDxudW5vLnNhQGFuYWxvZy5jb20+DQo+ID4gKGNoZXJyeSBw
aWNrZWQgZnJvbSBjb21taXQNCj4gNjllYjQ3YTI2ZTdmNzI4YTVjMDUyNjg3MzgwOTkzY2Q5YTBk
ZDY0MykNCj4gDQo+IFRoaXMgbGluZSBzaG91bGQgYmUgcmVtb3ZlZC4NCj4gDQoNClllcywgSSBr
bm93IDopLiBJIFdhcyBqdXN0IHdhaXRpbmcgZm9yIHRoZSByZXZpZXcuIFNvbWVob3cgSSBtZXNz
ZWQNCnVwIHdoZW4gcHJlcGFyaW5nIHRoZSBwYXRjaGVzIHRvIHN1Ym1pdC4uLg0KDQotIE51bm8g
U8OhDQoNCg==
