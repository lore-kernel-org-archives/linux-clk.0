Return-Path: <linux-clk-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:50821 "EHLO
        mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752567AbdKBHiU (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 2 Nov 2017 03:38:20 -0400
Received: by mail-lf0-f42.google.com with SMTP id a132so5279653lfa.7
        for <linux-clk@vger.kernel.org>; Thu, 02 Nov 2017 00:38:19 -0700 (PDT)
Received: from android-fee78d8a8fd46114.lan (78-57-212-189.static.zebra.lt. [78.57.212.189])
        by smtp.gmail.com with ESMTPSA id m85sm418386lfi.76.2017.11.02.00.38.17
        for <linux-clk@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 02 Nov 2017 00:38:18 -0700 (PDT)
Date: Thu, 02 Nov 2017 09:38:15 +0200
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Subject: [PATCH] RESEND: clk: Avoid sending high rates to downstream clocks     during set_rate
To: linux-clk@vger.kernel.org
From: Modestas <montvid@gmail.com>
Message-ID: <5755FE10-07A1-4E36-9CE2-5615D0D16680@gmail.com>
Sender: linux-clk-owner@vger.kernel.org
List-ID: <linux-clk.vger.kernel.org>

Thanks for the information=2E As I understand there is no @ when this will =
be upstreamed=2E My Krait device can not boot the linux kernel to login wit=
hout this patch so this patch is critical=2E Without it i just see a blank =
screen without any dmesg info=2E=C2=A0
