Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2021C433EF
	for <linux-clk@archiver.kernel.org>; Wed,  1 Dec 2021 07:52:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241891AbhLAHzz (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 1 Dec 2021 02:55:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39886 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230144AbhLAHzx (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 1 Dec 2021 02:55:53 -0500
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C7DF2C061574
        for <linux-clk@vger.kernel.org>; Tue, 30 Nov 2021 23:52:32 -0800 (PST)
Received: by mail-yb1-xb2c.google.com with SMTP id f186so60698914ybg.2
        for <linux-clk@vger.kernel.org>; Tue, 30 Nov 2021 23:52:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:from:date:message-id:subject:to;
        bh=p4fKH8kMzek8Yj0pHEdMEUs3p/2KhJIv5I7zQWeT6kI=;
        b=eWgSODt8mKNIypx2qj0ixdrDk0EQ6CsH1+fnjOvntNCez0GdOwWGndEWIJnDduwMmF
         6wQ4mV/yRQtH0jT79NwUs7JYOUfTAreG/D0gvmkJJ5iL8JhtRJ33VeptRH7L2TwoWOZM
         C9Q7mnZMyFoPDaDwQHKzPMfA8W5uT5zh1xAYPoAYTDVvqqFjK+9wLmYkMQQfoEFFshez
         mbdS1TXRKvV+TKM/kYW+lIKyg09EzqWqws30Qom3NX8hR6dtHF85Po1LrHGV1qhfnaz9
         L83kiJl7cZzDaa8GZwjd+AUpGftrKl9lpUPa6vSxYMcOK09aW0Y1wlKzxrzsjQhJjCYZ
         tQxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
        bh=p4fKH8kMzek8Yj0pHEdMEUs3p/2KhJIv5I7zQWeT6kI=;
        b=UovPpq2SpclgcwqweRmbd2tohdx1snuLu0TS2jHJHHcyVXxJbk1VVeMv3jSRHNiBrp
         HkV/prLEfECT63ZUD0CrQHhpnd/7Z0q964ApHSQ2mQzdX+kkF0gGKFjAIkBtVDdNAdjY
         6UuU+fz419ed128nC2pkVU+94Tk9aDlPAq7WoXPShU5DbY8zhmNoMbQmjfDjkd+Te8je
         sE/7ZI4a3T5xopB89+XfaUla8i9U34Lq3/zi7rDgJGQZVmbNm3TIXCS3kw18zCcB8l4Y
         LQ/2xp0pjVpSNvXAwVF2iQYFZ4dQzOx2NAgyrdCOef22VhcjXU9qeNoM4GM1LW13K6il
         iROQ==
X-Gm-Message-State: AOAM530FQGN0g9awMgtwtHkwmYQ7lRj643Hd3lMQGoSfmhG7A14OQfSR
        jMqV14AJjGwGro2NS4Wi7uBoS0kJz0y+SqJYJf+bIoF4cJsxEg==
X-Google-Smtp-Source: ABdhPJxMnxLpXiQ64KE1c0XeD8il5XK3bLKONdt113Dxq86IAh07Q7i8okYWXy7iRKlOBrCXCTgageh39IPCqZrTnZM=
X-Received: by 2002:a25:df14:: with SMTP id w20mr4944674ybg.743.1638345151879;
 Tue, 30 Nov 2021 23:52:31 -0800 (PST)
MIME-Version: 1.0
From:   Belisko Marek <marek.belisko@gmail.com>
Date:   Wed, 1 Dec 2021 08:52:21 +0100
Message-ID: <CAAfyv36MWMzFjD6gjdS9kYqOepu7q6pyZqgN-V3U+XLam2-jWg@mail.gmail.com>
Subject: driver for Renesas 9fgv0441 chip
To:     linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hello,

I just want to ask if anybody is working (have a driver) for the
9fgv0441 chip. It's PCIE clock generator :
https://www.renesas.com/us/en/document/dst/9fgv0441-datasheet

Thanks and regards,

marek

-- 
as simple and primitive as possible
-------------------------------------------------
Marek Belisko - OPEN-NANDRA
Freelance Developer

Ruska Nova Ves 219 | Presov, 08005 Slovak Republic
Tel: +421 915 052 184
skype: marekwhite
twitter: #opennandra
web: http://open-nandra.com
