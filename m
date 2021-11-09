Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F092C433F5
	for <linux-clk@archiver.kernel.org>; Tue,  9 Nov 2021 22:45:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 21BDA60F4B
	for <linux-clk@archiver.kernel.org>; Tue,  9 Nov 2021 22:45:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346098AbhKIWrq (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 9 Nov 2021 17:47:46 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55726 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346459AbhKIWpq (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 9 Nov 2021 17:45:46 -0500
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com [IPv6:2607:f8b0:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02798C014B1A
        for <linux-clk@vger.kernel.org>; Tue,  9 Nov 2021 14:20:30 -0800 (PST)
Received: by mail-oi1-x233.google.com with SMTP id r26so1430339oiw.5
        for <linux-clk@vger.kernel.org>; Tue, 09 Nov 2021 14:20:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+tM5hwtc8qbA0vJnA/spVuUcAKq7RJsV9X1LvQfoH/k=;
        b=h7vZVQnWosqI2nzh5w/sb5vYzdU1TiyAsKdqbBralIgonWiGEc5UbZidtSleiF0hxK
         zJ+qaZ0+PaAS4lh02MOHHE9xLEDhPIp5BQxA3fx93Lm2208vnCLIj7G657nJ444On2Qo
         j/9VVwemLZGIoyT7NPEAnF7viu+czcGHQtnzxoot7eP1RbAxY/7BMsqntlSfVSTZMeAX
         9X2EOwbTvPS7xZohylFH8EdHRVWLpfu2A38P710onxxQx1QbkeMLPjBEDjcEE5pe978H
         n61UNe1JttQKTk339jLavJ+Y/l+LE/Gqos+i2AV6i3KH/A71sNxsfwvIShZJtWx3kHEJ
         qG1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+tM5hwtc8qbA0vJnA/spVuUcAKq7RJsV9X1LvQfoH/k=;
        b=YZ8MNxPOiney8iS67ML+IJ+H3Mk+HInhi2aJ5wzZPPjJsgo5HfBzsijnnpLsDjYc34
         vXOPj8U6B2/8aZq+Z6nELz/NbtK+QxUePfx5hzRZ/2tdw7ye8JI7cw7vf7pUoHZpc0sq
         FJ2BaHbBavXsz+6yYcWXHxyoSj05+ozi3c5L2SzMg4OVGLdVu11fhkMVrXKbUr6CnYmG
         8CE+NREBfF+SSASDxOdzv4LSBRhlb+ZRXkkioPkyjW3oacTJq6bJEAE9hGIl+wJJ9XKg
         NrFNV/MNU5dkCT26f8G0mxFQlp+i5IkpyiRd4LibxOuSsHPDYEK9nHfGJNWd351bgUC9
         h63Q==
X-Gm-Message-State: AOAM530R6OtlF7sgOfHmDScgDGH4oQ+tAEb/7CzhJ1QDQsYc+eWLU+CP
        nF8b1VeP4lyEyx3uO4K28W7nkqd9xKAWbpCDpcIYZw==
X-Google-Smtp-Source: ABdhPJwS1A/efTpFOEzGt1pP7H+1n7DSmf2TzXrZeZBd93vSJksHoW0cKUO1zqPxehATkVkot2uor9tquBnaVfR43WM=
X-Received: by 2002:a54:4791:: with SMTP id o17mr9294816oic.114.1636496429410;
 Tue, 09 Nov 2021 14:20:29 -0800 (PST)
MIME-Version: 1.0
References: <20211109164650.2233507-1-robh@kernel.org> <20211109164650.2233507-2-robh@kernel.org>
In-Reply-To: <20211109164650.2233507-2-robh@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 9 Nov 2021 23:20:17 +0100
Message-ID: <CACRpkdZOuhA8w4CYetBKfaZ_wKT4QgKe=bffdYDTB68ihVE3-A@mail.gmail.com>
Subject: Re: [PATCH 1/2] of: Support using 'mask' in making device bus id
To:     Rob Herring <robh@kernel.org>
Cc:     Stephen Boyd <sboyd@kernel.org>,
        Sudeep Holla <Sudeep.Holla@arm.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        Guenter Roeck <linux@roeck-us.net>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>,
        linux-clk@vger.kernel.org, linux-kernel@vger.kernel.org,
        stable@vger.kernel.org, Frank Rowand <frowand.list@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Tue, Nov 9, 2021 at 5:46 PM Rob Herring <robh@kernel.org> wrote:

> Commit 25b892b583cc ("ARM: dts: arm: Update register-bit-led nodes
> 'reg' and node names") added a 'reg' property to nodes. This change has
> the side effect of changing how the kernel generates the device name.
> The assumption was a translatable 'reg' address is unique. However, in
> the case of the register-bit-led binding (and a few others) that is not
> the case. The 'mask' property must also be used in this case to make a
> unique device name.
>
> Fixes: 25b892b583cc ("ARM: dts: arm: Update register-bit-led nodes 'reg' and node names")
> Reported-by: Guenter Roeck <linux@roeck-us.net>
> Cc: stable@vger.kernel.org
> Cc: Frank Rowand <frowand.list@gmail.com>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Signed-off-by: Rob Herring <robh@kernel.org>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
