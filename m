Return-Path: <SRS0=IP4j=YD=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.6 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2308C47404
	for <linux-clk@archiver.kernel.org>; Thu, 10 Oct 2019 00:54:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B5FD6206C0
	for <linux-clk@archiver.kernel.org>; Thu, 10 Oct 2019 00:54:27 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=ucr.edu header.i=@ucr.edu header.b="JcVwVZDj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732219AbfJJAy1 (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 9 Oct 2019 20:54:27 -0400
Received: from mx6.ucr.edu ([138.23.62.71]:25695 "EHLO mx6.ucr.edu"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1731134AbfJJAy1 (ORCPT <rfc822;linux-clk@vger.kernel.org>);
        Wed, 9 Oct 2019 20:54:27 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple;
  d=ucr.edu; i=@ucr.edu; q=dns/txt; s=selector3;
  t=1570668867; x=1602204867;
  h=mime-version:from:date:message-id:subject:to;
  bh=CvhoDmZeQv6rXDGqQHMAsw6y7CswFv+lDA2qhhTWvao=;
  b=JcVwVZDjxO+01eeXVitAe9duCG3AbAy3XNjy3y67xNBIpgk3I8XG9h2U
   wBkhWxbdFTYLy/dS/NIGNLFwQhZ5aX96xHLwal8/M+ubCzEshVaxhkm0b
   zC3nqwUwe8KC6yufwtEjPtqBm8CB/yrll6r6Oz5xe80thnXt/OmZmLcEo
   l5mu5uS6DHKkePbL+2uYuriX5ceiKVInnxGVp9xl7lIJh6iXvzNIzGehT
   0tFIkTq5ychNqohqzOQjxo+02ecnHkQzu/y7jLshhb1E4p12CzDlzdGxT
   aWvTDf8FQhk5krhjfMB/BvkIrg5hcTm/UfwgfPh3yCAwPhJX0YcTvgIgJ
   w==;
IronPort-SDR: gjVFoBabMHuKWF8r4q1itJ4GhZFXVjQkMMID8jBdvbOdMYlLzPdKne7agqCkb4pnSEM6UDzXly
 ErO/O2kzOyqXDAJsWtvjSrDKIaXHREyxMkloU7Uh6pZoKs+AFR5N6e+D60pYmNiGXXHDpMm13c
 3VGKtKQ9Sb5Hlya43ktkETYkuZFsnGco8k67HrAIIBOcbVaptYfCK39YSIJWv7eoW2p2Qx4ciW
 +Ptpwxjob8ij4EO5SInX4ZsqXf8fRm0hJv6cNd+hwzsDJAQhd+VdryvzwqEBO5k1HImHo4PiqU
 ZD8=
IronPort-PHdr: =?us-ascii?q?9a23=3Ak2rdlRRKm9DrhlKN32Os4mpcVtpsv+yvbD5Q0Y?=
 =?us-ascii?q?Iujvd0So/mwa6zZh2N2/xhgRfzUJnB7Loc0qyK6vumBzZLusfJmUtBWaQEbw?=
 =?us-ascii?q?UCh8QSkl5oK+++Imq/EsTXaTcnFt9JTl5v8iLzG0FUHMHjew+a+SXqvnYdFR?=
 =?us-ascii?q?rlKAV6OPn+FJLMgMSrzeCy/IDYbxlViDanbr5+MRu7oR/Qu8UIjodvJKI8wQ?=
 =?us-ascii?q?bVr3VVfOhb2XlmLk+JkRbm4cew8p9j8yBOtP8k6sVNT6b0cbkmQLJBFDgpPH?=
 =?us-ascii?q?w768PttRnYUAuA/WAcXXkMkhpJGAfK8hf3VYrsvyTgt+p93C6aPdDqTb0xRD?=
 =?us-ascii?q?+v4btnRAPuhSwaLDMy7n3ZhdJsg6JauBKhpgJww4jIYIGOKfFyerrRcc4GSW?=
 =?us-ascii?q?ZdW8pcUTFKDIGhYIsVF+cOMuZWoYf+qVUTsxWxGRKhBP/zxjJSmnP6wbE23u?=
 =?us-ascii?q?YnHArb3AIgBdUOsHHModr3NacTUOC1zLTPzT7ebPxW2S3y6InVeR0mofCNXL?=
 =?us-ascii?q?JwftDQyUUzCw/IgE6dqZH5MDOPzOgCrXWU7/d5WO+plmUpqBlxryCxysswjo?=
 =?us-ascii?q?TFnIEYx1De+SlkwYs4J8e0RU9/bNOiDZBerTuVN5FsTcMnW2xovSE6xaAYtp?=
 =?us-ascii?q?OjZygKzYgnxwbYa/yab4iE+hLjW/iVITd/nH9lfaiwhxe28US5zu38WNS43E?=
 =?us-ascii?q?9EridEltTArH8N1xvU6siITvty4F2t1iqI1wDW8u1EIEY0mrTHK5M53LI8ip?=
 =?us-ascii?q?4evV7AEyL2gkn6ka6be0c+9uWp7+nrerDmqYWdN49whAH+KKMumsmnDOU4Mw?=
 =?us-ascii?q?kOX3KU+eWg2LH/80D0W6hKgeEskqXDrp/VONkbqrajAwBJyoYj9wq/DzC+3d?=
 =?us-ascii?q?QcnHkHKk9FeR2eg4f1P1HOI+v1Demwg1uyijdn3fPGMaP7ApXLMHfDlK3tfb?=
 =?us-ascii?q?Fn605Tm0IPyoV65plUA7wFaM7uQFbsucDEA1dtNhCp2f/6Bclh26sUUHOLA6?=
 =?us-ascii?q?WDPeXZtlreoqoUP+SUZIIT8Bz6OvRts+Xkim41sVwQZ6+k2d0Qcn/uWrxiIk?=
 =?us-ascii?q?OEcT/nhtQpD2gHpEw9QfbshVnEViRcIz62XqQh9nQ4BZigAIPrWI+gmvqC0T?=
 =?us-ascii?q?29E5kQYXpJThi+EXb5aoPMYvYFbmrGMM9ggyECTJCqUMk83gvouQPnnf4vBe?=
 =?us-ascii?q?rZ/CIJqNrY0956r7nYjhY0+hR/FIKA2HvLQm1pyDAmXTgziZF+s0xgzR+x0a?=
 =?us-ascii?q?F5y6hJB9xa5qsRCS8nPoSawuBnXYOhEjndd8uEHQ71Cu6tBis8G5dom4cD?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2HdAgD+f55dh0WnVdFmDoIzhBGETY5?=
 =?us-ascii?q?chRcBmB0BCAEBAQ4vAQGHEiM3Bg4CAwkBAQUBAQEBAQUEAQECEAEBAQgNCQg?=
 =?us-ascii?q?phUCCOikBg1URfAMMAiYCJBIBBQEiATSDAIJ4BaRZgQM8iyaBMohjAQkNgUg?=
 =?us-ascii?q?SeiiMDoIXhGGHUoJeBIE5AQEBlS+WVwEGAoIQFAOMUYhFG4IqlxaOLZlPDyO?=
 =?us-ascii?q?BRYF8MxolfwZngU9PEBSBaY1xWySRSwEB?=
X-IPAS-Result: =?us-ascii?q?A2HdAgD+f55dh0WnVdFmDoIzhBGETY5chRcBmB0BCAEBA?=
 =?us-ascii?q?Q4vAQGHEiM3Bg4CAwkBAQUBAQEBAQUEAQECEAEBAQgNCQgphUCCOikBg1URf?=
 =?us-ascii?q?AMMAiYCJBIBBQEiATSDAIJ4BaRZgQM8iyaBMohjAQkNgUgSeiiMDoIXhGGHU?=
 =?us-ascii?q?oJeBIE5AQEBlS+WVwEGAoIQFAOMUYhFG4IqlxaOLZlPDyOBRYF8MxolfwZng?=
 =?us-ascii?q?U9PEBSBaY1xWySRSwEB?=
X-IronPort-AV: E=Sophos;i="5.67,278,1566889200"; 
   d="scan'208";a="81352652"
Received: from mail-lf1-f69.google.com ([209.85.167.69])
  by smtpmx6.ucr.edu with ESMTP/TLS/ECDHE-RSA-AES128-GCM-SHA256; 09 Oct 2019 17:54:26 -0700
Received: by mail-lf1-f69.google.com with SMTP id c83so987811lfg.8
        for <linux-clk@vger.kernel.org>; Wed, 09 Oct 2019 17:54:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=X6658J+R/8DLtnXNsIQxFC4BQJ5LRBc5J5W674y5UAg=;
        b=PKWO+YV1e0WN1f5K+yVKcOqKn9JKCKj9KgcCpys7TW47y5IjcsA9zBQWS7CiBUdCEM
         tTcsldkoxUNTqI7MCsUdeiiVrK/p4wmVUJZmfwydiIDYLKuEuqAyYNaF6qFc881tSmKw
         ssZJuBvWXI+i/OdIpNz6aGL69j0CDHJ+8qtQxvJxG9JqoqLaXKqUrSSfgYd3XvEdk7N/
         +auWLYXDxb4DOWHRhcQWk5ABp0PojL7E8LJmZkUDipSSiQ1Muquvdj+JFnkL60+cfnqL
         YuXZ3t5VKAbH6qNghVxedI4k0mj59qYc/FeRBGPx+EYISWST7dI6wjqpdBWBuFr3RbmA
         raSA==
X-Gm-Message-State: APjAAAUbgbX8+02UXmLxu5fAYNsOyFIC9OkBI3gqpfT9iv8uvcMg9Lre
        VJwyO0kuTOXSWimbo1FptL7X+xYI4YnTw34/wkgcDeyH3IfBGzMG5oJa9xyoROlRUt8QsvHRUTg
        V6XumZo4sEHtGXY2HVoxAeNtP4MLghRrn9zzYjw==
X-Received: by 2002:a2e:8908:: with SMTP id d8mr4003605lji.197.1570668864408;
        Wed, 09 Oct 2019 17:54:24 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzY65B7icoEC0DZuTwOEdfQUSKAFR9Xy0P1qnaDyFcUTJ44+DnKOYzHIZB7uhU85EAazKb8dNpcntmO+J0d0eo=
X-Received: by 2002:a2e:8908:: with SMTP id d8mr4003596lji.197.1570668864136;
 Wed, 09 Oct 2019 17:54:24 -0700 (PDT)
MIME-Version: 1.0
From:   Yizhuo Zhai <yzhai003@ucr.edu>
Date:   Wed, 9 Oct 2019 17:55:06 -0700
Message-ID: <CABvMjLSomcm5Yi8b8YNgJGkQkc++qdCS_SQvKfmsV0CfS+GLuA@mail.gmail.com>
Subject: Potential uninitialized variable "reg" in clk: axi-clkgen
To:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org, Zhiyun Qian <zhiyunq@cs.ucr.edu>,
        Chengyu Song <csong@cs.ucr.edu>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi All:
drivers/clk/clk-axi-clkgen.c:

Inside function axi_clkgen_recalc_rate(), variable "reg" could be
uninitialized if axi_clkgen_mmcm_read() fails. However, "reg" is used
to decide the control flow later in the if statement, which is
potentially unsafe.

The patch for this case is not easy since the error return is not an
acceptable return value for axi_clkgen_recalc_rate().

-- 
Kind Regards,

Yizhuo Zhai

Computer Science, Graduate Student
University of California, Riverside
