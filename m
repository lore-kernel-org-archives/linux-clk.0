Return-Path: <SRS0=sViq=SK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B5D5DC10F13
	for <linux-clk@archiver.kernel.org>; Mon,  8 Apr 2019 10:20:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 85B5720833
	for <linux-clk@archiver.kernel.org>; Mon,  8 Apr 2019 10:20:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Pi8fI9J6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726119AbfDHKUy (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Mon, 8 Apr 2019 06:20:54 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:36729 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726060AbfDHKUy (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Mon, 8 Apr 2019 06:20:54 -0400
Received: by mail-wr1-f66.google.com with SMTP id y13so15681994wrd.3
        for <linux-clk@vger.kernel.org>; Mon, 08 Apr 2019 03:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=8npDl5MvhSEYpzdqiC318gysEK8vGb+L6cE6OpZoflY=;
        b=Pi8fI9J6g0pFSnVrx71sHRkdab7gQzNFkKefqrBDyMUmPiOCCctSg9Tl+T84dCTWOB
         Gz7vl+W+ZJDz85KiaQHhlvJg0VnNaM+LMp7wMO5vg7t+A7bKkp2g4/vcRoyLf6QA0QqG
         yzelFr4GMfaIjTnpXOWMbje7ux3HFG+9ChYHcnIg4s1PwKsVSwvFPTdT250UfrtlMIaG
         SHfKbNWdWZgszRCYkiWRd267Dt1RPmTIMgn7i/7S+uXCdFnmDmIgixwz9UMVXcDdfM7B
         x43D2BUZRdZDb1Rl08Wx/DikRs5wt7AM0lj0Wm83Mlbf8Yxy+bnsa7vnFr+xELWULsAO
         zm1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=8npDl5MvhSEYpzdqiC318gysEK8vGb+L6cE6OpZoflY=;
        b=q8Rz9TRvhLR8y7rWoYeVFhhzc9mSXewSBZxmjVeGaTYNq25K33bFO+iu+Re4nADycF
         vqyRWR9h/BeSCw8MqJpti9jUo9RK0fNZQA6cf24mQLzY8Brj1bjFRIx9jUQt0nKFXSQa
         9EbdEmfrunvC9vH1yUNmbzhfTrVTjQ4TrQOgsyJxObKWqW+YIHPri/FOR+BuEboPjXpG
         47vvPBx1lcBz43vAOuUMHbaO9ncBCjUU9jkbgslJVXHoWuRc6UySBwBNrrkyqTCEb2cA
         C4vfxzey28PbjXC9kMvEvl11bPQTIWT4sUBaMm6JXNJU367tOgeL1C7Gg03uuvl5xfWU
         gwkQ==
X-Gm-Message-State: APjAAAXQpB6/J51LF+CMeEvar9zIPBBUOk94FzhaC2l5kA7YHoVQoxAW
        pAUa5Umx3h8yLnczubmnFcMdzEPq
X-Google-Smtp-Source: APXvYqww/YqNEe8rj1tnvEFSr1ILh0E0vC1BEzR5JE3FBXVLjZpCPJ3GvCL/cU7ZIuj2/k+37547MQ==
X-Received: by 2002:adf:f110:: with SMTP id r16mr17330400wro.153.1554718852182;
        Mon, 08 Apr 2019 03:20:52 -0700 (PDT)
Received: from localhost.localdomain ([2001:470:9e39::64])
        by smtp.gmail.com with ESMTPSA id d6sm39336069wrx.62.2019.04.08.03.20.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 08 Apr 2019 03:20:51 -0700 (PDT)
From:   Jonas Gorski <jonas.gorski@gmail.com>
To:     linux-clk@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Cc:     Anatolij Gustschin <agust@denx.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Paul Mackerras <paulus@samba.org>,
        Michael Ellerman <mpe@ellerman.id.au>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>
Subject: [PATCH RFC/RFT 0/6] clk: make register endianness a run-time property
Date:   Mon,  8 Apr 2019 12:20:33 +0200
Message-Id: <20190408102039.6366-1-jonas.gorski@gmail.com>
X-Mailer: git-send-email 2.13.2
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Currently the endianness for register accesses of basic clocks if fixed
based on the architecture (BE for PowerPC, LE for everyone else). This
is inconvenient for architectures that support both.

To avoid adding more rules to the #ifdef, this patchset adds a new
generic flag to tag the registers as BE and makes the basic clocks
follow it, then converts the only PowerPC user to use it.

That way we can drop the special casing for PowerPC, and allow other BE
platforms/drivers to make use of the basic clocks.

RFC because I am unsure if this should be common flag or a per-clock
flag.

Technically it's the wrong place for the former, but having a different
flag for each basic clock looks a bit messy IMHO. This could also lead
to easy mistakes by using the "wrong" basic clock's flag, then having no
or unexpected effects due to the next free flag bit different for each
basic clock. This might be avoidable by using a free bit common to all,
e.g. the highest bit of the flag fields.

I don't have any strong feelings one way or the other. I just used this
way because I needed to start somewhere ;-).

RFT because I don't have a PowerPC device to test, and especially not a
512x one. I did compile test it though!

I looked really hard, and this is the only place I could find where a 
PowerPC platform (indirectly) used the clk accessors.

None of the regular drivers in clk/ were selected in any of the powerpc
defconfigs, and this was the only platform code that registered basic
clocks.

Jonas Gorski (6):
  clk: core: add support for generic big endian accesses
  clk: gate: make endian-aware
  clk: divider: make endian aware
  clk: mux: make endian aware
  powerpc/512x: mark clocks as big endian
  clk: core: remove powerpc special handling

 arch/powerpc/platforms/512x/clock-commonclk.c | 13 ++++++-----
 drivers/clk/clk-divider.c                     |  8 +++----
 drivers/clk/clk-gate.c                        |  6 +++---
 drivers/clk/clk-mux.c                         |  6 +++---
 drivers/clk/clk.c                             |  1 +
 include/linux/clk-provider.h                  | 31 ++++++++++++++++++---------
 6 files changed, 40 insertions(+), 25 deletions(-)

-- 
2.13.2

