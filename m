Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 214ACC6FD18
	for <linux-clk@archiver.kernel.org>; Tue, 28 Mar 2023 18:50:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229638AbjC1Suf (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 28 Mar 2023 14:50:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51340 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229900AbjC1Sud (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 28 Mar 2023 14:50:33 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3DDC62D48
        for <linux-clk@vger.kernel.org>; Tue, 28 Mar 2023 11:50:30 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id a16so11763901pjs.4
        for <linux-clk@vger.kernel.org>; Tue, 28 Mar 2023 11:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20210112.gappssmtp.com; s=20210112; t=1680029430;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Aclulig/0cfgGpGgV4u2S3tdNeq79Q6EXLxPCDRVnhs=;
        b=HocprYJL3KkdQ38U4oCRR6ZmkWsefj9ZzPHM3NVz7mFT7/1swDRkZmrzI9KLhPaPEu
         WTjvhcEk1bvJsjUgLc+dUpJBaKs8bR8LQTDso6D0HKIlaMFos8Fq72QXfskBawrYNgYJ
         Sf57zvusns/FArDHCdcTszk/2hwAxcUm9cQQqtWSgk+IMK0RPQpcBcO7l5FGzHnHU28K
         V3ni0maTj5rAkQsz62/vhlaIv8L8oX9X0X84kTQUCJJRJ52vjjBUE8T/s5if5lwTDFkj
         5X0CU9aJkWjRHb+x2PCx7DUiZxEbcjOa++lzcClqVCgzDQvJid928qK5ZmFHwQOFBA1z
         itlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680029430;
        h=to:from:cc:content-transfer-encoding:mime-version:date:message-id
         :subject:references:in-reply-to:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Aclulig/0cfgGpGgV4u2S3tdNeq79Q6EXLxPCDRVnhs=;
        b=qjrxj364gCCjfrphUiMtGl8UvYi+5Z0VnX53RgYgbKz66d/KqSkIhOb1002ErdrHp3
         KskVcBX8EbuEXk5l1WPiY4h4pI7h0wx+nuxJjAxm+oUFUgSXyRfCFGABqdF8MSbDvMM5
         pTXXaGDAAH4nTYk181RwWHY0AjODFHNxdpFKW/+YT2svUPdQfzKgFdR6TyL4rrZL0cE+
         4u0QJnZ/XGqL3PGYm6I2G5GQeVn3oNHM5d7ww1qIcRWEyhvo8bacYecPcQMpsOTmBNqN
         Fu75SJErZM3At1ZsULiXIi2RQ94El8F+06WEeCU5BATyeaX4X2NnEHB9tpLt495IJCUd
         cuEg==
X-Gm-Message-State: AO0yUKVBOtBGKH9uR8CSQV5/x420673QTTx6AkTYxqIId0mJ1Hh/11V2
        6lKfr/1V79LSOrh8Tkbv3mNZG3VPeiUN8WiqsFU=
X-Google-Smtp-Source: AK7set8uvctoh/nJkDcpyIUFGHdxrv7NFMLkftZwEZXTua9H6PiYWtD5qB1zOx63VGJ9TOv670v8fg==
X-Received: by 2002:a05:6a20:78a2:b0:d9:2cef:949a with SMTP id d34-20020a056a2078a200b000d92cef949amr12028036pzg.28.1680029430067;
        Tue, 28 Mar 2023 11:50:30 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id d2-20020a639742000000b00502e7115cbdsm17453090pgo.51.2023.03.28.11.50.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Mar 2023 11:50:29 -0700 (PDT)
In-Reply-To: <20230301002657.352637-1-Mr.Bossman075@gmail.com>
References: <20230301002657.352637-1-Mr.Bossman075@gmail.com>
Subject: Re: (subset) [PATCH v3 0/3] Add RISC-V 32 NOMMU support
Message-Id: <168002941844.20337.2129252480039803517.b4-ty@rivosinc.com>
Date:   Tue, 28 Mar 2023 11:50:18 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.13-dev-901c5
Cc:     linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        Jesse Taube <Mr.Bossman075@gmail.com>,
        Yimin Gu <ustcymgu@gmail.com>,
        Damien Le Moal <damien.lemoal@wdc.com>,
        Stephen Boyd <sboyd@kernel.org>,
        Michael Turquette <mturquette@baylibre.com>,
        Waldemar Brodkorb <wbx@openadk.org>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>
From:   Palmer Dabbelt <palmer@rivosinc.com>
To:     linux-riscv@lists.infradead.org,
        Jesse Taube <mr.bossman075@gmail.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org


On Tue, 28 Feb 2023 19:26:54 -0500, Jesse Taube wrote:
> This patch-set aims to add NOMMU support to RV32.
> Many people want to build simple emulators or HDL
> models of RISC-V this patch makes it possible to
> run linux on them.
> 
> Yimin Gu is the original author of this set.
> Submitted here:
> https://lists.buildroot.org/pipermail/buildroot/2022-November/656134.html
> 
> [...]

Applied, thanks!

[2/3] riscv: Kconfig: Allow RV32 to build with no MMU
      https://git.kernel.org/palmer/c/b5e2c507b06c
[3/3] riscv: configs: Add nommu PHONY defconfig for RV32
      https://git.kernel.org/palmer/c/77c0c966719f

Best regards,
-- 
Palmer Dabbelt <palmer@rivosinc.com>

