Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5FC31C433EF
	for <linux-clk@archiver.kernel.org>; Fri,  8 Oct 2021 01:29:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3A1786128C
	for <linux-clk@archiver.kernel.org>; Fri,  8 Oct 2021 01:29:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230457AbhJHBbM (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 7 Oct 2021 21:31:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229487AbhJHBbM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 7 Oct 2021 21:31:12 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 10558C061714
        for <linux-clk@vger.kernel.org>; Thu,  7 Oct 2021 18:29:18 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id k26so6830977pfi.5
        for <linux-clk@vger.kernel.org>; Thu, 07 Oct 2021 18:29:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=date:subject:in-reply-to:cc:from:to:message-id:mime-version
         :content-transfer-encoding;
        bh=WtHRg9pE0seuBB0ZG+GOfqW0Lt5umZXuKqLtBMykH80=;
        b=Py38WVG6evZxTgbhtQhoj3yPWvrjQoA0BU1h9uNK/hr9cl8RFxQWrKLw34xpnThEG0
         klI6GH7xt/dyjOl6vKJ/+uqNoFRQR5VTBhfce7zL1CDLMYkkRxn7vKyJ5G2OarXIonGN
         SrMTwr87YxIkSK4U4VGIDb71ve5wWtv+axm0rWWkoKWR9BHWRH7s+t5TSM1igiXofeZf
         8ECbHfYgLFSW2Hfkj+oN3qycwBORzeS0lX1ZCp62xxNkBqA81K/nfF9c6WEdlRwp9iJh
         gsrCmt3+SVk4BlntQ1rjigO5ZiyDUCTj1MwehB5lPZvAzDzuWHJyTY3iuVQwmKVRpSff
         UGGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:subject:in-reply-to:cc:from:to:message-id
         :mime-version:content-transfer-encoding;
        bh=WtHRg9pE0seuBB0ZG+GOfqW0Lt5umZXuKqLtBMykH80=;
        b=D84sR3Y9xbeWgW9ZLim9WV+XHuumApVhMNgpZ+458y/CPhlZrc2jfkrpUQt1J/S9Q+
         fWmBDP1hRStNpX8rPCfkVaWkWzoryzLKsl+nZJFkR1wGUJKVv6/G/+UcZ5VsoGZugu2P
         Hx62A4wAucdFMGzZKZyVm/MQjtQCLtiG0dKcO0Vt1nTAWw2AZgdN2Y41wou+LJ+f9Chn
         o3oeVC5oJ0byA0IYVp+J/nBWkt8o4ufFOZk3JQeaQZBVHO27/ikSifwcSuhaQkWZpIqX
         mBcMSy5jUMaDYvtL9NL2d/WvppvlBWVyFzLcw0fsshtFXJiU/BgzzrpSd/BGFuucvNAy
         k7SA==
X-Gm-Message-State: AOAM532hfDqgJLGs4K7XOtOKGwQQJx9g6ARDPaeX23NXxIaIfOKtjniF
        40JCM80rPG56cj7zW1e718BRJg==
X-Google-Smtp-Source: ABdhPJxKIyBEk/ExdyYLGRv9pO7zazoYAulMHHBsViB3AH1uRol820KvNN1onfoc9AFMNMN5/tyBjA==
X-Received: by 2002:a63:e64a:: with SMTP id p10mr2349033pgj.263.1633656557550;
        Thu, 07 Oct 2021 18:29:17 -0700 (PDT)
Received: from localhost (76-210-143-223.lightspeed.sntcca.sbcglobal.net. [76.210.143.223])
        by smtp.gmail.com with ESMTPSA id g10sm582784pfv.109.2021.10.07.18.29.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Oct 2021 18:29:17 -0700 (PDT)
Date:   Thu, 07 Oct 2021 18:29:17 -0700 (PDT)
X-Google-Original-Date: Thu, 07 Oct 2021 18:28:59 PDT (-0700)
Subject:     Re: [PATCH] dt-bindings: clock: fu740-prci: add reset-cells
In-Reply-To: <YUyydGrDNzISu6JX@robh.at.kernel.org>
CC:     krzysztof.kozlowski@canonical.com, zong.li@sifive.com,
        aou@eecs.berkeley.edu, linux-kernel@vger.kernel.org,
        linux-riscv@lists.infradead.org, linux-clk@vger.kernel.org,
        robh+dt@kernel.org, devicetree@vger.kernel.org,
        mturquette@baylibre.com, Paul Walmsley <paul.walmsley@sifive.com>,
        sboyd@kernel.org
From:   Palmer Dabbelt <palmer@dabbelt.com>
To:     krzysztof.kozlowski@canonical.com, robh@kernel.org
Message-ID: <mhng-b9e6d8f9-b9be-4651-9649-3378d227eae1@palmerdabbelt-glaptop>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Thu, 23 Sep 2021 09:59:32 PDT (-0700), robh@kernel.org wrote:
> On Mon, 20 Sep 2021 16:49:44 +0200, Krzysztof Kozlowski wrote:
>> The SiFive FU740 Power Reset Clock Interrupt Controller is a reset line
>> provider so add respective reset-cells property to fix:
>>
>>   arch/riscv/boot/dts/sifive/hifive-unmatched-a00.dt.yaml: clock-controller@10000000:
>>     '#reset-cells' does not match any of the regexes: 'pinctrl-[0-9]+'
>>
>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>
>> ---
>>  .../devicetree/bindings/clock/sifive/fu740-prci.yaml          | 4 ++++
>>  1 file changed, 4 insertions(+)
>>
>
> Reviewed-by: Rob Herring <robh@kernel.org>

Acked-by: Palmer Dabbelt <palmerdabbelt@google.com>

For some reason I thought these went through your tree, LMK if you were 
planning on having me take it through mine.

Thanks!
