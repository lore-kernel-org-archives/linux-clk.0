Return-Path: <SRS0=BKdB=3B=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB941C33CA7
	for <linux-clk@archiver.kernel.org>; Sun, 12 Jan 2020 00:12:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 79F4620848
	for <linux-clk@archiver.kernel.org>; Sun, 12 Jan 2020 00:12:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731787AbgALAMD (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 11 Jan 2020 19:12:03 -0500
Received: from mail3-bck.iservicesmail.com ([217.130.24.85]:23705 "EHLO
        mail3-bck.iservicesmail.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1731786AbgALAMC (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 11 Jan 2020 19:12:02 -0500
X-Greylist: delayed 303 seconds by postgrey-1.27 at vger.kernel.org; Sat, 11 Jan 2020 19:12:02 EST
IronPort-SDR: 6tmDr9rZO97mynykUnrds8+9Uwdv1pX3XE0mZPyOv9QbbD6DT3MyGuh+CxJnB3MFeR0Iml2o0K
 ZIl/fHLrQb3A==
IronPort-PHdr: =?us-ascii?q?9a23=3ALZpK3h25soDA1fiysmDT+DRfVm0co7zxezQtwd?=
 =?us-ascii?q?8ZseIeLfad9pjvdHbS+e9qxAeQG9mCsLQe1bSd6v+ocFdDyK7JiGoFfp1IWk?=
 =?us-ascii?q?1NouQttCtkPvS4D1bmJuXhdS0wEZcKflZk+3amLRodQ56mNBXdrXKo8DEdBA?=
 =?us-ascii?q?j0OxZrKeTpAI7SiNm82/yv95HJbAhEmTSwbalsIBi3rAjdudQajIl/Iast1x?=
 =?us-ascii?q?XFpWdFdf5Lzm1yP1KTmBj85sa0/JF99ilbpuws+c1dX6jkZqo0VbNXAigoPG?=
 =?us-ascii?q?Az/83rqALMTRCT6XsGU2UZiQRHDg7Y5xznRJjxsy/6tu1g2CmGOMD9UL45VS?=
 =?us-ascii?q?i+46ptVRTkjiALOSMl/27Nj8xxjLtXrQympxxl247UZ5uVO+BifqzDZN8VW2?=
 =?us-ascii?q?xBUt9NWixdHoOzdZcAD+ofMuZdsYb9oUcOoQKgCgmqHe/hzThIhnno0qw6yu?=
 =?us-ascii?q?guDwfG1xEkE98ArHjYsND5OaEPWu630abI1y3OYf1W1zfn9obGcQ0vrv6QUr?=
 =?us-ascii?q?x/asfR1UsiGB/ZglmMtYDpITWY3fkNvWiB6OpgUPqihXQ5pAFtvDev3NonhY?=
 =?us-ascii?q?nOhoITxVDP6CJ0wJ4rKt2kVkF7e9ClEJxWtyGVLIZ2QtgiTHp0tyog1rIGvp?=
 =?us-ascii?q?u7cDIKyJQk3hPSbeGMfYuQ4h/7SuqdPDV1iGh4dL+xmxq+61asx+LmWsS60F?=
 =?us-ascii?q?tHqDdOnMPWuXAXzRPT79CKSv56/ki8xzmCzxvT6uRYIUAskqrbNoIhzqYwlp?=
 =?us-ascii?q?UNtUTDGTf7mEDsg6+XckUk4Pan6+D7brjpvJOcKYh0hRzkPaQgncy/B/o3Ph?=
 =?us-ascii?q?IQUGiA4ei81bvj8lPlQLhSkPE6j6vUvIrHKckVuqK1GRFZ34k55xuxDzqqyN?=
 =?us-ascii?q?EYkmMGLFJBdhKHlY/pO1TWLfDgE/i/n0qjkC1lxvDBOL3hDY7ALnjYkLj6Yb?=
 =?us-ascii?q?lx8VJTyA02zdxF55JUCakNIOjvVU/pqNzYEhg5PhSww+bmDtV9y4wfVXuTDa?=
 =?us-ascii?q?+dM6PfqkGI5u0xLOmWfoMVuyjyK+Ij5/HwiX81g1gdfbOm3chfVHftGvVgPl?=
 =?us-ascii?q?Xcan7vqskOHH1MvQckSuHuzlqYXm1pam62Tp47swk2FI+8RbjEQI/l1KSMwC?=
 =?us-ascii?q?qhAZpQaWBdAFuMEl/ncoyFX7EHbyfEceF7lTlRbbW9RpVp6haou0eu07d7I/?=
 =?us-ascii?q?DL/SsXnZL43tMz7OrW0xExo28nR/+B2n2AGjgn1lgDQCU7ifsn+UE=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2HVAQCcYhpelyMYgtlMGBoBAQEBAQE?=
 =?us-ascii?q?BAQEDAQEBAREBAQECAgEBAQGBaAQBAQEBCwEBGwQBgSmBTVIgEpNQgU0fg0O?=
 =?us-ascii?q?LY4EAgx4VhgcUDIFbDQEBAQEBNQIBAYRATgEXgQ8kNQgOAgMNAQEFAQEBAQE?=
 =?us-ascii?q?FBAEBAhABAQEBAQYYBoVzgh0MHgEEAQEBAQMDAwEBDAGDXQcZDzlKTAEOAVO?=
 =?us-ascii?q?DBIJLAQEznXgBjQQNDQKFHYJIBAqBCYEaI4E2AYwYGoFBP4EjIYIrCAGCAYJ?=
 =?us-ascii?q?/ARIBbIJIglkEjUISIYEHiCmYF4JBBHaJTIwCgjcBD4gBhDEDEIJFD4EJiAO?=
 =?us-ascii?q?EToF9ozdXdAGBHnEzGoImGoEgTxgNiBuOLUCBFhACT4xbgjIBAQ?=
X-IPAS-Result: =?us-ascii?q?A2HVAQCcYhpelyMYgtlMGBoBAQEBAQEBAQEDAQEBAREBA?=
 =?us-ascii?q?QECAgEBAQGBaAQBAQEBCwEBGwQBgSmBTVIgEpNQgU0fg0OLY4EAgx4VhgcUD?=
 =?us-ascii?q?IFbDQEBAQEBNQIBAYRATgEXgQ8kNQgOAgMNAQEFAQEBAQEFBAEBAhABAQEBA?=
 =?us-ascii?q?QYYBoVzgh0MHgEEAQEBAQMDAwEBDAGDXQcZDzlKTAEOAVODBIJLAQEznXgBj?=
 =?us-ascii?q?QQNDQKFHYJIBAqBCYEaI4E2AYwYGoFBP4EjIYIrCAGCAYJ/ARIBbIJIglkEj?=
 =?us-ascii?q?UISIYEHiCmYF4JBBHaJTIwCgjcBD4gBhDEDEIJFD4EJiAOEToF9ozdXdAGBH?=
 =?us-ascii?q?nEzGoImGoEgTxgNiBuOLUCBFhACT4xbgjIBAQ?=
X-IronPort-AV: E=Sophos;i="5.69,423,1571695200"; 
   d="scan'208";a="323039201"
Received: from mailrel04.vodafone.es ([217.130.24.35])
  by mail02.vodafone.es with ESMTP; 12 Jan 2020 01:06:57 +0100
Received: (qmail 8348 invoked from network); 11 Jan 2020 23:46:31 -0000
Received: from unknown (HELO 192.168.1.3) (quesosbelda@[217.217.179.17])
          (envelope-sender <peterwong@hsbc.com.hk>)
          by mailrel04.vodafone.es (qmail-ldap-1.03) with SMTP
          for <linux-clk@vger.kernel.org>; 11 Jan 2020 23:46:31 -0000
Date:   Sun, 12 Jan 2020 00:46:30 +0100 (CET)
From:   Peter Wong <peterwong@hsbc.com.hk>
Reply-To: Peter Wong <peterwonghsbchk@gmail.com>
To:     linux-clk@vger.kernel.org
Message-ID: <25401770.172052.1578786391180.JavaMail.cash@217.130.24.55>
Subject: Investment opportunity
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Greetings,
Please read the attached investment proposal and reply for more details.
Are you interested in loan?
Sincerely: Peter Wong




----------------------------------------------------
This email was sent by the shareware version of Postman Professional.

