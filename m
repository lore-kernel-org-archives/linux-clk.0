Return-Path: <linux-clk-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4455EB64D8
	for <linux-clk@archiver.kernel.org>; Wed, 14 Jun 2023 20:09:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235535AbjFNUJu (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 14 Jun 2023 16:09:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229918AbjFNUJt (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 14 Jun 2023 16:09:49 -0400
Received: from mail-ej1-x62e.google.com (mail-ej1-x62e.google.com [IPv6:2a00:1450:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 37130DC;
        Wed, 14 Jun 2023 13:09:48 -0700 (PDT)
Received: by mail-ej1-x62e.google.com with SMTP id a640c23a62f3a-98276e2a4bbso134114066b.0;
        Wed, 14 Jun 2023 13:09:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20221208; t=1686773386; x=1689365386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8FALpc4CIrB//ZcpcSjwXZfBNeerIA6IcWIarPTZ5JE=;
        b=rVmybFrpc9dOcqAVPlAskhPEpZF8f0OhSteMWTJ3DxCq8hL5HqRj2gwtxp10MczoZ8
         39W4Srq3Ek90PwISemnaguLFfXyMgHFbi04p1wze1CzP26GtHyvK/5BAOet2wgGnpvqh
         t0iVfwb8lCrhbALLC6lofqzFQacACtZa1i4grt24D75LfDgNXryhda2884PCbQ/nqtr4
         iZjrikUtJkDRp+tenSVWSiDpaXLZP0zQ6I288PdT0VQC/YBOTcZ7pmEPvm3PdPHW/jvI
         e1maBTL0WZrcTjTy5CfboO+35TG4nEHXyh0KOHj8yFhnGJ4DhPDYQlJmc78pBNsCei12
         A15Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686773386; x=1689365386;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8FALpc4CIrB//ZcpcSjwXZfBNeerIA6IcWIarPTZ5JE=;
        b=R3VPOlLlElFfcWQ5Y+jfCcJzSoVuT4OAtNSKm4iquNhY5LFxIYSpq5OOqXeTJ4hrWH
         0vtiTP8E40TEbcUdWdHVRdX3TZOs/S/m5vM/q3dvQesYnqf5zyetnfLgg4LX0XkPdXk7
         l9GrPvnGnov9BtF/i1S8xdTGQdRYhD3ywEXmAofArf3sr8wzuAsS7nGYl32g+3XvkrcX
         kTM4UYFIRH3WHk+wDb/h3AF+10cmEM3w5Mw5pdmmUkOLBFrKnReGuA/laWJSPDbbio54
         /PNgZXx1r7XEJrEh7BIzohJgmYvxB8RersSNjWIaHaSW1WAfm5lzh1a1FgZNy3nN3mDS
         9ybQ==
X-Gm-Message-State: AC+VfDz8C40iPB9D/tBBeeLwcVielJ+YVgiDOi8O/MIkTs1Riaa2O37I
        CdI0cjWcajkhNNzBDk1QDFBPxTPeJ9sxxsGWvPU=
X-Google-Smtp-Source: ACHHUZ4/qC4MhwCSyqp8SJs6gvPJtQ1xsJxysBpYsuE007Ebn2AOYkTRl+n4q9AftOeW30jhKU27oIHrVSNnZIjl4Lc=
X-Received: by 2002:a17:906:dacd:b0:97a:97d3:1a3a with SMTP id
 xi13-20020a170906dacd00b0097a97d31a3amr15378599ejb.25.1686773386428; Wed, 14
 Jun 2023 13:09:46 -0700 (PDT)
MIME-Version: 1.0
References: <20230614084808.98819-1-jiapeng.chong@linux.alibaba.com>
In-Reply-To: <20230614084808.98819-1-jiapeng.chong@linux.alibaba.com>
From:   Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Date:   Wed, 14 Jun 2023 22:09:35 +0200
Message-ID: <CAFBinCBZFxx55HQM4a99vVwvXFaQThn8_F5B4uNS5x1AYzOupw@mail.gmail.com>
Subject: Re: [PATCH] clk: meson: pll: remove unneeded semicolon
To:     Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Cc:     neil.armstrong@linaro.org, jbrunet@baylibre.com,
        mturquette@baylibre.com, sboyd@kernel.org, khilman@baylibre.com,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        Abaci Robot <abaci@linux.alibaba.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Jun 14, 2023 at 10:48=E2=80=AFAM Jiapeng Chong
<jiapeng.chong@linux.alibaba.com> wrote:
>
> No functional modification involved.
>
> ./drivers/clk/meson/clk-pll.c:373:2-3: Unneeded semicolon.
>
> Reported-by: Abaci Robot <abaci@linux.alibaba.com>
> Closes: https://bugzilla.openanolis.cn/show_bug.cgi?id=3D5533
> Signed-off-by: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
Reviewed-by: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
