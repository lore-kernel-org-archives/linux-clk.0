Return-Path: <SRS0=eU8d=QH=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C1CDC282D9
	for <linux-clk@archiver.kernel.org>; Thu, 31 Jan 2019 18:40:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0F37E218AC
	for <linux-clk@archiver.kernel.org>; Thu, 31 Jan 2019 18:40:15 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="oTlYPCBw"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725777AbfAaSkO (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 31 Jan 2019 13:40:14 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:52071 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725730AbfAaSkN (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 31 Jan 2019 13:40:13 -0500
Received: by mail-wm1-f66.google.com with SMTP id b11so3603081wmj.1
        for <linux-clk@vger.kernel.org>; Thu, 31 Jan 2019 10:40:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:cc:date:in-reply-to:references
         :user-agent:mime-version:content-transfer-encoding;
        bh=owLbYclAuN3GBERSCEViDZYVHBagSDsGPMPw2l2m+P0=;
        b=oTlYPCBwFzOpuwn9c8u1+7bH8vbYS2kxONB4bj0bpfn7Hoz1JGJ3g/ER3WQ86zYIid
         w+LLnOxBNer1rhdOPn3VAab85kkQIsazlTYYqOtISv86jIWnUr8MSzObbexV4Nh4+KPt
         dQgI+4/rAsne71YfnZdWiJuyaAIP1VkENzMftoaN19X01t8sCI0BS0Ri0B8UKlo3QhTj
         XYAvPY7FahMVhjx7V42mIF+pBImhR1aJf/jOKl9s+rMWqjXAOWEJsjKaJ2BsYYDsPQvp
         jRqohkarJ+JX94/0S5//8GFOJGNGvdAkOigyxYj3nEbqRS+EN+NNAveFpW5A0nklrG96
         y4nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=owLbYclAuN3GBERSCEViDZYVHBagSDsGPMPw2l2m+P0=;
        b=bZ6eFdzGZBBkmeh06eO7Jtod/Y8JtvbqpFs68aY2Ox5GQ4P1LrpiU/7gbBIIipo+Dc
         mclDtCyQQCVjl/U7i3XCgdyVSJ547oFCcsGhdd9Q7w5U9KysYGgpLLHkB0OZCp9XotC3
         1ANGVQ+XYiTnNOnNs2SAZ+Wxs+Zp3GV1d9UBwr2rzJHZppWQgDUeM2PPY0gpK+KxskQu
         q8GL3Co8rwq0JW7hKt0htTHj0PphcOMja6Uvt6B2YLpzPPo67cu5N8gyO4WIzg3lqnJy
         RcQS+wnAmOZSRCY0gukvP8pGt+2by8SWJXLXW8x41Sb3JBhGN/aWDvm6B8HabORb8f0s
         R+KA==
X-Gm-Message-State: AJcUukcMhlpKu+ku6yqyojuySRRpxXwsrWHvMAGVI9FBoru19fcslbPU
        0GgxZS4G5/xb/ttLUe4xICzw5w==
X-Google-Smtp-Source: ALg8bN6uhDo9QzubQQJ4RZYqY4J4n+S2oQ/BTN8Sr8SYIqAuTjFvF6uifoGd+mpBNZHX5lMzMhePSA==
X-Received: by 2002:a1c:68d7:: with SMTP id d206mr29377794wmc.43.1548960010400;
        Thu, 31 Jan 2019 10:40:10 -0800 (PST)
Received: from boomer.baylibre.com ([2a01:e34:eeb6:4690:106b:bae3:31ed:7561])
        by smtp.gmail.com with ESMTPSA id z14sm3761305wrm.48.2019.01.31.10.40.08
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Thu, 31 Jan 2019 10:40:09 -0800 (PST)
Message-ID: <97c2375f41fe7dabc4d71f66c9808912eb0ce611.camel@baylibre.com>
Subject: Re: [PATCH 2/9] clk: Introduce get_parent_hw clk op
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>
Cc:     linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Russell King <linux@armlinux.org.uk>
Date:   Thu, 31 Jan 2019 19:40:07 +0100
In-Reply-To: <154888381385.169292.12776041058756822056@swboyd.mtv.corp.google.com>
References: <20190129061021.94775-1-sboyd@kernel.org>
         <20190129061021.94775-3-sboyd@kernel.org>
         <e303573aefeaf6a7e3a4b1d820e801354ff900b4.camel@baylibre.com>
         <154879654428.136743.10048771201181501034@swboyd.mtv.corp.google.com>
         <ff76dcdb4ceb3209619e5348ed7b575a8ae9df8d.camel@baylibre.com>
         <154888381385.169292.12776041058756822056@swboyd.mtv.corp.google.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.4 (3.30.4-1.fc29) 
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 2019-01-30 at 13:30 -0800, Stephen Boyd wrote:
> > With this quirk, CCF is making an assumption that might be wrong.
> > 
> > The quirk is very easy put in the get_parent() callback of the said
> > driver, or
> > even better, don't provide the callback if it should not be called.
> > 
> > I understand the need for a cautious approach. It seems I'm only one with
> > that
> > issue right now and since I have a work around, there is no rush. But we
> > must
> > have plan to make it right.
> > 
> > To be clear, I'm not against your new API but I don't think it should be a
> > reason to keep a broken behavior the framework.
> > 
> 
> So do you think you can use this new clk_op and ignore the problems with
> the .get_parent clk op? Putting effort into fixing the .get_parent
> design isn't very useful from my perspective. There's more than just the
> problem that we don't call it when .num_parents is 1. There's the
> inability to return errors without doing weird things to return an index
> out of range and there isn't any way for us to really know if the clk is
> an orphan or not. If we can migrate all drivers to use the new clk op
> then we can fix these problems too, and deprecate and eventually remove
> the broken by design .get_parent clk op API.

Stephen, I have nothing against your new API, I'm sure it will solve many
issues

I'm also quite sure that, like round_rate() and determine_rate(), migrating to
the new API won't happen overnight. We are likely to still see get_parent()
for a while. I don't understand why we would keep something wrong when it is
that easy to fix.

I have spent quite sometime debugging this weird behavior of CCF, I'd prefer
if it can avoided for others.

Yes, fixing the case I reported does not solves all the problem you have
mentionned. Keeping this bug does not help either, AFAICT.

The fact is that get_parent() already return out of bound values on some
occasion, and we already have to deal with this when converting the index to
parent clk_hw pointer. Doing it in the same way when num_parent == 1 does not
change anything.

I really don't understand why you insist on keeping this special case for
num_parent == 1, when we know it is not coherent.

Considering, that I already proposed the fix, what is the effort here ?
If it is fixing the driver that rely this weird thing, I'd be happy to do it.

Regards
Jerome

