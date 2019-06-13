Return-Path: <SRS0=o7Wn=UM=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 42028C31E45
	for <linux-clk@archiver.kernel.org>; Thu, 13 Jun 2019 17:09:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0B0982063F
	for <linux-clk@archiver.kernel.org>; Thu, 13 Jun 2019 17:09:26 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="qEi0As9F"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729769AbfFMRDl (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 13 Jun 2019 13:03:41 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:33859 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389334AbfFMRDj (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 13 Jun 2019 13:03:39 -0400
Received: by mail-qt1-f193.google.com with SMTP id m29so23405950qtu.1
        for <linux-clk@vger.kernel.org>; Thu, 13 Jun 2019 10:03:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to:cc;
        bh=+fM9s+ZRu6a19ZVI0lc0MDu5AlmUc3QAgWfYbHMegA8=;
        b=qEi0As9FjslOUPyhy3Net8r6QbVgxoEl6gBQAvYjq4/nRnz7G3BE7He7EpNC/OXmBy
         q55XHN5KFNJpcOA/O+b9YOeBjoC219W355lHTG2oxWTzi/fcPQ6E9vhYB+iC8NgRq4vm
         8sURicPrA7zOoCFDeJl/egMR5HLgU9Sb2DueqkXvjKTLguUlVuG7RRu7zsTBhnkYIvgt
         fIPop3Ujnh2MeBfj1OeDEtCATPphFRkp3elQDHPRJ0z3FhRyAgHQPoweAVLo0ieppyRD
         X+OWwLS7qqUfYtLrO02SWcySfoUVqHpYZXmMiw2l0gDYKfHOvOm6EfIx7oInZIi+Guh/
         +X4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:from:date:message-id:subject:to:cc;
        bh=+fM9s+ZRu6a19ZVI0lc0MDu5AlmUc3QAgWfYbHMegA8=;
        b=lhbxJbx/mHjcpr2g0kzC/2ThkUvopQ+GR+00My1NFsZytV2CXVpJ0Z6thzFGSFQVS9
         K2/SD/Flg/j9omKc+OHKrz6ZrSgq7VxzhvGFhDjAbJJXyR0yAq+r3FrbywF5f3X9Mm5c
         dL2qbgSqkGlPlZdDjgMg0emSRcX3V5L4eLHTRcV8JWeWBHMQghdWmysLyG7dKBDGXG1J
         sKgxyPWv0qhMDEnfg6e9Nrg635nl81a+U0dCYj3ggTKdVcSdEp7XCagIu6CI4RNAWdQA
         Ba7pdSEq6w16ZklGG4pudoNqp3GoQ7Hi9BAphPr4g9wGlhbFs7zovMbMYA5GZi4oFS2I
         6XFQ==
X-Gm-Message-State: APjAAAW6xIWwM6DlQj+lB8WItphiWbWv+HuOFRbW0NvRQUNG8QvBdtgH
        8DWh5p1tafOn7BcoYhTbyocsgNrYIJ8AD0ynDT2f1Q==
X-Google-Smtp-Source: APXvYqxiy5kouzZBRbpjgIdOzVKd074tyypO+LFeT69dim/yHszXr0rChCoWGVx/P0+4hEwdMRtozIq6/hSSH8DadPI=
X-Received: by 2002:a0c:ba21:: with SMTP id w33mr4559727qvf.122.1560445418047;
 Thu, 13 Jun 2019 10:03:38 -0700 (PDT)
MIME-Version: 1.0
From:   Nathan Huckleberry <nhuck@google.com>
Date:   Thu, 13 Jun 2019 10:03:27 -0700
Message-ID: <CAJkfWY4aYAwUWMGu02=0ibae05Qo3_Yqy-Q0eFw0k=2torhEHQ@mail.gmail.com>
Subject: Cleanup of -Wunused-const-variable in drivers/clk/rockchip/clk-rv1108.c
To:     shawn.lin@rock-chips.com,
        Michael Turquette <mturquette@baylibre.com>, sboyd@kernel.org,
        heiko@sntech.de
Cc:     linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org,
        clang-built-linux@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hey all,

I'm looking into cleaning up ignored warnings in the kernel so we can
remove compiler flags to ignore warnings. There's a variable
(mux_pll_src_3plls_p) in clk-rv1108.c causing an unused const warning.
Just wanted to reach out to ask if this variable is intended to be
used.

It doesn't look like it has been used since it was first introduced.
If it is no longer needed I'd like to remove it.

https://github.com/ClangBuiltLinux/linux/issues/524

Thanks,
Nathan Huckleberry
