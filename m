Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.2 required=3.0 tests=BAYES_05,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0B72CC4338F
	for <linux-clk@archiver.kernel.org>; Fri, 13 Aug 2021 07:03:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DFACD60FC3
	for <linux-clk@archiver.kernel.org>; Fri, 13 Aug 2021 07:03:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239188AbhHMHDx (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 13 Aug 2021 03:03:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47200 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238877AbhHMHDw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 13 Aug 2021 03:03:52 -0400
Received: from mail-oi1-x22f.google.com (mail-oi1-x22f.google.com [IPv6:2607:f8b0:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5C488C061756
        for <linux-clk@vger.kernel.org>; Fri, 13 Aug 2021 00:03:26 -0700 (PDT)
Received: by mail-oi1-x22f.google.com with SMTP id w6so14585989oiv.11
        for <linux-clk@vger.kernel.org>; Fri, 13 Aug 2021 00:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=OG1ULCYLExL4bW7O7dhFmKarRuArYH7+WiwTF+LO30k=;
        b=DJYYmI8pDCe+c+q14egvWlFqUwI9khQ3jsWzlUp0Joyjuj6N3HvF6dFl3vDbCHdknx
         QJTxhvnCnvm5Si1QXoMA5DC6qHHeapKIqonQKQDpBYqKyEda64LH3GA7F3SV7Hia517f
         dGL0ULSgNO4+lckQyIsglnBapJyJBDLeP08hKhBmCHMJc6yKDMCj9kVKzpqgmijEpJMW
         mUGtl1ZMA9SKB70c+lFNYs3kyRnw5RlILX6sy9fyeHedeoZl9+vnoqKpKHzBFy4au26/
         RPfYd32aOuIzD8FwZ7N7ixKxVJ42ybwhOhP6dx0VXohFU5R4u7U92JtxACKpsjw2PYYP
         vbcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=OG1ULCYLExL4bW7O7dhFmKarRuArYH7+WiwTF+LO30k=;
        b=Azp1VV42LvalPqqWQHxZoA2rrY1duVeJBOU4FfnBdRd10+5gbszoJA86djPd+lsE7h
         lQaGEfllZ23CtEVfOv8U3Hl+H5c9+BS8cIpjes/ydxzEDy9mngFgw9v+2nnkrWF+Taxs
         JoEyl/F4VhzKkNQPZ/RM1x+1GQxboLzOdnOE+XQVaIX0dLieCRDqu8Oa+MHn0UkkOCsY
         zWenXDOc3gqbYA67ewYX/NnGxRHXFgKXQcVOoeTD5MfIHWc19tb35mIVKH+1NolJ/68B
         7zcow7ejGB4y1NkVTINK3t9EBDg86ZBOcguTlF+jeND2Cwm1b810MouyhzP+TIQMIG3H
         MfEg==
X-Gm-Message-State: AOAM533veDw0fR69emkiuR49/GmIML3TEx/eRdHlFR5EaHtgEwdJHB9F
        soH7+f87AmiG5kJM0f2zLoPMehptc0bldsk4TbU4yPErI1g=
X-Google-Smtp-Source: ABdhPJxWGzlGDhwu6xgokS0I+WrZDFec+H+kyRkvB5ctKs4u27JHpb2CUEnoHCpoMBabrTUXvsVKIb1ZVOk7lthbLWc=
X-Received: by 2002:a05:6808:1403:: with SMTP id w3mr275488oiv.121.1628838205637;
 Fri, 13 Aug 2021 00:03:25 -0700 (PDT)
MIME-Version: 1.0
From:   Shubhrajyoti Datta <shubhrajyoti.datta@gmail.com>
Date:   Fri, 13 Aug 2021 12:33:14 +0530
Message-ID: <CAKfKVtGF8-s8xNDA2TwG4qtQF2rFdfbB53UfBO-XGO1MEM+tTQ@mail.gmail.com>
Subject: Clocking accuracy
To:     linux-clk@vger.kernel.org
Cc:     Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi ,

I have a clock tree as below.

D1 -> D0 -> output

here there are two divisors and output is (input/D0)/D1.

here  if the output of D1 is





Parent 0 0 0 24258309116 0 0 50000
D1_div 0 0 0 2695367679 0 0 50000
clk_out1 0 0 0 269536768 0 0 50000

D1 is 9  and D0 10

Now when i ask for  output as 148M

the D1 divisor is chosen as 18 and the output is  149.742648


i have set the set rate parent  here.

however if the divisors chosen would have been 1 and 164
the value would have been 147916519.

Is there a way to achieve that.

Thanks and Regards,
Shubhrajyoti
