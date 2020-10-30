Return-Path: <SRS0=Ewk5=EF=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 278BAC4363A
	for <linux-clk@archiver.kernel.org>; Fri, 30 Oct 2020 11:52:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9010D20723
	for <linux-clk@archiver.kernel.org>; Fri, 30 Oct 2020 11:52:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=0x0f.com header.i=@0x0f.com header.b="T5PMxHHh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726259AbgJ3Lwv (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 30 Oct 2020 07:52:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726181AbgJ3Lwv (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 30 Oct 2020 07:52:51 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55AC1C0613CF
        for <linux-clk@vger.kernel.org>; Fri, 30 Oct 2020 04:52:43 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id h12so3842927qtu.1
        for <linux-clk@vger.kernel.org>; Fri, 30 Oct 2020 04:52:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=0x0f.com; s=google;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=+5h8uGAWLKMJPxsKSBHFnKRvgJ1/8UrMiZ99ArnMrJA=;
        b=T5PMxHHhKjVVOAZLZj9tznmOgO5a8RNT6nFtO79RdHLj0Pg+Qhg+XzBx2y/gYFOMyr
         Q9qtgI37UAo5dbmxjtVCym0gSW8haDG4CPDCYdf5srLDok4MCvio1sbfARmihoq3rsuv
         oYoXnXfJTcsF6mnX2jHUpd8Q51fPUmDJqA97E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=+5h8uGAWLKMJPxsKSBHFnKRvgJ1/8UrMiZ99ArnMrJA=;
        b=nW+dkCYbqqxX/B/fHC7vrh9ZDqLvty46OGFtYAp6c75Ko0Xm7l9cJYiLb5npxhbWq7
         tAfG3H+QSMaLoM1TlI9aWA/P7r8xIGYBDGVfZDKml/m4aMYROXvBPEyO7LtDD8ao9cWc
         uRnQ4JYPjo58QvJx6HDGreMkACcmmYOwSr6mi5GaGx2s0Fr0UkUeyjeBpbrHBlnr7znf
         aloxWJ2q+8GE8g3/aL63qFX+VQZuMZrPFwEYtB9oBQn1FUpC8ZkFnwBJ0PI9OaGWUmtR
         UiN4GDzHNobFsHbUBQhEMEP5+fTq7JWEVLZZxGxhd9UnxqPs+jVVSKyScIVmSh5+LEGi
         7T2A==
X-Gm-Message-State: AOAM53026RqxfG0dGJjxgKLNnDLNdLM7EY+ULIwumE9LL2GezKbebISU
        96EuQyf+4wsGTqv0ftTRywI5pDW6irJBJySN+g5n5ohR8MI=
X-Google-Smtp-Source: ABdhPJwLO2y7F/la84e25j+8RAOK24xd1w93sjXGQQQ5Lt0KhcSrOTGTUA1lk6O6/uaREE7b2D38qQfMsLpESwGNPkU=
X-Received: by 2002:aed:2125:: with SMTP id 34mr1670365qtc.249.1604058762193;
 Fri, 30 Oct 2020 04:52:42 -0700 (PDT)
MIME-Version: 1.0
From:   Daniel Palmer <daniel@0x0f.com>
Date:   Fri, 30 Oct 2020 20:52:31 +0900
Message-ID: <CAFr9PX=Ac6yzR31uzK=6WmnbznUm_FzVRs+v2D3ONfX4UCY_QQ@mail.gmail.com>
Subject: Acceptable format for clock cells.
To:     linux-clk@vger.kernel.org
Cc:     DTML <devicetree@vger.kernel.org>, Daniel Palmer <daniel@0x0f.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi all,

I'm writing a clock driver for a PLL unit in an ARM SoC that I hope to
wrap up and send the patches for in the next few days.

This PLL unit has one PLL and then a series of dividers. Then each
divider apparently has between 0 and 3 dividers coming off of it.

As there is no documentation for this thing and I'm not sure what the
logical output numbers are or even if I know all of them I was
considering making the number of clock cells 2 and having the first be
the first divider (i.e. the divide by 2 output would be 2) and the
second cell the chained divider or 0 for no divider.

If I should just decide the order of the outputs and come up with
indexes for them would it still be ok to nest them like the first cell
is the index of the divider and then the second cell is the index of
the chained divider?

Thanks,

Daniel
