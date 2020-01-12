Return-Path: <SRS0=BKdB=3B=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.5 required=3.0 tests=FREEMAIL_REPLYTO_END_DIGIT,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CDB2C33CA2
	for <linux-clk@archiver.kernel.org>; Sun, 12 Jan 2020 14:45:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6E94E214D8
	for <linux-clk@archiver.kernel.org>; Sun, 12 Jan 2020 14:45:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733029AbgALOpm (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sun, 12 Jan 2020 09:45:42 -0500
Received: from mail01.vodafone.es ([217.130.24.71]:55146 "EHLO
        mail01.vodafone.es" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733016AbgALOpl (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sun, 12 Jan 2020 09:45:41 -0500
IronPort-SDR: C/30pLsMjczshRvmoPxdXYoqGQuyxCo2yWzjP9nK7q5qh9SiLQtMEE+NWIgsZHv0XA5inAnhHt
 L3IAz2tvOdMw==
IronPort-PHdr: =?us-ascii?q?9a23=3A61to/heoJ4Pk5lFn9Q9Oz2rolGMj4u6mDksu8p?=
 =?us-ascii?q?Mizoh2WeGdxcSyYB7h7PlgxGXEQZ/co6odzbaP6Oa6BzxLv8nJmUtBWaQEbw?=
 =?us-ascii?q?UCh8QSkl5oK+++Imq/EsTXaTcnFt9JTl5v8iLzG0FUHMHjew+a+SXqvnYdFR?=
 =?us-ascii?q?rlKAV6OPn+FJLMgMSrzeCy/IDYbxlViDanbr5+MRu7oR/PusQXgoZuJac8xx?=
 =?us-ascii?q?nUqXZUZupawn9lK0iOlBjm/Mew+5Bj8yVUu/0/8sNLTLv3caclQ7FGFToqK2?=
 =?us-ascii?q?866tHluhnFVguP+2ATUn4KnRpSAgjK9w/1U5HsuSbnrOV92S2aPcrrTbAoXD?=
 =?us-ascii?q?mp8qlmRAP0hCoBKjU19mbbhNFsg61BpRKgpwVzzpDTYIGPLPp+ebndcskGRW?=
 =?us-ascii?q?VfR8peSSpBDpqgYosTE+oOJ/pXr4njqFsLsxS+AxWsCPrxxT9On3P42qo60+?=
 =?us-ascii?q?I/HgDGxQAvAdQOu2nQoNj7KKseTeW5wa/VxjvBcvxWwy/w5obIfBA7v/+CXq?=
 =?us-ascii?q?9+fsXNxkcgDA7FkledppD5Mz+JyugBrW6W5PdgW+K1jG4nrhl8rCKxyccwlI?=
 =?us-ascii?q?bJnJ8exVDD9SV/z4Y+ONq1SFZlbt64DpRQrS+bN4xwQsMtWGxouD06xaYatp?=
 =?us-ascii?q?KhYCcKz5EnywTfa/yEaoWF5A/oWuWJITpgmn5pZbCyiwyv/UWu1uHwTNe43V?=
 =?us-ascii?q?lQoiZbj9XBtHYA3AHJ5MedUPty5EKh1C6K1wDU9+5LP1g5lbHeK5492r4wkY?=
 =?us-ascii?q?cTsVjbEi/2hkr2iKiWe10h+uey6uTnZq/mqYGYN4NohAzyKLoumsuiDusiPA?=
 =?us-ascii?q?gOWG6b9vqm2LL95k31WLRKjvsonanFqJ3WO9kXq6yjDwNI3Isv9wyzAymp3d?=
 =?us-ascii?q?gCg3ULMVBIdAqCj4fzOlHOJP74De24g1SpiDpr3+7JPqH/DZXXIHnDl7Hhfb?=
 =?us-ascii?q?lm5k5c0wo81sxQ64hIBbEGJfL/QE/xtN/AAh8jLwO02/rnCMl61o4GXWKPA6?=
 =?us-ascii?q?mZML7dsFOR+u0vJ+qMaZQLuDbyNfcl/eTijXwnll8He6mmw58XZGq/HvR8LE?=
 =?us-ascii?q?XKKUbr19MAF3oa+wE6T8T0h1CYFz1efXC/W+Q7/D5oMo++CZb/QdWVjaCMxm?=
 =?us-ascii?q?+EGZtZLjReFQnTQSu4LK2LXv4NbGSZJco3wRIeUr30c4I92Avmiwj8xPIzNu?=
 =?us-ascii?q?fI9zcHspTs/Nhu7eaVnhY3szx3WZfOm1qRRn15yzpbDwQ927py9Bclklo=3D?=
X-IronPort-Anti-Spam-Filtered: true
X-IronPort-Anti-Spam-Result: =?us-ascii?q?A2HhAgBpMBteXdkYgtlNGBoBAQEBAQE?=
 =?us-ascii?q?BAQEDAQEBAREBAQECAgEBAQGBaAQBAQEBCwEBARgBAYEugU1SIBKNOYdkH4F?=
 =?us-ascii?q?KgXmLY4EAggqBFBWGBxQMgVsNAQEBAQEbGgIBAYRATgEXgTM1CA4CAw0BAQU?=
 =?us-ascii?q?BAQEBAQUEAQECAxoWBYV0QgEBBAcBgU0MHgEEAQEBAQMDAwEBDAGDXQcZDzk?=
 =?us-ascii?q?pIUwBDgEET4VPAQEznUMBhASJAA0NAoUdgkUECoEJgRojgTYBjDKBQT+BIyG?=
 =?us-ascii?q?CKwgBggGCfwESAWyCSIJZBI1CEiGBB4gpmBeCQQR2iUyMAoI3AQ+IAYQxAxC?=
 =?us-ascii?q?CRQ4BHG2IA4ROgX2jN1d0AYEecTMagiYagSBPGA2WSECBFhACT4RNgUmFJII?=
 =?us-ascii?q?yAQE?=
X-IPAS-Result: =?us-ascii?q?A2HhAgBpMBteXdkYgtlNGBoBAQEBAQEBAQEDAQEBAREBA?=
 =?us-ascii?q?QECAgEBAQGBaAQBAQEBCwEBARgBAYEugU1SIBKNOYdkH4FKgXmLY4EAggqBF?=
 =?us-ascii?q?BWGBxQMgVsNAQEBAQEbGgIBAYRATgEXgTM1CA4CAw0BAQUBAQEBAQUEAQECA?=
 =?us-ascii?q?xoWBYV0QgEBBAcBgU0MHgEEAQEBAQMDAwEBDAGDXQcZDzkpIUwBDgEET4VPA?=
 =?us-ascii?q?QEznUMBhASJAA0NAoUdgkUECoEJgRojgTYBjDKBQT+BIyGCKwgBggGCfwESA?=
 =?us-ascii?q?WyCSIJZBI1CEiGBB4gpmBeCQQR2iUyMAoI3AQ+IAYQxAxCCRQ4BHG2IA4ROg?=
 =?us-ascii?q?X2jN1d0AYEecTMagiYagSBPGA2WSECBFhACT4RNgUmFJIIyAQE?=
X-IronPort-AV: E=Sophos;i="5.69,425,1571695200"; 
   d="scan'208";a="304185872"
Received: from smtp.iservicesmail.com (HELO mailrel03.vodafone.es) ([217.130.24.217])
  by mail01.vodafone.es with ESMTP; 12 Jan 2020 15:45:38 +0100
Received: (qmail 27447 invoked from network); 12 Jan 2020 14:45:33 -0000
Received: from unknown (HELO 192.168.1.3) (quesosbelda@[217.217.179.17])
          (envelope-sender <peterwong@hsbc.com.hk>)
          by mailrel03.vodafone.es (qmail-ldap-1.03) with SMTP
          for <linux-clk@vger.kernel.org>; 12 Jan 2020 14:45:33 -0000
Date:   Sun, 12 Jan 2020 15:45:35 +0100 (CET)
From:   Peter Wong <peterwong@hsbc.com.hk>
Reply-To: Peter Wong <pw178483@gmail.com>
To:     linux-clk@vger.kernel.org
Message-ID: <13919618.558760.1578840336236.JavaMail.cash@217.130.24.55>
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

