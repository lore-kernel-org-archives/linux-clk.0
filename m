Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5869CC433FE
	for <linux-clk@archiver.kernel.org>; Thu, 20 Oct 2022 07:54:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229675AbiJTHyK (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Thu, 20 Oct 2022 03:54:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36330 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231138AbiJTHyA (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Thu, 20 Oct 2022 03:54:00 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3737113FDF4
        for <linux-clk@vger.kernel.org>; Thu, 20 Oct 2022 00:53:59 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id fy4so45360880ejc.5
        for <linux-clk@vger.kernel.org>; Thu, 20 Oct 2022 00:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=XIy6ZVMvppl/b0MZxwgJbi/e6Y3XMjUjdrp2vf+E0nw=;
        b=uhV0+YrtX7/80cANw90/dQxsRV8PBLKfv4W5FEPi/SR05BGohmBo1B7iIPtC2cvqaB
         3lDOp2RZ+ouBW+86Zymgx+FphPVGIBFIWgwGr2vVSEyC80rlgDyVn60Mfy8BNkV7J+6Z
         JYm1c7pft/bEhMCdR9oFN74JIgCucnzz8W3eku9GInNW41Z7k51MMifxTEyJqMsj6vxs
         BO3zS9AZsGJ3HlTgcmSKsyj4Ok/qc7mvvxDqMewE9Bx/Jlq8f47GE3r+UrLDHbKltF2S
         Be1Rx9equx103r/TY6a/i3IUepXQm1eTaje1JBHOrWHe69PbNjZp5wKdnqSAxw6F5Q0r
         1tnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XIy6ZVMvppl/b0MZxwgJbi/e6Y3XMjUjdrp2vf+E0nw=;
        b=igxFFTcOkTUp6/WcKcsFprnlew7RYrExMs6HTceacTFGAfYAkNckVNpgWtgmrWvnA4
         yupukizK2HU3MJUzMBkvZfRN+sLmxB85ceNjQTN9l/sgq6AmgsrjapCK4PvozvoVYfCf
         +kPnOCOfazVQoxa26JEbc78VzoZfN/+NvdZ+w3MISzsgTljft5v5dznUvJso1TDqCGN4
         sR/OxgEo3PPRgECAhninmPpRy3SWXOR1rsVGnW8rgloSmVxJQ0qDQB+/iXbY6Vws+TWV
         VpKWn4YClcUb0QoPQiL2EZI5Iw+NMYAvc5BSpcY/Uvx7WcIjoS1VkrbUHyx6TwDyF+kD
         RLqA==
X-Gm-Message-State: ACrzQf0VU53Zu3CyVFQfMoFDhNKqq+zlwwQNtLkTqSq5ZdmPHv0EQr4h
        B5imJOgi2NddPj+QhPO39hiK+uou210u131udWY3gg==
X-Google-Smtp-Source: AMsMyM7/ruAcTPWuF5rV5RbQhEQhWNz5EL/tLxUjgT4VSPPoQX6EP+m2UULvHnVE3w+d69SONmEQvMmkuF++WGzeKAU=
X-Received: by 2002:a17:907:1624:b0:78d:d61c:2b4a with SMTP id
 hb36-20020a170907162400b0078dd61c2b4amr9754771ejc.208.1666252437594; Thu, 20
 Oct 2022 00:53:57 -0700 (PDT)
MIME-Version: 1.0
References: <20221019152947.3857217-1-arnd@kernel.org> <20221019152947.3857217-5-arnd@kernel.org>
In-Reply-To: <20221019152947.3857217-5-arnd@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 20 Oct 2022 09:53:45 +0200
Message-ID: <CACRpkdYxuPFV-uQCRUJX03VKSdDZvFH8aKunM+bak0eVbmEV-A@mail.gmail.com>
Subject: Re: [PATCH 04/14] clk: remove davinci dm3xx drivers
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     Sekhar Nori <nsekhar@ti.com>, Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-arm-kernel@lists.infradead.org,
        David Lechner <david@lechnology.com>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org,
        Kevin Hilman <khilman@baylibre.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Lukas Bulwahn <lukas.bulwahn@gmail.com>,
        linux-clk@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Oct 19, 2022 at 5:33 PM Arnd Bergmann <arnd@kernel.org> wrote:

> From: Arnd Bergmann <arnd@arndb.de>
>
> The davinci dm3xx machines are all removed, so the clk driver
> is no longer needed. The da8xx platforms are now using DT
> exclusively, so those drivers remain untouched.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Acked-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
