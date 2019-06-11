Return-Path: <SRS0=yexa=UK=vger.kernel.org=linux-clk-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 22AA5C4321A
	for <linux-clk@archiver.kernel.org>; Tue, 11 Jun 2019 12:32:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EE2332089E
	for <linux-clk@archiver.kernel.org>; Tue, 11 Jun 2019 12:32:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="gvKPd7tm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388722AbfFKMcU (ORCPT <rfc822;linux-clk@archiver.kernel.org>);
        Tue, 11 Jun 2019 08:32:20 -0400
Received: from mail-wr1-f68.google.com ([209.85.221.68]:34632 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388433AbfFKMcT (ORCPT
        <rfc822;linux-clk@vger.kernel.org>); Tue, 11 Jun 2019 08:32:19 -0400
Received: by mail-wr1-f68.google.com with SMTP id e16so12862159wrn.1
        for <linux-clk@vger.kernel.org>; Tue, 11 Jun 2019 05:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=message-id:subject:from:to:date:in-reply-to:references:user-agent
         :mime-version:content-transfer-encoding;
        bh=3yIHUZDu0AY3HhtkDpgrI22GPR5WLTd7gWKM7Uzr4Ug=;
        b=gvKPd7tmPRGXoFs/ajGVvNj8YTgXy77rGXtDUalDkJl6wSn1MScUeWXLZH7CG1aN+h
         mSK3RJUofxxJdHUP+Wrn78BZJXxzqhux8eHUTsb7+zx1X0JPktpjbgDXo3UZFThpd6zg
         HKFf7XaNnojUVlMNVu/MGdKipmFUqdSMqoqL5pa+4VQEzN9zUU16X96+p7yqNWZLj90N
         XZLPIRI+Rd2lVhHjWpqVYGgvz6QrBzu+i7XL4/W7cDVaneDtMFrRUogmLHxVtkmEx1du
         FyLweWfV9i52fU3iFDIl/0kdHMVqo2xPkrbyP2ipt9FqjJB3c758Pxn8trzkppTiQFDW
         tw3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:subject:from:to:date:in-reply-to
         :references:user-agent:mime-version:content-transfer-encoding;
        bh=3yIHUZDu0AY3HhtkDpgrI22GPR5WLTd7gWKM7Uzr4Ug=;
        b=pJ8E2Cf7c7+mRQShUcFnTuqqVjARY+t+CV1SFme6LFOJqmc8oizy15lCrr5MGah/kK
         u0mWmEwg8fvrdxvbECArJ5/VGyS6s63BnJ2k5dxTjKehtdBPP6t9ir0sT+O0vhcFAtnH
         lVbePzxnJBi/L2vnK1k+KVLOhSH4KuvEkbA1YbdT67Z2NmVttdfkp8iAZuWCAjZCcMKB
         avdQntwVPba+hwJnZyqDjyNLfPq3ePtZtwGDdK6ioIK6GT/NmOarBAmiBj9ie5kJI2yY
         1F1IwepIUWeqhTxLNBcP4DaZ+xC1INKiMAk9jHFMtrRgh0NxnEu6LqoXDFziVBkUC7iW
         AmJw==
X-Gm-Message-State: APjAAAUZHyN5W9l81OWmMurICWkGEdVck0PLOa9m5NG1i81054DTKRaf
        M6IwjbAkpJjCW/qzHr612CYBaw==
X-Google-Smtp-Source: APXvYqzappoDNTggYkuaxQS1YeYjg3ShO+Vgo5CxgEMCr3D2ELz9OdCft3PQSOxBqySsiqmbTruqSQ==
X-Received: by 2002:a5d:69ce:: with SMTP id s14mr1882971wrw.135.1560256338775;
        Tue, 11 Jun 2019 05:32:18 -0700 (PDT)
Received: from boomer.baylibre.com (lmontsouris-657-1-212-31.w90-63.abo.wanadoo.fr. [90.63.244.31])
        by smtp.gmail.com with ESMTPSA id 32sm32865503wra.35.2019.06.11.05.32.17
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 11 Jun 2019 05:32:18 -0700 (PDT)
Message-ID: <c216003f9622d022d55ed9eb13458a10189797f2.camel@baylibre.com>
Subject: Re: [PATCH v3 0/2] Add support of Temperature sensor Clock for G12
 SoC
From:   Jerome Brunet <jbrunet@baylibre.com>
To:     Guillaume La Roque <glaroque@baylibre.com>,
        narmstrong@baylibre.com, khilman@baylibre.com,
        linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org
Date:   Tue, 11 Jun 2019 14:32:17 +0200
In-Reply-To: <20190412100221.26740-1-glaroque@baylibre.com>
References: <20190412100221.26740-1-glaroque@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-clk-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-clk.vger.kernel.org>
X-Mailing-List: linux-clk@vger.kernel.org

On Fri, 2019-04-12 at 12:02 +0200, Guillaume La Roque wrote:
> This patch series add support of Clock for temperature sensor
> on Amlogic G12a SoC.
> 
> Guillaume
> 
> cahnges sinve v2:
> - rebase on good branch
> 
> changes since v1:
> - fix .width value
> 
> Guillaume La Roque (2):
>   dt-bindings: clk: g12a-clkc: add Temperature Sensor clock ID
>   clk: meson-g12a: Add Temperature Sensor clock
> 
>  drivers/clk/meson/g12a.c              | 31 +++++++++++++++++++++++++++
>  drivers/clk/meson/g12a.h              |  3 ++-
>  include/dt-bindings/clock/g12a-clkc.h |  1 +
>  3 files changed, 34 insertions(+), 1 deletion(-)
> 

Fixed the commit messages as suggested by Martin and applied
Thx

