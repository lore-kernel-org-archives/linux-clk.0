Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8A683C64E69
	for <linux-clk@archiver.kernel.org>; Sat, 21 Nov 2020 01:29:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 551092237B
	for <linux-clk@archiver.kernel.org>; Sat, 21 Nov 2020 01:29:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=dabbelt-com.20150623.gappssmtp.com header.i=@dabbelt-com.20150623.gappssmtp.com header.b="BZyizWUD"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729022AbgKUB3b (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Fri, 20 Nov 2020 20:29:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729015AbgKUB3b (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Fri, 20 Nov 2020 20:29:31 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 09584C061A04
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2020 17:29:30 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id w6so9598825pfu.1
        for <linux-clk@vger.kernel.org>; Fri, 20 Nov 2020 17:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20150623.gappssmtp.com; s=20150623;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=RYuSCvZCwqyETo386P8sWNEaEYD1M71i/48IDc0TFTI=;
        b=BZyizWUDJ58KxyEwloasLLYMqzf6DIXdjtsJk44VEXmk/u216pKjQlq7/ta3/5wFFA
         /4a1L2Ln7y7QbpgpFLdiABUhqqSjISSB/7Kb23itU+UyexMH2/Jh3yGser3zTAFH/lFK
         1fYzSPyPpRPjeM0bKK1SQ7wbv5TiZRt5PLTNnpdn6dRohqWNQXBKt6mTows04Tlo3pQ/
         dwP4Dw+1fPBXPcJZNvvKrMfz/YIiIhUcF/ekNF6Ezbrk/hCx1fm0lDX4hiwzQFPxgoWJ
         idBjz2XwcC7OF72rqcacDJRbLSgVd508HBUyE5GUN6I0iVteXikZgW6v9JsPkNTclE6q
         ppoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=RYuSCvZCwqyETo386P8sWNEaEYD1M71i/48IDc0TFTI=;
        b=oUc6ihARhg1suIqSiQu0N03IhYHhi2Nl6JFzBahnFo/McBz2VttgAt+6ua5I7Z6pwS
         HCVfBxxcWeXTEFLGOksvkqDWGW9a5Ik0RtbSsCVtnT73r2ddXJWDxqa9d0xAKk0MXyL4
         qqOB1DmFHeKa7uErrJ++/+N0DkS9Z/UqPzFCy61Rhy2InlYlnIa70SF32PmUXmahTSRE
         FLj0OFNakHQS9/+m6fWCmlY3MPG8jsFjiMpneNOqDFABI0UwRoSohviVHVzuQmlYEC3u
         HKXxrSo2LRl7ES6lQsUruWLFJvLS5Kaj5kOEUDpplWs0cfz46RKclsllkYYTwKsCOpMC
         XJBA==
X-Gm-Message-State: AOAM532lDJ/KBc4BRJy5KbXO6ej6tLw0w72Kjv4ga4FdA+9/TX7j4vtj
        /mgNMnGpQPyyTI7GSZHV3KzPdg==
X-Google-Smtp-Source: ABdhPJzOQ5N9xyaCCoDJftWz+nA3rWzAz1qtBnDtfpqbHEcjJOeCYjsDG9EoKozAfWZzau5aySWivQ==
X-Received: by 2002:a63:f20:: with SMTP id e32mr19335777pgl.130.1605922169524;
        Fri, 20 Nov 2020 17:29:29 -0800 (PST)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id e8sm4607562pfn.175.2020.11.20.17.29.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 20 Nov 2020 17:29:28 -0800 (PST)
Date:   Fri, 20 Nov 2020 17:29:28 -0800 (PST)
X-Google-Original-Date: Fri, 20 Nov 2020 17:26:26 PST (-0800)
Subject:     Re: [PATCH v4 4/4] clk: sifive: Fix the wrong bit field shift
In-Reply-To: <20201111100608.108842-5-zong.li@sifive.com>
CC:     Paul Walmsley <paul.walmsley@sifive.com>, sboyd@kernel.org,
        schwab@linux-m68k.org, pragnesh.patel@openfive.com,
        aou@eecs.berkeley.edu, mturquette@baylibre.com,
        yash.shah@sifive.com, linux-kernel@vger.kernel.org,
        linux-clk@vger.kernel.org, linux-riscv@lists.infradead.org,
        zong.li@sifive.com, pragnesh.patel@sifive.com
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     zong.li@sifive.com
Message-ID: <mhng-738e4a27-9751-4937-b3ed-efdcdce56f0c@palmerdabbelt-glaptop1>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, 11 Nov 2020 02:06:08 PST (-0800), zong.li@sifive.com wrote:
> The clk enable bit should be 31 instead of 24.
>
> Signed-off-by: Zong Li <zong.li@sifive.com>
> Reported-by: Pragnesh Patel <pragnesh.patel@sifive.com>
> ---
>  drivers/clk/sifive/sifive-prci.h | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/clk/sifive/sifive-prci.h b/drivers/clk/sifive/sifive-prci.h
> index 802fc8fb9c09..da7be9103d4d 100644
> --- a/drivers/clk/sifive/sifive-prci.h
> +++ b/drivers/clk/sifive/sifive-prci.h
> @@ -59,7 +59,7 @@
>
>  /* DDRPLLCFG1 */
>  #define PRCI_DDRPLLCFG1_OFFSET		0x10
> -#define PRCI_DDRPLLCFG1_CKE_SHIFT	24
> +#define PRCI_DDRPLLCFG1_CKE_SHIFT	31
>  #define PRCI_DDRPLLCFG1_CKE_MASK	(0x1 << PRCI_DDRPLLCFG1_CKE_SHIFT)
>
>  /* GEMGXLPLLCFG0 */
> @@ -81,7 +81,7 @@
>
>  /* GEMGXLPLLCFG1 */
>  #define PRCI_GEMGXLPLLCFG1_OFFSET	0x20
> -#define RCI_GEMGXLPLLCFG1_CKE_SHIFT	24
> +#define RCI_GEMGXLPLLCFG1_CKE_SHIFT	31
>  #define PRCI_GEMGXLPLLCFG1_CKE_MASK	(0x1 << PRCI_GEMGXLPLLCFG1_CKE_SHIFT)
>
>  /* CORECLKSEL */

Section 7.3 of v1.0 of the FU540 manual says that bit 24 contains the PLL clock
enable for both of these.  I don't know if that's accurate, but if it is then I
believe this would break the FU540.  Don't have one to test on, though.
