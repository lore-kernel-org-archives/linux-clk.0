Return-Path: <SRS0=kVDh=NV=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 099C9C43441
	for <linux-clk@archiver.kernel.org>; Sat, 10 Nov 2018 11:37:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id C5DD320883
	for <linux-clk@archiver.kernel.org>; Sat, 10 Nov 2018 11:37:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org C5DD320883
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=i2se.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-clk-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728917AbeKJVWX (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 10 Nov 2018 16:22:23 -0500
Received: from mout.kundenserver.de ([212.227.17.10]:57055 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728888AbeKJVWX (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 10 Nov 2018 16:22:23 -0500
Received: from null ([172.19.246.154]) by mrelayeu.kundenserver.de (mreue109
 [213.165.67.113]) with ESMTPSA (Nemesis) id 1Mr9O4-1fg70U45eI-00oGOE; Sat, 10
 Nov 2018 12:37:17 +0100
Date:   Sat, 10 Nov 2018 12:37:15 +0100 (CET)
From:   Stefan Wahren <stefan.wahren@i2se.com>
To:     Florian Kauer <florian.kauer@koalo.de>,
        Mark Brown <broonie@kernel.org>, Vinod Koul <vkoul@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
        Chris Boot <bootc@bootc.net>, dmaengine@vger.kernel.org,
        linux-spi@vger.kernel.org, Martin Sperl <kernel@martin.sperl.org>,
        Eric Anholt <eric@anholt.net>,
        linux-arm-kernel@lists.infradead.org
Message-ID: <1682361655.172416.1541849835591@email.ionos.de>
In-Reply-To: <26a93a5d-0ed2-b82d-3a0b-ef2888c59af0@koalo.de>
References: <1540292769-5905-1-git-send-email-stefan.wahren@i2se.com>
 <815844594.141792.1541616607053@email.ionos.de>
 <26a93a5d-0ed2-b82d-3a0b-ef2888c59af0@koalo.de>
Subject: Re: [PATCH 0/3] Fix MODULE_LICENSE of bcm2835 drivers
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Priority: 3
Importance: Medium
X-Mailer: Open-Xchange Mailer v7.8.4-Rev39
X-Originating-Client: open-xchange-appsuite
X-Provags-ID: V03:K1:cv6kBMFdJTeT6z4ZVnStkFa/MDMXj8GCzGIoUCY4YG6vyjbqxIm
 Bx2aqT1o2Y6pva7FSZgKjewtPF/lRHaAX7nAp3AkKWz41aURB6K0ng5ihboJ7Hn0SUTBwld
 XH58qbxvD5y2dn86LcyRamPlxGhq5uxlsvvEdiojy88vft1nM0VPSKwrX/ftdo5Xq8zvVnM
 Ul996gSz5tKxI/+vbn1ag==
X-UI-Out-Filterresults: notjunk:1;V01:K0:IP+hUfPNAZc=:UcdC+0M6PXfpFqhIFz+Pnr
 aAclWIbfdHkGuVumXsvwUSWTIB4r/qGa8T30MP884Q3hqnvpUXsoHvgCeNGxHYNSp7khYh5u6
 wlBwZHdmpN3zE7kCCsgcDuzNg4G9g3y4fIiCJncUU1349rZPxbmQtwTn1jkZt0W+w45GApLXg
 SqG2Z3R7iA7EQ31YCFb0GfzPBKdf+aTWq5Cm1fZzKu5pCurlg1DOrdO0GPidzuruJ/7WbZY0f
 fcDTV1DqzKYpy6IY/WbyuYmxtxOiRHiMY+mfzcOzEQ1NBpernUNHJ1nefmHyQ2JG0MONypQQq
 FeGgBKBotmxrqxAv5dpf/Xh37ZDas2Zx4QaJpT277c4c+4tmSr6odP4MXwo68TA1/ml8xO2yB
 3e7roKUwlXTb7HBsH61i04o6i3fdfr1z+bbLLCwS8OcCpb3CzaRIkX8L7+XR3ppOZcCFl+GL7
 wJSUdSpQRxxYL36XU6i/iQ1q0x4p9bBPKf58Jw73wt5YAakV3qT9lswNk8b9xXCwDezp3NcxE
 OaYPYiMBJazmOw+hLwYqCEPovdtb4dB33vy9aLefRzTzJxCTE0/LwZv33zuRU5DxU+RkxXnPn
 9UwvhOueiYAhEfkIrCxyyv1f5PyinTkhM3MmaP+XLE6/cREILhZXsgtqtlfDYcfcZiw0a3sTf
 g8P9VORSeBIwUjrkpscKDpMGI4o0Jc+mqyk2cfDafFVt8lUgPEFvqPafwOsxAGfCbMHm0BvMT
 oSYcyY5K4OBuuXIy1BdH+ar3ZsRz3kjrxwXHHNG0Dbbp7B8hK04QxCXd3nhLoStlFdUUWE01Z
 UqmRt/j5qNDUIyYBKa+S2E9CvHuIaCUIdijAX2+QNOD4/8Sq/c=
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Florian,

> Florian Kauer <florian.kauer@koalo.de> hat am 9. November 2018 um 19:48 geschrieben:
> 
> 
> Sorry for not replying in time. I became father recently ;-)

no problem and congratulation.

> So if it is still relevant:
> Acked-by: Florian Kauer <florian.kauer@koalo.de>

Yes, thanks. I wasn't aware of your name change.

Stefan
