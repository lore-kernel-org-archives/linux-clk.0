Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DDB7BC001E0
	for <linux-clk@archiver.kernel.org>; Sat, 21 Oct 2023 12:50:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229478AbjJUMux (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Sat, 21 Oct 2023 08:50:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60246 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231171AbjJUMuw (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Sat, 21 Oct 2023 08:50:52 -0400
Received: from out3-smtp.messagingengine.com (out3-smtp.messagingengine.com [66.111.4.27])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2D979D63;
        Sat, 21 Oct 2023 05:50:45 -0700 (PDT)
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
        by mailout.nyi.internal (Postfix) with ESMTP id 828545C018E;
        Sat, 21 Oct 2023 08:50:44 -0400 (EDT)
Received: from mailfrontend2 ([10.202.2.163])
  by compute6.internal (MEProxy); Sat, 21 Oct 2023 08:50:44 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ryhl.io; h=cc:cc
        :content-transfer-encoding:content-type:content-type:date:date
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to; s=fm3; t=
        1697892644; x=1697979044; bh=LZyCmcPb3bs6dxzfD7O4vP4x6LlTAn9BCEy
        VR9eXHL8=; b=iBqvZiG3n8KgYBbFHbF2xctT73LpdD4hKaif19KqqHMFzEQlSU6
        nGALyUI4+9tOYUsxH9aXSXWx90XzPNNk2TrmCGskrUmvBt0FqvG8fxwBVCp/RVDg
        FxY4VbwtxlwaHTG287v4ejL8/HUBF7O9/R8wh5hMEOwMSaGp8wP/FfuKfim+xL0u
        LPTlmr1leMXRZz329W8rt9NE4vkozyH+e8erFG+md9tyGWUQpAoi9k7M80gGDOsf
        lFG7K9PCPUyOk2YEk1e02qTZDJjdNrG5QtN8ycTWq5EqJFe4O/NPjKVEi8NbnKka
        HuRi/sisqy0TwLARwG6tu2QWeYgEO//nqTQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1697892644; x=1697979044; bh=LZyCmcPb3bs6dxzfD7O4vP4x6LlTAn9BCEy
        VR9eXHL8=; b=f1vv9/SWu+NcFbXIaWZ7BqLJmD7CqMxZlaDW840cNqrPUVaODPG
        MQXe9YK5+TSC9bCIP1bWTHdH5Zrq1sjjMFjqlLBXzEBDt4tNNp2ELG5WYar826qs
        Qt++cqzDAifxSIMse3/2Wa9cTjqNg66jVfycd00tH0C7LRKG0nLvWUL4QLYi5vU4
        IKIx2YktymJEXnAyBQG15PhxMtDn7sbeUNSCZouKTsBXXHfuE9gN+EK33OzgkLQ/
        B0uQ0w6xdoHFL0Qd3YnpmhQB02OUoHWHkXFu4PI/cvMnerg/5b2gt6oIASvSfvc7
        aI42/Z7nhz+daiGUZwNMCTIkJ1nr2m3JbPw==
X-ME-Sender: <xms:IskzZYVPyfaPIU8837JrZwXBvXFzCC5nGMYQk06iVPfgHAtj9D_32g>
    <xme:IskzZcl1ut1un5kQb870XrqbHbVeMZH-7RUysnQokDhEkCZdyAbeLwtpFVkq6uLEo
    tmtYtsQMLUs73Kz2Q>
X-ME-Received: <xmr:IskzZcYU48hC_uMWA7_WDZwDXFGFixr8s7VDL3EgPgypQgQyfxbUks_pUCiHTLjSuoJ07B46Ah-yTMPkiPIUSQ1GbSAjWcREaMpY>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrkedtgdehfecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefkffggfgfuvfevfhfhjggtgfesthejredttddvjeenucfhrhhomheptehlihgt
    vgcutfihhhhluceorghlihgtvgesrhihhhhlrdhioheqnecuggftrfgrthhtvghrnhepfe
    fguefgtdeghfeuieduffejhfevueehueehkedvteefgfehhedtffdutdfgudejnecuvehl
    uhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghlihgtvgesrh
    ihhhhlrdhioh
X-ME-Proxy: <xmx:IskzZXUoxaxUR5li_ZsMsOm0pJ3sDWP0PSOD7Y2iwkI2cJCtAlYbuw>
    <xmx:IskzZSkca7DRnXGr4bzmUCs-nMxCgJAVqgtxMBe3AIm-dI_50kzzhw>
    <xmx:IskzZcdvml0wtvfsXHvCUDhcH9vGgSnbjNMzO0VAM0zoO5ja9VyKeA>
    <xmx:JMkzZUcC2H0lkedVoOI8AfzdnUq-rdPJAhTLCQKBXkUXn-XgD2DkTQ>
Feedback-ID: i56684263:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 21 Oct 2023 08:50:40 -0400 (EDT)
Message-ID: <7bd5d863-0cee-49ef-8d53-f41f8bc8a904@ryhl.io>
Date:   Sat, 21 Oct 2023 14:50:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64: rust: Enable Rust support for AArch64
Content-Language: en-US-large
To:     Boqun Feng <boqun.feng@gmail.com>, Andrew Lunn <andrew@lunn.ch>
Cc:     Jamie Cunliffe <Jamie.Cunliffe@arm.com>,
        linux-arm-kernel@lists.infradead.org,
        rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, steve.capper@arm.com,
        Asahi Lina <lina@asahilina.net>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org
References: <20231020155056.3495121-1-Jamie.Cunliffe@arm.com>
 <20231020155056.3495121-3-Jamie.Cunliffe@arm.com>
 <3cc3b66d-7190-477c-af04-a5d06a0d50fe@lunn.ch>
 <ZTLH5o0GlFBYsAHq@boqun-archlinux>
From:   Alice Ryhl <alice@ryhl.io>
In-Reply-To: <ZTLH5o0GlFBYsAHq@boqun-archlinux>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On 10/20/23 20:33, Boqun Feng wrote:
> On Fri, Oct 20, 2023 at 07:21:08PM +0200, Andrew Lunn wrote:
>>> +``arm64``     Maintained        Little Endian only.
>>
>> This question is just out of curiosity, not the patchset itself.
>>
>> What is missing to make big endian work?
>>
> 
> FWIW, I tried the following:
> 
> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
> index 8784284988e5..b697c2d7da68 100644
> --- a/arch/arm64/Kconfig
> +++ b/arch/arm64/Kconfig
> @@ -227,7 +227,7 @@ config ARM64
>          select HAVE_FUNCTION_ARG_ACCESS_API
>          select MMU_GATHER_RCU_TABLE_FREE
>          select HAVE_RSEQ
> -       select HAVE_RUST if CPU_LITTLE_ENDIAN
> +       select HAVE_RUST
>          select HAVE_STACKPROTECTOR
>          select HAVE_SYSCALL_TRACEPOINTS
>          select HAVE_KPROBES
> diff --git a/arch/arm64/Makefile b/arch/arm64/Makefile
> index 4562a8173e90..4621f1e00e06 100644
> --- a/arch/arm64/Makefile
> +++ b/arch/arm64/Makefile
> @@ -41,7 +41,11 @@ KBUILD_CFLAGS        += -mgeneral-regs-only  \
>   KBUILD_CFLAGS  += $(call cc-disable-warning, psabi)
>   KBUILD_AFLAGS  += $(compat_vdso)
> 
> +ifeq ($(CONFIG_CPU_BIG_ENDIAN), y)
> +KBUILD_RUSTFLAGS += --target aarch64_be-unknown-linux-gnu -C target-feature="-neon"
> +else
>   KBUILD_RUSTFLAGS += --target aarch64-unknown-none -C target-feature="-neon"
> +endif
> 
>   KBUILD_CFLAGS  += $(call cc-option,-mabi=lp64)
>   KBUILD_AFLAGS  += $(call cc-option,-mabi=lp64)
> 
> and ran the following kunit command (it will run a few tests in a qemu
> emulated VM):
> 
> 	./tools/testing/kunit/kunit.py run --make_options LLVM=1 --arch arm64 --kconfig_add CONFIG_RUST=y --kconfig_add CONFIG_CPU_BIG_ENDIAN=y
> 
> The kernel was built successfully, and all Rust related tests passed.
> 
> Of course this doesn't mean a lot, we still need people with deep
> Rust compiler knowledge to confirm whether the support is completed or
> not. But I think if people want to do experiments, the tool is there.

For what it's worth, I have some experience with big endian Rust in 
userspace, and it generally works without issues. I would expect that it 
doesn't need any special support beyond setting the target architecture 
properly.

Alice
