Return-Path: <linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C4D4C433EF
	for <linux-clk@archiver.kernel.org>; Wed, 19 Jan 2022 15:12:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355625AbiASPMj (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Wed, 19 Jan 2022 10:12:39 -0500
Received: from smtp-relay-internal-1.canonical.com ([185.125.188.123]:46988
        "EHLO smtp-relay-internal-1.canonical.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1355606AbiASPMM (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Wed, 19 Jan 2022 10:12:12 -0500
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id D1FA73F1C9
        for <linux-clk@vger.kernel.org>; Wed, 19 Jan 2022 15:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1642605130;
        bh=drjzBd6xSh2W3A1sdcF3qLyFND0naAGILhzsS9dD8A4=;
        h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
         Content-Type:In-Reply-To;
        b=JYxh+/Ac/xxBk22toYHI9MJh1nNFLROntL1c4mdFXSOWkvqVUZTwE6nyCDyqwe4OG
         Z5DavGL4rGpx++02pbEqv1WeerSTGPiIt2/GXLKjBhu55ODuHI/XFS/0ya8cAEUJRI
         7ppZde/JgNkkuK4WW22qRrPZHI1jrnf6BMyug20dVQNhS4cI4aw+a3GHCLk5QA7LsL
         nWLemA5cjVyN6rPdTBgtVvkta5L2q+Rwqif6n3pooG0x/n+56FgPswf7tPVxZHI8Kf
         yud1TNq7HfM1/W4fuRDLyG+w00h/OO/gGtJFncvijvNbkObfaIF+izQCDStO/bQkec
         /jMRe3Ai2I8Bg==
Received: by mail-ed1-f72.google.com with SMTP id l14-20020aa7cace000000b003f7f8e1cbbdso2760047edt.20
        for <linux-clk@vger.kernel.org>; Wed, 19 Jan 2022 07:12:10 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=drjzBd6xSh2W3A1sdcF3qLyFND0naAGILhzsS9dD8A4=;
        b=veOkNgSmFlkZdl8KTNRK0Up1s/ltY9QWgaAqF7s0hI/TSE83KeWWJqrbKiiQCE1SF4
         o7hxXyu6hgCXwJ/lTpDgIq81Wz2aH5EsnaYgz3XgZi67BAsj9O2UpgUgqF6PNmQv74Y6
         g7U+A41+cNfz75+FA7968ZI0w2xkym34gPhppa26T6SRls7nNaFK1hyLe36hG46JIKcS
         oY8q/ultwhPX+D5ISeQfkK/D+JluvYLIXmiSMtqwljVRqabP1WJKn0GbM2YEYJqKtwPl
         hUeqhwRvAw3LZD+we8qoKsR4t7Z87yBA5fsxiRK+9OTiWEKIBiTMkl5naRn/sfgbQ42U
         y02A==
X-Gm-Message-State: AOAM533hbyNeF13RNu4qw4Oh5T04R/3xbIjhYAGYZk9MvUeYPV1gSQLZ
        LFYNleNG79IXUUtxu8KXFFbused+BHiFl8ICWp4yRJtIyh/SwXnMbTp70UaB3+zOzIlLBp3NDHG
        Gjys9JmjZ+MMjDQV7rE0cO37h0u0W/qmw4DPYYQ==
X-Received: by 2002:a17:907:90d5:: with SMTP id gk21mr24657800ejb.359.1642605118505;
        Wed, 19 Jan 2022 07:11:58 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxddTNyN9TBuuv8pGuZnGAB9t/ygdDr/3nax3MlitJXfQZJieVWGTj2hsRfDZn1PRaG5CZVnw==
X-Received: by 2002:a17:907:90d5:: with SMTP id gk21mr24657762ejb.359.1642605118251;
        Wed, 19 Jan 2022 07:11:58 -0800 (PST)
Received: from krzk-bin (xdsl-188-155-168-84.adslplus.ch. [188.155.168.84])
        by smtp.googlemail.com with ESMTPSA id i23sm1339989edt.93.2022.01.19.07.11.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Jan 2022 07:11:57 -0800 (PST)
Date:   Wed, 19 Jan 2022 16:11:56 +0100
From:   'Krzysztof Kozlowski' <krzysztof.kozlowski@canonical.com>
To:     Alim Akhtar <alim.akhtar@samsung.com>
Cc:     linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        soc@kernel.org, linux-clk@vger.kernel.org,
        devicetree@vger.kernel.org, olof@lixom.net, arnd@arndb.de,
        linus.walleij@linaro.org, catalin.marinas@arm.com,
        robh+dt@kernel.org, s.nawrocki@samsung.com,
        linux-samsung-soc@vger.kernel.org, pankaj.dubey@samsung.com,
        linux-fsd@tesla.com, 'Arjun K V' <arjun.kv@samsung.com>,
        'Aswani Reddy' <aswani.reddy@samsung.com>,
        'Ajay Kumar' <ajaykumar.rs@samsung.com>,
        'Sriranjani P' <sriranjani.p@samsung.com>,
        'Chandrasekar R' <rcsekar@samsung.com>,
        'Shashank Prashar' <s.prashar@samsung.com>
Subject: Re: [PATCH v2 14/16] arm64: dts: fsd: Add initial device tree support
Message-ID: <20220119151156.y2rzrk2gpoweiofc@krzk-bin>
References: <20220118144851.69537-1-alim.akhtar@samsung.com>
 <CGME20220118150108epcas5p2d9cd4db7cb368c2bfbd7d058eba4107c@epcas5p2.samsung.com>
 <20220118144851.69537-15-alim.akhtar@samsung.com>
 <43e72d34-0e11-9ff6-6924-0cab62b51891@canonical.com>
 <000301d80d46$502ae590$f080b0b0$@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <000301d80d46$502ae590$f080b0b0$@samsung.com>
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Wed, Jan 19, 2022 at 08:37:40PM +0530, Alim Akhtar wrote:
> >Similarly to previous vendor-prefix patch, please let me know if it's expected
> >me to take it. I assume no. :)
> >
> I am expecting this will go via your tree, but I am ok either ways. May be you and arm-soc maintainers (Arnd/Olof) can take the call here.

I can take it, that would be the easiest, I guess.

Best regards,
Krzysztof

