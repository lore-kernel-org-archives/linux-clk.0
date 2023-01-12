Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19169C67871
	for <linux-clk@archiver.kernel.org>; Thu, 12 Jan 2023 03:05:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235934AbjALDFo (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 11 Jan 2023 22:05:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234552AbjALDFn (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 11 Jan 2023 22:05:43 -0500
Received: from sender4-op-o14.zoho.com (sender4-op-o14.zoho.com [136.143.188.14])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4266C4882A;
        Wed, 11 Jan 2023 19:05:43 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1673492736; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=Kzv7hF+g/k1OWqjGzjTaaBgXIu2xM235XxGPkXFx2FoqrCnlmZijnv8wRrSaYE9YIS5PAvqaGwVYCscP8miDbAER+LTIzDRg5GWdXKAS7FPtafRzckdz9azhhTVeM1vNMLKxnw0nSIhxfxz9Z6QuUZkPj3a9KSl0BE4G3xI6uVc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1673492736; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=Aj2DDQC6mtht01ASphlvME6cV1HOoWq0/2zmP4tTGy0=; 
        b=bYD8scRL+5RYtEFR6BCwo4qkwHA+G1hyKBcerU3JQdwLrAUVe1654ZlEaERgw9prrEF4jCO4rXdKuLQzLb+W6SFgdbA3iZcbR9RBPg+xkAm5k0TrYeM9wPbT7X5PDXYVQ4vi/CPjKdFuoJ5kF0jAch7kif2SeyVkkSrKP1NtFeI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=linux.beauty;
        spf=pass  smtp.mailfrom=me@linux.beauty;
        dmarc=pass header.from=<me@linux.beauty>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1673492736;
        s=zmail; d=linux.beauty; i=me@linux.beauty;
        h=Date:Date:From:From:To:To:Cc:Cc:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
        bh=Aj2DDQC6mtht01ASphlvME6cV1HOoWq0/2zmP4tTGy0=;
        b=TJSB442eaOth18GqCSDt5DUnEjuCkRAHraeYNN4vL8SFILUsRx60R3NRUqpBJGRa
        VdkAs1a4kFvOWNneWSnUluuVyQP563dGDqZC6ZvkUPCgkSXwXa0RGMKhX0tZcwESfxV
        dSleIMC6BO43mvgw8+bvaN2J2xt0B1RoduHqua6M=
Received: from mail.zoho.com by mx.zohomail.com
        with SMTP id 167349273477392.5999946788379; Wed, 11 Jan 2023 19:05:34 -0800 (PST)
Date:   Thu, 12 Jan 2023 11:05:34 +0800
From:   Li Chen <me@linux.beauty>
To:     "Stephen Boyd" <sboyd@kernel.org>
Cc:     "michael turquette" <mturquette@baylibre.com>,
        "li chen" <lchen@ambarella.com>,
        "linux-clk" <linux-clk@vger.kernel.org>,
        "linux-kernel" <linux-kernel@vger.kernel.org>
Message-ID: <185a3f0a326.b623e6bd1243489.6765528573167668508@linux.beauty>
In-Reply-To: <57d1f58c4c6cca793d629d5776b477d0.sboyd@kernel.org>
References: <20230110114540.2975540-1-me@linux.beauty> <57d1f58c4c6cca793d629d5776b477d0.sboyd@kernel.org>
Subject: Re: [PATCH] clk: create write_enable file to control clk rate write
 and other dangerous ops permission
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

Hi Stephen,
 ---- On Thu, 12 Jan 2023 02:37:29 +0800  Stephen Boyd  wrote --- 
 > Quoting Li Chen (2023-01-10 03:45:39)
 > > From: Li Chen lchen@ambarella.com>
 > > 
 > > It's common requirement for bsp debug/test to change clk rate from userspace.
 > > 
 > > Currently, we must define CLKOCK_ALLOW_WRITE_DEBUGFS then re-compile kernel
 > > to allow this feature. Let's replace it with a "write_enable" file to
 > > allow enable it at runtime.
 > 
 > Nak. This design is intentional.
 
Thanks for your reply. Got it. But sometimes re-compile is somewhat low efficient. Is it acceptable to provide 
a write_enable to clk_core(not enable by default), and allow clk driver to enable it inside clk_ops->init
via clk_hw->core->write_enable = 1?

Regards,
Li
